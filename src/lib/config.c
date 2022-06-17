/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Configuration file                                    */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

typedef struct {
	char *grp_name;
	int16 anzahl;
	char **cfg_strings;
} ACSCfgGruppe;

typedef struct _ACSConfig {
	UCfgInfo info;
	/* 18 */ boolean changed;
	/* 20 */ int16 grp_anzahl;
	/* 22 */ ACSCfgGruppe **cfg_grp;
	/* 26 */ int16 flags;
	/* 28 */ int16 head_anz;
	/* 30 */ char **header;
} ACSConfig;

typedef struct {
	char *grp_name;
	ACSCfgGruppe *gruppe;
	char *name;
	char *value;
	int16 index;
} ACSCfgSearchStruct;

#define BUFFER_SIZE 8192

static UCfgInfo const default_info = { "", "%;", NULL, FALSE, FALSE, 32 };
static char s_val[BUFFER_SIZE];

static void InitConfigStruct(ACSConfig *config, const UCfgInfo *info);
static void Acfg_initInfo(UCfgInfo *info, const char *comment);
static ACSCfgSearchStruct *InitCfgSearch(ACSCfgSearchStruct *search, const char *category, const char *name);
static ACSCfgGruppe *SearchGruppe(ACSConfig *config, ACSCfgSearchStruct *search);
static void SearchCfgString(ACSConfig *config, ACSCfgSearchStruct *search);
static void SearchCfgNameInStrings(ACSConfig *config, ACSCfgSearchStruct *search, int16 count, char **strings);
static ACSCfgGruppe *CreateCfgGruppe(ACSConfig *config, const char *grp_name);
static boolean CreateCfgString(ACSCfgGruppe *gruppe, char *str);
static boolean DeleteCfgString(ACSCfgGruppe *gruppe, int16 index);
static char *SearchCfgName(ACSConfig *config, char *str, ACSCfgSearchStruct *search);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

UConfig *Acfg_create(const UCfgInfo *info, boolean load)
{
	ACSConfig *config;
	
	config = Ax_malloc(sizeof(*config));
	if (config == NULL)
		return NULL;
	memset(config, 0, sizeof(*config));
	InitConfigStruct(config, info);
	if (!Ast_isEmpty(info->dateiname) && load)
		Acfg_load((UConfig *)config, NULL);
	return (UConfig *)config;
}

/* -------------------------------------------------------------------------- */

void Acfg_delete(UConfig *uconfig)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	
	if (config != NULL)
	{
		if ((config->flags & ACFG_AUTOSAVE) && config->changed)
			Acfg_save(uconfig, NULL);
		Acfg_clear((UConfig *)config, NULL);
		Ax_recycle(config, sizeof(*config));
	}
}

/* -------------------------------------------------------------------------- */

int16 Acfg_flags(UConfig *uconfig, int16 flags, boolean set)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	
	if (set > FALSE)
		config->flags |= flags;
	else if (set == FALSE)
		config->flags &= ~flags;
	return config->flags;
}

/* -------------------------------------------------------------------------- */

static void InitConfigStruct(ACSConfig *config, const UCfgInfo *info)
{
	Acfg_copyInfo(&config->info, info);
	config->grp_anzahl = 0;
	config->cfg_grp = NULL;
	config->head_anz = 0;
	config->header = NULL;
}

/* -------------------------------------------------------------------------- */

UCfgInfo *Acfg_createInfo(void)
{
	UCfgInfo *info;
	
	info = Ax_malloc(sizeof(*info));
	if (info == NULL)
		return NULL;
	memset(info, 0, sizeof(*info));
	Acfg_initInfo(info, "%;");
	return info;
}

/* -------------------------------------------------------------------------- */

void Acfg_deleteInfo(UCfgInfo *info)
{
	Acfg_initInfo(info, "");
	Ax_recycle(info, sizeof(*info));
}

/* -------------------------------------------------------------------------- */

static void Acfg_initInfo(UCfgInfo *info, const char *comment)
{
	if (info->dateiname != NULL && info->dateiname[0] != '\0')
		Ast_delete(info->dateiname);
	info->dateiname = Ast_create("");
	if (info->comment != NULL && info->comment[0] != '\0')
		Ast_delete(info->comment);
	info->comment = Ast_create(comment);
	if (info->env_praefix != NULL && info->env_praefix[0] != '\0')
		Ast_delete(info->env_praefix);
	info->env_praefix = Ast_create("");
	info->casesensitiv = FALSE;
	info->file_sensitiv = FALSE;
	info->file_buffer = 32;
}

