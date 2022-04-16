editdat_abort:
[0001d31e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001d324] 2068 0258                 movea.l    600(a0),a0
[0001d328] 4eb9 0001 d418            jsr        term
[0001d32e] 4e75                      rts

dt_make:
[0001d330] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001d334] 594f                      subq.w     #4,a7
[0001d336] 2448                      movea.l    a0,a2
[0001d338] 266a 0004                 movea.l    4(a2),a3
[0001d33c] 286b 0012                 movea.l    18(a3),a4
[0001d340] 200c                      move.l     a4,d0
[0001d342] 670a                      beq.s      dt_make_1
[0001d344] 204c                      movea.l    a4,a0
[0001d346] 4eb9 0005 6bea            jsr        Awi_show
[0001d34c] 6076                      bra.s      dt_make_2
dt_make_1:
[0001d34e] 7008                      moveq.l    #8,d0
[0001d350] 4eb9 0004 c608            jsr        Ax_malloc
[0001d356] 2e88                      move.l     a0,(a7)
[0001d358] 2008                      move.l     a0,d0
[0001d35a] 6764                      beq.s      dt_make_3
[0001d35c] 224a                      movea.l    a2,a1
[0001d35e] 7008                      moveq.l    #8,d0
[0001d360] 4eb9 0008 3500            jsr        memcpy
[0001d366] 41eb 0016                 lea.l      22(a3),a0
[0001d36a] 23c8 000a 9476            move.l     a0,$000A9476
[0001d370] 2279 000a 9482            movea.l    $000A9482,a1
[0001d376] 2348 0008                 move.l     a0,8(a1)
[0001d37a] 41f9 000a 9428            lea.l      WI_DATA,a0
[0001d380] 4eb9 0005 7052            jsr        Awi_create
[0001d386] 2848                      movea.l    a0,a4
[0001d388] 200c                      move.l     a4,d0
[0001d38a] 6734                      beq.s      dt_make_3
[0001d38c] 2252                      movea.l    (a2),a1
[0001d38e] 4869 0168                 pea.l      360(a1)
[0001d392] 43eb 003a                 lea.l      58(a3),a1
[0001d396] 4eb9 0001 6372            jsr        wi_pos
[0001d39c] 584f                      addq.w     #4,a7
[0001d39e] 2897                      move.l     (a7),(a4)
[0001d3a0] 274c 0012                 move.l     a4,18(a3)
[0001d3a4] 204c                      movea.l    a4,a0
[0001d3a6] 4eb9 0001 d414            jsr        set_data
[0001d3ac] 204c                      movea.l    a4,a0
[0001d3ae] 226c 000c                 movea.l    12(a4),a1
[0001d3b2] 4e91                      jsr        (a1)
[0001d3b4] 4a40                      tst.w      d0
[0001d3b6] 670c                      beq.s      dt_make_2
[0001d3b8] 204c                      movea.l    a4,a0
[0001d3ba] 4eb9 0001 d418            jsr        term
dt_make_3:
[0001d3c0] 91c8                      suba.l     a0,a0
[0001d3c2] 6002                      bra.s      dt_make_4
dt_make_2:
[0001d3c4] 204c                      movea.l    a4,a0
dt_make_4:
[0001d3c6] 584f                      addq.w     #4,a7
[0001d3c8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001d3cc] 4e75                      rts

dt_service:
[0001d3ce] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001d3d2] 2448                      movea.l    a0,a2
[0001d3d4] 3600                      move.w     d0,d3
[0001d3d6] 2849                      movea.l    a1,a4
[0001d3d8] 2650                      movea.l    (a0),a3
[0001d3da] 5540                      subq.w     #2,d0
[0001d3dc] 6708                      beq.s      dt_service_1
[0001d3de] 907c 270e                 sub.w      #$270E,d0
[0001d3e2] 670c                      beq.s      dt_service_2
[0001d3e4] 6018                      bra.s      dt_service_3
dt_service_1:
[0001d3e6] 204a                      movea.l    a2,a0
[0001d3e8] 4eb9 0001 d418            jsr        term
[0001d3ee] 601c                      bra.s      dt_service_4
dt_service_2:
[0001d3f0] 226b 0004                 movea.l    4(a3),a1
[0001d3f4] 204a                      movea.l    a2,a0
[0001d3f6] 4eb9 0001 60ea            jsr        new_name
[0001d3fc] 600e                      bra.s      dt_service_4
dt_service_3:
[0001d3fe] 224c                      movea.l    a4,a1
[0001d400] 3003                      move.w     d3,d0
[0001d402] 204a                      movea.l    a2,a0
[0001d404] 4eb9 0005 9dd0            jsr        Awi_service
[0001d40a] 6002                      bra.s      dt_service_5
dt_service_4:
[0001d40c] 7001                      moveq.l    #1,d0
dt_service_5:
[0001d40e] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001d412] 4e75                      rts

set_data:
[0001d414] 2250                      movea.l    (a0),a1
[0001d416] 4e75                      rts

term:
[0001d418] 2f0a                      move.l     a2,-(a7)
[0001d41a] 2f0b                      move.l     a3,-(a7)
[0001d41c] 2448                      movea.l    a0,a2
[0001d41e] 006a 0100 0056            ori.w      #$0100,86(a2)
[0001d424] 2650                      movea.l    (a0),a3
[0001d426] 226b 0004                 movea.l    4(a3),a1
[0001d42a] 42a9 0012                 clr.l      18(a1)
[0001d42e] 302a 0056                 move.w     86(a2),d0
[0001d432] c07c 0800                 and.w      #$0800,d0
[0001d436] 6716                      beq.s      term_1
[0001d438] 43ea 002c                 lea.l      44(a2),a1
[0001d43c] 206b 0004                 movea.l    4(a3),a0
[0001d440] 41e8 003a                 lea.l      58(a0),a0
[0001d444] 7008                      moveq.l    #8,d0
[0001d446] 4eb9 0008 3500            jsr        memcpy
[0001d44c] 6014                      bra.s      term_2
term_1:
[0001d44e] 7008                      moveq.l    #8,d0
[0001d450] 43ea 0024                 lea.l      36(a2),a1
[0001d454] 206b 0004                 movea.l    4(a3),a0
[0001d458] 41e8 003a                 lea.l      58(a0),a0
[0001d45c] 4eb9 0008 3500            jsr        memcpy
term_2:
[0001d462] 204b                      movea.l    a3,a0
[0001d464] 4eb9 0004 c7c8            jsr        Ax_free
[0001d46a] 204a                      movea.l    a2,a0
[0001d46c] 4eb9 0005 8362            jsr        Awi_closed
[0001d472] 204a                      movea.l    a2,a0
[0001d474] 4eb9 0005 85f2            jsr        Awi_delete
[0001d47a] 265f                      movea.l    (a7)+,a3
[0001d47c] 245f                      movea.l    (a7)+,a2
[0001d47e] 4e75                      rts

	.data

