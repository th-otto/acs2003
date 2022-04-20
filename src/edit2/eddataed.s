		.text

editdat_abort:
		movea.l    ACSblk,a0
		movea.l    600(a0),a0
		jsr        term
		rts

dt_make:
		movem.l    a2-a4,-(a7)
		subq.w     #4,a7
		movea.l    a0,a2
		movea.l    4(a2),a3
		movea.l    18(a3),a4
		move.l     a4,d0
		beq.s      dt_make_1
		movea.l    a4,a0
		jsr        Awi_show
		bra.s      dt_make_2
dt_make_1:
		moveq.l    #8,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     a0,d0
		beq.s      dt_make_3
		movea.l    a2,a1
		moveq.l    #8,d0
		jsr        memcpy
		lea.l      22(a3),a0
		move.l     a0,WI_DATA+78
		movea.l    WI_DATA+90,a1
		move.l     a0,8(a1)
		lea.l      WI_DATA,a0
		jsr        Awi_create
		movea.l    a0,a4
		move.l     a4,d0
		beq.s      dt_make_3
		movea.l    (a2),a1
		pea.l      360(a1)
		lea.l      58(a3),a1
		jsr        wi_pos
		addq.w     #4,a7
		move.l     (a7),(a4)
		move.l     a4,18(a3)
		movea.l    a4,a0
		jsr        set_data
		movea.l    a4,a0
		movea.l    12(a4),a1
		jsr        (a1)
		tst.w      d0
		beq.s      dt_make_2
		movea.l    a4,a0
		jsr        term
dt_make_3:
		suba.l     a0,a0
		bra.s      dt_make_4
dt_make_2:
		movea.l    a4,a0
dt_make_4:
		addq.w     #4,a7
		movem.l    (a7)+,a2-a4
		rts

dt_service:
		movem.l    d3/a2-a4,-(a7)
		movea.l    a0,a2
		move.w     d0,d3
		movea.l    a1,a4
		movea.l    (a0),a3
		subq.w     #2,d0
		beq.s      dt_service_1
		sub.w      #0x270E,d0
		beq.s      dt_service_2
		bra.s      dt_service_3
dt_service_1:
		movea.l    a2,a0
		jsr        term
		bra.s      dt_service_4
dt_service_2:
		movea.l    4(a3),a1
		movea.l    a2,a0
		jsr        new_name
		bra.s      dt_service_4
dt_service_3:
		movea.l    a4,a1
		move.w     d3,d0
		movea.l    a2,a0
		jsr        Awi_service
		bra.s      dt_service_5
dt_service_4:
		moveq.l    #1,d0
dt_service_5:
		movem.l    (a7)+,d3/a2-a4
		rts

set_data:
		movea.l    (a0),a1
		rts

term:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		movea.l    a0,a2
		ori.w      #0x0100,86(a2)
		movea.l    (a0),a3
		movea.l    4(a3),a1
		clr.l      18(a1)
		move.w     86(a2),d0
		and.w      #0x0800,d0
		beq.s      term_1
		lea.l      44(a2),a1
		movea.l    4(a3),a0
		lea.l      58(a0),a0
		moveq.l    #8,d0
		jsr        memcpy
		bra.s      term_2
term_1:
		moveq.l    #8,d0
		lea.l      36(a2),a1
		movea.l    4(a3),a0
		lea.l      58(a0),a0
		jsr        memcpy
term_2:
		movea.l    a3,a0
		jsr        Ax_free
		movea.l    a2,a0
		jsr        Awi_closed
		movea.l    a2,a0
		jsr        Awi_delete
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.data

	.globl A_MISSENTRY
A_MISSENTRY:
		dc.b '[3][ Objekteintrag | nicht vorhanden! ][ Abbruch ]',0
	.globl ERR_FILETYP
ERR_FILETYP:
		dc.b '[3][ Falscher Dateityp!][ Abbruch ]',0
	.globl ERR_OPEN
ERR_OPEN:
		dc.b "[3][ | Konnte Datei '%s' | nicht finden oder es trat | ein Fehler beim ôffnen ein! | ][ Abbruch ]",0
	.globl ERR_TRANS
ERR_TRANS:
		dc.b '[3][ Die Translationstabelle ist| Åbergelaufen! Bitte das ACS- | Modul in mehrere Module | aufteilen! ][ Abbruch ]',0
	.globl ERR_TYPE
