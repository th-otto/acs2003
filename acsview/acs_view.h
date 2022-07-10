/*********************************************************************/
/*                                                                   */
/* This file was created with ACS3.00 at Sun Jul 10 10:43:18 2022    */
/*                                                                   */
/* The contents are based on file:                                   */
/*    C:\SRC\ACS\ACSVIEW\ACS_VIEW.ACS                                */
/*                                                                   */
/* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els„sser */
/*********************************************************************/


/*		PLATFORM		*/
#define ACS_ATARI


/*		ALERTBOXES		*/



/*		STRINGS		*/



/*		ICONS		*/



/*		OBJECT TREES		*/



/*		WINDOWS		*/



extern Adescr ACSdescr;



/*		ANSI-C Prototypes		*/

extern INT16 CDECL A_picture( PARMBLK *pb );
extern INT16 Auo_picture( OBJECT *entry, INT16 task, void *in_out );
extern Awindow *make_img( void *para );
static void md_proto( void );
extern Awindow *new_view( void *para );


