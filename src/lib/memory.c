/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Memory functions                                      */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#define __USE_MINT_SIGNAL
#include "acs_i.h"
#include <setjmp.h>
#include "messages/msgserv.h"
#include "memory.h"

typedef struct
{
	MemFreeBlockStat stat;
	A_ListNextStruct *liste;
} MemFreeBlockList;

#define MAX_ENTRIES 32

typedef struct memx {
	struct memx *prev;
	long used;
	void *entry[MAX_ENTRIES];
} MEMX;


#if !WITH_FIXES
ssize_t _acs_memdebug_in_use = 0;
#endif
static int MemInit = 0;

static MEMX start = { NULL, 0, { NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL } };
static MEMX *act = &start;
static MemFreeBlockList _freeBlockList[] = {
	{ { sizeof(Awindow),              "Awindow",             20, 0, 0, 0 }, NULL },
	{ { sizeof(AUSERBLK),             "AUSERBLK",           500, 0, 0, 0 }, NULL },
	{ { sizeof(CICONBLK),             "CICONBLK",             5, 0, 0, 0 }, NULL },
	{ { sizeof(ICONBLK),              "ICONBLK",              5, 0, 0, 0 }, NULL },
	{ { sizeof(CICON),                "CICON",               10, 0, 0, 0 }, NULL },
	{ { sizeof(BITBLK),               "BITBLK",              10, 0, 0, 0 }, NULL },
	{ { sizeof(TEDINFO),              "TEDINFO",             30, 0, 0, 0 }, NULL },
	{ { sizeof(MFDB),                 "MFDB",                15, 0, 0, 0 }, NULL },
	{ { sizeof(A_FontSel),            "FontSelect",           2, 0, 0, 0 }, NULL },
	{ { sizeof(A_PrintSelData),       "PrintSelect",          2, 0, 0, 0 }, NULL },
	{ { sizeof(MsgWaitForAnswer),     "MsgService",           5, 0, 0, 0 }, NULL },
	{ { sizeof(A_dd),                 "A_dd",                 2, 0, 0, 0 }, NULL },
	{ { sizeof(A_dd_int),             "Interne DD-Daten",    10, 0, 0, 0 }, NULL },
	{ { sizeof(gs_con),               "GS-Connection",        2, 0, 0, 0 }, NULL },
	{ { sizeof(gs_search),            "GS-Suche",             2, 0, 0, 0 }, NULL },
	{ { sizeof(gs_answer),            "GS-Antwort",           2, 0, 0, 0 }, NULL },
	{ { sizeof(OLGA_Data),            "OLGA",                 4, 0, 0, 0 }, NULL },
	{ { sizeof(ThermoStruct),         "Thermometer",          2, 0, 0, 0 }, NULL },
	{ { sizeof(A_FileSelData),        "FileSelect",           2, 0, 0, 0 }, NULL },
	{ { sizeof(MEMX),                 "Int. Speicherverw.",   5, 0, 0, 0 }, NULL },
	{ { sizeof(XAccData),             "XAcc-Daten",           2, 0, 0, 0 }, NULL },
	{ { sizeof(ACSConfig),            "UConfig",              5, 0, 0, 0 }, NULL },
	{ { sizeof(UCfgInfo),             "UCfgInfo",             5, 0, 0, 0 }, NULL },
	{ { sizeof(ACSCfgGruppe),         "Cfg-Gruppe",           5, 0, 0, 0 }, NULL },
	{ { sizeof(ULinList),             "ULinListe",           20, 0, 0, 0 }, NULL },
	{ { sizeof(ACSLinListElemStruct), "ULinListe-Element",   40, 0, 0, 0 }, NULL },
#if 0
	{ { sizeof(Stack),                "Stack",               10, 0, 0, 0 }, NULL },
	{ { sizeof(Queue),                "Queue",               10, 0, 0, 0 }, NULL },
	{ { sizeof(StackElem),            "Listen-Elemente",     80, 0, 0, 0 }, NULL },
	{ { sizeof(QueueElem),            "Queue-Elemente",      40, 0, 0, 0 }, NULL },
#endif
};
static MemFreeBlockList *freeBlockList = _freeBlockList;
static int16 freeBlockListAnz = (int)(sizeof(_freeBlockList) / sizeof(_freeBlockList[0]));
static MemFreeBlockStat *freeBlockStat = NULL;

static void *watch_min;
static void *watch_max;
static jmp_buf check;

