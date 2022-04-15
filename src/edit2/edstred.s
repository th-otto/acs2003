editstr_abort:
[000233c2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000233c8] 2068 0258                 movea.l    600(a0),a0
[000233cc] 4eb9 0002 35f4            jsr        term
[000233d2] 4e75                      rts
editstr_ok:
[000233d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000233da] 2068 0258                 movea.l    600(a0),a0
[000233de] 4eb9 0002 33f6            jsr        acc_string
[000233e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000233ea] 2068 0258                 movea.l    600(a0),a0
[000233ee] 4eb9 0002 35f4            jsr        term
[000233f4] 4e75                      rts
acc_string:
[000233f6] 48e7 0038                 movem.l    a2-a4,-(a7)
[000233fa] 4fef fdf8                 lea.l      -520(a7),a7
[000233fe] 2450                      movea.l    (a0),a2
[00023400] 2252                      movea.l    (a2),a1
[00023402] 0069 0001 0006            ori.w      #$0001,6(a1)
[00023408] 2668 0014                 movea.l    20(a0),a3
[0002340c] 43d7                      lea.l      (a7),a1
[0002340e] 7003                      moveq.l    #3,d0
[00023410] 41eb 0048                 lea.l      72(a3),a0
[00023414] 4eb9 0006 a068            jsr        Auo_boxed
[0002341a] 43ef 0004                 lea.l      4(a7),a1
[0002341e] 7003                      moveq.l    #3,d0
[00023420] 41eb 0060                 lea.l      96(a3),a0
[00023424] 4eb9 0006 a068            jsr        Auo_boxed
[0002342a] 2257                      movea.l    (a7),a1
[0002342c] 41ef 0008                 lea.l      8(a7),a0
[00023430] 4eb9 0008 2f0c            jsr        strcpy
[00023436] 226f 0004                 movea.l    4(a7),a1
[0002343a] 4eb9 0008 2e42            jsr        strcat
[00023440] 41ef 0008                 lea.l      8(a7),a0
[00023444] 4eb9 0004 643c            jsr        Ast_create
[0002344a] 2848                      movea.l    a0,a4
[0002344c] 200c                      move.l     a4,d0
[0002344e] 6744                      beq.s      $00023494
[00023450] 226a 0004                 movea.l    4(a2),a1
[00023454] 2069 0004                 movea.l    4(a1),a0
[00023458] 4eb9 0004 c7c8            jsr        Ax_free
[0002345e] 206a 0004                 movea.l    4(a2),a0
[00023462] 214c 0004                 move.l     a4,4(a0)
[00023466] 204c                      movea.l    a4,a0
[00023468] 4eb9 0008 2f6c            jsr        strlen
[0002346e] 5280                      addq.l     #1,d0
[00023470] 206a 0004                 movea.l    4(a2),a0
[00023474] 2140 000a                 move.l     d0,10(a0)
[00023478] 206a 0004                 movea.l    4(a2),a0
[0002347c] 2140 000e                 move.l     d0,14(a0)
[00023480] 2052                      movea.l    (a2),a0
[00023482] 2268 0034                 movea.l    52(a0),a1
[00023486] 2069 0012                 movea.l    18(a1),a0
[0002348a] 2208                      move.l     a0,d1
[0002348c] 6706                      beq.s      $00023494
[0002348e] 0068 0020 0056            ori.w      #$0020,86(a0)
[00023494] 4fef 0208                 lea.l      520(a7),a7
[00023498] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0002349c] 4e75                      rts
st_make:
[0002349e] 48e7 0038                 movem.l    a2-a4,-(a7)
[000234a2] 594f                      subq.w     #4,a7
[000234a4] 2448                      movea.l    a0,a2
[000234a6] 266a 0004                 movea.l    4(a2),a3
[000234aa] 286b 0012                 movea.l    18(a3),a4
[000234ae] 200c                      move.l     a4,d0
[000234b0] 670a                      beq.s      $000234BC
[000234b2] 204c                      movea.l    a4,a0
[000234b4] 4eb9 0005 6bea            jsr        Awi_show
[000234ba] 6072                      bra.s      $0002352E
[000234bc] 7008                      moveq.l    #8,d0
[000234be] 4eb9 0004 c608            jsr        Ax_malloc
[000234c4] 2e88                      move.l     a0,(a7)
[000234c6] 6762                      beq.s      $0002352A
[000234c8] 2092                      move.l     (a2),(a0)
[000234ca] 216a 0004 0004            move.l     4(a2),4(a0)
[000234d0] 43eb 0016                 lea.l      22(a3),a1
[000234d4] 23c9 000b 3da2            move.l     a1,$000B3DA2
[000234da] 2079 000b 3dae            movea.l    $000B3DAE,a0
[000234e0] 2149 0008                 move.l     a1,8(a0)
[000234e4] 41f9 000b 3d54            lea.l      WI_STRING,a0
[000234ea] 4eb9 0005 7052            jsr        Awi_create
[000234f0] 2848                      movea.l    a0,a4
[000234f2] 200c                      move.l     a4,d0
[000234f4] 6734                      beq.s      $0002352A
[000234f6] 2252                      movea.l    (a2),a1
[000234f8] 4869 0168                 pea.l      360(a1)
[000234fc] 43eb 003a                 lea.l      58(a3),a1
[00023500] 4eb9 0001 6372            jsr        wi_pos
[00023506] 584f                      addq.w     #4,a7
[00023508] 2897                      move.l     (a7),(a4)
[0002350a] 274c 0012                 move.l     a4,18(a3)
[0002350e] 204c                      movea.l    a4,a0
[00023510] 4eb9 0002 3584            jsr        set_string
[00023516] 204c                      movea.l    a4,a0
[00023518] 226c 000c                 movea.l    12(a4),a1
[0002351c] 4e91                      jsr        (a1)
[0002351e] 4a40                      tst.w      d0
[00023520] 670c                      beq.s      $0002352E
[00023522] 204c                      movea.l    a4,a0
[00023524] 4eb9 0002 35f4            jsr        term
[0002352a] 91c8                      suba.l     a0,a0
[0002352c] 6002                      bra.s      $00023530
[0002352e] 204c                      movea.l    a4,a0
[00023530] 584f                      addq.w     #4,a7
[00023532] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00023536] 4e75                      rts
st_service:
[00023538] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0002353c] 2448                      movea.l    a0,a2
[0002353e] 3600                      move.w     d0,d3
[00023540] 2849                      movea.l    a1,a4
[00023542] 2650                      movea.l    (a0),a3
[00023544] 5540                      subq.w     #2,d0
[00023546] 6708                      beq.s      $00023550
[00023548] 907c 270e                 sub.w      #$270E,d0
[0002354c] 6712                      beq.s      $00023560
[0002354e] 601e                      bra.s      $0002356E
[00023550] 204a                      movea.l    a2,a0
[00023552] 6100 fea2                 bsr        acc_string
[00023556] 204a                      movea.l    a2,a0
[00023558] 4eb9 0002 35f4            jsr        term
[0002355e] 601c                      bra.s      $0002357C
[00023560] 226b 0004                 movea.l    4(a3),a1
[00023564] 204a                      movea.l    a2,a0
[00023566] 4eb9 0001 60ea            jsr        new_name
[0002356c] 600e                      bra.s      $0002357C
[0002356e] 224c                      movea.l    a4,a1
[00023570] 3003                      move.w     d3,d0
[00023572] 204a                      movea.l    a2,a0
[00023574] 4eb9 0005 9dd0            jsr        Awi_service
[0002357a] 6002                      bra.s      $0002357E
[0002357c] 7001                      moveq.l    #1,d0
[0002357e] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00023582] 4e75                      rts
set_string:
[00023584] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00023588] 4fef ff00                 lea.l      -256(a7),a7
[0002358c] 2250                      movea.l    (a0),a1
[0002358e] 2468 0014                 movea.l    20(a0),a2
[00023592] 2069 0004                 movea.l    4(a1),a0
[00023596] 2668 0004                 movea.l    4(a0),a3
[0002359a] 204b                      movea.l    a3,a0
[0002359c] 4eb9 0008 2f6c            jsr        strlen
[000235a2] 2600                      move.l     d0,d3
[000235a4] b67c 00ff                 cmp.w      #$00FF,d3
[000235a8] 6f1c                      ble.s      $000235C6
[000235aa] 203c 0000 00ff            move.l     #$000000FF,d0
[000235b0] 43eb 00ff                 lea.l      255(a3),a1
[000235b4] 41d7                      lea.l      (a7),a0
[000235b6] 4eb9 0008 2fd6            jsr        strncpy
[000235bc] 422f 00ff                 clr.b      255(a7)
[000235c0] 363c 00ff                 move.w     #$00FF,d3
[000235c4] 6002                      bra.s      $000235C8
[000235c6] 4217                      clr.b      (a7)
[000235c8] 2f0b                      move.l     a3,-(a7)
[000235ca] 3f03                      move.w     d3,-(a7)
[000235cc] 43f9 000b 3df6            lea.l      $000B3DF6,a1
[000235d2] 7003                      moveq.l    #3,d0
[000235d4] 204a                      movea.l    a2,a0
[000235d6] 4eb9 0005 0f94            jsr        Aob_printf
[000235dc] 5c4f                      addq.w     #6,a7
[000235de] 43d7                      lea.l      (a7),a1
[000235e0] 7004                      moveq.l    #4,d0
[000235e2] 204a                      movea.l    a2,a0
[000235e4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000235ea] 4fef 0100                 lea.l      256(a7),a7
[000235ee] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[000235f2] 4e75                      rts
term:
[000235f4] 2f0a                      move.l     a2,-(a7)
[000235f6] 2f0b                      move.l     a3,-(a7)
[000235f8] 2448                      movea.l    a0,a2
[000235fa] 006a 0100 0056            ori.w      #$0100,86(a2)
[00023600] 2650                      movea.l    (a0),a3
[00023602] 226b 0004                 movea.l    4(a3),a1
[00023606] 42a9 0012                 clr.l      18(a1)
[0002360a] 302a 0056                 move.w     86(a2),d0
[0002360e] c07c 0800                 and.w      #$0800,d0
[00023612] 6716                      beq.s      $0002362A
[00023614] 43ea 002c                 lea.l      44(a2),a1
[00023618] 206b 0004                 movea.l    4(a3),a0
[0002361c] 41e8 003a                 lea.l      58(a0),a0
[00023620] 7008                      moveq.l    #8,d0
[00023622] 4eb9 0008 3500            jsr        memcpy
[00023628] 6014                      bra.s      $0002363E
[0002362a] 7008                      moveq.l    #8,d0
[0002362c] 43ea 0024                 lea.l      36(a2),a1
[00023630] 206b 0004                 movea.l    4(a3),a0
[00023634] 41e8 003a                 lea.l      58(a0),a0
[00023638] 4eb9 0008 3500            jsr        memcpy
[0002363e] 204b                      movea.l    a3,a0
[00023640] 4eb9 0004 c7c8            jsr        Ax_free
[00023646] 204a                      movea.l    a2,a0
[00023648] 4eb9 0005 8362            jsr        Awi_closed
[0002364e] 204a                      movea.l    a2,a0
[00023650] 4eb9 0005 85f2            jsr        Awi_delete
[00023656] 265f                      movea.l    (a7)+,a3
[00023658] 245f                      movea.l    (a7)+,a2
[0002365a] 4e75                      rts

	.data

