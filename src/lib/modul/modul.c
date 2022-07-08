/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Module loader                                         */
/*                      (compatibily version for old and new style modules)   */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include <acsvdi.h>
#include "version.h"


static void *oldbas = NULL;
static char nix[4] = "\0\0\0";

struct ACSmod {
	int32 magic1;
	int32 magic2;
	int16 (*entry)(void);
	Ablk *acsblk;
#if !BETA
	GlobalArray *global; /* only in 2005 version */
#endif
	long funcsAnz;
	funcVersion funcs[];
};

struct ACSoldmod {
	int32 magic1;
	int16 (*entry)(void);
	Ablk *acsblk;
	void **funcs;
};


static boolean PushFuncLists(struct ACSmod *mod);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void Ax_mterm(void *bas)
{
	if (oldbas != NULL)
	{
		if (ACSblk->application || ACSblk->multitask)
		{
			Mfree(oldbas);
		} else
		{
			accgemdos();
			Mfree(oldbas);
			oldgemdos();
		}
	}
	oldbas = bas;
}

/* -------------------------------------------------------------------------- */

/* Load and initialize an ACS-Module (returns OK or FAIL) */
int16 Ash_module(const char *path)
{
	boolean mygemdos;
	boolean oldmodule;
	PD *pd;
	struct ACSmod *mod;
	int16 (*entry)(void);
	int32 res;
	
	if (!ACSblk->application && !ACSblk->multitask)
		mygemdos = TRUE;
	else
		mygemdos = FALSE;
	if (mygemdos)
		accgemdos();
	/* just load, dont't go */
	res = Pexec(3, path, (void *)nix, (void *)nix);
	pd = (PD *)res;
	/*
	 * FIXME: assumes that entry point is just behind basepage,
	 * which is not true for binutils
	 */
	mod = (struct ACSmod *)(pd + 1);
	if (res < 0 || res == 0xffffL)
	{
		if (mygemdos)
			oldgemdos();
		ACSblk->ACSerror(AE_LOAD_MOD, path);
		return FAIL;
	}
	/*
	 * BUG: why +1024? that may exceed TPA size
	 */
#ifdef __GNUC__
	if (Mshrink(pd, pd->p_tlen + pd->p_dlen + pd->p_blen + 1024) != 0)
#else
	if (Mshrink(0, pd, pd->p_tlen + pd->p_dlen + pd->p_blen + 1024) != 0)
#endif
		ACSblk->ACSerror(AE_MEM_MOD, path);
	if (mod->magic1 >= 0x41435336L && mod->magic1 <= 0x41435337L) /* 'ACS6', 'ACS7' */
	{
		oldmodule = TRUE;
	} else if ((mod->magic1 < 0x41435330L || mod->magic1 > 0x41435338l) && /* 'ACS0', 'ACS8' */
		/* this is clr.w -(a7); trap #1 */
		(mod->magic1 == 0x42674E41L && mod->magic2 == 0x41435339L)) /* ACS9 */
	{
		oldmodule = FALSE;
	} else
	{
		Mfree(pd);
		if (mygemdos)
			oldgemdos();
		ACSblk->ACSerror(AE_VER_MOD, path);
		return FAIL;
	}
	if (!oldmodule && PushFuncLists(mod) == FALSE)
	{
		Mfree(pd);
		if (mygemdos)
			oldgemdos();
		ACSblk->ACSerror(AE_VER_MOD, path);
		return FAIL;
	}
	if (mygemdos)
		oldgemdos();
	/* just go */
	if (!oldmodule && Pexec(4, NULL, (void *)pd, NULL) != 0)
	{
		if (mygemdos)
			accgemdos();
		Mfree(pd);
		if (mygemdos)
			oldgemdos();
		ACSblk->ACSerror(AE_LOAD_MOD, path);
		return FAIL;
	}
	if (oldmodule)
	{
#ifndef __GNUC__ /* silence compiler; already checked above */
		if (mod->magic1 >= 0x41435336L && mod->magic1 <= 0x41435337L) /* 'ACS6', 'ACS7' */
#endif
		{
			entry = ((struct ACSoldmod *)mod)->entry;
			((struct ACSoldmod *)mod)->acsblk = ACSblk;
			((struct ACSoldmod *)mod)->funcs = mod->magic1 == 0x41435336L ? ACS230 : ACS233;
		}
	} else
	{
		entry = mod->entry;
		mod->acsblk = ACSblk;
#if !BETA
		mod->global = _globl;
#endif
	}
	return entry();
}

/* -------------------------------------------------------------------------- */

static boolean PushFuncLists(struct ACSmod *mod)
{
	funcVersion *modfuncs;
	const funcListe *liste;
	int i;
	int16 version;
	int j;
	const funcVersion *myfuncs;

	modfuncs = mod->funcs;
	liste = funcs;
	if (mod->funcsAnz != funcsAnz)
		return FALSE;
	for (i = 0; i < funcsAnz; i++, modfuncs++, liste++)
	{
		version = modfuncs->version;
		modfuncs->funcs = NULL;
		j = 0;
		myfuncs = liste->funcs;
		while (modfuncs->funcs == NULL && j < *liste->versionen)
		{
			if (myfuncs->version == version)
				modfuncs->funcs = myfuncs->funcs;
			j++;
			myfuncs++;
		}
		if (modfuncs->funcs == NULL)
			return FALSE;
	}
	return TRUE;
}