/* -------------------------------------------------------------------------- */

UCfgInfo *Acfg_copyInfo(UCfgInfo *dest, const UCfgInfo *source)
{
	if (source == NULL)
		source = &default_info;
	Acfg_initInfo(dest, source->comment);
	dest->dateiname = Ast_create(source->dateiname);
	dest->env_praefix = source->env_praefix != NULL ? Ast_create(source->env_praefix) : NULL;
	dest->casesensitiv = source->casesensitiv;
	dest->file_sensitiv = source->file_sensitiv;
	dest->file_buffer = source->file_buffer;
	return dest;
}

/* -------------------------------------------------------------------------- */

UCfgInfo *Acfg_setInfo(UConfig *uconfig, const UCfgInfo *info)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	
#if WITH_FIXES
	return Acfg_copyInfo(&config->info, info);
#else
	Acfg_copyInfo(&config->info, info);
	return NO_CONST(info);
#endif
}

/* -------------------------------------------------------------------------- */

UCfgInfo *Acfg_getInfo(UConfig *uconfig, UCfgInfo *info)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	
	return Acfg_copyInfo(info, &config->info);
}

/* -------------------------------------------------------------------------- */

void Acfg_clear(UConfig *uconfig, const UCfgInfo *info)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	
	Acfg_copyInfo(&config->info, info);
	Acfg_clearAllGroups((UConfig *)config);
	Acfg_clearHeader((UConfig *)config);
}

/* -------------------------------------------------------------------------- */

void Acfg_clearAllGroups(UConfig *uconfig)
{
	int16 i, j;
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgGruppe *grp;
	
	if (config != NULL && config->grp_anzahl > 0 && config->cfg_grp != NULL)
	{
		for (i = 0; i < config->grp_anzahl; i++)
		{
			grp = config->cfg_grp[i];
			if (grp != NULL)
			{
				if (grp->anzahl > 0 && grp->cfg_strings != NULL)
				{
					for (j = 0; j< grp->anzahl; j++)
					{
						if (grp->cfg_strings[j] != NULL && grp->cfg_strings[j][0] != '\0')
							Ast_delete(grp->cfg_strings[j]);
					}
					Ax_free(grp->cfg_strings);
					grp->cfg_strings = NULL;
					grp->anzahl = 0;
				}
				Ast_delete(grp->grp_name);
				Ax_recycle(grp, sizeof(*grp));
				config->cfg_grp[i] = NULL;
			}
		}
		Ax_free(config->cfg_grp);
		config->cfg_grp = NULL;
		config->grp_anzahl = 0;
		config->changed = TRUE;
	}
}

/* -------------------------------------------------------------------------- */

void Acfg_clearGroup(UConfig *uconfig, const char *category)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgGruppe *grp;
	ACSCfgGruppe **newgrp;
	int16 i, j;
	ACSCfgSearchStruct search;
	
	InitCfgSearch(&search, category, NULL);
	grp = SearchGruppe(config, &search);
	if (grp != NULL)
	{
		for (i = 0; i < grp->anzahl; i++)
			Ast_delete(grp->cfg_strings[i]);
		Ax_free(grp->cfg_strings);
		Ast_delete(grp->grp_name);
		if (config->grp_anzahl > 1)
		{
			newgrp = Ax_malloc((config->grp_anzahl - 1) * sizeof(*newgrp));
#if WITH_FIXES
			for (j = i = 0; i < config->grp_anzahl; i++)
			{
				if (config->cfg_grp[i] != grp)
					newgrp[j++] = config->cfg_grp[i];
			}
#else
			for (j = i = 0; i < config->grp_anzahl; i++, j++)
			{
				if (config->cfg_grp[i] == grp)
					i++;
				else
					newgrp[j] = config->cfg_grp[i];
			}
#endif
			Ax_free(config->cfg_grp);
			config->cfg_grp = newgrp;
			config->grp_anzahl -= 1;
		} else
		{
			Ax_free(config->cfg_grp);
			config->cfg_grp = NULL;
			config->grp_anzahl = 0;
		}
		Ax_recycle(grp, sizeof(*grp));
	}
}

