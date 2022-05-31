/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Edit OBJECT flags                                     */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "country.h"

static void edafl_ok(void);

#include "edobaflm.ah"
#include "edobaflm.h"

static SUBMODE ea_sm = { NULL, edafl_ok, Aob_delete, NULL, help_title, NULL };

static char edafl_wintitle[128];

static void ea_duostate(void);
static void ea_tristate(void);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static void set_it(OBJECT *tree, int16 obnr, int16 mask, uint16 *flags)
{
	OBJECT *obj = &tree[tree[obnr].ob_head];

	if (!(obj->ob_state & OS_DISABLED))
	{
		if (obj->ob_state & OS_SELECTED)
			*flags |= mask;
		else
			*flags &= ~mask;
	}
}

/* -------------------------------------------------------------------------- */

static void edafl_ok(void)
{
	Awindow *self;
	OBJEDPARM *parm;
	OBJECT *tree;
	ACS_HEAD *acs;
	OBJ_ENTRY *objtree;
	OBJ_ENTRY *entry;
	int16 *select;
	int16 count;
	uint16 *flags;
	
	self = ACSblk->ev_window;
	parm = self->user;
	tree = self->work;
	acs = parm->acs;
	acs->flags |= ACS_CHANGED;
	objtree = parm->obj->object;
	if ((select = parm->select) != NULL)
	{
		count = *select++;
		Amo_busy();
		while (count-- > 0)
		{
			entry = &objtree[*select++];
			flags = &entry->obj.ob_flags;
			set_it(tree, ED_AFLAGS_EXIT, OF_EXIT, flags);
			set_it(tree, ED_AFLAGS_TOUCHEXIT, OF_TOUCHEXIT, flags);
			set_it(tree, ED_AFLAGS_DEFAULT, OF_DEFAULT, flags);
			set_it(tree, ED_AFLAGS_DEFABLE, AO_DEFABLE, flags);
			set_it(tree, ED_AFLAGS_SELECTABLE, OF_SELECTABLE, flags);
			if (!(tree[ED_AFLAGS_EDITABLE].ob_flags & OF_HIDETREE))
				set_it(tree, ED_AFLAGS_EDITABLE, OF_EDITABLE, flags);
			set_it(tree, ED_AFLAGS_RBUTTON, OF_RBUTTON, flags);
			set_it(tree, ED_AFLAGS_DRAGABLE, AO_DRAGABLE, flags);
			set_it(tree, ED_AFLAGS_ACCEPT, AO_ACCEPT, flags);
			set_it(tree, ED_AFLAGS_SILENT, AO_SILENT, flags);
			if (!(tree[ED_AFLAGS_3DBOX].ob_flags & OF_HIDETREE))
			{
				*flags &= ~OF_FL3DACT;
				if (tree[ED_AFLAGS_FL3DIND].ob_state & OS_SELECTED)
					*flags |= OF_FL3DIND;
				if (tree[ED_AFLAGS_FL3DBAK].ob_state & OS_SELECTED)
					*flags |= OF_FL3DBAK;
				if (tree[ED_AFLAGS_FL3DACT].ob_state & OS_SELECTED)
					*flags |= OF_FL3DACT;
			}

			flags = &entry->obj.ob_state;
			set_it(tree, ED_AFLAGS_CONST, AOS_CONST, flags);
			set_it(tree, ED_AFLAGS_SELECTED, OS_SELECTED, flags);
			set_it(tree, ED_AFLAGS_DISABLED, OS_DISABLED, flags);
			set_it(tree, ED_AFLAGS_CROSSED, OS_CROSSED, flags);
			set_it(tree, ED_AFLAGS_CHECKED, OS_CHECKED, flags);
			set_it(tree, ED_AFLAGS_OUTLINED, OS_OUTLINED, flags);
			set_it(tree, ED_AFLAGS_SHADOWED, OS_SHADOWED, flags);
			set_it(tree, ED_AFLAGS_CLLEFT, AOS_CLLEFT, flags);
			set_it(tree, ED_AFLAGS_CLBOTTOM, AOS_CLBOTTOM, flags);
			set_it(tree, ED_AFLAGS_CLRIGHT, AOS_CLRIGHT, flags);
			set_it(tree, ED_AFLAGS_CLTOP, AOS_CLTOP, flags);
		}
		Amo_unbusy();
		ed_abort();
	}
}

/* -------------------------------------------------------------------------- */

static void preset_it(OBJECT *tree, int16 obnr, boolean selected, boolean enabled, int16 count)
{
	OBJECT *obj;
	
	obj = &tree[tree[obnr].ob_head];
	if (selected || enabled)
		obj->ob_state &= ~OS_DISABLED;
	if (selected)
		obj->ob_state |= OS_SELECTED;
	if (count == 1)
		((AOBJECT *)(&tree[obnr] + 1))->click = ea_duostate;
	else
		((AOBJECT *)(&tree[obnr] + 1))->click = ea_tristate;
}

/* -------------------------------------------------------------------------- */

