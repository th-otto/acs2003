/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Userdef cycle                                         */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

typedef struct {
	char *act;
	char *pos;
	char *popup;
	Awiob self;
} CYCDATA;

static AUSERBLK a3dproto = { A_3Dbutton, 0x09f10178L, Auo_string, "", NULL, NULL, NULL, NULL };

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 CDECL A_cycle(PARMBLK *pb)
{
	int16 clip[6];
	int16 pxy[10];
	int16 pxy2[10];
	int16 y;
	int16 x;
	int16 w;
	int16 dummy;
	int16 fwidth;
	int16 numchars;
	char c;
	char *end;
	char cyclechar[] = "\002";
	AUSERBLK *auser;
	OBJECT *obj;
	CYCDATA *data;
	
	if (pb->pb_wc != 0 || pb->pb_hc != 0)
	{
		clip[0] = pb->pb_xc;
		clip[1] = pb->pb_yc;
		clip[2] = pb->pb_xc + pb->pb_wc - 1;
		clip[3] = pb->pb_yc + pb->pb_hc - 1;
		vs_clip(ACSblk->vdi_handle, TRUE, clip);
	} else
	{
		vs_clip(ACSblk->vdi_handle, FALSE, clip);
	}
	
	if ((pb->pb_currstate ^ pb->pb_prevstate) == 0)
	{
		obj = &pb->pb_tree[pb->pb_obj];
		auser = obj->ob_spec.auserblk;
		data = auser->ub_ptr2;
		
		w = pb->pb_w - 2 * ACSblk->gl_wbox - 1;
		clip[2] = pxy2[4] = pxy2[6] =
		    (pxy2[0] = pxy2[2] = pxy2[8] =
		     (pxy[4] = pxy[6] =
		      (clip[0] = pxy[0] = pxy[2] = pxy[8] = pb->pb_x) + w) + 1) + ACSblk->gl_wbox * 2;
		clip[3] = pxy2[1] = pxy[1] = pxy2[7] = pxy[7] = pxy2[9] = pxy[9] = (clip[1] = pxy2[3] = pxy[3] = pxy2[5] = pxy[5] = pb->pb_y) + pb->pb_h;
		vswr_mode(ACSblk->vdi_handle, MD_REPLACE);
 		vsl_width(ACSblk->vdi_handle, 1);
 		vsl_type(ACSblk->vdi_handle, LT_SOLID);
 		vsl_ends(ACSblk->vdi_handle, 0, 0);
 		vsf_interior(ACSblk->vdi_handle, FIS_SOLID);
 		vsf_perimeter(ACSblk->vdi_handle, TRUE);
 		if ((auser->ub_parm & ACS_CYCLE_3D) && ACSblk->nplanes >= 4 && !(ACSblk->description->flags & AB_NO3D))
 		{
 			vsf_color(ACSblk->vdi_handle, G_LWHITE);
 			v_bar(ACSblk->vdi_handle, clip);
 			vsl_color(ACSblk->vdi_handle, (int16)(auser->ub_parm & ACS_CYCLE_OUTCOL));
 			v_pline(ACSblk->vdi_handle, 3, pxy);
 			v_pline(ACSblk->vdi_handle, 3, pxy2);
 			vsl_color(ACSblk->vdi_handle, (int16)((auser->ub_parm >> 4) & (ACS_CYCLE_INCOL >> 4)));
 			v_pline(ACSblk->vdi_handle, 3, &pxy[4]);
 			v_pline(ACSblk->vdi_handle, 3, &pxy2[4]);
 		} else
 		{
 			vsf_color(ACSblk->vdi_handle, G_WHITE);
 			v_bar(ACSblk->vdi_handle, clip);
 			vsl_color(ACSblk->vdi_handle, G_BLACK);
 			v_pline(ACSblk->vdi_handle, 3, pxy);
 			v_pline(ACSblk->vdi_handle, 2, &pxy[6]);
 			dotted_yline(pxy[5], pxy[7], pxy[6]);
 			vsl_type(ACSblk->vdi_handle, LT_SOLID);
 			v_pline(ACSblk->vdi_handle, 4, &pxy2[2]);
 		}
 		
 		y = ((pb->pb_h - ACSblk->gl_hbox) >> 1) + pb->pb_y;
 		vst_rotation(ACSblk->vdi_handle, 0);
 		vst_color(ACSblk->vdi_handle, G_BLACK);
 		vst_alignment(ACSblk->vdi_handle, TA_LEFT, TA_TOP, &dummy, &dummy);
 		vst_effects(ACSblk->vdi_handle, TF_NORMAL);
 		vst_font(ACSblk->vdi_handle, ACSblk->fontid);
 		vst_height(ACSblk->vdi_handle, ACSblk->fheight, &dummy, &dummy, &fwidth, &dummy);
 		vswr_mode(ACSblk->vdi_handle, MD_TRANS);
 		vsl_color(ACSblk->vdi_handle, G_BLACK);
 		x = pb->pb_x + pb->pb_w - ACSblk->gl_wbox - ((ACSblk->gl_wbox - 2) >> 1) - 1;
 		c = (char)(auser->ub_parm >> 8);
 		if (c != 0)
 			cyclechar[0] = c;
 		v_gtext(ACSblk->vdi_handle, x, y, cyclechar);
 		if (pb->pb_currstate & OS_SHADOWED)
 		{
 			clip[0] = pb->pb_x + 1;
 			clip[3] = clip[1] = pb->pb_y + pb->pb_h + 1;
 			clip[4] = clip[2] = pb->pb_x + pb->pb_w + 1;
 			clip[5] = pb->pb_y + 1;
 			v_pline(ACSblk->vdi_handle, 3, clip);
 		}
 		if (data->act != NULL)
 		{
 			vswr_mode(ACSblk->vdi_handle, MD_TRANS);
 			numchars = pb->pb_w / ACSblk->gl_wbox - 2;
 			if (numchars < 0)
 				numchars = 0;
 			if (numchars < strlen(data->act))
 			{
 				end = data->act + numchars;
 				c = *end;
 				*end = '\0';
 				v_gtext(ACSblk->vdi_handle, pb->pb_x + 1, y, data->act);
 				*end = c;
 			} else
 			{
 				v_gtext(ACSblk->vdi_handle, pb->pb_x + 1, y, data->act);
 			}
 		}
	}
	
	vs_clip(ACSblk->vdi_handle, FALSE, clip);
	return pb->pb_currstate & ~(OS_OUTLINED | OS_SELECTED);
}

