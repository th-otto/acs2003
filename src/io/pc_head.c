#include "acs_i.h"
#include "acsio.h"
#include <time.h>


static void out_acs(ACS_HEAD *acs)
{
	if (!(acs->flags & ACS_8000))
		save_string(NL NL "extern Adescr ACSdescr;" NL NL);
}


static void out_list(Obj_Head *obj, const char *str, const char *format)
{
	int count;
	int i;
	Obj_Head **list;
	Obj_Head *o;
	
	count = (int)(obj->used / sizeof(*list));
	if (count > 0)
	{
		info_list(obj->label);
		list = (Obj_Head **)obj->object;
		save_string(str);
		for (i = 0; i < count; i++)
		{
			o = list[i];
			if (strncmp(o->label, "ACS(", 4) != 0)
			{
				if ((o->flags & (OBJ_GLOBAL | OBJ_LOCAL)) == OBJ_GLOBAL)
				{
					info_obj(o->label);
					sprintf(iostring, format, o->label, o->size);
					save_string(iostring);
				}
			}
		}
	}
}


static void out_obj(Obj_Head *obj, const char *str)
{
	int count, i;
	Obj_Head **list;
	Obj_Head *o;
	OBJ_ENTRY *entry;
	int entrycount, j, index;
	
	count = (int)(obj->used / sizeof(*list));
	if (count > 0)
	{
		info_list(obj->label);
		list = (Obj_Head **)obj->object;
		save_string(str);
		for (i = 0; i < count; i++)
		{
			o = list[i];
			if ((o->flags & (OBJ_GLOBAL | OBJ_LOCAL)) == OBJ_GLOBAL)
			{
				info_obj(o->label);
				sprintf(iostring, NL "extern OBJECT %s;" NL, o->label);
				save_string(iostring);
				entrycount = (int)(o->used / sizeof(*entry));
				entry = (OBJ_ENTRY *)o->object;
				for (j = index = 0; j < entrycount; entry++, j++)
				{
					if (entry->label != NULL)
					{
						sprintf(iostring, "#define %-14s (%3d)" NL, entry->label->label, index);
						save_string(iostring);
					}
					if (entry->aobj.click == NULL &&
						entry->aobj.drag == NULL &&
						entry->aobj.userp1 == NULL &&
						entry->aobj.userp2 == NULL &&
						entry->type == NULL &&
						entry->aobj.key == 0 &&
						entry->aobj.mo_index == 0)
						index += 1;
					else
						index += 2;
				}
			}
		}
	}
}