TEXT_002:
[000b3a3a]                           dc.w $004f
[000b3a3c]                           dc.w $4b00
TEXT_004:
[000b3a3e]                           dc.b 'Abbruch',0
TEXT_01:
[000b3a46]                           dc.b ' Text-Editor ',0
TEXT_12:
[000b3a54]                           dc.b 'TEXT',0
[000b3a59]                           dc.b $00
[000b3a5a] 00064a22                  dc.l A_3Dbutton
[000b3a5e]                           dc.w $29c1
[000b3a60]                           dc.w $0178
[000b3a62] 000630f2                  dc.l Auo_string
[000b3a66] 000b3a3e                  dc.l TEXT_004
[000b3a6a]                           dc.w $0000
[000b3a6c]                           dc.w $0000
[000b3a6e]                           dc.w $0000
[000b3a70]                           dc.w $0000
[000b3a72]                           dc.w $0000
[000b3a74]                           dc.w $0000
[000b3a76]                           dc.w $0000
[000b3a78]                           dc.w $0000
A_3DBUTTON02:
[000b3a7a] 00064a22                  dc.l A_3Dbutton
[000b3a7e]                           dc.w $21f1
[000b3a80]                           dc.w $01f8
[000b3a82] 000630f2                  dc.l Auo_string
[000b3a86]                           dc.w $0000
[000b3a88]                           dc.w $0000
[000b3a8a]                           dc.w $0000
[000b3a8c]                           dc.w $0000
[000b3a8e]                           dc.w $0000
[000b3a90]                           dc.w $0000
[000b3a92]                           dc.w $0000
[000b3a94]                           dc.w $0000
[000b3a96]                           dc.w $0000
[000b3a98]                           dc.w $0000
A_3DBUTTON03:
[000b3a9a] 00064a22                  dc.l A_3Dbutton
[000b3a9e]                           dc.w $2011
[000b3aa0]                           dc.w $9178
[000b3aa2] 000630f2                  dc.l Auo_string
[000b3aa6]                           dc.w $0000
[000b3aa8]                           dc.w $0000
[000b3aaa]                           dc.w $0000
[000b3aac]                           dc.w $0000
[000b3aae]                           dc.w $0000
[000b3ab0]                           dc.w $0000
[000b3ab2]                           dc.w $0000
[000b3ab4]                           dc.w $0000
[000b3ab6]                           dc.w $0000
[000b3ab8]                           dc.w $0000
A_3DBUTTON05:
[000b3aba] 00064a22                  dc.l A_3Dbutton
[000b3abe]                           dc.w $29c1
[000b3ac0]                           dc.w $0178
[000b3ac2] 000630f2                  dc.l Auo_string
[000b3ac6] 000b3a3b                  dc.l TEXT_003
[000b3aca]                           dc.w $0000
[000b3acc]                           dc.w $0000
[000b3ace]                           dc.w $0000
[000b3ad0]                           dc.w $0000
[000b3ad2]                           dc.w $0000
[000b3ad4]                           dc.w $0000
[000b3ad6]                           dc.w $0000
[000b3ad8]                           dc.w $0000
A_BOXED01:
[000b3ada] 0006afea                  dc.l A_boxed
[000b3ade]                           dc.w $9000
[000b3ae0]                           dc.w $ff12
[000b3ae2] 0006a068                  dc.l Auo_boxed
[000b3ae6]                           dc.w $0000
[000b3ae8]                           dc.w $0000
[000b3aea]                           dc.w $0000
[000b3aec]                           dc.w $0000
[000b3aee]                           dc.w $0000
[000b3af0]                           dc.w $0000
[000b3af2]                           dc.w $0000
[000b3af4]                           dc.w $0000
[000b3af6]                           dc.w $0000
[000b3af8]                           dc.w $0000
_MSK_IC_STRING:
[000b3afa]                           dc.w $0000
[000b3afc]                           dc.w $0000
[000b3afe]                           dc.w $0000
[000b3b00]                           dc.w $0000
[000b3b02]                           dc.w $0000
[000b3b04]                           dc.w $0000
[000b3b06]                           dc.w $0000
[000b3b08]                           dc.w $0000
[000b3b0a]                           dc.w $0000
[000b3b0c]                           dc.w $0000
[000b3b0e]                           dc.w $0000
[000b3b10]                           dc.w $0000
[000b3b12]                           dc.w $0000
[000b3b14]                           dc.w $0000
[000b3b16]                           dc.w $0000
[000b3b18]                           dc.w $0000
[000b3b1a]                           dc.w $0000
[000b3b1c]                           dc.w $0000
[000b3b1e]                           dc.w $0000
[000b3b20]                           dc.w $0000
[000b3b22]                           dc.w $0000
[000b3b24]                           dc.w $0000
[000b3b26]                           dc.w $0000
[000b3b28]                           dc.w $0000
[000b3b2a]                           dc.w $0000
[000b3b2c]                           dc.w $0000
[000b3b2e]                           dc.w $0000
[000b3b30]                           dc.w $0000
[000b3b32]                           dc.w $0000
[000b3b34]                           dc.w $0000
[000b3b36]                           dc.w $1ffb
[000b3b38]                           dc.w $fb81
[000b3b3a]                           dc.w $dff8
[000b3b3c]                           dc.w $1ffb
[000b3b3e]                           dc.w $fb81
[000b3b40]                           dc.w $dff8
[000b3b42]                           dc.w $118b
[000b3b44]                           dc.w $09c3
[000b3b46]                           dc.w $9188
[000b3b48]                           dc.w $0183
[000b3b4a]                           dc.w $00e7
[000b3b4c]                           dc.w $0180
[000b3b4e]                           dc.w $0183
[000b3b50]                           dc.w $207e
[000b3b52]                           dc.w $0180
[000b3b54]                           dc.w $0183
[000b3b56]                           dc.w $e03c
[000b3b58]                           dc.w $0180
[000b3b5a]                           dc.w $0183
[000b3b5c]                           dc.w $e03c
[000b3b5e]                           dc.w $0180
[000b3b60]                           dc.w $0183
[000b3b62]                           dc.w $207e
[000b3b64]                           dc.w $0180
[000b3b66]                           dc.w $0183
[000b3b68]                           dc.w $00e7
[000b3b6a]                           dc.w $0180
[000b3b6c]                           dc.w $0183
[000b3b6e]                           dc.w $09c3
[000b3b70]                           dc.w $8180
[000b3b72]                           dc.w $03c3
[000b3b74]                           dc.w $fb81
[000b3b76]                           dc.w $c3c0
[000b3b78]                           dc.w $07e3
[000b3b7a]                           dc.w $fb81
[000b3b7c]                           dc.w $c7e0
[000b3b7e]                           dc.w $0000
[000b3b80]                           dc.w $0000
[000b3b82]                           dc.w $0000
[000b3b84]                           dc.w $0000
[000b3b86]                           dc.w $0000
[000b3b88]                           dc.w $0000
[000b3b8a]                           dc.w $0000
[000b3b8c]                           dc.w $0000
[000b3b8e]                           dc.w $0000
[000b3b90]                           dc.w $0000
[000b3b92]                           dc.w $0000
[000b3b94]                           dc.w $0000
[000b3b96]                           dc.w $0000
[000b3b98]                           dc.w $0000
[000b3b9a]                           dc.w $0000
[000b3b9c]                           dc.w $0000
[000b3b9e]                           dc.w $0000
[000b3ba0]                           dc.w $0000
[000b3ba2]                           dc.w $0000
[000b3ba4]                           dc.w $0000
[000b3ba6]                           dc.w $0000
_DAT_IC_STRING:
[000b3ba8]                           dc.w $0000
[000b3baa]                           dc.w $0000
[000b3bac]                           dc.w $0000
[000b3bae]                           dc.w $0000
[000b3bb0]                           dc.w $0000
[000b3bb2]                           dc.w $0000
[000b3bb4]                           dc.w $0000
[000b3bb6]                           dc.w $0000
[000b3bb8]                           dc.w $0000
[000b3bba]                           dc.w $0000
[000b3bbc]                           dc.w $0000
[000b3bbe]                           dc.w $0000
[000b3bc0]                           dc.w $0000
[000b3bc2]                           dc.w $0000
[000b3bc4]                           dc.w $0000
[000b3bc6]                           dc.w $0000
[000b3bc8]                           dc.w $0000
[000b3bca]                           dc.w $0000
[000b3bcc]                           dc.w $0000
[000b3bce]                           dc.w $0000
[000b3bd0]                           dc.w $0000
[000b3bd2]                           dc.w $0000
[000b3bd4]                           dc.w $0000
[000b3bd6]                           dc.w $0000
[000b3bd8]                           dc.w $0000
[000b3bda]                           dc.w $0000
[000b3bdc]                           dc.w $0000
[000b3bde]                           dc.w $0000
[000b3be0]                           dc.w $0000
[000b3be2]                           dc.w $0000
[000b3be4]                           dc.w $1ffb
[000b3be6]                           dc.w $fb81
[000b3be8]                           dc.w $dff8
[000b3bea]                           dc.w $1ffb
[000b3bec]                           dc.w $fb81
[000b3bee]                           dc.w $dff8
[000b3bf0]                           dc.w $118b
[000b3bf2]                           dc.w $09c3
[000b3bf4]                           dc.w $9188
[000b3bf6]                           dc.w $0183
[000b3bf8]                           dc.w $00e7
[000b3bfa]                           dc.w $0180
[000b3bfc]                           dc.w $0183
[000b3bfe]                           dc.w $207e
[000b3c00]                           dc.w $0180
[000b3c02]                           dc.w $0183
[000b3c04]                           dc.w $e03c
[000b3c06]                           dc.w $0180
[000b3c08]                           dc.w $0183
[000b3c0a]                           dc.w $e03c
[000b3c0c]                           dc.w $0180
[000b3c0e]                           dc.w $0183
[000b3c10]                           dc.w $207e
[000b3c12]                           dc.w $0180
[000b3c14]                           dc.w $0183
[000b3c16]                           dc.w $00e7
[000b3c18]                           dc.w $0180
[000b3c1a]                           dc.w $0183
[000b3c1c]                           dc.w $09c3
[000b3c1e]                           dc.w $8180
[000b3c20]                           dc.w $03c3
[000b3c22]                           dc.w $fb81
[000b3c24]                           dc.w $c3c0
[000b3c26]                           dc.w $07e3
[000b3c28]                           dc.w $fb81
[000b3c2a]                           dc.w $c7e0
[000b3c2c]                           dc.w $0000
[000b3c2e]                           dc.w $0000
[000b3c30]                           dc.w $0000
[000b3c32]                           dc.w $0000
[000b3c34]                           dc.w $0000
[000b3c36]                           dc.w $0000
[000b3c38]                           dc.w $0000
[000b3c3a]                           dc.w $0000
[000b3c3c]                           dc.w $0000
[000b3c3e]                           dc.w $0000
[000b3c40]                           dc.w $0000
[000b3c42]                           dc.w $0000
[000b3c44]                           dc.w $0000
[000b3c46]                           dc.w $0000
[000b3c48]                           dc.w $0000
[000b3c4a]                           dc.w $0000
[000b3c4c]                           dc.w $0000
[000b3c4e]                           dc.w $0000
[000b3c50]                           dc.w $0000
[000b3c52]                           dc.w $0000
[000b3c54]                           dc.w $0000
IC_STRING:
[000b3c56] 000b3afa                  dc.l _MSK_IC_STRING
[000b3c5a] 000b3ba8                  dc.l _DAT_IC_STRING
[000b3c5e] 000b3a54                  dc.l TEXT_12
[000b3c62]                           dc.w $1000
[000b3c64]                           dc.w $0000
[000b3c66]                           dc.w $0000
[000b3c68]                           dc.w $000c
[000b3c6a]                           dc.w $0000
[000b3c6c]                           dc.w $0030
[000b3c6e]                           dc.w $001d
[000b3c70]                           dc.w $0000
[000b3c72]                           dc.w $0020
[000b3c74]                           dc.w $0048
[000b3c76]                           dc.w $0008
[000b3c78]                           dc.w $0000
[000b3c7a]                           dc.w $0000
EDIT_STRING:
[000b3c7c]                           dc.w $ffff
[000b3c7e]                           dc.w $0001
[000b3c80]                           dc.w $0007
[000b3c82]                           dc.w $0018
[000b3c84]                           dc.w $0040
[000b3c86]                           dc.w $0010
[000b3c88] 000b3a7a                  dc.l A_3DBUTTON02
[000b3c8c]                           dc.w $0000
[000b3c8e]                           dc.w $0000
[000b3c90]                           dc.w $0034
[000b3c92]                           dc.w $0007
_01_EDIT_STRING:
[000b3c94]                           dc.w $0005
[000b3c96]                           dc.w $0002
[000b3c98]                           dc.w $0002
[000b3c9a]                           dc.w $0018
[000b3c9c]                           dc.w $0040
[000b3c9e]                           dc.w $0000
[000b3ca0] 000b3a9a                  dc.l A_3DBUTTON03
[000b3ca4]                           dc.w $0001
[000b3ca6]                           dc.w $0001
[000b3ca8]                           dc.w $0032
[000b3caa]                           dc.w $0002
_02_EDIT_STRING:
[000b3cac]                           dc.w $0001
[000b3cae]                           dc.w $0003
[000b3cb0]                           dc.w $0004
[000b3cb2]                           dc.w $0014
[000b3cb4]                           dc.w $0040
[000b3cb6]                           dc.w $0000
[000b3cb8]                           dc.w $00ff
[000b3cba]                           dc.w $0101
[000b3cbc]                           dc.w $0000
[000b3cbe]                           dc.w $0000
[000b3cc0]                           dc.w $0032
[000b3cc2]                           dc.w $0002
_03_EDIT_STRING:
[000b3cc4]                           dc.w $0004
[000b3cc6]                           dc.w $ffff
[000b3cc8]                           dc.w $ffff
[000b3cca]                           dc.w $0018
[000b3ccc]                           dc.w $0008
[000b3cce]                           dc.w $0000
[000b3cd0] 000b3ada                  dc.l A_BOXED01
[000b3cd4]                           dc.w $0000
[000b3cd6]                           dc.w $0000
[000b3cd8]                           dc.w $0032
[000b3cda]                           dc.w $0001
_04_EDIT_STRING:
[000b3cdc]                           dc.w $0002
[000b3cde]                           dc.w $ffff
[000b3ce0]                           dc.w $ffff
[000b3ce2]                           dc.w $0018
[000b3ce4]                           dc.w $0008
[000b3ce6]                           dc.w $0000
[000b3ce8] 000b3ada                  dc.l A_BOXED01
[000b3cec]                           dc.w $0000
[000b3cee]                           dc.w $0001
[000b3cf0]                           dc.w $0032
[000b3cf2]                           dc.w $0001
_05_EDIT_STRING:
[000b3cf4]                           dc.w $0007
[000b3cf6]                           dc.w $ffff
[000b3cf8]                           dc.w $ffff
[000b3cfa]                           dc.w $0018
[000b3cfc]                           dc.w $4007
[000b3cfe]                           dc.w $0010
[000b3d00] 000b3aba                  dc.l A_3DBUTTON05
[000b3d04]                           dc.w $000d
[000b3d06]                           dc.w $0004
[000b3d08]                           dc.w $000c
[000b3d0a]                           dc.w $0002
_05aEDIT_STRING:
[000b3d0c] 000233d4                  dc.l editstr_ok
[000b3d10]                           dc.w $0000
[000b3d12]                           dc.w $0000
[000b3d14]                           dc.w $8000
[000b3d16]                           dc.w $884f
[000b3d18]                           dc.w $0000
[000b3d1a]                           dc.w $0000
[000b3d1c]                           dc.w $0000
[000b3d1e]                           dc.w $0000
[000b3d20]                           dc.w $0000
[000b3d22]                           dc.w $0000
_07_EDIT_STRING:
[000b3d24]                           dc.w $0000
[000b3d26]                           dc.w $ffff
[000b3d28]                           dc.w $ffff
[000b3d2a]                           dc.w $0018
[000b3d2c]                           dc.w $4005
[000b3d2e]                           dc.w $0010
[000b3d30] 000b3a5a                  dc.l A_3DBUTTON01
[000b3d34]                           dc.w $001d
[000b3d36]                           dc.w $0004
[000b3d38]                           dc.w $000c
[000b3d3a]                           dc.w $0002
_07aEDIT_STRING:
[000b3d3c] 000233c2                  dc.l editstr_abort
[000b3d40]                           dc.w $0000
[000b3d42]                           dc.w $0000
[000b3d44]                           dc.w $8020
[000b3d46]                           dc.w $8841
[000b3d48]                           dc.w $0000
[000b3d4a]                           dc.w $0000
[000b3d4c]                           dc.w $0000
[000b3d4e]                           dc.w $0000
[000b3d50]                           dc.w $0000
[000b3d52]                           dc.w $0000
WI_STRING:
[000b3d54]                           dc.w $0000
[000b3d56]                           dc.w $0000
[000b3d58] 00023538                  dc.l st_service
[000b3d5c] 0002349e                  dc.l st_make
[000b3d60] 00057428                  dc.l Awi_open
[000b3d64] 00055e94                  dc.l Awi_init
[000b3d68] 000b3c7c                  dc.l EDIT_STRING
[000b3d6c]                           dc.w $0000
[000b3d6e]                           dc.w $0000
[000b3d70]                           dc.w $0000
[000b3d72]                           dc.w $0000
[000b3d74]                           dc.w $ffff
[000b3d76]                           dc.w $601f
[000b3d78]                           dc.w $0000
[000b3d7a]                           dc.w $0000
[000b3d7c]                           dc.w $0063
[000b3d7e]                           dc.w $0063
[000b3d80]                           dc.w $0000
[000b3d82]                           dc.w $0000
[000b3d84]                           dc.w $0000
[000b3d86]                           dc.w $0000
[000b3d88]                           dc.w $0000
[000b3d8a]                           dc.w $0000
[000b3d8c]                           dc.w $0000
[000b3d8e]                           dc.w $0000
[000b3d90]                           dc.w $ffff
[000b3d92]                           dc.w $ffff
[000b3d94]                           dc.w $ffff
[000b3d96]                           dc.w $ffff
[000b3d98]                           dc.w $0000
[000b3d9a]                           dc.w $0000
[000b3d9c]                           dc.w $fcf8
[000b3d9e] 000b3a46                  dc.l TEXT_01
[000b3da2] 000b3a3a                  dc.l TEXT_002
[000b3da6]                           dc.w $2710
[000b3da8]                           dc.w $0100
[000b3daa]                           dc.w $0000
[000b3dac]                           dc.w $ffff
[000b3dae] 000b3c56                  dc.l IC_STRING
[000b3db2]                           dc.w $0000
[000b3db4]                           dc.w $0000
[000b3db6] 0006b744                  dc.l Awi_keys
[000b3dba] 00051852                  dc.l Awi_obchange
[000b3dbe] 00051c46                  dc.l Awi_redraw
[000b3dc2] 000587a4                  dc.l Awi_topped
[000b3dc6] 00058362                  dc.l Awi_closed
[000b3dca] 000587ec                  dc.l Awi_fulled
[000b3dce] 0005217c                  dc.l Awi_arrowed
[000b3dd2] 000524b4                  dc.l Awi_hslid
[000b3dd6] 0005255e                  dc.l Awi_vslid
[000b3dda] 00058bb0                  dc.l Awi_sized
[000b3dde] 00058d50                  dc.l Awi_moved
[000b3de2] 0005998a                  dc.l Awi_iconify
[000b3de6] 00059c6c                  dc.l Awi_uniconify
[000b3dea] 0005b5b6                  dc.l Awi_gemscript
[000b3dee]                           dc.w $0000
[000b3df0]                           dc.w $0000
[000b3df2]                           dc.w $0000
[000b3df4]                           dc.w $0000

[000b3df6]                           dc.b '%-*s',0
[000b3dfb]                           dc.b $00