static int sortFreeMemList(const void *m1, const void *m2);
static void *_malloc(ssize_t size);
static void *RecycleFreeBlocks(ssize_t size);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 INmemory(void)
{
	int16 i;
	
	if (MemInit++ != 0)
		return OK;
	for (i = 0; i < freeBlockListAnz; i++)
	{
		freeBlockList[i].stat.aktuell_liste = 0;
		freeBlockList[i].stat.max_used = 0;
		freeBlockList[i].stat.opt_anzahl = 0;
		freeBlockList[i].liste = NULL;
	}
	if (freeBlockListAnz > 0)
		qsort(freeBlockList, freeBlockListAnz, sizeof(*freeBlockList), sortFreeMemList);
	return OK;
}

/* -------------------------------------------------------------------------- */

void TRmemory(void)
{
	int16 i;
	MemFreeBlockList *list;
	A_ListNextStruct *elem;
	
	if (--MemInit != 0)
		return;
	
	for (i = 0; i < freeBlockListAnz; i++)
	{
		for (list = &freeBlockList[i]; list->liste != NULL; )
		{
			elem = list->liste;
			list->liste = list->liste->next;
			Ax_free(elem);
		}
	}
	if (freeBlockList != _freeBlockList)
		Ax_free(freeBlockList);
	if (freeBlockStat != NULL)
		Ax_free(freeBlockStat);
}

/* -------------------------------------------------------------------------- */

void *Ax_malloc(ssize_t size)
{
	void *ptr;
	
	ptr = RecycleFreeBlocks(size);
	if (ptr == NULL)
		ptr = _malloc(size);
	return ptr;
}

/* -------------------------------------------------------------------------- */

static void *_malloc(ssize_t size)
{
	void *ptr;
	
	if (ACSblk->application || ACSblk->multitask)
	{
		ptr = malloc(size);
	} else
	{
		accgemdos();
		ptr = malloc(size);
		oldgemdos();
	}
	if (ptr == NULL)
		return NULL;
	if (!(ACSblk->description->flags & AB_NOMEMCHECK))
	{
		if (ptr < watch_max && ptr >= watch_min)
		{
			ACSblk->ACSerror(AE_RANGE_MEM, NULL);
			ACSblk->DEBUG_MEM(ptr);
		}
	}
	return ptr;
}

/* -------------------------------------------------------------------------- */

void Ax_ifree(void *memory)
{
	void *addr;
	
	addr = memory;
	if (memory == NULL || memory == null_string)
		return;
	if (!(ACSblk->description->flags & AB_NOMEMCHECK))
	{
		if (memory < watch_max && memory >= watch_min)
		{
			ACSblk->ACSerror(AE_RANGE_MEM, NULL);
			ACSblk->DEBUG_MEM(memory);
		}
		if ((ssize_t)memory < 0x1000L)
		{
			ACSblk->ACSerror(AE_RANGE_MEM, NULL);
			ACSblk->DEBUG_MEM(memory);
			return;
		}
		if ((size_t)addr & 1)
		{
			ACSblk->ACSerror(AE_ODD_MEM, NULL);
			ACSblk->DEBUG_MEM(memory);
			return;
		}
	}
	if (ACSblk->application || ACSblk->multitask)
	{
		free(memory);
	} else
	{
		accgemdos();
		free(memory);
		oldgemdos();
	}
}

/* -------------------------------------------------------------------------- */

void Ax_free(void *memory)
{
	MEMX *memx;
	void *addr;
	
	addr = memory;
	if (memory == NULL || memory == null_string)
		return;
	if (!(ACSblk->description->flags & AB_NOMEMCHECK))
	{
		if (memory < watch_max && memory >= watch_min)
		{
			ACSblk->ACSerror(AE_RANGE_MEM, NULL);
			ACSblk->DEBUG_MEM(memory);
		}
		if ((ssize_t)memory < 0x1000L)
		{
			ACSblk->ACSerror(AE_RANGE_MEM, NULL);
			ACSblk->DEBUG_MEM(memory);
			return;
		}
		if ((size_t)addr & 1)
		{
			ACSblk->ACSerror(AE_ODD_MEM, NULL);
			ACSblk->DEBUG_MEM(memory);
			return;
		}
	}
	
	if (act->used >= MAX_ENTRIES)
	{
		memx = Ax_malloc(sizeof(*memx));
		if (memx == NULL)
		{
			Ax_ifree(memory);
			return;
		}
		memx->prev = act;
		memx->used = 0;
		act = memx;
	}
	act->entry[act->used++] = memory;
}

/* -------------------------------------------------------------------------- */

void Ax_release(void)
{
	MEMX *prev;
	
	while (TRUE)
	{
		while (act->used-- > 0)
		{
			Ax_ifree(act->entry[act->used]);
		}
		act->used = 0;
		prev = act->prev;
		if (prev == NULL)
			break;
		Ax_recycle(act, sizeof(*act));
		act = prev;
	}
}

/* -------------------------------------------------------------------------- */

