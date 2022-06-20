{$IFDEF FPC}
{$MODE FPC}
{$DEFINE HAVE_CDECL}
{$MODESWITCH OUT+}
{$LONGSTRINGS OFF} { this unit always uses shortstrings }
{$PACKRECORDS 2}
{$ELSE}
{$Z-}
{$ENDIF}

UNIT acs;

INTERFACE

USES
{$IFDEF FPC}
    aes, vdi,
{$ENDIF}
    gem;

{$IFNDEF FPC}
type
   smallint = integer;
   Psmallint = ^smallint;
   Longword = longint;
{$ENDIF}

Const __PS__ 		=	(127 + 1);	(* Pathsize *)
		MAX_CFGLEN	=	8192;			(* Maximale LÑnge eines Konfig-Strings insgesamt! *)

type

	PCharPtr = ^PChar;
	
	AwindowPtr = ^Awindow;

	Aaction = Procedure;
	Acreate = Function (x: Pointer): AwindowPtr;
	AcreatePtr = ^Acreate;
	Aretint = Function: Integer;

	AOBJECTPtr = ^AOBJECT;
	AOBJECT = Record
		click:	Aaction;	{ action on exit, touchexit or dclick }
		drag:		Aaction;	{ action on drag }
		ob_flags:	Word;		{ ob_flags, must be same as in OBJECT }
											{ since it will be checked }
		key:		Word;			{ key for selecting }
		userp1:	Pointer;	{ user pointers }
		userp2:	Pointer;
		mo_index:	Integer;	{ mouse index upon this field }
								{ contains title number for menues }
		aob_type:	Integer;	{ Object type (not AES type) }
	End;

	ACSOBJECTPtr = ^ACSOBJECT;
	ACSOBJECT = Record
	  case boolean of
		false: (aes: AESOBJECT);
		true:  (acs: AOBJECT);
	End;

	ACSTreePtr = ^ACSTree;
	ACSTree = Array [0..8191] of ACSOBJECT;

	AUSERBLKPtr = ^AUSERBLK;
	AUSERBLK = Record
		ub_code:	Function (dummy1, dummy2: Pointer; pb: PARMBLKPtr): Integer;
		ub_parm:	LongInt;
		ub_serv:	Function (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer): Boolean;
		ub_ptr1:	Pointer;
		ub_ptr2:	Pointer;
		ub_ptr3:	Pointer;
	End;

	AmousePtr = ^Amouse;
	Amouse = Record
		number: Integer;		{ Mousenumber 255=Userdef }
		form:	MFORMPtr;		{ Mouseform or NULL }
	End;

	AxywhPtr = ^Axywh;
	Axywh = Record
		x: Integer;
		y: Integer;
		w: Integer;
		h: Integer;
	End;

	Awindow = Record
		user:		Pointer;			{ Users pointer }
		service:	Function (w: AwindowPtr; task: Integer; in_out: Pointer): Boolean;
		create:		Function (a: Pointer): AwindowPtr;
		open:		Function (w: AwindowPtr): Integer;
		init:		Function (w: AwindowPtr): Integer;
		work:		ACSTreePtr;			{ Object within window }
		toolbar:	ACSTreePtr;			{ Toolbar }
		ob_edit, ob_col: Integer;		{ ob nr and act column }
			{ GEM attributes }
		wi_id:		Integer;			{ gem window id or -1 }
		wi_kind:	Integer;			{ window attributes }
	    wi_act:		Axywh;				{ actual outer coordinates }
		wi_normal:	Axywh;				{ normal outer0coordinates }
		wi_work:	Axywh;				{ inner size without menu }
		wi_slider:	Axywh;				{ last set slider˙(init -1) }
		wi_nx, wi_ny:	Integer;		{ normal offset zero or negative }
		snap_mask:	Word;				{ snap mask due to pattern offset }
		name:		PChar;				{ points to name }
		info:		PChar;				{ points to info }
			{ ACS attributes }
		ob_len:	Integer;			{ type of this window }
		kind:		Integer;			{ own attributes }
		state:		Integer;			{ state of window }
		icon:		Integer;			{ objectnr in root window, -1 if not }
		iconblk:	CICONBLKPtr;			{ defines the Iconimage, NULL means default Iconz}
			{ Menue }
		menu:		ACSTreePtr;			{ menuetree OBJECT }
		{ Keyboard }
		keys:		Function (w: AwindowPtr; kstate: Integer; key: Integer): Integer;
		{ mouse select }
		obchange:	Procedure (w: AwindowPtr; obnr: Integer; new_state: Integer);	{ change state of this ob }

		{ window attribute reactions }
		redraw:		Procedure (w: AwindowPtr; r: AxywhPtr);		{ Redraw }
		topped:		Procedure (w: AwindowPtr);					{ Topped }
		closed:		Procedure (w: AwindowPtr);					{ closed }
		fulled:		Procedure (w: AwindowPtr);					{ fulled }
		arrowed:	Procedure (w: AwindowPtr; wh: Integer);		{ arrowed }
		hslid:		Procedure (w: AwindowPtr; p: Integer);		{ hslide }
		vslid:		Procedure (w: AwindowPtr; p: Integer);		{ vslide }
		sized:		Procedure (w: AwindowPtr; r: AxywhPtr);		{ size }
		moved:		Procedure (w: AwindowPtr; r: AxywhPtr);		{ move }
	End;

	AdescrPtr = ^Adescr;
	Adescr = Record					{ Description start }
		magic:		packed array [0..7] of char;	{ Magic "ACS 102" }
		version:	Integer;		{ Version * 102 }
		dx,dy:		Integer;		{ virtuell desktop increments }
		flags:		Integer;		{ commom flags }
		acc_reg:	packed array [0..31] of char;	{ Accessory register message }
		root:			AwindowPtr;		{ Root window }
		acc:			AwindowPtr;		{ Accessory first window }
		mouse:		Array [0..31] of Amouse;	{ 32 Mouseforms }
		mess:			Array [0..33] of PChar;	{ eigentlich Textzeiger }
	End;

	AselPtr = ^Asel;
	Asel = Record				{ list of selected Objects }
		window:	AwindowPtr;	{ the objects belong to this window }
		maxlen:	Integer;		{ max entries in list }
		actlen:	Integer;		{ actual count }
		next:	Integer;		{ next entry return by Adr_next }
		dragback:	Integer;	{ drag still selected ob back to origin }
		x, y:	Integer;		{ position during pick up }
		rx, ry:	Integer;		{ relativ dragged distance }
		parray:	PInteger;		{ points to array of obnr's (Integer) }
	End;

	AwiobPtr = ^Awiob;
	Awiob = Record
		window:	AwindowPtr;
		entry:	ACSOBJECTPtr;
		obnr:		Integer;
	End;

	AblkPtr = ^Ablk;
	Ablk = Record
		gl_apid:		Integer;
		phys_handle:	Integer;
		gl_wattr:		Integer;
		gl_hattr:		Integer;
		desk:			Axywh;
		vdi_handle:		Integer;
		gl_wbox:		Integer;
		gl_hbox:		Integer;
		gl_wchar:		Integer;
		gl_hchar:		Integer;
		ncolors:		Integer;
		nplanes:		Integer;
		appname:		packed array [1..__PS__] of char;
		apppath:		packed array [1..__PS__] of char;
		apppara:		packed array [1..__PS__] of char;
		appfrom:		packed array [1..__PS__] of char;
		basename:		packed array [1..20] of char;
		ev_mtcount:		LongInt;
		application:	Integer;
		multitask:		Integer;
		appexit:		Integer;
		description:	AdescrPtr;
		Aselect:		Asel;
		ev_window:		AwindowPtr;
		ev_object:		ACSTreePtr;
		ev_obnr:			Integer;
		ev_mmox, ev_mmoy:	Integer;
		ev_mmokstate:	Integer;
		dia_abort:		Integer;
		screenMFDB:		MFDB;
		apterm:			Integer;
		AESglobal:		Pointer;
		fonts:			Integer;
		argc:			Integer;
		argv:			PCharPtr;
		env:			PCharPtr;
		fontid:			Integer;
		fheight:		Integer;
		fontsid:		Integer;
		fsheight:		Integer;
		ACSterm:		Procedure;
		ACSaboutme:		Procedure;
		ACSclose:		Procedure;
		ACSmessage:		Procedure (var ev_mgpbuff : ARRAY_8);
		ACSmproto:		Procedure (var ev_mgpbuff : ARRAY_8);
		ACStimer:		Procedure;
		ACSinit0:		Function: Integer;
		dither:			Integer;
		ACSkey:			Procedure (var kstate, key: Integer);
		ACSbutton:		Procedure (var button, breturn: Integer);
		ACSmouse:		Procedure;
		ACSwikey:		Procedure (var kstate, key: Integer);
		ev_bmask:		Integer;
		ev_bstate:		Integer;
		ev_mmobutton: 	Integer;
		ev_mbreturn:	Integer;
		ev_mkreturn:	Integer;
		ev_mbclicks:	Integer;
		DEBUG_MEM:		Procedure (defective: Pointer);
		cfg_path:		packed array [1..__PS__] of char;
		scrp_path:		packed array [1..__PS__]of char;
		ACSerror:		Procedure (mess: Integer; para: Pointer);
		menu_id:		Integer;
		dd_name:		PChar;
		alert_name:	PChar;
		mfsel_count:	Integer;
		separator: packed array [1..256] of char;
	End;

	A_ddPtr = ^A_dd;			{ OM: A_dd_Struktur }
	A_dd = Record
		id:			Integer;
		dd_type:		Longint;
		xacc_val:		Word;
		xacc_name:	PChar;
		va_val:			packed array[1..3] of Word;
		va_name:		PChar;
	End;

	IMG_HEADERPTR = ^IMG_HEADER;
	IMG_HEADER = Record
		version:	Integer;
		headlen:	Integer;
		planes:		Integer;
		pat_run:	Integer;
		pix_width:	Integer;
		pix_height:	Integer;
		slwidth:	Integer;
		slheight:	Integer;
	End;

	RGB_LISTPTR = ^RGB_LIST;
	RGB_LIST = Record
		red:	Word;
		green:	Word;
		blue:	Word;
	End;

	XIMG_HEADERPTR = ^IMG_HEADER;
	XIMG_HEADER = Record
		version:	Integer;
		headlen:	Integer;
		planes:		Integer;
		pat_run:	Integer;
		pix_width:	Integer;
		pix_height:	Integer;
		sl_width:	Integer;
		sl_height:	Integer;
		x_id:		packed array[1..4] of Byte;
		color_model:	Integer;
		color_table:	RGB_LISTPTR;
	End;

	A_FileListPtr = ^A_FileList;
	A_FileList = Record
		fname : PChar;
		next : A_FileListPtr;
	End;

{	ACS plus }
	SLLIVEPtr = ^SLLIVE;
	SLLIVE  = Record
		call: Function (obj: Pointer; pos: LongInt): Pointer;
		obj: Pointer;
	End;

	EDITSUBSPtr = ^EDITSUBS;
	EDITSUBS = Record
		row1: LongInt;
		col1:	LongInt;
		row2:	LongInt;
		col2:	LongInt;
		nrow: LongInt;
		text: PCharPtr;		{ ^Array [0..] of Pointer }
	End;

	EDITGETSPtr = ^EDITGETS;
	EDITGETS = Record
		row:	LongInt;
		size: LongInt;
		text:	PChar;
	End;

	EDITLIVEPtr = ^EDITLIVE;
	EDITLIVE = Record
		call:	Procedure (obj: Pointer; text: Pointer);
		obj:	Pointer;
	End;

	PROTOCOLDATAPtr = ^PROTOCOLDATA;
	PROTOCOLDATA = Record
		fontid: Integer;
		height: Integer;
		col:		Integer;
		row:		Integer;
		tabsize:Integer;
		wrap:		Integer;
		x:			Integer;
		y:			Integer;
	End;

	PLOTTERDATAPtr = ^PLOTTERDATA;
	PLOTTERDATA = Record
		x:	Integer;
		y:	Integer;
		w:	Integer;
		h:	Integer;
	End;

	LISTITEMPtr = ^LISTITEM;
	LISTITEM = Record
		idx:	LongInt;
		item:	Pointer;
	End;

	LISTDATAPtr = ^LISTDATA;
	LISTDATA = Record
		expara:		Pointer;
		title:		packed array[1..128] of char;
		winsize:	Axywh;
		icon:			CICONBLKPtr;
		len:			LongInt;
		comp_item:	Function (org: Pointer; new: Pointer; expara: Pointer):Integer;
		drag_item:	Function (aob: AOBJECTPtr; item: Pointer; expara: Pointer):Integer;
		edit_item:	Function (item: Pointer; expara: Pointer):Integer;
		key_item:		Function (key: Integer; expara: Pointer): LongInt;
		message:		Function (mess: Integer; expara: Pointer):Integer;
		print_item:	Function (line: Pointer; item: Pointer; expara: Pointer):Integer;
		term_list:	Function (expara: Pointer):Integer;
	End;
	
	ULinListFktPtr = Function( para, elem: Pointer) : Integer;
	ULinListProPtr = Procedure( para, elem: Pointer);
	ULinListPtr = ^ULinList;
	ULinList = Record
		data		: Pointer;
		freeElem	: Procedure( elem: Pointer);
		clear		: Procedure( liste: ULinListPtr );
		append	: Function( liste: ULinListPtr; new_data: Pointer ) : Integer;
		insert	: Function( liste: ULinListPtr; new_data: Pointer; before_obj: Integer) : Integer;
		delete	: Function( liste: ULinListPtr; data_nr: Integer) : Integer;
		deleteFor: Function( liste: ULinListPtr; para: Pointer; to_delete: ULinListFktPtr) : Integer;
		search	: Function( liste: ULinListPtr; nr: LongInt ) : Pointer;
		searchFor: Function( liste: ULinListPtr; para: Pointer; found: ULinListFktPtr ) : Pointer;
		first		: Function( liste: ULinListPtr ) : Pointer;
		last		: Function( liste: ULinListPtr ) : Pointer;
		akt		: Function( liste: ULinListPtr ) : Pointer;
		aktNr		: Function( liste: ULinListPtr ) : LongInt;
		skip		: Function( liste: ULinListPtr; vorwaerts: Integer; amount: LongInt ) : Pointer;
		count		: Function( liste: ULinListPtr ) : LongInt;
		countFor	: Function( liste: ULinListPtr; para: Pointer; count: ULinListFktPtr ) : LongInt;
		doFor		: Procedure( liste: ULinListPtr; para: Pointer; to_work: ULinListFktPtr; work: ULinListProPtr );
	End;

    (* For backward compatibility only *)
	ULinListe = ULinList;
	ULinListePtr = ULinListPtr;
    
	UCfgInfoPtr = ^UCfgInfo;
	UCfgInfo = Record
			dateiname		: PChar;
			comment			: PChar;
			env_praefix		: PChar;
			casesensitiv	: Integer;
			file_sensitiv	: Integer;
			file_buffer		: Integer;
		End;
	
	UConfig = Pointer;
	UConfigPtr = ^UConfig;

Const
	OK = 0;
	FAIL = -1;

	{ symbols for messages }
	AD_GENERAL   			= 0;
	AD_GENERAL_STR 			= 1;
	AD_COLREZ				= 2;
	AD_CREATE_IO			= 3;
	AD_CREATE_STR 			= 4;
	AD_DEFECTIVE_MEM		= 5;
	AD_ERR_ACC   			= 6;
	AD_ERR_MESS  			= 7;
	AD_ERR_WINDOW			= 8;
	AD_ERR_WISLOT			= 9;
	AD_GEN_IO 	   			= 10;
	AD_GEN_MEM  			= 11;
	AD_GEN_MOD   			= 12;
	AD_GEN_MOD_STR 			= 13;
	AD_LOAD_MOD				= 14;
	AD_LOAD_MOD_STR			= 15;
	AD_MEM_MOD				= 16;
	AD_MEM_MOD_STR			= 17;
	AD_ODD_MEM				= 18;
	AD_OPEN_IO				= 19;
	AD_OPEN_STR				= 20;
	AD_OUT_OF_MEM			= 21;
	AD_PORT					= 22;
	AD_RANGE_MEM			= 23;
	AD_READ_IO				= 24;
	AD_READ_STR				= 25;
	AD_VER_MOD				= 26;
	AD_VER_MOD_STR 			= 27;
	AD_WRITE_IO				= 28;
	AD_WRITE_STR			= 29;
	AD_A_ATT				= 30;
	AD_A_QUEST				= 31;
	AD_A_STOP				= 32;
	AD_A_TIMER				= 33;

	DD_PIPEDD	= ($1);				{ ATARI-Pipe-Drag&Drop }
	DD_XACC		= ($2);				{ XACC-D&D }
	DD_VA		= ($4);				{ VA-Server }

	AV_PROTOKOLL		= $4700;		{ AV-Messages }
	VA_PROTOSTATUS		= $4701;
	AV_GETSTATUS		= $4703;
	AV_STATUS			= $4704;
	VA_SETSTATUS		= $4705;
	AV_SENDKEY			= $4710;
	VA_START			= $4711;
	AV_ASKFILEFONT		= $4712;
	VA_FILEFONT			= $4713;
	AV_ASKCONFONT		= $4714;
	VA_CONFONT			= $4715;
	AV_ASKOBJECT		= $4716;
	VA_OBJECT			= $4717;
	AV_OPENCONSOLE		= $4718;
	VA_CONSOLEOPEN		= $4719;
	AV_OPENWIND			= $4720;
	VA_WINDOPEN			= $4721;
	AV_STARTPROG		= $4722;
	VA_PROGSTART		= $4723;
	AV_ACCWINDOPEN		= $4724;
	VA_DRAGACCWIND		= $4725;
	AV_ACCWINDCLOSED	= $4726;
	AV_COPY_DRAGGED		= $4728;
	VA_COPY_COMPLETE	= $4729;
	AV_PATH_UPDATE		= $4730;
	AV_WHAT_IZIT		= $4732;
	VA_OB_UNKNOWN		= 0;
	VA_OB_TRASHCAN  	= 1;
	VA_OB_SHREDDER  	= 2;
	VA_OB_CLIPBOARD 	= 3;
	VA_OB_FILE      	= 4;
	VA_OB_FOLDER		= 5;
	VA_OB_DRIVE			= 6;
	VA_OB_WINDOW    	= 7;
	VA_THAT_IZIT		= $4733;
	AV_DRAG_ON_WINDOW	= $4734;
	VA_DRAG_COMPLETE	= $4735;

	{ USERDEF. serv }
	AUO_CREATE		=	(1);
	AUO_TERM		=	(2);
	AUO_GETVAL		=	(3);
	AUO_SETVAL		=	(4);
	AUO_UPDATE		=	(5);
	AUO_FULLUPDATE	=	(6);
	AUO_SELF		=	(9);
	AUO_NEXT		=	(10);
	AUO_PREV		=	(11);
	AUO_NEXTPAGE	=	(12);
	AUO_PREVPAGE	=	(13);
	AUO_BEGIN		=	(14);
	AUO_END			=	(15);
	AUO_POS			=	(17);
	AUO_OWNER		=	(18);

	AUO_SLFULL		=		(100);
	AUO_SLSIZE		=		(101);
	AUO_SLSTEP		=		(102);
	AUO_SLCALL		=		(103);
	AUO_SLLEN		=		(104);
	AUO_SLLIVE		=		(105);
	AUO_SLWIPOS		=		(106);
	AUO_SLGETPOS	=		(107);

	AUO_EDVERSLIDER	=	(200);
	AUO_EDHORSLIDER	=	(201);
	AUO_EDGETROW	=		(202);
	AUO_EDNEWLINE	=		(203);
	AUO_EDAPPLINE	=		(204);
	AUO_EDWRAP		=		(205);
	AUO_EDDELETE	=		(206);
	AUO_EDFONT		=		(207);
	AUO_EDHEIGHT	=		(208);
	AUO_EDCOLOR		=		(209);
	AUO_EDCFULL		=		(210);
	AUO_EDCURON		=		(211);
	AUO_EDCUROFF	=		(212);
	AUO_EDCURHIDE	=		(213);
	AUO_EDCURSHOW	=		(214);
	AUO_EDCURPOS	=		(215);
	AUO_EDGETPOS	=		(216);
	AUO_EDHCOL		=		(217);
	AUO_EDHROW		=		(218);
	AUO_EDVIEW		=		(219);
	AUO_ED1SELECT	=		(220);
	AUO_ED01SELECT	=		(221);
	AUO_EDNSELECT	=		(222);
	AUO_EDNMSELECT	=		(223);
	AUO_EDCHARSELECT=		(224);
	AUO_EDBLKSELECT =		(225);
	AUO_EDUNSELECT	=		(226);
	AUO_EDGETSELECT =		(227);
	AUO_EDSETSELECT =		(228);
	AUO_EDCALL		=		(229);
	AUO_EDLIVE		=		(230);
	AUO_EDGETCURPOS =		(231);
	AUO_EDGETLENGTH =		(232);
	AUO_EDGETROWS	=		(233);
	AUO_EDSUB		=		(234);
	AUO_EDUNDO		=		(235);
	AUO_EDTABSIZE	=		(236);
	AUO_EDCLEARUNDO =		(237);
	AUO_EDRESIZE	=		(238);
	AUO_EDUPDATE	=		(239);
	AUO_EDGETTABSIZE=		(240);
	AUO_EDBLOCKMODE =		(241);
	AUO_EDFIND		=		(242);
	AUO_EDBACKWARD	=		(243);
	AUO_EDFORWARD	=		(244);
	AUO_EDCASE		=		(245);
	AUO_EDNOCASE	=		(246);
	AUO_EDWORD		=		(247);
	AUO_EDNOWORD	=		(248);
	AUO_EDRESET		=		(249);
	AUO_EDGETCHANGED=		(250);
	AUO_EDGETNEED	=		(251);
	AUO_EDSELECTWORD=		(252);
	AUO_EDSLIDERS	=		(253);
	AUO_EDCURSOR	=		(254);
	AUO_EDGETVCURPOS =		(255);
	AUO_EDGETHCOL	=		(256);
	AUO_EDGETHROW	=		(257);
	AUO_EDGETERROR	=		(258);
	AUO_EDRESETERROR =		(259);
	AUO_EDPUTINFO	=		(260);	{ not supported anymore }
	AUO_EDDIRTY		=		(261);
	AUO_EDSETSEPARATOR =	(262);
	AUO_EDGETSEPARATOR =	(263);

	AUO_FTFONT			=	(300);
	AUO_FTHEIGHT		=	(301);
	AUO_FTCOLOR			=	(302);
	AUO_FTEFFECTS		=	(303);
	AUO_FTLEFT			=	(304);
	AUO_FTRIGHT			=	(305);
	AUO_FTCENTER		=	(306);
	AUO_FTBLOCK			=	(307);
	AUO_CYCPOPUP		=	(400);
	AUO_CYCINDEX		=	(401);
	AUO_CYCGETINDEX		=	(402);
	AUO_PICMFDB			=	(500);

{ A_boxed: }
	BE_MAXLEN			= (255);
{ ** Nachrichten ** }
	AUO_BEINCPOS		= (700);
	AUO_BEDECPOS		= (701);
	AUO_BEINCWPOS		= (702);
	AUO_BEDECWPOS		= (703);
	AUO_BEINSCHAR		= (704);
	AUO_BEINSTEXT		= (705);
	AUO_BESETSELECT		= (706);
	AUO_BEGETSELECT		= (707);
	AUO_BEBS			= (708);
	AUO_BEBSW			= (709);
	AUO_BEBSLINE		= (710);
	AUO_BEDEL			= (711);
	AUO_BEDELW			= (712);
	AUO_BEDELLINE		= (713);
	AUO_BEDELALL		= (714);
	AUO_BEMASK			= (715);
	AUO_BECHARLIST	= (716);
{ ** Masken ** }
	BEM_ALL				= (0);		{  alles  }
	BEM_PATH			= (1);		{  alles  }
	BEM_FILE			= (2);		{  alles ohne \:  }
	BEM_TOSFILE			= (3);		{  A-Za-z0-9 ._!@#$%^&()+-=~';",<>|[]  }
	BEM_TOSFILESPEC		= (4);		{  BEM_TOSFILE *?  }
	BEM_TOSPATH			= (5);		{  BEM_TOSFILE \:  }
	BEM_TOSPATHSPEC		= (6);	 	{  BEM_TOSFILE \:*?  }
	BEM_NORM			= (7);		{  Space...  }
	BEM_ALPHA			= (8);		{  a-zA-Z Space  }
	BEM_ALPHADIGIT		= (9);		{  a-zA-Z0-9 Space  }
	BEM_BIN				= (10);		{  0-1  }
	BEM_NEGBIN			= (11);		{  - 0-1  }
	BEM_OCT				= (12);		{  0-7  }
	BEM_NEGOCT			= (13);		{  - 0-7  }
	BEM_DEC				= (14);		{  0-9  }
	BEM_NEGDEC			= (15);		{  - 0-9  }
	BEM_HEX				= (16);		{  0-9A-Z  }
	BEM_NEGHEX			= (17);		{  - 0-9A-Z  }
	BEM_FLOAT			= (18);		{  0-9.0-9  }
	BEM_NEGFLOAT		= (19);		{  - 0-9.0-9  }
	BEM_DATEEURO		= (20);		{ Tag(2).Monat(2).Jahr(4) }
	BEM_DATEEURO_SEP	= (21);		{ Tag(2)/Monat(2)/Jahr(4) }
	BEM_DATEUS			= (22);		{ Monat(2).Tag(2).Jahr(4) }
	BEM_DATEUS_SEP		= (23);		{ Monat(2)/Tag(2)/Jahr(4) }
	BEM_TIME			= (24);		{ Std:Min(2):sek(2) Std unbegrenzt }
	BEM_TIME12			= (25);		{ Std(2):Min(2):sek(2) max 12 Stunden }
	BEM_TIME24			= (26);		{ Std(2):Min(2):sek(2) max 24 Stunden }


		{ description. flags }
	AB_CLICKMENU 	=	($0001);	{ menu drop down on click instead of touch }
	AB_MOVIES		=	($0002);	{ draws moving, growing, shrink rectangle }
	AB_ACUSTIC		=	($0004);	{ acustic bell if user clicks outside of dialog }
	AB_HIDEPOINTER	=	($0008);	{ hide pointer on key input }
	AB_CENTERDIALOG=($0010);	{ center dialog }
	AB_GDOSFONT		=	($0020);	{ load and frees gdos fonts if available }
	AB_SMARTREDRAW	=	($0040);	{ use smart redraw }
	AB_MENUFIRST	=	($0080);	{ change key consume strategie }
	AB_NO3D			=	($0100);
	AB_LAZYEVAL		=	($0200);
	AB_NOMEMCHECK	=	($0400);
	AB_NOTRANSICON	=	($0800);

		{ Awindow. service }	{ generic }
	AS_ACCLOSED		=	(1);		{ accessory closed, initialize correctly }
	AS_TERM			=	(2);		{ terminate }
	AS_ICONIZED		=	(3);		{ the window was iconized (in order to receive a free window id); }
	AS_MOUSE		=	(4);		{ Mouse is upon the window }
	AS_SELECTADD	=	(5);		{ added ob in select list }
	AS_SELECTDEL	=	(6);		{ deleted ob in select list }
	AS_UNTOPPED		=	(7);		{ ACS does not handle UNTOPPED, maybe the windowzwant it }
	AS_FOCUSCHG		=	(8);		{ Focus changed to another Inputfield }
	AS_CHECKDRAG	=	(9);		{ check if window will accept draglist }

	AS_OPEN				=	(10);		{ Open the selected list of objects }
	AS_DELETE			=	(11);		{ delete selected list }
	AS_CHECKDELETE		=	(12);		{ is list deleteable }
	AS_WIAUTOPOS		=	(14);		{ Autopos }
	AS_INFO				=	(15);		{ Info about Window }
	AS_DRAGGED			=	(16);		{ Something dragged on windows ICON }
	AS_CHECKDRAGGED		=	(17);	{ is list acceptable for this window icon }
	AS_CONFIGDRAG		=	(18);	{ Allows owner window to modify drag parameter like raster }
	AS_DRAGABORTED		=	(19);	{ Drag was released on foreign window, INT16* wi_id }
	AS_REALSEL_START	=	(20);	{ Start neuer Aselect-Liste }
	AS_REALSEL_UPDATE	=	(21);	{ énderung der Aselect-Liste }
	AS_REALSEL_END		=	(22);	{ Ende der Aselect-Liste }
	AS_REALPOP_START	=	(23);	{ Start des Popups, IN_OUT: *INT16 auf Startobjekt }
	AS_REALPOP_UPDATE	=	(24);	{ énderung des Popups, IN_OUT: *INT16 auf Objektnummer }
	AS_REALPOP_END		=	(25);	{ Ende des Popups }
	AS_EDITCHG			=	(26);	{ neue Taste in der Eingabe }
	AS_GEM_MESS			=	(27);	{ unbekannte GEM-Message fÅr RootFenster }
	AS_SCRAP_UPDATE		=	(28);	{ das Klemmbrett wurde erneuert, in_out *ext }
	AS_SCRAP_IMPORT		=	(29);	{ Aufruf, aus dem Klemmbrett zu importieren, in_out *ext }
	AS_SCRAP_EXPORT		=	(30);	{ dito fÅr Export }
	AS_REALMENU_START	=	(31); { Start der MenÅfÅhrung }
	AS_REALMENU_UPDATE	=	(32);	{ neuer Eintrag }
	AS_REALMENU_END		=	(33);	{ Ende }

	AS_ASKHELP			=	(1000);	{ Kann ein Fenster AS_HELP verstehen? }
									{ in in_out ist dann Fensterzeiger }
	AS_HELP				=	(1001);	{ Hilfe anzeigen lassen }
									{ in INOUT ein fertiger HELP-Text-Pfad oder IMG-Pfad Åbergeben }
									{ einzenle öberschriften aus dem Text kînnen ausgewÑhlt werden, indem }
									{ nach dem Pfad, durch ein TAB getrennt, die öerschrift folgt }
									{ dabei wird in der Åbergeben Datei nach einer Zeile gesucht, die }
									{ mit # beginnt und dann genau die öberschrift hat. In diesem Fall }
									{ erfolgt die Textausgabe bis zum nÑchsten # am Zeilenanfang }
	AS_REDRAWFILE		=	(1002);	{ Fenster mit Dateidarstellungen sollen auf diese Nachricht die }
									{ Dateidarstellung aktualisieren, OPTIONAL KANN in IN_OUT ein Pfad }
									{ angegeben sein, fÅr den diese VerÑnderung gilt }

	AS_LOADFILE			=	(1003);	{ ein Fenster soll, sofern es als PRG lÑuft, die Textdatei aus }
									{ IN_OUT in einen EDITOR laden }
	AS_SELECTFILE 		=	(1004);	{ ein Fenster mit einer Dateidarstellung sollte die Datei IN_OUT selektieren }
									{ zusÑtzlich selekt. nur dann, wenn die Datei sich im gleichen Verzeichnis befindet }
									{ NULL in IN_OUT bedeutet deselktieren }
	AS_LOOKSTRING		=	(1005);	{ suche nullterminierten String aus IN_OUT in den eigenen Datenstrukturen }
	AS_SAVEFILE			=	(1006);	{ sichere Datei *IN_OUT }
	AS_DOARCHIVE		=	(1010);	{ LAZy-Shell-intern... }
	AS_ASKLAZY			=	(1011);	{ bist Du LAZy-Fenster? }
	AS_ASKFILE			=	(1012);	{ bist Du Dateidarstellungsfenster? }
	AS_ASKTURNUS		=	(1013);	{ bist Du TURNUS-Fenster? }
	AS_ASKNOTIO     	=	(1014);	{ bist Du NOTIO-Fenster? }
	AS_ASKACSOBJ		=	(1015);	{ bist Du ACS-Object-Fenster? }
	AS_CEWS_BASE		=	(1100);	{ bist Du ACS-Base-Fenster? }
	AS_IMGSETOWNER		=	(2000);	{ IMGEDIT-intern }

					{ desktop }
	AS_PLACEICON	=	(100);		{ place icon, in_out = the window }
	AS_REMICON		=	(101);		{ remove icon }
	AS_GHOSTICON	=	(102);		{ change to ghost icon }
	AS_NORMICON		=	(103);		{ chance from ghost icon to normal icon }
	AS_NEWCALL		=	(104);		{ set new call }
	AS_BACKOBJECT	=	(105);	{ Set Background Objekt, (ob_type, ob_spec) ACSinit0 }
	AS_ICONNEW		=	(106);	{	Set New-Icon, ACSinit0 }
	AS_ICONTRASH	=	(107);	{	Set Trash-Icon, ACSinit0 }
	AS_ICONWINDOW	=	(108);	{	Set Default-Icon, ACSinit0 ! }
	AS_UPDATEICON	=	(109);	{	updates icon }

	AS_EDGETENTRY	=	(200);
	AS_EDEXT		=	(201);
	AS_EDLOADFILE	=	(202);
	AS_EDTITLE		=	(203);
	AS_EDTITLEDIRTY	=	(204);
	AS_EDPUTSTRING	=	(205);
	AS_EDGETSTRING	=	(206);
	AS_EDGETNEED	=	(207);
	AS_EDWINDOW		=	(208);
	AS_EDTERM		=	(209);
	AS_EDSAVE		=	(210);
	AS_EDCLEAN		=	(211);
	AS_EDHOME		=	(212);
	AS_EDICONTEXT	=	(213);
	AS_EDSAVEIT		=	(214);
	AS_EDGETFNAME	=	(215);

	AS_PLOTHANDLE		=	(300);
	AS_PLOTMFDB			=	(301);
	AS_PLOTSIZE			=	(302);
	AS_PLOTENTRY		=	(303);

	{ LIST_WINDOW	}
	AS_LIST_UPDATE			=	(400);
	AS_LIST_COUNT			=	(401);
	AS_LIST_ADD				=	(402);
	AS_LIST_DELETE			=	(403);
	AS_LIST_GET				=	(404);
	AS_LIST_GET_DIRTY		=	(405);
	AS_LIST_REPLACE			=	(406);
	AS_LIST_RESET_DIRTY		=	(407);
	{	Message-Codes	}
	LM_OUT_OF_MEM	=	(1);
	LM_IDX_RANGE	=	(2);
	LM_DBL_ITEM		=	(3);
	LM_INFO			=	(4);

	ADD_DLO=(20000); { VAMOS }
	AS_MODE=(20001);
	AS_CALC=(20002);

		{ Awindow. kind }
	AW_ICON			=	($0001);	{ Iconizing Window instead of Terminating }
	AW_GHOSTICON	=	($0002);	{ Ghost Icon from beginning }
	AW_STAY			=	($0004);	{ do not change state of the window iconize/open }
	AW_OBLIST		=	($0008);	{ inner ob is a objects list }
	AW_ICONACCEPT	=	($0010);	{ accept dragging on windows icon }
	AW_UHSLIDER		=	($0020);	{ user administrated horizontal slider }
	AW_UVSLIDER		=	($0040);	{ user administrated vertical slider }
	AW_NOSCROLL		=	($0080);	{ no optimized scrolling }
	AW_TOOLBOX		=	($0100);	{ do not top if access (AES 4.0 only) }

	{ Awindow. state }
	AWS_FULL		=	($0001);	{ State full }
	AWS_DIALOG		=	($0002);	{ dialog is activ }
	AWS_MODIFIED	=	($0004);	{ dependend information was changed call init before open }
	AWS_MODAL		=	($0008);	{ a modal dialog is open for this window }
	AWS_FORCEREDRAW	=	($0010);	{ forces a redraw }
	AWS_LATEUPDATE	=	($0020);	{ send AS_UPATE after returning to main loop }
	AWS_TERM		=	($0100);	{ Terminatesequence active, skip iconizing }
	AWS_INTERM		=	($0200);	{	USER set! window is term routine in progress, just to avoid double terminating and freeing memory }
	AWS_MODAL_WIN	=	($0400);	{	modal, window dialog }
	AWS_ICONIZED	=	($0800);	{ GEM-iconified }
	AWS_ALLICONIZED	=	($1000);	{ Main-GEM-iconified }

	A_TOOLBAR = ($1000);	{ obnr belongs to the toolbar }
	A_MASK = ($0fff);			{ mask for gaining pure obnr without object tree flags}

	{ OBJECT. ob_flags }
	AEO			=	($8000);	{ Extended Object }
	AO_DEFABLE	=	($4000);	{ defaultable Object }
	AO_DRAGABLE	=	($2000);	{ dragable Object }
	AO_ACCEPT	=	($1000);	{ accept dragable Object }
	AO_SILENT	=	($0800);	{ ob will NOT visual react (AO_ACCEPT); }

	{ OBJECT. ob_state }
	AOS_FIXED	=	($8000);	{ Object tree is already fixed }
	AOS_DCLICK	=	($4000);	{ last selection was a double click }
	AOS_CONST	=	($2000);	{ Do not copy substructure, do not release (free); substructure }
	AOS_LOCKED	=	($1000);	{ subtree is locked */
	AOS_CLTOP	=	($0800);	{ Counterlock Top; is bound to Bottom of parent }
	AOS_CLBOTTOM=	($0400);	{ Counterlock Bottom }
	AOS_CLLEFT	=	($0200);	{ Counterlock Left }
	AOS_CLRIGHT	=	($0100);	{ Counterlock Right }

	{ AOBJECT. type }
	AT_ICONWINDOW	=	(1);		{ iconized window }
	AT_NEW			=	(2);		{ new ob }
	AT_TRASH		=	(3);		{ trash bin }
	AT_MFDB			=	(10);		{ MFDB in userp1 }
	AT_STRING		=	(11);		{ Nullterminated String in userp1 }
	AT_FILE 		=	(20);		{ Nullterminated String in userp1, file path }
	AT_ARCHIVE 		=	(30);		{ LAZY SHELL }

	AT_TEXT			=	(31);		{ '\n'-seperated Strings with final zero }
	AT_TURNUS		=	(32);		{ TurnUs-intern }
	AT_NOTIO        =	(33);       { Notio-intern }

{ VAMOS }
AT_DLO=(20000); { DainÑmik Link Obdschekt }
AT_SLOT=(20001); { Modulslot }
AT_JOBSYMBOL=(20002); { Symbol fÅr JOB - Layout - Programm }
AT_BITBLK=(20003); { Bitblock }
AT_ICONBLK=(20004); { Iconblock }
AT_JOBITEM=(20005); { Objekt fÅr Joblauf }

	AE_GEN				=	(1);
	AE_GEN_MEM			=	(2);
	AE_OUT_OF_MEM		=	(3);
	AE_DEFECTIVE_MEM	=	(4);
	AE_RANGE_MEM		=	(5);
	AE_ODD_MEM			=	(6);
	AE_GEN_IO			=	(7);
	AE_OPEN_IO			=	(8);
	AE_CREATE_IO		=	(9);
	AE_WRITE_IO			=	(10);
	AE_READ_IO			=	(11);
	AE_GEN_MOD			=	(12);
	AE_LOAD_MOD			=	(13);
	AE_VER_MOD			=	(14);
	AE_MEM_MOD			=	(15);
	AE_PORT				=	(16);
	AE_COLORS			=	(17);
	AE_REZ				=	(18);
	AE_VDI				=	(19);
	AE_AES				=	(20);
	AE_IMG				=	(21);
	AE_DD_WARN			=	(22);
	AE_DD_ERR			=	(23);

	RESET_UPDATE		= ($0010);
	RESTART_UPDATE		= ($0020);


		{ desktop icons size }
	AREA_WIDTH			=	(80);		{ area for icons }
	AREA_HEIGHT			=	(48);
	FRAME				=	(8);		{ frame around Icon }

		{ NKCC-Stuff }
	NKF_FUNC     = $8000;	{ function          }
	NKF_RESVD    = $4000;	{ resvd, ignore it! }
	NKF_NUM      = $2000;	{ numeric pad       }
	NKF_CAPS     = $1000;	{ CapsLock          }
	NKF_ALT      = $0800;	{ Alternate         }
	NKF_CTRL     = $0400;	{ Control           }
	NKF_SHIFT    = $0300;	{ any Shift key     }
	NKF_LSH      = $0200;	{ left Shift key    }
	NKF_RSH      = $0100;	{ right Shift key   }

		{ special key codes for keys performing a function }

	NK_INVALID   = $00;	{ invalid key code  }
	NK_UP        = $01;	{ cursor up         }
	NK_DOWN      = $02;	{ cursor down       }
	NK_RIGHT     = $03;	{ cursor right      }
	NK_LEFT      = $04;	{ cursor left       }
	NK_RVD05     = $05;	{ reserved!         }
	NK_RVD06     = $06;	{ reserved!         }
	NK_RVD07     = $07;	{ reserved!         }
	NK_BS        = $08;	{ Backspace         }
	NK_TAB       = $09;	{ Tab               }
	NK_ENTER     = $0a;	{ Enter             }
	NK_INS       = $0b;	{ Insert            }
	NK_CLRHOME   = $0c;	{ Clr/Home          }
	NK_RET       = $0d;	{ Return            }
	NK_HELP      = $0e;	{ Help              }
	NK_UNDO      = $0f;	{ Undo              }
	NK_F1        = $10;	{ function key #1   }
	NK_F2        = $11;	{ function key #2   }
	NK_F3        = $12;	{ function key #3   }
	NK_F4        = $13;	{ function key #4   }
	NK_F5        = $14;	{ function key #5   }
	NK_F6        = $15;	{ function key #6   }
	NK_F7        = $16;	{ function key #7   }
	NK_F8        = $17;	{ function key #8   }
	NK_F9        = $18;	{ function key #9   }
	NK_F10       = $19;	{ function key #10  }
	NK_RVD1A     = $1a;	{ reserved!         }
	NK_ESC       = $1b;	{ Esc               }
	NK_RVD1C     = $1c;	{ reserved!         }
	NK_RVD1D     = $1d;	{ reserved!         }
	NK_RVD1E     = $1e;	{ reserved!         }
	NK_DEL       = $1f;	{ Delete            }

	{ ASCII codes less than 32 }
	NUL          = $00;	{ Null }
	SOH          = $01;	{ Start Of Header }
	STX          = $02;	{ Start Of Text }
	ETX          = $03;	{ End Of Text }
	EOT          = $04;	{ End Of Transmission }
	ENQ          = $05;	{ Enquiry }
	ACK          = $06;	{ positive Acknowledgement }
	BEL          = $07;	{ Bell }
	BS           = $08;	{ BackSpace }
	HT           = $09;	{ Horizontal Tab }
	LF           = $0a;	{ Line Feed }
	VT           = $0b;	{ Vertical Tab }
	FF           = $0c;	{ Form Feed }
	CR           = $0d;	{ Carriage Return }
	SO           = $0e;	{ Shift Out }
	SI           = $0f;	{ Shift In }
	DLE          = $10;	{ Data Link Escape }
	DC1          = $11;	{ Device Control 1 }
	XON          = $11;	{ same as DC1 }
	DC2          = $12;	{ Device Control 2 }
	DC3          = $13;	{ Device Control 3 }
	XOFF         = $13;	{ same as DC3 }
	DC4          = $14;	{ Device Control 4 }
	NAK          = $15;	{ Negative Acknowledgement }
	SYN          = $16;	{ Synchronize }
	ETB          = $17;	{ End of Transmission Block }
	CAN          = $18;	{ Cancel }
	EM           = $19;	{ End of Medium }
	SUB          = $1a;	{ Substitute }
	ESC          = $1b;	{ Escape }
	FS           = $1c;	{ Form Separator }
	GS           = $1d;	{ Group Separator }
	RS           = $1e;	{ Record Separator }
	US           = $1f;	{ Unit Separator }


(* Konstanten fÅr 'mode' der Struktur XATTR *)
const 
	S_IFMT          = &0170000;       /* mask to select file type */
	S_IFCHR         = &0020000;       /* BIOS special file        */
	S_IFDIR         = &0040000;       /* directory file           */
	S_IFREG         = &0100000;       /* regular file             */
	S_IFIFO         = &0120000;       /* FIFO                     */
	S_IMEM          = &0140000;       /* memory region or process */
	S_IFLNK         = &0160000;       /* symbolic link            */

/* special bits: setuid, setgid, sticky bit */
	S_ISUID         = &04000;
	S_ISGID         = &02000;
	S_ISVTX         = &01000;

/* file access modes for user, group, and other*/
	S_IRUSR         = &0400;
	S_IWUSR         = &0200;
	S_IXUSR         = &0100;
	S_IRGRP         = &0040;
	S_IWGRP         = &0020;
	S_IXGRP         = &0010;
	S_IROTH         = &0004;
	S_IWOTH         = &0002;
	S_IXOTH         = &0001;
	DEFAULT_DIRMODE = &0777;
	DEFAULT_MODE    = &0666;


    PXATTR = ^TXATTR;
    XATTRPtr = ^TXATTR;
    TXATTR = record
        mode:              Word;
        index:             LongInt;
        dev:               Word;
        rdev:              Word;
        nlink:             Word;
        uid:               Word;
        gid:               Word;
        size:              LongInt;
        blksize:           LongInt;
        nblocks:           LongInt;
        mtime:             Word;
        mdate:             Word;
        atime:             Word;
        adate:             Word;
        ctime:             Word;
        cdate:             Word;
        attr:              Word;
        reserved2:         Word;
        reserved3:         Array[0..1] of LongInt;
    end;



Var
	ACSblk: AblkPtr;
	PUR_DESK, DESKTOP: AwindowPtr;

{
	Just to support ACS 1.xx Programs, warning Functions are readonly Vars
}
	Function	gl_apid:	Integer;
	Function	phys_handle:Integer;		{ workstation for aes }
	Function	gl_wattr:	Integer;		{ attribut width }
	Function	gl_hattr:	Integer;		{ attribut height }

	Function	desk:	AxywhPtr;				{ desktop limits XYWH }
	{ VDI }
	Function	vdi_handle:	Integer;		{ virtual VDI workstation for ACS }
	Function	gl_wbox:	Integer;		{ cell width of standard char }
	Function	gl_hbox:	Integer;		{ cell height of standard char }
	Function	gl_wchar:	Integer;		{ max width of standard char}
	Function	gl_hchar:	Integer;		{ max height of standard char }
	Function	ncolors:	Integer;		{ number of colors (2=mono) }
	Function	nplanes:	Integer;		{ number of colors expressed in planes }
	{ Pathes }
	Function	appname:	PChar;			{ application complete name˙}
	Function	apppath:	PChar;			{ application path }
	Function	apppara:	PChar;			{ application parameter }
	Function	appfrom:	PChar;			{ application called from }
	Function	basename:	PChar;			{ basename appname without extention }
	{ others }
	Function	ev_mtcount:		Longint;		{ Timerintervall in milli sec (initial 500 ms) }
	Function	application:	Integer;		{ runs as an application }
	Function	multitask:		Integer;		{ more than 1 applications possible }
	Function	appexit:		Integer;		{ application is in system termination mode }
	Function	description:	AdescrPtr;		{ surface description, pointer for late assignment }
	Function	Aselect:			AselPtr;			{ list of selected objects }
	{ context during callback pointer values }
	Function	ev_window:		AwindowPtr;		{ actual window }
	Function	ev_object:		ACSTreePtr;		{ actual ob tree }
	Function	ev_obnr:		Integer;		{ actaul objectnumber, index }
	Function	ev_mmox:	Integer;
	Function	ev_mmoy:	Integer;	{ Mouse position }
	Function	ev_mmokstate:	Integer;		{ Keyboard state }
	Function	dia_abort:		Integer;		{ Abort modal dialog }
	Function	screenMFDB:		MFDBPtr;		{ exactly this }

{
 *	Windowhandling common Routines
}

	Function Awi_wid (wid: Integer): AwindowPtr; external;	{ get window for gem window id }
	Function Awi_root: AwindowPtr; external;				{ return root window }
	Function Awi_list: AwindowPtr; external;				{ next window from total set }
	Procedure Awi_sendall									{ sends message to all windows }
		(task: Integer; in_out: Pointer); external;
	Procedure Awi_down; external;							{ cycle down windows }
	Procedure Awi_up; external;								{ cycle up windows }
	Procedure Awi_show (w: AwindowPtr); external;			{ show window }
	Function  Awi_init (w: AwindowPtr): Integer; external;	{ Dummy init routine }
	Function  Awi_create (w: AwindowPtr): AwindowPtr; external;	{ create a copy of window x }
	Function  Awi_open (w: AwindowPtr): Integer; external;	{ open window }
	Procedure Awi_closed (w: AwindowPtr); external;			{ close window }
	Procedure Awi_delete (w: AwindowPtr); external;			{ free window }
	Procedure Awi_topped (w: AwindowPtr); external;			{ top this window }
	Procedure Awi_fulled (w: AwindowPtr); external;			{ fullsize window }
	Procedure Awi_sized (w: AwindowPtr;						{ move/resize window }
			new: AxywhPtr); external;
	Procedure Awi_moved (w: AwindowPtr;						{ move/resize window }
			new: AxywhPtr); external;
	Procedure Awi_diaend; external;							{ finish open dialog }
	Procedure Awi_diastart; external;						{ start dialog }
	Function Awi_keys (w: AwindowPtr;						{ key input for dialog }
		kstate: Integer; key: Integer):Integer; external;
	Procedure Awi_obview (w: AwindowPtr;					{ show area in work ob coordinates }
		xywh: AxywhPtr); external;
	Function Awi_service (w: AwindowPtr;					{ very simple service routine }
		task: Integer; in_out: Pointer): Boolean; external;
	Procedure Awi_scroll (w: AwindowPtr;					{ intelligent scroll/update, x,y upper left edge BEFORE scrolling }
		x: Integer; y: Integer); external;
	{ NEW }
	Function Awi_modal: AwindowPtr; external;				{ modal dialog on top?, returns NULL if not }
	Function Awi_dialog (w: AwindowPtr): Integer; external;	{ complete modal-window-dialog-handler }
	Function Awi_alert (but: Integer;
		text: PChar):Integer; external;					{ shows window-alert }
	Function Awi_selfcreate (w: Pointer): AwindowPtr; external;
															{ creates a copy of Awindow x }
	Procedure Awi_uoself (wi:AwindowPtr); External;
	Procedure Awi_update (mode: Integer); External;

	Function Awi_nokey(w: AwindowPtr; kstate: Integer; key: Integer): Integer; external;
	Function Awi_sendkey(w: AwindowPtr; kstate: Integer; key: Integer): Integer; external;

	(* Send a message zu the window-object *)
	Function Awi_observice( wind: AwindowPtr; obnr, task: Integer; in_out: Pointer ) : Integer;
		External;

{
 * Window: inner Objects
 }

	Procedure Awi_obchange (wi: AwindowPtr;				{ change the state of this ob in work tree }
			obnr: Integer; new_state: Integer); external;	{ ! changed behaviour to 1.0 }
	Procedure Awi_obredraw (wi: AwindowPtr;				{ redraws everthing in the area of obnr }
		obnr: Integer); external;						{ uses window-> redraw }
	Procedure Awi_redraw (w: AwindowPtr;				{ redraw routine }
		limit: AxywhPtr); external;
	Procedure Awi_arrowed (w: AwindowPtr;				{ arrows }
		which: Integer); external;
	Procedure Awi_hslid (w: AwindowPtr;					{ horizontal slider }
		pos: Integer); external;
	Procedure Awi_vslid (w: AwindowPtr; 				{ vertical slider }
		pos: Integer); external;

{
 * Events
 }

	Procedure Aev_quit; external;				{ Next eventloop will terminate }
	Procedure Aev_mess; external;				{ Accept and handle messages eg redraw }
	Procedure Aev_unhidepointer; external;		{ unhides hidden pointer }
	Procedure Aev_release; external;			{ waits for release of mouse }

{
 *	Mousehandling
 }

	Procedure Amo_new (mouse: AmousePtr); external;	{ set new mouse }
	Procedure Amo_busy; external;				{ set busy indicator }
	Procedure Amo_unbusy; external;				{ remove busy indicator }
	Procedure Amo_hide; external;				{ hide mouse }
	Procedure Amo_show; external;				{ unhide mouse }

{
 *	Objecthandling
 }

	Function Aob_create (						{ creates a copy of parent }
		parent: ACSTreePtr): ACSTreePtr; external;
	Procedure Aob_delete (ob: ACSTreePtr); external;{ frees ob generated by Aob_create }
	Procedure Aob_fix (ob: ACSTreePtr); external;	{ fixes ob }
	Procedure Aob_offset (redraw: AxywhPtr;			{ calculate redraw rectangle for ob }
		ob: ACSTreePtr; entry: Integer); external;
	Function Aob_save (rect: AxywhPtr): MFDBPtr; external;	{ save rectangle of desktop }
	Procedure Aob_restore (save: MFDBPtr;			{ restore desktop previously save with Aob_save }
		rect: AxywhPtr); external;
	Function Aob_watch (w: AwindowPtr;				{ watched ob, select if pointer upon obnr }
		obnr: Integer): Boolean; external;			{ returns TRUE if button was release upon obnr }
	Function Aob_findflag (ob: ACSTreePtr;			{ find obnr for which flagmask becomes true, obnr is start ob }
		obnr: Integer; flag: Integer): Integer; external;
	Function Aob_up (ob: ACSTreePtr; obnr: Integer): Integer; external;	{ find parent objectnr, returns -1 on top level }

	Procedure Ame_namefix (menu: ACSTreePtr); external;		{ fixes tree on different length of first title (name) }

	Function Ame_popup (w: AwindowPtr;				{ pop up a popup menu, x/y determs upper left edge }
		popup: ACSTreePtr;x: Integer; y: Integer): Integer; external;	{ returns selected Obnr, If a callback is defined it will be called }

	Function Ame_strpopup (w: AwindowPtr;				{ pop up a popup menu, x/y determs upper left edge }
		popup, chk: PChar; width: Integer; x: Integer; y: Integer): PChar; external;

	{ NEW }
	Procedure Aob_puttext (ob: ACSTreePtr;
		obnr: Integer; text: PChar); external;	{ OM: setzt TEXT in das Objekt ein, betrachtet die Typen! }
													{ nur fÅr die USERDEFS wird in UB_PTR1 dynamisch Speicher }

	Function Aob_gettext (ob: ACSTreePtr;
		obnr: Integer; text: PChar): Integer; external;
													{ OM: holt Text aus Objekt, TEXT muû lang genug sein! }
													{ zurÅckgeleifert wird die LÑnge des Textes oder -1	}
													{ wenn die LÑnge nicht ermittelt werden konnte. }
													{ wird TEXT=NULL gesetzt, wird nur die LÑnge ermittelt,	}
													{ was dazu dienen kann, die TextlÑnge dynamisch zu erfragen	}

	Function Aob_within (rect: AxywhPtr;
		x, y: Integer): Integer; External; 			{ is x/y in rect? }

	(* Bits aus ob_flags und ob_state setzen oder lîschen *)
	Function Aob_flags( window: AwindowPtr; obnr, flag, setflag: Integer ) : Integer;
		External;
	Function Aob_state( window: AwindowPtr; obnr, flag, setflag: Integer ) : Integer;
		External;
	
	(* Send a message to an object *)
	Function Aob_service( tree: ACSTreePtr; obnr, tast: Integer; in_out: Pointer ) : Integer;
		External;

	

{ Backplane Support }

	Function Abp_create (w: Integer; h: Integer): MFDBPtr; external;	{ Create Backplane with width w and height h }
	Procedure Abp_delete (bp: MFDBPtr); external;						{ free Backplane }
	Procedure Abp_start (bp: MFDBPtr); external;						{ start writing on backplane (all vdi and aes calls) }
	Procedure Abp_end; external;										{ stop writing on backplane, resume to screen }
	{ NEW }
	Function Abp_img2mfdb (org: IMG_HEADERPTR;				{ converts IMAGE to MFDB, transform into dev-fmt if do_trnsfm=TRUE }
		var dest: Pointer; trnsfm: Integer): Integer; external;	{ OK on success }
	Function Abp_mfdb2img (org: MFDBPTR;					{ converts dev-depend. MFDB to IMG-Format, gives IMG-DATA-length }
		var dest: Pointer; var len: Longint): Integer; external;	{ dest=NULL serves ONLY img_len, returns OK on sucess }

{
 * Drag support functions
 }

	Procedure Adr_box (x: Integer; y: Integer); external;	{ start drawing a box which select intersected objects }
	Procedure Adr_drag (x: Integer; y: Integer); external;	{ drag ob list }
	Procedure Adr_start; external;								{ begin reading select with Adr_next }
	Function Adr_next: Integer; external;					{ returns next obnr from list }
	Procedure Adr_add (w: AwindowPtr;					{ add ob in Aselect list }
			obnr: Integer); external;
	Procedure Adr_del (w: AwindowPtr;					{ delete ob from Aselect list, did not update on screen ! }
			obnr: Integer); external;
	Procedure Adr_unselect; external;					{ unselect all ob in list, update screen ! }

{
 *	String support
 }

	Function Ast_create (parent: PChar): PChar; external;	{ create a copy of parent string }
	Procedure Ast_delete (str: PChar); external;		{ release this copy }

{
 * ICON, Image Support
 }

	Function Aic_create							{ create a copy of icon, but not image part ! }
		(icon: CICONBLKPtr):CICONBLKPtr; external;
	Procedure Aic_delete (icon: CICONBLKPTR); external;	{ release this copy }

	Function Aim_create							{ create a bitblk copy, but not image }
		(bitblk: BITBLKPtr): BITBLKPtr; external;
	Procedure Aim_delete (bitblk: BITBLKPtr); external;	{ release copy }

{
 *	USER defined Objects
 }

	Function Aus_create 						{ create a copy }
			(user: USERBLKPtr): USERBLKPtr; external;
	Procedure Aus_delete (user: USERBLKPtr); external;	{ release this copy }

{
 *	TEDINFO Support
 }

	Function Ate_create							{ create a copy }
			(tedi: TEDINFOPtr): TEDINFOPtr; external;
	Procedure Ate_delete (tedi: TEDINFOPtr); external;	{ release this copy }

{
 *	Xtra Functions
 }

	Function Ax_malloc (size: LongInt): Pointer; external;	{ ACS Malloc can be overwritten if linked before library }
	Procedure Ax_free (memory: Pointer); external;			{ Mark memory as free }
	Procedure Ax_ifree (memory: Pointer); external;			{ give memory immediate free (be very carefully) }

{
 *	Utilities
 }
	Procedure Aob_alias; external;				{ Alias ob, number in userp1 }
	Function A_dialog2 (dia: ACSTreePtr): Integer; external;	{ Draw a dialogbox }
	Function A_dialog (dia: ACSTreePtr): Integer; external;		{ Draw a dialogbox near the pointer, handle draw and redraw }
											{ returns buttonnumber }
	Function alert_str						{ display an alert box with one string parameter }
		(alert: PChar;					{ alert must have the form [X][...%s....][Y] }
		 para: Pointer): Integer; external;
	Procedure intersect (troa, froma: AxywhPtr); external;
	Procedure xywh2array (tro: Pointer; from: AxywhPtr); external;
	Procedure array2xywh (tro: AxywhPtr; from: Pointer); external;
	Procedure dotted_xline (x1, x2, y: Integer);external;
	Procedure dotted_yline (y1, y2, x: Integer);external;


{
 *	Predefined "Userdefined Objects"
 }
	function A_boxed( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;		{ BoxEdit }
	function A_checkbox( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;		{ checkboxes, parm simular to ob_spec for boxes ! }
	function A_radiobutton( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;	{ rounded selectable elements, parm simular to ob_spec for boxes ! }
	function A_innerframe( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;	{ draws a frames half a character inside ! }
	function A_pattern( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;		{ draws general patterns }
	function A_arrows( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;		{ draws arrows }
	function A_3Dbutton ( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;		{ draws 3D Button }
	function A_cycle ( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;
	function A_picture ( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;
	function A_ftext ( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;
	function A_select( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;		{ select in a frame instead of reverse }
	function A_title( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;		{ underscored text }

	function Auo_boxed (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer) : Boolean; external;
	function Auo_string (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer) : Boolean; external;
	function Auo_ftext (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer) : Boolean; external;
	function Auo_picture (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer) : Boolean; external;
	function Auo_cycle (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer) : Boolean; external;

	Procedure Aus_boxed; external;
	Procedure Aus_cycle; external;
	Function Ash_prog (path, command, env: Pointer): LongInt; external;
	Function Ash_module (path: PChar): Integer; external;

	{ NEW }
	Procedure Ash_error (mess: Integer;		{ standard-error-handler }
		para: Pointer); external;
	Function Ash_nextdd (act: A_ddPtr): A_ddPtr; external;	{ returns cyclic D&D-partners, init act with NULL, end is NULL }
	Function Ash_sendall (mess: Pointer;
		typ: Longint): Integer; external;	{ sendet DD-Partnern (mit Typ type) oder unter MTOS/MagiC }
											{ allen (type<0) den 8 INT16-langen Messageblock }
	Function Ash_getcookie (cookie: Longint;
		value: Pointer): Integer; external;	{ looks for 'cookie' and writes its value in val }
											{ returns TRUE on success }
	Function Ash_getenv (look: PChar): PChar; external;
											{ looks for 'char' in Env and returns value }

	Function Af_2drv (f: PChar): Integer; external;		{ returns filedrv or Dgetdrv if non-exist }
	Function Af_2path (d, f: PChar): PChar; external;	{ returns path of file or "\\"	in dest and back }
	Function Af_2name (d, f: PChar): PChar; external;	{ returns DEMO from [d:][bla\\bli]\\DEMO[.EXT] or "" in dest and back }
	Function Af_2fullname (d, f: PChar): PChar; external;	{ return DEMO.TXT }
	Function Af_2ext (d, f: PChar): PChar; external;	{ returns Extension from the filename(!) or "" in dest and back }
	Function Af_buildname (d: PChar;
		drv: Integer; p, n, e: PChar): PChar; external;	{ builds full pathfilename, missing parts were added to dest and back }
	Function Af_length (f: PChar): Longint; external;	{ ermittelt DateilÑnge }

	Function Af_select (title, path, ext: PChar): PChar; external;		{ Fileselector }
	{ NEW }
	Function Af_first_fsel (title, path, ext: PChar): PChar; external;
	Function Af_next_fsel: PChar; external;
	Function Af_cfgfile (files: PChar): PChar; external;		{ cfg files }

	Function Af_first (start: PChar; fileinfo: XATTRPtr): PChar; External;
	Function Af_next(fileinfo: XATTRPtr): PChar; External;
	Function Af_readdir (start: PChar): A_FileListPtr; External;
	Procedure Af_freedir (list: A_FileListPtr); External;

	Procedure Ascrp_clear (f: PChar); external;			{ lîscht im Klemmbrett mit Ext f oder alles nei NULL }
	Function Ascrp_get (e: PChar; b, l: Pointer): Integer; external;	{ holt aus Klemmbrett in b die Ext e }
	Function Ascrp_put (e: PChar; b, l: Pointer;
		appe: Integer): Integer; external;					{ schreibt Daten ins Klemmbrett }

{ ACSPLUS }

	Function A_editor( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;		{ checkboxes, parm simular to ob_spec for boxes ! }
	function A_slider( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;	{ rounded selectable elements, parm simular to ob_spec for boxes ! }
	function A_wislider( dummy1, dummy2 : Pointer; parm: PARMBLKPtr) : Integer; external;	{ draws a frames half a character inside ! }

	function Auo_editor (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer) : Boolean; external;
	function Auo_slider (entry: ACSOBJECTPtr; task: Integer; in_out: Pointer) : Boolean; external;
	Procedure Aus_editor; external;
	Procedure Aus_slider; external;
{	Procedure Auok_editor (entry: ACSOBJECTPtr; kstate, key: Integer); external;	}

	Procedure Awd_quit; External;
	Procedure Awd_open; External;
	Procedure Awd_close; External;
	Procedure Awd_delete; External;
	Procedure Awd_info; External;
	Procedure Awd_hor; External;
	Procedure Awd_list; External;
	Procedure Awd_ver; External;
	Procedure Awd_behaviour; External;
	Procedure Awd_module; External;
	Procedure Awd_save; External;

	Function get_desktop: AwindowPtr; External;

	Procedure Apd_close; External;
	Procedure Apd_delete; External;
	Procedure Apd_info; External;
	Procedure Apd_list; External;
	Procedure Apd_module; External;
	Procedure Apd_new; External;
	Procedure Apd_open; External;
	Procedure Apd_quit; External;

	Function get_pur_desk: AwindowPtr; External;
	Function get_module_window: AwindowPtr; External;

	Procedure wputs (text: PChar; wi: AwindowPtr); External;
	Procedure wvprintf (wi: AwindowPtr; format: PChar; arglist: Pointer); External;
{	Procedure wprintf (wi: AwindowPtr, format: PChar, ... ); Variable Parameter kennt Pascal NICHT }
	Function get_protocol: AwindowPtr; external;

	Procedure Aed_wrap; External;
	Procedure Aed_toclip; External;
	Procedure Aed_fromclip; External;
	Procedure Aed_copy; External;
	Procedure Aed_cut; External;
	Procedure Aed_cutline; External;
	Procedure Aed_find; External;
	Procedure Aed_findsel; External;
	Procedure Aed_findnext; External;
	Procedure Aed_fkey; External;
	Procedure Aed_gotoline; External;
	Procedure Aed_info; External;
	Procedure Aed_open; External;
	Procedure Aed_merge; External;
	Procedure Aed_paste; External;
	Procedure Aed_quit; External;
	Procedure Aed_replace; External;
	Procedure Aed_replacenext; External;
	Procedure Aed_save; External;
	Procedure Aed_saveas; External;
	Procedure Aed_saveoptions; External;
	Procedure Aed_selall; External;
	Procedure Aed_swap; External;
	Procedure Aed_font; External;
	Procedure Aed_option; External;
	Procedure Aed_undo; External;
	Function get_editor: AwindowPtr; external;
	Procedure w_pline (wi: AwindowPtr; count: Integer; var pxy: ptsin_Array); External;
	Procedure w_pmarker (wi: AwindowPtr; count: Integer; var pxy: ptsin_Array); External;
	Procedure w_gtext (wi: AwindowPtr; x: Integer; y: Integer; strng: PChar); External;
	Procedure w_fillarea (wi: AwindowPtr; count: Integer; var pxy: ptsin_Array); External;
	Procedure w_contourfill (wi: AwindowPtr; x: Integer; y: Integer; index: Integer); External;
	Procedure wr_recfl (wi: AwindowPtr; var pxy: Array_4); External;
	Procedure w_bar (wi: AwindowPtr; var pxy: Array_4); External;
	Procedure w_arc (wi: AwindowPtr; x: Integer; y: Integer; rad: Integer; begang: Integer; endang: Integer); External;
	Procedure w_pieslice (wi: AwindowPtr; x: Integer; y: Integer; rad: Integer; begang: Integer; endang: Integer); External;
	Procedure w_circle (wi: AwindowPtr; x: Integer; y: Integer; rad: Integer); External;
	Procedure w_ellipse (wi: AwindowPtr; x: Integer; y: Integer; xrad: Integer; yrad: Integer); External;
	Procedure w_ellarc (wi: AwindowPtr; x: Integer; y: Integer; xrad: Integer; yrad: Integer; begang: Integer; endang: Integer); External;
	Procedure w_ellpie (wi: AwindowPtr; x: Integer; y: Integer; xrad: Integer; yrad: Integer; begang: Integer; endang: Integer); External;
	Procedure w_rbox (wi: AwindowPtr; var pxy: Array_4); External;
	Procedure w_rfbox (wi: AwindowPtr; var pxy: Array_4); External;
	Procedure w_justified (wi: AwindowPtr; x: Integer; y: Integer; strng: PChar; length: Integer; word_space: Integer; char_space: Integer); External;

	Procedure w_draw (wi: AwindowPtr; x1: Integer; y1: Integer; x2: Integer; y2: Integer); External;
	Procedure w_update (wi: AwindowPtr); External;
	Procedure w_clr (wi: AwindowPtr); External;
	Procedure w_inv (wi: AwindowPtr); External;
	Function get_plotter: AwindowPtr; external;

	Function get_list: AwindowPtr; External;

	Function A_fontsel (var fontid: Integer; var height: Integer; prop: Integer): Integer; External;
	Procedure read_multiline (dest: PChar; len: Integer; from: PCharPtr; lines: Integer); External;
	Procedure write_multiline (dest: PChar; len: Integer; from: PCharPtr;lines: Integer); External;

	Procedure start_acs (ini: Aretint; descr: AdescrPtr);
	
(* Functions for ULinList *)

	Function Alu_create : ULinListPtr; external;
	Procedure Alu_delete( liste: ULinListPtr ); external;

(* Functions for the Config-Strings *)

	Function Acfg_create( info: UCfgInfoPtr; load: Integer ) : UConfigPtr; external;
	Procedure Acfg_delete( config: UConfig ); external;
	Procedure Acfg_clear( cfg: UConfig; info: UConfigPtr ); external;
	Procedure Acfg_clearGroup( config: UConfigPtr ); external;
	Function Acfg_load( config: UConfig; filename: PChar ) : Integer; external;
	Function Acfg_save( config: UConfig; filename: PChar ) : Integer; external;
	Function Acfg_isChanged( config: UConfig ) : Integer; external;
	Function Acfg_getValue( config: UConfig; kategorie, name, value: PChar ) : PChar; external;
	Function Acfg_setValue( config: UConfig; kategorie, name, value: PChar ) : PChar; external;
	Function Acfg_clearValue( config: UConfig; kategorie, name, value: PChar ) : PChar; external;
	Procedure Acfg_clearHeader( config: UConfig ); external;
	Function Acfg_headAnzahl( config: UConfig ) : Integer; external;
	Function Acfg_setHeader( config: UConfig; anzahl: Integer; head_lines: array of PChar ) : PCharPtr; external;
	Function Acfg_getHeader( config: UConfig; head_lines: array of PChar ) : PCharPtr; external;
	Function Acfg_grpAnzahl( config: UConfig ) : Integer; external;
	Function Acfg_grpName( config: UConfig; grp_nr: Integer; name: PChar ) : PChar; external;
	Function Acfg_strAnzahl( config: UConfig; grp_nr: Integer ) : Integer; external;
	Function Acfg_strName( config: UConfig; grp_nr, str_nr: Integer; name: PChar ) : PChar; external;
	Function Acfg_strValue( config: UConfig; grp_nr, str_nr: Integer; value: PChar ) : PChar; external;
	Function Acfg_strIsComment( config: UConfig; grp_nr, str_nr: Integer ) : Integer; external;
	Function Acfg_isCfgfile( config: UConfig; filename: PChar ) : Integer; external;

	Function Acfg_createInfo : UCfgInfoPtr; external;
	Procedure Acfg_deleteInfo( info: UCfgInfoPtr ); external;
	Function Acfg_setInfo( config: UConfig; info: UCfgInfoPtr ) : UCfgInfoPtr; external;
	Function Acfg_getInfo( config: UConfig; info: UCfgInfoPtr ) : UCfgInfoPtr; external;
	Function Acfg_copyInfo( VAR dest: UCfgInfoPtr; source: UCfgInfoPtr ) : UCfgInfoPtr; external;

IMPLEMENTATION

VAR
	ACSdescr: Adescr;
	Errno: Integer;
	_baspag: PDPtr;
	_app: Integer;
	_FilSysV: Pointer;
	init_call: Aretint;
	
	Function	gl_apid;
	Begin
		gl_apid := ACSBlk^.gl_apid;
	End;
	
	Function	phys_handle;
	Begin
		phys_handle := ACSBlk^.phys_handle;
	End;
	
	Function	gl_wattr;
	Begin
		gl_wattr := ACSBlk^.gl_wattr;
	End;
	
	Function	gl_hattr;
	Begin
		gl_hattr := ACSBlk^.gl_hattr;
	End;
	
	Function	desk;
	Begin
		desk := @ACSBlk^. desk;
	End;
	
	{ VDI }
	Function	vdi_handle;
	Begin
		vdi_handle := ACSBlk^.vdi_handle;
	End;
	
	Function	gl_wbox;
	Begin
		gl_wbox := ACSBlk^.gl_wbox;
	End;
	
	Function	gl_hbox;
	Begin
		gl_hbox := ACSBlk^.gl_hbox;
	End;
	
	Function	gl_wchar;
	Begin
		gl_wchar := ACSBlk^.gl_wchar;
	End;
	
	Function	gl_hchar;
	Begin
		gl_hchar := ACSBlk^.gl_hchar;
	End;
	
	Function	ncolors;
	Begin
		ncolors := ACSBlk^.ncolors;
	End;
	
	Function	nplanes;
	Begin
		nplanes:= ACSBlk^.nplanes;
	End;
	
	{ Pathes }
	Function	appname;
	Begin
		appname := @ACSBlk^.appname;
	End;
	
	Function	apppath;
	Begin
		apppath := @ACSBlk^.apppath;
	End;
	
	Function	apppara;
	Begin
		apppara := @ACSBlk^.apppara;
	End;
	
	Function	appfrom;
	Begin
		appfrom := @ACSBlk^.appfrom;
	End;
	
	Function	basename;
	Begin
		basename := @ACSBlk^.basename;
	End;
	
	{ others }
	Function	ev_mtcount;
	Begin
		ev_mtcount := ACSBlk^.ev_mtcount;
	End;
	
	Function	application;
	Begin
		application := ACSBlk^.application;
	End;
	
	Function	multitask;
	Begin
		multitask := ACSBlk^.multitask;
	End;
	
	Function	appexit;
	Begin
		appexit := ACSBlk^.appexit;
	End;
	
	Function	description;
	Begin
		description := ACSBlk^.description;
	End;
	
	Function	Aselect;
	Begin
		Aselect := @ACSBlk^.Aselect;
	End;
	
	Function	ev_window;
	Begin
		ev_window := ACSBlk^.ev_window;
	End;
	
	Function	ev_object;
	Begin
		ev_object := ACSBlk^.ev_object;
	End;
	
	Function	ev_obnr;
	Begin
		ev_obnr := ACSBlk^.ev_obnr;
	End;
	
	Function	ev_mmox;
	Begin
		ev_mmox := ACSBlk^.ev_mmox;
	End;
	
	Function	ev_mmoy;
	Begin
		ev_mmoy := ACSBlk^.ev_mmoy;
	End;
	
	Function	ev_mmokstate;
	Begin
		ev_mmokstate := ACSBlk^.ev_mmokstate;
	End;
	
	Function	dia_abort;
	Begin
		dia_abort := ACSBlk^.dia_abort;
	End;
	
	Function	screenMFDB;
	Begin
		screenMFDB := @ACSBlk^.screenMFDB;
	End;

	Procedure acs_call(argc: Integer; argv, env: PCharPtr); external;
	Function get_acsblk: AblkPtr; external;

	Function ACSinit: Integer;
	Begin
		ACSinit := init_call;
	end;
	
	Procedure dummy;
	begin
	end;

	Procedure start_acs (ini: Aretint; descr: AdescrPtr);
	Begin
		(* Beim Unit-Init ist es nicht sicher genug... ;-) *)
		ACSblk := get_acsblk;
		ACSblk^.description := descr;
		
		PUR_DESK:=get_pur_desk;
		DESKTOP:=get_desktop;
		
		_baspag := BasePage;
		IF AppFlag
		THEN
			_app := 1
		ELSE
			_app := 0;
		
		init_call := ini;
		If descr^.root=NIL
		Then Begin
			descr^.root := get_pur_desk;
		End;
		
		(*acs_call(argc, argv, env);*)
		acs_call(0, NIL, _baspag^.p_env);
	End;
	
{$L ppacs.lib }

Begin
End.
