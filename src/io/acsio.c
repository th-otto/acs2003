#include "acs_i.h"
#include "acsio.h"
#include "workout.h"
#include "version.h"


#define FUTURE_VERSION (((ACS_VERSION_MAJOR + 1) * 100) + (0 * 10) + (1))

char const pc_welcome[] =
	"/*********************************************************************/" NL
	"/*                                                                   */" NL
	"/* This file was created with ACS3.00 at %.24s    */" NL
	"/*                                                                   */" NL
	"/* The contents are based on file:                                   */" NL
	"/*    %-62s */" NL
	"/*                                                                   */" NL
	"/* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els�sser */" NL
	"/*********************************************************************/" NL;

char const pp_welcome[] = 
	"(*********************************************************************)" NL
	"(*                                                                   *)" NL
	"(* This file was created with ACS3.00 at %.24s    *)" NL
	"(*                                                                   *)" NL
	"(* The contents are based on file:                                   *)" NL
	"(*    %-62s *)" NL
	"(*                                                                   *)" NL
	"(* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els�sser *)" NL
	"(*********************************************************************)" NL;

char const str_welcome[] =
	"; This file was created with ACS3.00 at %.24s" NL
	"; from %s" NL
	"; Do not edit this file, since changes will be lost when generating" NL
	"; (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els�sser" NL;

#define IOBUF_SIZE 0x20000L /* WTF? */

static jmp_buf err_jmp;
static int handle;
static long bpos;
static long bfill;
int16 mapX[1024]; /* FIXME: unused */
char iobuf[IOBUF_SIZE];
char iostring[1024];