/* -------------------------------------------------------------------------- */

static boolean Acfg_makeName(char **buf, const char *filename, char *path, char *name)
{
	char ext[4];
	int16 drv;
	
	if (Ast_isEmpty(filename))
		return FALSE;
	if (Ast_isEmpty(Ast_alltrim(Af_2name(name, filename))))
		return FALSE;
	if (Ast_isEmpty(Af_2ext(ext, filename)))
		strcpy(ext, "cfg");
	drv = Af_2drv(filename);
	Af_2path(path, filename);
	if (Ast_cmp(path, "\\") == 0 && strrchr(filename, PATH_SEP) == NULL)
	{
		if (strrchr(filename, ':') == NULL)
		{
			Af_2path(path, ACSblk->cfg_path);
			drv = Af_2drv(ACSblk->cfg_path);
		} else
		{
			*path = '\0';
		}
	}
	*buf = Ax_malloc(BUFFER_SIZE);
	if (*buf == NULL)
		return FALSE;
	Af_buildname(*buf, drv, path, name, ext);
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean IsNewGroup(const char *category)
{
	ssize_t len;
	
	len = strlen(category);
	return len > 2 && category[0] == '[' && category[len - 1] == ']';
}

/* -------------------------------------------------------------------------- */

static void FoundNextGroup(FILE *fp, int16 *num_values, int16 *num_empty, char *grp_name, char *buf)
{
	boolean found;
	
	*num_values = *num_empty = 0;
	found = FALSE;
	while (!feof(fp) && !found)
	{
		if (fgets(buf, BUFFER_SIZE, fp) != NULL)
		{
			Ast_alltrim(buf);
			if (IsNewGroup(buf))
			{
				strcpy(grp_name, buf + 1);
				grp_name[strlen(grp_name) - 1] = '\0';
				found = TRUE;
			} else
			{
				++(*num_values);
				if (Ast_isEmpty(buf))
					++(*num_empty);
			}
		}
	}
}

/* -------------------------------------------------------------------------- */

static boolean ReadUntilNextGroup(FILE *fp, ACSCfgGruppe *grp, int16 max, int16 offset, char *buf)
{
	int16 i;
	int16 count;
	char **strings;
	
	count = max - offset;
	if (count > 0)
	{
		strings = Ax_malloc(count * sizeof(*strings));
		if (strings == NULL)
			return FALSE;
		grp->cfg_strings = strings;
		grp->anzahl = count;
#ifdef __GNUC__
	} else
	{
		strings = NULL;
#endif
	}
	i = 0;
	fgets(buf, BUFFER_SIZE, fp);
	Ast_alltrim(buf);
	while ((!feof(fp) || !Ast_isEmpty(buf)) && !IsNewGroup(buf))
	{
		if (!Ast_isEmpty(buf) && i < count)
		{
			strings[i] = Ast_create(buf);
			i++;
		}
		*buf = '\0';
		fgets(buf, BUFFER_SIZE, fp);
		Ast_alltrim(buf);
	}
	if (i > count)
	{
		/* code commented out? */
	}
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Acfg_load(UConfig *uconfig, const char *filename)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	const char *cfgname;
	FILE *fp;
	long pos;
	char *path;
	char *grp_name;
	char *buf;
	int16 num_groups;
	int16 num_values;
	int16 num_empty;
	int16 i;
	ACSCfgGruppe *grp;
	
	cfgname = filename ? filename : config->info.dateiname;
	Acfg_clearAllGroups((UConfig *)config);
	Acfg_clearHeader((UConfig *)config);
	config->changed = FALSE;
	buf = Ax_malloc(2 * BUFFER_SIZE + 4);
	if (buf == NULL)
		return FALSE;
	grp_name = buf + BUFFER_SIZE + 3;
	if (Acfg_makeName(&path, cfgname, buf, grp_name) == FALSE)
	{
		Ax_free(buf);
		return FALSE;
	}
	fp = fopen(path, "r");
	if (fp == NULL)
	{
		Ax_free(path);
		Ax_free(buf);
		return FALSE;
	}
	
	if (config->info.file_buffer > 0)
		setvbuf(fp, NULL, _IOFBF, (size_t)config->info.file_buffer << 10);
	
	num_groups = 1;
	fseek(fp, 0, SEEK_SET);
	while (!feof(fp))
	{
		if (fgets(buf, BUFFER_SIZE, fp) != NULL)
		{
			if (IsNewGroup(Ast_alltrim(buf)))
				++num_groups;
		}
	}
	
	config->cfg_grp = Ax_malloc(num_groups * sizeof(*config->cfg_grp));
	if (config->cfg_grp == NULL)
	{
		fclose(fp);
		Ax_free(path);
		Ax_free(buf);
		return FALSE;
	}
	
	config->grp_anzahl = num_groups;
	memset(config->cfg_grp, 0, num_groups * sizeof(*config->cfg_grp));
	*grp_name = '\0';
	fseek(fp, 0, SEEK_SET);
	for (i = 0; i < num_groups; i++)
	{
		grp = Ax_malloc(sizeof(*grp));
		if (grp == NULL)
		{
			fclose(fp);
			Acfg_clearAllGroups((UConfig *)config);
			Ax_free(path);
			Ax_free(buf);
			config->changed = FALSE;
			return FALSE;
		}
		memset(grp, 0, sizeof(*grp));
		grp->grp_name = Ast_filter(Ast_alltrim(Ast_create(grp_name)), "[]", NULL);
		config->cfg_grp[i] = grp;
		pos = ftell(fp);
		FoundNextGroup(fp, &num_values, &num_empty, grp_name, buf);
		fseek(fp, pos, SEEK_SET);
		if (ReadUntilNextGroup(fp, grp, num_values, num_empty, buf) == FALSE)
		{
			fclose(fp);
			Acfg_clearAllGroups((UConfig *)config);
			Ax_free(path);
			Ax_free(buf);
			config->changed = FALSE;
		}
	}
	
	if (!Ast_isEmpty(config->info.dateiname))
		Ast_delete(config->info.dateiname);
	config->info.dateiname = Ast_create(path);
	fclose(fp);
	Ax_free(path);
	Ax_free(buf);
	
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void WriteString(FILE *fp, ACSConfig *config, boolean *header_done, const char *format, char *str)
{
	int16 i;
	
	if (!*header_done)
	{
		if (strchr(config->info.comment, *Ast_alltrim(str)) == NULL)
		{
			for (i = 0; i < config->head_anz; i++)
				fprintf(fp, "%c %s\n", *config->info.comment, config->header[i]);
			fprintf(fp, "%c\n", *config->info.comment);
		}
		*header_done = TRUE;
	}
	fprintf(fp, format, str);
}

/* -------------------------------------------------------------------------- */

boolean Acfg_save(UConfig *uconfig, const char *filename)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	const char *cfgname;
	FILE *fp; /* 26 */
	char *path; /* 22 */
	char *buf; /* 18 */
	char *grp_name; /* 14 */
	ACSCfgGruppe *grp; /* 10 */
	char **strings;
	int16 i; /* 4 */
	int16 j;
	boolean header_done;
	
	cfgname = !Ast_isEmpty(filename) ? filename : config->info.dateiname;
	buf = Ax_malloc(2 * BUFFER_SIZE + 4);
	if (buf == NULL)
		return FALSE;
	grp_name = buf + BUFFER_SIZE + 3;
	if (Acfg_makeName(&path, cfgname, buf, grp_name) == FALSE)
	{
#if !WITH_FIXES
		Ax_free(path);
#endif
		Ax_free(buf);
		return FALSE;
	}
	fp = fopen(path, "w");
	if (fp == NULL)
	{
		Ax_free(path);
		Ax_free(buf);
		return FALSE;
	}
	
	if (config->info.file_buffer > 0)
		setvbuf(fp, NULL, _IOFBF, (size_t)config->info.file_buffer << 10);
	
	header_done = config->head_anz < 1 || config->header == NULL;
	
	for (i = 0; i < config->grp_anzahl; i++)
	{
		grp = config->cfg_grp[i];
		if (!Ast_isEmpty(grp->grp_name))
			WriteString(fp, config, &header_done, "[%s]\n", grp->grp_name);
		for (j = 0, strings = grp->cfg_strings; j < grp->anzahl; j++, strings++)
		{
			WriteString(fp, config, &header_done, "%s\n", *strings);
		}
		if (!Ast_isEmpty(grp->grp_name) || grp->anzahl > 0)
			fprintf(fp, "\n");
	}
	
	if (!header_done)
		WriteString(fp, config, &header_done, "\n", "xx");
	
	fclose(fp);
	config->changed = FALSE;
	Ax_free(path);
	Ax_free(buf);
	
	return TRUE;
}

/* -------------------------------------------------------------------------- */

char *Acfg_getValue(UConfig *uconfig, const char *category, const char *name, char *value)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	boolean found = FALSE;
	char *str;
	ssize_t len;
	ACSCfgSearchStruct search;
	
	*value = '\0';
	InitCfgSearch(&search, category, name);
	SearchCfgString(config, &search);
	if (search.gruppe != NULL && search.index >= 0 && search.value != NULL)
	{
		found = search.value != NULL;
	}
	if (!found && config->info.env_praefix != NULL)
	{
		len = strlen(config->info.env_praefix) + strlen(search.grp_name) + strlen(search.name);
		if (len > 0)
		{
			str = Ax_malloc(len + 1);
			if (str != NULL)
			{
				Ast_add(3, str, config->info.env_praefix, search.grp_name, search.name);
				Ast_delete(search.name);
				search.name = str;
				SearchCfgNameInStrings(config, &search, -1, ACSblk->env);
				found = search.value != NULL;
			}
		}
	}
	if (found)
		Ast_alltrim(strcpy(value, search.value));
	
	Ast_delete(search.grp_name);
	Ast_delete(search.name);
	
	return value;
}