ERR_TYPE:
		dc.b '[1][ Ein unzulÑssiger Objekttyp | wurde importiert!][ Abbruch ]',0
TEXT_002:
		dc.b 0
TEXT_003:
		dc.b 'OK',0
TEXT_004:
		dc.b 'Abbruch',0
TEXT_006:
		dc.b '1234567890123456789012345678901',0
TEXT_01:
		dc.b 'Saving...',0
TEXT_02:
		dc.b 'Ausgabe:',0
TEXT_03:
		dc.b 'Datei:',0
TEXT_04:
		dc.b 'Liste:',0
TEXT_05:
		dc.b 'Object:',0
TEXT_07:
		dc.b '12345*12345',0
TEXT_10:
		dc.b $31,0
TEXT_191:
		dc.b 'Name:',0

	.globl al1_obj
al1_obj:
		dc.b 'ML1-ALERT LIST',0

	.globl al2_obj
al2_obj:
		dc.b 'ML2-ALERT LIST',0

	.globl al3_obj
al3_obj:
		dc.b 'ML3-ALERT LIST',0

	.globl al_obj
al_obj:
		dc.b 'ALERT LIST',0

	.globl ic_obj
ic_obj:
		dc.b 'ICON LIST',0

	.globl if_obj
if_obj:
		dc.b 'DATA LIST',0

	.globl im_obj
im_obj:
		dc.b 'IMAGE LIST',0

	.globl me_obj
me_obj:
		dc.b 'MENU LIST',0

	.globl mf_obj
mf_obj:
		dc.b 'MOUSEFORM LIST',0

	.globl ml1_obj
ml1_obj:
		dc.b 'ML1-TEXT LIST',0

	.globl ml2_obj
ml2_obj:
		dc.b 'ML2-TEXT LIST',0

	.globl ml3_obj
ml3_obj:
		dc.b 'ML3-TEXT LIST',0

	.globl ob_obj
ob_obj:
		dc.b 'OBJECTTREE LIST',0

	.globl pu_obj
pu_obj:
		dc.b 'POPUP LIST',0

	.globl rf_obj
rf_obj:
		dc.b 'REFERENCE LIST',0

	.globl st_obj
st_obj:
		dc.b 'TEXT LIST',0

	.globl te_obj
te_obj:
		dc.b 'TEDINFO LIST',0

	.globl us_obj
us_obj:
		dc.b 'USERBLK LIST',0

	.globl wi_obj
wi_obj:
		dc.b 'WINDOW LIST',0
		dc.b $00

TEDINFO_01:
		dc.l TEXT_01
		dc.l TEXT_002
		dc.l TEXT_002
		dc.w $0003
		dc.w $0006
		dc.w $0002
		dc.w $1071
		dc.w $0000
		dc.w $0000
		dc.w $000a
		dc.w $0001
TEDINFO_02:
		dc.l TEXT_07
		dc.l TEXT_002
		dc.l TEXT_002
		dc.w $0003
		dc.w $0006
		dc.w $0002
		dc.w $1100
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0001
TEDINFO_064:
		dc.l TEXT_006
		dc.l TEXT_002
		dc.l TEXT_002
		dc.w $0003
		dc.w $0006
		dc.w $0000
		dc.w $11f0
		dc.w $0000
		dc.w $0000
		dc.w $0020
		dc.w $0001