static const char *const ml_title[MAX_LANGS] = { ml1_obj, ml2_obj, ml3_obj };
static const char *const mlal_title[MAX_LANGS] = { al1_obj, al2_obj, al3_obj };
static ACS_HEAD proto = {
	ACS_MAGIC, /* ".ACS" */
	401, /* ACS_VERSION */
	ACS_8000 | ACS_2000 | ACS_1000 | ACS_0800,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	{
		"ACS3.00", ACS_VERSION,
		-99, -99,
		ACS_0040 | ACS_0010 | ACS_CHANGED,
		"  ACS ACCESSORY  ",
		NULL, NULL,
		{
			{ ARROW, NULL },
			{ BUSYBEE, NULL },
			{ POINT_HAND, NULL },
			{ FLAT_HAND, NULL },
			{ TEXT_CRSR, NULL },
			{ THIN_CROSS, NULL },
			{ THICK_CROSS, NULL },
			{ OUTLN_CROSS, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
			{ 0, NULL },
		}
	},
	NULL,
	NULL,
	{ 0, 0, 0, 0 },
	{ 0, 0, 0, 0 },
	{ 0, 0, 0, 0 },
	0,
	{ 0, 0, 0, 0 },
	0,
	"",
	0,
	{ NULL, NULL, NULL },
	{ NULL, NULL, NULL },
	0,
	NULL,
	{
		{ NULL, NULL, NULL, FALSE, FALSE, 32 },
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		CFG_INIT_OLGA | CFG_INIT_GEMSCRIPT | CFG_INIT_BUBBLEGEM,
		0,
		NULL,
		NULL,
		NULL
	}
};


void acs_closewi(ACS_HEAD *acs, boolean all)
{
	Awindow *win;
	Obj_Head *list;
	
	win = acs->wi_palette;
	if (win != NULL)
		win->service(win, AS_TERM, NULL);
	if (all && (win = acs->wi_descr) != NULL)
		win->service(win, AS_TERM, NULL);
	list = acs->labels;
	while (list != NULL)
	{
		win = list->window;
		if (win != NULL)
		{
			win->service(win, AS_TERM, NULL);
			Aev_mess();
			Aev_mess();
		}
		list = list->next;
	}
	Aev_mess();
}


void assert_error(int16 error, void *para)
{
	if (error != 0)
		ACSblk->ACSerror(error, para);
	longjmp(err_jmp, 1);
}


jmp_buf *set_handle(int16 h)
{
	bfill = bpos = 0;
	handle = h;
	return &err_jmp;
}


void save_buf(const void *data, size_t len)
{
	long written;
	
	if (bpos + (long)len >= IOBUF_SIZE)
	{
		written = Fwrite(handle, bpos, iobuf);
		if (written < bpos)
		{
			ACSblk->ACSerror(AE_WRITE_IO, NULL);
			longjmp(err_jmp, 1);
		}
		bpos = 0;
	}
	if ((long)len > IOBUF_SIZE)
	{
		written = Fwrite(handle, len, data);
		if (written < (long)len)
		{
			ACSblk->ACSerror(AE_WRITE_IO, NULL);
			longjmp(err_jmp, 1);
		}
	} else
	{
		memcpy(&iobuf[bpos], data, len);
		bpos += len;
	}
}


void save_string(const char *str)
{
	save_buf(str, strlen(str));
}


void close_buf(void)
{
	long written;

	if (bpos > 0)
	{
		written = Fwrite(handle, bpos, iobuf);
		if (written < bpos)
		{
			ACSblk->ACSerror(AE_WRITE_IO, NULL);
			longjmp(err_jmp, 1);
		}
	}
}


void read_buf(void *data, size_t len)
{
	long transfer;
	
	if (bpos + (long)len > bfill)
	{
		transfer = bfill - bpos;
		if (transfer > 0)
			memcpy(data, &iobuf[bpos], transfer);
		bpos = 0;
		len -= transfer;
		data = (void *)((char *)data + transfer);
		if ((long)len >= IOBUF_SIZE)
		{
			bfill = Fread(handle, len, data);
			if (bfill != len)
			{
				ACSblk->ACSerror(AE_READ_IO, NULL);
				longjmp(err_jmp, 1);
			}
		} else
		{
			bfill = Fread(handle, IOBUF_SIZE, iobuf);
			if (bfill < (long)len)
			{
				ACSblk->ACSerror(AE_READ_IO, NULL);
				longjmp(err_jmp, 1);
			}
			memcpy(data, &iobuf[bpos], len);
			bpos += len;
		}
	} else
	{
		memcpy(data, &iobuf[bpos], len);
		bpos += len;
	}
}


int16 save_acs(ACS_HEAD *acs, int16 h)
{
	bpos = 0;
	if (setjmp(*set_handle(h)) != 0)
	{
		unfix_all(acs);
		Fclose(handle);
		return FAIL;
	} else
	{
		if (fix_all(acs) == FALSE)
		{
			Fclose(handle);
			return FAIL;
		}
		wr_all(acs);
		close_buf();
		acs->flags &= ~ACS_CHANGED;
		unfix_all(acs);
		Fclose(handle);
		Aev_OlgaUpdate(acs->filename);
		Aev_DhstSaved(acs->filename);
	}
	return OK;
}


void init_acs(ACS_HEAD *acs)
{
	int i;
	
	proto.filename = acs->filename;
	memcpy(acs, &proto, sizeof(*acs));
	acs->wi_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->wi_list, wi_obj, "");
	acs->me_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->me_list, me_obj, "");
	acs->pu_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->pu_list, pu_obj, "");
	acs->ob_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->ob_list, ob_obj, "");
	acs->al_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->al_list, al_obj, "");
	acs->te_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->te_list, te_obj, "");
	acs->ic_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->ic_list, ic_obj, "");
	acs->im_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->im_list, im_obj, "");
	acs->st_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->st_list, st_obj, "");
	acs->us_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->us_list, us_obj, "");
	acs->rf_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->rf_list, rf_obj, "");
	acs->mo_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->mo_list, mf_obj, "");
	acs->if_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
	objname(acs, acs->if_list, if_obj, "");
	
	for (i = 0; i < MAX_LANGS; i++)
	{
		acs->mlst_list[i] = objmalloc(acs, 32 * sizeof(Obj_Head *));
		objname(acs, acs->mlst_list[i], ml_title[i], "");
		acs->mlal_list[i] = objmalloc(acs, 32 * sizeof(Obj_Head *));
		objname(acs, acs->mlal_list[i], mlal_title[i], "");
	}
	memcpy(&acs->last_rez, &ACSblk->desk, sizeof(acs->last_rez));

	acs->flags &= ~ACS_CHANGED;
}


static void init_ml_list(ACS_HEAD *acs, Obj_Head *obj, Obj_Head **items, const char *const *names)
{
	Obj_Head protoobj = { NULL, NULL, 0, 0, 0, NULL, "                               ", 1, 0, { 0, 0, 0, 0 } };
	Obj_Head **list = (Obj_Head **)obj->object;
	int i, j, count;
	Obj_Head *item;
	Obj_Head *str;
	
	count = (int)(obj->used / sizeof(*list));
	for (i = 0; i < count; i++)
		list[i]->label[29] = '\0';
	for (j = 0; j < MAX_LANGS; j++)
	{
		if (items[j] == NULL)
		{
			acs->flags |= ACS_CHANGED;
			items[j] = objmalloc(acs, 32 * sizeof(Obj_Head *));
			if (items[j] == NULL)
				assert_error(AE_OUT_OF_MEM, NULL);
			objname(acs, items[j], names[j], NULL);
			for (i = 0; i < count; i++)
			{
				item = list[i];
				protoobj.object = item->object;
				protoobj.size = item->size;
				protoobj.used = item->used;
				str = copy_str(acs, &protoobj);
				if (str == NULL)
					assert_error(AE_OUT_OF_MEM, NULL);
				sprintf(str->label, "%.28s\001%d\001", item->label, j);
				objname(acs, str, str->label, NULL);
				if (add_entry(items[j], str) == FAIL)
					assert_error(AE_OUT_OF_MEM, NULL);
			}
		}
	}
}


