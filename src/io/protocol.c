#include "acs_i.h"
#include "acsio.h"
#include <time.h>

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void prot_texte(Obj_Head *list, const char *title)
{
	int i, count;
	Obj_Head **strings;
	char buf[2];
	Obj_Head *str;
	char *ptr, *end;
	
	count = (int)(list->used / sizeof(*strings));
	if (count > 0)
	{
		info_list(list->label);
		strings = (Obj_Head **)list->object;
		save_string(title);
		buf[1] = '\0';
		for (i = 0; i < count; i++)
		{
			str = strings[i];
			info_obj(str->label);
			sprintf(iostring, "%-32s\"", str->label);
			save_string(iostring);
			ptr = (char *)str->object;
			while ((end = strpbrk(ptr, "\"\\")) != NULL)
			{
				buf[0] = *end;
				*end = '\0';
				save_string(ptr);
				save_string("\\");
				save_string(buf);
				*end = buf[0];
				ptr = end + 1;
			}
			save_string(ptr);
			save_string("\"" NL);
		}
		save_string(NL NL);
	}
}

/* -------------------------------------------------------------------------- */

static void prot_clickdrag(Obj_Head *list)
{
	int i, count;
	int j, entrycount;
	Obj_Head **objs;
	Obj_Head *obj;
	OBJ_ENTRY *entry;
	char key[16];
	char buf[256];
	const char *label, *click, *drag;
	char *str;
	
	count = (int)(list->used / sizeof(*objs));
	if (count > 0)
	{
		info_list(list->label);
		save_string(list->label);
		save_string(NL "====================" NL NL);
		objs = (Obj_Head **)list->object;
		for (i = 0; i < count; i++)
		{
			obj = objs[i];
			info_obj(obj->label);
			buf[0] = '\0';
			if (obj->flags & OBJ_GLOBAL)
				strcat(buf, "free ");
			if (obj->flags & OBJ_USERDEFINED)
				strcat(buf, "extern ");
			if ((obj->flags & OBJ_LOCAL) && (obj->flags & OBJ_GLOBAL))
				strcat(buf, "local");
			else
				strcat(buf, "global");
			sprintf(iostring, NL
				"%s [usage %d %s]" NL
				"----------------------------------------" NL
				"keycode| click               | drag                | index               " NL
				"=======|=====================|=====================|=====================" NL,
				obj->label, obj->usage, buf);
			save_string(iostring);
			entrycount = (int)(obj->used / sizeof(*entry));
			entry = (OBJ_ENTRY *)obj->object;
			for (j = 0; j < entrycount; entry++, j++)
			{
				label = click = drag = "";
				key[0] = '\0';
				if (entry->label != NULL)
					label = entry->label->label;
				if (entry->aobj.click != NULL)
					click = ((Obj_Head *)entry->aobj.click)->label;
				if (entry->aobj.drag != NULL)
					drag = ((Obj_Head *)entry->aobj.drag)->label;
				if (entry->aobj.key != 0)
				{
					str = key_string(entry->aobj.key);
					str = strcpy(key, str);
					while (*str != '\0')
					{
						if (*str == ALT_C)   /* alt */
							*str = 'a';
						if (*str == CONTROL_C) /* control */
							*str = 'c';
						if (*str == SHIFT_C)   /* shift */
							*str = 's';
						str++;
					}
				}
				if (label[0] != '\0' ||
					key[0] != '\0' ||
					click[0] != '\0' ||
					drag[0] != '\0')
				{
					sprintf(iostring, "%-7s|%-21s|%-21s|%-21s" NL, key, click, drag, label);
					save_string(iostring);
				}
			}
			save_string(NL);
		}
		save_string(NL NL);
	}
}

/* -------------------------------------------------------------------------- */

static void prot_labellist(ACS_HEAD *acs)
{
	long size, count;
	Obj_Head *label;
	
	info_list("all");
	info_obj("all");
	save_string(NL
		"\t\t\t List of all named objects" NL
		"\t\t\t =========================" NL
		NL
		NL
		"\tName\t\t\t\t\t\t\t\t\t\t\t\t |Use |Size |\t Name\t\t\t\t\t\t\t\t\t\t\t\t |Use |Size |" NL
		"===============================|====|=====|================================|====|=====|");
	size = 0;
	count = 0;
	for (label = acs->labels; label != NULL; count++, label = label->next)
	{
		if (count & 1)
			save_string(" ");
		else
			save_string(NL);
		sprintf(iostring, "%-31s|%4d|%5ld|", label->label, label->usage, label->used);
		save_string(iostring);
		size += label->used;
	}
	save_string(NL "=======================================================================================" NL);
	sprintf(iostring, "%ld objects containing %ld bytes user data" NL NL, count, size);
	save_string(iostring);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

#ifdef __GNUC__
#pragma GCC diagnostic ignored "-Wclobbered"
#endif

void protocol(ACS_HEAD *acs)
{
	time_t t;
	char filename[__PS__];
	char *dot;
	long fd;
	
	strcpy(filename, acs->filename);
	dot = strrchr(filename, '.');
	strcpy(dot, ".LST"); /* FIXME: make lowercase */
	fd = Fcreate(filename, 0);
	if (fd < 0)
	{
		ACSblk->ACSerror(AE_CREATE_IO, strrchr(acs->filename, PATH_SEP) + 1);
	} else
	{
		*dot = '\0';
		info_start(filename);
		info_title("Protokoll");
		if (setjmp(*set_handle((int)fd)) != 0)
		{
			ACSblk->ACSerror(AE_WRITE_IO, NULL);
		} else
		{
			t = time(NULL);
			sprintf(iostring, pc_welcome, ctime(&t), acs->filename);
			save_string(iostring);
			prot_clickdrag(acs->me_list);
			prot_clickdrag(acs->pu_list);
			prot_clickdrag(acs->ob_list);
			prot_texte(acs->st_list, "\t\tTEXTS" NL "\t\t=====" NL NL);
			prot_texte(acs->al_list, "\t\tALERTBOXES" NL "\t\t==========" NL NL);
			prot_labellist(acs);
			close_buf();
		}
		info_end();
		Fclose((short)fd);
	}
}
