#include "acs_i.h"

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

#ifdef __GNUC__
/* these are currently not in gemlib */
int16 mt_evnt_event(MultiEventIn *input, MultiEventOut *output, GlobalArray *globl)
{
	output->reserved = mt_evnt_multi(input->ev_mflags,
		input->ev_mbclicks, input->ev_mbmask, input->ev_mbstate,
		input->ev_mm1flags, input->xywh1.g_x, input->xywh1.g_y, input->xywh1.g_w, input->xywh1.g_h,
		input->ev_mm2flags, input->xywh2.g_x, input->xywh2.g_y, input->xywh2.g_w, input->xywh2.g_h,
		input->ev_mmgpbuff,
		input->ev_mtcount,
		&output->ev_mmox, &output->ev_mmoy, &output->ev_mmbutton, &output->ev_mmokstate, &output->ev_mkreturn, &output->ev_mbreturn, globl);
	return output->reserved;
}

/* -------------------------------------------------------------------------- */

int16 mt_EvntMulti(EVENT *evnt_data, GlobalArray *globl)
{
	evnt_data->ev_mwich = mt_evnt_multi(evnt_data->ev_mflags,
		evnt_data->ev_mbclicks, evnt_data->ev_bmask, evnt_data->ev_mbstate,
		evnt_data->ev_mm1flags, evnt_data->ev_mm1x, evnt_data->ev_mm1y, evnt_data->ev_mm1width, evnt_data->ev_mm1height,
		evnt_data->ev_mm2flags, evnt_data->ev_mm2x, evnt_data->ev_mm2y, evnt_data->ev_mm2width, evnt_data->ev_mm2height,
		evnt_data->ev_mmgpbuf,
		(evnt_data->ev_mthicount << 16) | (uint32)(uint16)evnt_data->ev_mtlocount,
		&evnt_data->ev_mmox, &evnt_data->ev_mmoy, &evnt_data->ev_mmobutton, &evnt_data->ev_mmokstate, &evnt_data->ev_mkreturn, &evnt_data->ev_mbreturn, globl);
	return evnt_data->ev_mwich;
}

/* -------------------------------------------------------------------------- */

