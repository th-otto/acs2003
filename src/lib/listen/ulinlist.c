/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      List management                                       */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

static void Alu_clearElem(ULinList *list);
static boolean Alu_appendElem(ULinList *list, void *new_data);
static boolean Alu_insertElem(ULinList *list, void *new_data, boolean before_obj);
static void *Alu_deleteElem(ULinList *list, int16 data_nr);
static int32 Alu_deleteForElem(ULinList *list, void *para, boolean (*to_delete)(void *para, void *elem) );
static void *Alu_searchElem(ULinList *list, int32 nr);
static void *Alu_searchForElem(ULinList *list, void *para, boolean (*found)(void *para, void *elem) );
static void *Alu_firstElem(ULinList *list);
static void *Alu_lastElem(ULinList *list);
static void *Alu_aktElem(ULinList *list);
static int32 Alu_aktNrElem(ULinList *list);
static void *Alu_skipElem(ULinList *list, boolean forwards, int32 amount);
static int32 Alu_countElem(ULinList *list);
static int32 Alu_countForElem(ULinList *list, void *para, boolean (*count)(void *para, void *elem) );
static void Alu_doForElem(ULinList *list, void *para, boolean (*to_work)(void *para, void *elem), void (*work)(void *para, void *elem) );

static ULinList const empty = {
	NULL,
	Ax_free,
	Alu_clearElem,
	Alu_appendElem,
	Alu_insertElem,
	Alu_deleteElem,
	Alu_deleteForElem,
	Alu_searchElem,
	Alu_searchForElem,
	Alu_firstElem,
	Alu_lastElem,
	Alu_aktElem,
	Alu_aktNrElem,
	Alu_skipElem,
	Alu_countElem,
	Alu_countForElem,
	Alu_doForElem
};

typedef struct _ACSLinListStruct {
	ACSLinListElemStruct *first;
	ACSLinListElemStruct *last;
	int32 Anzahl;
	ACSLinListElemStruct *LaufVar;
	int32 LaufVarNr;
} ACSLinListStruct;

static void InitLinListe(ACSLinListStruct *ListData);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

ULinList *Alu_create(void)
{
	ULinList *list;
	
	list = Ax_malloc(sizeof(*list));
	if (list == NULL)
		return NULL;
	memcpy(list, &empty, sizeof(*list));
	list->ListData = Ax_malloc(sizeof(ACSLinListStruct));
	if (list->ListData == NULL)
	{
		Ax_recycle(list, sizeof(*list));
		return NULL;
	}
	InitLinListe(list->ListData);
	return list;
}

/* -------------------------------------------------------------------------- */

void Alu_delete(ULinList *list)
{
	if (list != NULL)
	{
#if WITH_FIXES
		list->clear(list);
#else
		Alu_clearElem(list);
#endif
		Ax_free(list->ListData);
		Ax_recycle(list, sizeof(*list));
	}
}

/* -------------------------------------------------------------------------- */

static void InitLinListe(ACSLinListStruct *ListData)
{
	ListData->first = NULL;
	ListData->last = NULL;
	ListData->Anzahl = 0;
	ListData->LaufVar = NULL;
	ListData->LaufVarNr = 0;
}

/* -------------------------------------------------------------------------- */

static void Alu_clearElem(ULinList *list)
{
	ACSLinListStruct *data = list->ListData;
	ACSLinListElemStruct *elem;
	ACSLinListElemStruct *next;
	
	for (elem = data->first; elem != NULL; elem = next)
	{
		next = elem->next;
		if (list->freeElem != NULL)
			list->freeElem(elem->data);
		Ax_recycle(elem, sizeof(*elem));
	}
	InitLinListe(data);
}

/* -------------------------------------------------------------------------- */