SUBMODE *set_aflags(OBJ_ENTRY *entry)
{
	OBJECT *tree;
	int16 count;
	uint16 andflags;
	uint16 andstate;
	int16 orflags;
	int16 orstate;
	int16 obnr;
	OBJEDPARM *parm;
	OBJECT *obj;
	
	UNUSED(entry);
	count = 0;
	tree = Aob_create(&ED_AFLAGS);
	if (tree == NULL)
		return NULL;
	ea_sm.tree = tree;
	parm = ACSblk->ev_window->user;
	andflags = 0xffff;
	andstate = 0xffff;
	orflags = 0;
	orstate = 0;
	Amo_busy();
	Adr_start();
	while ((obnr = Adr_next()) >= 0)
	{
		OBJ_ENTRY *e = (OBJ_ENTRY *)parm->obj->object + (obnr - 2) / 3;
		obj = &e->obj;
		andstate &= obj->ob_state;
		orstate |= obj->ob_state;
		andflags &= obj->ob_flags;
		orflags |= obj->ob_flags;
		count++;
	}
	
	if (count == 1)
	{
		strcpy(edafl_wintitle, title1);
		switch (obj->ob_flags & OF_FL3DACT)
		{
		case OF_FL3DIND:
			tree[ED_AFLAGS_FL3DIND].ob_state |= OS_SELECTED;
			break;
		case OF_FL3DBAK:
			tree[ED_AFLAGS_FL3DBAK].ob_state |= OS_SELECTED;
			break;
		case OF_FL3DACT:
			tree[ED_AFLAGS_FL3DACT].ob_state |= OS_SELECTED;
			break;
		default:
			tree[ED_AFLAGS_FL3DNONE].ob_state |= OS_SELECTED;
			break;
		}
	} else
	{
		sprintf(edafl_wintitle, titlemore, count);
		tree[ED_AFLAGS_3DBOX].ob_flags |= OF_HIDETREE;
	}
	
	ea_sm.title = edafl_wintitle;
	
	preset_it(tree, ED_AFLAGS_EXIT, andflags & OF_EXIT, (orflags & OF_EXIT) == 0, count);
	preset_it(tree, ED_AFLAGS_TOUCHEXIT, andflags & OF_TOUCHEXIT, (orflags & OF_TOUCHEXIT) == 0, count);
	preset_it(tree, ED_AFLAGS_DEFAULT, andflags & OF_DEFAULT, (orflags & OF_DEFAULT) == 0, count);
	preset_it(tree, ED_AFLAGS_DEFABLE, andflags & AO_DEFABLE, (orflags & AO_DEFABLE) == 0, count);
	preset_it(tree, ED_AFLAGS_SELECTABLE, andflags & OF_SELECTABLE, (orflags & OF_SELECTABLE) == 0, count);
	preset_it(tree, ED_AFLAGS_EDITABLE, andflags & OF_EDITABLE, (orflags & OF_EDITABLE) == 0, count);
	preset_it(tree, ED_AFLAGS_RBUTTON, andflags & OF_RBUTTON, (orflags & OF_RBUTTON) == 0, count);
	preset_it(tree, ED_AFLAGS_DRAGABLE, andflags & AO_DRAGABLE, (orflags & AO_DRAGABLE) == 0, count);
	preset_it(tree, ED_AFLAGS_ACCEPT, andflags & AO_ACCEPT, (orflags & AO_ACCEPT) == 0, count);
	preset_it(tree, ED_AFLAGS_SILENT, andflags & AO_SILENT, (orflags & AO_SILENT) == 0, count);

	preset_it(tree, ED_AFLAGS_CONST, andstate & AOS_CONST, (orstate & AOS_CONST) == 0, count);
	preset_it(tree, ED_AFLAGS_SELECTED, andstate & OS_SELECTED, (orstate & OS_SELECTED) == 0, count);
	preset_it(tree, ED_AFLAGS_DISABLED, andstate & OS_DISABLED, (orstate & OS_DISABLED) == 0, count);
	preset_it(tree, ED_AFLAGS_CROSSED, andstate & OS_CROSSED, (orstate & OS_CROSSED) == 0, count);
	preset_it(tree, ED_AFLAGS_CHECKED, andstate & OS_CHECKED, (orstate & OS_CHECKED) == 0, count);
	preset_it(tree, ED_AFLAGS_OUTLINED, andstate & OS_OUTLINED, (orstate & OS_OUTLINED) == 0, count);
	preset_it(tree, ED_AFLAGS_SHADOWED, andstate & OS_SHADOWED, (orstate & OS_SHADOWED) == 0, count);
	preset_it(tree, ED_AFLAGS_CLLEFT, andstate & AOS_CLLEFT, (orstate & AOS_CLLEFT) == 0, count);
	preset_it(tree, ED_AFLAGS_CLBOTTOM, andstate & AOS_CLBOTTOM, (orstate & AOS_CLBOTTOM) == 0, count);
	preset_it(tree, ED_AFLAGS_CLRIGHT, andstate & AOS_CLRIGHT, (orstate & AOS_CLRIGHT) == 0, count);
	preset_it(tree, ED_AFLAGS_CLTOP, andstate & AOS_CLTOP, (orstate & AOS_CLTOP) == 0, count);
	
	Amo_unbusy();
	
	return &ea_sm;
}

/* -------------------------------------------------------------------------- */

static void ea_tristate(void)
{
	OBJECT *obj = &ACSblk->ev_object[ACSblk->ev_object[ACSblk->ev_obnr].ob_head];

	if (obj->ob_state & OS_DISABLED)
	{
		obj->ob_state |= OS_SELECTED;
		obj->ob_state &= ~OS_DISABLED;
	} else if (obj->ob_state & OS_SELECTED)
	{
		obj->ob_state &= ~OS_SELECTED;
	} else
	{
		obj->ob_state |= OS_DISABLED;
	}
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	Aev_release();
}

/* -------------------------------------------------------------------------- */

static void ea_duostate(void)
{
	OBJECT *obj = &ACSblk->ev_object[ACSblk->ev_object[ACSblk->ev_obnr].ob_head];

	if (obj->ob_state & OS_SELECTED)
	{
		obj->ob_state &= ~OS_SELECTED;
	} else
	{
		obj->ob_state |= OS_SELECTED;
	}
	ACSblk->ev_window->obchange(ACSblk->ev_window, ACSblk->ev_obnr, -1);
	Aev_release();
}