/* -------------------------------------------------------------------------- */

static void setit(CYCDATA *data, char *str)
{
	char *ptr;
	int i;
	
#if !WITH_FIXES
	Ax_ifree(data->act);
#endif
	for (ptr = str, i = 0; strchr("|]", *ptr) == NULL; )
	{
		ptr++;
		i++;
	}
	ptr = Ax_malloc(i + 1);
#if WITH_FIXES
	if (ptr == NULL)
		return;
	Ax_ifree(data->act);
#endif
	if (i > 0)
		strncpy(ptr, str, i);
	ptr[i] = '\0';
	data->act = ptr;
}

/* -------------------------------------------------------------------------- */

static char *next_entry(char *str)
{
	while (TRUE)
	{
		if (*str == '\0')
			break;
		if (*str == ']')
		{
			str++;
			if (*str != '|')
				break;
		}
		if (*str == '|')
		{
			str++;
			break;
		}
		str++;
	}
	
	return str;
}

/* -------------------------------------------------------------------------- */

static void next(CYCDATA *data)
{
	char *pos;
	
	pos = next_entry(data->pos);
	if (*pos == '\0')
		pos = data->popup;
	while (*pos == '[')
		pos = next_entry(pos);
	data->pos = pos;
	setit(data, pos);
}

/* -------------------------------------------------------------------------- */