/* -------------------------------------------------------------------------- */

const char *Acfg_setValue(UConfig *uconfig, const char *category, const char *name, const char *value)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgSearchStruct search;
	char *str;
	ssize_t len;
	boolean found = FALSE;
	
	InitCfgSearch(&search, category, name);
	SearchCfgString(config, &search);
	if (search.gruppe == NULL)
		search.gruppe = CreateCfgGruppe(config, search.grp_name);
	if (search.gruppe != NULL)
	{
		len = strlen(search.name) + strlen(value) + 2;
		str = Ax_malloc(len);
		Ast_add(3, str, search.name, "=", value);
		if (search.index < 0 || search.value == NULL)
		{
			found = CreateCfgString(search.gruppe, str);
			config->changed = TRUE;
		} else
		{
			boolean same;
			
			if (config->info.casesensitiv)
				same = Ast_cmp(str, search.gruppe->cfg_strings[search.index]) == 0;
			else
				same = Ast_icmp(str, search.gruppe->cfg_strings[search.index]) == 0;
			if (!same)
			{
				Ast_delete(search.gruppe->cfg_strings[search.index]);
				search.gruppe->cfg_strings[search.index] = str;
				found = TRUE;
				config->changed = TRUE;
			}
		}
	}

	Ast_delete(search.grp_name);
	Ast_delete(search.name);
	
	if (found)
		return value;
	
	return "";
}

