#include	<acs.h>
#include	"ab_cfg.h"

typedef struct
{
	void *user;
	boolean (*service)(Awindow *a, int16 task, void *in_out);
	Awindow *(*create)(void *a);
	int16 (*open)(Awindow *a);
	int16 (*init)(Awindow *a);
	OBJECT *work;
	OBJECT *toolbar;
	int16 ob_edit, ob_col;
	int16 wi_id;
	int16 wi_kind;
	Axywh wi_act;
	Axywh wi_normal;
	Axywh wi_work;
	Axywh wi_slider;
	int16 wi_nx, wi_ny;
	int16 snap_mask;
	char *name;
	char *info;
	int16 ob_len;
	int16 kind;
	int16 state;
	int16 icon;
	CICONBLK *iconblk;
	OBJECT *menu;
	int16 (*keys)(Awindow *x, int16 kstate, int16 key);
	void (*obchange)(Awindow *a, int16 obnr, int16 new_state);
	void (*redraw)(Awindow *a, Axywh *b);
	void (*topped)(Awindow *a);
	void (*closed)(Awindow *a);
	void (*fulled)(Awindow *a);
	void (*arrowed)(Awindow *a, int16 which, int16 amount);
	void (*hslid)(Awindow *a, int16 pos);
	void (*vslid)(Awindow *a, int16 pos);
	void (*sized)(Awindow *a, Axywh *b);
	void (*moved)(Awindow *a, Axywh *b);
} Awindow23x;

typedef struct
{
	int16 CDECL (*ub_code)(struct parm_block *pb);
	int32 ub_parm;
	boolean (*ub_serv)(struct object *entry, int16 task, void *in_out);
	void *ub_ptr1;
	void *ub_ptr2;
	void *ub_ptr3;
} AUSERBLK230;

#include	"ab_cfg.ah"

int16 ACSinit(void)
{
	if (NULL == F_CFG.create(NULL))
		ACSmoduleterm();
	return OK;
}
