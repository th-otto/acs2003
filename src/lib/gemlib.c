#define __COMPATIBLE_FKT__
#include "acs_i.h"
#include <stdarg.h>

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

/* -------------------------------------------------------------------------- */

boolean vqt_isCharAvailable(int16 handle, uint16 unicode)
{
   uint16 direct = vqt_char_index(handle, unicode, CHARIDX_UNICODE, CHARIDX_DIRECT);

   return (direct!=0xFFFF ? TRUE : FALSE);
}

/* -------------------------------------------------------------------------- */

void vst_kern_offset( int16 handle, fix31 offset, int16 pair_mode, int16 *tracks, int16 *pairs )
{
   vst_track_offset(handle, offset, pair_mode, tracks, pairs);
}

/* -------------------------------------------------------------------------- */

void v_curaddress( int16 handle, int16 row, int16 col )
{
	vs_curaddress(handle, row, col);
}

/* -------------------------------------------------------------------------- */

void vqt_justified( int16 handle, int16 x, int16 y, const char *string,
         int16 length, int16 word_space, int16 char_space, int16 *offsets )
{
   /* contrl anlegen und fÅllen */
   int16 contrl[12]={132, 3, 0, 2, 0};
   int16 intout[2];

   /* intin & ptsout anlegen */
   int16 *intin;
   int16 i, *i_ptr;
   char *c_ptr;

   /* ptsin anlegen */
   int16 ptsin[10];

   /* Die Daten in die Arrays Åbertragen */
   contrl[6]=handle;
   contrl[2]=(int16)strlen(string);
   contrl[3]=contrl[2];

   ptsin[0]=x;
   ptsin[1]=y;
   ptsin[2]=length;
   ptsin[3]=0;

   intin=(int16 *)malloc((contrl[3]+1)*sizeof(*intin));
   if( intin==NULL )
      return;

   intin[0]=word_space;
   intin[1]=char_space;
   for( i=0, i_ptr=intin, c_ptr=(char *)string ; i<=contrl[3] ; i++, i_ptr++, c_ptr++ )
      *i_ptr=*c_ptr;

   /* VDI aufrufen */
   vdi_(contrl, intin, ptsin, intout, offsets);

   /* intin wieder freigeben */
   free(intin);
}

/* -------------------------------------------------------------------------- */

int16 vsf_perimeter3( int16 handle, int16 per_vis, int16 style )
{
   /* contrl anlegen und fÅllen */
   int16 contrl[12]={104, 0, 0, 2, 1};

   /* intin & intout anlegen */
   int16 intin[10];
   int16 intout[10];

   /* Die Daten in die Arrays Åbertragen */
   contrl[6]=handle;

   intin[0] = per_vis;
   intin[1] = style;

   /* VDI aufrufen */
   vdi_(contrl, intin, _VDIParBlk.ptsin, intout, _VDIParBlk.ptsout);

   return intout[0];
}

/* -------------------------------------------------------------------------- */

static void initVdiParams( int16 handle )
{
   short dummy;

   vsf_perimeter(handle, PERIMETER_ON);
   vsl_ends(handle, 0, 0);
   vsl_width(handle, 1);
   vst_effects(handle, 0);
   vsm_height(handle, 9);
   vst_height(handle, 13, &dummy, &dummy, &dummy, &dummy);
}

/* -------------------------------------------------------------------------- */

void v_opnmeta( int16 *work_in, int16 *handle, int16 *work_out, const char *filename )
{
   const char **pp;
   int32 *pi;
   
   /* Wurde etwas fÅr die erweiterten NVDI-Parameter Åbergeben? */
   if( filename!=NULL )
   {
      /* contrl anlegen und fÅllen */
      int16 contrl[12] = {1, 0, 6, 16, 45};

      /* intin anlegen und fÅllen */
      int16 intin[16];

      /* Die bisherige Werte Åbertragen */
      intin[0]  = work_in[0];
      intin[1]  = work_in[1];
      intin[2]  = work_in[2];
      intin[3]  = work_in[3];
      intin[4]  = work_in[4];
      intin[5]  = work_in[5];
      intin[6]  = work_in[6];
      intin[7]  = work_in[7];
      intin[8]  = work_in[8];
      intin[9]  = work_in[9];
      intin[10] = work_in[10];

      /* Die Werte zusÑtzlich eintragen */
      intin[11] = 0;
      pp = (const char **)&(intin[12]);
      *pp = filename;
      pi = (int32 *)&intin[14];
      *pi = 0;

      /* VDI aufrufen */
      vdi_(contrl, intin, _VDIParBlk.ptsin, work_out, &(work_out[45]));

      /* Einige VDI-Implementationen haben nicht die gleichen  */
      /* Default Attribute gesetzt => sie werden initialisiert */
      if( contrl[6]!=0 )
         initVdiParams(contrl[6]);

      /* RÅckgabewert auswerten */
      if( handle!=NULL )
         *handle=contrl[6];
   }
   else
      v_opnwk(work_in, handle, work_out);
}

/* -------------------------------------------------------------------------- */

void v_opnprnwrk( int16 *handle, int16 *work_in, PRN_SETTINGS *settings, int16 *work_out )
{
   int16 contrl[12] = {1, 0, 6, 11, 45};

   /* intin anlegen und fÅllen */
   int16 intin[16];
   int16 i;
   int8 **pp;
   PRN_SETTINGS **ps;

   /* Die Werte Åbertragen */
   if( settings!=NULL )
      intin[0]  = settings->driver_id;
   else if( work_in!=NULL )
      intin[0]  = work_in[0];
   else
      return;
   if( work_in!=NULL )
   {
      for( i=1 ; i<10 ; i++ )
         intin[i] = (work_in!=NULL ? work_in[i] : 1);
      intin[10] = 2;
   }
   else
   {
      for( i=1 ; i<10 ; i++ )
         intin[i] = 1;
      intin[10] = 2;
   }

   /* Die Werte zusÑtzlich eintragen */
   if( settings!=NULL )
   {
      intin[11] = (int16) settings->size_id;
      pp = (int8 **) &intin[12];
      *pp = settings->device;
      ps = (PRN_SETTINGS **)&(intin[14]);
      *ps = settings;

      /* 5 int-Parameter mehr */
      contrl[3] += 5;
   }

   /* VDI aufrufen */
   vdi_(contrl, intin, _VDIParBlk.ptsin, work_out, &(work_out[45]));

   /* Einige VDI-Implementationen haben nicht die gleichen  */
   /* Default Attribute gesetzt => sie werden initialisiert */
   if( contrl[6]!=0 )
      initVdiParams(contrl[6]);

   /* RÅckgabewert auswerten */
   if( handle!=NULL )
      *handle = contrl[6];
}

/* -------------------------------------------------------------------------- */

