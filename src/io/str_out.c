#include "acs_i.h"
#include "acsio.h"
#include <time.h>

#ifdef __GNUC__
#pragma GCC diagnostic ignored "-Wclobbered"
#endif


#if defined __PUREC__ && !WITH_FIXES
static void unused(void)
{
	save_string("%-12s");
	save_string("&%-12s");
	save_string("&%-12s[3]");
}
#endif


static void out_string(Obj_Head *obj)
{
	int i, count;
	Obj_Head **list;
	Obj_Head *o;
	
	count = (int)(obj->used / sizeof(*list));
	if (count > 0)
	{
		info_list(obj->label);
		list = (Obj_Head **)obj->object;
		for (i = 0; i < count; i++)
		{
			o = list[i];
			if (strncmp(o->label, "ACS(", 4) != 0)
			{
				info_obj(o->label);
				sprintf(iostring, "%s=#", o->label);
				save_string(iostring);
				save_string(o->object);
				save_string("#" NL);
			}
		}
	}
}


void str_output(ACS_HEAD *acs)
{
	time_t t;
	char filename[__PS__ * 2];
	char reverse[256];
	char *p;
	char *dot;
	int fd;
	
	p = strrchr(acs->filename, PATH_SEP) + 1;
	strcpy(filename, acs->filename);
	dot = strrchr(filename, '.'); /* BUG: will also find dot in directory names */
	/* BUG: no null pointer check */
	strcpy(dot, ".ST0"); /* FIXME: make lowercase */
	dot[3] += acs->language;
	fd = (int)Fcreate(filename, 0);
	if (fd < 0)
	{
		ACSblk->ACSerror(AE_CREATE_IO, p);
	} else
	{
		info_start(filename);
		info_title("String-Export");
		if (setjmp(*set_handle(fd)) != 0)
		{
			ACSblk->ACSerror(AE_WRITE_IO, NULL);
			Fclose(fd); /* FIXME: move below */
			info_end();
		} else
		{
			t = time(NULL);
			sprintf(iostring, str_welcome, ctime(&t), acs->filename);
			save_string(iostring);
			sprintf(iostring, "[%s]" NL, Ast_reverse(reverse, acs->filename) + 4); /* FIXME: why reverse it? */
			save_string(iostring);
			sprintf(iostring, "GUI-LANGUAGE=ACS_LANG%d" NL, acs->language + 1);
			save_string(iostring);
			out_string(acs->al_list);
			out_string(acs->st_list);
			close_buf();
			info_end();
			Fclose(fd);
		}
	}
}