A_3DBUTTON01:
		dc.l A_3Dbutton
		dc.w $a021
		dc.w $91f8
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON02:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_003
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON03:
		dc.l A_3Dbutton
		dc.w $29f1
		dc.w $01f8
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON05:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_004
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_BOXED02:
		dc.l A_boxed
		dc.w $9038
		dc.w $1f12
		dc.l Auo_boxed
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME02:
		dc.l A_innerframe
		dc.w $1800
		dc.w $8f19
		dc.l Auo_string
		dc.l TEXT_191
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_IMG_IM_SORT_XY:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $08ff
		dc.w $e04f
		dc.w $fe38
		dc.w $08ff
		dc.w $e02f
		dc.w $fe08
		dc.w $08ff
		dc.w $ffff
		dc.w $fe38
		dc.w $08ff
		dc.w $e02f
		dc.w $fe20
		dc.w $08ff
		dc.w $e04f
		dc.w $fe38
		dc.w $0000
		dc.w $0000
		dc.w $4000
		dc.w $0000
		dc.w $0000
		dc.w $4000
		dc.w $0007
		dc.w $ffff
		dc.w $c000
		dc.w $0015
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0000
		dc.w $0000
		dc.w $0004
		dc.w $0000
		dc.w $0000
		dc.w $1cff
		dc.w $e04f
		dc.w $fe20
		dc.w $04ff
		dc.w $e02f
		dc.w $fe28
		dc.w $0cff
		dc.w $ffff
		dc.w $fe38
		dc.w $04ff
		dc.w $e02f
		dc.w $fe08
		dc.w $1cff
		dc.w $e04f
		dc.w $fe08
		dc.w $0000
		dc.w $0000
		dc.w $4000
		dc.w $0000
		dc.w $0000
		dc.w $4000
		dc.w $0007
		dc.w $ffff
		dc.w $c000
		dc.w $0015
		dc.w $0000
		dc.w $0000
		dc.w $000e
		dc.w $0000
		dc.w $0000
		dc.w $0004
		dc.w $0000
		dc.w $0000
		dc.w $1cff
		dc.w $e04f
		dc.w $fe10
		dc.w $10ff
		dc.w $e02f
		dc.w $fe20
		dc.w $1cff
		dc.w $ffff
		dc.w $fe38
		dc.w $04ff
		dc.w $e02f
		dc.w $fe28
		dc.w $1cff
		dc.w $e04f
		dc.w $fe38
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl IM_SORT_XY
IM_SORT_XY:
		dc.l _IMG_IM_SORT_XY
		dc.w $0006
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.w $0001
_IMG_IM_SORT_YX:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $08ff
		dc.w $e04f
		dc.w $fe20
		dc.w $08ff
		dc.w $e02f
		dc.w $fe28
		dc.w $08ff
		dc.w $e1ff
		dc.w $fe38
		dc.w $08ff
		dc.w $e12f
		dc.w $fe08
		dc.w $08ff
		dc.w $e14f
		dc.w $fe08
		dc.w $0004
		dc.w $0100
		dc.w $4000
		dc.w $0004
		dc.w $0100
		dc.w $4000
		dc.w $0004
		dc.w $0100
		dc.w $4000
		dc.w $0015
		dc.w $0101
		dc.w $5000
		dc.w $000e
		dc.w $0100
		dc.w $e000
		dc.w $0004
		dc.w $0100
		dc.w $4000
		dc.w $1cff
		dc.w $e10f
		dc.w $fe38
		dc.w $04ff
		dc.w $e10f
		dc.w $fe20
		dc.w $1cff
		dc.w $e10f
		dc.w $fe38
		dc.w $10ff
		dc.w $e10f
		dc.w $fe08
		dc.w $1cff
		dc.w $e10f
		dc.w $fe38
		dc.w $0004
		dc.w $0100
		dc.w $4000
		dc.w $0004
		dc.w $0100
		dc.w $4000
		dc.w $0004
		dc.w $0100
		dc.w $4000
		dc.w $0015
		dc.w $0101
		dc.w $5000
		dc.w $000e
		dc.w $0100
		dc.w $e000
		dc.w $0004
		dc.w $0100
		dc.w $4000
		dc.w $1cff
		dc.w $e10f
		dc.w $fe10
		dc.w $04ff
		dc.w $e10f
		dc.w $fe20
		dc.w $0cff
		dc.w $ff0f
		dc.w $fe38
		dc.w $04ff
		dc.w $e00f
		dc.w $fe28
		dc.w $1cff
		dc.w $e00f
		dc.w $fe38
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl IM_SORT_YX
IM_SORT_YX:
		dc.l _IMG_IM_SORT_YX
		dc.w $0006
		dc.w $0020
		dc.w $0000
		dc.w $0000
		dc.w $0001