void del_mess(ACS_HEAD *acs)
{
	int i;
	boolean changed;
	char buf[36];
	Obj_Head *str;
	
	changed = FALSE;
	Amo_busy();
	for (i = 0; i < AD_A_ATT; i++)
	{
		sprintf(buf, "ACS(%02d)", i);
		str = find_entry(acs->al_list, buf);
		if (str != NULL && (str->flags & OBJ_GLOBAL))
		{
			str->flags &= ~OBJ_GLOBAL;
			del_alert(acs, str);
			changed = TRUE;
		}
	}
	for (; i < AD_COUNT; i++)
	{
		sprintf(buf, "ACS(%02d)", i);
		str = find_entry(acs->st_list, buf);
		if (str != NULL && (str->flags & OBJ_GLOBAL))
		{
			str->flags &= ~OBJ_GLOBAL;
			del_string(acs, str);
			changed = TRUE;
		}
	}
	Amo_unbusy();
	if (changed)
		acs->flags |= ACS_CHANGED;
}


void init_mess(ACS_HEAD *acs)
{
	Obj_Head protoobj = { NULL, NULL, 0, 0, 0, NULL, "", 1, 0, { 0, 0, 0, 0 } };
	boolean changed;
	int i;
	Obj_Head *str;
	char buf[36];
	
	changed = FALSE;
	if (!(acs->flags & ACS_8000))
	{
		Amo_busy();
		for (i = 0; i < AD_A_ATT; i++)
		{
			sprintf(buf, "ACS(%02d)", i);
			if (find_entry(acs->al_list, buf) == NULL)
			{
				protoobj.object = NO_CONST(mlmess[i]);
				protoobj.used = protoobj.size = strlen(mlmess[i]) + 1;
				str = copy_alert(acs, &protoobj);
				if (str == NULL)
					return;
				strcpy(str->label, buf);
				objname(acs, str, str->label, NULL);
				str->flags |= OBJ_GLOBAL;
				if (add_entry(acs->al_list, str) == FAIL)
					return;
				serv_alert(acs, 1, str);
				changed = TRUE;
			}

		}
		for (; i < AD_COUNT; i++)
		{
			sprintf(buf, "ACS(%02d)", i);
			if (find_entry(acs->st_list, buf) == NULL)
			{
				protoobj.object = NO_CONST(mlmess[i]);
				protoobj.used = protoobj.size = strlen(mlmess[i]) + 1;
				str = copy_str(acs, &protoobj);
				if (str == NULL)
					return;
				strcpy(str->label, buf);
				objname(acs, str, str->label, NULL);
				str->flags |= OBJ_GLOBAL;
				if (add_entry(acs->st_list, str) == FAIL)
					return;
				serv_str(acs, 1, str);
				changed = TRUE;
			}
		}
		Amo_unbusy();
		if (changed)
			acs->flags |= ACS_CHANGED;
	}
}


int16 read_acs(long fd, ACS_HEAD *acs)
{
	char ext[10];
	int h = (int)fd;
	
	proto.filename = acs->filename;
	memcpy(acs, &proto, sizeof(*acs));
	proto.filename = NULL;
	/* BUG: Af_length returns negative value if file does not exist */
	if (fd < 0)
	{
		init_acs(acs);
	} else
	{
		if (Ast_icmp(Af_2ext(ext, acs->filename), "RSC") == 0)
		{
			if (setjmp(*set_handle(h)) == 0)
			{
				read_rsc(acs);
				acs->flags &= ~ACS_CHANGED;
				Fclose(h);
			} else
			{
				Fclose(h);
				return FAIL;
			}
		} else
		{
			if (setjmp(*set_handle(h)) != 0)
			{
				release_err();
				Fclose(h);
				return FAIL;
			}
			rd_all(acs);
			unfix_all(acs);
			if (acs->if_list == NULL)
			{
				acs->if_list = objmalloc(acs, 32 * sizeof(Obj_Head *));
				objname(acs, acs->if_list, if_obj, "");
			}
			init_ml_list(acs, acs->st_list, acs->mlst_list, ml_title);
			init_ml_list(acs, acs->al_list, acs->mlal_list, mlal_title);
			init_mess(acs);
			if (acs->version < FUTURE_VERSION)
				acs->flags |= ACS_CHANGED;
			else
				acs->flags &= ~ACS_CHANGED;
			acs->version = FUTURE_VERSION;
			Fclose(h);
		}
	}
	return OK;
}