/* -------------------------------------------------------------------------- */

char *Acfg_clearValue(UConfig *uconfig, const char *category, const char *name, char *value)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgSearchStruct search;
	boolean found = FALSE;
	
	*value = '\0';
	InitCfgSearch(&search, category, name);
	SearchCfgString(config, &search);
	if (search.gruppe != NULL && search.index >= 0 && search.value != NULL)
	{
		Ast_alltrim(strcpy(value, search.value));
		found = DeleteCfgString(search.gruppe, search.index);
	}
	
	Ast_delete(search.grp_name);
	Ast_delete(search.name);

	if (found)
		return value;
	
	return "";
}

/* -------------------------------------------------------------------------- */

char *Acfg_getString(UConfig *config, const char *category, const char *name)
{
	return Acfg_getValue(config, category, name, s_val);
}

/* -------------------------------------------------------------------------- */

int32 Acfg_getLong(UConfig *config, const char *category, const char *name)
{
	char buf[BUFFER_SIZE];
	
	return atol(Acfg_getValue(config, category, name, buf));
}

/* -------------------------------------------------------------------------- */

int32 Acfg_setLong(UConfig *config, const char *category, const char *name, int32 value)
{
	char buf[22];
	
	sprintf(buf, "%li", (long) value);
	return atol(Acfg_setValue(config, category, name, buf));
}

/* -------------------------------------------------------------------------- */

#if 0
double Acfg_getDouble(UConfig *config, const char *category, const char *name)
{
	char buf[BUFFER_SIZE];
	
	return atof(Acfg_getValue(config, category, name, buf));
}

