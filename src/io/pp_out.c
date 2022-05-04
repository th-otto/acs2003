#include "acs_i.h"
#include "acsio.h"
#include <time.h>
#include "io/workout.h"
#include "version.h"


static int16 mapX[1000]; /* FIXME: duplicate */


static void p_string(const char *str, char term)
{
	char buf[4];
	char lineend[4] = ";" NL;
	
	save_string("'");
	while (*str != '\0')
	{
		switch (*str)
		{
		case '\a':
		case '\b':
		case '\t':
		case '\n':
		case '\f':
		case '\v':
		case '\r':
			sprintf(buf, "'#%i'", *str);
			break;
		case '\'':
			strcpy(buf, "''");
			break;
		default:
			sprintf(buf, "%c", *str);
			break;
		}
		save_string(buf);
		str++;
	}
	save_string("'#0");
	lineend[0] = term;
	save_string(lineend);
}


static void out_label(Obj_Head *obj, const char *str_default)
{
	if (obj != NULL)
	{
		sprintf(iostring, "%s", obj->label);
		save_string(iostring);
	} else
	{
		save_string(str_default);
	}
	
}


static void out_label2(Obj_Head *obj, const char *str_default)
{
	if (obj != NULL)
	{
		sprintf(iostring, "@%s", obj->label);
		save_string(iostring);
	} else
	{
		save_string(str_default);
	}
}


static void out_label3(Obj_Head *obj, const char *str_default)
{
	if (obj != NULL)
	{
		sprintf(iostring, "@%-12s[3]", obj->label);
		save_string(iostring);
	} else
	{
		save_string(str_default);
	}
}


static void out_refs(ACS_HEAD *acs)
{
	Obj_Head *list = acs->rf_list;
	int i, count;
	Obj_Head **items;
	Obj_Head *item;
	int16 flags;
	
	count = (int)(list->used / sizeof(*items));
	if (count > 0)
	{
		items = (Obj_Head **)list->object;
		save_string(NL "IMPLEMENTATION" NL NL "(*\tPascal Routines\t*)" NL NL);
		for (i = 0; i < count; i++)
		{
			item = items[i];
			info_obj(item->label);
			flags = item->flags;
			if (item->used != 0)
			{
				save_string((char *)item->object);
				save_string(NL);
			} else
			{
				if ((char)flags != 0 && !(flags & OBJ_USERDEFINED))
				{
					sprintf(iostring, "(* '%s' Not yet defined by user *)" NL, item->label);
					save_string(iostring);
					save_string(NL);
				}
			}
		}
	}
}