void v_opnmatrixprn( int16 *work_in, int16 *handle, int16 *work_out, int16 max_x, int16 max_y )
{
   /* contrl anlegen und fÅllen */
   int16 contrl[12] = {1, 0, 6, 11, 45};

   /* Wenn sinnvolle Werte fÅr max_x und max_y Åbergeben wurden,    */
   /* werden diese auch Åbergeben - evtl. fÅr den Drucker bestimmt! */
   if( max_x>0 && max_y>0 )
   {
      int16 ptsin[10];

      /* Die Werte eintragen */
      ptsin[0] = max_x;
      ptsin[1] = max_y;
      contrl[1] = 1;

      /* VDI aufrufen */
      vdi_(contrl, work_in, ptsin, work_out, &(work_out[45]));
   }
   else
   {
      /* VDI aufrufen */
      vdi_(contrl, work_in, _VDIParBlk.ptsin, work_out, &(work_out[45]));
   }

   /* Einige VDI-Implementationen haben nicht die gleichen  */
   /* Default Attribute gesetzt => sie werden initialisiert */
   if( contrl[6]!=0 )
      initVdiParams(contrl[6]);

   /* RÅckgabewert auswerten */
   if( handle!=NULL )
      *handle = contrl[6];
}

/* -------------------------------------------------------------------------- */

void CDECL vdi_(int16 *contrl, const int16 *intin, const int16 *ptsin, int16 *intout, int16 *ptsout)
{
	VDIPB pb;
	
	pb.contrl = contrl;
	pb.intin = (int16 *)NO_CONST(intin);
	pb.ptsin = (int16 *)NO_CONST(ptsin);
	pb.intout = intout;
	pb.ptsout = ptsout;
	vdi(&pb);
}