/* -------------------------------------------------------------------------- */

double Acfg_setDouble(UConfig *config, const char *category, const char *name, double value)
{
	char buf[52];
	char *dot;
	char *end;
	
	sprintf(buf, "%lf", value);
	Ast_alltrim(buf); /* FIXME: nonsense */
	dot = strrchr(buf, '.');
	end = strrchr(buf, '\0') - 1;
	while (*end == '0' && end > dot)
		end--;
	if (end > dot)
		end[1] = '\0';
	else if (end == dot)
		end[0] = '\0';
	return atof(Acfg_setValue(config, category, name, buf));;
}
#endif

/* -------------------------------------------------------------------------- */

char Acfg_getChar(UConfig *config, const char *category, const char *name)
{
	char buf[52];
	
	return *Acfg_getValue(config, category, name, buf);
}

/* -------------------------------------------------------------------------- */

char Acfg_setChar(UConfig *config, const char *category, const char *name, char value)
{
	char buf[2];
	
	buf[0] = value;
	buf[1] = '\0';
	return *Acfg_setValue(config, category, name, buf);
}

/* -------------------------------------------------------------------------- */

int16 Acfg_getBool(UConfig *config, const char *category, const char *name)
{
	char buf[10];
	
	return Ast_icmp(Acfg_getValue(config, category, name, buf), "True") == 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_setBool(UConfig *config, const char *category, const char *name, int16 value)
{
	return Ast_icmp(Acfg_setValue(config, category, name, value ? "True" : "False"), "True") == 0;
}

/* -------------------------------------------------------------------------- */

boolean Acfg_isChanged(UConfig *config)
{
	return ((ACSConfig *)config)->changed;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_grpAnzahl(UConfig *config)
{
	return ((ACSConfig *)config)->grp_anzahl;
}

/* -------------------------------------------------------------------------- */

char *Acfg_grpName(UConfig *uconfig, int16 grp_nr, char *name)
{
	ACSConfig *config = (ACSConfig *)uconfig;

	if (grp_nr >= 0 && grp_nr < config->grp_anzahl)
		return strcpy(name, config->cfg_grp[grp_nr]->grp_name);
	return NULL;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_strAnzahl(UConfig *uconfig, int16 grp_nr)
{
	ACSConfig *config = (ACSConfig *)uconfig;

	if (grp_nr >= 0 && grp_nr < config->grp_anzahl)
		return config->cfg_grp[grp_nr]->anzahl;
	return 0;
}

/* -------------------------------------------------------------------------- */

boolean Acfg_isGroupPresent(UConfig *uconfig, const char *category)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgSearchStruct search;
	
	InitCfgSearch(&search, category, "");
	if (SearchGruppe(config, &search) == NULL)
		return FALSE;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

boolean Acfg_isStringPresent(UConfig *uconfig, const char *category, const char *name)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgSearchStruct search;
	
	InitCfgSearch(&search, category, name);
	SearchCfgString(config, &search);
	if (search.index == -1)
		return FALSE;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

char *Acfg_strName(UConfig *uconfig, int16 grp_nr, int16 str_nr, char *name)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgGruppe *grp;
	char *valptr;
	char *str;
	
	*name = '\0';
	if (grp_nr >= 0 && grp_nr < config->grp_anzahl)
	{
		grp = config->cfg_grp[grp_nr];
		if (str_nr >= 0 && str_nr < grp->anzahl && !Acfg_strIsComment(uconfig, grp_nr, str_nr))
		{
			str = grp->cfg_strings[str_nr];
			valptr = strchr(str, '=');
			if (valptr != NULL)
			{
				strncpy(name, str, valptr - str);
				name[valptr - str] = '\0';
			}
		}
	}
	return name;
}

/* -------------------------------------------------------------------------- */

char *Acfg_strValue(UConfig *uconfig, int16 grp_nr, int16 str_nr, char *value)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgGruppe *grp;
	char *valptr;
	char *str;
	
	*value = '\0';
	if (grp_nr >= 0 && grp_nr < config->grp_anzahl)
	{
		grp = config->cfg_grp[grp_nr];
		if (str_nr >= 0 && str_nr < grp->anzahl)
		{
			if (Acfg_strIsComment(uconfig, grp_nr, str_nr))
			{
				strcpy(value, grp->cfg_strings[str_nr]);
				Ast_alltrim(value);
			} else
			{
				str = grp->cfg_strings[str_nr];
				valptr = strchr(str, '=');
				if (valptr != NULL)
				{
					++valptr;
					strcpy(value, valptr);
				}
			}
		}
	}
	return value;
}

/* -------------------------------------------------------------------------- */

boolean Acfg_strIsComment(UConfig *uconfig, int16 grp_nr, int16 str_nr)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	ACSCfgGruppe *grp;
	char *str;
	boolean iscomment = FALSE;
	
	if (grp_nr >= 0 && grp_nr < config->grp_anzahl)
	{
		grp = config->cfg_grp[grp_nr];
		if (str_nr >= 0 && str_nr < grp->anzahl)
		{
			str = grp->cfg_strings[str_nr];
			while (*str != '\0' && Ach_isWhite(*str))
				str++;
			if (*str != '\0' && strchr(config->info.comment, *str) != NULL)
				iscomment = TRUE;
		}
	}
	return iscomment;
}