static boolean Alu_appendElem(ULinList *list, void *new_data)
{
	ACSLinListElemStruct *elem = NULL;
	ACSLinListStruct *data = list->ListData;
	
	elem = Ax_malloc(sizeof(*elem));
	if (elem == NULL)
		return FALSE;
	elem->data = new_data;
	elem->next = elem->prev = NULL;
	if (data->first == NULL)
	{
		data->first = elem;
		data->LaufVar = elem;
		data->LaufVarNr = 0;
	}
	if (data->last != NULL)
	{
		data->last->next = elem;
	}
	elem->prev = data->last;
	data->last = elem;
	data->Anzahl += 1;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean Alu_insertElem(ULinList *list, void *new_data, int16 before_obj)
{
	int32 i;
	ACSLinListElemStruct *elem = NULL;
	ACSLinListElemStruct *ptr = NULL;
	ACSLinListStruct *data = list->ListData;
	
	elem = Ax_malloc(sizeof(*elem));
	if (elem == NULL)
		return FALSE;
	for (i = 0, ptr = data->first; i < before_obj - 1 && ptr != NULL; )
	{
		ptr = ptr->next;
		i++;
	}
	if (i != before_obj - 1 || ptr == NULL)
		ptr = data->last;
	elem->data = new_data;
	elem->next = NULL;
	if (ptr != NULL)
	{
		elem->next = ptr->next;
		ptr->next = elem;
		elem->prev = ptr;
		if (elem->next != NULL)
			elem->next->prev = elem;
		else
			data->last = elem;
	} else
	{
		data->first = data->last = elem;
		data->LaufVar = elem;
		data->LaufVarNr = 0;
	}
	data->Anzahl += 1;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void *Alu_deleteElem(ULinList *list, int16 data_nr)
{
	int32 i;
	ACSLinListElemStruct *prev = NULL;
	ACSLinListElemStruct *ptr = NULL;
	ACSLinListStruct *data = list->ListData;
	void *userdata;
	
	for (i = 0, prev = NULL, ptr = data->first; i < data_nr && ptr != NULL; )
	{
		prev = ptr;
		ptr = ptr->next;
		i++;
	}
	if (i != data_nr)
		return NULL;
	if (prev != NULL)
		prev->next = ptr->next;
	else
		data->first = ptr->next;
	if (ptr->next != NULL)
		ptr->next->prev = prev;
	else
		data->last = prev;
	data->Anzahl -= 1;
	if (data->LaufVar == ptr)
	{
		data->LaufVar = data->first;
		data->LaufVarNr = 0;
	}
	userdata = ptr->data;
	Ax_recycle(ptr, sizeof(*ptr));
	return userdata;
}

/* -------------------------------------------------------------------------- */

int16 Alu_ptrCmp(void *para, void *elem)
{
	return para == elem;
}

/* -------------------------------------------------------------------------- */

int16 Alu_longCmp(void *para, void *elem)
{
	return *((int32 *)para) == *((int32 *)elem);
}

/* -------------------------------------------------------------------------- */

int16 Alu_intCmp(void *para, void *elem)
{
	return *((int16 *)para) == *((int16 *)elem);
}

/* -------------------------------------------------------------------------- */

int16 Alu_charCmp(void *para, void *elem)
{
	return *((char *)para) == *((char *)elem);
}

/* -------------------------------------------------------------------------- */

int16 Alu_strCmp(void *para, void *elem)
{
	return Ast_cmp(para, elem) == 0;
}

/* -------------------------------------------------------------------------- */

int16 Alu_striCmp(void *para, void *elem)
{
	return Ast_icmp(para, elem) == 0;
}

/* -------------------------------------------------------------------------- */

static int32 Alu_deleteForElem(ULinList *list, void *para, boolean (*to_delete)(void *para, void *elem) )
{
	int32 count = 0;
	ACSLinListElemStruct *ptr = NULL;
	ACSLinListElemStruct *prev = NULL;
	ACSLinListStruct *data = list->ListData;
#if WITH_FIXES
	ACSLinListElemStruct *next;
#endif

	for (prev = NULL, ptr = data->first; ptr != NULL; )
	{
#if WITH_FIXES
		next = ptr->next;
#endif
		if (to_delete == NULL || to_delete(para, ptr->data))
		{
			if (prev != NULL)
				prev->next = ptr->next;
			else
				data->first = ptr->next;
			if (ptr->next != NULL)
				ptr->next->prev = prev;
			else
				data->last = prev;
			data->Anzahl -= 1;
			if (data->LaufVar == ptr)
			{
				data->LaufVar = data->first;
				data->LaufVarNr = 0;
			}
			list->freeElem(ptr->data);
			Ax_recycle(ptr, sizeof(*ptr));
			count++;
		} else
		{
			prev = ptr;
		}
#if WITH_FIXES
		ptr = next;
#else
		ptr = ptr->next;
#endif
	}
	return count;
}

/* -------------------------------------------------------------------------- */

static void *Alu_searchElem(ULinList *list, int32 nr)
{
	int32 i;
	ACSLinListElemStruct *ptr = NULL;
	ACSLinListStruct *data = list->ListData;

	for (i = 0, ptr = data->first; i < nr && ptr != NULL; )
	{
		ptr = ptr->next;
		i++;
	}
	if (i == nr && ptr != NULL)
	{
		data->LaufVar = ptr;
		data->LaufVarNr = nr;
		return ptr->data;
	}
	return NULL;
}

/* -------------------------------------------------------------------------- */

static void *Alu_searchForElem(ULinList *list, void *para, boolean (*found)(void *para, void *elem) )
{
	boolean done = FALSE;
	int32 i = 0;
	ACSLinListElemStruct *ptr = NULL;
	ACSLinListStruct *data = list->ListData;

	for (i = 0, ptr = data->first; !done && ptr != NULL; )
	{
		if (found == NULL || found(para, ptr->data))
		{
			done = TRUE;
			break;
		}
		ptr = ptr->next;
		i++;
	}
	if (done && ptr != NULL)
	{
		data->LaufVar = ptr;
		data->LaufVarNr = i;
		return ptr->data;
	}
	return NULL;
}

/* -------------------------------------------------------------------------- */

static void *Alu_firstElem(ULinList *list)
{
	ACSLinListStruct *data = list->ListData;
	
	data->LaufVar = data->first;
	data->LaufVarNr = 0;
	if (data->first == NULL)
		return NULL;
	else
		return data->first->data;
}

/* -------------------------------------------------------------------------- */

static void *Alu_lastElem(ULinList *list)
{
	ACSLinListStruct *data = list->ListData;
	
	data->LaufVar = data->last;
	data->LaufVarNr = data->Anzahl - 1;
	if (data->last == NULL)
		return NULL;
	else
		return data->last->data;
}

/* -------------------------------------------------------------------------- */

static int32 Alu_aktNrElem(ULinList *list)
{
	ACSLinListStruct *data = list->ListData;
	
	if (data->LaufVar == NULL)
		return -1;
	else
		return data->LaufVarNr;
}

/* -------------------------------------------------------------------------- */

static void *Alu_aktElem(ULinList *list)
{
	ACSLinListStruct *data = list->ListData;
	
	if (data->LaufVar == NULL)
		return NULL;
	else
		return data->LaufVar->data;
}

/* -------------------------------------------------------------------------- */

static void *Alu_skipElem(ULinList *list, boolean forwards, int32 amount)
{
	ACSLinListStruct *data = list->ListData;
	int32 i;
	
	if (forwards)
	{
		for (i = 0; i < amount && data->LaufVar != NULL; i++)
		{
			data->LaufVar = data->LaufVar->next;
		}
	} else
	{
		for (i = 0; i < amount && data->LaufVar != NULL; i++)
		{
			data->LaufVar = data->LaufVar->prev;
		}
	}
	if (data->LaufVar == NULL)
		return NULL;
	else
		return data->LaufVar->data;
}

/* -------------------------------------------------------------------------- */

static int32 Alu_countElem(ULinList *list)
{
	return ((ACSLinListStruct *)list->ListData)->Anzahl;
}

/* -------------------------------------------------------------------------- */

static int32 Alu_countForElem(ULinList *list, void *para, boolean (*count)(void *para, void *elem) )
{
	int32 i = 0;
	ACSLinListElemStruct *ptr = NULL;
	ACSLinListStruct *data = list->ListData;

	for (ptr = data->first; ptr != NULL; ptr = ptr->next)
	{
		if (count == NULL || count(para, ptr->data))
			i++;
	}
	return i;
}

/* -------------------------------------------------------------------------- */

static void Alu_doForElem(ULinList *list, void *para, boolean (*to_work)(void *para, void *elem), void (*work)(void *para, void *elem) )
{
	ACSLinListElemStruct *ptr = NULL;
	ACSLinListStruct *data = list->ListData;
	
	for (ptr = data->first; ptr != NULL; ptr = ptr->next)
	{
		if (to_work == NULL || to_work(para, ptr->data))
			work(para, ptr->data);
	}
}