_IMG_SUNRISE:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $2110
		dc.w $0000
		dc.w $0000
		dc.w $2110
		dc.w $3700
		dc.w $0001
		dc.w $1020
		dc.w $4880
		dc.w $6c00
		dc.w $8782
		dc.w $3700
		dc.w $1000
		dc.w $1864
		dc.w $0000
		dc.w $000c
		dc.w $2010
		dc.w $c000
		dc.w $0002
		dc.w $4009
		dc.w $0000
		dc.w $0000
		dc.w $4008
		dc.w $0000
		dc.w $0000
		dc.w $8004
		dc.w $0000
		dc.w $000e
		dc.w $8005
		dc.w $c000
		dc.w $0000
		dc.w $8004
		dc.w $0000
		dc.w $0000
		dc.w $8004
		dc.w $0000
		dc.w $3f1c
		dc.w $7878
		dc.w $70f0
		dc.w $00e3
		dc.w $8787
		dc.w $8f0c
		dc.w $fe18
		dc.w $0000
		dc.w $0000
		dc.w $01e7
		dc.b '8p<`',0
		dc.b $00
		dc.w $0787
		dc.w $c39f
		dc.w $fe1c
		dc.w $0000
		dc.w $0000
		dc.w $01e3
		dc.w $9ce0
		dc.w $e1e0
		dc.w $0000
		dc.w $030f
		dc.w $1e1f
		dc.w $0f07
		dc.w $e000
		dc.w $70c0
		dc.w $30f8
		dc.w $0ccf
		dc.w $8f3c
		dc.w $0000
		dc.w $0300
		dc.w $0000
	.globl SUNRISE
SUNRISE:
		dc.l _IMG_SUNRISE
		dc.w $0006
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.w $0001
	.globl INFO_OB_WH
INFO_OB_WH:
		dc.w $ffff
		dc.w $0001
		dc.w $0002
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $1101
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0002
_01_INFO_OB_WH:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0000
		dc.w $0000
		dc.l TEDINFO_02
		dc.w $0000
		dc.w $0000
		dc.w $000b
		dc.w $0001
_02_INFO_OB_WH:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0015
		dc.w $0020
		dc.w $0000
		dc.l TEDINFO_02
		dc.w $0000
		dc.w $0001
		dc.w $000b
		dc.w $0001
	.globl NEW2_LABEL
NEW2_LABEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0005
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0000
		dc.w $0000
		dc.w $0024
		dc.w $0006
_01_NEW2_LABEL:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0000
		dc.w $0022
		dc.w $0003
_02_NEW2_LABEL:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0001
		dc.w $0001
		dc.w $0020
		dc.w $0001
_03_NEW2_LABEL:
		dc.w $0005
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $0004
		dc.w $0003
		dc.w $000c
		dc.w $0002
_03aNEW2_LABEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8000
		dc.w $884f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_05_NEW2_LABEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4005
		dc.w $0010
		dc.l A_3DBUTTON05
		dc.w $0013
		dc.w $0003
		dc.w $000c
		dc.w $0002
_05aNEW2_LABEL:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $8841
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl NEW_LABEL
NEW_LABEL:
		dc.w $ffff
		dc.w $0001
		dc.w $0003
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0000
		dc.w $0000
		dc.w $0024
		dc.w $0006
_01_NEW_LABEL:
		dc.w $0003
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02
		dc.w $0001
		dc.w $0000
		dc.w $0022
		dc.w $0003
_02_NEW_LABEL:
		dc.w $0001
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0008
		dc.w $0010
		dc.l A_BOXED02
		dc.w $0001
		dc.w $0001
		dc.w $001f
		dc.w $0001
_03_NEW_LABEL:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $4007
		dc.w $0010
		dc.l A_3DBUTTON02
		dc.w $000c
		dc.w $0003
		dc.w $000c
		dc.w $0002
_03aNEW_LABEL:
		dc.l chk_new_label
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $884f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl OUTPUT_INFO
OUTPUT_INFO:
		dc.w $ffff
		dc.w $0001
		dc.w $0001
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $00ff
		dc.w $1178
		dc.w $0000
		dc.w $0000
		dc.w $002c
		dc.w $000b
_01_OUTPUT_INFO:
		dc.w $0000
		dc.w $0002
		dc.w $0004
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON03
		dc.w $0000
		dc.w $0000
		dc.w $002c
		dc.w $000b
_02_OUTPUT_INFO:
		dc.w $0004
		dc.w $0003
		dc.w $0003
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $0002
		dc.w $0001
		dc.w $0028
		dc.w $0001
_03_OUTPUT_INFO:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0016
		dc.w $0000
		dc.w $0500
		dc.l TEDINFO_01
		dc.w $0000
		dc.w $0000
		dc.w $0028
		dc.w $0001
_04_OUTPUT_INFO:
		dc.w $0001
		dc.w $0005
		dc.w $000c
		dc.w $0018
		dc.w $0000
		dc.w $0010
		dc.l A_3DBUTTON01
		dc.w $0002
		dc.w $0003
		dc.w $0028
		dc.w $0007