/* -------------------------------------------------------------------------- */

void Acfg_clearHeader(UConfig *uconfig)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	int16 i;
	
	for (i = 0; i < config->head_anz; i++)
		Ast_delete(config->header[i]);
	Ax_free(config->header);
	config->header = NULL;
	config->head_anz = 0;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_headAnzahl(UConfig *config)
{
	return ((ACSConfig *)config)->head_anz;
}

/* -------------------------------------------------------------------------- */

char **Acfg_setHeader(UConfig *uconfig, int16 anzahl, const char **head_lines)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	int16 i;
	char **header;
	
	Acfg_clearHeader(uconfig);
	header = Ax_malloc(anzahl * sizeof(*header));
	if (header == NULL)
		return NULL;
	memset(header, 0, anzahl * sizeof(*header));
	config->head_anz = anzahl;
	config->header = header;
	for (i = 0; i < anzahl; i++)
		header[i] = Ast_alltrim(Ast_create(head_lines[i]));
#if WITH_FIXES
	return header;
#else
	return (char **)NO_CONST(head_lines);
#endif
}

/* -------------------------------------------------------------------------- */

char **Acfg_getHeader(UConfig *uconfig, char **head_lines)
{
	ACSConfig *config = (ACSConfig *)uconfig;
	int16 i;

	for (i = 0; i < config->head_anz; i++)
		head_lines[i] = Ast_alltrim(Ast_create(config->header[i]));
	return head_lines;
}

/* -------------------------------------------------------------------------- */