static void out_declproto(ACS_HEAD *acs)
{
	Obj_Head *list = acs->rf_list;
	int i, count;
	Obj_Head **items;
	Obj_Head *item;
	int16 flags;
	
	count = (int)(list->used / sizeof(*items));
	if (count > 0)
	{
		info_list(acs->rf_list->label);
		items = (Obj_Head **)list->object;
		save_string(NL NL "(*\t\tPascal Prototypes\t\t*)" NL NL);
		for (i = 0; i < count; i++)
		{
			item = items[i];
			flags = item->flags;
			if ((flags & (OBJ_LOCAL | OBJ_GLOBAL | OBJ_USERDEFINED)) == 0 ||
				(flags & (OBJ_LOCAL | OBJ_GLOBAL | OBJ_USERDEFINED)) == (OBJ_LOCAL | OBJ_GLOBAL))
			{
				info_obj(item->label);
				switch (flags & 0xff)
				{
				case REF_OBJ_CLICK:
				case REF_OBJ_DRAG:
				/* FIXME: missing:
				case REF_SYS_TERM:
				case REF_SYS_ABOUTME:
				case REF_SYS_CLOSE:
				case REF_SYS_TIMER:
				case REF_SYS_MOUSE:
				*/
					sprintf(iostring, "Procedure %s;" NL, item->label);
					break;
				case REF_USER_DRAW:
					sprintf(iostring, "Function %s( dummy1, dummy2: Pointer; pb: PARMBLKPtr ) : Integer;" NL, item->label);
					break;
				case REF_USER_SERVICE:
					sprintf(iostring, "Function %s( entry: ACSOBJECTPtr; task: Integer; in_out: Pointer ) : Boolean;" NL, item->label);
					break;
				case REF_WIN_OPEN:
				case REF_WIN_INIT:
				case REF_WIN_UNICONIFY:
					sprintf(iostring, "Function %s( wi: AwindowPtr ) : Integer;" NL, item->label);
					break;
				case REF_WIN_CREATE:
					sprintf(iostring, "Function %s( para: Pointer ) : AwindowPtr;" NL, item->label);
					break;
				case REF_WIN_KEYS:
					sprintf(iostring, "Function %s( wi: AwindowPtr; kstate, key: Integer ) : Integer;" NL, item->label);
					break;
				case REF_WIN_CHANGE:
					sprintf(iostring, "Procedure %s( wi: AwindowPtr; obnr, state: Integer );" NL, item->label);
					break;
				case REF_WIN_REDRAW:
				case REF_WIN_MOVED:
				case REF_WIN_SIZED:
					sprintf(iostring, "Procedure %s( wi: AwindowPtr; area: AxywhPtr );" NL, item->label);
					break;
				case REF_WIN_TOPPED:
				case REF_WIN_CLOSED:
				case REF_WIN_FULLED:
					sprintf(iostring, "Procedure %s( wi: AwindowPtr );" NL, item->label);
					break;
				case REF_WIN_ARROWED:
#if 0
					/* FIXME: now has additional parameter */
					sprintf(iostring, "Procedure %s( wi: AwindowPtr; pos, amount: Integer );" NL, item->label);
					break;
#endif
				case REF_WIN_HSLIDE:
				case REF_WIN_VSLIDE:
					sprintf(iostring, "Procedure %s( wi: AwindowPtr; pos: Integer );" NL, item->label);
					break;
				case REF_WIN_SERVICE:
					sprintf(iostring, "Function %s( wi: AwindowPtr; task: Integer; in_out: Pointer ) : Boolean;" NL, item->label);
					break;
				case REF_NONE:
					iostring[0] = '\0';
					break;
				case REF_WIN_ICONIFY:
					sprintf(iostring, "Function %s( wi: AwindowPtr; all: Integer ) : Integer;" NL, item->label);
					break;
				case REF_WIN_GEMSCRIPT:
					sprintf(iostring, "Function %s( wi: AwindowPtr; anz: Integer; cmd: Pointer; antwort: A_GSAntwortPtr ) : Integer;" NL, item->label);
					break;
#if 0 /* FIXME: remaining missing */
				case REF_SYS_ACSINIT0:
				case REF_SYS_ACSINIT:
					sprintf(iostring, "Function %s : Integer;" NL, item->label);
					break;
				case REF_SYS_MESSAGE:
				case REF_SYS_MPROTO:
					sprintf(iostring, "Function %s( message : Pointer );" NL, item->label);
					break;
				case REF_SYS_BUTTON:
					sprintf(iostring, "Procedure %s( VAR button: Integer; VAR kreturn : Integer );" NL, item->label);
					break;
				case REF_SYS_KEY:
				case REF_SYS_WIKEY:
					sprintf(iostring, "Procedure %s( VAR kstate: Integer; VAR key : Integer );" NL, item->label);
					break;
				case REF_SYS_GEMSCRIPT:
					sprintf(iostring, "Function %s( anz : Integer; cmd : Pointer; antwort: A_GSAntwortPtr );" NL, item->label);
					break;
#endif
				case REF_WIN_UNUSED1:
				case REF_WIN_UNUSED2:
				default:
					sprintf(iostring, "(* %s Type %d ?? *)" NL, item->label, flags & 0xff);
					break;
				}
				save_string(iostring);
			}
		}
		save_string(NL NL);
	}
}