_05_OUTPUT_INFO:
		dc.w $0006
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_02
		dc.w $0000
		dc.w $0000
		dc.w $0008
		dc.w $0001
_06_OUTPUT_INFO:
		dc.w $0007
		dc.w $ffff
		dc.w $ffff
		dc.w $0016
		dc.w $0000
		dc.w $0000
		dc.l TEDINFO_064
		dc.w $0009
		dc.w $0000
		dc.w $001f
		dc.w $0001
_07_OUTPUT_INFO:
		dc.w $0008
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_03
		dc.w $0000
		dc.w $0002
		dc.w $0006
		dc.w $0001
_08_OUTPUT_INFO:
		dc.w $0009
		dc.w $ffff
		dc.w $ffff
		dc.w $0016
		dc.w $0000
		dc.w $0000
		dc.l TEDINFO_064
		dc.w $0009
		dc.w $0002
		dc.w $001f
		dc.w $0001
_09_OUTPUT_INFO:
		dc.w $000a
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_04
		dc.w $0000
		dc.w $0004
		dc.w $0006
		dc.w $0001
_10_OUTPUT_INFO:
		dc.w $000b
		dc.w $ffff
		dc.w $ffff
		dc.w $0016
		dc.w $0000
		dc.w $0000
		dc.l TEDINFO_064
		dc.w $0009
		dc.w $0004
		dc.w $001f
		dc.w $0001
_11_OUTPUT_INFO:
		dc.w $000c
		dc.w $ffff
		dc.w $ffff
		dc.w $001c
		dc.w $0000
		dc.w $0000
		dc.l TEXT_05
		dc.w $0000
		dc.w $0006
		dc.w $0007
		dc.w $0001
_12_OUTPUT_INFO:
		dc.w $0004
		dc.w $ffff
		dc.w $ffff
		dc.w $0016
		dc.w $0020
		dc.w $0000
		dc.l TEDINFO_064
		dc.w $0009
		dc.w $0006
		dc.w $001f
		dc.w $0001
	.globl WI_NEW2_LABEL
WI_NEW2_LABEL:
		dc.w $0000
		dc.w $0000
		dc.l Awi_service
		dc.l Awi_selfcreate
		dc.l Awi_open
		dc.l Awi_init
		dc.l NEW2_LABEL
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $000b
		dc.w $0000
		dc.w $0000
		dc.w $0078
		dc.w $0032
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $f8f8
		dc.l TEXT_10
		dc.l TEXT_002
		dc.w $2710
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
	.globl WI_NEW_LABEL
WI_NEW_LABEL:
		dc.w $0000
		dc.w $0000
		dc.l Awi_service
		dc.l Awi_selfcreate
		dc.l Awi_open
		dc.l Awi_init
		dc.l NEW_LABEL
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $000b
		dc.w $0000
		dc.w $0000
		dc.w $0078
		dc.w $0032
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $f8f8
		dc.l TEXT_10
		dc.l TEXT_002
		dc.w $2710
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000

	.globl MO_ADD
MO_ADD:
		dc.w $0008
		dc.w $0008
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $0300
		dc.w $1fb0
		dc.w $3ff8
		dc.w $3ffc
		dc.w $7ffe
		dc.w $fffe
		dc.w $fffe
		dc.w $7fff
		dc.w $7fff
		dc.w $ffff
		dc.w $ffff
		dc.w $7fff
		dc.w $3fff
		dc.w $0fff
		dc.w $01ff
		dc.w $007f
		dc.w $0300
		dc.w $1cb0
		dc.b '$H"$q'
		dc.b $12
		dc.w $9802
		dc.w $84c2
		dc.w $40c1
		dc.w $73f1
		dc.w $9bf0
		dc.w $84cc
		dc.w $40cc
		dc.w $303f
		dc.w $0e3f
		dc.w $018c
		dc.w $006c
	.globl MO_BLACK
MO_BLACK:
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $c0ff
		dc.w $e0ff
		dc.w $f0ff
		dc.w $f8ff
		dc.w $fcff
		dc.w $feff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffe0
		dc.w $fe00
		dc.w $ef00
		dc.w $cf00
		dc.w $8780
		dc.w $0780
		dc.w $0380
		dc.w $0000
		dc.b '@~`~p~x~|~~~'
		dc.w $7f00
		dc.w $7f80
		dc.w $7c00
		dc.w $6c00
		dc.w $4600
		dc.w $0600
		dc.w $0300
		dc.w $0300
		dc.w $0000
	.globl MO_DRAG