int16 Acfg_isCfgfile(UConfig *uconfig, const char *filename)
{

	ACSConfig *config = (ACSConfig *)uconfig;

	/* WTF: == 0 missing? */
	if (config->info.file_sensitiv)
		return Ast_cmp(config->info.dateiname, filename);
	else
		return Ast_icmp(config->info.dateiname, filename);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

static ACSCfgSearchStruct *InitCfgSearch(ACSCfgSearchStruct *search, const char *category, const char *name)
{
	search->grp_name = Ast_filter(Ast_alltrim(Ast_create(category)), "[]", NULL);
	search->gruppe = NULL;
	search->name = Ast_filter(Ast_alltrim(Ast_create(name)), "=", NULL);
	search->value = NULL;
	search->index = -1;
	return search;
}

/* -------------------------------------------------------------------------- */

static void SearchCfgString(ACSConfig *config, ACSCfgSearchStruct *search)
{
	search->value = NULL;
	search->index = -1;
	search->gruppe = SearchGruppe(config, search);
	if (search->gruppe != NULL)
		SearchCfgNameInStrings(config, search, search->gruppe->anzahl, search->gruppe->cfg_strings);
}

/* -------------------------------------------------------------------------- */

static void SearchCfgNameInStrings(ACSConfig *config, ACSCfgSearchStruct *search, int16 count, char **strings)
{
	int16 i;
	char *found;
	char **ptr;
	
	ptr = NULL;
	if ((count > 0 && strings != NULL) ||
		(count == -1 && strings != NULL))
	{
		for (i = 0, ptr = strings, found = NULL;
			(count > 0 && i < count) || (count == -1 && *ptr != NULL && ptr[0][0] != '\0');
			i++, ptr++)
		{
			if (*ptr != NULL && ptr[0][0] != '\0')
			{
				found = SearchCfgName(config, *ptr, search);
				if (found != NULL)
					break;
			}
		}
		if (found != NULL)
		{
			search->value = found;
			search->index = i;
		}
	}
}

/* -------------------------------------------------------------------------- */

static ACSCfgGruppe *SearchGruppe(ACSConfig *config, ACSCfgSearchStruct *search)
{
	int16 i;
	boolean found;
	ACSCfgGruppe *grp;
	
	if (search == NULL)
		return NULL;
	for (found = FALSE, i = 0; !found && i < config->grp_anzahl; i++)
	{
		grp = config->cfg_grp[i];
		if (config->info.casesensitiv)
			found = Ast_cmp(grp->grp_name, search->grp_name) == 0;
		else
			found = Ast_icmp(grp->grp_name, search->grp_name) == 0;
		if (found)
			break;
	}
	return found ? grp : NULL;
}

/* -------------------------------------------------------------------------- */

static char *SearchCfgName(ACSConfig *config, char *str, ACSCfgSearchStruct *search)
{
	boolean cont;
	char *ptr;
	const char *name;
	
	ptr = str;
	while (*ptr != '\0' && Ach_isWhite(*ptr))
		ptr++;
	if (*ptr != '\0' && strchr(config->info.comment, *ptr) != NULL)
		return NULL;
	name = search->name;
	cont = TRUE;
	while (cont && *name != '\0'&& *ptr != '=' && *ptr != '\0')
	{
		if (config->info.casesensitiv)
			cont = *ptr == *name;
		else
			cont = Ach_toupper(*ptr) == Ach_toupper(*name);
		name++;
		ptr++;
	}
	while (cont && *ptr != '\0' && Ach_isWhite(*ptr) && *ptr != '=')
		ptr++;
	if (!cont || *ptr == '\0' || *ptr != '=' || (*ptr == '=' && *name != '\0'))
		return NULL;
	++ptr;
	return ptr;
}

/* -------------------------------------------------------------------------- */

static ACSCfgGruppe *CreateCfgGruppe(ACSConfig *config, const char *grp_name)
{
	ACSCfgGruppe *grp;
	ACSCfgGruppe **newgrp;
	int16 count;
	
	grp = Ax_malloc(sizeof(*grp));
	if (grp == NULL)
		return NULL;
	grp->anzahl = 0;
	grp->cfg_strings = NULL;
	grp->grp_name = Ast_create(grp_name);
	if (grp->grp_name == NULL)
	{
		Ax_free(grp);
		return NULL;
	}
	count = config->grp_anzahl;
	newgrp = Ax_malloc((count + 1) * sizeof(*newgrp));
	if (newgrp == NULL)
	{
		Ast_delete(grp->grp_name);
		Ax_free(grp);
		return NULL;
	}
	memcpy(newgrp, config->cfg_grp, count * sizeof(*newgrp));
	newgrp[count] = grp;
	Ax_free(config->cfg_grp);
	config->cfg_grp = newgrp;
	++config->grp_anzahl;
	return grp;
}

/* -------------------------------------------------------------------------- */

static boolean CreateCfgString(ACSCfgGruppe *gruppe, char *str)
{
	int16 count;
	char **strings;
	
	count = gruppe->anzahl;
	strings = Ax_malloc((count + 1) * sizeof(*strings));
	if (strings == NULL)
		return FALSE;
	memcpy(strings, gruppe->cfg_strings, count * sizeof(*strings));
	strings[count] = str;
	Ax_free(gruppe->cfg_strings);
	gruppe->cfg_strings = strings;
	++gruppe->anzahl;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static boolean DeleteCfgString(ACSCfgGruppe *gruppe, int16 index)
{
	int16 count;
	int16 i;
	char **strings;
	char **ptr;
	
	count = gruppe->anzahl - 1;
	strings = Ax_malloc(count * sizeof(*strings));
	if (strings == NULL)
		return FALSE;
	for (i = 0, ptr = strings; i <= count; i++)
	{
		if (i != index)
			*ptr++ = gruppe->cfg_strings[i];
	}
	Ax_free(gruppe->cfg_strings);
	gruppe->cfg_strings = strings;
	--gruppe->anzahl;
	return TRUE;
}