static void out_acs(ACS_HEAD *acs)
{
	int i;
	Amouse *mouse;
	char buf[36];
	char label[32] = "                                "; /* BUG: not zero-terminated */
	char term;
	Obj_Head *entry;
	char *str;
	
	if (!(acs->flags & ACS_SUBMODUL))
	{
		save_string(NL NL "ACSdescr: Adescr = " NL "\t(" NL);
		sprintf(iostring, "\t\tmagic: '%s'#0; version: %d; dx: %2d; dy: %2d; flags: $%04x;" NL " \t\tacc_reg: ",
			"ACS3.00", ACS_VERSION, acs->descr.dx, acs->descr.dy, acs->descr.flags /* | AB_SMARTREDRAW */);
		save_string(iostring);
		str = acs->descr.acc_reg;
		strncpy(label, str, 31);
		label[31] = '\0';
		p_string(label, ';');
		save_string("\t\troot: ");
		out_label2(acs->descr.root, "NIL"); /* BUG: should default to @PUR_DESK */
		save_string("; acc: ");
		out_label2(acs->descr.acc, "NIL");
		save_string(";" NL "\t\tmouse: (" NL);
		mouse = acs->descr.mouse;
		for (i = 0; i < 32; i++)
		{
			if (i != 0)
				save_string("," NL);
			if (mouse->number == USER_DEF)
				sprintf(iostring, "\t\t\t(number: 255; form: @%s)", ((Obj_Head *)mouse->form)->label);
			else
				sprintf(iostring, "\t\t\t(number: %3d; form: NIL)", mouse->number);
			save_string(iostring);
			mouse++;
		}
		save_string(NL "\t\t);" NL "\t\tmess: (" NL);
		for (i = 0; i < AD_COUNT; i++)
		{
			save_string("\t\t\t\t");
			term = i < AD_COUNT - 1 ? ',' : '\0';
			
			sprintf(buf, "ACS(%02d)", i);
			entry = find_entry(acs->st_list, buf);
			if (entry == NULL &&
				(entry = find_entry(acs->al_list, buf)) == NULL)
			{
				p_string(mlmess[i], term);
			} else
			{
				p_string((char *)entry->object, term);
			}
		}
		save_string(NL "\t\t)" NL "\t);" NL);
		save_string(NL NL "ACSconfig: Aconfig = " NL "\t(" NL "\t\t");
		save_string("CfgInfo: (" NL "\t\t\tdateiname: '");
		out_label((Obj_Head *)acs->config.CfgInfo.dateiname, "");
		save_string("'; comment: '");
		out_label((Obj_Head *)acs->config.CfgInfo.comment, "%;");
		save_string("'; env_praefix: ");
		out_label((Obj_Head *)acs->config.CfgInfo.env_praefix, "NIL");
		save_string("; " NL "\t\t\tcasesensitiv: ");
		save_string(acs->config.CfgInfo.casesensitiv ? "TRUE" : "FALSE");
		save_string("; file_sensitiv: ");
		save_string(acs->config.CfgInfo.file_sensitiv ? "TRUE" : "FALSE");
		save_string(";" NL "\t\t\tfile_buffer: ");
		sprintf(iostring, "%i" NL "\t\t);" NL "\t\t", acs->config.CfgInfo.file_buffer);
		save_string(iostring);
		save_string("BaseName: '");
		out_label((Obj_Head *)acs->config.BaseName, "PUR_DESK");
		save_string("'; ACSterm: ");
		out_label((Obj_Head *)acs->config.ACSterm, "NIL");
		save_string("; ACSaboutme: ");
		out_label((Obj_Head *)acs->config.ACSaboutme, "NIL");
		save_string("; ACSclose: ");
		out_label((Obj_Head *)acs->config.ACSclose, "NIL");
		save_string(";" NL "\t\tACSmessage: ");
		out_label((Obj_Head *)acs->config.ACSmessage, "NIL");
		save_string("; ACSmproto: ");
		out_label((Obj_Head *)acs->config.ACSmproto, "NIL");
		save_string("; ACStimer: ");
		out_label((Obj_Head *)acs->config.ACStimer, "NIL");
		save_string("; ACSkey: ");
		out_label((Obj_Head *)acs->config.ACSkey, "NIL");
		save_string(";" NL "\t\tACSbutton: ");
		out_label((Obj_Head *)acs->config.ACSbutton, "NIL");
		save_string("; ACSmouse: ");
		out_label((Obj_Head *)acs->config.ACSmouse, "NIL");
		save_string("; ACSwikey: ");
		out_label((Obj_Head *)acs->config.ACSwikey, "NIL");
		save_string(";" NL "\t\tinit_prot: ");
		sprintf(iostring, "%i; XAccType: ", acs->config.init_prot);
		save_string(iostring);
		sprintf(iostring, "%i; ACSGEMScript: ", acs->config.XAccType);
		save_string(iostring);
		out_label((Obj_Head *)acs->config.ACSGEMScript, "NIL");
#if 0
		/* FIXME: missing */
		save_string("; ACSinit0: ");
		out_label2((Obj_Head *)acs->config.ACSinit0, "NIL");
		save_string("; ACSinit: ");
		out_label2((Obj_Head *)acs->config.ACSinit, "@ACSinit");
#endif
		save_string(NL "\t);" NL);
	}
}


static void out_cicon(const char *label, CICON *cicon, int16 next_planes)
{
	sprintf(iostring, "_C%d_%-s: CICON = " NL "\t(" NL "\t\tnum_planes: %d;" NL "\t\tcol_data: ", cicon->num_planes, label, cicon->num_planes);
	save_string(iostring);
	out_label3((Obj_Head *)cicon->col_data, "NIL");
	save_string(";" NL "\t\tcol_mask: ");
	out_label2((Obj_Head *)cicon->col_mask, "NIL");
	save_string(";" NL "\t\tsel_data: ");
	out_label3 ((Obj_Head *)cicon->sel_data, "NIL");
	save_string(";" NL "\t\tsel_mask: ");
	out_label2((Obj_Head *)cicon->sel_mask, "NIL");
	if (next_planes != 0)
	{
		sprintf(iostring, ";" NL "\t\tnext_res: @_C%d_%-s);" NL, next_planes, label);
		save_string(iostring);
	} else
	{
		save_string(";" NL "\t\tnext_res: NIL);" NL);
	}
}