A_MISSENTRY:
[000a770a]                           dc.b '[3][ Objekteintrag | nicht vorhanden! ][ Abbruch ]',0
ERR_FILETYP:
[000a773d]                           dc.b '[3][ Falscher Dateityp!][ Abbruch ]',0
ERR_OPEN:
[000a7761]                           dc.b '[3][ | Konnte Datei '%s' | nicht finden oder es trat | ein Fehler beim ôffnen ein! | ][ Abbruch ]',0
ERR_TRANS:
[000a77c3]                           dc.b '[3][ Die Translationstabelle ist| Åbergelaufen! Bitte das ACS- | Modul in mehrere Module | aufteilen! ][ Abbruch ]',0
ERR_TYPE:
[000a7836]                           dc.b '[1][ Ein unzulÑssiger Objekttyp | wurde importiert!][ Abbruch ]',0
TEXT_002:
[000a7876]                           dc.w $004f
[000a7878]                           dc.w $4b00
TEXT_004:
[000a787a]                           dc.b 'Abbruch',0
TEXT_006:
[000a7882]                           dc.b '1234567890123456789012345678901',0
TEXT_01:
[000a78a2]                           dc.b 'Saving...',0
TEXT_02:
[000a78ac]                           dc.b 'Ausgabe:',0
TEXT_03:
[000a78b5]                           dc.b 'Datei:',0
TEXT_04:
[000a78bc]                           dc.b 'Liste:',0
TEXT_05:
[000a78c3]                           dc.b 'Object:',0
TEXT_07:
[000a78cb]                           dc.b '12345*12345',0
TEXT_10:
[000a78d7]                           dc.b $31
[000a78d8]                           dc.w $004e
[000a78da]                           dc.b 'ame:',0
al1_obj:
[000a78df]                           dc.b 'ML1-ALERT LIST',0
al2_obj:
[000a78ee]                           dc.b 'ML2-ALERT LIST',0
al3_obj:
[000a78fd]                           dc.b 'ML3-ALERT LIST',0
al_obj:
[000a790c]                           dc.b 'ALERT LIST',0
ic_obj:
[000a7917]                           dc.b 'ICON LIST',0
if_obj:
[000a7921]                           dc.b 'DATA LIST',0
im_obj:
[000a792b]                           dc.b 'IMAGE LIST',0
me_obj:
[000a7936]                           dc.b 'MENU LIST',0
mf_obj:
[000a7940]                           dc.b 'MOUSEFORM LIST',0
ml1_obj:
[000a794f]                           dc.b 'ML1-TEXT LIST',0
ml2_obj:
[000a795d]                           dc.b 'ML2-TEXT LIST',0
ml3_obj:
[000a796b]                           dc.b 'ML3-TEXT LIST',0
ob_obj:
[000a7979]                           dc.b 'OBJECTTREE LIST',0
pu_obj:
[000a7989]                           dc.b 'POPUP LIST',0
rf_obj:
[000a7994]                           dc.b 'REFERENCE LIST',0
st_obj:
[000a79a3]                           dc.b 'TEXT LIST',0
te_obj:
[000a79ad]                           dc.b 'TEDINFO LIST',0
us_obj:
[000a79ba]                           dc.b 'USERBLK LIST',0
wi_obj:
[000a79c7]                           dc.b 'WINDOW LIST',0
[000a79d3]                           dc.b $00
[000a79d4] 000a78a2                  dc.l TEXT_01
[000a79d8] 000a7876                  dc.l TEXT_002
[000a79dc] 000a7876                  dc.l TEXT_002
[000a79e0]                           dc.w $0003
[000a79e2]                           dc.w $0006
[000a79e4]                           dc.w $0002
[000a79e6]                           dc.w $1071
[000a79e8]                           dc.w $0000
[000a79ea]                           dc.w $0000
[000a79ec]                           dc.w $000a
[000a79ee]                           dc.w $0001
TEDINFO_02:
[000a79f0] 000a78cb                  dc.l TEXT_07
[000a79f4] 000a7876                  dc.l TEXT_002
[000a79f8] 000a7876                  dc.l TEXT_002
[000a79fc]                           dc.w $0003
[000a79fe]                           dc.w $0006
[000a7a00]                           dc.w $0002
[000a7a02]                           dc.w $1100
[000a7a04]                           dc.w $0000
[000a7a06]                           dc.w $0000
[000a7a08]                           dc.w $000c
[000a7a0a]                           dc.w $0001
TEDINFO_064:
[000a7a0c] 000a7882                  dc.l TEXT_006
[000a7a10] 000a7876                  dc.l TEXT_002
[000a7a14] 000a7876                  dc.l TEXT_002
[000a7a18]                           dc.w $0003
[000a7a1a]                           dc.w $0006
[000a7a1c]                           dc.w $0000
[000a7a1e]                           dc.w $11f0
[000a7a20]                           dc.w $0000
[000a7a22]                           dc.w $0000
[000a7a24]                           dc.w $0020
[000a7a26]                           dc.w $0001
A_3DBUTTON01:
[000a7a28] 00064a22                  dc.l A_3Dbutton
[000a7a2c]                           dc.w $a021
[000a7a2e]                           dc.w $91f8
[000a7a30] 000630f2                  dc.l Auo_string
[000a7a34]                           dc.w $0000
[000a7a36]                           dc.w $0000
[000a7a38]                           dc.w $0000
[000a7a3a]                           dc.w $0000
[000a7a3c]                           dc.w $0000
[000a7a3e]                           dc.w $0000
[000a7a40]                           dc.w $0000
[000a7a42]                           dc.w $0000
[000a7a44]                           dc.w $0000
[000a7a46]                           dc.w $0000
A_3DBUTTON02:
[000a7a48] 00064a22                  dc.l A_3Dbutton
[000a7a4c]                           dc.w $29c1
[000a7a4e]                           dc.w $0178
[000a7a50] 000630f2                  dc.l Auo_string
[000a7a54] 000a7877                  dc.l TEXT_003
[000a7a58]                           dc.w $0000
[000a7a5a]                           dc.w $0000
[000a7a5c]                           dc.w $0000
[000a7a5e]                           dc.w $0000
[000a7a60]                           dc.w $0000
[000a7a62]                           dc.w $0000
[000a7a64]                           dc.w $0000
[000a7a66]                           dc.w $0000
A_3DBUTTON03:
[000a7a68] 00064a22                  dc.l A_3Dbutton
[000a7a6c]                           dc.w $29f1
[000a7a6e]                           dc.w $01f8
[000a7a70] 000630f2                  dc.l Auo_string
[000a7a74]                           dc.w $0000
[000a7a76]                           dc.w $0000
[000a7a78]                           dc.w $0000
[000a7a7a]                           dc.w $0000
[000a7a7c]                           dc.w $0000
[000a7a7e]                           dc.w $0000
[000a7a80]                           dc.w $0000
[000a7a82]                           dc.w $0000
[000a7a84]                           dc.w $0000
[000a7a86]                           dc.w $0000
A_3DBUTTON05:
[000a7a88] 00064a22                  dc.l A_3Dbutton
[000a7a8c]                           dc.w $29c1
[000a7a8e]                           dc.w $0178
[000a7a90] 000630f2                  dc.l Auo_string
[000a7a94] 000a787a                  dc.l TEXT_004
[000a7a98]                           dc.w $0000
[000a7a9a]                           dc.w $0000
[000a7a9c]                           dc.w $0000
[000a7a9e]                           dc.w $0000
[000a7aa0]                           dc.w $0000
[000a7aa2]                           dc.w $0000
[000a7aa4]                           dc.w $0000
[000a7aa6]                           dc.w $0000
A_BOXED02:
[000a7aa8] 0006afea                  dc.l A_boxed
[000a7aac]                           dc.w $9038
[000a7aae]                           dc.w $1f12
[000a7ab0] 0006a068                  dc.l Auo_boxed
[000a7ab4]                           dc.w $0000
[000a7ab6]                           dc.w $0000
[000a7ab8]                           dc.w $0000
[000a7aba]                           dc.w $0000
[000a7abc]                           dc.w $0000
[000a7abe]                           dc.w $0000
[000a7ac0]                           dc.w $0000
[000a7ac2]                           dc.w $0000
[000a7ac4]                           dc.w $0000
[000a7ac6]                           dc.w $0000
A_INNERFRAME02:
[000a7ac8] 00064256                  dc.l A_innerframe
[000a7acc]                           dc.w $1800
[000a7ace]                           dc.w $8f19
[000a7ad0] 000630f2                  dc.l Auo_string
[000a7ad4] 000a78d9                  dc.l TEXT_191
[000a7ad8]                           dc.w $0000
[000a7ada]                           dc.w $0000
[000a7adc]                           dc.w $0000
[000a7ade]                           dc.w $0000
[000a7ae0]                           dc.w $0000
[000a7ae2]                           dc.w $0000
[000a7ae4]                           dc.w $0000
[000a7ae6]                           dc.w $0000
_IMG_IM_SORT_XY:
[000a7ae8]                           dc.w $0000
[000a7aea]                           dc.w $0000
[000a7aec]                           dc.w $0000
[000a7aee]                           dc.w $0000
[000a7af0]                           dc.w $0000
[000a7af2]                           dc.w $0000
[000a7af4]                           dc.w $08ff
[000a7af6]                           dc.w $e04f
[000a7af8]                           dc.w $fe38
[000a7afa]                           dc.w $08ff
[000a7afc]                           dc.w $e02f
[000a7afe]                           dc.w $fe08
[000a7b00]                           dc.w $08ff
[000a7b02]                           dc.w $ffff
[000a7b04]                           dc.w $fe38
[000a7b06]                           dc.w $08ff
[000a7b08]                           dc.w $e02f
[000a7b0a]                           dc.w $fe20
[000a7b0c]                           dc.w $08ff
[000a7b0e]                           dc.w $e04f
[000a7b10]                           dc.w $fe38
[000a7b12]                           dc.w $0000
[000a7b14]                           dc.w $0000
[000a7b16]                           dc.w $4000
[000a7b18]                           dc.w $0000
[000a7b1a]                           dc.w $0000
[000a7b1c]                           dc.w $4000
[000a7b1e]                           dc.w $0007
[000a7b20]                           dc.w $ffff
[000a7b22]                           dc.w $c000
[000a7b24]                           dc.w $0015
[000a7b26]                           dc.w $0000
[000a7b28]                           dc.w $0000
[000a7b2a]                           dc.w $000e
[000a7b2c]                           dc.w $0000
[000a7b2e]                           dc.w $0000
[000a7b30]                           dc.w $0004
[000a7b32]                           dc.w $0000
[000a7b34]                           dc.w $0000
[000a7b36]                           dc.w $1cff
[000a7b38]                           dc.w $e04f
[000a7b3a]                           dc.w $fe20
[000a7b3c]                           dc.w $04ff
[000a7b3e]                           dc.w $e02f
[000a7b40]                           dc.w $fe28
[000a7b42]                           dc.w $0cff
[000a7b44]                           dc.w $ffff
[000a7b46]                           dc.w $fe38
[000a7b48]                           dc.w $04ff
[000a7b4a]                           dc.w $e02f
[000a7b4c]                           dc.w $fe08
[000a7b4e]                           dc.w $1cff
[000a7b50]                           dc.w $e04f
[000a7b52]                           dc.w $fe08
[000a7b54]                           dc.w $0000
[000a7b56]                           dc.w $0000
[000a7b58]                           dc.w $4000
[000a7b5a]                           dc.w $0000
[000a7b5c]                           dc.w $0000
[000a7b5e]                           dc.w $4000
[000a7b60]                           dc.w $0007
[000a7b62]                           dc.w $ffff
[000a7b64]                           dc.w $c000
[000a7b66]                           dc.w $0015
[000a7b68]                           dc.w $0000
[000a7b6a]                           dc.w $0000
[000a7b6c]                           dc.w $000e
[000a7b6e]                           dc.w $0000
[000a7b70]                           dc.w $0000
[000a7b72]                           dc.w $0004
[000a7b74]                           dc.w $0000
[000a7b76]                           dc.w $0000
[000a7b78]                           dc.w $1cff
[000a7b7a]                           dc.w $e04f
[000a7b7c]                           dc.w $fe10
[000a7b7e]                           dc.w $10ff
[000a7b80]                           dc.w $e02f
[000a7b82]                           dc.w $fe20
[000a7b84]                           dc.w $1cff
[000a7b86]                           dc.w $ffff
[000a7b88]                           dc.w $fe38
[000a7b8a]                           dc.w $04ff
[000a7b8c]                           dc.w $e02f
[000a7b8e]                           dc.w $fe28
[000a7b90]                           dc.w $1cff
[000a7b92]                           dc.w $e04f
[000a7b94]                           dc.w $fe38
[000a7b96]                           dc.w $0000
[000a7b98]                           dc.w $0000
[000a7b9a]                           dc.w $0000
[000a7b9c]                           dc.w $0000
[000a7b9e]                           dc.w $0000
[000a7ba0]                           dc.w $0000
[000a7ba2]                           dc.w $0000
[000a7ba4]                           dc.w $0000
[000a7ba6]                           dc.w $0000
IM_SORT_XY:
[000a7ba8] 000a7ae8                  dc.l _IMG_IM_SORT_XY
[000a7bac]                           dc.w $0006
[000a7bae]                           dc.w $0020
[000a7bb0]                           dc.w $0000
[000a7bb2]                           dc.w $0000
[000a7bb4]                           dc.w $0001
_IMG_IM_SORT_YX:
[000a7bb6]                           dc.w $0000
[000a7bb8]                           dc.w $0000
[000a7bba]                           dc.w $0000
[000a7bbc]                           dc.w $0000
[000a7bbe]                           dc.w $0000
[000a7bc0]                           dc.w $0000
[000a7bc2]                           dc.w $08ff
[000a7bc4]                           dc.w $e04f
[000a7bc6]                           dc.w $fe20
[000a7bc8]                           dc.w $08ff
[000a7bca]                           dc.w $e02f
[000a7bcc]                           dc.w $fe28
[000a7bce]                           dc.w $08ff
[000a7bd0]                           dc.w $e1ff
[000a7bd2]                           dc.w $fe38
[000a7bd4]                           dc.w $08ff
[000a7bd6]                           dc.w $e12f
[000a7bd8]                           dc.w $fe08
[000a7bda]                           dc.w $08ff
[000a7bdc]                           dc.w $e14f
[000a7bde]                           dc.w $fe08
[000a7be0]                           dc.w $0004
[000a7be2]                           dc.w $0100
[000a7be4]                           dc.w $4000
[000a7be6]                           dc.w $0004
[000a7be8]                           dc.w $0100
[000a7bea]                           dc.w $4000
[000a7bec]                           dc.w $0004
[000a7bee]                           dc.w $0100
[000a7bf0]                           dc.w $4000
[000a7bf2]                           dc.w $0015
[000a7bf4]                           dc.w $0101
[000a7bf6]                           dc.w $5000
[000a7bf8]                           dc.w $000e
[000a7bfa]                           dc.w $0100
[000a7bfc]                           dc.w $e000
[000a7bfe]                           dc.w $0004
[000a7c00]                           dc.w $0100
[000a7c02]                           dc.w $4000
[000a7c04]                           dc.w $1cff
[000a7c06]                           dc.w $e10f
[000a7c08]                           dc.w $fe38
[000a7c0a]                           dc.w $04ff
[000a7c0c]                           dc.w $e10f
[000a7c0e]                           dc.w $fe20
[000a7c10]                           dc.w $1cff
[000a7c12]                           dc.w $e10f
[000a7c14]                           dc.w $fe38
[000a7c16]                           dc.w $10ff
[000a7c18]                           dc.w $e10f
[000a7c1a]                           dc.w $fe08
[000a7c1c]                           dc.w $1cff
[000a7c1e]                           dc.w $e10f
[000a7c20]                           dc.w $fe38
[000a7c22]                           dc.w $0004
[000a7c24]                           dc.w $0100
[000a7c26]                           dc.w $4000
[000a7c28]                           dc.w $0004
[000a7c2a]                           dc.w $0100
[000a7c2c]                           dc.w $4000
[000a7c2e]                           dc.w $0004
[000a7c30]                           dc.w $0100
[000a7c32]                           dc.w $4000
[000a7c34]                           dc.w $0015
[000a7c36]                           dc.w $0101
[000a7c38]                           dc.w $5000
[000a7c3a]                           dc.w $000e
[000a7c3c]                           dc.w $0100
[000a7c3e]                           dc.w $e000
[000a7c40]                           dc.w $0004
[000a7c42]                           dc.w $0100
[000a7c44]                           dc.w $4000
[000a7c46]                           dc.w $1cff
[000a7c48]                           dc.w $e10f
[000a7c4a]                           dc.w $fe10
[000a7c4c]                           dc.w $04ff
[000a7c4e]                           dc.w $e10f
[000a7c50]                           dc.w $fe20
[000a7c52]                           dc.w $0cff
[000a7c54]                           dc.w $ff0f
[000a7c56]                           dc.w $fe38
[000a7c58]                           dc.w $04ff
[000a7c5a]                           dc.w $e00f
[000a7c5c]                           dc.w $fe28
[000a7c5e]                           dc.w $1cff
[000a7c60]                           dc.w $e00f
[000a7c62]                           dc.w $fe38
[000a7c64]                           dc.w $0000
[000a7c66]                           dc.w $0000
[000a7c68]                           dc.w $0000
[000a7c6a]                           dc.w $0000
[000a7c6c]                           dc.w $0000
[000a7c6e]                           dc.w $0000
[000a7c70]                           dc.w $0000
[000a7c72]                           dc.w $0000
[000a7c74]                           dc.w $0000
IM_SORT_YX:
[000a7c76] 000a7bb6                  dc.l _IMG_IM_SORT_YX
[000a7c7a]                           dc.w $0006
[000a7c7c]                           dc.w $0020
[000a7c7e]                           dc.w $0000
[000a7c80]                           dc.w $0000
[000a7c82]                           dc.w $0001
_IMG_SUNRISE:
[000a7c84]                           dc.w $0000
[000a7c86]                           dc.w $0000
[000a7c88]                           dc.w $0000
[000a7c8a]                           dc.w $0000
[000a7c8c]                           dc.w $2110
[000a7c8e]                           dc.w $0000
[000a7c90]                           dc.w $0000
[000a7c92]                           dc.w $2110
[000a7c94]                           dc.w $3700
[000a7c96]                           dc.w $0001
[000a7c98]                           dc.w $1020
[000a7c9a]                           dc.w $4880
[000a7c9c]                           dc.w $6c00
[000a7c9e]                           dc.w $8782
[000a7ca0]                           dc.w $3700
[000a7ca2]                           dc.w $1000
[000a7ca4]                           dc.w $1864
[000a7ca6]                           dc.w $0000
[000a7ca8]                           dc.w $000c
[000a7caa]                           dc.w $2010
[000a7cac]                           dc.w $c000
[000a7cae]                           dc.w $0002
[000a7cb0]                           dc.w $4009
[000a7cb2]                           dc.w $0000
[000a7cb4]                           dc.w $0000
[000a7cb6]                           dc.w $4008
[000a7cb8]                           dc.w $0000
[000a7cba]                           dc.w $0000
[000a7cbc]                           dc.w $8004
[000a7cbe]                           dc.w $0000
[000a7cc0]                           dc.w $000e
[000a7cc2]                           dc.w $8005
[000a7cc4]                           dc.w $c000
[000a7cc6]                           dc.w $0000
[000a7cc8]                           dc.w $8004
[000a7cca]                           dc.w $0000
[000a7ccc]                           dc.w $0000
[000a7cce]                           dc.w $8004
[000a7cd0]                           dc.w $0000
[000a7cd2]                           dc.w $3f1c
[000a7cd4]                           dc.w $7878
[000a7cd6]                           dc.w $70f0
[000a7cd8]                           dc.w $00e3
[000a7cda]                           dc.w $8787
[000a7cdc]                           dc.w $8f0c
[000a7cde]                           dc.w $fe18
[000a7ce0]                           dc.w $0000
[000a7ce2]                           dc.w $0000
[000a7ce4]                           dc.w $01e7
[000a7ce6]                           dc.b '8p<`',0
[000a7ceb]                           dc.b $00
[000a7cec]                           dc.w $0787
[000a7cee]                           dc.w $c39f
[000a7cf0]                           dc.w $fe1c
[000a7cf2]                           dc.w $0000
[000a7cf4]                           dc.w $0000
[000a7cf6]                           dc.w $01e3
[000a7cf8]                           dc.w $9ce0
[000a7cfa]                           dc.w $e1e0
[000a7cfc]                           dc.w $0000
[000a7cfe]                           dc.w $030f
[000a7d00]                           dc.w $1e1f
[000a7d02]                           dc.w $0f07
[000a7d04]                           dc.w $e000
[000a7d06]                           dc.w $70c0
[000a7d08]                           dc.w $30f8
[000a7d0a]                           dc.w $0ccf
[000a7d0c]                           dc.w $8f3c
[000a7d0e]                           dc.w $0000
[000a7d10]                           dc.w $0300
[000a7d12]                           dc.w $0000
SUNRISE:
[000a7d14] 000a7c84                  dc.l _IMG_SUNRISE
[000a7d18]                           dc.w $0006
[000a7d1a]                           dc.w $0018
[000a7d1c]                           dc.w $0000
[000a7d1e]                           dc.w $0000
[000a7d20]                           dc.w $0001
INFO_OB_WH:
[000a7d22]                           dc.w $ffff
[000a7d24]                           dc.w $0001
[000a7d26]                           dc.w $0002
[000a7d28]                           dc.w $0014
[000a7d2a]                           dc.w $0000
[000a7d2c]                           dc.w $0000
[000a7d2e]                           dc.w $0001
[000a7d30]                           dc.w $1101
[000a7d32]                           dc.w $0000
[000a7d34]                           dc.w $0000
[000a7d36]                           dc.w $000b
[000a7d38]                           dc.w $0002
_01_INFO_OB_WH:
[000a7d3a]                           dc.w $0002
[000a7d3c]                           dc.w $ffff
[000a7d3e]                           dc.w $ffff
[000a7d40]                           dc.w $0015
[000a7d42]                           dc.w $0000
[000a7d44]                           dc.w $0000
[000a7d46] 000a79f0                  dc.l TEDINFO_02
[000a7d4a]                           dc.w $0000
[000a7d4c]                           dc.w $0000
[000a7d4e]                           dc.w $000b
[000a7d50]                           dc.w $0001
_02_INFO_OB_WH:
[000a7d52]                           dc.w $0000
[000a7d54]                           dc.w $ffff
[000a7d56]                           dc.w $ffff
[000a7d58]                           dc.w $0015
[000a7d5a]                           dc.w $0020
[000a7d5c]                           dc.w $0000
[000a7d5e] 000a79f0                  dc.l TEDINFO_02
[000a7d62]                           dc.w $0000
[000a7d64]                           dc.w $0001
[000a7d66]                           dc.w $000b
[000a7d68]                           dc.w $0001
NEW2_LABEL:
[000a7d6a]                           dc.w $ffff
[000a7d6c]                           dc.w $0001
[000a7d6e]                           dc.w $0005
[000a7d70]                           dc.w $0018
[000a7d72]                           dc.w $0000
[000a7d74]                           dc.w $0010
[000a7d76] 000a7a68                  dc.l A_3DBUTTON03
[000a7d7a]                           dc.w $0000
[000a7d7c]                           dc.w $0000
[000a7d7e]                           dc.w $0024
[000a7d80]                           dc.w $0006
_01_NEW2_LABEL:
[000a7d82]                           dc.w $0003
[000a7d84]                           dc.w $0002
[000a7d86]                           dc.w $0002
[000a7d88]                           dc.w $0018
[000a7d8a]                           dc.w $0040
[000a7d8c]                           dc.w $0000
[000a7d8e] 000a7ac8                  dc.l A_INNERFRAME02
[000a7d92]                           dc.w $0001
[000a7d94]                           dc.w $0000
[000a7d96]                           dc.w $0022
[000a7d98]                           dc.w $0003
_02_NEW2_LABEL:
[000a7d9a]                           dc.w $0001
[000a7d9c]                           dc.w $ffff
[000a7d9e]                           dc.w $ffff
[000a7da0]                           dc.w $0018
[000a7da2]                           dc.w $0008
[000a7da4]                           dc.w $0010
[000a7da6] 000a7aa8                  dc.l A_BOXED02
[000a7daa]                           dc.w $0001
[000a7dac]                           dc.w $0001
[000a7dae]                           dc.w $0020
[000a7db0]                           dc.w $0001
_03_NEW2_LABEL:
[000a7db2]                           dc.w $0005
[000a7db4]                           dc.w $ffff
[000a7db6]                           dc.w $ffff
[000a7db8]                           dc.w $0018
[000a7dba]                           dc.w $4007
[000a7dbc]                           dc.w $0010
[000a7dbe] 000a7a48                  dc.l A_3DBUTTON02
[000a7dc2]                           dc.w $0004
[000a7dc4]                           dc.w $0003
[000a7dc6]                           dc.w $000c
[000a7dc8]                           dc.w $0002
_03aNEW2_LABEL:
[000a7dca]                           dc.w $0000
[000a7dcc]                           dc.w $0000
[000a7dce]                           dc.w $0000
[000a7dd0]                           dc.w $0000
[000a7dd2]                           dc.w $8000
[000a7dd4]                           dc.w $884f
[000a7dd6]                           dc.w $0000
[000a7dd8]                           dc.w $0000
[000a7dda]                           dc.w $0000
[000a7ddc]                           dc.w $0000
[000a7dde]                           dc.w $0000
[000a7de0]                           dc.w $0000
_05_NEW2_LABEL:
[000a7de2]                           dc.w $0000
[000a7de4]                           dc.w $ffff
[000a7de6]                           dc.w $ffff
[000a7de8]                           dc.w $0018
[000a7dea]                           dc.w $4005
[000a7dec]                           dc.w $0010
[000a7dee] 000a7a88                  dc.l A_3DBUTTON05
[000a7df2]                           dc.w $0013
[000a7df4]                           dc.w $0003
[000a7df6]                           dc.w $000c
[000a7df8]                           dc.w $0002
_05aNEW2_LABEL:
[000a7dfa]                           dc.w $0000
[000a7dfc]                           dc.w $0000
[000a7dfe]                           dc.w $0000
[000a7e00]                           dc.w $0000
[000a7e02]                           dc.w $8020
[000a7e04]                           dc.w $8841
[000a7e06]                           dc.w $0000
[000a7e08]                           dc.w $0000
[000a7e0a]                           dc.w $0000
[000a7e0c]                           dc.w $0000
[000a7e0e]                           dc.w $0000
[000a7e10]                           dc.w $0000
NEW_LABEL:
[000a7e12]                           dc.w $ffff
[000a7e14]                           dc.w $0001
[000a7e16]                           dc.w $0003
[000a7e18]                           dc.w $0018
[000a7e1a]                           dc.w $0000
[000a7e1c]                           dc.w $0010
[000a7e1e] 000a7a68                  dc.l A_3DBUTTON03
[000a7e22]                           dc.w $0000
[000a7e24]                           dc.w $0000
[000a7e26]                           dc.w $0024
[000a7e28]                           dc.w $0006
_01_NEW_LABEL:
[000a7e2a]                           dc.w $0003
[000a7e2c]                           dc.w $0002
[000a7e2e]                           dc.w $0002
[000a7e30]                           dc.w $0018
[000a7e32]                           dc.w $0040
[000a7e34]                           dc.w $0000
[000a7e36] 000a7ac8                  dc.l A_INNERFRAME02
[000a7e3a]                           dc.w $0001
[000a7e3c]                           dc.w $0000
[000a7e3e]                           dc.w $0022
[000a7e40]                           dc.w $0003
_02_NEW_LABEL:
[000a7e42]                           dc.w $0001
[000a7e44]                           dc.w $ffff
[000a7e46]                           dc.w $ffff
[000a7e48]                           dc.w $0018
[000a7e4a]                           dc.w $0008
[000a7e4c]                           dc.w $0010
[000a7e4e] 000a7aa8                  dc.l A_BOXED02
[000a7e52]                           dc.w $0001
[000a7e54]                           dc.w $0001
[000a7e56]                           dc.w $001f
[000a7e58]                           dc.w $0001
_03_NEW_LABEL:
[000a7e5a]                           dc.w $0000
[000a7e5c]                           dc.w $ffff
[000a7e5e]                           dc.w $ffff
[000a7e60]                           dc.w $0018
[000a7e62]                           dc.w $4007
[000a7e64]                           dc.w $0010
[000a7e66] 000a7a48                  dc.l A_3DBUTTON02
[000a7e6a]                           dc.w $000c
[000a7e6c]                           dc.w $0003
[000a7e6e]                           dc.w $000c
[000a7e70]                           dc.w $0002
_03aNEW_LABEL:
[000a7e72] 00016172                  dc.l chk_new_label
[000a7e76]                           dc.w $0000
[000a7e78]                           dc.w $0000
[000a7e7a]                           dc.w $8020
[000a7e7c]                           dc.w $884f
[000a7e7e]                           dc.w $0000
[000a7e80]                           dc.w $0000
[000a7e82]                           dc.w $0000
[000a7e84]                           dc.w $0000
[000a7e86]                           dc.w $0000
[000a7e88]                           dc.w $0000
OUTPUT_INFO:
[000a7e8a]                           dc.w $ffff
[000a7e8c]                           dc.w $0001
[000a7e8e]                           dc.w $0001
[000a7e90]                           dc.w $0014
[000a7e92]                           dc.w $0000
[000a7e94]                           dc.w $0000
[000a7e96]                           dc.w $00ff
[000a7e98]                           dc.w $1178
[000a7e9a]                           dc.w $0000
[000a7e9c]                           dc.w $0000
[000a7e9e]                           dc.w $002c
[000a7ea0]                           dc.w $000b
_01_OUTPUT_INFO:
[000a7ea2]                           dc.w $0000
[000a7ea4]                           dc.w $0002
[000a7ea6]                           dc.w $0004
[000a7ea8]                           dc.w $0018
[000a7eaa]                           dc.w $0000
[000a7eac]                           dc.w $0010
[000a7eae] 000a7a68                  dc.l A_3DBUTTON03
[000a7eb2]                           dc.w $0000
[000a7eb4]                           dc.w $0000
[000a7eb6]                           dc.w $002c
[000a7eb8]                           dc.w $000b
_02_OUTPUT_INFO:
[000a7eba]                           dc.w $0004
[000a7ebc]                           dc.w $0003
[000a7ebe]                           dc.w $0003
[000a7ec0]                           dc.w $0018
[000a7ec2]                           dc.w $0000
[000a7ec4]                           dc.w $0010
[000a7ec6] 000a7a28                  dc.l A_3DBUTTON01
[000a7eca]                           dc.w $0002
[000a7ecc]                           dc.w $0001
[000a7ece]                           dc.w $0028
[000a7ed0]                           dc.w $0001
_03_OUTPUT_INFO:
[000a7ed2]                           dc.w $0002
[000a7ed4]                           dc.w $ffff
[000a7ed6]                           dc.w $ffff
[000a7ed8]                           dc.w $0016
[000a7eda]                           dc.w $0000
[000a7edc]                           dc.w $0500
[000a7ede] 000a79d4                  dc.l TEDINFO_01
[000a7ee2]                           dc.w $0000
[000a7ee4]                           dc.w $0000
[000a7ee6]                           dc.w $0028
[000a7ee8]                           dc.w $0001
_04_OUTPUT_INFO:
[000a7eea]                           dc.w $0001
[000a7eec]                           dc.w $0005
[000a7eee]                           dc.w $000c
[000a7ef0]                           dc.w $0018
[000a7ef2]                           dc.w $0000
[000a7ef4]                           dc.w $0010
[000a7ef6] 000a7a28                  dc.l A_3DBUTTON01
[000a7efa]                           dc.w $0002
[000a7efc]                           dc.w $0003
[000a7efe]                           dc.w $0028
[000a7f00]                           dc.w $0007
_05_OUTPUT_INFO:
[000a7f02]                           dc.w $0006
[000a7f04]                           dc.w $ffff
[000a7f06]                           dc.w $ffff
[000a7f08]                           dc.w $001c
[000a7f0a]                           dc.w $0000
[000a7f0c]                           dc.w $0000
[000a7f0e] 000a78ac                  dc.l TEXT_02
[000a7f12]                           dc.w $0000
[000a7f14]                           dc.w $0000
[000a7f16]                           dc.w $0008
[000a7f18]                           dc.w $0001
_06_OUTPUT_INFO:
[000a7f1a]                           dc.w $0007
[000a7f1c]                           dc.w $ffff
[000a7f1e]                           dc.w $ffff
[000a7f20]                           dc.w $0016
[000a7f22]                           dc.w $0000
[000a7f24]                           dc.w $0000
[000a7f26] 000a7a0c                  dc.l TEDINFO_064
[000a7f2a]                           dc.w $0009
[000a7f2c]                           dc.w $0000
[000a7f2e]                           dc.w $001f
[000a7f30]                           dc.w $0001
_07_OUTPUT_INFO:
[000a7f32]                           dc.w $0008
[000a7f34]                           dc.w $ffff
[000a7f36]                           dc.w $ffff
[000a7f38]                           dc.w $001c
[000a7f3a]                           dc.w $0000
[000a7f3c]                           dc.w $0000
[000a7f3e] 000a78b5                  dc.l TEXT_03
[000a7f42]                           dc.w $0000
[000a7f44]                           dc.w $0002
[000a7f46]                           dc.w $0006
[000a7f48]                           dc.w $0001
_08_OUTPUT_INFO:
[000a7f4a]                           dc.w $0009
[000a7f4c]                           dc.w $ffff
[000a7f4e]                           dc.w $ffff
[000a7f50]                           dc.w $0016
[000a7f52]                           dc.w $0000
[000a7f54]                           dc.w $0000
[000a7f56] 000a7a0c                  dc.l TEDINFO_064
[000a7f5a]                           dc.w $0009
[000a7f5c]                           dc.w $0002
[000a7f5e]                           dc.w $001f
[000a7f60]                           dc.w $0001
_09_OUTPUT_INFO:
[000a7f62]                           dc.w $000a
[000a7f64]                           dc.w $ffff
[000a7f66]                           dc.w $ffff
[000a7f68]                           dc.w $001c
[000a7f6a]                           dc.w $0000
[000a7f6c]                           dc.w $0000
[000a7f6e] 000a78bc                  dc.l TEXT_04
[000a7f72]                           dc.w $0000
[000a7f74]                           dc.w $0004
[000a7f76]                           dc.w $0006
[000a7f78]                           dc.w $0001
_10_OUTPUT_INFO:
[000a7f7a]                           dc.w $000b
[000a7f7c]                           dc.w $ffff
[000a7f7e]                           dc.w $ffff
[000a7f80]                           dc.w $0016
[000a7f82]                           dc.w $0000
[000a7f84]                           dc.w $0000
[000a7f86] 000a7a0c                  dc.l TEDINFO_064
[000a7f8a]                           dc.w $0009
[000a7f8c]                           dc.w $0004
[000a7f8e]                           dc.w $001f
[000a7f90]                           dc.w $0001
_11_OUTPUT_INFO:
[000a7f92]                           dc.w $000c
[000a7f94]                           dc.w $ffff
[000a7f96]                           dc.w $ffff
[000a7f98]                           dc.w $001c
[000a7f9a]                           dc.w $0000
[000a7f9c]                           dc.w $0000
[000a7f9e] 000a78c3                  dc.l TEXT_05
[000a7fa2]                           dc.w $0000
[000a7fa4]                           dc.w $0006
[000a7fa6]                           dc.w $0007
[000a7fa8]                           dc.w $0001
_12_OUTPUT_INFO:
[000a7faa]                           dc.w $0004
[000a7fac]                           dc.w $ffff
[000a7fae]                           dc.w $ffff
[000a7fb0]                           dc.w $0016
[000a7fb2]                           dc.w $0020
[000a7fb4]                           dc.w $0000
[000a7fb6] 000a7a0c                  dc.l TEDINFO_064
[000a7fba]                           dc.w $0009
[000a7fbc]                           dc.w $0006
[000a7fbe]                           dc.w $001f
[000a7fc0]                           dc.w $0001
WI_NEW2_LABEL:
[000a7fc2]                           dc.w $0000
[000a7fc4]                           dc.w $0000
[000a7fc6] 00059dd0                  dc.l Awi_service
[000a7fca] 00056c16                  dc.l Awi_selfcreate
[000a7fce] 00057428                  dc.l Awi_open
[000a7fd2] 00055e94                  dc.l Awi_init
[000a7fd6] 000a7d6a                  dc.l NEW2_LABEL
[000a7fda]                           dc.w $0000
[000a7fdc]                           dc.w $0000
[000a7fde]                           dc.w $0000
[000a7fe0]                           dc.w $0000
[000a7fe2]                           dc.w $ffff
[000a7fe4]                           dc.w $000b
[000a7fe6]                           dc.w $0000
[000a7fe8]                           dc.w $0000
[000a7fea]                           dc.w $0078
[000a7fec]                           dc.w $0032
[000a7fee]                           dc.w $0000
[000a7ff0]                           dc.w $0000
[000a7ff2]                           dc.w $0000
[000a7ff4]                           dc.w $0000
[000a7ff6]                           dc.w $0000
[000a7ff8]                           dc.w $0000
[000a7ffa]                           dc.w $0000
[000a7ffc]                           dc.w $0000
[000a7ffe]                           dc.w $ffff
[000a8000]                           dc.w $ffff
[000a8002]                           dc.w $ffff
[000a8004]                           dc.w $ffff
[000a8006]                           dc.w $0000
[000a8008]                           dc.w $0000
[000a800a]                           dc.w $f8f8
[000a800c] 000a78d7                  dc.l TEXT_10
[000a8010] 000a7876                  dc.l TEXT_002
[000a8014]                           dc.w $2710
[000a8016]                           dc.w $0000
[000a8018]                           dc.w $0000
[000a801a]                           dc.w $ffff
[000a801c]                           dc.w $0000
[000a801e]                           dc.w $0000
[000a8020]                           dc.w $0000
[000a8022]                           dc.w $0000
[000a8024] 0006b744                  dc.l Awi_keys
[000a8028] 00051852                  dc.l Awi_obchange
[000a802c] 00051c46                  dc.l Awi_redraw
[000a8030] 000587a4                  dc.l Awi_topped
[000a8034] 00058362                  dc.l Awi_closed
[000a8038] 000587ec                  dc.l Awi_fulled
[000a803c] 0005217c                  dc.l Awi_arrowed
[000a8040] 000524b4                  dc.l Awi_hslid
[000a8044] 0005255e                  dc.l Awi_vslid
[000a8048] 00058bb0                  dc.l Awi_sized
[000a804c] 00058d50                  dc.l Awi_moved
[000a8050] 0005998a                  dc.l Awi_iconify
[000a8054] 00059c6c                  dc.l Awi_uniconify
[000a8058] 0005b5b6                  dc.l Awi_gemscript
[000a805c]                           dc.w $0000
[000a805e]                           dc.w $0000
[000a8060]                           dc.w $0000
[000a8062]                           dc.w $0000
WI_NEW_LABEL:
[000a8064]                           dc.w $0000
[000a8066]                           dc.w $0000
[000a8068] 00059dd0                  dc.l Awi_service
[000a806c] 00056c16                  dc.l Awi_selfcreate
[000a8070] 00057428                  dc.l Awi_open
[000a8074] 00055e94                  dc.l Awi_init
[000a8078] 000a7e12                  dc.l NEW_LABEL
[000a807c]                           dc.w $0000
[000a807e]                           dc.w $0000
[000a8080]                           dc.w $0000
[000a8082]                           dc.w $0000
[000a8084]                           dc.w $ffff
[000a8086]                           dc.w $000b
[000a8088]                           dc.w $0000
[000a808a]                           dc.w $0000
[000a808c]                           dc.w $0078
[000a808e]                           dc.w $0032
[000a8090]                           dc.w $0000
[000a8092]                           dc.w $0000
[000a8094]                           dc.w $0000
[000a8096]                           dc.w $0000
[000a8098]                           dc.w $0000
[000a809a]                           dc.w $0000
[000a809c]                           dc.w $0000
[000a809e]                           dc.w $0000
[000a80a0]                           dc.w $ffff
[000a80a2]                           dc.w $ffff
[000a80a4]                           dc.w $ffff
[000a80a6]                           dc.w $ffff
[000a80a8]                           dc.w $0000
[000a80aa]                           dc.w $0000
[000a80ac]                           dc.w $f8f8
[000a80ae] 000a78d7                  dc.l TEXT_10
[000a80b2] 000a7876                  dc.l TEXT_002
[000a80b6]                           dc.w $2710
[000a80b8]                           dc.w $0000
[000a80ba]                           dc.w $0000
[000a80bc]                           dc.w $ffff
[000a80be]                           dc.w $0000
[000a80c0]                           dc.w $0000
[000a80c2]                           dc.w $0000
[000a80c4]                           dc.w $0000
[000a80c6] 0006b744                  dc.l Awi_keys
[000a80ca] 00051852                  dc.l Awi_obchange
[000a80ce] 00051c46                  dc.l Awi_redraw
[000a80d2] 000587a4                  dc.l Awi_topped
[000a80d6] 00058362                  dc.l Awi_closed
[000a80da] 000587ec                  dc.l Awi_fulled
[000a80de] 0005217c                  dc.l Awi_arrowed
[000a80e2] 000524b4                  dc.l Awi_hslid
[000a80e6] 0005255e                  dc.l Awi_vslid
[000a80ea] 00058bb0                  dc.l Awi_sized
[000a80ee] 00058d50                  dc.l Awi_moved
[000a80f2] 0005998a                  dc.l Awi_iconify
[000a80f6] 00059c6c                  dc.l Awi_uniconify
[000a80fa] 0005b5b6                  dc.l Awi_gemscript
[000a80fe]                           dc.w $0000
[000a8100]                           dc.w $0000
[000a8102]                           dc.w $0000
[000a8104]                           dc.w $0000

