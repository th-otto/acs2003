/*********************************************************************/
/*                                                                   */
/* This file was created with ACS3.00 at Sun Jul 10 17:12:56 2022    */
/*                                                                   */
/* The contents are based on file:                                   */
/*    C:\SRC\ACS\MODULE\DATEI2\DATEI2.ACS                            */
/*                                                                   */
/* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els„sser */
/*********************************************************************/


/*		PLATFORM		*/
#define ACS_ATARI


/*		ALERTBOXES		*/



/*		STRINGS		*/



/*		ICONS		*/

extern CICONBLK DIRECTORY;
extern CICONBLK IFILE;
extern CICONBLK I_DIR;


/*		POPUP TREES		*/



/*		OBJECT TREES		*/



/*		WINDOWS		*/

extern Awindow23x F_DIR;


/*		ANSI-C Prototypes		*/

extern INT16 CDECL A_3Dbutton( PARMBLK *pb );
extern INT16 CDECL A_arrows( PARMBLK *pb );
extern INT16 CDECL A_boxed( PARMBLK *pb );
extern INT16 CDECL A_checkbox( PARMBLK *pb );
extern INT16 CDECL A_cycle( PARMBLK *pb );
extern INT16 CDECL A_ftext( PARMBLK *pb );
extern INT16 CDECL A_innerframe( PARMBLK *pb );
extern INT16 Auo_boxed( OBJECT *entry, INT16 task, void *in_out );
extern INT16 Auo_cycle( OBJECT *entry, INT16 task, void *in_out );
extern INT16 Auo_ftext( OBJECT *entry, INT16 task, void *in_out );
extern INT16 Auo_string( OBJECT *entry, INT16 task, void *in_out );
static void drag_drive( void );
static void new_drive( void );