void CDECL pc_aes( int16 *contrl, GlobalArray *global, int16 *intin, int16 *intout, void *addrin, void *addrout );
void CDECL pc_aes( int16 *contrl, GlobalArray *global, int16 *intin, int16 *intout, void *addrin, void *addrout )
{
	AESPB pb;
	
	pb.contrl = contrl;
	pb.global = (int16 *)global;
	pb.intin = intin;
	pb.intout = intout;
	pb.addrin = addrin;
	pb.addrout = addrout;
	aes(&pb);
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

int16 Mxmask(void)
{
	static boolean has_mxalloc = -1;
	static boolean has_sysconf = -1;
	
	if (has_mxalloc == -1)
		has_mxalloc = ((int32)Mxalloc(-1, 0)!=EINVFN ? 1 : 0);
	if (has_sysconf == -1)
		has_sysconf = (Sysconf(-1)!=EINVFN ? 1 : 0);
	
	return has_mxalloc ? (has_sysconf ? -1 : 3) : 0;
}

/* Adresse des CookieJar-Vektors als Konstante */
#define COOKIEJAR	0x05A0

/******************************************************************************/

boolean Ash_getcookie(int32 cookie, void *value)
{
	static int16 use_ssystem = -1; 
	COOKJAR	*cookiejar;
	int32		val = -1l;
	int16		i=0;
	
	/* PrÅfen, ob Ssystem vorhanden ist */
	if (use_ssystem<0)
		use_ssystem = (Ssystem(S_INQUIRE, 0l, 0)==E_OK);
	
	/* Ggf. den Cookie per Ssystem suchen */
	if (use_ssystem)
	{
		if (Ssystem(S_GETCOOKIE, cookie, (int32)&val)==E_OK)
		{
			if (value!=NULL)
				*(int32 *)value = val;
			return TRUE;
		}
	}
	else	/* Den CookieJar selbst durchkramen */
	{
		cookiejar = (COOKJAR *)(Setexc(COOKIEJAR/4, (void (*)(void))-1));
		if (cookiejar)
		{
			for (i=0 ; cookiejar[i].id ; i++)
				if (cookiejar[i].id==cookie)
				{
					if (value!=NULL)
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

static int32 get_hz_200(void)
{
    return *_hz_200;
}

uint32 Ash_gettimer(void)
{
	static int16 has_ssystem = -1;
	
	/* Ist Ssystem vorhanden? */
	if (has_ssystem<0)
		has_ssystem = (Ssystem(-1, 0l, 0l)==E_OK ? TRUE : FALSE);
	
	/* Den Timer auslesen, bevorzugt per Ssystem, */
	/* andernfalls eben per Supervisor-Mode!      */
	if (has_ssystem)
		return Ssystem(S_GETLVAL, (int32)_hz_200, 0L);
	else
		return Supexec(get_hz_200);
}

#undef _hz_200

/* Adresse der Struktur */
#define _sysbase ((SYSHDR **)0x4F2)

static int32 get_sysbase(void)
{
	SYSHDR *os_header = *_sysbase;
	
	return (UINT32)(os_header->os_base);
}

#undef _sysbase

SYSHDR *Ash_getOSHeader(void)
{
	return (SYSHDR *)Supexec(get_sysbase);
}

/* -------------------------------------------------------------------------- */

MAGX_COOKIE *Ash_getMagiC(void)
{
	static boolean is_read = FALSE;
	static MAGX_COOKIE *cookie = NULL;
	
	/* Ggf. den Cookie auslesen */
	if (!is_read)
	{
		if (!Ash_getcookie(C_MagX, &cookie))
			cookie = NULL;
		is_read = TRUE;
	}
	
	return cookie;
}

/* -------------------------------------------------------------------------- */

N_AESINFO *Ash_getNAES(void)
{
	static boolean is_read = FALSE;
	static N_AESINFO *cookie = NULL;
	
	/* Ggf. den Cookie auslesen */
	if (!is_read)
	{
		if (!Ash_getcookie(C_nAES, &cookie))
			cookie = NULL;
		is_read = TRUE;
	}
	
	return cookie;
}

/* -------------------------------------------------------------------------- */

int16 Ash_getMagiCVersion(void)
{
	MAGX_COOKIE *cookie = Ash_getMagiC();
	
	/* Cookie vorhanden? */
	if (cookie!=NULL)
	{
		/* MagiC-AES aktiv? */
		if (cookie->aesvars)
			return cookie->aesvars->version;		/* MagiC lÑuft, MagiC-AES aktiv */
		else
			return -2;									/* MagiC lÑuft, aber MagiC-AES inaktiv */
	}
	else
		return -1;										/* MagiC lÑuft nicht */
}

/* -------------------------------------------------------------------------- */

AESVARS *Ash_getMagiCAESVars(void)
{
	static boolean have_it = 0;
	static AESVARS *aesvars = NULL;
	
	/* Ggf. die Variablen bestimmen */
	if (!have_it)
	{
		MAGX_COOKIE *cookie = Ash_getMagiC();
		if (cookie!=NULL)
		{
			if (cookie->aesvars!=NULL)
				aesvars = cookie->aesvars;
			else
			{
				aesvars = (AESVARS *)Ash_getOSHeader()->os_magic;
				if (aesvars->magic != (int32)0x87654321L || aesvars->magic2 != 0x4d414758L) /* 'MAGX' */
					aesvars = NULL;
			}
		}
		
		/* Die Variablen wurden bestimmt! */
		have_it = TRUE;
	}
	
	return aesvars;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/*
 * These are implemented on pcgem.lib for Pure-C
 * (FIXME, they don't belong there)
 */

int16 fix31ToPixel(fix31 a)
{
   return (int16)((a+0x00010000l)>>16);
}

NVDI_STRUC *Ash_NVDICookie(void)
{
   /* Zeiger auf die NVDI-Versions-Infos (Cookie 'NVDI') */
   static NVDI_STRUC *nvdi_vers_info=NULL;
   static int16 nvdi_read=FALSE;

   /* Ggf. den Cookie suchen */
   if (!nvdi_read)
   {
      if (!Ash_getcookie(C_NVDI, &nvdi_vers_info))
         nvdi_vers_info=NULL;
      nvdi_read=TRUE;
   }

   return nvdi_vers_info;
}

uint16 Ash_NVDIVersion(void)
{
   NVDI_STRUC *cookie=Ash_NVDICookie();
   return (cookie!=NULL ? cookie->nvdi_version : 0);
}

uint32 Ash_NVDIDatum(void)
{
   NVDI_STRUC *cookie=Ash_NVDICookie();
   return (cookie!=NULL ? cookie->nvdi_datum : 0);
}

int16 Ash_CallEdDI(int16 fkt_nr)
{
   /* Zeiger auf die EdDI-Versions-Infos (Cookie 'EdDI') */
   static int16 (*eddi_func)(int16 fkt)=NULL;
   static int16 eddi_read=FALSE;

   /* Ggf. den Cookie suchen */
   if (!eddi_read)
   {
      if (!Ash_getcookie(C_EdDI, &eddi_func))
         eddi_func=NULL;
      eddi_read=TRUE;
   }

   if (eddi_func!=NULL)
      return (*eddi_func)(fkt_nr);
   else
      return -1;
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

/*
 * These are only implemented as macros in gemlib,
 * but need to be adressable as functions
 * for the module interface
 */
extern short aes_global[];
GlobalArray *_globl = (GlobalArray *)aes_global;

int16 (appl_init)(void)
{
   return mt_appl_init(_globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_read)(int16 rwid, int16 length, void *pbuff)
{
   return mt_appl_read(rwid, length, pbuff, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_write)(int16 rwid, int16 length, void *pbuff)
{
   return mt_appl_write(rwid, length, pbuff, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_find)(char *pname)
{
   return mt_appl_find(pname, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_tplay)(APPLRECORD *tbuffer, int16 tlength, int16 tscale)
{
   return mt_appl_tplay(tbuffer, tlength, tscale, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_trecord)(APPLRECORD *tbuffer, int16 tlength)
{
   return mt_appl_trecord(tbuffer, tlength, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_bvset)(uint16 bvdisk, uint16 bvhard)
{
   return mt_appl_bvset(bvdisk, bvhard, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_yield)(void)
{
   return mt_appl_yield(_globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_search)(int16 mode, char *fname, int16 *type, int16 *ap_id)
{
   return mt_appl_search(mode, fname, type, ap_id, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_exit)(void)
{
   return mt_appl_exit(_globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_getinfo)(int16 type, int16 *out1, int16 *out2, int16 *out3, int16 *out4)
{
   return mt_appl_getinfo(type, out1, out2, out3, out4, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_getinfo_str)(int16 type, char *str1, char *str2, char *str3, char *str4)
{
   return mt_appl_getinfo_str(type, str1, str2, str3, str4, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (appl_control)(int16 ap_cid, int16 ap_cwhat, void *ap_cout)
{
   return mt_appl_control(ap_cid, ap_cwhat, ap_cout, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

XEDITINFO *(edit_create)(void)
{
   return mt_edit_create(_globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_open)(OBJECT *tree, int16 obj)
{
   return mt_edit_open(tree, obj, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_close)(OBJECT *tree, int16 obj)
{
   mt_edit_close(tree, obj, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_delete)(XEDITINFO *editinfo)
{
   mt_edit_delete(editinfo, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_cursor)(OBJECT *tree, int16 obj, int16 whdl, int16 show)
{
   return mt_edit_cursor(tree, obj, whdl, show, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_evnt)(OBJECT *tree, int16 obj, int16 whdl,
            EVNT *events, int32 *errcode)
{
   return mt_edit_evnt(tree, obj, whdl, events, errcode, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_get_buf)(OBJECT *tree, int16 obj, char **buffer,
            int32 *buflen, int32 *txtlen)
{
   return mt_edit_get_buf(tree, obj, buffer, buflen, txtlen, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_get_format)(OBJECT *tree, int16 obj, int16 *tabwidth, int16 *autowrap)
{
   return mt_edit_get_format(tree, obj, tabwidth, autowrap, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_get_colour)(OBJECT *tree, int16 obj, int16 *tcolour, int16 *bcolour)
{
   return mt_edit_get_colour(tree, obj, tcolour, bcolour, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_get_color)(OBJECT *tree, int16 obj, int16 *tcolor, int16 *bcolor)
{
   return mt_edit_get_colour(tree, obj, tcolor, bcolor, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_get_font)(OBJECT *tree, int16 obj, int16 *fontID, int16 *fontH,
            boolean *fontPix, boolean *mono)
{
   return mt_edit_get_font(tree, obj, fontID, fontH, fontPix, mono, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_get_cursor)(OBJECT *tree, int16 obj, char **cursorpos)
{
   return mt_edit_get_cursor(tree, obj, cursorpos, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_get_pos)(OBJECT *tree, int16 obj, int16 *xscroll, int32 *yscroll,
            char **cyscroll, char **cursorpos, int16 *cx, int16 *cy)
{
   mt_edit_get_pos(tree, obj, xscroll, yscroll, cyscroll, cursorpos, cx, cy, _globl);
}

/* -------------------------------------------------------------------------- */

boolean (edit_get_dirty)(OBJECT *tree, int16 obj)
{
   return mt_edit_get_dirty(tree, obj, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_get_sel)(OBJECT *tree, int16 obj, char **bsel, char **esel)
{
   mt_edit_get_sel(tree, obj, bsel, esel, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_get_scrollinfo)(OBJECT *tree, int16 obj, int32 *nlines, int32 *yscroll,
            int16 *yvis, int16 *yval, int16 *ncols, int16 *xscroll, int16 *xvis)
{
   mt_edit_get_scrollinfo(tree, obj, nlines, yscroll, yvis, yval, ncols, xscroll,
               xvis, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_set_buf)(OBJECT *tree, int16 obj, char *buffer, int32 buflen)
{
   mt_edit_set_buf(tree, obj, buffer, buflen, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_set_format)(OBJECT *tree, int16 obj, int16 tabwidth,
            int16 autowrap)
{
   mt_edit_set_format(tree, obj, tabwidth, autowrap, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_set_colour)(OBJECT *tree, int16 obj, int16 tcolour,
            int16 bcolour)
{
   mt_edit_set_colour(tree, obj, tcolour, bcolour, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_set_color)(OBJECT *tree, int16 obj, int16 tcolor, int16 bcolor)
{
   mt_edit_set_colour(tree, obj, tcolor, bcolor, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_set_font)(OBJECT *tree, int16 obj, int16 fontID, int16 fontH,
            int16 fontPix, int16 mono)
{
   mt_edit_set_font(tree, obj, fontID, fontH, fontPix, mono, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_set_cursor)(OBJECT *tree, int16 obj, char *cursorpos)
{
   mt_edit_set_cursor(tree, obj, cursorpos, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_set_pos)(OBJECT *tree, int16 obj, int16 xscroll,
            int32 yscroll, char *cyscroll, char *cursorpos, int16 cx,
            int16 cy)
{
   mt_edit_set_pos(tree, obj, xscroll, yscroll, cyscroll, cursorpos, cx, cy, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_resized)(OBJECT *tree, int16 obj, int16 *oldrh, int16 *newrh)
{
   return mt_edit_resized(tree, obj, oldrh, newrh, _globl);
}

/* -------------------------------------------------------------------------- */

void (edit_set_dirty)(OBJECT *tree, int16 obj, boolean dirty)
{
   mt_edit_set_dirty(tree, obj, dirty, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (edit_scroll)(OBJECT *tree, int16 obj, int16 whdl, int32 yscroll,
            int16 xscroll)
{
   return mt_edit_scroll(tree, obj, whdl, yscroll, xscroll, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (evnt_keybd)(void)
{
   return mt_evnt_keybd(_globl);
}

/* -------------------------------------------------------------------------- */

int16 (evnt_button)(int16 ev_bclicks, uint16 ev_bmask,
            uint16 ev_bstate, int16 *ev_bmx, int16 *ev_bmy, int16 *ev_bbutton,
            int16 *ev_bkstate)
{
   return mt_evnt_button(ev_bclicks, ev_bmask, ev_bstate, ev_bmx, ev_bmy,
         ev_bbutton, ev_bkstate, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (evnt_mouse)(int16 ev_moflags, int16 ev_mox,
            int16 ev_moy, int16 ev_mowidth, int16 ev_moheight,
            int16 *ev_momx, int16 *ev_momy, int16 *ev_mobutton, int16 *ev_mokstate)
{
   return mt_evnt_mouse(ev_moflags, ev_mox, ev_moy, ev_mowidth, ev_moheight, ev_momx,
            ev_momy, ev_mobutton, ev_mokstate, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (evnt_mesag)(int16 *pbuff)
{
   return mt_evnt_mesag(pbuff, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (evnt_timer)(int16 ev_tlocount, int16 ev_thicount)
{
   return mt_evnt_timer(((int32)(ev_thicount)<<16) | (int32)(uint16)(ev_tlocount), _globl);
}

/* -------------------------------------------------------------------------- */

int16 (evnt_multi)(int16 ev_mflags, int16 ev_mbclicks, int16 ev_mbmask,
            int16 ev_mbstate, int16 ev_mm1flags, int16 ev_mm1x,
            int16 ev_mm1y, int16 ev_mm1width, int16 ev_mm1height,
            int16 ev_mm2flags, int16 ev_mm2x, int16 ev_mm2y,
            int16 ev_mm2width, int16 ev_mm2height, int16 *ev_mmgpbuff,
            int16 ev_mtlocount, int16 ev_mthicount, int16 *ev_mmox,
            int16 *ev_mmoy, int16 *ev_mmbutton, int16 *ev_mmokstate, int16 *ev_mkreturn,
            int16 *ev_mbreturn)
{
   return mt_evnt_multi(ev_mflags, ev_mbclicks, ev_mbmask, ev_mbstate, ev_mm1flags, ev_mm1x,
               ev_mm1y, ev_mm1width, ev_mm1height, ev_mm2flags, ev_mm2x, ev_mm2y,
               ev_mm2width, ev_mm2height, ev_mmgpbuff,
               ((int32)ev_mthicount<<16) | (int32)ev_mtlocount, ev_mmox, ev_mmoy, ev_mmbutton,
               ev_mmokstate, ev_mkreturn, ev_mbreturn, _globl);
}

/* -------------------------------------------------------------------------- */

#if 0
/* mt_evnt_xmulti not implemented in gemlib */
int16 (evnt_xmulti)(int16 ev_mflags, int16 ev_mbclicks, int16 ev_mbmask,
            int16 ev_mbstate, int16 ev_mm1flags, int16 ev_mm1x,
            int16 ev_mm1y, int16 ev_mm1width, int16 ev_mm1height,
            int16 ev_mm2flags, int16 ev_mm2x, int16 ev_mm2y,
            int16 ev_mm2width, int16 ev_mm2height, int16 *ev_mmgpbuff,
            int16 ev_mtlocount, int16 ev_mthicount, int16 *ev_mmox,
            int16 *ev_mmoy, int16 *ev_mmbutton, int16 *ev_mmokstate, int16 *ev_mkreturn,
            int16 *ev_mbreturn, int16 *ev_mwhlpbuff)
{
   return mt_evnt_xmulti(ev_mflags, ev_mbclicks, ev_mbmask, ev_mbstate, ev_mm1flags, ev_mm1x,
               ev_mm1y, ev_mm1width, ev_mm1height, ev_mm2flags, ev_mm2x, ev_mm2y,
               ev_mm2width, ev_mm2height, ev_mmgpbuff,
               ((int32)ev_mthicount<<16) | (int32)ev_mtlocount, ev_mmox, ev_mmoy, ev_mmbutton,
               ev_mmokstate, ev_mkreturn, ev_mbreturn, ev_mwhlpbuff, _globl);
}
#endif

/* -------------------------------------------------------------------------- */

void (EVNT_multi)(int16 ev_mflags, int16 ev_mbclicks, int16 ev_mbmask,
            int16 ev_mbstate, MOBLK *m1, MOBLK *m2, int32 ev_mtimer,
            EVNT *event)
{
   mt_EVNT_multi(ev_mflags, ev_mbclicks, ev_mbmask, ev_mbstate, m1, m2, ev_mtimer,
               event, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (evnt_event)(MultiEventIn *input, MultiEventOut *output)
{
   return mt_evnt_event(input, output, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (EvntMulti)(EVENT *evnt_data)
{
   return mt_EvntMulti(evnt_data, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (evnt_dclick)(int16 rate, int16 setit)
{
   return mt_evnt_dclick(rate, setit, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (fnts_add)(FNT_DIALOG *fnt_dialog, FNTS_ITEM *user_fonts)
{
   return mt_fnts_add(fnt_dialog, user_fonts, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_close)(FNT_DIALOG *fnt_dialog, int16 *x, int16 *y)
{
   return mt_fnts_close(fnt_dialog, x, y, _globl);
}

/* -------------------------------------------------------------------------- */

FNT_DIALOG *(fnts_create)(int16 vdi_handle, int16 no_fonts,
            int16 font_flags, int16 dialog_flags,
            const char *sample, const char *opt_button)
{
   return mt_fnts_create(vdi_handle, no_fonts, font_flags, dialog_flags, sample,
               opt_button, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_delete)(FNT_DIALOG *fnt_dialog, int16 vdi_handle)
{
   return mt_fnts_delete(fnt_dialog, vdi_handle, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_do)(FNT_DIALOG *fnt_dialog, int16 button_flags, int32 id_in,
            int32 pt_in, int32 ratio_in, int16 *check_boxes,
            int32 *id, fix31 *pt, int32 *ratio)
{
   return mt_fnts_do(fnt_dialog, button_flags, id_in, pt_in, ratio_in, check_boxes,
               id, pt, ratio, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_evnt)(FNT_DIALOG *fnt_dialog, EVNT *events, int16 *button,
            int16 *check_boxes, int32 *id, fix31 *pt, fix31 *ratio)
{
   return mt_fnts_evnt(fnt_dialog, events, button, check_boxes, id, pt, ratio, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_get_info)(FNT_DIALOG *fnt_dialog, int32 id, int16 *mono,
            int16  *outline)
{
   return mt_fnts_get_info(fnt_dialog, id, mono, outline, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_get_name)(FNT_DIALOG *fnt_dialog, int32 id, char *full_name,
            char *family_name, char *style_name)
{
   return mt_fnts_get_name(fnt_dialog, id, full_name, family_name, style_name, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_get_no_styles)(FNT_DIALOG *fnt_dialog, int32 id)
{
   return mt_fnts_get_no_styles(fnt_dialog, id, _globl);
}

/* -------------------------------------------------------------------------- */

int32 (fnts_get_style)(FNT_DIALOG *fnt_dialog, int32 id, int16 index)
{
   return mt_fnts_get_style(fnt_dialog, id, index, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_open)(FNT_DIALOG *fnt_dialog, int16 button_flags, int16 x,
            int16 y, int32 id, fix31 pt, fix31 ratio)
{
   return mt_fnts_open(fnt_dialog, button_flags, x, y, id, pt, ratio, _globl);
}

/* -------------------------------------------------------------------------- */

void (fnts_remove)(FNT_DIALOG *fnt_dialog)
{
   mt_fnts_remove(fnt_dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fnts_update)(FNT_DIALOG *fnt_dialog, int16 button_flags,
            int32 id, fix31 pt, int32 ratio)
{
   return mt_fnts_update(fnt_dialog, button_flags, id, pt, ratio, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (form_do)(OBJECT *tree, int16 start)
{
   return mt_form_do(tree, start, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_dial)(int16 flag, int16 xlittle, int16 ylittle,
            int16 wlittle, int16 hlittle, int16 xbig, int16 ybig,
            int16 wbig, int16 hbig)
{
   return mt_form_dial(flag, xlittle, ylittle, wlittle, hlittle,
               xbig, ybig, wbig, hbig, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_alert)(int16 defbutton, const char *string)
{
   return mt_form_alert(defbutton, string, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_error)(int16 errnum)
{
   return mt_form_error(errnum, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_center)(OBJECT *tree, int16 *x, int16 *y, int16 *w, int16 *h)
{
   return mt_form_center(tree, x, y, w, h, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_center_grect)(OBJECT *tree, GRECT *r)
{
   return mt_form_center_grect(tree, r, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_keybd)(OBJECT *tree, int16 obj, int16 next,
            int16 input_char, int16 *next_obj, int16 *pchar)
{
   return mt_form_keybd(tree, obj, next, input_char, next_obj, pchar, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_button)(OBJECT *tree, int16 obj, int16 clicks, int16 *next_obj)
{
   return mt_form_button(tree, obj, clicks, next_obj, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_popup)(OBJECT *tree, int16 x, int16 y)
{
   return mt_form_popup(tree, x, y, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_wbutton)(OBJECT *fo_btree, int16 fo_bobject,
               int16 fo_bclicks, int16 *fo_bnxtobj, int16 whandle)
{
   return mt_form_wbutton(fo_btree, fo_bobject, fo_bclicks, fo_bnxtobj, whandle, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_xdial)(int16 fo_diflag, int16 fo_dilittlx, int16 fo_dilittly,
            int16 fo_dilittlw, int16 fo_dilittlh, int16 fo_dibigx,
            int16 fo_dibigy, int16 fo_dibigw, int16 fo_dibigh,
            void **flydial)
{
   return mt_form_xdial(fo_diflag, fo_dilittlx, fo_dilittly, fo_dilittlw, fo_dilittlh,
               fo_dibigx, fo_dibigy, fo_dibigw, fo_dibigh, flydial, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_xdial_grect)(int16 fo_diflag, const GRECT *fo_dilittl, const GRECT *fo_dibig,
            void **flydial)
{
   return mt_form_xdial_grect(fo_diflag, fo_dilittl, fo_dibig, flydial, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_xdo)(OBJECT *tree, int16 startob,
            int16 *lastcrsr, const XDO_INF *tabs, void *flydial)
{
   return mt_form_xdo(tree, startob, lastcrsr, tabs, flydial, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (form_xerr)(int32 errcode, const char *errfile)
{
   return mt_form_xerr(errcode, errfile, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (fsel_input)(char *path, char *name, int16 *button)
{
   return mt_fsel_input(path, name, button, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fsel_exinput)(char *path, char *name, int16 *button, const char *label)
{
   return mt_fsel_exinput(path, name, button, label, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fsel_boxinput)(char *path, char *name, int16 *button, const char *label,
            FSEL_CALLBACK callback)
{
   return mt_fsel_boxinput(path, name, button, label, callback, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void *(fslx_open)(const char *title, int16 x, int16 y, int16 *handle, char *path,
            int16 pathlen, char *fname, int16 fnamelen, char *patterns,
            XFSL_FILTER *filter, char *paths, int16 sort_mode, int16 flags)
{
   return mt_fslx_open(title, x, y, handle, path, pathlen, fname, fnamelen, patterns,
            filter, paths, sort_mode, flags, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fslx_close)(void *fsd)
{
   return mt_fslx_close(fsd, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fslx_getnxtfile)(void *fsd, char *fname)
{
   return mt_fslx_getnxtfile(fsd, fname, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fslx_evnt)(void *fsd, EVNT *events, char *path, char *fname, int16 *button,
            int16 *nfiles, int16 *sort_mode, char **pattern)
{
   return mt_fslx_evnt(fsd, events, path, fname, button, nfiles, sort_mode, pattern, _globl);
}

/* -------------------------------------------------------------------------- */

void *(fslx_do)(const char *title, char *path, int16 pathlen, char *fname,
            int16 fnamelen, char *patterns, XFSL_FILTER *filter, char *paths,
            int16 *sort_mode, int16 flags, int16 *button, int16 *nfiles,
            char **pattern)
{
   return mt_fslx_do(title, path, pathlen, fname, fnamelen, patterns, filter, paths,
               sort_mode, flags, button, nfiles, pattern, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (fslx_set_flags)(int16 flags, int16 *oldval)
{
   return mt_fslx_set_flags(flags, oldval, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (graf_rubbox)(int16 x, int16 y, int16 w_min,
            int16 h_min, int16 *w_end, int16 *h_end)
{
   return mt_graf_rubberbox(x, y, w_min, h_min, w_end, h_end, _globl);
}

int16 (mt_graf_rubbox)(int16 x, int16 y, int16 w_min,
               int16 h_min, int16 *w_end, int16 *h_end, GlobalArray *globl)
{
   return (mt_graf_rubberbox)(x, y, w_min, h_min, w_end, h_end, globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_rubberbox)(int16 x, int16 y, int16 w_min,
            int16 h_min, int16 *w_end, int16 *h_end)
{
   return mt_graf_rubberbox(x, y, w_min, h_min, w_end, h_end, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_rubbbox)(int16 x, int16 y, int16 w_min,
            int16 h_min, int16 *w_end, int16 *h_end)
{
   return mt_graf_rubberbox(x, y, w_min, h_min, w_end, h_end, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_dragbox)(int16 w, int16 h, int16 sx, int16 sy,
            int16 xc, int16 yc, int16 wc, int16 hc,
            int16 *x, int16 *y)
{
   return mt_graf_dragbox(w, h, sx, sy, xc, yc, wc, hc, x, y, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_mbox)(int16 w, int16 h, int16 start_x, int16 start_y,
            int16 ende_x, int16 ende_y)
{
   return mt_graf_mbox(w, h, start_x, start_y, ende_x, ende_y, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_movebox)(int16 w, int16 h, int16 start_x, int16 start_y,
            int16 ende_x, int16 ende_y)
{
   return mt_graf_mbox(w, h, start_x, start_y, ende_x, ende_y, NULL);
}

/* -------------------------------------------------------------------------- */

int16 (graf_growbox)(int16 start_x, int16 start_y, int16 start_w,
            int16 start_h, int16 ende_x, int16 ende_y, int16 ende_w,
            int16 ende_h)
{
   return mt_graf_growbox(start_x, start_y, start_w, start_h,
               ende_x, ende_y, ende_w, ende_h, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_shrinkbox)(int16 start_x, int16 start_y, int16 start_w,
            int16 start_h, int16 ende_x, int16 ende_y, int16 ende_w,
            int16 ende_h)
{
   return mt_graf_shrinkbox(start_x, start_y, start_w, start_h,
               ende_x, ende_y, ende_w, ende_h, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_watchbox)(OBJECT *tree, int16 obj_nr, int16 instate,
            int16 outstate)
{
   return mt_graf_watchbox(tree, obj_nr, instate, outstate, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_wwatchbox)(OBJECT *gr_wptree, int16 gr_wobject,
            int16 gr_winstate, int16 gr_woutstate, int16 whandle)
{
   return mt_graf_wwatchbox(gr_wptree, gr_wobject, gr_winstate,
               gr_woutstate, whandle, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_slidebox)(OBJECT *tree, int16 parent, int16 obj_nr,
            int16 isvert)
{
   return mt_graf_slidebox(tree, parent, obj_nr, isvert, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_handle)(int16 *wchar, int16 *hchar, int16 *wbox, int16 *hbox)
{
   return mt_graf_handle(wchar, hchar, wbox, hbox, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_xhandle)(int16 *wchar, int16 *hchar, int16 *wbox, int16 *hbox, int16 *device)
{
   return mt_graf_xhandle(wchar, hchar, wbox, hbox, device, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_mouse)(int16 mouse_nr, MFORM *form)
{
   return mt_graf_mouse(mouse_nr, form, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_mkstate)(int16 *x, int16 *y, int16 *mstate, int16 *kstate)
{
   return mt_graf_mkstate(x, y, mstate, kstate, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (graf_multirubber)(int16 x, int16 y, int16 minw, int16 minh,
            GRECT *rec, int16 *outw, int16 *outh)
{
   return mt_graf_multirubber(x, y, minw, minh, rec, outw, outh, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

void (lbox_ascroll_to)(LIST_BOX *box, int16 first, GRECT *box_rect, GRECT *slider_rect)
{
   mt_lbox_ascroll_to(box, first, box_rect, slider_rect, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_scroll_to)(LIST_BOX *box, int16 first, GRECT *box_rect, GRECT *slider_rect)
{
   mt_lbox_ascroll_to(box, first, box_rect, slider_rect, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_bscroll_to)(LIST_BOX *box, int16 first, GRECT *box_rect, GRECT *slider_rect)
{
   mt_lbox_bscroll_to(box, first, box_rect, slider_rect, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_cnt_items)(LIST_BOX *box)
{
   return mt_lbox_cnt_items(box, _globl);
}

/* -------------------------------------------------------------------------- */

LIST_BOX *(lbox_create)(OBJECT *tree, SLCT_ITEM slct, SET_ITEM set, LBOX_ITEM *items,
            int16 visible_a, int16 first_a, const int16 *ctrl_objs,
            const int16 *objs, int16 flags, int16 pause_a, void *user_data,
            DIALOG *dialog, int16 visible_b, int16 first_b, int16 entries_b,
            int16 pause_b)
{
   return mt_lbox_create(tree, slct, set, items, visible_a, first_a, ctrl_objs, objs, flags,
      pause_a, user_data, dialog, visible_b, first_b, entries_b, pause_b, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_delete)(LIST_BOX *box)
{
   return mt_lbox_delete(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_do)(LIST_BOX *box, int16 obj)
{
   return mt_lbox_do(box, obj, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_free_items)(LIST_BOX *box)
{
   mt_lbox_free_items(box, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_free_list)(LBOX_ITEM *items)
{
   mt_lbox_free_list(items, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_afirst)(LIST_BOX *box)
{
   return mt_lbox_get_afirst(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_first)(LIST_BOX *box)
{
   return mt_lbox_get_afirst(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_avis)(LIST_BOX *box)
{
   return mt_lbox_get_visible(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_visible)(LIST_BOX *box)
{
   return mt_lbox_get_visible(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_bentries)(LIST_BOX *box)
{
   return mt_lbox_get_bentries(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_bfirst)(LIST_BOX *box)
{
   return mt_lbox_get_bfirst(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_bvis)(LIST_BOX *box)
{
   return mt_lbox_get_bvis(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_idx)(LBOX_ITEM *items, LBOX_ITEM *search)
{
   return mt_lbox_get_idx(items, search, _globl);
}

/* -------------------------------------------------------------------------- */

LBOX_ITEM *(lbox_get_item)(LIST_BOX *box, int16 n)
{
   return mt_lbox_get_item(box, n, _globl);
}

/* -------------------------------------------------------------------------- */

LBOX_ITEM *(lbox_get_items)(LIST_BOX *box)
{
   return mt_lbox_get_items(box, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (lbox_get_slct_idx)(LIST_BOX *box)
{
   return mt_lbox_get_slct_idx(box, _globl);
}

/* -------------------------------------------------------------------------- */

LBOX_ITEM *(lbox_get_slct_item)(LIST_BOX *box)
{
   return mt_lbox_get_slct_item(box, _globl);
}

/* -------------------------------------------------------------------------- */

OBJECT *(lbox_get_tree)(LIST_BOX *box)
{
   return mt_lbox_get_tree(box, _globl);
}

/* -------------------------------------------------------------------------- */

void *(lbox_get_udata)(LIST_BOX *box)
{
   return mt_lbox_get_udata(box, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_set_asldr)(LIST_BOX *box, int16 first, GRECT *rect)
{
   mt_lbox_set_asldr(box, first, rect, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_set_slider)(LIST_BOX *box, int16 first, GRECT *rect)
{
   mt_lbox_set_asldr(box, first, rect, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_set_bentries)(LIST_BOX *box, int16 entries)
{
   mt_lbox_set_bentries(box, entries, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_set_bsldr)(LIST_BOX *box, int16 first, GRECT *rect)
{
   mt_lbox_set_bsldr(box, first, rect, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_set_items)(LIST_BOX *box, LBOX_ITEM *items)
{
   mt_lbox_set_items(box, items, _globl);
}

/* -------------------------------------------------------------------------- */

void (lbox_update)(LIST_BOX *box, GRECT *rect)
{
   mt_lbox_update(box, rect, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (menu_bar)(OBJECT *tree, int16 show)
{
   return mt_menu_bar(tree, show, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_icheck)(OBJECT *tree, int16 item, int16 check)
{
   return mt_menu_icheck(tree, item, check, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_ienable)(OBJECT *tree, int16 item, int16 enable)
{
   return mt_menu_ienable(tree, item, enable, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_tnormal)(OBJECT *tree, int16 title, int16 normal)
{
   return mt_menu_tnormal(tree, title, normal, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_text)(OBJECT *tree, int16 item, char *text)
{
   return mt_menu_text(tree, item, text, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_register)(int16 apid, char *string)
{
   return mt_menu_register(apid, string, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_unregister)(int16 apid)
{
   return mt_menu_unregister(apid, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_click)(int16 click, int16 setit)
{
   return mt_menu_click(click, setit, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_attach)(int16 flag, OBJECT *tree, int16 item, MENU *mdata)
{
   return mt_menu_attach(flag, tree, item, mdata, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_istart)(int16 flag, OBJECT *tree, int16 imenu, int16 item)
{
   return mt_menu_istart(flag, tree, imenu, item, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_popup)(MENU *menu, int16 xpos, int16 ypos, MENU *mdata)
{
   return mt_menu_popup(menu, xpos, ypos, mdata, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (menu_settings)(int16 flag, MN_SET *set)
{
   return mt_menu_settings(flag, set, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (objc_add)(OBJECT *tree, int16 parent, int16 child)
{
   return mt_objc_add(tree, parent, child, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_delete)(OBJECT *tree, int16 objnr)
{
   return mt_objc_delete(tree, objnr, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_draw)(OBJECT *tree, int16 start, int16 depth, int16 xclip,
            int16 yclip, int16 wclip, int16 hclip)
{
   return mt_objc_draw(tree, start, depth, xclip, yclip, wclip, hclip, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_draw_grect)(OBJECT *tree, int16 start, int16 depth,
            const GRECT *r)
{
   return mt_objc_draw_grect(tree, start, depth, r, _globl);
}

/* -------------------------------------------------------------------------- */

void (objc_wdraw)(OBJECT *tree, int16 start, int16 depth, GRECT *clip,
            int16 whandle)
{
   mt_objc_wdraw(tree, start, depth, clip, whandle, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_find)(OBJECT *tree, int16 start, int16 depth,
            int16 mx, int16 my)
{
   return mt_objc_find(tree, start, depth, mx, my, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_offset)(OBJECT *tree, int16 objnr, int16 *x, int16 *y)
{
   return mt_objc_offset(tree, objnr, x, y, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_order)(OBJECT *tree, int16 objnr, int16 new_nr)
{
   return mt_objc_order(tree, objnr, new_nr, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_edit)(OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind)
{
   return mt_objc_edit(tree, objnr, inchar, idx, kind, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_xedit)(OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind, GRECT *r)
{
   return mt_objc_xedit(tree, objnr, inchar, idx, kind, r, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_wedit)(OBJECT *tree, int16 objnr, int16 inchar, int16 *idx,
            int16 kind, int16 whandle)
{
   return mt_objc_wedit(tree, objnr, inchar, idx, kind, whandle, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_change)(OBJECT *tree, int16 objnr, int16 reserved,
            int16 xclip, int16 yclip, int16 wclip, int16 hclip,
            int16 newstate, int16 redraw)
{
   return mt_objc_change(tree, objnr, reserved,  xclip, yclip, wclip, hclip, newstate,
               redraw, _globl);
}

/* -------------------------------------------------------------------------- */

void (objc_wchange)(OBJECT *tree, int16 objnr, int16 newstate,
            GRECT *clip, int16 whandle)
{
   mt_objc_wchange(tree, objnr, newstate, clip, whandle, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_sysvar)(int16 mode, int16 which, int16 in1, int16 in2,
            int16 *out1, int16 *out2)
{
   return mt_objc_sysvar(mode, which, in1, in2, out1, out2, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (objc_xfind)(OBJECT *obj, int16 start, int16 depth,
            int16 x, int16 y)
{
   return mt_objc_xfind(obj, start, depth, x, y, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (pdlg_add_printers)(PRN_DIALOG *prn_dialog, DRV_INFO *drv_info)
{
   return mt_pdlg_add_printers(prn_dialog, drv_info, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_add_sub_dialogs)(PRN_DIALOG *prn_dialog, PDLG_SUB *sub_dialog)
{
   return mt_pdlg_add_sub_dialogs(prn_dialog, sub_dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_close)(PRN_DIALOG *prn_dialog, int16 *x, int16 *y)
{
   return mt_pdlg_close(prn_dialog, x, y, _globl);
}

/* -------------------------------------------------------------------------- */

PRN_DIALOG *(pdlg_create)(int16 dialog_flags)
{
   return mt_pdlg_create(dialog_flags, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_delete)(PRN_DIALOG *prn_dialog)
{
   return mt_pdlg_delete(prn_dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_dflt_settings)(PRN_DIALOG *prn_dialog, PRN_SETTINGS *settings)
{
   return mt_pdlg_dflt_settings(prn_dialog, settings, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_do)(PRN_DIALOG *prn_dialog, PRN_SETTINGS *settings, char *document_name,
            int16 option_flags)
{
   return mt_pdlg_do(prn_dialog, settings, document_name, option_flags, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_evnt)(PRN_DIALOG *prn_dialog, PRN_SETTINGS *settings, EVNT *evnt, int16 *button)
{
   return mt_pdlg_evnt(prn_dialog, settings, evnt, button, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_free_settings)(PRN_SETTINGS *settings)
{
   return mt_pdlg_free_settings(settings, _globl);
}

/* -------------------------------------------------------------------------- */

int32 (pdlg_get_setsize)(void)
{
   return mt_pdlg_get_setsize(_globl);
}

/* -------------------------------------------------------------------------- */

PRN_SETTINGS *(pdlg_new_settings)(PRN_DIALOG *prn_dialog)
{
   return mt_pdlg_new_settings(prn_dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_open)(PRN_DIALOG *prn_dialog, PRN_SETTINGS *settings, char *document_name,
            int16 option_flags, int16 x, int16 y)
{
   return mt_pdlg_open(prn_dialog, settings, document_name, option_flags, x, y, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_remove_printers)(PRN_DIALOG *prn_dialog)
{
   return mt_pdlg_remove_printers(prn_dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_remove_sub_dialogs)(PRN_DIALOG *prn_dialog)
{
   return mt_pdlg_remove_sub_dialogs(prn_dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_update)(PRN_DIALOG *prn_dialog, char *document_name)
{
   return mt_pdlg_update(prn_dialog, document_name, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_use_settings)(PRN_DIALOG *prn_dialog, PRN_SETTINGS *settings)
{
   return mt_pdlg_use_settings(prn_dialog, settings, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (pdlg_validate_settings)(PRN_DIALOG *prn_dialog, PRN_SETTINGS *settings)
{
   return mt_pdlg_validate_settings(prn_dialog, settings, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (rsrc_load)(const char *name)
{
   return mt_rsrc_load(name, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (rsrc_free)(void)
{
   return mt_rsrc_free(_globl);
}

/* -------------------------------------------------------------------------- */

int16 (rsrc_gaddr)(int16 type, int16 id, void *addr)
{
   return mt_rsrc_gaddr(type, id, addr, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (rsrc_saddr)(int16 type, int16 id, void *addr)
{
   return mt_rsrc_saddr(type, id, addr, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (rsrc_obfix)(OBJECT *tree, int16 obj)
{
   return mt_rsrc_obfix(tree, obj, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (rsrc_rcfix)(void *rc_header)
{
   return mt_rsrc_rcfix(rc_header, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (scrp_read)(char *pathname)
{
   return mt_scrp_read(pathname, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (scrp_write)(char *pathname)
{
   return mt_scrp_write(pathname, _globl);
}

/* -------------------------------------------------------------------------- */
int16 (scrp_clear)(void)
{
   return mt_scrp_clear(_globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (shel_read)(char *cmd, char *tail)
{
   return mt_shel_read(cmd, tail, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (shel_write)(int16 do_execute, int16 is_graph, int16 is_overlay,
            char *cmd, char *tail)
{
   return mt_shel_write(do_execute, is_graph, is_overlay, cmd, tail, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (shel_get)(char *addr, int16 len)
{
   return mt_shel_get(addr, len, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (shel_put)(char *addr, int16 len)
{
   return mt_shel_put(addr, len, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (shel_find)(char *path)
{
   return mt_shel_find(path, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (shel_envrn)(char **value, char *name)
{
   return mt_shel_envrn(value, name, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (shel_rdef)(char *cmd, char *dir)
{
   return mt_shel_rdef(cmd, dir, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (shel_wdef)(char *cmd, char *dir)
{
   return mt_shel_wdef(cmd, dir, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (shel_help)(int16 mode, char *file, char *key)
{
   return mt_shel_help(mode, file, key, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

DIALOG *(wdlg_create)(HNDL_OBJ handle_exit, OBJECT *tree, void *user_data,
            int16 code, void *data, int16 flags)
{
   return mt_wdlg_create(handle_exit, tree, user_data, code, data, flags, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_open)(DIALOG *dialog, char *title, int16 kind, int16 x,
            int16 y, int16 code, void *data)
{
   return mt_wdlg_open(dialog, title, kind, x, y, code, data, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_close)(DIALOG *dialog, int16 *x, int16 *y)
{
   return mt_wdlg_close(dialog, x, y, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_delete)(DIALOG *dialog)
{
   return mt_wdlg_delete(dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_get_tree)(DIALOG *dialog, OBJECT **tree, GRECT *rect)
{
   return mt_wdlg_get_tree(dialog, tree, rect, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_get_edit)(DIALOG *dialog, int16 *cursor)
{
   return mt_wdlg_get_edit(dialog, cursor, _globl);
}

/* -------------------------------------------------------------------------- */

void *(wdlg_get_udata)(DIALOG *dialog)
{
   return mt_wdlg_get_udata(dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_get_handle)(DIALOG *dialog)
{
   return mt_wdlg_get_handle(dialog, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_set_edit)(DIALOG *dialog, int16 obj)
{
   return mt_wdlg_set_edit(dialog, obj, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_set_tree)(DIALOG *dialog, OBJECT *new_tree)
{
   return mt_wdlg_set_tree(dialog, new_tree, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_set_size)(DIALOG *dialog, GRECT *new_size)
{
   return mt_wdlg_set_size(dialog, new_size, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_set_iconify)(DIALOG *dialog, GRECT *g, char *title, OBJECT *tree, int16 obj)
{
   return mt_wdlg_set_iconify(dialog, g, title, tree, obj, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_set_uniconify)(DIALOG *dialog, GRECT *g, char *title, OBJECT *tree)
{
   return mt_wdlg_set_uniconify(dialog, g, title, tree, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wdlg_evnt)(DIALOG *dialog, EVNT *events)
{
   return mt_wdlg_evnt(dialog, events, _globl);
}

/* -------------------------------------------------------------------------- */

void (wdlg_redraw)(DIALOG *dialog, GRECT *rect, int16 obj, int16 depth)
{
   mt_wdlg_redraw(dialog, rect, obj, depth, _globl);
}

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

int16 (wind_create)(int16 kind, int16 max_x, int16 max_y,
            int16 max_w, int16 max_h)
{
   return mt_wind_create(kind, max_x, max_y, max_w, max_h, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_create_grect)(int16 kind, const GRECT *r)
{
   return mt_wind_create_grect(kind, r, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_open)(int16 handle, int16 x, int16 y,
            int16 w, int16 h)
{
   return mt_wind_open(handle, x, y, w, h, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_open_grect)(int16 handle, const GRECT *g)
{
   return mt_wind_open_grect(handle, g, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_close)(int16 handle)
{
   return mt_wind_close(handle, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_delete)(int16 handle)
{
   return mt_wind_delete(handle, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_get)(int16 handle, int16 what, ...)
{
   /* FÅr die Behandlung der variablen Parameter */
   va_list args;
   short *w1, *w2, *w3, *w4;
   
   va_start(args, what);
   w1 = va_arg(args, short *);
   w2 = va_arg(args, short *);
   w3 = va_arg(args, short *);
   w4 = va_arg(args, short *);
   va_end(args);
   return mt_wind_get(handle, what, w1, w2, w3, w4, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_getQSB)(int16 handle, void **buffer, int32 *length)
{
   return mt_wind_getQSB(handle, buffer, length, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_get_grect)(int16 handle, int16 what, GRECT *r)
{
   return mt_wind_get_grect(handle, what, r, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_get_int)(int16 handle, int16 what, int16 *g1)
{
   return mt_wind_get_int(handle, what, g1, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_xget_grect)(int16 handle, int16 what, const GRECT *clip, GRECT *r)
{
   return mt_wind_xget_grect(handle, what, clip, r, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_set)(int16 handle, int16 what, ...)
{
   /* FÅr die Behandlung der variablen Parameter */
   va_list args;
   short w1, w2, w3, w4;
   
   va_start(args, what);
   w1 = va_arg(args, int);
   w2 = va_arg(args, int);
   w3 = va_arg(args, int);
   w4 = va_arg(args, int);
   va_end(args);
   return mt_wind_set(handle, what, w1, w2, w3, w4, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_xset_grect)(int16 handle, int16 what, const GRECT *xywh, GRECT *ret)
{
   return mt_wind_xset_grect(handle, what, xywh, ret, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_set_grect)(int16 handle, int16 what, const GRECT *xywh)
{
   return mt_wind_set_grect(handle, what, xywh, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_set_str)(int16 handle, int16 what, const char *str)
{
   return mt_wind_set_str(handle, what, str, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_set_int)(int16 handle, int16 what, int g1)
{
   return mt_wind_set_int(handle, what, g1, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_find)(int16 x, int16 y)
{
   return mt_wind_find(x, y, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_update)(int16 what)
{
   return mt_wind_update(what, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_calc)(int16 wtype, int16 kind, int16 x, int16 y,
            int16 w, int16 h, int16 *px, int16 *py, int16 *pw, int16 *ph)
{
   return mt_wind_calc(wtype, kind, x, y, w, h, px, py, pw, ph, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_calc_grect)(int16 wtype, int16 kind, const GRECT *input,
            GRECT *output)
{
   return mt_wind_calc_grect(wtype, kind, input, output, _globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_new)(void)
{
   return mt_wind_new(_globl);
}

/* -------------------------------------------------------------------------- */

int16 (wind_draw)(int16 handle, int16 startob)
{
   return mt_wind_draw(handle, startob, _globl);
}

#endif /* __GNUC__ */