static void out_declproto(ACS_HEAD *acs)
{
	Obj_Head *references;
	Obj_Head **list;
	Obj_Head *ref;
	int i, count;
	int16 flags;
	
	references = acs->rf_list;
	count = (int)(references->used / sizeof(*list));
	if (count > 0)
	{
		info_list(acs->rf_list->label);
		list = (Obj_Head **)references->object;
		save_string(NL NL "/*\t\tANSI-C Prototypes\t\t*/" NL NL);
		for (i = 0; i < count; i++)
		{
			ref = list[i];
			flags = ref->flags;
			if ((flags & OBJ_USERDEFINED) || (flags & (OBJ_GLOBAL | OBJ_LOCAL)) == OBJ_GLOBAL)
			{
				info_obj(ref->label);
				switch (flags & 0xff)
				{
				case 1:
				case 2:
				case 27:
				case 28:
				case 29:
				case 32:
				case 35:
					sprintf(iostring, "extern void %s( void );" NL, ref->label);
					break;
				case 3:
					sprintf(iostring, "extern INT16 CDECL %s( PARMBLK *pb );" NL, ref->label);
					break;
				case 4:
					sprintf(iostring, "extern INT16 %s( OBJECT *entry, INT16 task, void *in_out );" NL, ref->label);
					break;
				case 6:
				case 8:
				case 23:
					sprintf(iostring, "extern INT16 %s( Awindow *wind );" NL, ref->label);
					break;
				case 7:
					sprintf(iostring, "extern Awindow *%s( void *para );" NL, ref->label);
					break;
				case 9:
					sprintf(iostring, "extern INT16 %s( Awindow *wind, INT16 kstate, INT16 key );" NL, ref->label);
					break;
				case 10:
					sprintf(iostring, "extern void %s( Awindow *wind, INT16 obnr, INT16 state );" NL, ref->label);
					break;
				case 11:
				case 18:
				case 19:
					sprintf(iostring, "extern void %s( Awindow *wind, Axywh *area );" NL, ref->label);
					break;
				case 12:
				case 14:
				case 20:
					sprintf(iostring, "extern void %s( Awindow *wind );" NL, ref->label);
					break;
				case 15:
					sprintf(iostring, "extern void %s( Awindow *wind, INT16 pos, INT16 amount );" NL, ref->label);
					break;
				case 16:
				case 17:
					sprintf(iostring, "extern void %s( Awindow *wind, INT16 pos );" NL, ref->label);
					break;
				case 21:
					sprintf(iostring, "extern INT16 %s( Awindow *wind, INT16 task, void *in_out );" NL, ref->label);
					break;
				case 0:
					iostring[0] = '\0';
					break;
				case 22:
					sprintf(iostring, "extern INT16 %s( Awindow *wind, INT16 all );" NL, ref->label);
					break;
				case 24:
					sprintf(iostring, "extern INT16 %s( Awindow *wind, INT16 anz, char **cmd, A_GSAntwort *antwort );" NL, ref->label);
					break;
				case 25:
				case 26:
					sprintf(iostring, "extern INT16 %s( void );" NL, ref->label);
					break;
				case 30:
				case 31:
					sprintf(iostring, "extern INT16 %s( INT16 *message );" NL, ref->label);
					break;
				case 34:
					sprintf(iostring, "extern void %s( INT16 *button, INT16 *kreturn );" NL, ref->label);
					break;
				case 33:
				case 36:
					sprintf(iostring, "extern void %s( INT16 *kstate, INT16 *key );" NL, ref->label);
					break;
				case 37:
					sprintf(iostring, "extern INT16 %s( INT16 anz, char **cmd, A_GSAntwort *antwort );" NL, ref->label);
					break;
				case 5:
				case 13:
				default:
					sprintf(iostring, "/* %s Type %d ?? */" NL, ref->label, flags & 0xff);
					break;
				}
				save_string(iostring);
			}
		}
		save_string(NL NL);
	}
}


void pc_header(ACS_HEAD *acs)
{
	time_t t;
	char filename[__PS__];
	char *p;
	char *dot;
	int fd;
	
	p = strrchr(acs->filename, PATH_SEP) + 1;
	strcpy(filename, acs->filename);
	dot = strrchr(filename, '.'); /* BUG: will also find dot in directory names */
	if (dot != NULL)
		strcpy(dot, ".H"); /* FIXME: make lowercase */
	else
		strcat(filename, ".H"); /* FIXME: make lowercase */
	fd = (int)Fcreate(filename, 0);
	if (fd < 0)
	{
		ACSblk->ACSerror(AE_CREATE_IO, p);
	} else
	{
		info_start(filename);
		info_title("ANSI C Header");
		if (setjmp(*set_handle(fd)) != 0)
		{
			ACSblk->ACSerror(AE_WRITE_IO, NULL);
		} else
		{
			t = time(NULL);
			sprintf(iostring, pc_welcome, ctime(&t), acs->filename);
			save_string(iostring);
			save_string(NL NL "/*\t\tPLATFORM\t\t*/" NL
			            "#define ACS_ATARI" NL);
			out_list(acs->al_list, NL NL "/*\t\tALERTBOXES\t\t*/" NL NL, "extern char %s [%ld];" NL);
			out_list(acs->st_list, NL NL "/*\t\tSTRINGS\t\t*/" NL NL, "extern char %s [%ld];" NL);
			out_list(acs->ic_list, NL NL "/*\t\tICONS\t\t*/" NL NL, "extern CICONBLK %s;" NL);
			out_list(acs->im_list, NL NL "/*\t\tIMAGES\t\t*/" NL NL, "extern BITBLK %s;" NL);
			out_obj(acs->me_list, NL NL "/*\t\tMENU TREES\t\t*/" NL NL);
			out_obj(acs->pu_list, NL NL "/*\t\tPOPUP TREES\t\t*/" NL NL);
			out_obj(acs->ob_list, NL NL "/*\t\tOBJECT TREES\t\t*/" NL NL);
			out_list(acs->wi_list, NL NL "/*\t\tWINDOWS\t\t*/" NL NL, "extern Awindow %s;" NL);
			out_list(acs->mo_list, NL NL "/*\t\tMOUSEFORMS\t\t*/" NL NL, "extern MFORM %s;" NL);
			out_acs(acs);
			out_declproto(acs);
			close_buf();
		}
		info_end();
		Fclose(fd);
	}
}
