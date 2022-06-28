/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Shell utility functions                               */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/* Standard-Error-Handler */
void Ash_error(int16 messerr, const void *para)
{
	int button = -2;
	char name[__PS__];
	const char *str;
	
	str = NULL;
	switch (messerr)
	{
	case AE_GEN_MEM:
		str = ACSblk->description->mess[AD_GEN_MEM];
		para = NULL;
		break;

	case AE_OUT_OF_MEM:
		str = ACSblk->description->mess[AD_OUT_OF_MEM];
		para = NULL;
		break;

	case AE_DEFECTIVE_MEM:
		str = ACSblk->description->mess[AD_DEFECTIVE_MEM];
		para = NULL;
		break;

	case AE_RANGE_MEM:
		str = ACSblk->description->mess[AD_RANGE_MEM];
		para = NULL;
		break;

	case AE_ODD_MEM:
		str = ACSblk->description->mess[AD_ODD_MEM];
		para = NULL;
		break;

	case AE_GEN_IO:
		str = ACSblk->description->mess[AD_GEN_IO];
		para = NULL;
		break;

	case AE_OPEN_IO:
		if (para != NULL)
			str = ACSblk->description->mess[AD_OPEN_STR];
		else
			str = ACSblk->description->mess[AD_OPEN_IO];
		break;

	case AE_CREATE_IO:
		if (para != NULL)
			str = ACSblk->description->mess[AD_CREATE_STR];
		else
			str = ACSblk->description->mess[AD_CREATE_IO];
		break;

	case AE_WRITE_IO:
		if (para != NULL)
			str = ACSblk->description->mess[AD_WRITE_STR];
		else
			str = ACSblk->description->mess[AD_WRITE_IO];
		break;

	case AE_READ_IO:
		if (para != NULL)
			str = ACSblk->description->mess[AD_READ_STR];
		else
			str = ACSblk->description->mess[AD_READ_IO];
		break;

	case AE_GEN_MOD:
	case AE_LOAD_MOD:
	case AE_VER_MOD:
	case AE_MEM_MOD:
		if (para != NULL && *((const char *)para) != '\0' &&
			*Af_2name(name, para) != '\0')
		{
			switch (messerr)
			{
			case AE_GEN_MOD:
				str = ACSblk->description->mess[AD_GEN_MOD_STR];
				break;
			case AE_LOAD_MOD:
				str = ACSblk->description->mess[AD_LOAD_MOD_STR];
				break;
			case AE_VER_MOD:
				str = ACSblk->description->mess[AD_VER_MOD_STR];
				break;
			case AE_MEM_MOD:
				str = ACSblk->description->mess[AD_MEM_MOD_STR];
				break;
			}
			para = name;
		} else
		{
			para = NULL;
			switch (messerr)
			{
			case AE_GEN_MOD:
				str = ACSblk->description->mess[AD_GEN_MOD];
				break;
			case AE_LOAD_MOD:
				str = ACSblk->description->mess[AD_LOAD_MOD];
				break;
			case AE_VER_MOD:
				str = ACSblk->description->mess[AD_VER_MOD];
				break;
			case AE_MEM_MOD:
				str = ACSblk->description->mess[AD_MEM_MOD];
				break;
			}
		}
		break;

	case AE_PORT:
		str = ACSblk->description->mess[AD_PORT];
		para = NULL;
		break;

	case AE_COLORS:
	case AE_REZ:
		str = ACSblk->description->mess[AD_COLREZ];
		para = NULL;
		break;
	
	case AE_AES:
	case AE_VDI:
	default:
		if (para != NULL)
			str = ACSblk->description->mess[AD_GENERAL_STR];
		else
			str = ACSblk->description->mess[AD_GENERAL];
		break;
	}
	
	if (str != NULL)
	{
		if (para != NULL)
			button = alert_str(str, para);
		else
			button = Awi_alert(1, str);
	}
	if (button < -1)
		form_alert(1, "[| Internal errors! | Take care! |][  OK  ]");
}

/* -------------------------------------------------------------------------- */

/* parse commandline and fill options */
boolean Ash_cmdParsen(char *options[256], int16 argc, char **argv,
         const char *optionBeginChars, const char *optionsAllowed,
         const char *optionsWithParam, int16 (*wrongOption)(const char c),
         ULinList *params)
{
	int16 i;
#if WITH_FIXES
	unsigned char c;
#else
	char c;
#endif
	char *arg;
	char *ptr;
	boolean ret = TRUE;
	
	for (i = 0; i < 256; i++)
		options[i] = NULL;
	for (i = 0; i < argc; i++)
		Ast_alltrim(argv[i]);
	for (i = 1; i < argc; i++)
	{
		arg = argv[i];
		if (strchr(optionBeginChars, arg[0]) != NULL)
		{
			c = '\0';
			for (ptr = arg + 1; *ptr != '\0'; ptr++)
			{
				c = *ptr;
				if (strchr(optionsAllowed, c) != NULL)
				{
					if (strchr(optionsWithParam, *ptr) != NULL)
					{
						if (ptr[1] != '\0')
						{
							options[c] = ptr + 1;
							break;
						} else
						{
							ptr = i < argc - 1 ? argv[i + 1] : (char *)NO_CONST(optionBeginChars);
							if (strchr(optionBeginChars, *ptr) != NULL)
							{
								if (wrongOption == NULL || wrongOption(c))
								{
									ret = FALSE;
									i = argc;
									break;
								}
							} else
							{
								options[c] = ptr;
								break;
							}
						}
					} else
					{
						options[c] = "";
					}
				} else
				{
					if (wrongOption == NULL || wrongOption(c))
						ret = FALSE;
					break;
				}
			}
		} else
		{
			params->append(params, arg);
		}
	}
	return ret;
}

/* -------------------------------------------------------------------------- */

/* looks for 'var' in Env and returns value */
char *Ash_getenv(const char *var)
{
	char **env;
	char *ptr;
	const char *valp;
	
	env = ACSblk->env;
	if (env != NULL)
	{
		ptr = *env;
		while (ptr != NULL && *ptr != '\0')
		{
			valp = var;
			while (*ptr != '\0' && *ptr++ == *valp++)
			{
				if (*ptr == '=' && *valp == '\0')
				{
					++ptr;
					return ptr;
				}
			}
			ptr = *++env;
		}
	}
	return NULL;
}
