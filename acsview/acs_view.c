#include	<string.h>
#include	<acs.h>
#include	<acsplus.h>
#include "../src/country.h"

#define BUFF_LEN	(30000)

#include	"acs_view.h"

Awindow *wproto = NULL;
static char *last_path=NULL;

#include	"acs_view.ah"

#if 0
static void cfg_output( Awindow *wproto, UConfig *cfg )
{
	if( wproto )
	{
		INT16 g_nr, s_nr, g_anz, s_anz;
		char g_name[50], s_name[50], value[100];
		
		Awi_show(wproto);
		
		wprintf(wproto, "\n\nDie Config-Strings lauten:\n=========================\n\n");
		
		g_anz=Acfg_grpAnzahl(cfg);
		wprintf(wproto, "   Anzahl der Gruppen = %i\n", g_anz);
		
		for( g_nr=0 ; g_nr<g_anz ; g_nr++ )
		{
			Acfg_grpName(cfg, g_nr, g_name);
			s_anz=Acfg_strAnzahl(cfg, g_nr);
			
			wprintf(wproto, "   %3i. Gruppe (%s) enth„lt %i Strings\n", g_nr,
				(Ast_isEmpty(g_name) ? "<kein Name>" : g_name), s_anz);
			
			for( s_nr=0 ; s_nr<s_anz ; s_nr++ )
			{
				Acfg_strName(cfg, g_nr, s_nr, s_name);
				Acfg_getValue(cfg, g_name, s_name, value);
				
				wprintf(wproto, "      %3i. String: '%s' = '%s'\n", s_nr, s_name, value);
			}
		}
		
		wprintf(wproto, "\n\n");
	}
}
#endif



static void my_debug( void *p )
{
	long	i;
	INT16	*ptr;

	if( wproto )
	{
		ptr = p;
		for( i=0 ; i<64l ; i++ )
			wprintf(wproto, "%d ", ptr[i]);
		wprintf(wproto, "\n");
	}
}

INT16 ACSinit (void)
{
	Awindow		*root;
	OBJECT		*edi;
	PROTOCOLDATA cfg = {1, 13, 70, 20, 2, 16384, 20, 20};
	Acreate mycr;
	INT16		i;
	
	wproto = PROTOCOL.create(&cfg);
	if( wproto!=NULL )
	{
		(wproto->service) (wproto, AS_EDGETENTRY, &edi);
		Auo_editor (edi, AUO_EDCHARSELECT, NULL);
		((AOBJECT*)&edi[1])->click = md_proto;
		edi->ob_flags = TOUCHEXIT;
	}
	
	if( ACSblk->application && wproto && !ACSblk->multitask )
		(wproto->open)(wproto);
	
	if( (root=Awi_root())!=NULL )
	{
		mycr = new_view;
		(root->service)(root, AS_NEWCALL, &mycr);
	}
	
	ACSblk->DEBUG_MEM = my_debug;
	if( ACSblk->argc>1 )
		for( i=1 ; i<ACSblk->argc ; i++ )
			exec_cmd(ACSblk->argv[i]);
	
	return OK;
}