MO_ADD:
[000a8106]                           dc.w $0008
[000a8108]                           dc.w $0008
[000a810a]                           dc.w $0001
[000a810c]                           dc.w $0000
[000a810e]                           dc.w $0001
[000a8110]                           dc.w $0300
[000a8112]                           dc.w $1fb0
[000a8114]                           dc.w $3ff8
[000a8116]                           dc.w $3ffc
[000a8118]                           dc.w $7ffe
[000a811a]                           dc.w $fffe
[000a811c]                           dc.w $fffe
[000a811e]                           dc.w $7fff
[000a8120]                           dc.w $7fff
[000a8122]                           dc.w $ffff
[000a8124]                           dc.w $ffff
[000a8126]                           dc.w $7fff
[000a8128]                           dc.w $3fff
[000a812a]                           dc.w $0fff
[000a812c]                           dc.w $01ff
[000a812e]                           dc.w $007f
[000a8130]                           dc.w $0300
[000a8132]                           dc.w $1cb0
[000a8134]                           dc.b '$H"$q'
[000a8139]                           dc.b $12
[000a813a]                           dc.w $9802
[000a813c]                           dc.w $84c2
[000a813e]                           dc.w $40c1
[000a8140]                           dc.w $73f1
[000a8142]                           dc.w $9bf0
[000a8144]                           dc.w $84cc
[000a8146]                           dc.w $40cc
[000a8148]                           dc.w $303f
[000a814a]                           dc.w $0e3f
[000a814c]                           dc.w $018c
[000a814e]                           dc.w $006c
MO_BLACK:
[000a8150]                           dc.w $0000
[000a8152]                           dc.w $0000
[000a8154]                           dc.w $0001
[000a8156]                           dc.w $0000
[000a8158]                           dc.w $0001
[000a815a]                           dc.w $c0ff
[000a815c]                           dc.w $e0ff
[000a815e]                           dc.w $f0ff
[000a8160]                           dc.w $f8ff
[000a8162]                           dc.w $fcff
[000a8164]                           dc.w $feff
[000a8166]                           dc.w $ffff
[000a8168]                           dc.w $ffff
[000a816a]                           dc.w $ffc0
[000a816c]                           dc.w $ffe0
[000a816e]                           dc.w $fe00
[000a8170]                           dc.w $ef00
[000a8172]                           dc.w $cf00
[000a8174]                           dc.w $8780
[000a8176]                           dc.w $0780
[000a8178]                           dc.w $0380
[000a817a]                           dc.w $0000
[000a817c]                           dc.b '@~`~p~x~|~~~'
[000a8188]                           dc.w $7f00
[000a818a]                           dc.w $7f80
[000a818c]                           dc.w $7c00
[000a818e]                           dc.w $6c00
[000a8190]                           dc.w $4600
[000a8192]                           dc.w $0600
[000a8194]                           dc.w $0300
[000a8196]                           dc.w $0300
[000a8198]                           dc.w $0000
MO_DRAG:
[000a819a]                           dc.w $0008
[000a819c]                           dc.w $0008
[000a819e]                           dc.w $0001
[000a81a0]                           dc.w $0000
[000a81a2]                           dc.w $0001
[000a81a4]                           dc.w $0300
[000a81a6]                           dc.w $1fb0
[000a81a8]                           dc.w $3ff8
[000a81aa]                           dc.w $3ffc
[000a81ac]                           dc.w $7ffe
[000a81ae]                           dc.w $fffe
[000a81b0]                           dc.w $fffe
[000a81b2]                           dc.w $7fff
[000a81b4]                           dc.w $7fff
[000a81b6]                           dc.w $ffff
[000a81b8]                           dc.w $ffff
[000a81ba]                           dc.w $7fff
[000a81bc]                           dc.w $3fff
[000a81be]                           dc.w $0fff
[000a81c0]                           dc.w $01ff
[000a81c2]                           dc.w $007f
[000a81c4]                           dc.w $0300
[000a81c6]                           dc.w $1cb0
[000a81c8]                           dc.b '$H"$q'
[000a81cd]                           dc.b $12
[000a81ce]                           dc.w $9802
[000a81d0]                           dc.w $84c2
[000a81d2]                           dc.w $40c1
[000a81d4]                           dc.w $73f1
[000a81d6]                           dc.w $9bf0
[000a81d8]                           dc.w $84c0
[000a81da]                           dc.w $40c0
[000a81dc]                           dc.w $3000
[000a81de]                           dc.w $0e00
[000a81e0]                           dc.w $0180
[000a81e2]                           dc.w $0060
MO_TRANS:
[000a81e4]                           dc.w $0000
[000a81e6]                           dc.w $0000
[000a81e8]                           dc.w $0001
[000a81ea]                           dc.w $0000
[000a81ec]                           dc.w $0001
[000a81ee]                           dc.w $c0ff
[000a81f0]                           dc.w $e0ff
[000a81f2]                           dc.w $f0ff
[000a81f4]                           dc.w $f8ff
[000a81f6]                           dc.w $fcff
[000a81f8]                           dc.w $feff
[000a81fa]                           dc.w $ffff
[000a81fc]                           dc.w $ffff
[000a81fe]                           dc.w $ffc0
[000a8200]                           dc.w $ffe0
[000a8202]                           dc.w $fe00
[000a8204]                           dc.w $ef00
[000a8206]                           dc.w $cf00
[000a8208]                           dc.w $8780
[000a820a]                           dc.w $0780
[000a820c]                           dc.w $0380
[000a820e]                           dc.w $00ff
[000a8210]                           dc.w $40ab
[000a8212]                           dc.w $60d5
[000a8214]                           dc.w $70ab
[000a8216]                           dc.w $78d5
[000a8218]                           dc.w $7cab
[000a821a]                           dc.w $7ed5
[000a821c]                           dc.w $7fff
[000a821e]                           dc.w $7f80
[000a8220]                           dc.w $7c00
[000a8222]                           dc.w $6c00
[000a8224]                           dc.w $4600
[000a8226]                           dc.w $0600
[000a8228]                           dc.w $0300
[000a822a]                           dc.w $0300
[000a822c]                           dc.w $0000
MO_WHITE:
[000a822e]                           dc.w $0000
[000a8230]                           dc.w $0000
[000a8232]                           dc.w $0001
[000a8234]                           dc.w $0000
[000a8236]                           dc.w $0001
[000a8238]                           dc.w $c0ff
[000a823a]                           dc.w $e0ff
[000a823c]                           dc.w $f0ff
[000a823e]                           dc.w $f8ff
[000a8240]                           dc.w $fcff
[000a8242]                           dc.w $feff
[000a8244]                           dc.w $ffff
[000a8246]                           dc.w $ffff
[000a8248]                           dc.w $ffc0
[000a824a]                           dc.w $ffe0
[000a824c]                           dc.w $fe00
[000a824e]                           dc.w $ef00
[000a8250]                           dc.w $cf00
[000a8252]                           dc.w $8780
[000a8254]                           dc.w $0780
[000a8256]                           dc.w $0380
[000a8258]                           dc.w $00ff
[000a825a]                           dc.b '@Å`ÅpÅxÅ|Å~Å'
[000a8266]                           dc.w $7fff
[000a8268]                           dc.w $7f80
[000a826a]                           dc.w $7c00
[000a826c]                           dc.w $6c00
[000a826e]                           dc.w $4600
[000a8270]                           dc.w $0600
[000a8272]                           dc.w $0300
[000a8274]                           dc.w $0300
[000a8276]                           dc.w $0000
ACSdescr:
[000a8278]                           dc.b 'ACS3.00',0
[000a8280]                           dc.w $012c
[000a8282]                           dc.w $ffb0
[000a8284]                           dc.w $ffb0
[000a8286]                           dc.w $0677
[000a8288]                           dc.b '  ACSpro 3.0.0'
[000a8296]                           dc.w $e100
[000a8298]                           dc.w $0000
[000a829a]                           dc.w $0000
[000a829c]                           dc.w $0000
[000a829e]                           dc.w $0000
[000a82a0]                           dc.w $0000
[000a82a2]                           dc.w $0000
[000a82a4]                           dc.w $0000
[000a82a6]                           dc.w $0000
[000a82a8] 000d01fa                  dc.l PUR_DESK
[000a82ac]                           dc.w $0000
[000a82ae]                           dc.w $0000
[000a82b0]                           dc.w $0000
[000a82b2]                           dc.w $0000
[000a82b4]                           dc.w $0000
[000a82b6]                           dc.w $0002
[000a82b8]                           dc.w $0000
[000a82ba]                           dc.w $0000
[000a82bc]                           dc.w $0003
[000a82be]                           dc.w $0000
[000a82c0]                           dc.w $0000
[000a82c2]                           dc.w $0004
[000a82c4]                           dc.w $0000
[000a82c6]                           dc.w $0000
[000a82c8]                           dc.w $0001
[000a82ca]                           dc.w $0000
[000a82cc]                           dc.w $0000
[000a82ce]                           dc.w $0005
[000a82d0]                           dc.w $0000
[000a82d2]                           dc.w $0000
[000a82d4]                           dc.w $0006
[000a82d6]                           dc.w $0000
[000a82d8]                           dc.w $0000
[000a82da]                           dc.w $0007
[000a82dc]                           dc.w $0000
[000a82de]                           dc.w $0000
[000a82e0]                           dc.w $00ff
[000a82e2] 000a8150                  dc.l MO_BLACK
[000a82e6]                           dc.w $00ff
[000a82e8] 000a822e                  dc.l MO_WHITE
[000a82ec]                           dc.w $00ff
[000a82ee] 000a81e4                  dc.l MO_TRANS
[000a82f2]                           dc.w $00ff
[000a82f4] 000a819a                  dc.l MO_DRAG
[000a82f8]                           dc.w $00ff
[000a82fa] 000a8106                  dc.l MO_ADD
[000a82fe]                           dc.w $0000
[000a8300]                           dc.w $0000
[000a8302]                           dc.w $0000
[000a8304]                           dc.w $0000
[000a8306]                           dc.w $0000
[000a8308]                           dc.w $0000
[000a830a]                           dc.w $0000
[000a830c]                           dc.w $0000
[000a830e]                           dc.w $0000
[000a8310]                           dc.w $0000
[000a8312]                           dc.w $0000
[000a8314]                           dc.w $0000
[000a8316]                           dc.w $0000
[000a8318]                           dc.w $0000
[000a831a]                           dc.w $0000
[000a831c]                           dc.w $0000
[000a831e]                           dc.w $0000
[000a8320]                           dc.w $0000
[000a8322]                           dc.w $0000
[000a8324]                           dc.w $0000
[000a8326]                           dc.w $0000
[000a8328]                           dc.w $0000
[000a832a]                           dc.w $0000
[000a832c]                           dc.w $0000
[000a832e]                           dc.w $0000
[000a8330]                           dc.w $0000
[000a8332]                           dc.w $0000
[000a8334]                           dc.w $0000
[000a8336]                           dc.w $0000
[000a8338]                           dc.w $0000
[000a833a]                           dc.w $0000
[000a833c]                           dc.w $0000
[000a833e]                           dc.w $0000
[000a8340]                           dc.w $0000
[000a8342]                           dc.w $0000
[000a8344]                           dc.w $0000
[000a8346]                           dc.w $0000
[000a8348]                           dc.w $0000
[000a834a]                           dc.w $0000
[000a834c]                           dc.w $0000
[000a834e]                           dc.w $0000
[000a8350]                           dc.w $0000
[000a8352]                           dc.w $0000
[000a8354]                           dc.w $0000
[000a8356]                           dc.w $0000
[000a8358]                           dc.w $0000
[000a835a]                           dc.w $0000
[000a835c]                           dc.w $0000
[000a835e]                           dc.w $0000
[000a8360]                           dc.w $0000
[000a8362]                           dc.w $0000
[000a8364]                           dc.w $0000
[000a8366]                           dc.w $0000
[000a8368]                           dc.w $0000
[000a836a]                           dc.w $0000
[000a836c]                           dc.w $0000
[000a836e]                           dc.w $0000
[000a8370] 000a8446                  dc.l $000a8446
[000a8374] 000a8485                  dc.l $000a8485
[000a8378] 000a84b7                  dc.l $000a84b7
[000a837c] 000a852c                  dc.l $000a852c
[000a8380] 000a8564                  dc.l $000a8564
[000a8384] 000a85a0                  dc.l $000a85a0
[000a8388] 000a85db                  dc.l $000a85db
[000a838c] 000a862f                  dc.l $000a862f
[000a8390] 000a8688                  dc.l $000a8688
[000a8394] 000a86f5                  dc.l $000a86f5
[000a8398] 000a875c                  dc.l $000a875c
[000a839c] 000a87a3                  dc.l $000a87a3
[000a83a0] 000a87f0                  dc.l $000a87f0
[000a83a4] 000a882a                  dc.l $000a882a
[000a83a8] 000a886a                  dc.l $000a886a
[000a83ac] 000a88be                  dc.l $000a88be
[000a83b0] 000a890a                  dc.l $000a890a
[000a83b4] 000a8961                  dc.l $000a8961
[000a83b8] 000a89bf                  dc.l $000a89bf
[000a83bc] 000a8a03                  dc.l $000a8a03
[000a83c0] 000a8a41                  dc.l $000a8a41
[000a83c4] 000a8a7b                  dc.l $000a8a7b
[000a83c8] 000a8abe                  dc.l $000a8abe
[000a83cc] 000a8b01                  dc.l $000a8b01
[000a83d0] 000a8b55                  dc.l $000a8b55
[000a83d4] 000a8b9f                  dc.l $000a8b9f
[000a83d8] 000a8bee                  dc.l $000a8bee
[000a83dc] 000a8c33                  dc.l $000a8c33
[000a83e0] 000a8c73                  dc.l $000a8c73
[000a83e4] 000a8cbf                  dc.l $000a8cbf
[000a83e8] 000a8d11                  dc.l $000a8d11
[000a83ec] 000a8d1b                  dc.l $000a8d1b
[000a83f0] 000a8d23                  dc.l $000a8d23
[000a83f4] 000a8d2a                  dc.l $000a8d2a
ACSconfig:
[000a83f8] 000a8484                  dc.l $000a8484
[000a83fc] 000a8d34                  dc.l $000a8d34
[000a8400]                           dc.w $0000
[000a8402]                           dc.w $0000
[000a8404]                           dc.w $0000
[000a8406]                           dc.w $0000
[000a8408]                           dc.w $0004
[000a840a] 000a8d37                  dc.l $000a8d37
[000a840e]                           dc.w $0000
[000a8410]                           dc.w $0000
[000a8412]                           dc.w $0000
[000a8414]                           dc.w $0000
[000a8416]                           dc.w $0000
[000a8418]                           dc.w $0000
[000a841a]                           dc.w $0000
[000a841c]                           dc.w $0000
[000a841e]                           dc.w $0000
[000a8420]                           dc.w $0000
[000a8422]                           dc.w $0000
[000a8424]                           dc.w $0000
[000a8426]                           dc.w $0000
[000a8428]                           dc.w $0000
[000a842a]                           dc.w $0000
[000a842c]                           dc.w $0000
[000a842e]                           dc.w $0000
[000a8430]                           dc.w $0000
[000a8432]                           dc.w $0000
[000a8434]                           dc.w $0000
[000a8436]                           dc.w $000c
[000a8438]                           dc.w $5045
[000a843a]                           dc.w $0000
[000a843c]                           dc.w $0000
[000a843e] 00015648                  dc.l ACSinit0
[000a8442] 0001568e                  dc.l ACSinit
[000a8446]                           dc.b '[3][ Es ist ein allgemeiner | Fehler aufgetreten! ][ Abbruch ]',0
[000a8485]                           dc.b '[1][ Ein Fehler ist aufgetreten! | %s][ Abbruch ]',0
[000a84b7]                           dc.b '[1][ Die Anzahl der momentan| darstellbaren Farben oder| die aktuelle Bildauflîsung | ist nicht korrekt!][ Abbruch ]',0
[000a852c]                           dc.b '[1][ Eine Datei lieû sich | nicht erzeugen!][ Abbruch ]',0
[000a8564]                           dc.b '[3][ Die Datei '%s'| lÑût sich nicht erzeugen! ][ Abbruch ]',0
[000a85a0]                           dc.b '[1][ Auf fremden Speicher | wurde zugegriffen!][ Abbruch ]',0
[000a85db]                           dc.b '[2][ | Soll das Accessory | >>               << | gestartet werden?| ][Ja|  Nein  ]',0
[000a862f]                           dc.b '[2][ Unbekannte GEM-Nachricht | erhalten.| ID = '%s'| Weiterhin berichten?][Ja|  Nein  ]',0
[000a8688]                           dc.b '[3][ Keine freie GEM-Fenster-ID | mehr vorhanden!| Abhilfe: Ein offenes| GEM-Fenster schlieûen.][    OK    ]',0
[000a86f5]                           dc.b '[3][ Kein freier ACS-Fenster- | Platz mehr vorhanden!| Abhilfe: Ein ACS-Fenster| lîschen.][    OK    ]',0
[000a875c]                           dc.b '[1][ Es ist ein Fehler bei der | Ein-/Ausgabe aufgetreten!][ Abbruch ]',0
[000a87a3]                           dc.b '[1][ Es ist ein Fehler in| der Speicherverwaltung | aufgetreten!][ Abbruch ]',0
[000a87f0]                           dc.b '[1][ Das Modul konnte nicht | geladen werden!][ Abbruch ]',0
[000a882a]                           dc.b '[1][ Das Modul '%s' | konnte nicht geladen werden! ][ Abbruch ]',0
[000a886a]                           dc.b '[1][ Beim Laden des Moduls | (mit Pexec-3) ist ein| Fehler aufgetreten!][ Abbruch ]',0
[000a88be]                           dc.b '[1][ Beim Laden des Moduls | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
[000a890a]                           dc.b '[1][ Der dem Modul folgende| Restspeicher kann nicht | freigegeben werden!][ Abbruch ]',0
[000a8961]                           dc.b '[1][ Der dem Modul '%s' | folgenden Restspeicher kann | nicht freigegeben werden!][ Abbruch ]',0
[000a89bf]                           dc.b '[1][ Die Adresse eines Speicher- | blocks ist ungerade!][ Abbruch ]',0
[000a8a03]                           dc.b '[1][ Eine Datei lieû sich| nicht korrekt îffnen! ][ Abbruch ]',0
[000a8a41]                           dc.b '[1][ Die Datei '%s' | lÑût sich nicht îffnen!][ Abbruch ]',0
[000a8a7b]                           dc.b '[1][ Es steht nicht genÅgend | Speicher zur VerfÅgung!][ Abbruch ]',0
[000a8abe]                           dc.b '[1][ Ein Fehler trat auf einem| Ein-/Ausgabekanal auf!][ Abbruch ]',0
[000a8b01]                           dc.b '[1][ Ein Speicherblock| befindet sich auûerhalb | der legalen Bereiche!][ Abbruch ]',0
[000a8b55]                           dc.b '[1][ Beim Lesen aus einer Datei| ist ein Fehler aufgetreten! ][ Abbruch ]',0
[000a8b9f]                           dc.b '[1][ Beim Lesen aus der Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
[000a8bee]                           dc.b '[1][ Das Modul hat leider eine | falsche Versionsnummer!][ Abbruch ]',0
[000a8c33]                           dc.b '[1][Das Modul|'%s'|hat eine falsche|Versionsnummer!][ Abbruch ]',0
[000a8c73]                           dc.b '[1][ Beim Schreiben in eine Datei | ist ein Fehler aufgetreten!][ Abbruch ]',0
[000a8cbf]                           dc.b '[1][ Beim Schreiben in die Datei | '%s' ist ein | Fehler aufgetreten!][ Abbruch ]',0
[000a8d11]                           dc.b ' Achtung ',0
[000a8d1b]                           dc.b ' Frage ',0
[000a8d23]                           dc.b ' Stop ',0
[000a8d2a]                           dc.b ' Meldung ',0
[000a8d34]                           dc.w $253b
[000a8d36]                           dc.w $0050
[000a8d38]                           dc.b 'UR_DESK',0