int16 mt_wind_getQSB(const int16 handle, void **buffer, int32 *length, GlobalArray *globl)
{
	union {
		struct {
			int16 w1;
			int16 w2;
		} w;
		void *buffer;
	} b;
	union {
		struct {
			int16 w1;
			int16 w2;
		} w;
		int32 l;
	} l;
	int16 ret;

	ret = mt_wind_get(handle, WF_SCREEN, &b.w.w1, &b.w.w2, &l.w.w1, &l.w.w2, globl);
	if (buffer != NULL)
		*buffer = b.buffer;
	if (length != NULL)
	{
		*length = l.l;
		/* Die Korrektur fuer TOS 1.02 aus dem Profibuch */
		if (*length == 0 && globl->ap_version == 0x0120)
			*length = 8000;
	}
	return ret;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/*
 * These are implemented on pctos.lib for Pure-C
 * (FIXME, they don't belong there)
 */

#include <acscook.h>

typedef struct
{
	int32 id;
	int32 val;
} COOKJAR;

int16 Mxmask( void )
{
	static boolean has_mxalloc = -1;
	static boolean has_sysconf = -1;
	
	if( has_mxalloc == -1 )
		has_mxalloc = ((int32)Mxalloc(-1, 0)!=EINVFN ? 1 : 0);
	if( has_sysconf == -1 )
		has_sysconf = (Sysconf(-1)!=EINVFN ? 1 : 0);
	
	return has_mxalloc ? (has_sysconf ? -1 : 3) : 0;
}

/* Adresse des CookieJar-Vektors als Konstante */
#define COOKIEJAR	0x05A0

/******************************************************************************/

boolean Ash_getcookie( int32 cookie, void *value )
{
	static int16 use_ssystem = -1; 
	COOKJAR	*cookiejar;
	int32		val = -1l;
	int16		i=0;
	
	/* PrÅfen, ob Ssystem vorhanden ist */
	if( use_ssystem<0 )
		use_ssystem = (Ssystem(S_INQUIRE, 0l, 0)==E_OK);
	
	/* Ggf. den Cookie per Ssystem suchen */
	if(use_ssystem)
	{
		if( Ssystem(S_GETCOOKIE, cookie, (int32)&val)==E_OK )
		{
			if( value!=NULL )
				*(int32 *)value = val;
			return TRUE;
		}
	}
	else	/* Den CookieJar selbst durchkramen */
	{
		cookiejar = (COOKJAR *)(Setexc(COOKIEJAR/4,(const void (*)(void))-1));
		if( cookiejar )
		{
			for( i=0 ; cookiejar[i].id ; i++ )
				if( cookiejar[i].id==cookie )
				{
					if( value!=NULL )
						*(int32 *)value = cookiejar[i].val;
					return TRUE;
				}
		}
	}
	
	return FALSE;
}

/* Die Konstante wird nicht mehr benîtigt */
#undef COOKIEJAR

/* -------------------------------------------------------------------------- */

/* Adresse des Timers */
#define _hz_200 ((uint32 *)0x4BA)

static int32 get_hz_200( void )
{
    return *_hz_200;
}

uint32 Ash_gettimer( void )
{
	static int16 has_ssystem = -1;
	
	/* Ist Ssystem vorhanden? */
	if( has_ssystem<0 )
		has_ssystem = (Ssystem(-1, 0l, 0l)==E_OK ? TRUE : FALSE);
	
	/* Den Timer auslesen, bevorzugt per Ssystem, */
	/* andernfalls eben per Supervisor-Mode!      */
	if( has_ssystem )
		return Ssystem(S_GETLVAL, (int32)_hz_200, 0L);
	else
		return Supexec(get_hz_200);
}

#undef _hz_200

/* Adresse der Struktur */
#define _sysbase ((SYSHDR **)0x4F2)

static int32 get_sysbase( void )
{
	SYSHDR *os_header = *_sysbase;
	
	return (UINT32)(os_header->os_base);
}

#undef _sysbase

SYSHDR *Ash_getOSHeader( void )
{
	return (SYSHDR *)Supexec(get_sysbase);
}

/* -------------------------------------------------------------------------- */

MAGX_COOKIE *Ash_getMagiC( void )
{
	static boolean is_read = FALSE;
	static MAGX_COOKIE *cookie = NULL;
	
	/* Ggf. den Cookie auslesen */
	if( !is_read )
	{
		if( !Ash_getcookie(C_MagX, &cookie) )
			cookie = NULL;
		is_read = TRUE;
	}
	
	return cookie;
}

/* -------------------------------------------------------------------------- */

N_AESINFO *Ash_getNAES( void )
{
	static boolean is_read = FALSE;
	static N_AESINFO *cookie = NULL;
	
	/* Ggf. den Cookie auslesen */
	if( !is_read )
	{
		if( !Ash_getcookie(C_nAES, &cookie) )
			cookie = NULL;
		is_read = TRUE;
	}
	
	return cookie;
}

/* -------------------------------------------------------------------------- */

int16 Ash_getMagiCVersion( void )
{
	MAGX_COOKIE *cookie = Ash_getMagiC();
	
	/* Cookie vorhanden? */
	if( cookie!=NULL )
	{
		/* MagiC-AES aktiv? */
		if( cookie->aesvars )
			return cookie->aesvars->version;		/* MagiC lÑuft, MagiC-AES aktiv */
		else
			return -2;									/* MagiC lÑuft, aber MagiC-AES inaktiv */
	}
	else
		return -1;										/* MagiC lÑuft nicht */
}

/* -------------------------------------------------------------------------- */

AESVARS *Ash_getMagiCAESVars( void )
{
	static boolean have_it = 0;
	static AESVARS *aesvars = NULL;
	
	/* Ggf. die Variablen bestimmen */
	if( !have_it )
	{
		MAGX_COOKIE *cookie = Ash_getMagiC();
		if( cookie!=NULL )
		{
			if( cookie->aesvars!=NULL )
				aesvars = cookie->aesvars;
			else
			{
				aesvars = (AESVARS *)Ash_getOSHeader()->os_magic;
				if( aesvars->magic!=0x87654321l || aesvars->magic2 != 0x4d414758L) /* 'MAGX' */
					aesvars = NULL;
			}
		}
		
		/* Die Variablen wurden bestimmt! */
		have_it = TRUE;
	}
	
	return aesvars;
}

#endif /* __GNUC__ */