static void make_popup(CYCDATA *data)
{
	data->act = NULL;
	data->pos = "";
	next(data);
}

/* -------------------------------------------------------------------------- */

static void cyc_getindex(CYCDATA *data, int16 *in_out)
{
	int16 i;
	int16 len;
	char *str;
	
	len = (int)strlen(data->act);
	str = data->popup;
	i = 0;
	while (TRUE)
	{
		if (*str != '[')
		{
			if (strncmp(data->act, str, len) == 0)
			{
				if (str[len] == '\0' || str[len] == '|')
				{
					*in_out = i;
					break;
				}
			}
			i++;
		}
		str = strchr(str, '|');
		if (str == NULL)
		{
			*in_out = -1;
			break;
		}
		str++;
	}
}

/* -------------------------------------------------------------------------- */

static void cyc_index(CYCDATA *data, int16 *in_out)
{
	int16 i;
	
	i = *in_out + 1;
	data->pos = "";
	while (i-- > 0)
		next(data);
}

/* -------------------------------------------------------------------------- */

boolean Auo_cycle(OBJECT *entry, int16 task, void *in_out)
{
	Awiob *ob;
	Awindow *win;
	AUSERBLK *auser;
	CYCDATA *data;
	
	auser = entry->ob_spec.auserblk;
	data = auser->ub_ptr2;
	
	switch (task)
	{
	case AUO_CREATE:
		data = Ax_malloc(sizeof(*data));
		if (data != NULL)
		{
			memset(data, 0, sizeof(*data));
			if (auser->ub_ptr1 != NULL)
				data->popup = Ast_create(auser->ub_ptr1);
			else
				data->popup = Ast_create("");
			if (data->popup != NULL)
			{
				auser->ub_ptr2 = data;
				make_popup(data);
			} else
			{
				*((int16 *)in_out) = FAIL;
			}
		} else
		{
			*((int16 *)in_out) = FAIL;
		}
		break;
	
	case AUO_TERM:
		if (data->popup != NULL)
			Ast_delete(data->popup);
		if (data->act != NULL)
			Ax_free(data->act);
		Ax_free(auser->ub_ptr2);
		break;
	
	case AUO_SETVAL:
		setit(data, in_out);
		break;
	
	case AUO_SELF:
		ob = in_out;
		data->self.window = ob->window;
		data->self.entry = ob->entry;
		data->self.obnr = ob->obnr;
		break;
	
	case AUO_GETVAL:
		*((char **)in_out) = data->act;
		break;
	
	case AUO_UPDATE:
	case AUO_FULLUPDATE:
		win = data->self.window;
		if (win == NULL)
			break;
		win->obchange(win, data->self.obnr, -1);
		break;
	
	case AUO_CYCINDEX:
		cyc_index(data, in_out);
		break;
	
	case AUO_CYCGETINDEX:
		cyc_getindex(data, in_out);
		break;
	
	case AUO_CYCPOPUP:
		Ax_free(data->popup);
		data->popup = Ast_create(in_out);
		if (data->popup == NULL)
			data->popup = Ast_create("");
		make_popup(data);
		break;
	
	case AUO_GETBUBBLE:
	case AUO_GETCONTEXT:
		break;
	
	default:
		return FALSE;
	}
	
	return TRUE;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void count_it(const char *popup, int16 *count, int16 *submenus)
{
	const char *str;
	
	str = popup;
	*count = 1;
	while (*str != '\0')
	{
		if (*str == '|')
			++(*count);
		if (*str == ']' && str[1] != '|')
			++(*count);
		str++;
	}
	str = popup;
	*submenus = *count + 1;
	while (*str != '\0')
	{
		if (*str == '[')
			++(*submenus);
		str++;
	}
}

/* -------------------------------------------------------------------------- */

static void make_panel(OBJECT *tree, int16 *pobnr, int16 width, const char **popup, char **strings, AUSERBLK **auserblk, const char *act, int16 stringlen, boolean auser)
{
	OBJECT *obj;
	OBJECT *tailptr;
	char *str;
	int16 obnr;
	int16 tail;
	int16 height;
	int16 i;
	boolean submenu;
	boolean submenuend;
	
	obnr = *pobnr;
	obj = &tree[obnr];
	obj->ob_next = obnr - 1;
	obj->ob_head = obnr + 1;
	obj->ob_type = G_BOX;
	obj->ob_flags = OF_HIDETREE;
	obj->ob_state = OS_SHADOWED;
	obj->ob_spec.index = 0xFF1001L;
	obj->ob_x = obj->ob_y = 0;
	obj->ob_width = width;
#if WITH_FIXES
	/* FIXME: maybe wrong with empty popup */
	tailptr = obj;
	tail = NIL;
#endif
	height = 0;
	++(*pobnr);
	submenuend = FALSE;
	while (**popup != '\0' && !submenuend)
	{
		tail = *pobnr;
		tailptr = &tree[tail];
		++(*pobnr);
		if (**popup == '[')
		{
			tailptr->ob_head = tailptr->ob_tail = *pobnr;
			if (auser)
				tailptr->ob_type = G_USERDEF;
			else
				tailptr->ob_type = G_TITLE;
			submenu = TRUE;
			++(*popup);
		} else
		{
			tailptr->ob_head = tailptr->ob_tail = NIL;
			if (auser)
				tailptr->ob_type = G_USERDEF;
			else
				tailptr->ob_type = G_STRING;
			submenu = FALSE;
		}
		if (*popup == act)
			tailptr->ob_state = OS_CHECKED;
		else
			tailptr->ob_state = OS_NORMAL;
		str = *strings;
		if (auser)
		{
			tailptr->ob_spec.auserblk = *auserblk;
			memcpy(*auserblk, &a3dproto, sizeof(a3dproto));
			(*auserblk)->ub_ptr1 = str;
			++(*auserblk);
		} else
		{
			tailptr->ob_spec.free_string = str;
		}
		*strings += stringlen;
		str[0] = str[1] = ' ';
		str += 2;
		for (i = stringlen - 3; **popup != '\0' && **popup != '|'; (*popup)++)
		{
			if (**popup == ']')
			{
				submenuend = TRUE;
				if ((*popup)[1] == '|')
					++(*popup);
				break;
			}
			if (i > 0)
			{
				*str = **popup;
				str++;
				i--;
			}
		}
		*str = '\0';
		if (**popup != '\0')
			++(*popup);
		if (submenu)
			make_panel(tree, pobnr, width, popup, strings, auserblk, act, stringlen, auser);
		tailptr->ob_flags = OF_SELECTABLE;
		tailptr->ob_y = height * ACSblk->gl_hbox;
		tailptr->ob_height = ACSblk->gl_hbox;
		tailptr->ob_x = 0;
		tailptr->ob_width = width;
		tailptr->ob_next = *pobnr;
		height++;
		if (!submenuend && **popup == ']')
		{
			if ((*popup)[1] == '|')
				++(*popup);
			++(*popup);
			break;
		}
	}
	tailptr->ob_next = obnr;
	obj->ob_height = ACSblk->gl_hbox * height;
	obj->ob_tail = tail;
}

/* -------------------------------------------------------------------------- */

static OBJECT *create_popup(const char *popup, const char *chk, int16 width, boolean auser)
{
	OBJECT *tree;
	int16 numchars;
	int16 count;
	int16 submenus;
	int16 obnr;
	const char *ppopup;
	char *strings;
	AUSERBLK *auserblk;
	
	count_it(popup, &count, &submenus);
	numchars = (width + ACSblk->gl_wbox - 1) / ACSblk->gl_wbox;
	if (numchars < 0)
		numchars = 0;
	numchars += 3;
	if (auser)
	{
		tree = Ax_malloc(submenus * sizeof(OBJECT) + (count * numchars) + count * sizeof(AUSERBLK));
	} else
	{
		tree = Ax_malloc(submenus * sizeof(OBJECT) + (count * numchars));
	}
	if (tree == NULL)
		return NULL;
	
	obnr = 0;
	strings = (char *)(tree + submenus);
	auserblk = (AUSERBLK *)(strings + count * numchars);
	ppopup = popup;
	make_panel(tree, &obnr, width, &ppopup, &strings, &auserblk, chk, numchars, auser);
	tree[ROOT].ob_next = NIL;
	tree[ROOT].ob_flags &= ~OF_HIDETREE;
	tree[ROOT].ob_state |= AOS_FIXED;
	tree[obnr - 1].ob_flags |= OF_LASTOB;
	return tree;
}

/* -------------------------------------------------------------------------- */

char *Ame_strpopup(Awindow *win, const char *popup, const char *chk, int16 width, int16 x, int16 y)
{
	OBJECT *tree;
	int16 sel;
	boolean threed;
	char *pos;
	char *str;
	ssize_t len;
	
	threed = !(ACSblk->description->flags & AB_NO3D) && ACSblk->nplanes >= 4;
	tree = create_popup(popup, chk, width, threed);
	if (tree != NULL)
	{
		sel = Ame_popup(win, tree, x, y);
		if (sel >= 0)
		{
			if (threed)
				str = (char *)tree[sel].ob_spec.auserblk->ub_ptr1 + 2;
			else
				str = tree[sel].ob_spec.free_string + 2;
			len = strlen(str);
			pos = strstr(popup, str);
			while (strchr("[]|", pos[len]) == NULL)
				pos = strstr(pos + 1, str);
		} else
		{
			pos = NULL;
		}
		Ax_free(tree);
		return pos;
	}
	return NULL;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Aus_cycle(void)
{
	Awiob ob;
	OBJECT *tree;
	OBJECT *obj;
	char *str;
	AUSERBLK *auser;
	CYCDATA *data;
	int16 x;
	int16 y;
	int16 x2;
	int16 x3;
	int16 w;
	int16 obnr;
	
	tree = ACSblk->ev_object;
	obnr = ACSblk->ev_obnr;
	objc_offset(tree, obnr, &x, &y);
	obj = &tree[obnr];
	auser = obj->ob_spec.auserblk;
	w = obj->ob_width;
	x += ACSblk->ev_window->wi_work.x;
	x2 = x + w;
	x3 = x2 - 2 * ACSblk->gl_wbox;
	data = auser->ub_ptr2;
	if (ACSblk->ev_mmox >= x3 && ACSblk->ev_mmox < x2)
	{
		next(data);
	} else
	{
		y += ((obj->ob_height - ACSblk->gl_hbox) >> 1) + ACSblk->ev_window->wi_work.y;
		x2 = ACSblk->description->flags;
		a3dproto.ub_parm = (a3dproto.ub_parm & ~(ACS_3DBUTTON_INCOL | ACS_3DBUTTON_OUTCOL)) |
			((auser->ub_parm & ACS_CYCLE_OUTCOL) << 12) |
			((auser->ub_parm & ACS_CYCLE_INCOL) << 20);
		if (!(auser->ub_parm & ACS_CYCLE_3D))
			ACSblk->description->flags |= AB_NO3D;
		str = Ame_strpopup(ACSblk->ev_window, data->popup, data->pos, w, x, y);
		ACSblk->description->flags = x2;
		a3dproto.ub_parm = 0x09f10178L;
		if (str != NULL)
		{
			data->pos = str;
			setit(data, str);
		}
	}
	ob.window = ACSblk->ev_window;
	ob.entry = obj;
	if (ACSblk->ev_window->toolbar == ACSblk->ev_object)
		ob.obnr = obnr | A_TOOLBAR;
	else
		ob.obnr = obnr;
	auser->ub_serv(obj, AUO_SELF, &ob);
	auser->ub_serv(obj, AUO_UPDATE, NULL);
}