static void out_icon(Obj_Head *obj)
{
	int i, count;
	Obj_Head **list;
	Obj_Head *o;
	ACSCICONBLK *cicon;
	CICONBLK *ciconblk;
	int16 next_planes;
	int16 words, w;
	int16 *data;
	
	count = (int)(obj->used / sizeof(*list));
	if (count > 0)
	{
		info_list(obj->label);
		list = (Obj_Head **)obj->object;
		save_string(NL NL "(*\t\tICONS\t\t*)" NL NL);
		for (i = 0; i < count; i++)
		{
			o = list[i];
			info_obj(o->label);
			ciconblk = &((ACSCICONBLK *)o->object)->cicon;
			cicon = (ACSCICONBLK *)o->object;
			next_planes = 0;
			if (cicon->c256.num_planes != 0)
			{
				out_cicon(o->label, &cicon->c256, next_planes);
				next_planes = 8;
			}
			if (cicon->c16.num_planes != 0)
			{
				out_cicon(o->label, &cicon->c16, next_planes);
				next_planes = 4;
			}
			words = ((ciconblk->monoblk.ib_wicon + 15) >> 4) * ciconblk->monoblk.ib_hicon - 1;
			data = (int16 *)((char *)ciconblk + (long)ciconblk->monoblk.ib_pmask);
			sprintf(iostring, "_MSK_%-s: array [0..%d] of WORD = " NL "\t(" NL "\t\t", o->label, words);
			save_string(iostring);
			for (w = 0; w < words; w++)
			{
				sprintf(iostring, "$%04x, ", *data++);
				save_string(iostring);
				if ((w & 7) == 7)
					save_string(NL "\t\t");
			}
			sprintf(iostring, "$%04x" NL "\t);" NL "_DAT_%-s: array [0..%d] of WORD = " NL "\t(" NL "\t\t", *data++, o->label, words);
			save_string(iostring);
			for (w = 0; w < words; w++)
			{
				sprintf(iostring, "$%04x, ", *data++);
				save_string(iostring);
				if ((w & 7) == 7)
					save_string(NL "\t\t");
			}
			sprintf(iostring, "$%04x" NL "\t);" NL, *data++);
			save_string(iostring);
			sprintf(iostring, "%-s: CICONBLK = " NL
				"\t(" NL
				"\t\tmonoblk: " NL
				"\t\t(" NL
				"\t\t\tib_pmask: @_MSK_%s; ib_pdata: @_DAT_%s; ib_ptext: @%s;" NL
				"\t\t\tib_char: $%04x; ib_xchar: %2d; ib_ychar: %2d;" NL
				"\t\t\tib_xicon: %2d; ib_yicon: %2d; ib_wicon: %2d; ib_hicon: %2d;" NL
				"\t\t\tib_xtext: %2d; ib_ytext: %2d; ib_wtext: %2d; ib_htext: %2d" NL
				"\t\t);" NL
				"\t\tmainlist: ",
				o->label,
				o->label,
				o->label,
				((Obj_Head *)ciconblk->monoblk.ib_ptext)->label,
				ciconblk->monoblk.ib_char,
				ciconblk->monoblk.ib_xchar,
				ciconblk->monoblk.ib_ychar,
				ciconblk->monoblk.ib_xicon,
				ciconblk->monoblk.ib_yicon,
				ciconblk->monoblk.ib_wicon,
				ciconblk->monoblk.ib_hicon,
				ciconblk->monoblk.ib_xtext,
				ciconblk->monoblk.ib_ytext,
				ciconblk->monoblk.ib_wtext,
				ciconblk->monoblk.ib_htext);
			save_string(iostring);
			if (next_planes != 0)
			{
				sprintf(iostring, "@_C%d_%-s", next_planes, o->label);
				save_string(iostring);
			} else
			{
				save_string("NIL");
			}
			save_string(NL "\t);" NL NL);
		}
	}
}


static void out_mouse(Obj_Head *obj)
{
	int i, count;
	Obj_Head **list;
	Obj_Head *o;
	MFORM *mouse;
	int16 *data;
	int16 w;
	
	count = (int)(obj->used / sizeof(*list));
	if (count > 0)
	{
		info_list(obj->label);
		list = (Obj_Head **)obj->object;
		save_string(NL "(*\t\tMOUSEFORMS\t\t*)" NL);
		for (i = 0; i < count; i++)
		{
			o = list[i];
			info_obj(o->label);
			mouse = (MFORM *)o->object;
			sprintf(iostring, "%-s: MFORM = " NL
				"\t(" NL
				"\t\tmf_xhot: %2d; mf_yhot: %2d; mf_nplanes: %2d; mf_fg: %2d; mf_bg: %2d;" NL
				"\t\tmf_mask:" NL
				"\t\t(" NL
				"\t\t\t",
				o->label,
				mouse->mf_xhot,
				mouse->mf_yhot,
				mouse->mf_nplanes,
				mouse->mf_fg,
				mouse->mf_bg);
			save_string(iostring);
			data = mouse->mf_mask;
			for (w = 15; w > 0; w--)
			{
				sprintf(iostring, "%d, ", *data++); /* FIXME: use hex format */
				save_string(iostring);
				if (w == 8)
					save_string(NL "\t\t\t");
			}
			sprintf(iostring, "%d" NL "\t\t);" NL "\t\tmf_data:" NL "\t\t(" NL "\t\t\t", *data++);
			save_string(iostring);
			for (w = 15; w > 0; w--)
			{
				sprintf(iostring, "%d, ", *data++); /* FIXME: use hex format */
				save_string(iostring);
				if (w == 8)
					save_string(NL "\t\t\t");
			}
			sprintf(iostring, "%d" NL "\t\t)" NL "\t);" NL NL, *data++);
			save_string(iostring);
		}
	}
}