MO_DRAG:
		dc.w $0008
		dc.w $0008
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $0300
		dc.w $1fb0
		dc.w $3ff8
		dc.w $3ffc
		dc.w $7ffe
		dc.w $fffe
		dc.w $fffe
		dc.w $7fff
		dc.w $7fff
		dc.w $ffff
		dc.w $ffff
		dc.w $7fff
		dc.w $3fff
		dc.w $0fff
		dc.w $01ff
		dc.w $007f
		dc.w $0300
		dc.w $1cb0
		dc.b '$H"$q'
		dc.b $12
		dc.w $9802
		dc.w $84c2
		dc.w $40c1
		dc.w $73f1
		dc.w $9bf0
		dc.w $84c0
		dc.w $40c0
		dc.w $3000
		dc.w $0e00
		dc.w $0180
		dc.w $0060
	.globl MO_TRANS
MO_TRANS:
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $c0ff
		dc.w $e0ff
		dc.w $f0ff
		dc.w $f8ff
		dc.w $fcff
		dc.w $feff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffe0
		dc.w $fe00
		dc.w $ef00
		dc.w $cf00
		dc.w $8780
		dc.w $0780
		dc.w $0380
		dc.w $00ff
		dc.w $40ab
		dc.w $60d5
		dc.w $70ab
		dc.w $78d5
		dc.w $7cab
		dc.w $7ed5
		dc.w $7fff
		dc.w $7f80
		dc.w $7c00
		dc.w $6c00
		dc.w $4600
		dc.w $0600
		dc.w $0300
		dc.w $0300
		dc.w $0000
	.globl MO_WHITE
MO_WHITE:
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0001
		dc.w $c0ff
		dc.w $e0ff
		dc.w $f0ff
		dc.w $f8ff
		dc.w $fcff
		dc.w $feff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffc0
		dc.w $ffe0
		dc.w $fe00
		dc.w $ef00
		dc.w $cf00
		dc.w $8780
		dc.w $0780
		dc.w $0380
		dc.w $00ff
		dc.b '@Å`ÅpÅxÅ|Å~Å'
		dc.w $7fff
		dc.w $7f80
		dc.w $7c00
		dc.w $6c00
		dc.w $4600
		dc.w $0600
		dc.w $0300
		dc.w $0300
		dc.w $0000
	.globl ACSdescr
ACSdescr:
		dc.b 'ACS3.00',0
		dc.w $012c
		dc.w $ffb0
		dc.w $ffb0
		dc.w $0677
		dc.b '  ACSpro 3.0.0'
		dc.w $e100
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l PUR_DESK
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0002
		dc.w $0000
		dc.w $0000
		dc.w $0003
		dc.w $0000
		dc.w $0000
		dc.w $0004
		dc.w $0000
		dc.w $0000
		dc.w $0001
		dc.w $0000
		dc.w $0000
		dc.w $0005
		dc.w $0000
		dc.w $0000
		dc.w $0006
		dc.w $0000
		dc.w $0000
		dc.w $0007
		dc.w $0000
		dc.w $0000
		dc.w $00ff
		dc.l MO_BLACK
		dc.w $00ff
		dc.l MO_WHITE
		dc.w $00ff
		dc.l MO_TRANS
		dc.w $00ff
		dc.l MO_DRAG
		dc.w $00ff
		dc.l MO_ADD
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.l xa8446
		dc.l xa8485
		dc.l xa84b7
		dc.l xa852c
		dc.l xa8564
		dc.l xa85a0
		dc.l xa85db
		dc.l xa862f
		dc.l xa8688
		dc.l xa86f5
		dc.l xa875c
		dc.l xa87a3
		dc.l xa87f0
		dc.l xa882a
		dc.l xa886a
		dc.l xa88be
		dc.l xa890a
		dc.l xa8961
		dc.l xa89bf
		dc.l xa8a03
		dc.l xa8a41
		dc.l xa8a7b
		dc.l xa8abe
		dc.l xa8b01
		dc.l xa8b55
		dc.l xa8b9f
		dc.l xa8bee
		dc.l xa8c33
		dc.l xa8c73
		dc.l xa8cbf
		dc.l xa8d11
		dc.l xa8d1b
		dc.l xa8d23
		dc.l xa8d2a
	.globl ACSconfig