TEXT_002:
[000a8d40]                           dc.b 0
TEXT_003:
[000a8d41]                           dc.b 'Datenblîcke werden von USERDEFs benutzt, und sind daher von den entsprechenden Editoren zu bearbeiten.',0
TEXT_005:
[000a8da8]                           dc.b 'OK',0
TEXT_006:
[000a8dab]                           dc.b 'DATEN',0
TEXT_01:
[000a8db1]                           dc.b ' Data-Editor ',0
[000a8dbf]                           dc.b $00
DATAS_09:
[000a8dc0]                           dc.w $0000
[000a8dc2]                           dc.w $0000
[000a8dc4]                           dc.w $02f0
[000a8dc6]                           dc.w $0000
[000a8dc8]                           dc.w $0000
[000a8dca]                           dc.w $0000
[000a8dcc]                           dc.w $0000
[000a8dce]                           dc.w $0000
[000a8dd0]                           dc.w $0000
[000a8dd2]                           dc.w $0000
[000a8dd4]                           dc.w $0000
[000a8dd6]                           dc.w $0000
[000a8dd8]                           dc.w $1fff
[000a8dda]                           dc.w $ffff
[000a8ddc]                           dc.w $fff8
[000a8dde]                           dc.w $1000
[000a8de0]                           dc.w $0000
[000a8de2]                           dc.w $0008
[000a8de4]                           dc.w $1000
[000a8de6]                           dc.w $0000
[000a8de8]                           dc.w $0008
[000a8dea]                           dc.w $1004
[000a8dec]                           dc.w $8040
[000a8dee]                           dc.w $0088
[000a8df0]                           dc.w $1004
[000a8df2]                           dc.w $8040
[000a8df4]                           dc.w $0088
[000a8df6]                           dc.w $1004
[000a8df8]                           dc.w $8040
[000a8dfa]                           dc.w $0088
[000a8dfc]                           dc.w $1004
[000a8dfe]                           dc.w $8040
[000a8e00]                           dc.w $0088
[000a8e02]                           dc.w $1004
[000a8e04]                           dc.w $8040
[000a8e06]                           dc.w $0088
[000a8e08]                           dc.w $1004
[000a8e0a]                           dc.w $8040
[000a8e0c]                           dc.w $0088
[000a8e0e]                           dc.w $1004
[000a8e10]                           dc.w $8040
[000a8e12]                           dc.w $0088
[000a8e14]                           dc.w $1000
[000a8e16]                           dc.w $0000
[000a8e18]                           dc.w $0008
[000a8e1a]                           dc.w $1000
[000a8e1c]                           dc.w $0000
[000a8e1e]                           dc.w $0008
[000a8e20]                           dc.w $1000
[000a8e22]                           dc.w $0000
[000a8e24]                           dc.w $0008
[000a8e26]                           dc.w $1000
[000a8e28]                           dc.w $0000
[000a8e2a]                           dc.w $0008
[000a8e2c]                           dc.w $1000
[000a8e2e]                           dc.w $0000
[000a8e30]                           dc.w $0008
[000a8e32]                           dc.w $1100
[000a8e34]                           dc.w $8048
[000a8e36]                           dc.w $0488
[000a8e38]                           dc.w $1100
[000a8e3a]                           dc.w $8048
[000a8e3c]                           dc.w $0488
[000a8e3e]                           dc.w $1100
[000a8e40]                           dc.w $8048
[000a8e42]                           dc.w $0488
[000a8e44]                           dc.w $1100
[000a8e46]                           dc.w $8048
[000a8e48]                           dc.w $0488
[000a8e4a]                           dc.w $1100
[000a8e4c]                           dc.w $8048
[000a8e4e]                           dc.w $0488
[000a8e50]                           dc.w $1100
[000a8e52]                           dc.w $8048
[000a8e54]                           dc.w $0488
[000a8e56]                           dc.w $1100
[000a8e58]                           dc.w $8048
[000a8e5a]                           dc.w $0488
[000a8e5c]                           dc.w $1000
[000a8e5e]                           dc.w $0000
[000a8e60]                           dc.w $0008
[000a8e62]                           dc.w $1000
[000a8e64]                           dc.w $0000
[000a8e66]                           dc.w $0008
[000a8e68]                           dc.w $1fff
[000a8e6a]                           dc.w $ffff
[000a8e6c]                           dc.w $fff8
[000a8e6e]                           dc.w $0000
[000a8e70]                           dc.w $0000
[000a8e72]                           dc.w $0000
[000a8e74]                           dc.w $0000
[000a8e76]                           dc.w $0000
[000a8e78]                           dc.w $0000
[000a8e7a]                           dc.w $0000
[000a8e7c]                           dc.w $0000
[000a8e7e]                           dc.w $0000
[000a8e80]                           dc.w $0000
[000a8e82]                           dc.w $0000
[000a8e84]                           dc.w $0000
[000a8e86]                           dc.w $0000
[000a8e88]                           dc.w $0000
[000a8e8a]                           dc.w $0000
[000a8e8c]                           dc.w $0000
[000a8e8e]                           dc.w $0000
[000a8e90]                           dc.w $0000
[000a8e92]                           dc.w $1fff
[000a8e94]                           dc.w $ffff
[000a8e96]                           dc.w $fff8
[000a8e98]                           dc.w $1000
[000a8e9a]                           dc.w $0000
[000a8e9c]                           dc.w $0008
[000a8e9e]                           dc.w $1000
[000a8ea0]                           dc.w $0000
[000a8ea2]                           dc.w $0008
[000a8ea4]                           dc.w $1004
[000a8ea6]                           dc.w $8040
[000a8ea8]                           dc.w $0088
[000a8eaa]                           dc.w $1004
[000a8eac]                           dc.w $8040
[000a8eae]                           dc.w $0088
[000a8eb0]                           dc.w $1004
[000a8eb2]                           dc.w $8040
[000a8eb4]                           dc.w $0088
[000a8eb6]                           dc.w $1004
[000a8eb8]                           dc.w $8040
[000a8eba]                           dc.w $0088
[000a8ebc]                           dc.w $1004
[000a8ebe]                           dc.w $8040
[000a8ec0]                           dc.w $0088
[000a8ec2]                           dc.w $1004
[000a8ec4]                           dc.w $8040
[000a8ec6]                           dc.w $0088
[000a8ec8]                           dc.w $1004
[000a8eca]                           dc.w $8040
[000a8ecc]                           dc.w $0088
[000a8ece]                           dc.w $1000
[000a8ed0]                           dc.w $0000
[000a8ed2]                           dc.w $0008
[000a8ed4]                           dc.w $1000
[000a8ed6]                           dc.w $0000
[000a8ed8]                           dc.w $0008
[000a8eda]                           dc.w $1000
[000a8edc]                           dc.w $0000
[000a8ede]                           dc.w $0008
[000a8ee0]                           dc.w $1000
[000a8ee2]                           dc.w $0000
[000a8ee4]                           dc.w $0008
[000a8ee6]                           dc.w $1000
[000a8ee8]                           dc.w $0000
[000a8eea]                           dc.w $0008
[000a8eec]                           dc.w $1100
[000a8eee]                           dc.w $8048
[000a8ef0]                           dc.w $0488
[000a8ef2]                           dc.w $1100
[000a8ef4]                           dc.w $8048
[000a8ef6]                           dc.w $0488
[000a8ef8]                           dc.w $1100
[000a8efa]                           dc.w $8048
[000a8efc]                           dc.w $0488
[000a8efe]                           dc.w $1100
[000a8f00]                           dc.w $8048
[000a8f02]                           dc.w $0488
[000a8f04]                           dc.w $1100
[000a8f06]                           dc.w $8048
[000a8f08]                           dc.w $0488
[000a8f0a]                           dc.w $1100
[000a8f0c]                           dc.w $8048
[000a8f0e]                           dc.w $0488
[000a8f10]                           dc.w $1100
[000a8f12]                           dc.w $8048
[000a8f14]                           dc.w $0488
[000a8f16]                           dc.w $1000
[000a8f18]                           dc.w $0000
[000a8f1a]                           dc.w $0008
[000a8f1c]                           dc.w $1000
[000a8f1e]                           dc.w $0000
[000a8f20]                           dc.w $0008
[000a8f22]                           dc.w $1fff
[000a8f24]                           dc.w $ffff
[000a8f26]                           dc.w $fff8
[000a8f28]                           dc.w $0000
[000a8f2a]                           dc.w $0000
[000a8f2c]                           dc.w $0000
[000a8f2e]                           dc.w $0000
[000a8f30]                           dc.w $0000
[000a8f32]                           dc.w $0000
[000a8f34]                           dc.w $0000
[000a8f36]                           dc.w $0000
[000a8f38]                           dc.w $0000
[000a8f3a]                           dc.w $0000
[000a8f3c]                           dc.w $0000
[000a8f3e]                           dc.w $0000
[000a8f40]                           dc.w $0000
[000a8f42]                           dc.w $0000
[000a8f44]                           dc.w $0000
[000a8f46]                           dc.w $0000
[000a8f48]                           dc.w $0000
[000a8f4a]                           dc.w $0000
[000a8f4c]                           dc.w $1fff
[000a8f4e]                           dc.w $ffff
[000a8f50]                           dc.w $fff8
[000a8f52]                           dc.w $1000
[000a8f54]                           dc.w $0000
[000a8f56]                           dc.w $0008
[000a8f58]                           dc.w $1000
[000a8f5a]                           dc.w $0000
[000a8f5c]                           dc.w $0008
[000a8f5e]                           dc.w $1004
[000a8f60]                           dc.w $8040
[000a8f62]                           dc.w $0088
[000a8f64]                           dc.w $1004
[000a8f66]                           dc.w $8040
[000a8f68]                           dc.w $0088
[000a8f6a]                           dc.w $1004
[000a8f6c]                           dc.w $8040
[000a8f6e]                           dc.w $0088
[000a8f70]                           dc.w $1004
[000a8f72]                           dc.w $8040
[000a8f74]                           dc.w $0088
[000a8f76]                           dc.w $1004
[000a8f78]                           dc.w $8040
[000a8f7a]                           dc.w $0088
[000a8f7c]                           dc.w $1004
[000a8f7e]                           dc.w $8040
[000a8f80]                           dc.w $0088
[000a8f82]                           dc.w $1004
[000a8f84]                           dc.w $8040
[000a8f86]                           dc.w $0088
[000a8f88]                           dc.w $1000
[000a8f8a]                           dc.w $0000
[000a8f8c]                           dc.w $0008
[000a8f8e]                           dc.w $1000
[000a8f90]                           dc.w $0000
[000a8f92]                           dc.w $0008
[000a8f94]                           dc.w $1000
[000a8f96]                           dc.w $0000
[000a8f98]                           dc.w $0008
[000a8f9a]                           dc.w $1000
[000a8f9c]                           dc.w $0000
[000a8f9e]                           dc.w $0008
[000a8fa0]                           dc.w $1000
[000a8fa2]                           dc.w $0000
[000a8fa4]                           dc.w $0008
[000a8fa6]                           dc.w $1100
[000a8fa8]                           dc.w $8048
[000a8faa]                           dc.w $0488
[000a8fac]                           dc.w $1100
[000a8fae]                           dc.w $8048
[000a8fb0]                           dc.w $0488
[000a8fb2]                           dc.w $1100
[000a8fb4]                           dc.w $8048
[000a8fb6]                           dc.w $0488
[000a8fb8]                           dc.w $1100
[000a8fba]                           dc.w $8048
[000a8fbc]                           dc.w $0488
[000a8fbe]                           dc.w $1100
[000a8fc0]                           dc.w $8048
[000a8fc2]                           dc.w $0488
[000a8fc4]                           dc.w $1100
[000a8fc6]                           dc.w $8048
[000a8fc8]                           dc.w $0488
[000a8fca]                           dc.w $1100
[000a8fcc]                           dc.w $8048
[000a8fce]                           dc.w $0488
[000a8fd0]                           dc.w $1000
[000a8fd2]                           dc.w $0000
[000a8fd4]                           dc.w $0008
[000a8fd6]                           dc.w $1000
[000a8fd8]                           dc.w $0000
[000a8fda]                           dc.w $0008
[000a8fdc]                           dc.w $1fff
[000a8fde]                           dc.w $ffff
[000a8fe0]                           dc.w $fff8
[000a8fe2]                           dc.w $0000
[000a8fe4]                           dc.w $0000
[000a8fe6]                           dc.w $0000
[000a8fe8]                           dc.w $0000
[000a8fea]                           dc.w $0000
[000a8fec]                           dc.w $0000
[000a8fee]                           dc.w $0000
[000a8ff0]                           dc.w $0000
[000a8ff2]                           dc.w $0000
[000a8ff4]                           dc.w $0000
[000a8ff6]                           dc.w $0000
[000a8ff8]                           dc.w $0000
[000a8ffa]                           dc.w $0000
[000a8ffc]                           dc.w $0000
[000a8ffe]                           dc.w $0000
[000a9000]                           dc.w $0000
[000a9002]                           dc.w $0000
[000a9004]                           dc.w $0000
[000a9006]                           dc.w $1fff
[000a9008]                           dc.w $ffff
[000a900a]                           dc.w $fff8
[000a900c]                           dc.w $1fff
[000a900e]                           dc.w $ffff
[000a9010]                           dc.w $fff8
[000a9012]                           dc.w $1fff
[000a9014]                           dc.w $ffff
[000a9016]                           dc.w $fff8
[000a9018]                           dc.w $1e1f
[000a901a]                           dc.w $e1f0
[000a901c]                           dc.w $c3f8
[000a901e]                           dc.w $1edf
[000a9020]                           dc.w $edf6
[000a9022]                           dc.w $dbf8
[000a9024]                           dc.w $1edf
[000a9026]                           dc.w $edf6
[000a9028]                           dc.w $dbf8
[000a902a]                           dc.w $1edf
[000a902c]                           dc.w $edf6
[000a902e]                           dc.w $dbf8
[000a9030]                           dc.w $1edf
[000a9032]                           dc.w $edf6
[000a9034]                           dc.w $dbf8
[000a9036]                           dc.w $1edf
[000a9038]                           dc.w $edf6
[000a903a]                           dc.w $dbf8
[000a903c]                           dc.w $1e1f
[000a903e]                           dc.w $e1f0
[000a9040]                           dc.w $c3f8
[000a9042]                           dc.w $1fff
[000a9044]                           dc.w $ffff
[000a9046]                           dc.w $fff8
[000a9048]                           dc.w $1fff
[000a904a]                           dc.w $ffff
[000a904c]                           dc.w $fff8
[000a904e]                           dc.w $1fff
[000a9050]                           dc.w $ffff
[000a9052]                           dc.w $fff8
[000a9054]                           dc.w $1fff
[000a9056]                           dc.w $ffff
[000a9058]                           dc.w $fff8
[000a905a]                           dc.w $1fff
[000a905c]                           dc.w $ffff
[000a905e]                           dc.w $fff8
[000a9060]                           dc.w $1fc3
[000a9062]                           dc.w $e1fe
[000a9064]                           dc.w $1ff8
[000a9066]                           dc.w $1fdb
[000a9068]                           dc.w $edfe
[000a906a]                           dc.w $dff8
[000a906c]                           dc.w $1fdb
[000a906e]                           dc.w $edfe
[000a9070]                           dc.w $dff8
[000a9072]                           dc.w $1fdb
[000a9074]                           dc.w $edfe
[000a9076]                           dc.w $dff8
[000a9078]                           dc.w $1fdb
[000a907a]                           dc.w $edfe
[000a907c]                           dc.w $dff8
[000a907e]                           dc.w $1fdb
[000a9080]                           dc.w $edfe
[000a9082]                           dc.w $dff8
[000a9084]                           dc.w $1fc3
[000a9086]                           dc.w $e1fe
[000a9088]                           dc.w $1ff8
[000a908a]                           dc.w $1fff
[000a908c]                           dc.w $ffff
[000a908e]                           dc.w $fff8
[000a9090]                           dc.w $1fff
[000a9092]                           dc.w $ffff
[000a9094]                           dc.w $fff8
[000a9096]                           dc.w $1fff
[000a9098]                           dc.w $ffff
[000a909a]                           dc.w $fff8
[000a909c]                           dc.w $0000
[000a909e]                           dc.w $0000
[000a90a0]                           dc.w $0000
[000a90a2]                           dc.w $0000
[000a90a4]                           dc.w $0000
[000a90a6]                           dc.w $0000
[000a90a8]                           dc.w $0000
[000a90aa]                           dc.w $0000
[000a90ac]                           dc.w $0000
DATAS_10:
[000a90ae]                           dc.w $0000
[000a90b0]                           dc.w $0000
[000a90b2]                           dc.w $0000
[000a90b4]                           dc.w $0000
[000a90b6]                           dc.w $0000
[000a90b8]                           dc.w $0000
[000a90ba]                           dc.w $0000
[000a90bc]                           dc.w $0000
[000a90be]                           dc.w $0000
[000a90c0]                           dc.w $1fff
[000a90c2]                           dc.w $ffff
[000a90c4]                           dc.w $fff8
[000a90c6]                           dc.w $1fff
[000a90c8]                           dc.w $ffff
[000a90ca]                           dc.w $fff8
[000a90cc]                           dc.w $1fff
[000a90ce]                           dc.w $ffff
[000a90d0]                           dc.w $fff8
[000a90d2]                           dc.w $1fff
[000a90d4]                           dc.w $ffff
[000a90d6]                           dc.w $fff8
[000a90d8]                           dc.w $1fff
[000a90da]                           dc.w $ffff
[000a90dc]                           dc.w $fff8
[000a90de]                           dc.w $1fff
[000a90e0]                           dc.w $ffff
[000a90e2]                           dc.w $fff8
[000a90e4]                           dc.w $1fff
[000a90e6]                           dc.w $ffff
[000a90e8]                           dc.w $fff8
[000a90ea]                           dc.w $1fff
[000a90ec]                           dc.w $ffff
[000a90ee]                           dc.w $fff8
[000a90f0]                           dc.w $1fff
[000a90f2]                           dc.w $ffff
[000a90f4]                           dc.w $fff8
[000a90f6]                           dc.w $1fff
[000a90f8]                           dc.w $ffff
[000a90fa]                           dc.w $fff8
[000a90fc]                           dc.w $1fff
[000a90fe]                           dc.w $ffff
[000a9100]                           dc.w $fff8
[000a9102]                           dc.w $1fff
[000a9104]                           dc.w $ffff
[000a9106]                           dc.w $fff8
[000a9108]                           dc.w $1fff
[000a910a]                           dc.w $ffff
[000a910c]                           dc.w $fff8
[000a910e]                           dc.w $1fff
[000a9110]                           dc.w $ffff
[000a9112]                           dc.w $fff8
[000a9114]                           dc.w $1fff
[000a9116]                           dc.w $ffff
[000a9118]                           dc.w $fff8
[000a911a]                           dc.w $1fff
[000a911c]                           dc.w $ffff
[000a911e]                           dc.w $fff8
[000a9120]                           dc.w $1fff
[000a9122]                           dc.w $ffff
[000a9124]                           dc.w $fff8
[000a9126]                           dc.w $1fff
[000a9128]                           dc.w $ffff
[000a912a]                           dc.w $fff8
[000a912c]                           dc.w $1fff
[000a912e]                           dc.w $ffff
[000a9130]                           dc.w $fff8
[000a9132]                           dc.w $1fff
[000a9134]                           dc.w $ffff
[000a9136]                           dc.w $fff8
[000a9138]                           dc.w $1fff
[000a913a]                           dc.w $ffff
[000a913c]                           dc.w $fff8
[000a913e]                           dc.w $1fff
[000a9140]                           dc.w $ffff
[000a9142]                           dc.w $fff8
[000a9144]                           dc.w $1fff
[000a9146]                           dc.w $ffff
[000a9148]                           dc.w $fff8
[000a914a]                           dc.w $1fff
[000a914c]                           dc.w $ffff
[000a914e]                           dc.w $fff8
[000a9150]                           dc.w $1fff
[000a9152]                           dc.w $ffff
[000a9154]                           dc.w $fff8
[000a9156]                           dc.w $0000
[000a9158]                           dc.w $0000
[000a915a]                           dc.w $0000
[000a915c]                           dc.w $0000
[000a915e]                           dc.w $0000
[000a9160]                           dc.w $0000
[000a9162]                           dc.w $0000
[000a9164]                           dc.w $0000
[000a9166]                           dc.w $0000
A_3DBUTTON01:
[000a9168] 00064a22                  dc.l A_3Dbutton
[000a916c]                           dc.w $29c1
[000a916e]                           dc.w $0178
[000a9170] 000630f2                  dc.l Auo_string
[000a9174] 000a8da8                  dc.l TEXT_005
[000a9178]                           dc.w $0000
[000a917a]                           dc.w $0000
[000a917c]                           dc.w $0000
[000a917e]                           dc.w $0000
[000a9180]                           dc.w $0000
[000a9182]                           dc.w $0000
[000a9184]                           dc.w $0000
[000a9186]                           dc.w $0000
A_3DBUTTON02:
[000a9188] 00064a22                  dc.l A_3Dbutton
[000a918c]                           dc.w $21f1
[000a918e]                           dc.w $01f8
[000a9190] 000630f2                  dc.l Auo_string
[000a9194]                           dc.w $0000
[000a9196]                           dc.w $0000
[000a9198]                           dc.w $0000
[000a919a]                           dc.w $0000
[000a919c]                           dc.w $0000
[000a919e]                           dc.w $0000
[000a91a0]                           dc.w $0000
[000a91a2]                           dc.w $0000
[000a91a4]                           dc.w $0000
[000a91a6]                           dc.w $0000
A_FTEXT01:
[000a91a8] 0006639a                  dc.l A_ftext
[000a91ac]                           dc.w $0001
[000a91ae]                           dc.w $000d
[000a91b0] 00066924                  dc.l Auo_ftext
[000a91b4] 000a8d41                  dc.l TEXT_003
[000a91b8]                           dc.w $0000
[000a91ba]                           dc.w $0000
[000a91bc]                           dc.w $0000
[000a91be]                           dc.w $0000
[000a91c0]                           dc.w $0000
[000a91c2]                           dc.w $0000
[000a91c4]                           dc.w $0000
[000a91c6]                           dc.w $0000
A_INNERFRAME02:
[000a91c8] 00064256                  dc.l A_innerframe
[000a91cc]                           dc.w $1000
[000a91ce]                           dc.w $8f19
[000a91d0] 000630f2                  dc.l Auo_string
[000a91d4]                           dc.w $0000
[000a91d6]                           dc.w $0000
[000a91d8]                           dc.w $0000
[000a91da]                           dc.w $0000
[000a91dc]                           dc.w $0000
[000a91de]                           dc.w $0000
[000a91e0]                           dc.w $0000
[000a91e2]                           dc.w $0000
[000a91e4]                           dc.w $0000
[000a91e6]                           dc.w $0000
_C4_IC_DATA:
[000a91e8]                           dc.w $0004
[000a91ea] 000a8dc6                  dc.l $000a8dc6
[000a91ee] 000a90ae                  dc.l DATAS_10
[000a91f2]                           dc.w $0000
[000a91f4]                           dc.w $0000
[000a91f6]                           dc.w $0000
[000a91f8]                           dc.w $0000
[000a91fa]                           dc.w $0000
[000a91fc]                           dc.w $0000
_MSK_IC_DATA:
[000a91fe]                           dc.w $0000
[000a9200]                           dc.w $0000
[000a9202]                           dc.w $0000
[000a9204]                           dc.w $0000
[000a9206]                           dc.w $0000
[000a9208]                           dc.w $0000
[000a920a]                           dc.w $0000
[000a920c]                           dc.w $0000
[000a920e]                           dc.w $0000
[000a9210]                           dc.w $1fff
[000a9212]                           dc.w $ffff
[000a9214]                           dc.w $fff8
[000a9216]                           dc.w $1fff
[000a9218]                           dc.w $ffff
[000a921a]                           dc.w $fff8
[000a921c]                           dc.w $1fff
[000a921e]                           dc.w $ffff
[000a9220]                           dc.w $fff8
[000a9222]                           dc.w $1fff
[000a9224]                           dc.w $ffff
[000a9226]                           dc.w $fff8
[000a9228]                           dc.w $1fff
[000a922a]                           dc.w $ffff
[000a922c]                           dc.w $fff8
[000a922e]                           dc.w $1fff
[000a9230]                           dc.w $ffff
[000a9232]                           dc.w $fff8
[000a9234]                           dc.w $1fff
[000a9236]                           dc.w $ffff
[000a9238]                           dc.w $fff8
[000a923a]                           dc.w $1fff
[000a923c]                           dc.w $ffff
[000a923e]                           dc.w $fff8
[000a9240]                           dc.w $1fff
[000a9242]                           dc.w $ffff
[000a9244]                           dc.w $fff8
[000a9246]                           dc.w $1fff
[000a9248]                           dc.w $ffff
[000a924a]                           dc.w $fff8
[000a924c]                           dc.w $1fff
[000a924e]                           dc.w $ffff
[000a9250]                           dc.w $fff8
[000a9252]                           dc.w $1fff
[000a9254]                           dc.w $ffff
[000a9256]                           dc.w $fff8
[000a9258]                           dc.w $1fff
[000a925a]                           dc.w $ffff
[000a925c]                           dc.w $fff8
[000a925e]                           dc.w $1fff
[000a9260]                           dc.w $ffff
[000a9262]                           dc.w $fff8
[000a9264]                           dc.w $1fff
[000a9266]                           dc.w $ffff
[000a9268]                           dc.w $fff8
[000a926a]                           dc.w $1fff
[000a926c]                           dc.w $ffff
[000a926e]                           dc.w $fff8
[000a9270]                           dc.w $1fff
[000a9272]                           dc.w $ffff
[000a9274]                           dc.w $fff8
[000a9276]                           dc.w $1fff
[000a9278]                           dc.w $ffff
[000a927a]                           dc.w $fff8
[000a927c]                           dc.w $1fff
[000a927e]                           dc.w $ffff
[000a9280]                           dc.w $fff8
[000a9282]                           dc.w $1fff
[000a9284]                           dc.w $ffff
[000a9286]                           dc.w $fff8
[000a9288]                           dc.w $1fff
[000a928a]                           dc.w $ffff
[000a928c]                           dc.w $fff8
[000a928e]                           dc.w $1fff
[000a9290]                           dc.w $ffff
[000a9292]                           dc.w $fff8
[000a9294]                           dc.w $1fff
[000a9296]                           dc.w $ffff
[000a9298]                           dc.w $fff8
[000a929a]                           dc.w $1fff
[000a929c]                           dc.w $ffff
[000a929e]                           dc.w $fff8
[000a92a0]                           dc.w $1fff
[000a92a2]                           dc.w $ffff
[000a92a4]                           dc.w $fff8
[000a92a6]                           dc.w $0000
[000a92a8]                           dc.w $0000
[000a92aa]                           dc.w $0000
[000a92ac]                           dc.w $0000
[000a92ae]                           dc.w $0000
[000a92b0]                           dc.w $0000
[000a92b2]                           dc.w $0000
[000a92b4]                           dc.w $0000
[000a92b6]                           dc.w $0000
_DAT_IC_DATA:
[000a92b8]                           dc.w $0000
[000a92ba]                           dc.w $0000
[000a92bc]                           dc.w $0000
[000a92be]                           dc.w $0000
[000a92c0]                           dc.w $0000
[000a92c2]                           dc.w $0000
[000a92c4]                           dc.w $0000
[000a92c6]                           dc.w $0000
[000a92c8]                           dc.w $0000
[000a92ca]                           dc.w $1fff
[000a92cc]                           dc.w $ffff
[000a92ce]                           dc.w $fff8
[000a92d0]                           dc.w $1000
[000a92d2]                           dc.w $0000
[000a92d4]                           dc.w $0008
[000a92d6]                           dc.w $1000
[000a92d8]                           dc.w $0000
[000a92da]                           dc.w $0008
[000a92dc]                           dc.w $11e4
[000a92de]                           dc.w $9e4f
[000a92e0]                           dc.w $3c88
[000a92e2]                           dc.w $1124
[000a92e4]                           dc.w $9249
[000a92e6]                           dc.w $2488
[000a92e8]                           dc.w $1124
[000a92ea]                           dc.w $9249
[000a92ec]                           dc.w $2488
[000a92ee]                           dc.w $1124
[000a92f0]                           dc.w $9249
[000a92f2]                           dc.w $2488
[000a92f4]                           dc.w $1124
[000a92f6]                           dc.w $9249
[000a92f8]                           dc.w $2488
[000a92fa]                           dc.w $1124
[000a92fc]                           dc.w $9249
[000a92fe]                           dc.w $2488
[000a9300]                           dc.w $11e4
[000a9302]                           dc.w $9e4f
[000a9304]                           dc.w $3c88
[000a9306]                           dc.w $1000
[000a9308]                           dc.w $0000
[000a930a]                           dc.w $0008
[000a930c]                           dc.w $1000
[000a930e]                           dc.w $0000
[000a9310]                           dc.w $0008
[000a9312]                           dc.w $1000
[000a9314]                           dc.w $0000
[000a9316]                           dc.w $0008
[000a9318]                           dc.w $1000
[000a931a]                           dc.w $0000
[000a931c]                           dc.w $0008
[000a931e]                           dc.w $1000
[000a9320]                           dc.w $0000
[000a9322]                           dc.w $0008
[000a9324]                           dc.w $113c
[000a9326]                           dc.w $9e49
[000a9328]                           dc.w $e488
[000a932a]                           dc.w $1124
[000a932c]                           dc.w $9249
[000a932e]                           dc.w $2488
[000a9330]                           dc.w $1124
[000a9332]                           dc.w $9249
[000a9334]                           dc.w $2488
[000a9336]                           dc.w $1124
[000a9338]                           dc.w $9249
[000a933a]                           dc.w $2488
[000a933c]                           dc.w $1124
[000a933e]                           dc.w $9249
[000a9340]                           dc.w $2488
[000a9342]                           dc.w $1124
[000a9344]                           dc.w $9249
[000a9346]                           dc.w $2488
[000a9348]                           dc.w $113c
[000a934a]                           dc.w $9e49
[000a934c]                           dc.w $e488
[000a934e]                           dc.w $1000
[000a9350]                           dc.w $0000
[000a9352]                           dc.w $0008
[000a9354]                           dc.w $1000
[000a9356]                           dc.w $0000
[000a9358]                           dc.w $0008
[000a935a]                           dc.w $1fff
[000a935c]                           dc.w $ffff
[000a935e]                           dc.w $fff8
[000a9360]                           dc.w $0000
[000a9362]                           dc.w $0000
[000a9364]                           dc.w $0000
[000a9366]                           dc.w $0000
[000a9368]                           dc.w $0000
[000a936a]                           dc.w $0000
[000a936c]                           dc.w $0000
[000a936e]                           dc.w $0000
[000a9370]                           dc.w $0000
IC_DATA:
[000a9372] 000a91fe                  dc.l _MSK_IC_DATA
[000a9376] 000a92b8                  dc.l _DAT_IC_DATA
[000a937a] 000a8dab                  dc.l TEXT_006
[000a937e]                           dc.w $1000
[000a9380]                           dc.w $0000
[000a9382]                           dc.w $0000
[000a9384]                           dc.w $000c
[000a9386]                           dc.w $0000
[000a9388]                           dc.w $0030
[000a938a]                           dc.w $001f
[000a938c]                           dc.w $0000
[000a938e]                           dc.w $0020
[000a9390]                           dc.w $0048
[000a9392]                           dc.w $0008
[000a9394] 000a91e8                  dc.l _C4_IC_DATA
EDIT_DATA:
[000a9398]                           dc.w $ffff
[000a939a]                           dc.w $0001
[000a939c]                           dc.w $0004
[000a939e]                           dc.w $0018
[000a93a0]                           dc.w $0040
[000a93a2]                           dc.w $0010
[000a93a4] 000a9188                  dc.l A_3DBUTTON02
[000a93a8]                           dc.w $0000
[000a93aa]                           dc.w $0000
[000a93ac]                           dc.w $0023
[000a93ae]                           dc.w $0009
_01_EDIT_DATA:
[000a93b0]                           dc.w $0004
[000a93b2]                           dc.w $0002
[000a93b4]                           dc.w $0002
[000a93b6]                           dc.w $0018
[000a93b8]                           dc.w $0040
[000a93ba]                           dc.w $0000
[000a93bc] 000a91c8                  dc.l A_INNERFRAME02
[000a93c0]                           dc.w $0001
[000a93c2]                           dc.w $0000
[000a93c4]                           dc.w $0021
[000a93c6]                           dc.w $0006
_02_EDIT_DATA:
[000a93c8]                           dc.w $0001
[000a93ca]                           dc.w $0003
[000a93cc]                           dc.w $0003
[000a93ce]                           dc.w $0014
[000a93d0]                           dc.w $0000
[000a93d2]                           dc.w $0000
[000a93d4]                           dc.w $0000
[000a93d6]                           dc.w $1101
[000a93d8]                           dc.w $0001
[000a93da]                           dc.w $0001
[000a93dc]                           dc.w $001f
[000a93de]                           dc.w $0004
_03_EDIT_DATA:
[000a93e0]                           dc.w $0002
[000a93e2]                           dc.w $ffff
[000a93e4]                           dc.w $ffff
[000a93e6]                           dc.w $0018
[000a93e8]                           dc.w $0000
[000a93ea]                           dc.w $0000
[000a93ec] 000a91a8                  dc.l A_FTEXT01
[000a93f0]                           dc.w $0001
[000a93f2]                           dc.w $0000
[000a93f4]                           dc.w $001d
[000a93f6]                           dc.w $0004
_04_EDIT_DATA:
[000a93f8]                           dc.w $0000
[000a93fa]                           dc.w $ffff
[000a93fc]                           dc.w $ffff
[000a93fe]                           dc.w $0018
[000a9400]                           dc.w $0007
[000a9402]                           dc.w $0010
[000a9404] 000a9168                  dc.l A_3DBUTTON01
[000a9408]                           dc.w $000b
[000a940a]                           dc.w $0006
[000a940c]                           dc.w $000c
[000a940e]                           dc.w $0002
_04aEDIT_DATA:
[000a9410] 0001d31e                  dc.l editdat_abort
[000a9414]                           dc.w $0000
[000a9416]                           dc.w $0000
[000a9418]                           dc.w $8020
[000a941a]                           dc.w $884f
[000a941c]                           dc.w $0000
[000a941e]                           dc.w $0000
[000a9420]                           dc.w $0000
[000a9422]                           dc.w $0000
[000a9424]                           dc.w $0000
[000a9426]                           dc.w $0000
WI_DATA:
[000a9428]                           dc.w $0000
[000a942a]                           dc.w $0000
[000a942c] 0001d3ce                  dc.l dt_service
[000a9430] 0001d330                  dc.l dt_make
[000a9434] 00057428                  dc.l Awi_open
[000a9438] 00055e94                  dc.l Awi_init
[000a943c] 000a9398                  dc.l EDIT_DATA
[000a9440]                           dc.w $0000
[000a9442]                           dc.w $0000
[000a9444]                           dc.w $0000
[000a9446]                           dc.w $0000
[000a9448]                           dc.w $ffff
[000a944a]                           dc.w $601f
[000a944c]                           dc.w $0000
[000a944e]                           dc.w $0000
[000a9450]                           dc.w $0063
[000a9452]                           dc.w $0063
[000a9454]                           dc.w $0000
[000a9456]                           dc.w $0000
[000a9458]                           dc.w $0000
[000a945a]                           dc.w $0000
[000a945c]                           dc.w $0000
[000a945e]                           dc.w $0000
[000a9460]                           dc.w $0000
[000a9462]                           dc.w $0000
[000a9464]                           dc.w $ffff
[000a9466]                           dc.w $ffff
[000a9468]                           dc.w $ffff
[000a946a]                           dc.w $ffff
[000a946c]                           dc.w $0000
[000a946e]                           dc.w $0000
[000a9470]                           dc.w $fcf8
[000a9472] 000a8db1                  dc.l TEXT_01
[000a9476] 000a8d40                  dc.l TEXT_002
[000a947a]                           dc.w $2710
[000a947c]                           dc.w $0100
[000a947e]                           dc.w $0000
[000a9480]                           dc.w $ffff
[000a9482] 000a9372                  dc.l IC_DATA
[000a9486]                           dc.w $0000
[000a9488]                           dc.w $0000
[000a948a] 0006b744                  dc.l Awi_keys
[000a948e] 00051852                  dc.l Awi_obchange
[000a9492] 00051c46                  dc.l Awi_redraw
[000a9496] 000587a4                  dc.l Awi_topped
[000a949a] 00058362                  dc.l Awi_closed
[000a949e] 000587ec                  dc.l Awi_fulled
[000a94a2] 0005217c                  dc.l Awi_arrowed
[000a94a6] 000524b4                  dc.l Awi_hslid
[000a94aa] 0005255e                  dc.l Awi_vslid
[000a94ae] 00058bb0                  dc.l Awi_sized
[000a94b2] 00058d50                  dc.l Awi_moved
[000a94b6] 0005998a                  dc.l Awi_iconify
[000a94ba] 00059c6c                  dc.l Awi_uniconify
[000a94be] 0005b5b6                  dc.l Awi_gemscript
[000a94c2]                           dc.w $0000
[000a94c4]                           dc.w $0000
[000a94c6]                           dc.w $0000
[000a94c8]                           dc.w $0000