static void out_image(Obj_Head *obj)
{
	int i, count;
	Obj_Head **list;
	Obj_Head *o;
	BITBLK *bitblk;
	int16 words, w;
	int16 *data;
	
	count = (int)(obj->used / sizeof(*list));
	if (count > 0)
	{
		info_list(obj->label);
		list = (Obj_Head **)obj->object;
		save_string(NL NL "(*\t\tIMAGES\t\t*)" NL NL);
		for (i = 0; i < count; i++)
		{
			o = list[i];
			info_obj(o->label);
			bitblk = (BITBLK *)o->object;
			words = (bitblk->bi_wb >> 1) * bitblk->bi_hl - 1;
			data = (int16 *)((char *)bitblk + (long)bitblk->bi_pdata);
			sprintf(iostring, "_IMG_%-s: array [0..%d] of WORD = " NL "\t(" NL "\t\t\t", o->label, words);
			save_string(iostring);
			for (w = 0; w < words; w++)
			{
				sprintf(iostring, "$%04x, ", *data++);
				save_string(iostring);
				if ((w & 7) == 7)
					save_string(NL "\t\t\t");
			}
			sprintf(iostring, "$%04x" NL "\t\t);" NL "\t", *data++);
			save_string(iostring);
			sprintf(iostring, "%-s: BITBLK = " NL
				"\t(" NL
				"\t\tbi_pdata: @_IMG_%s;" NL
				"\t\tbi_wb: %2d; bi_hl: %2d; bi_x: %2d; bi_y: %2d; bi_color: %d" NL
				"\t);" NL NL,
				o->label, o->label,
				bitblk->bi_wb,
				bitblk->bi_hl,
				bitblk->bi_x,
				bitblk->bi_y,
				bitblk->bi_color);
			save_string(iostring);
		}
	}
}