ACSconfig:
		dc.l xa8484
		dc.l xa8d34
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0004
		dc.l xa8d37
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $5045
		dc.w $0000
		dc.w $0000
		dc.l ACSinit0
		dc.l ACSinit
xa8446:
		dc.b '[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]'
xa8484:
		dc.b 0
xa8485:
		dc.b '[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]',0
xa84b7:
		dc.b '[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildauflîsung | ist nicht korrekt!][ Abbruch ]',0
xa852c:
		dc.b '[1][ Eine Datei lieû sich | nicht erzeugen!][ Abbruch ]',0
xa8564:
		dc.b "[3][ Die Datei '%s'| lÑût sich nicht erzeugen! ][ Abbruch ]",0
xa85a0:
		dc.b '[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]',0
xa85db:
		dc.b '[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]',0
xa862f:
		dc.b "[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]",0
xa8688:
		dc.b '[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schlieûen.][    OK    ]',0
xa86f5:
		dc.b '[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| lîschen.][    OK    ]',0
xa875c:
		dc.b '[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]',0
xa87a3:
		dc.b '[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]',0
xa87f0:
		dc.b '[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]',0
xa882a:
		dc.b "[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]",0
xa886a:
		dc.b '[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]',0
xa88be:
		dc.b "[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",0
xa890a:
		dc.b '[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]',0
xa8961:
		dc.b "[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]",0
xa89bf:
		dc.b '[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]',0
xa8a03:
		dc.b '[1][ Eine Datei lieû sich| nicht korrekt îffnen! ][ Abbruch ]',0
xa8a41:
		dc.b "[1][ Die Datei '%s' | lÑût sich nicht îffnen!][ Abbruch ]",0
xa8a7b:
		dc.b '[1][ Es steht nicht genÅgend | Speicher zur VerfÅgung!][ Abbruch ]',0
xa8abe:
		dc.b '[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]',0
xa8b01:
		dc.b '[1][ Ein Speicherblock| befindet sich auûerhalb | der legalen Bereiche!][ Abbruch ]',0
xa8b55:
		dc.b '[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]',0
xa8b9f:
		dc.b "[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",0
xa8bee:
		dc.b '[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]',0
xa8c33:
		dc.b "[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]",0
xa8c73:
		dc.b '[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]',0
xa8cbf:
		dc.b "[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]",0
xa8d11:
		dc.b ' Achtung ',0
xa8d1b:
		dc.b ' Frage ',0
xa8d23:
		dc.b ' Stop ',0
xa8d2a:
		dc.b ' Meldung ',0
xa8d34:
		dc.b '%;',0
xa8d37:
		dc.b 'PUR_DESK',0

/* FIXME: does not belong here? */
TEXT_002_2:
		dc.b 0
TEXT_003_2:
		dc.b 'Datenblîcke werden von USERDEFs benutzt, und sind daher von den entsprechenden Editoren zu bearbeiten.',0
TEXT_005_2:
		dc.b 'OK',0
TEXT_006_2:
		dc.b 'DATEN',0
TEXT_01_2:
		dc.b ' Data-Editor ',0
		dc.b $00
DATAS_09:
		dc.w $0000
		dc.w $0000
		dc.w $02f0
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1004
		dc.w $8040
		dc.w $0088
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1100
		dc.w $8048
		dc.w $0488
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1e1f
		dc.w $e1f0
		dc.w $c3f8
		dc.w $1edf
		dc.w $edf6
		dc.w $dbf8
		dc.w $1edf
		dc.w $edf6
		dc.w $dbf8
		dc.w $1edf
		dc.w $edf6
		dc.w $dbf8
		dc.w $1edf
		dc.w $edf6
		dc.w $dbf8
		dc.w $1edf
		dc.w $edf6
		dc.w $dbf8
		dc.w $1e1f
		dc.w $e1f0
		dc.w $c3f8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fc3
		dc.w $e1fe
		dc.w $1ff8
		dc.w $1fdb
		dc.w $edfe
		dc.w $dff8
		dc.w $1fdb
		dc.w $edfe
		dc.w $dff8
		dc.w $1fdb
		dc.w $edfe
		dc.w $dff8
		dc.w $1fdb
		dc.w $edfe
		dc.w $dff8
		dc.w $1fdb
		dc.w $edfe
		dc.w $dff8
		dc.w $1fc3
		dc.w $e1fe
		dc.w $1ff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