void *Ax_glmalloc(ssize_t size)
{
	int16 mxmask;
	void *ptr;
	
	if (!ACSblk->application && !ACSblk->multitask)
		accgemdos();
	mxmask = Mxmask();
	if (mxmask != 0)
		ptr = (void *)Mxalloc(size, mxmask & (MX_GLOBAL | MX_PREFTTRAM));
	else
		ptr = (void *)Malloc(size);
	if (!ACSblk->application && !ACSblk->multitask)
		oldgemdos();
	return ptr;
}

/* -------------------------------------------------------------------------- */

void Ax_glfree(void *ptr)
{
	if (ACSblk->application || ACSblk->multitask)
	{
		Mfree(ptr);
	} else
	{
		accgemdos();
		Mfree(ptr);
		oldgemdos();
	}
}

/* -------------------------------------------------------------------------- */

static void CDECL handle_sigbus(long sig)
{
	UNUSED(sig);
	Psigreturn();
	longjmp(check, 1);
}

/* -------------------------------------------------------------------------- */

boolean Ax_memCheck(const char *buffer, ssize_t len, boolean write)
{
	boolean ok;
	ssize_t i;
	int32 oldsigbus;
	int32 oldsigsegv;
	volatile char *ptr;
	char c;
	
	ptr = (volatile char *)NO_CONST(buffer);
	oldsigbus = (int32)Psignal(SIGBUS, handle_sigbus);
	if (oldsigbus == EINVFN)
		return TRUE;
	oldsigsegv = (int32)Psignal(SIGSEGV, handle_sigbus);
	if (oldsigsegv == EINVFN)
	{
		Psignal(SIGBUS, (void *)oldsigbus);
		return TRUE;
	}
	ok = TRUE;
	if (setjmp(check) != 0)
	{
		ok = FALSE;
	} else
	{
		switch ((int16)(len & 0xffff))
		{
		case -1:
			c = 'A';
			while (c != '\0')
			{
				c = *ptr;
				if (write)
					*ptr = c;
				ptr++;
			}
			break;
		case -2:
			c = 'A';
			while (c != '\0' || ptr[-1] != '\0')
			{
				c = *ptr;
				if (write)
					*ptr = c;
				ptr++;
			}
			break;
		default:
			for (i = 0; i < len; i++, ptr++)
			{
				c = *ptr;
				if (write)
					*ptr = c;
			}
			break;
		}
	}
	
	Psignal(SIGBUS, (void *)oldsigbus);
	Psignal(SIGSEGV, (void *)oldsigsegv);
	return ok;
}

/* -------------------------------------------------------------------------- */

static int sortFreeMemList(const void *m1, const void *m2)
{
	if (((const MemFreeBlockList *)m1)->stat.block_size != ((const MemFreeBlockList *)m2)->stat.block_size)
		return (int)(((const MemFreeBlockList *)m1)->stat.block_size - ((const MemFreeBlockList *)m2)->stat.block_size);
	else
		return (int)(((const MemFreeBlockList *)m2)->stat.max_liste - ((const MemFreeBlockList *)m1)->stat.max_liste);
}

/* -------------------------------------------------------------------------- */

static int searchFreeMemList(const void *size, const void *m2)
{
	return (int)(*((const ssize_t *)size) - ((const MemFreeBlockList *)m2)->stat.block_size);
}

/* -------------------------------------------------------------------------- */

static void *RecycleFreeBlocks(ssize_t size)
{
	MemFreeBlockList *list;
	
	list = NULL;
	if (freeBlockListAnz > 0)
		list = bsearch(&size, freeBlockList, freeBlockListAnz, sizeof(*freeBlockList), searchFreeMemList);
	if (list != NULL && list->liste != NULL)
	{
		A_ListNextStruct *liste;
		
		liste = list->liste;
		list->liste = liste->next;
		if (list->stat.aktuell_liste > 0)
			--list->stat.aktuell_liste;
		if (list->stat.opt_anzahl > 0)
			--list->stat.opt_anzahl;
		return liste;
	}
	return NULL;
}

/* -------------------------------------------------------------------------- */

void Ax_recycle(void *memory, ssize_t size)
{
	boolean found;
	A_ListNextStruct *liste;
	MemFreeBlockList *list;
	
	found = FALSE;
	liste = (A_ListNextStruct *)memory;
	list = NULL;
	if (memory == NULL || memory == null_string)
		return;
	if (freeBlockListAnz > 0)
		list = bsearch(&size, freeBlockList, freeBlockListAnz, sizeof(*freeBlockList), searchFreeMemList);
	if (list != NULL)
	{
		if (list->stat.aktuell_liste < list->stat.max_liste)
		{
			liste->next = list->liste;
			list->liste = liste;
			found = TRUE;
			++list->stat.aktuell_liste;
			if (list->stat.aktuell_liste > list->stat.max_used)
				list->stat.max_used = list->stat.aktuell_liste;
		}
		++list->stat.opt_anzahl;
	}
	if (!found)
		Ax_free(memory);
}