static void out_obj(Obj_Head *list, const char *title)
{
	int i, count;
	int16 *mapptr;
	Obj_Head **trees;
	Obj_Head *tree;
	OBJ_ENTRY *entry;
	int entrycount, j, index;
	OBJECT object;
	AOBJECT aobject;
	const char *str;
	
	mapptr = &mapX[1];
	count = (int)(list->used / sizeof(*trees));
	if (count > 0)
	{
		info_list(list->label);
		save_string(title);
		mapX[0] = -1;
		trees = (Obj_Head **)list->object;
		for (i = 0; i < count; i++)
		{
			tree = trees[i];
			info_obj(tree->label);
			entrycount = (int)(tree->used / sizeof(*entry));
			entry = (OBJ_ENTRY *)tree->object;
			mapptr[0] = index = 0;
			for (j = 0; j < entrycount; entry++, j++, mapptr[j] = index)
			{
				if (entry->label != NULL)
				{
					sprintf(iostring, "%s = %d;" NL, entry->label->label, index);
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
			
			sprintf(iostring, "%s : Array [0 ..%d] of ACSOBJECT = " NL "\t(" NL "\t\t", tree->label, index - 1);
			save_string(iostring);
			
			entry = (OBJ_ENTRY *)tree->object;
			for (j = 0; j < entrycount; entry++, j++)
			{
				memcpy(&object, &entry->obj, sizeof(object));
				memcpy(&aobject, &entry->aobj, sizeof(aobject));
				object.ob_next = mapptr[object.ob_next];
				object.ob_head = mapptr[object.ob_head];
				object.ob_tail = mapptr[object.ob_tail];
				if (j == entrycount - 1)
				{
					if (mapptr[j + 1] == mapptr[j] + 2)
						aobject.ob_flags |= OF_LASTOB;
					else
						object.ob_flags |= OF_LASTOB;
				}
				sprintf(iostring, "(aes: (ob_next: %2d; ob_head: %2d; ob_tail: %2d; ob_type: %2d; ob_flags: $%04x; ob_state: $%04x;",
					object.ob_next,
					object.ob_head,
					object.ob_tail,
					object.ob_type,
					object.ob_flags,
					object.ob_state);
				save_string(iostring);
				if ((char)object.ob_type == G_BOX ||
					(char)object.ob_type == G_IBOX ||
					(char)object.ob_type == G_BOXCHAR)
				{
					sprintf(iostring, "ob_spec: (index: $%08lx);", object.ob_spec.index);
#if 0 /* FIXME: missing */
				} else if ((char)object.ob_type == G_TEXT ||
					(char)object.ob_type == G_FTEXT ||
					(char)object.ob_type == G_BOXTEXT ||
					(char)object.ob_type == G_FBOXTEXT)
				{
					sprintf(iostring, "ob_spec: (tedinfo: @%s);", ((Obj_Head *)object.ob_spec.tedinfo)->label);
#endif
				} else
				{
					sprintf(iostring, "ob_spec: (free_string: @%s);", ((Obj_Head *)object.ob_spec.free_string)->label);
				}
				save_string(iostring);
				sprintf(iostring, "ob_x: %2d; ob_y: %2d; ob_width: %2d; ob_height: %2d))", object.ob_x, object.ob_y, object.ob_width, object.ob_height);
				save_string(iostring);
				if (object.ob_flags & OF_LASTOB)
					save_string(NL "\t");
				else
					save_string("," NL "\t\t");
				if (mapptr[j + 1] == mapptr[j] + 2)
				{
					if (entry->type != NULL)
						str = entry->type->label;
					else
						str = "0";
					sprintf(iostring, "(acs: (", mapptr[j], tree->label); /* BUG: too many arguments for format */
					save_string(iostring);
					if (aobject.click != NULL)
					{
						save_string("click: ");
						out_label((Obj_Head *)aobject.click, "NIL");
						save_string("; ");
					}
					if (aobject.drag != NULL)
					{
						save_string("drag: ");
						out_label((Obj_Head *)aobject.drag, "NIL");
						save_string("; ");
					}
					sprintf(iostring, "ob_flags: $%04x; key: $%04x;", aobject.ob_flags, aobject.key);
					save_string(iostring);
					save_string("userp1: ");
					out_label2((Obj_Head *)aobject.userp1, "NIL");
					save_string(";userp2: ");
					out_label2((Obj_Head *)aobject.userp2, "NIL");
					sprintf(iostring, "; mo_index: %d; aob_type: %s))", aobject.mo_index, str);
					save_string(iostring);
					if (aobject.ob_flags & OF_LASTOB)
						save_string(NL "\t");
					else
						save_string("," NL "\t\t");
				}
			}
			save_string(");" NL);
		}
	}
}


static void out_string(Obj_Head *list, const char *title)
{
	int i, count;
	Obj_Head **items;
	Obj_Head *item;

	count = (int)(list->used / sizeof(*items));
	if (count > 0)
	{
		info_list(list->label);
		items = (Obj_Head **)list->object;
		save_string(title);
		for (i = 0; i < count; i++)
		{
			item = items[i];
			if (strncmp(item->label, "ACS(", 4) != 0)
			{
				info_obj(item->label);
				sprintf(iostring, "%s: packed array [1..%ld] of char = ", item->label, item->used);
				save_string(iostring);
				p_string(item->object, ';');
			}
		}
	}
}


static void out_tedi(Obj_Head *list)
{
	int i, count;
	Obj_Head **items;
	Obj_Head *item;
	TEDINFO *ted;
	
	count = (int)(list->used / sizeof(*items));
	if (count > 0)
	{
		info_list(list->label);
		items = (Obj_Head **)list->object;
		save_string(NL NL "(*\t\tTEDINFOS\t\t*)" NL NL);
		for (i = 0; i < count; i++)
		{
			item = items[i];
			info_obj(item->label);
			ted = (TEDINFO *)item->object;
			/* FIXME: fontid & fontsize not dumped */
			sprintf(iostring, "%s: TEDINFO = " NL
				"\t(" NL
				"\t\tte_ptext: @%s; te_ptmplt: @%s; te_pvalid: @%s;" NL
				"\t\tte_font: %d; te_just: %d; te_color: $%04x; te_thickness: %d; te_txtlen: %ld; te_tmplen: %ld" NL
				"\t);" NL,
				item->label,
				((Obj_Head *)ted->te_ptext)->label,
				((Obj_Head *)ted->te_ptmplt)->label,
				((Obj_Head *)ted->te_pvalid)->label,
				ted->te_font,
				ted->te_just,
				ted->te_color,
				ted->te_thickness,
				((Obj_Head *)ted->te_ptext)->used,
				((Obj_Head *)ted->te_ptmplt)->used);
			save_string(iostring);
		}
	}
}


static void out_user(Obj_Head *list)
{
	int i, count;
	Obj_Head **items;
	Obj_Head *item;
	AUSERBLK *user;
	char *label;
	char buf[16];
	
	count = (int)(list->used / sizeof(*items));
	if (count > 0)
	{
		info_list(list->label);
		items = (Obj_Head **)list->object;
		save_string(NL NL "(*\t\tAUSERBLK\t\t*)" NL NL);
		for (i = 0; i < count; i++)
		{
			item = items[i];
			info_obj(item->label);
			user = (AUSERBLK *)item->object;
			sprintf(iostring, "%s: AUSERBLK = (ub_code: %s; ub_parm: ", item->label, ((Obj_Head *)user->ub_code)->label);
			save_string(iostring);
			label = ((Obj_Head *)user->ub_parm)->label;
			if (label[0] == '0' && label[1] == 'x')
			{
				strcpy(buf, &label[2]);
				buf[strlen(buf) - 1] = '\0'; /* FIXME: check whether that really is 'L' */
				sprintf(iostring, "$%s", buf);
			} else
			{
				sprintf(iostring, "@%s", label);
			}
			save_string(iostring);
			save_string("; ub_serv: ");
			out_label((Obj_Head *)user->ub_serv, "NIL");
			save_string("; ub_ptr1: ");
			out_label2((Obj_Head *)user->ub_ptr1, "NIL");
			save_string("; ub_ptr2: ");
			out_label2((Obj_Head *)user->ub_ptr2, "NIL");
			save_string("; ub_ptr3: ");
			out_label2((Obj_Head *)user->ub_ptr3, "NIL");
			save_string("; bubble: ");
			out_label2((Obj_Head *)user->bubble, "NIL");
			save_string("; context: ");
			out_label2((Obj_Head *)user->context, "NIL");
			save_string(");" NL);
		}
	}
}


static void out_data(Obj_Head *list)
{
	int i, count;
	Obj_Head **items;
	Obj_Head *item;
	long j, size;
	int16 *data;
	
	count = (int)(list->used / sizeof(*items));
	if (count > 0)
	{
		info_list(list->label);
		items = (Obj_Head **)list->object;
		save_string(NL NL "(*\t\tDATAS\t\t*)" NL NL);
		for (i = 0; i < count; i++)
		{
			item = items[i];
			info_obj(item->label);
			size = ((long)item->used - 1) >> 1;
			if (size > 0)
			{
				sprintf(iostring, "%-s: array [0..%ld] of WORD =" NL "\t(" NL "\t\t", item->label, size);
				save_string(iostring);
				data = item->object;
				for (j = 0; j < size; j++)
				{
					sprintf(iostring, "$%04x, ", *data++);
					save_string(iostring);
					if ((j & 7) == 7)
						save_string(NL "\t\t\t");
				}
				sprintf(iostring, "$%04x" NL "\t);" NL, *data++);
				save_string(iostring);
			}
		}
	}
}	


static void out_window(Obj_Head *list)
{
	int i, count;
	Obj_Head **items;
	Obj_Head *item;
	Awindow *win;
	
	count = (int)(list->used / sizeof(*items));
	if (count > 0)
	{
		info_list(list->label);
		items = (Obj_Head **)list->object;
		save_string(NL NL "(*\t\tWINDOWS\t\t*)" NL NL);
		for (i = 0; i < count; i++)
		{
			item = items[i];
			info_obj(item->label);
			win = (Awindow *)item->object;
			sprintf(iostring, "%s: Awindow = " NL "\t(" NL, item->label);
			save_string(iostring);
			save_string("\t\tuser: ");
			out_label2((Obj_Head *)win->user, "NIL");
			save_string(";" NL "\t\tservice: ");
			out_label((Obj_Head *)win->service, "Awi_service");
			save_string(";" NL "\t\tcreate: ");
			out_label((Obj_Head *)win->create, "Awi_selfcreate");
			save_string(";" NL "\t\topen: ");
			out_label((Obj_Head *)win->open, "Awi_open");
			save_string(";" NL "\t\tinit: ");
			out_label((Obj_Head *)win->init, "Awi_init");
			save_string(";" NL "\t\twork: ");
			out_label2((Obj_Head *)win->work, "NIL");
			save_string(";" NL "\t\ttoolbar: ");
			out_label2((Obj_Head *)win->toolbar, "NIL");
			save_string(";" NL "\t\tob_edit: -1; ob_col: -1; wi_id: -1;");
			sprintf(iostring, NL "\t\twi_kind: $%04x; wi_act: (x: %2i; y: %2i; w: %2i; h: %2i);",
				win->wi_kind, win->wi_act.x, win->wi_act.y, win->wi_act.w, win->wi_act.h);
			save_string(iostring);
			save_string(NL "\t\twi_slider: (x: -1; y: -1; w: -1; h: -1);"); /* FIXME: wi_act, wi_normal, wi_work not initialized */
			sprintf(iostring, NL "\t\tsnap_mask: $%04x;", win->snap_mask);
			save_string(iostring);
			save_string(NL "\t\tname: ");
			out_label2((Obj_Head *)win->name, "NIL");
			save_string("; info: ");
			out_label2((Obj_Head *)win->info, "NIL");
			sprintf(iostring, ";" NL "\t\tob_len: $%04x; kind: $%04x; icon : -1", win->ob_len, win->kind);
			save_string(iostring);
			save_string(";" NL "\t\ticonblk: ");
			out_label2((Obj_Head *)win->iconblk, "NIL");
			save_string(";" NL "\t\tmenu: ");
			out_label2((Obj_Head *)win->menu, "NIL");
			save_string(";" NL "\t\tkeys: ");
			out_label((Obj_Head *)win->keys, "Awi_keys");
			save_string(";" NL "\t\tobchange: ");
			out_label((Obj_Head *)win->obchange, "Awi_obchange");
			save_string(";" NL "\t\tredraw: ");
			out_label((Obj_Head *)win->redraw, "Awi_redraw");
			save_string(";" NL "\t\ttopped: ");
			out_label((Obj_Head *)win->topped, "Awi_topped");
			save_string(";" NL "\t\tclosed: ");
			out_label((Obj_Head *)win->closed, "Awi_closed");
			save_string(";" NL "\t\tfulled: ");
			out_label((Obj_Head *)win->fulled, "Awi_fulled");
			save_string(";" NL "\t\tarrowed: ");
			out_label((Obj_Head *)win->arrowed, "Awi_arrowed");
			save_string(";" NL "\t\thslid: ");
			out_label((Obj_Head *)win->hslid, "Awi_hslid");
			save_string(";" NL "\t\tvslid: ");
			out_label((Obj_Head *)win->vslid, "Awi_vslid");
			save_string(";" NL "\t\tsized: ");
			out_label((Obj_Head *)win->sized, "Awi_sized");
			save_string(";" NL "\t\tmoved: ");
			out_label((Obj_Head *)win->moved, "Awi_moved");

#if 0 /* FIXME: missing */
			save_string(";" NL "\t\ticonify: ");
			out_label((Obj_Head *)win->iconify, "Awi_iconify");
			save_string(";" NL "\t\tuniconify: ");
			out_label((Obj_Head *)win->uniconify, "Awi_uniconify");
			save_string(";" NL "\t\tgemscript: ");
			out_label((Obj_Head *)win->gemscript, "Awi_gemscript");
			save_string(";" NL "\t\thelp_title: ");
			out_label((Obj_Head *)win->help_title, "NIL");
			save_string(";" NL "\t\thelp_file: ");
			out_label((Obj_Head *)win->help_file, "NIL");
#endif

			save_string(NL "\t);" NL NL);
		}
	}
}


void pp_output(ACS_HEAD *acs)
{
	time_t t;
	char filename[__PS__];
	char *p;
	char *dot;
	int fd;
	
	p = strrchr(acs->filename, PATH_SEP) + 1;
	strcpy(filename, acs->filename);
	dot = strrchr(filename, '.'); /* BUG: will also find dot in directory names */
	/* BUG: no null pointer check */
	strcpy(dot, ".I"); /* FIXME: make lowercase */
	fd = (int)Fcreate(filename, 0);
	if (fd < 0)
	{
		ACSblk->ACSerror(AE_CREATE_IO, p);
	} else
	{
		info_start(filename);
		info_title("Pure PASCAL Code");
		if (setjmp(*set_handle(fd)) != 0)
		{
			ACSblk->ACSerror(AE_WRITE_IO, NULL);
		} else
		{
			t = time(NULL);
			*dot = '\0';
			sprintf(iostring, pp_welcome, ctime(&t), acs->filename);
			save_string(iostring);
			save_string(NL "(*\t\tPlatform & GUI-Language\t\t*)" NL);
			save_string("(*$DEFINE ACS_ATARI*)" NL);

			sprintf(iostring, "(*$DEFINE ACS_LANG%d*)" NL, acs->language + 1);
			save_string(iostring);

			if (acs->flags & ACS_PROTOTYPES)
				out_declproto(acs);
			
			save_string("Const" NL);
			
			out_string(acs->al_list, NL "(*\t\tALERT BOXES\t\t*)" NL);
			out_string(acs->st_list, NL "(*\t\tSTRINGS\t\t*)" NL);

			out_data(acs->if_list);
			out_tedi(acs->te_list);
			out_user(acs->us_list);
			out_icon(acs->ic_list);
			out_image(acs->im_list);
			out_obj(acs->me_list, NL "(*\t\tMENU TREES\t\t*)" NL);
			out_obj(acs->pu_list, NL "(*\t\tPOPUP TREES\t\t*)" NL);
			out_obj(acs->ob_list, NL "(*\t\tOBJECT TREES\t\t*)" NL);
			out_window(acs->wi_list);
			out_mouse(acs->mo_list);
			out_acs(acs);
			if (acs->flags & ACS_PROTOTYPES)
				out_refs(acs);
			close_buf();
		}
		info_end();
		Fclose(fd);
	}
}
