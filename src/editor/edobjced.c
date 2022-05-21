#include "acs_i.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/*
 * called by li_newwi
 */
Awindow *ob_make(void *a)
{
	Obj_Head *userobj;
	Obj_Head *tmpobj;
	EDPARM *parm;
	Obj_Head *obj;
	OBJEDPARM *newparm;
	Awindow *win;
	char *mem;
	OBJEDPARM *tmpparm;
	OBJ_ENTRY *entries;
	AUSERBLK *olduser;
	char *strs[6];
	char *tmp[8];
	int count;
	
	parm = a;
	obj = parm->obj;
	win = obj->window;
	if (win != NULL)
	{
		Awi_show(win);
	} else
	{
		newparm = Ax_malloc(sizeof(*newparm));
		if (newparm == NULL)
			return NULL;
		newparm->acs = parm->acs;
		newparm->obj = parm->obj;
		newparm->flags = 1;
		newparm->active = 2;
		newparm->act_obnr = 0;
		newparm->select = NULL;
		WI_OBJECT.iconblk->monoblk.ib_ptext = WI_OBJECT.info = obj->label;
		win = Awi_create(&WI_OBJECT);
		if (win == NULL)
		{
			Ax_free(newparm);
			return NULL;
		}
		wi_pos(win, &obj->pos, &parm->acs->last_rez);
		win->user = newparm;
		obj->window = win;
		
		/* why only 31 here per element? */
		mem = Ax_malloc((6 * (LABEL_MAX - 1)) + 2 * STRING_MAX);
		tmp[0] = mem;
		if (mem == NULL)
		{
			/* FIXME: leaks memory allocated above */
			return NULL;
		}
		mem += LABEL_MAX - 1;
		tmp[1] = mem; /* ub_parm */
		mem += LABEL_MAX - 1;
		tmp[2] = mem; /* ub_serv */
		mem += LABEL_MAX - 1;
		tmp[3] = mem; /* ub_ptr1 */
		mem += LABEL_MAX - 1;
		tmp[4] = mem; /* ub_ptr2 */
		mem += LABEL_MAX - 1;
		tmp[5] = mem; /* ub_ptr3 */
		mem += LABEL_MAX - 1;
		tmp[6] = mem; /* bubble */
		mem += STRING_MAX;
		tmp[7] = mem; /* context */
		strcpy(tmp[0], "A_checkbox");
		
		strs[0] = tmp[0];
		strs[1] = tmp[1];
		strs[2] = tmp[2];
		strs[3] = tmp[3];
		strs[4] = tmp[4];
		strs[5] = tmp[5];
		
		tmpparm = win->user;
		tmpobj = tmpparm->obj;
		entries = tmpobj->object;
		for (count = (int)(tmpobj->used / sizeof(*entries)); entries != NULL && count != 0; entries++, count--)
		{
			if (entries != NULL &&
				(char)entries->obj.ob_type == G_USERDEF)
			{
				userobj = (Obj_Head *)entries->obj.ob_spec.auserblk;
				if (userobj != NULL)
				{
					/* XXX uses d2 instead of d1 for check */
					olduser = userobj->object;
					if (olduser != NULL)
					{
						if (strcmp(((Obj_Head *)olduser->ub_code)->label, "A_radiobutton") == 0)
						{
							Obj_Head *newobj;
			
							set_ref((Obj_Head *)olduser->ub_parm, tmp[1]);
							set_ref((Obj_Head *)olduser->ub_serv, tmp[2]);
							set_ref((Obj_Head *)olduser->ub_ptr1, tmp[3]);
							set_ref((Obj_Head *)olduser->ub_ptr2, tmp[4]);
							set_ref((Obj_Head *)olduser->ub_ptr3, tmp[5]);
							if (olduser->bubble == NULL)
								tmp[6][0] = '\0';
							else
								strcpy(tmp[6], ((Obj_Head *)olduser->bubble)->object);
							if (olduser->context == NULL)
								tmp[7][0] = '\0';
							else
								strcpy(tmp[7], ((Obj_Head *)olduser->context)->object);
							newobj = change_user(tmpparm->acs, userobj, strs);
							if (newobj != NULL)
								entries->obj.ob_spec.auserblk = (AUSERBLK *)newobj;
						}
					}
				}
			}
		}
#if WITH_FIXES
		Ax_free(tmp[0]);
#else
		Ax_free(tmp); /* BUG: should be first element */
#endif
		if (win->open(win) != OK)
		{
			ed_term(win);
			return NULL;
		}
	}
	return win;
}

