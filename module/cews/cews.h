/*********************************************************************/
/*                                                                   */
/* This file was created with ACS3.00 at Fri Jul 15 17:53:00 2022    */
/*                                                                   */
/* The contents are based on file:                                   */
/*    C:\SRC\ACS\MODULE\CEWS\CEWS.ACS                                */
/*                                                                   */
/* (c) 1991-2003 by Stefan Bachert, Oliver Michalak, Martin Els„sser */
/*********************************************************************/


/*		PLATFORM		*/
#define ACS_ATARI


/*		ALERTBOXES		*/

extern char A_NO_ASSI [48];
extern char A_NO_COM [47];
extern char A_NO_LINK [45];


/*		STRINGS		*/

extern char FS_FILESEL [17];
extern char FS_PATHSEL [12];
extern char FS_PRGSEL [16];


/*		ICONS		*/



/*		OBJECT TREES		*/



/*		ANSI-C Prototypes		*/

static void add_modul( void );
static void assi( void );
static void compile( void );
static void debug( void );
static void drag_edit( void );
static void edit( void );
static void file( void );
static void help( void );
static int16 init_menu( Awindow *wind );
static int16 key_menu( Awindow *wind, int16 kstate, int16 key );
static void launch( void );
static void link( void );
static Awindow *make_menu( void *para );
static void o_launch( void );
static void o_load( void );
static void o_save( void );
static void prg_sel( void );
static void projectile( void );
static void search( void );
static int16 service_menu( Awindow *wind, int16 task, void *in_out );
static void sort_file( void );
static void t_cycle( void );