DATAS_10:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON01_2:
		dc.l A_3Dbutton
		dc.w $29c1
		dc.w $0178
		dc.l Auo_string
		dc.l TEXT_005_2
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_3DBUTTON02_2:
		dc.l A_3Dbutton
		dc.w $21f1
		dc.w $01f8
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_FTEXT01:
		dc.l A_ftext
		dc.w $0001
		dc.w $000d
		dc.l Auo_ftext
		dc.l TEXT_003_2
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
A_INNERFRAME02_2:
		dc.l A_innerframe
		dc.w $1000
		dc.w $8f19
		dc.l Auo_string
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_C4_IC_DATA:
		dc.w $0004
		dc.l DATAS_09+6
		dc.l DATAS_10
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_MSK_IC_DATA:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
_DAT_IC_DATA:
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $11e4
		dc.w $9e4f
		dc.w $3c88
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $11e4
		dc.w $9e4f
		dc.w $3c88
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $113c
		dc.w $9e49
		dc.w $e488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $1124
		dc.w $9249
		dc.w $2488
		dc.w $113c
		dc.w $9e49
		dc.w $e488
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1000
		dc.w $0000
		dc.w $0008
		dc.w $1fff
		dc.w $ffff
		dc.w $fff8
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
IC_DATA:
		dc.l _MSK_IC_DATA
		dc.l _DAT_IC_DATA
		dc.l TEXT_006_2
		dc.w $1000
		dc.w $0000
		dc.w $0000
		dc.w $000c
		dc.w $0000
		dc.w $0030
		dc.w $001f
		dc.w $0000
		dc.w $0020
		dc.w $0048
		dc.w $0008
		dc.l _C4_IC_DATA
EDIT_DATA:
		dc.w $ffff
		dc.w $0001
		dc.w $0004
		dc.w $0018
		dc.w $0040
		dc.w $0010
		dc.l A_3DBUTTON02_2
		dc.w $0000
		dc.w $0000
		dc.w $0023
		dc.w $0009
_01_EDIT_DATA:
		dc.w $0004
		dc.w $0002
		dc.w $0002
		dc.w $0018
		dc.w $0040
		dc.w $0000
		dc.l A_INNERFRAME02_2
		dc.w $0001
		dc.w $0000
		dc.w $0021
		dc.w $0006
_02_EDIT_DATA:
		dc.w $0001
		dc.w $0003
		dc.w $0003
		dc.w $0014
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $1101
		dc.w $0001
		dc.w $0001
		dc.w $001f
		dc.w $0004
_03_EDIT_DATA:
		dc.w $0002
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0000
		dc.w $0000
		dc.l A_FTEXT01
		dc.w $0001
		dc.w $0000
		dc.w $001d
		dc.w $0004
_04_EDIT_DATA:
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $0018
		dc.w $0007
		dc.w $0010
		dc.l A_3DBUTTON01_2
		dc.w $000b
		dc.w $0006
		dc.w $000c
		dc.w $0002
_04aEDIT_DATA:
		dc.l editdat_abort
		dc.w $0000
		dc.w $0000
		dc.w $8020
		dc.w $884f
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000

	.globl WI_DATA
WI_DATA:
		dc.w $0000
		dc.w $0000
		dc.l dt_service
		dc.l dt_make
		dc.l Awi_open
		dc.l Awi_init
		dc.l EDIT_DATA
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $601f
		dc.w $0000
		dc.w $0000
		dc.w $0063
		dc.w $0063
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $ffff
		dc.w $0000
		dc.w $0000
		dc.w $fcf8
		dc.l TEXT_01_2
		dc.l TEXT_002_2
		dc.w $2710
		dc.w $0100
		dc.w $0000
		dc.w $ffff
		dc.l IC_DATA
		dc.w $0000
		dc.w $0000
		dc.l Awi_keys
		dc.l Awi_obchange
		dc.l Awi_redraw
		dc.l Awi_topped
		dc.l Awi_closed
		dc.l Awi_fulled
		dc.l Awi_arrowed
		dc.l Awi_hslid
		dc.l Awi_vslid
		dc.l Awi_sized
		dc.l Awi_moved
		dc.l Awi_iconify
		dc.l Awi_uniconify
		dc.l Awi_gemscript
		dc.w $0000
		dc.w $0000
		dc.w $0000
		dc.w $0000