/* -------------------------------------------------------------------------- */

static boolean createNewList(ssize_t size, int16 amount, const char *description)
{
	MemFreeBlockList *list;
	
	list = NULL; /* FIXME: useless */
	list = _malloc((freeBlockListAnz + 1) * sizeof(*list));
	if (list == NULL)
		return FALSE;
	memcpy(list, freeBlockList, freeBlockListAnz * sizeof(*freeBlockList));
	if (freeBlockList != _freeBlockList)
		Ax_free(freeBlockList);
	freeBlockList = list;
	++freeBlockListAnz;
	list = &freeBlockList[freeBlockListAnz - 1];
	list->stat.block_size = size;
	list->stat.descr_text = description;
	list->liste = NULL;
	list->stat.max_liste = amount;
	list->stat.aktuell_liste = 0;
	list->stat.max_used = 0;
	list->stat.opt_anzahl = 0;
	if (freeBlockListAnz > 0)
		qsort(freeBlockList, freeBlockListAnz, sizeof(*freeBlockList), sortFreeMemList);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void deleteOldList(MemFreeBlockList *list)
{
	MemFreeBlockList *newlist;
	A_ListNextStruct *liste;
	int16 i, j;
	
	newlist = NULL;
	while (list->liste != NULL)
	{
		liste = list->liste;
		list->liste = liste->next;
		Ax_free(liste);
	}
	if (freeBlockListAnz > 1)
		newlist = _malloc((freeBlockListAnz - 1) * sizeof(*newlist));
	if (newlist != NULL)
	{
		for (j = 0, i = 0; i < freeBlockListAnz; i++)
		{
			if (&freeBlockList[i] != list)
				memcpy(&newlist[j++], &freeBlockList[i], sizeof(*newlist));
		}
		if (freeBlockList != _freeBlockList)
			Ax_free(freeBlockList);
		freeBlockList = newlist;
		--freeBlockListAnz;
	}
	if (freeBlockListAnz > 0)
		qsort(freeBlockList, freeBlockListAnz, sizeof(*freeBlockList), sortFreeMemList);
}

/* -------------------------------------------------------------------------- */

boolean Ax_setRecycleSize(ssize_t size, int16 amount, const char *description)
{
	MemFreeBlockList *list;
	int16 i;
	boolean ok;
	
	list = NULL;
	ok = FALSE;
	if (size < (ssize_t)sizeof(A_ListNextStruct) && size != 0)
		return FALSE;
	if (freeBlockStat != NULL)
		Ax_free(freeBlockStat);
	freeBlockStat = NULL;
	if (freeBlockListAnz > 0)
		list = bsearch(&size, freeBlockList, freeBlockListAnz, sizeof(*freeBlockList), searchFreeMemList);
	if (list == NULL)
	{	
		if (amount > 0)
			ok = createNewList(size, amount, description);
	} else
	{
		for (i = amount; list->liste != NULL && i < list->stat.max_liste && i < list->stat.aktuell_liste; i++)
		{
			A_ListNextStruct *liste;
			
			liste = list->liste;
			list->liste = liste->next;
			Ax_free(liste);
		}
		list->stat.max_liste = amount;
		if (list->stat.aktuell_liste > amount)
			list->stat.aktuell_liste = amount;
		if (amount <= 0)
			deleteOldList(list);
		ok = TRUE;
	}
	return ok;
}

/* -------------------------------------------------------------------------- */

MemFreeBlockStat *Ax_getRecycleStat(int16 *anzahl)
{
	MemFreeBlockList *list;
	MemFreeBlockStat *stat;
	int16 i;
	
	list = NULL; /* FIXME: useless assign */
	stat = NULL;
	if (freeBlockStat == NULL)
	{
		freeBlockStat = Ax_malloc(freeBlockListAnz * sizeof(*freeBlockStat));
		if (freeBlockStat == NULL)
			return NULL;
	}
	for (i = 0; i < freeBlockListAnz; i++)
	{
		list = &freeBlockList[i];
		stat = &freeBlockStat[i];
		stat->block_size = list->stat.block_size;
		stat->descr_text = list->stat.descr_text;
		stat->max_liste = list->stat.max_liste;
		stat->aktuell_liste = list->stat.aktuell_liste;
		stat->max_used = list->stat.max_used;
		stat->opt_anzahl = list->stat.opt_anzahl;
	}
	if (anzahl != NULL)
		*anzahl = freeBlockListAnz;
	return freeBlockStat;
}
