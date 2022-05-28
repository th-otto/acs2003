#include "acs_i.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

UConfig *Acfg_create(const UCfgInfo *info, int16 load)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Acfg_delete(UConfig *config)
{
}

/* -------------------------------------------------------------------------- */

int16 Acfg_flags(UConfig *config, int16 flags, int16 set)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

UCfgInfo *Acfg_createInfo(void)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Acfg_deleteInfo(UCfgInfo *info)
{
}

/* -------------------------------------------------------------------------- */

UCfgInfo *Acfg_copyInfo(UCfgInfo *dest, const UCfgInfo *source)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

UCfgInfo *Acfg_setInfo(UConfig *config, const UCfgInfo *info)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

UCfgInfo *Acfg_getInfo(UConfig *config, UCfgInfo *info)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Acfg_clear(UConfig *cfg, const UCfgInfo *info)
{
}

/* -------------------------------------------------------------------------- */

void Acfg_clearAllGroups(UConfig *config)
{
}

/* -------------------------------------------------------------------------- */

void Acfg_clearGroup(UConfig *config, char *kategorie)
{
}

/* -------------------------------------------------------------------------- */

int16 Acfg_load(UConfig *config, const char *filename)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_save(UConfig *config, const char *filename)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Acfg_getValue(UConfig *config, const char *kategorie, const char *name, char *value)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Acfg_setValue( UConfig *config, const char *kategorie, const char *name, const char *value)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Acfg_clearValue(UConfig *config, const char *kategorie, const char *name, char *value)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Acfg_getString(UConfig *config, const char *kategorie, const char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int32 Acfg_getLong(UConfig *config, const char *kategorie, const char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int32 Acfg_setLong(UConfig *config, const char *kategorie, const char *name, int32 value)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char Acfg_getChar(UConfig *config, const char *kategorie, const char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char Acfg_setChar(UConfig *config, const char *kategorie, const char *name, char value)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_getBool(UConfig *config, const char *kategorie, const char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_setBool(UConfig *config, const char *kategorie, const char *name, int16 value)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

double Acfg_getDouble(UConfig *config, const char *kategorie, const char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

double Acfg_setDouble( UConfig *config, const char *kategorie, const char *name, double value)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

void Acfg_clearHeader(UConfig *config)
{
}

/* -------------------------------------------------------------------------- */

int16 Acfg_headAnzahl(UConfig *config)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char **Acfg_setHeader(UConfig *config, int16 anzahl, const char **head_lines)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char **Acfg_getHeader(UConfig *config, char **head_lines)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_grpAnzahl(UConfig *config)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Acfg_grpName(UConfig *config, int16 grp_nr, char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_strAnzahl(UConfig *config, int16 grp_nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Acfg_strName(UConfig *config, int16 grp_nr, int16 str_nr, char *name)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

char *Acfg_strValue(UConfig *config, int16 grp_nr, int16 str_nr, char *value)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_strIsComment(UConfig *config, int16 grp_nr, int16 str_nr)
{
	return 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_isCfgfile(UConfig *config, const char *filename)
{
	return 0;
}
