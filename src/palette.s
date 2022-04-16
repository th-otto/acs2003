edmp_acc:
[00011f5e] 4fef ffd8                 lea.l      -40(a7),a7
[00011f62] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011f68] 2ea8 0258                 move.l     600(a0),(a7)
[00011f6c] 2057                      movea.l    (a7),a0
[00011f6e] 2f68 0014 0014            move.l     20(a0),20(a7)
[00011f74] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011f7a] 3f68 0260 0010            move.w     608(a0),16(a7)
[00011f80] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011f86] 2f68 0240 0004            move.l     576(a0),4(a7)
[00011f8c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00011f92] 4268 0248                 clr.w      584(a0)
[00011f96] 4eb9 0004 7e2a            jsr        Adr_next
[00011f9c] 3f40 0012                 move.w     d0,18(a7)
[00011fa0] 6f00 0122                 ble        edmp_acc_1
[00011fa4] 322f 0012                 move.w     18(a7),d1
[00011fa8] 48c1                      ext.l      d1
[00011faa] 2001                      move.l     d1,d0
[00011fac] d080                      add.l      d0,d0
[00011fae] d081                      add.l      d1,d0
[00011fb0] e788                      lsl.l      #3,d0
[00011fb2] 206f 0004                 movea.l    4(a7),a0
[00011fb6] 2068 0014                 movea.l    20(a0),a0
[00011fba] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00011fbe] 2f48 0020                 move.l     a0,32(a7)
[00011fc2] 206f 0020                 movea.l    32(a7),a0
[00011fc6] 0c68 2722 0016            cmpi.w     #0x2722,22(a0)
[00011fcc] 670e                      beq.s      edmp_acc_2
[00011fce] 206f 0020                 movea.l    32(a7),a0
[00011fd2] 0c68 2723 0016            cmpi.w     #0x2723,22(a0)
[00011fd8] 6600 00ea                 bne        edmp_acc_1
edmp_acc_2:
[00011fdc] 322f 0010                 move.w     16(a7),d1
[00011fe0] 48c1                      ext.l      d1
[00011fe2] 2001                      move.l     d1,d0
[00011fe4] d080                      add.l      d0,d0
[00011fe6] d081                      add.l      d1,d0
[00011fe8] e788                      lsl.l      #3,d0
[00011fea] 206f 0014                 movea.l    20(a7),a0
[00011fee] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00011ff2] 2f48 001c                 move.l     a0,28(a7)
[00011ff6] 302f 0012                 move.w     18(a7),d0
[00011ffa] 206f 0004                 movea.l    4(a7),a0
[00011ffe] 4eb9 0004 7f76            jsr        Adr_del
[00012004] 2057                      movea.l    (a7),a0
[00012006] 2f50 0024                 move.l     (a0),36(a7)
[0001200a] 206f 0020                 movea.l    32(a7),a0
[0001200e] 0c68 2722 0016            cmpi.w     #0x2722,22(a0)
[00012014] 6618                      bne.s      edmp_acc_3
[00012016] 206f 0020                 movea.l    32(a7),a0
[0001201a] 2268 000c                 movea.l    12(a0),a1
[0001201e] 206f 0024                 movea.l    36(a7),a0
[00012022] 4eb9 0003 58c2            jsr        add_mouse
[00012028] 2f48 0018                 move.l     a0,24(a7)
[0001202c] 6030                      bra.s      edmp_acc_4
edmp_acc_3:
[0001202e] 206f 0020                 movea.l    32(a7),a0
[00012032] 2f68 000c 0008            move.l     12(a0),8(a7)
[00012038] 206f 0008                 movea.l    8(a7),a0
[0001203c] 0c50 00ff                 cmpi.w     #0x00FF,(a0)
[00012040] 6618                      bne.s      edmp_acc_5
[00012042] 206f 0008                 movea.l    8(a7),a0
[00012046] 2268 0002                 movea.l    2(a0),a1
[0001204a] 206f 0024                 movea.l    36(a7),a0
[0001204e] 4eb9 0003 58c2            jsr        add_mouse
[00012054] 2f48 0018                 move.l     a0,24(a7)
[00012058] 6004                      bra.s      edmp_acc_4
edmp_acc_5:
[0001205a] 42af 0018                 clr.l      24(a7)
edmp_acc_4:
[0001205e] 206f 001c                 movea.l    28(a7),a0
[00012062] 2f68 000c 000c            move.l     12(a0),12(a7)
[00012068] 206f 000c                 movea.l    12(a7),a0
[0001206c] 0c50 00ff                 cmpi.w     #0x00FF,(a0)
[00012070] 6612                      bne.s      edmp_acc_6
[00012072] 206f 000c                 movea.l    12(a7),a0
[00012076] 2268 0002                 movea.l    2(a0),a1
[0001207a] 206f 0024                 movea.l    36(a7),a0
[0001207e] 4eb9 0003 598a            jsr        del_mouse
edmp_acc_6:
[00012084] 202f 0018                 move.l     24(a7),d0
[00012088] 6714                      beq.s      edmp_acc_7
[0001208a] 206f 000c                 movea.l    12(a7),a0
[0001208e] 30bc 00ff                 move.w     #0x00FF,(a0)
[00012092] 206f 000c                 movea.l    12(a7),a0
[00012096] 216f 0018 0002            move.l     24(a7),2(a0)
[0001209c] 6012                      bra.s      edmp_acc_8
edmp_acc_7:
[0001209e] 206f 0008                 movea.l    8(a7),a0
[000120a2] 226f 000c                 movea.l    12(a7),a1
[000120a6] 3290                      move.w     (a0),(a1)
[000120a8] 206f 000c                 movea.l    12(a7),a0
[000120ac] 42a8 0002                 clr.l      2(a0)
edmp_acc_8:
[000120b0] 2057                      movea.l    (a7),a0
[000120b2] 4eb9 0001 2254            jsr        set_mouse
[000120b8] 302f 0010                 move.w     16(a7),d0
[000120bc] 2057                      movea.l    (a7),a0
[000120be] 4eb9 0005 1b80            jsr        Awi_obredraw
edmp_acc_1:
[000120c4] 4fef 0028                 lea.l      40(a7),a7
[000120c8] 4e75                      rts

edmp_set:
[000120ca] 4fef fff4                 lea.l      -12(a7),a7
[000120ce] 2079 0010 ee4e            movea.l    ACSblk,a0
[000120d4] 3228 0260                 move.w     608(a0),d1
[000120d8] 48c1                      ext.l      d1
[000120da] 2001                      move.l     d1,d0
[000120dc] d080                      add.l      d0,d0
[000120de] d081                      add.l      d1,d0
[000120e0] e788                      lsl.l      #3,d0
[000120e2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000120e8] 2068 025c                 movea.l    604(a0),a0
[000120ec] 41f0 0818                 lea.l      24(a0,d0.l),a0
[000120f0] 2f48 0008                 move.l     a0,8(a7)
[000120f4] 206f 0008                 movea.l    8(a7),a0
[000120f8] 2f68 000c 0004            move.l     12(a0),4(a7)
[000120fe] 206f 0004                 movea.l    4(a7),a0
[00012102] 2279 0010 ee4e            movea.l    ACSblk,a1
[00012108] 2269 023c                 movea.l    572(a1),a1
[0001210c] 3350 00f2                 move.w     (a0),242(a1)
[00012110] 206f 0004                 movea.l    4(a7),a0
[00012114] 0c50 00ff                 cmpi.w     #0x00FF,(a0)
[00012118] 662e                      bne.s      edmp_set_1
[0001211a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00012120] 2068 023c                 movea.l    572(a0),a0
[00012124] 217c 000e 76ce 00f4       move.l     #formtest,244(a0)
[0001212c] 206f 0004                 movea.l    4(a7),a0
[00012130] 2068 0002                 movea.l    2(a0),a0
[00012134] 2ea8 0004                 move.l     4(a0),(a7)
[00012138] 704a                      moveq.l    #74,d0
[0001213a] 2257                      movea.l    (a7),a1
[0001213c] 41f9 000e 76ce            lea.l      formtest,a0
[00012142] 4eb9 0008 3500            jsr        memcpy
edmp_set_1:
[00012148] 4fef 000c                 lea.l      12(a7),a7
[0001214c] 4e75                      rts

mp_make:
[0001214e] 4fef ff74                 lea.l      -140(a7),a7
[00012152] 2f48 0088                 move.l     a0,136(a7)
[00012156] 2f6f 0088 0084            move.l     136(a7),132(a7)
[0001215c] 206f 0084                 movea.l    132(a7),a0
[00012160] 2028 0144                 move.l     324(a0),d0
[00012164] 671a                      beq.s      mp_make_1
[00012166] 206f 0084                 movea.l    132(a7),a0
[0001216a] 2068 0144                 movea.l    324(a0),a0
[0001216e] 4eb9 0005 6bea            jsr        Awi_show
[00012174] 206f 0084                 movea.l    132(a7),a0
[00012178] 2068 0144                 movea.l    324(a0),a0
[0001217c] 6000 0092                 bra        mp_make_2
mp_make_1:
[00012180] 1ebc 0020                 move.b     #0x20,(a7)
[00012184] 206f 0084                 movea.l    132(a7),a0
[00012188] 2268 0008                 movea.l    8(a0),a1
[0001218c] 41ef 0001                 lea.l      1(a7),a0
[00012190] 4eb9 0008 2f0c            jsr        strcpy
[00012196] 41d7                      lea.l      (a7),a0
[00012198] 23c8 0008 754a            move.l     a0,WI_PALETTE+78
[0001219e] 41f9 0008 74fc            lea.l      WI_PALETTE,a0
[000121a4] 4eb9 0005 7052            jsr        Awi_create
[000121aa] 2f48 0080                 move.l     a0,128(a7)
[000121ae] 6604                      bne.s      mp_make_3
[000121b0] 91c8                      suba.l     a0,a0
[000121b2] 605c                      bra.s      mp_make_2
mp_make_3:
[000121b4] 206f 0084                 movea.l    132(a7),a0
[000121b8] 4868 0168                 pea.l      360(a0)
[000121bc] 226f 0088                 movea.l    136(a7),a1
[000121c0] 43e9 0154                 lea.l      340(a1),a1
[000121c4] 206f 0084                 movea.l    132(a7),a0
[000121c8] 4eb9 0001 6372            jsr        wi_pos
[000121ce] 584f                      addq.w     #4,a7
[000121d0] 206f 0080                 movea.l    128(a7),a0
[000121d4] 20af 0084                 move.l     132(a7),(a0)
[000121d8] 206f 0084                 movea.l    132(a7),a0
[000121dc] 216f 0080 0144            move.l     128(a7),324(a0)
[000121e2] 206f 0080                 movea.l    128(a7),a0
[000121e6] 4eb9 0001 2254            jsr        set_mouse
[000121ec] 206f 0080                 movea.l    128(a7),a0
[000121f0] 226f 0080                 movea.l    128(a7),a1
[000121f4] 2269 000c                 movea.l    12(a1),a1
[000121f8] 4e91                      jsr        (a1)
[000121fa] 4a40                      tst.w      d0
[000121fc] 670e                      beq.s      mp_make_4
[000121fe] 206f 0080                 movea.l    128(a7),a0
[00012202] 4eb9 0001 24e4            jsr        term
[00012208] 91c8                      suba.l     a0,a0
[0001220a] 6004                      bra.s      mp_make_2
mp_make_4:
[0001220c] 206f 0080                 movea.l    128(a7),a0
mp_make_2:
[00012210] 4fef 008c                 lea.l      140(a7),a7
[00012214] 4e75                      rts

mp_service:
[00012216] 4fef fff6                 lea.l      -10(a7),a7
[0001221a] 2f48 0006                 move.l     a0,6(a7)
[0001221e] 3f40 0004                 move.w     d0,4(a7)
[00012222] 2e89                      move.l     a1,(a7)
[00012224] 302f 0004                 move.w     4(a7),d0
[00012228] 5540                      subq.w     #2,d0
[0001222a] 6702                      beq.s      mp_service_1
[0001222c] 600c                      bra.s      mp_service_2
mp_service_1:
[0001222e] 206f 0006                 movea.l    6(a7),a0
[00012232] 4eb9 0001 24e4            jsr        term
[00012238] 6012                      bra.s      mp_service_3
mp_service_2:
[0001223a] 2257                      movea.l    (a7),a1
[0001223c] 302f 0004                 move.w     4(a7),d0
[00012240] 206f 0006                 movea.l    6(a7),a0
[00012244] 4eb9 0005 9dd0            jsr        Awi_service
[0001224a] 6002                      bra.s      mp_service_4
mp_service_3:
[0001224c] 7001                      moveq.l    #1,d0
mp_service_4:
[0001224e] 4fef 000a                 lea.l      10(a7),a7
[00012252] 4e75                      rts

set_mouse:
[00012254] 4fef ffda                 lea.l      -38(a7),a7
[00012258] 2f48 0022                 move.l     a0,34(a7)
[0001225c] 206f 0022                 movea.l    34(a7),a0
[00012260] 2f50 001e                 move.l     (a0),30(a7)
[00012264] 206f 0022                 movea.l    34(a7),a0
[00012268] 2f68 0014 0016            move.l     20(a0),22(a7)
[0001226e] 206f 0016                 movea.l    22(a7),a0
[00012272] 41e8 0018                 lea.l      24(a0),a0
[00012276] 2f48 0012                 move.l     a0,18(a7)
[0001227a] 4297                      clr.l      (a7)
[0001227c] 206f 001e                 movea.l    30(a7),a0
[00012280] 41e8 0084                 lea.l      132(a0),a0
[00012284] 2f48 0006                 move.l     a0,6(a7)
[00012288] 206f 0016                 movea.l    22(a7),a0
[0001228c] 3f68 0002 0004            move.w     2(a0),4(a7)
[00012292] 6000 0242                 bra        set_mouse_1
[00012296] 322f 0004                 move.w     4(a7),d1
set_mouse_13:
[0001229a] 48c1                      ext.l      d1
[0001229c] 2001                      move.l     d1,d0
[0001229e] d080                      add.l      d0,d0
[000122a0] d081                      add.l      d1,d0
[000122a2] e788                      lsl.l      #3,d0
[000122a4] 206f 0016                 movea.l    22(a7),a0
[000122a8] 31bc 0010 0814            move.w     #16,20(a0,d0.l)
[000122ae] 322f 0004                 move.w     4(a7),d1
[000122b2] 48c1                      ext.l      d1
[000122b4] 2001                      move.l     d1,d0
[000122b6] d080                      add.l      d0,d0
[000122b8] d081                      add.l      d1,d0
[000122ba] e788                      lsl.l      #3,d0
[000122bc] 206f 0016                 movea.l    22(a7),a0
[000122c0] 31bc 0014 0816            move.w     #20,22(a0,d0.l)
[000122c6] 322f 0004                 move.w     4(a7),d1
[000122ca] 48c1                      ext.l      d1
[000122cc] 2001                      move.l     d1,d0
[000122ce] d080                      add.l      d0,d0
[000122d0] d081                      add.l      d1,d0
[000122d2] e788                      lsl.l      #3,d0
[000122d4] 206f 0016                 movea.l    22(a7),a0
[000122d8] 2f70 080c 000e            move.l     12(a0,d0.l),14(a7)
[000122de] 206f 000e                 movea.l    14(a7),a0
[000122e2] 317c 1000 000c            move.w     #0x1000,12(a0)
[000122e8] 206f 000e                 movea.l    14(a7),a0
[000122ec] 4268 001a                 clr.w      26(a0)
[000122f0] 206f 000e                 movea.l    14(a7),a0
[000122f4] 317c 0012 001c            move.w     #18,28(a0)
[000122fa] 206f 000e                 movea.l    14(a7),a0
[000122fe] 317c 0010 001e            move.w     #16,30(a0)
[00012304] 206f 000e                 movea.l    14(a7),a0
[00012308] 317c 0002 0020            move.w     #2,32(a0)
[0001230e] 322f 0004                 move.w     4(a7),d1
[00012312] 48c1                      ext.l      d1
[00012314] 2001                      move.l     d1,d0
[00012316] d080                      add.l      d0,d0
[00012318] d081                      add.l      d1,d0
[0001231a] e788                      lsl.l      #3,d0
[0001231c] 206f 0012                 movea.l    18(a7),a0
[00012320] 21af 0006 080c            move.l     6(a7),12(a0,d0.l)
[00012326] 322f 0004                 move.w     4(a7),d1
[0001232a] 48c1                      ext.l      d1
[0001232c] 2001                      move.l     d1,d0
[0001232e] d080                      add.l      d0,d0
[00012330] d081                      add.l      d1,d0
[00012332] e788                      lsl.l      #3,d0
[00012334] 206f 0012                 movea.l    18(a7),a0
[00012338] 2197 0810                 move.l     (a7),16(a0,d0.l)
[0001233c] 5297                      addq.l     #1,(a7)
[0001233e] 322f 0004                 move.w     4(a7),d1
[00012342] 48c1                      ext.l      d1
[00012344] 2001                      move.l     d1,d0
[00012346] d080                      add.l      d0,d0
[00012348] d081                      add.l      d1,d0
[0001234a] e788                      lsl.l      #3,d0
[0001234c] 206f 0012                 movea.l    18(a7),a0
[00012350] 31bc 2723 0816            move.w     #0x2723,22(a0,d0.l)
[00012356] 206f 0006                 movea.l    6(a7),a0
[0001235a] 3010                      move.w     (a0),d0
[0001235c] b07c 0004                 cmp.w      #4,d0
[00012360] 6700 009e                 beq        set_mouse_2
[00012364] 6e14                      bgt.s      set_mouse_3
[00012366] 4a40                      tst.w      d0
[00012368] 672e                      beq.s      set_mouse_4
[0001236a] 5340                      subq.w     #1,d0
[0001236c] 6744                      beq.s      set_mouse_5
[0001236e] 5340                      subq.w     #1,d0
[00012370] 675a                      beq.s      set_mouse_6
[00012372] 5340                      subq.w     #1,d0
[00012374] 6770                      beq.s      set_mouse_7
[00012376] 6000 0142                 bra        set_mouse_8
set_mouse_3:
[0001237a] 5b40                      subq.w     #5,d0
[0001237c] 6700 009c                 beq        set_mouse_9
[00012380] 5340                      subq.w     #1,d0
[00012382] 6700 00b0                 beq        set_mouse_10
[00012386] 5340                      subq.w     #1,d0
[00012388] 6700 00c2                 beq        set_mouse_11
[0001238c] 907c 00f8                 sub.w      #0x00F8,d0
[00012390] 6700 00d2                 beq        set_mouse_12
[00012394] 6000 0124                 bra        set_mouse_8
set_mouse_4:
[00012398] 206f 000e                 movea.l    14(a7),a0
[0001239c] 20b9 0008 6bdc            move.l     MO_ARROW,(a0)
[000123a2] 206f 000e                 movea.l    14(a7),a0
[000123a6] 2179 0008 6be0 0004       move.l     MO_ARROW+4,4(a0)
[000123ae] 6000 010a                 bra        set_mouse_8
set_mouse_5:
[000123b2] 206f 000e                 movea.l    14(a7),a0
[000123b6] 20b9 0008 6dda            move.l     MO_TEXT_CRSR,(a0)
[000123bc] 206f 000e                 movea.l    14(a7),a0
[000123c0] 2179 0008 6dde 0004       move.l     MO_TEXT_CRSR+4,4(a0)
[000123c8] 6000 00f0                 bra        set_mouse_8
set_mouse_6:
[000123cc] 206f 000e                 movea.l    14(a7),a0
[000123d0] 20b9 0008 6c42            move.l     MO_BUSYBEE,(a0)
[000123d6] 206f 000e                 movea.l    14(a7),a0
[000123da] 2179 0008 6c46 0004       move.l     MO_BUSYBEE+4,4(a0)
[000123e2] 6000 00d6                 bra        set_mouse_8
set_mouse_7:
[000123e6] 206f 000e                 movea.l    14(a7),a0
[000123ea] 20b9 0008 6d74            move.l     MO_POINT_HAND,(a0)
[000123f0] 206f 000e                 movea.l    14(a7),a0
[000123f4] 2179 0008 6d78 0004       move.l     MO_POINT_HAND+4,4(a0)
[000123fc] 6000 00bc                 bra        set_mouse_8
set_mouse_2:
[00012400] 206f 000e                 movea.l    14(a7),a0
[00012404] 20b9 0008 6ca8            move.l     MO_FLAT_HAND,(a0)
[0001240a] 206f 000e                 movea.l    14(a7),a0
[0001240e] 2179 0008 6cac 0004       move.l     MO_FLAT_HAND+4,4(a0)
[00012416] 6000 00a2                 bra        set_mouse_8
set_mouse_9:
[0001241a] 206f 000e                 movea.l    14(a7),a0
[0001241e] 20b9 0008 6ea6            move.l     MO_THIN_CROSS,(a0)
[00012424] 206f 000e                 movea.l    14(a7),a0
[00012428] 2179 0008 6eaa 0004       move.l     MO_THIN_CROSS+4,4(a0)
[00012430] 6000 0088                 bra        set_mouse_8
set_mouse_10:
[00012434] 206f 000e                 movea.l    14(a7),a0
[00012438] 20b9 0008 6e40            move.l     MO_THICK_CROSS,(a0)
[0001243e] 206f 000e                 movea.l    14(a7),a0
[00012442] 2179 0008 6e44 0004       move.l     MO_THICK_CROSS+4,4(a0)
[0001244a] 606e                      bra.s      set_mouse_8
set_mouse_11:
[0001244c] 206f 000e                 movea.l    14(a7),a0
[00012450] 20b9 0008 6d0e            move.l     MO_OUTL_CROSS,(a0)
[00012456] 206f 000e                 movea.l    14(a7),a0
[0001245a] 2179 0008 6d12 0004       move.l     MO_OUTL_CROSS+4,4(a0)
[00012462] 6056                      bra.s      set_mouse_8
set_mouse_12:
[00012464] 206f 0006                 movea.l    6(a7),a0
[00012468] 2f68 0002 001a            move.l     2(a0),26(a7)
[0001246e] 206f 001a                 movea.l    26(a7),a0
[00012472] 2f68 0004 000a            move.l     4(a0),10(a7)
[00012478] 206f 000a                 movea.l    10(a7),a0
[0001247c] 3028 0008                 move.w     8(a0),d0
[00012480] 720c                      moveq.l    #12,d1
[00012482] e368                      lsl.w      d1,d0
[00012484] 720f                      moveq.l    #15,d1
[00012486] 206f 000a                 movea.l    10(a7),a0
[0001248a] c268 0006                 and.w      6(a0),d1
[0001248e] e149                      lsl.w      #8,d1
[00012490] 8041                      or.w       d1,d0
[00012492] 206f 000e                 movea.l    14(a7),a0
[00012496] 3140 000c                 move.w     d0,12(a0)
[0001249a] 206f 000a                 movea.l    10(a7),a0
[0001249e] 41e8 000a                 lea.l      10(a0),a0
[000124a2] 226f 000e                 movea.l    14(a7),a1
[000124a6] 2288                      move.l     a0,(a1)
[000124a8] 206f 000a                 movea.l    10(a7),a0
[000124ac] 41e8 002a                 lea.l      42(a0),a0
[000124b0] 226f 000e                 movea.l    14(a7),a1
[000124b4] 2348 0004                 move.l     a0,4(a1)
[000124b8] 4e71                      nop
set_mouse_8:
[000124ba] 5caf 0006                 addq.l     #6,6(a7)
[000124be] 322f 0004                 move.w     4(a7),d1
[000124c2] 48c1                      ext.l      d1
[000124c4] 2001                      move.l     d1,d0
[000124c6] d080                      add.l      d0,d0
[000124c8] d081                      add.l      d1,d0
[000124ca] e788                      lsl.l      #3,d0
[000124cc] 206f 0016                 movea.l    22(a7),a0
[000124d0] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
set_mouse_1:
[000124d6] 302f 0004                 move.w     4(a7),d0
[000124da] 6600 fdba                 bne        set_mouse_13
[000124de] 4fef 0026                 lea.l      38(a7),a7
[000124e2] 4e75                      rts

term:
[000124e4] 514f                      subq.w     #8,a7
[000124e6] 2f48 0004                 move.l     a0,4(a7)
[000124ea] 206f 0004                 movea.l    4(a7),a0
[000124ee] 2e90                      move.l     (a0),(a7)
[000124f0] 206f 0004                 movea.l    4(a7),a0
[000124f4] 3028 0056                 move.w     86(a0),d0
[000124f8] c07c 0800                 and.w      #0x0800,d0
[000124fc] 6718                      beq.s      term_1
[000124fe] 7008                      moveq.l    #8,d0
[00012500] 226f 0004                 movea.l    4(a7),a1
[00012504] 43e9 002c                 lea.l      44(a1),a1
[00012508] 2057                      movea.l    (a7),a0
[0001250a] 41e8 0154                 lea.l      340(a0),a0
[0001250e] 4eb9 0008 3500            jsr        memcpy
[00012514] 6016                      bra.s      term_2
term_1:
[00012516] 7008                      moveq.l    #8,d0
[00012518] 226f 0004                 movea.l    4(a7),a1
[0001251c] 43e9 0024                 lea.l      36(a1),a1
[00012520] 2057                      movea.l    (a7),a0
[00012522] 41e8 0154                 lea.l      340(a0),a0
[00012526] 4eb9 0008 3500            jsr        memcpy
term_2:
[0001252c] 206f 0004                 movea.l    4(a7),a0
[00012530] 4eb9 0005 85f2            jsr        Awi_delete
[00012536] 2057                      movea.l    (a7),a0
[00012538] 42a8 0144                 clr.l      324(a0)
[0001253c] 504f                      addq.w     #8,a7
[0001253e] 4e75                      rts

edbh_wi:
[00012540] 4fef ffea                 lea.l      -22(a7),a7
[00012544] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001254a] 2f68 0258 0004            move.l     600(a0),4(a7)
[00012550] 206f 0004                 movea.l    4(a7),a0
[00012554] 2ea8 0014                 move.l     20(a0),(a7)
[00012558] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001255e] 2f68 0240 000a            move.l     576(a0),10(a7)
[00012564] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001256a] 4268 0248                 clr.w      584(a0)
[0001256e] 4eb9 0004 7e2a            jsr        Adr_next
[00012574] 3f40 0008                 move.w     d0,8(a7)
[00012578] 6f00 0084                 ble        edbh_wi_1
[0001257c] 322f 0008                 move.w     8(a7),d1
[00012580] 48c1                      ext.l      d1
[00012582] 2001                      move.l     d1,d0
[00012584] d080                      add.l      d0,d0
[00012586] d081                      add.l      d1,d0
[00012588] e788                      lsl.l      #3,d0
[0001258a] 206f 000a                 movea.l    10(a7),a0
[0001258e] 2068 0014                 movea.l    20(a0),a0
[00012592] 41f0 0818                 lea.l      24(a0,d0.l),a0
[00012596] 2f48 0012                 move.l     a0,18(a7)
[0001259a] 206f 0012                 movea.l    18(a7),a0
[0001259e] 0c68 2717 0016            cmpi.w     #0x2717,22(a0)
[000125a4] 6658                      bne.s      edbh_wi_1
[000125a6] 206f 0012                 movea.l    18(a7),a0
[000125aa] 2f68 000c 000e            move.l     12(a0),14(a7)
[000125b0] 226f 000e                 movea.l    14(a7),a1
[000125b4] 43e9 0016                 lea.l      22(a1),a1
[000125b8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000125be] 3028 0260                 move.w     608(a0),d0
[000125c2] 2057                      movea.l    (a7),a0
[000125c4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000125ca] 4eb9 0005 1388            jsr        Awi_diaend
[000125d0] 72ff                      moveq.l    #-1,d1
[000125d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000125d8] 3028 0260                 move.w     608(a0),d0
[000125dc] 206f 0004                 movea.l    4(a7),a0
[000125e0] 226f 0004                 movea.l    4(a7),a1
[000125e4] 2269 0066                 movea.l    102(a1),a1
[000125e8] 4e91                      jsr        (a1)
[000125ea] 4eb9 0005 147c            jsr        Awi_diastart
[000125f0] 302f 0008                 move.w     8(a7),d0
[000125f4] 206f 000a                 movea.l    10(a7),a0
[000125f8] 4eb9 0004 7f76            jsr        Adr_del
edbh_wi_1:
[000125fe] 4fef 0016                 lea.l      22(a7),a7
[00012602] 4e75                      rts

	.data

TEXT_002:
[00086968]                           dc.w $0020
[0008696a]                           dc.b 'Palette ',0
TEXT_217:
[00086973]                           dc.b 'PALETTE',0
[0008697b]                           dc.b $00
[0008697c] 00064a22                  dc.l A_3Dbutton
[00086980]                           dc.w $21f1
[00086982]                           dc.w $01f8
[00086984] 000630f2                  dc.l Auo_string
[00086988]                           dc.w $0000
[0008698a]                           dc.w $0000
[0008698c]                           dc.w $0000
[0008698e]                           dc.w $0000
[00086990]                           dc.w $0000
[00086992]                           dc.w $0000
[00086994]                           dc.w $0000
[00086996]                           dc.w $0000
[00086998]                           dc.w $0000
[0008699a]                           dc.w $0000
_MSK_IC_PALETTE:
[0008699c]                           dc.w $ffff
[0008699e]                           dc.w $ffff
[000869a0]                           dc.w $fffc
[000869a2]                           dc.w $ffff
[000869a4]                           dc.w $ffff
[000869a6]                           dc.w $fffe
[000869a8]                           dc.w $ffff
[000869aa]                           dc.w $ffff
[000869ac]                           dc.w $ffff
[000869ae]                           dc.w $ffff
[000869b0]                           dc.w $ffff
[000869b2]                           dc.w $ffff
[000869b4]                           dc.w $ffff
[000869b6]                           dc.w $ffff
[000869b8]                           dc.w $ffff
[000869ba]                           dc.w $ffff
[000869bc]                           dc.w $ffff
[000869be]                           dc.w $ffff
[000869c0]                           dc.w $ffff
[000869c2]                           dc.w $ffff
[000869c4]                           dc.w $ffff
[000869c6]                           dc.w $ffff
[000869c8]                           dc.w $ffff
[000869ca]                           dc.w $ffff
[000869cc]                           dc.w $ffff
[000869ce]                           dc.w $ffff
[000869d0]                           dc.w $ffff
[000869d2]                           dc.w $ffff
[000869d4]                           dc.w $ffff
[000869d6]                           dc.w $ffff
[000869d8]                           dc.w $ffff
[000869da]                           dc.w $ffff
[000869dc]                           dc.w $ffff
[000869de]                           dc.w $ffff
[000869e0]                           dc.w $ffff
[000869e2]                           dc.w $ffff
[000869e4]                           dc.w $ffff
[000869e6]                           dc.w $ffff
[000869e8]                           dc.w $ffff
[000869ea]                           dc.w $ffff
[000869ec]                           dc.w $ffff
[000869ee]                           dc.w $ffff
[000869f0]                           dc.w $ffff
[000869f2]                           dc.w $ffff
[000869f4]                           dc.w $ffff
[000869f6]                           dc.w $ffff
[000869f8]                           dc.w $ffff
[000869fa]                           dc.w $ffff
[000869fc]                           dc.w $ffff
[000869fe]                           dc.w $ffff
[00086a00]                           dc.w $ffff
[00086a02]                           dc.w $ffff
[00086a04]                           dc.w $ffff
[00086a06]                           dc.w $ffff
[00086a08]                           dc.w $ffff
[00086a0a]                           dc.w $ffff
[00086a0c]                           dc.w $ffff
[00086a0e]                           dc.w $ffff
[00086a10]                           dc.w $ffff
[00086a12]                           dc.w $ffff
[00086a14]                           dc.w $ffff
[00086a16]                           dc.w $ffff
[00086a18]                           dc.w $ffff
[00086a1a]                           dc.w $ffff
[00086a1c]                           dc.w $ffff
[00086a1e]                           dc.w $ffff
[00086a20]                           dc.w $ffff
[00086a22]                           dc.w $ffff
[00086a24]                           dc.w $ffff
[00086a26]                           dc.w $ffff
[00086a28]                           dc.w $ffff
[00086a2a]                           dc.w $ffff
[00086a2c]                           dc.w $ffff
[00086a2e]                           dc.w $ffff
[00086a30]                           dc.w $ffff
[00086a32]                           dc.w $ffff
[00086a34]                           dc.w $ffff
[00086a36]                           dc.w $ffff
[00086a38]                           dc.w $ffff
[00086a3a]                           dc.w $ffff
[00086a3c]                           dc.w $ffff
[00086a3e]                           dc.w $ffff
[00086a40]                           dc.w $ffff
[00086a42]                           dc.w $ffff
[00086a44]                           dc.w $ffff
[00086a46]                           dc.w $ffff
[00086a48]                           dc.w $ffff
[00086a4a]                           dc.w $7fff
[00086a4c]                           dc.w $ffff
[00086a4e]                           dc.w $ffff
[00086a50]                           dc.w $3fff
[00086a52]                           dc.w $ffff
[00086a54]                           dc.w $ffff
_DAT_IC_PALETTE:
[00086a56]                           dc.w $ffff
[00086a58]                           dc.w $ffff
[00086a5a]                           dc.w $fffc
[00086a5c]                           dc.w $8001
[00086a5e]                           dc.w $0002
[00086a60]                           dc.w $0006
[00086a62]                           dc.w $8801
[00086a64]                           dc.w $20e2
[00086a66]                           dc.w $6007
[00086a68]                           dc.w $8c01
[00086a6a]                           dc.w $5912
[00086a6c]                           dc.w $9b07
[00086a6e]                           dc.w $8e01
[00086a70]                           dc.w $2a12
[00086a72]                           dc.w $4687
[00086a74]                           dc.w $8f01
[00086a76]                           dc.b '<22G'
[00086a7a]                           dc.w $8f81
[00086a7c]                           dc.w $0e62
[00086a7e]                           dc.w $2d27
[00086a80]                           dc.w $8fc1
[00086a82]                           dc.w $1782
[00086a84]                           dc.w $6427
[00086a86]                           dc.w $8f01
[00086a88]                           dc.w $22e2
[00086a8a]                           dc.w $5217
[00086a8c]                           dc.w $8901
[00086a8e]                           dc.w $43c2
[00086a90]                           dc.w $4a17
[00086a92]                           dc.w $8181
[00086a94]                           dc.w $45f2
[00086a96]                           dc.w $2207
[00086a98]                           dc.w $8081
[00086a9a]                           dc.w $4d62
[00086a9c]                           dc.w $1c07
[00086a9e]                           dc.w $8001
[00086aa0]                           dc.w $3852
[00086aa2]                           dc.w $0707
[00086aa4]                           dc.w $8001
[00086aa6]                           dc.w $0002
[00086aa8]                           dc.w $0007
[00086aaa]                           dc.w $ffff
[00086aac]                           dc.w $ffff
[00086aae]                           dc.w $ffff
[00086ab0]                           dc.w $8001
[00086ab2]                           dc.w $0002
[00086ab4]                           dc.w $0007
[00086ab6]                           dc.w $8d81
[00086ab8]                           dc.w $3872
[00086aba]                           dc.w $0607
[00086abc]                           dc.w $9261
[00086abe]                           dc.w $0782
[00086ac0]                           dc.w $0607
[00086ac2]                           dc.w $8911
[00086ac4]                           dc.w $0302
[00086ac6]                           dc.w $0607
[00086ac8]                           dc.w $8c89
[00086aca]                           dc.w $0302
[00086acc]                           dc.w $0607
[00086ace]                           dc.w $9205
[00086ad0]                           dc.w $0302
[00086ad2]                           dc.w $7fe7
[00086ad4]                           dc.w $8905
[00086ad6]                           dc.w $0302
[00086ad8]                           dc.w $7fe7
[00086ada]                           dc.w $8401
[00086adc]                           dc.w $0302
[00086ade]                           dc.w $0607
[00086ae0]                           dc.w $8301
[00086ae2]                           dc.w $0302
[00086ae4]                           dc.w $0607
[00086ae6]                           dc.w $8401
[00086ae8]                           dc.w $0302
[00086aea]                           dc.w $0607
[00086aec]                           dc.w $8701
[00086aee]                           dc.w $0782
[00086af0]                           dc.w $0607
[00086af2]                           dc.w $80f1
[00086af4]                           dc.w $3872
[00086af6]                           dc.w $0007
[00086af8]                           dc.w $8001
[00086afa]                           dc.w $0002
[00086afc]                           dc.w $0007
[00086afe]                           dc.w $ffff
[00086b00]                           dc.w $ffff
[00086b02]                           dc.w $ffff
[00086b04]                           dc.w $7fff
[00086b06]                           dc.w $ffff
[00086b08]                           dc.w $ffff
[00086b0a]                           dc.w $3fff
[00086b0c]                           dc.w $ffff
[00086b0e]                           dc.w $ffff
IC_PALETTE:
[00086b10] 0008699c                  dc.l _MSK_IC_PALETTE
[00086b14] 00086a56                  dc.l _DAT_IC_PALETTE
[00086b18] 00086973                  dc.l TEXT_217
[00086b1c]                           dc.w $1000
[00086b1e]                           dc.w $0000
[00086b20]                           dc.w $0000
[00086b22]                           dc.w $000c
[00086b24]                           dc.w $0000
[00086b26]                           dc.w $0030
[00086b28]                           dc.w $001f
[00086b2a]                           dc.w $0000
[00086b2c]                           dc.w $0020
[00086b2e]                           dc.w $0048
[00086b30]                           dc.w $0008
[00086b32]                           dc.w $0000
[00086b34]                           dc.w $0000
_MSK_MOUSEDUMMY:
[00086b36]                           dc.w $ffff
[00086b38]                           dc.w $ffff
[00086b3a]                           dc.w $ffff
[00086b3c]                           dc.w $ffff
[00086b3e]                           dc.w $ffff
[00086b40]                           dc.w $ffff
[00086b42]                           dc.w $ffff
[00086b44]                           dc.w $ffff
[00086b46]                           dc.w $ffff
[00086b48]                           dc.w $ffff
[00086b4a]                           dc.w $ffff
[00086b4c]                           dc.w $ffff
[00086b4e]                           dc.w $ffff
[00086b50]                           dc.w $ffff
[00086b52]                           dc.w $ffff
[00086b54]                           dc.w $ffff
_DAT_MOUSEDUMMY:
[00086b56]                           dc.w $7ffe
[00086b58]                           dc.w $bffd
[00086b5a]                           dc.w $dffb
[00086b5c]                           dc.w $eff7
[00086b5e]                           dc.w $f7ef
[00086b60]                           dc.w $fbdf
[00086b62]                           dc.w $fdbf
[00086b64]                           dc.w $fe7f
[00086b66]                           dc.w $fe7f
[00086b68]                           dc.w $fdbf
[00086b6a]                           dc.w $fbdf
[00086b6c]                           dc.w $f7ef
[00086b6e]                           dc.w $eff7
[00086b70]                           dc.w $dffb
[00086b72]                           dc.w $bffd
[00086b74]                           dc.w $7ffe
MOUSEDUMMY:
[00086b76] 00086b36                  dc.l _MSK_MOUSEDUMMY
[00086b7a] 00086b56                  dc.l _DAT_MOUSEDUMMY
[00086b7e] 00086968                  dc.l TEXT_002
[00086b82]                           dc.w $1000
[00086b84]                           dc.w $000a
[00086b86]                           dc.w $000a
[00086b88]                           dc.w $0000
[00086b8a]                           dc.w $0000
[00086b8c]                           dc.w $0010
[00086b8e]                           dc.w $0010
[00086b90]                           dc.w $0000
[00086b92]                           dc.w $0000
[00086b94]                           dc.w $0008
[00086b96]                           dc.w $0008
[00086b98]                           dc.w $0000
[00086b9a]                           dc.w $0000
_MSK_MO_ARROW:
[00086b9c]                           dc.w $c000
[00086b9e]                           dc.w $e000
[00086ba0]                           dc.w $f000
[00086ba2]                           dc.w $f800
[00086ba4]                           dc.w $fc00
[00086ba6]                           dc.w $fe00
[00086ba8]                           dc.w $ff00
[00086baa]                           dc.w $ff80
[00086bac]                           dc.w $ffc0
[00086bae]                           dc.w $ffe0
[00086bb0]                           dc.w $fe00
[00086bb2]                           dc.w $ef00
[00086bb4]                           dc.w $cf00
[00086bb6]                           dc.w $8780
[00086bb8]                           dc.w $0780
[00086bba]                           dc.w $0380
_DAT_MO_ARROW:
[00086bbc]                           dc.w $0000
[00086bbe]                           dc.w $4000
[00086bc0]                           dc.w $6000
[00086bc2]                           dc.w $7000
[00086bc4]                           dc.w $7800
[00086bc6]                           dc.w $7c00
[00086bc8]                           dc.w $7e00
[00086bca]                           dc.w $7f00
[00086bcc]                           dc.w $7f80
[00086bce]                           dc.w $7c00
[00086bd0]                           dc.w $6c00
[00086bd2]                           dc.w $4600
[00086bd4]                           dc.w $0600
[00086bd6]                           dc.w $0300
[00086bd8]                           dc.w $0300
[00086bda]                           dc.w $0000
MO_ARROW:
[00086bdc] 00086b9c                  dc.l _MSK_MO_ARROW
[00086be0] 00086bbc                  dc.l _DAT_MO_ARROW
[00086be4] 00086968                  dc.l TEXT_002
[00086be8]                           dc.w $1000
[00086bea]                           dc.w $000a
[00086bec]                           dc.w $000a
[00086bee]                           dc.w $0000
[00086bf0]                           dc.w $0000
[00086bf2]                           dc.w $0010
[00086bf4]                           dc.w $0010
[00086bf6]                           dc.w $0000
[00086bf8]                           dc.w $0000
[00086bfa]                           dc.w $0008
[00086bfc]                           dc.w $0008
[00086bfe]                           dc.w $0000
[00086c00]                           dc.w $0000
_MSK_MO_BUSYBEE:
[00086c02]                           dc.w $1c3e
[00086c04]                           dc.w $1c7f
[00086c06]                           dc.w $1cff
[00086c08]                           dc.w $ffff
[00086c0a]                           dc.w $ffff
[00086c0c]                           dc.w $ffff
[00086c0e]                           dc.w $3ffe
[00086c10]                           dc.w $3ffc
[00086c12]                           dc.w $7ffe
[00086c14]                           dc.w $fffe
[00086c16]                           dc.w $ffff
[00086c18]                           dc.w $ffff
[00086c1a]                           dc.w $ffff
[00086c1c]                           dc.w $ffff
[00086c1e]                           dc.w $feff
[00086c20]                           dc.w $7c3e
_DAT_MO_BUSYBEE:
[00086c22]                           dc.w $0800
[00086c24]                           dc.w $083c
[00086c26]                           dc.w $0042
[00086c28]                           dc.w $1682
[00086c2a]                           dc.w $c684
[00086c2c]                           dc.w $188a
[00086c2e]                           dc.w $1b54
[00086c30]                           dc.w $02e0
[00086c32]                           dc.w $1d58
[00086c34]                           dc.w $33fc
[00086c36]                           dc.w $6160
[00086c38]                           dc.w $42de
[00086c3a]                           dc.w $44d8
[00086c3c]                           dc.w $4a56
[00086c3e]                           dc.w $3414
[00086c40]                           dc.w $0000
MO_BUSYBEE:
[00086c42] 00086c02                  dc.l _MSK_MO_BUSYBEE
[00086c46] 00086c22                  dc.l _DAT_MO_BUSYBEE
[00086c4a] 00086968                  dc.l TEXT_002
[00086c4e]                           dc.w $1000
[00086c50]                           dc.w $000a
[00086c52]                           dc.w $000a
[00086c54]                           dc.w $0000
[00086c56]                           dc.w $0000
[00086c58]                           dc.w $0010
[00086c5a]                           dc.w $0010
[00086c5c]                           dc.w $0000
[00086c5e]                           dc.w $0000
[00086c60]                           dc.w $0008
[00086c62]                           dc.w $0008
[00086c64]                           dc.w $0000
[00086c66]                           dc.w $0000
_MSK_MO_FLAT_HAND:
[00086c68]                           dc.w $0300
[00086c6a]                           dc.w $1fb0
[00086c6c]                           dc.w $3ff8
[00086c6e]                           dc.w $3ffc
[00086c70]                           dc.w $7ffe
[00086c72]                           dc.w $fffe
[00086c74]                           dc.w $fffe
[00086c76]                           dc.w $7fff
[00086c78]                           dc.w $7fff
[00086c7a]                           dc.w $ffff
[00086c7c]                           dc.w $ffff
[00086c7e]                           dc.w $7fff
[00086c80]                           dc.w $3fff
[00086c82]                           dc.w $0fff
[00086c84]                           dc.w $01ff
[00086c86]                           dc.w $003f
_DAT_MO_FLAT_HAND:
[00086c88]                           dc.w $0300
[00086c8a]                           dc.w $1cb0
[00086c8c]                           dc.b '$H"$q'
[00086c91]                           dc.b $12
[00086c92]                           dc.w $9882
[00086c94]                           dc.w $8402
[00086c96]                           dc.w $4201
[00086c98]                           dc.w $7001
[00086c9a]                           dc.w $9801
[00086c9c]                           dc.w $8401
[00086c9e]                           dc.w $4000
[00086ca0]                           dc.w $3000
[00086ca2]                           dc.w $0e00
[00086ca4]                           dc.w $01c0
[00086ca6]                           dc.w $0030
MO_FLAT_HAND:
[00086ca8] 00086c68                  dc.l _MSK_MO_FLAT_HAND
[00086cac] 00086c88                  dc.l _DAT_MO_FLAT_HAND
[00086cb0] 00086968                  dc.l TEXT_002
[00086cb4]                           dc.w $1000
[00086cb6]                           dc.w $000a
[00086cb8]                           dc.w $000a
[00086cba]                           dc.w $0000
[00086cbc]                           dc.w $0000
[00086cbe]                           dc.w $0010
[00086cc0]                           dc.w $0010
[00086cc2]                           dc.w $0000
[00086cc4]                           dc.w $0000
[00086cc6]                           dc.w $0008
[00086cc8]                           dc.w $0008
[00086cca]                           dc.w $0000
[00086ccc]                           dc.w $0000
_MSK_MO_OUTL_CROSS:
[00086cce]                           dc.w $07c0
[00086cd0]                           dc.w $07c0
[00086cd2]                           dc.w $06c0
[00086cd4]                           dc.w $06c0
[00086cd6]                           dc.w $06c0
[00086cd8]                           dc.w $fefe
[00086cda]                           dc.w $fefe
[00086cdc]                           dc.w $c006
[00086cde]                           dc.w $fefe
[00086ce0]                           dc.w $fefe
[00086ce2]                           dc.w $06c0
[00086ce4]                           dc.w $06c0
[00086ce6]                           dc.w $06c0
[00086ce8]                           dc.w $07c0
[00086cea]                           dc.w $07c0
[00086cec]                           dc.w $0000
_DAT_MO_OUTL_CROSS:
[00086cee]                           dc.w $0000
[00086cf0]                           dc.w $0380
[00086cf2]                           dc.w $0280
[00086cf4]                           dc.w $0280
[00086cf6]                           dc.w $0280
[00086cf8]                           dc.w $0280
[00086cfa]                           dc.w $7efc
[00086cfc]                           dc.w $4004
[00086cfe]                           dc.w $7efc
[00086d00]                           dc.w $0280
[00086d02]                           dc.w $0280
[00086d04]                           dc.w $0280
[00086d06]                           dc.w $0280
[00086d08]                           dc.w $0380
[00086d0a]                           dc.w $0000
[00086d0c]                           dc.w $0000
MO_OUTL_CROSS:
[00086d0e] 00086cce                  dc.l _MSK_MO_OUTL_CROSS
[00086d12] 00086cee                  dc.l _DAT_MO_OUTL_CROSS
[00086d16] 00086968                  dc.l TEXT_002
[00086d1a]                           dc.w $1000
[00086d1c]                           dc.w $000a
[00086d1e]                           dc.w $000a
[00086d20]                           dc.w $0000
[00086d22]                           dc.w $0000
[00086d24]                           dc.w $0010
[00086d26]                           dc.w $0010
[00086d28]                           dc.w $0000
[00086d2a]                           dc.w $0000
[00086d2c]                           dc.w $0008
[00086d2e]                           dc.w $0008
[00086d30]                           dc.w $0000
[00086d32]                           dc.w $0000
_MSK_MO_POINT_HAND:
[00086d34]                           dc.w $3000
[00086d36]                           dc.w $7c00
[00086d38]                           dc.w $7e00
[00086d3a]                           dc.w $1f80
[00086d3c]                           dc.w $0fc0
[00086d3e]                           dc.w $3ff8
[00086d40]                           dc.w $3ffc
[00086d42]                           dc.w $7ffc
[00086d44]                           dc.w $fffe
[00086d46]                           dc.w $fffe
[00086d48]                           dc.w $7fff
[00086d4a]                           dc.w $3fff
[00086d4c]                           dc.w $1fff
[00086d4e]                           dc.w $0fff
[00086d50]                           dc.w $03ff
[00086d52]                           dc.w $00ff
_DAT_MO_POINT_HAND:
[00086d54]                           dc.w $3000
[00086d56]                           dc.w $4c00
[00086d58]                           dc.w $6200
[00086d5a]                           dc.w $1980
[00086d5c]                           dc.w $0c40
[00086d5e]                           dc.w $32f8
[00086d60]                           dc.w $2904
[00086d62]                           dc.w $6624
[00086d64]                           dc.w $93c2
[00086d66]                           dc.w $8f42
[00086d68]                           dc.b '|C !'
[00086d6c]                           dc.w $1001
[00086d6e]                           dc.w $0c41
[00086d70]                           dc.w $0380
[00086d72]                           dc.w $00c0
MO_POINT_HAND:
[00086d74] 00086d34                  dc.l _MSK_MO_POINT_HAND
[00086d78] 00086d54                  dc.l _DAT_MO_POINT_HAND
[00086d7c] 00086968                  dc.l TEXT_002
[00086d80]                           dc.w $1000
[00086d82]                           dc.w $000a
[00086d84]                           dc.w $000a
[00086d86]                           dc.w $0000
[00086d88]                           dc.w $0000
[00086d8a]                           dc.w $0010
[00086d8c]                           dc.w $0010
[00086d8e]                           dc.w $0000
[00086d90]                           dc.w $0000
[00086d92]                           dc.w $0008
[00086d94]                           dc.w $0008
[00086d96]                           dc.w $0000
[00086d98]                           dc.w $0000
_MSK_MO_TEXT_CRSR:
[00086d9a]                           dc.w $ffff
[00086d9c]                           dc.w $ffff
[00086d9e]                           dc.w $07e0
[00086da0]                           dc.w $03c0
[00086da2]                           dc.w $03c0
[00086da4]                           dc.w $03c0
[00086da6]                           dc.w $03c0
[00086da8]                           dc.w $03c0
[00086daa]                           dc.w $03c0
[00086dac]                           dc.w $03c0
[00086dae]                           dc.w $03c0
[00086db0]                           dc.w $03c0
[00086db2]                           dc.w $03c0
[00086db4]                           dc.w $07e0
[00086db6]                           dc.w $ffff
[00086db8]                           dc.w $ffff
_DAT_MO_TEXT_CRSR:
[00086dba]                           dc.w $7dbe
[00086dbc]                           dc.w $0660
[00086dbe]                           dc.w $03c0
[00086dc0]                           dc.w $0180
[00086dc2]                           dc.w $0180
[00086dc4]                           dc.w $0180
[00086dc6]                           dc.w $0180
[00086dc8]                           dc.w $0180
[00086dca]                           dc.w $0180
[00086dcc]                           dc.w $0180
[00086dce]                           dc.w $0180
[00086dd0]                           dc.w $0180
[00086dd2]                           dc.w $0180
[00086dd4]                           dc.w $03c0
[00086dd6]                           dc.w $0660
[00086dd8]                           dc.w $7dbe
MO_TEXT_CRSR:
[00086dda] 00086d9a                  dc.l _MSK_MO_TEXT_CRSR
[00086dde] 00086dba                  dc.l _DAT_MO_TEXT_CRSR
[00086de2] 00086968                  dc.l TEXT_002
[00086de6]                           dc.w $1000
[00086de8]                           dc.w $000a
[00086dea]                           dc.w $000a
[00086dec]                           dc.w $0000
[00086dee]                           dc.w $0000
[00086df0]                           dc.w $0010
[00086df2]                           dc.w $0010
[00086df4]                           dc.w $0000
[00086df6]                           dc.w $0000
[00086df8]                           dc.w $0008
[00086dfa]                           dc.w $0008
[00086dfc]                           dc.w $0000
[00086dfe]                           dc.w $0000
_MSK_MO_THICK_CROSS:
[00086e00]                           dc.w $07c0
[00086e02]                           dc.w $07c0
[00086e04]                           dc.w $07c0
[00086e06]                           dc.w $07c0
[00086e08]                           dc.w $07c0
[00086e0a]                           dc.w $fffe
[00086e0c]                           dc.w $fffe
[00086e0e]                           dc.w $fffe
[00086e10]                           dc.w $fffe
[00086e12]                           dc.w $fffe
[00086e14]                           dc.w $07c0
[00086e16]                           dc.w $07c0
[00086e18]                           dc.w $07c0
[00086e1a]                           dc.w $07c0
[00086e1c]                           dc.w $07c0
[00086e1e]                           dc.w $0000
_DAT_MO_THICK_CROSS:
[00086e20]                           dc.w $0000
[00086e22]                           dc.w $0380
[00086e24]                           dc.w $0380
[00086e26]                           dc.w $0380
[00086e28]                           dc.w $0380
[00086e2a]                           dc.w $0380
[00086e2c]                           dc.w $7ffc
[00086e2e]                           dc.w $7ffc
[00086e30]                           dc.w $7ffc
[00086e32]                           dc.w $0380
[00086e34]                           dc.w $0380
[00086e36]                           dc.w $0380
[00086e38]                           dc.w $0380
[00086e3a]                           dc.w $0380
[00086e3c]                           dc.w $0000
[00086e3e]                           dc.w $0000
MO_THICK_CROSS:
[00086e40] 00086e00                  dc.l _MSK_MO_THICK_CROSS
[00086e44] 00086e20                  dc.l _DAT_MO_THICK_CROSS
[00086e48] 00086968                  dc.l TEXT_002
[00086e4c]                           dc.w $1000
[00086e4e]                           dc.w $000a
[00086e50]                           dc.w $000a
[00086e52]                           dc.w $0000
[00086e54]                           dc.w $0000
[00086e56]                           dc.w $0010
[00086e58]                           dc.w $0010
[00086e5a]                           dc.w $0000
[00086e5c]                           dc.w $0000
[00086e5e]                           dc.w $0008
[00086e60]                           dc.w $0008
[00086e62]                           dc.w $0000
[00086e64]                           dc.w $0000
_MSK_MO_THIN_CROSS:
[00086e66]                           dc.w $0380
[00086e68]                           dc.w $0380
[00086e6a]                           dc.w $0380
[00086e6c]                           dc.w $0380
[00086e6e]                           dc.w $0380
[00086e70]                           dc.w $0380
[00086e72]                           dc.w $fffe
[00086e74]                           dc.w $fffe
[00086e76]                           dc.w $fffe
[00086e78]                           dc.w $0380
[00086e7a]                           dc.w $0380
[00086e7c]                           dc.w $0380
[00086e7e]                           dc.w $0380
[00086e80]                           dc.w $0380
[00086e82]                           dc.w $0380
[00086e84]                           dc.w $0000
_DAT_MO_THIN_CROSS:
[00086e86]                           dc.w $0000
[00086e88]                           dc.w $0100
[00086e8a]                           dc.w $0100
[00086e8c]                           dc.w $0100
[00086e8e]                           dc.w $0100
[00086e90]                           dc.w $0100
[00086e92]                           dc.w $0100
[00086e94]                           dc.w $7ffc
[00086e96]                           dc.w $0100
[00086e98]                           dc.w $0100
[00086e9a]                           dc.w $0100
[00086e9c]                           dc.w $0100
[00086e9e]                           dc.w $0100
[00086ea0]                           dc.w $0100
[00086ea2]                           dc.w $0000
[00086ea4]                           dc.w $0000
MO_THIN_CROSS:
[00086ea6] 00086e66                  dc.l _MSK_MO_THIN_CROSS
[00086eaa] 00086e86                  dc.l _DAT_MO_THIN_CROSS
[00086eae] 00086968                  dc.l TEXT_002
[00086eb2]                           dc.w $1000
[00086eb4]                           dc.w $000a
[00086eb6]                           dc.w $000a
[00086eb8]                           dc.w $0000
[00086eba]                           dc.w $0000
[00086ebc]                           dc.w $0010
[00086ebe]                           dc.w $0010
[00086ec0]                           dc.w $0000
[00086ec2]                           dc.w $0000
[00086ec4]                           dc.w $0008
[00086ec6]                           dc.w $0008
[00086ec8]                           dc.w $0000
[00086eca]                           dc.w $0000
PALETTE_MOUSE:
[00086ecc]                           dc.w $ffff
[00086ece]                           dc.w $0002
[00086ed0]                           dc.w $0040
[00086ed2]                           dc.w $0018
[00086ed4]                           dc.w $0000
[00086ed6]                           dc.w $0010
[00086ed8] 0008697c                  dc.l A_3DBUTTON01
[00086edc]                           dc.w $0000
[00086ede]                           dc.w $0000
[00086ee0]                           dc.w $0022
[00086ee2]                           dc.w $0009
_00aPALETTE_MOUSE:
[00086ee4]                           dc.w $0000
[00086ee6]                           dc.w $0000
[00086ee8]                           dc.w $0000
[00086eea]                           dc.w $0000
[00086eec]                           dc.w $8000
[00086eee]                           dc.w $0000
[00086ef0]                           dc.w $0000
[00086ef2]                           dc.w $0000
[00086ef4]                           dc.w $0000
[00086ef6]                           dc.w $0000
[00086ef8]                           dc.w $001f
[00086efa]                           dc.w $0000
_02_PALETTE_MOUSE:
[00086efc]                           dc.w $0004
[00086efe]                           dc.w $ffff
[00086f00]                           dc.w $ffff
[00086f02]                           dc.w $001f
[00086f04]                           dc.w $3005
[00086f06]                           dc.w $0000
[00086f08] 00086b76                  dc.l MOUSEDUMMY
[00086f0c]                           dc.w $0400
[00086f0e]                           dc.w $0400
[00086f10]                           dc.w $0004
[00086f12]                           dc.w $0002
_02aPALETTE_MOUSE:
[00086f14] 000120ca                  dc.l edmp_set
[00086f18] 00011f5e                  dc.l edmp_acc
[00086f1c]                           dc.w $8000
[00086f1e]                           dc.w $0000
[00086f20]                           dc.w $0000
[00086f22]                           dc.w $0000
[00086f24]                           dc.w $0000
[00086f26]                           dc.w $0000
[00086f28]                           dc.w $0000
[00086f2a]                           dc.w $0000
_04_PALETTE_MOUSE:
[00086f2c]                           dc.w $0006
[00086f2e]                           dc.w $ffff
[00086f30]                           dc.w $ffff
[00086f32]                           dc.w $001f
[00086f34]                           dc.w $3005
[00086f36]                           dc.w $0000
[00086f38] 00086b76                  dc.l MOUSEDUMMY
[00086f3c]                           dc.w $0005
[00086f3e]                           dc.w $0001
[00086f40]                           dc.w $0004
[00086f42]                           dc.w $0002
_04aPALETTE_MOUSE:
[00086f44] 000120ca                  dc.l edmp_set
[00086f48] 00011f5e                  dc.l edmp_acc
[00086f4c]                           dc.w $8000
[00086f4e]                           dc.w $0000
[00086f50]                           dc.w $0000
[00086f52]                           dc.w $0000
[00086f54]                           dc.w $0000
[00086f56]                           dc.w $0000
[00086f58]                           dc.w $0000
[00086f5a]                           dc.w $0000
_06_PALETTE_MOUSE:
[00086f5c]                           dc.w $0008
[00086f5e]                           dc.w $ffff
[00086f60]                           dc.w $ffff
[00086f62]                           dc.w $001f
[00086f64]                           dc.w $3005
[00086f66]                           dc.w $0000
[00086f68] 00086b76                  dc.l MOUSEDUMMY
[00086f6c]                           dc.w $0009
[00086f6e]                           dc.w $0001
[00086f70]                           dc.w $0004
[00086f72]                           dc.w $0002
_06aPALETTE_MOUSE:
[00086f74] 000120ca                  dc.l edmp_set
[00086f78] 00011f5e                  dc.l edmp_acc
[00086f7c]                           dc.w $8000
[00086f7e]                           dc.w $0000
[00086f80]                           dc.w $0000
[00086f82]                           dc.w $0000
[00086f84]                           dc.w $0000
[00086f86]                           dc.w $0000
[00086f88]                           dc.w $0000
[00086f8a]                           dc.w $0000
_08_PALETTE_MOUSE:
[00086f8c]                           dc.w $000a
[00086f8e]                           dc.w $ffff
[00086f90]                           dc.w $ffff
[00086f92]                           dc.w $001f
[00086f94]                           dc.w $3005
[00086f96]                           dc.w $0000
[00086f98] 00086b76                  dc.l MOUSEDUMMY
[00086f9c]                           dc.w $000d
[00086f9e]                           dc.w $0001
[00086fa0]                           dc.w $0004
[00086fa2]                           dc.w $0002
_08aPALETTE_MOUSE:
[00086fa4] 000120ca                  dc.l edmp_set
[00086fa8] 00011f5e                  dc.l edmp_acc
[00086fac]                           dc.w $8000
[00086fae]                           dc.w $0000
[00086fb0]                           dc.w $0000
[00086fb2]                           dc.w $0000
[00086fb4]                           dc.w $0000
[00086fb6]                           dc.w $0000
[00086fb8]                           dc.w $0000
[00086fba]                           dc.w $0000
_10_PALETTE_MOUSE:
[00086fbc]                           dc.w $000c
[00086fbe]                           dc.w $ffff
[00086fc0]                           dc.w $ffff
[00086fc2]                           dc.w $001f
[00086fc4]                           dc.w $3005
[00086fc6]                           dc.w $0000
[00086fc8] 00086b76                  dc.l MOUSEDUMMY
[00086fcc]                           dc.w $0011
[00086fce]                           dc.w $0001
[00086fd0]                           dc.w $0004
[00086fd2]                           dc.w $0002
_10aPALETTE_MOUSE:
[00086fd4] 000120ca                  dc.l edmp_set
[00086fd8] 00011f5e                  dc.l edmp_acc
[00086fdc]                           dc.w $8000
[00086fde]                           dc.w $0000
[00086fe0]                           dc.w $0000
[00086fe2]                           dc.w $0000
[00086fe4]                           dc.w $0000
[00086fe6]                           dc.w $0000
[00086fe8]                           dc.w $0000
[00086fea]                           dc.w $0000
_12_PALETTE_MOUSE:
[00086fec]                           dc.w $000e
[00086fee]                           dc.w $ffff
[00086ff0]                           dc.w $ffff
[00086ff2]                           dc.w $001f
[00086ff4]                           dc.w $3005
[00086ff6]                           dc.w $0000
[00086ff8] 00086b76                  dc.l MOUSEDUMMY
[00086ffc]                           dc.w $0015
[00086ffe]                           dc.w $0001
[00087000]                           dc.w $0004
[00087002]                           dc.w $0002
_12aPALETTE_MOUSE:
[00087004] 000120ca                  dc.l edmp_set
[00087008] 00011f5e                  dc.l edmp_acc
[0008700c]                           dc.w $8000
[0008700e]                           dc.w $0000
[00087010]                           dc.w $0000
[00087012]                           dc.w $0000
[00087014]                           dc.w $0000
[00087016]                           dc.w $0000
[00087018]                           dc.w $0000
[0008701a]                           dc.w $0000
_14_PALETTE_MOUSE:
[0008701c]                           dc.w $0010
[0008701e]                           dc.w $ffff
[00087020]                           dc.w $ffff
[00087022]                           dc.w $001f
[00087024]                           dc.w $3005
[00087026]                           dc.w $0000
[00087028] 00086b76                  dc.l MOUSEDUMMY
[0008702c]                           dc.w $0019
[0008702e]                           dc.w $0001
[00087030]                           dc.w $0004
[00087032]                           dc.w $0002
_14aPALETTE_MOUSE:
[00087034] 000120ca                  dc.l edmp_set
[00087038] 00011f5e                  dc.l edmp_acc
[0008703c]                           dc.w $8000
[0008703e]                           dc.w $0000
[00087040]                           dc.w $0000
[00087042]                           dc.w $0000
[00087044]                           dc.w $0000
[00087046]                           dc.w $0000
[00087048]                           dc.w $0000
[0008704a]                           dc.w $0000
_16_PALETTE_MOUSE:
[0008704c]                           dc.w $0012
[0008704e]                           dc.w $ffff
[00087050]                           dc.w $ffff
[00087052]                           dc.w $001f
[00087054]                           dc.w $3005
[00087056]                           dc.w $0000
[00087058] 00086b76                  dc.l MOUSEDUMMY
[0008705c]                           dc.w $001d
[0008705e]                           dc.w $0001
[00087060]                           dc.w $0004
[00087062]                           dc.w $0002
_16aPALETTE_MOUSE:
[00087064] 000120ca                  dc.l edmp_set
[00087068] 00011f5e                  dc.l edmp_acc
[0008706c]                           dc.w $8000
[0008706e]                           dc.w $0000
[00087070]                           dc.w $0000
[00087072]                           dc.w $0000
[00087074]                           dc.w $0000
[00087076]                           dc.w $0000
[00087078]                           dc.w $0000
[0008707a]                           dc.w $0000
_18_PALETTE_MOUSE:
[0008707c]                           dc.w $0014
[0008707e]                           dc.w $ffff
[00087080]                           dc.w $ffff
[00087082]                           dc.w $001f
[00087084]                           dc.w $3005
[00087086]                           dc.w $0000
[00087088] 00086b76                  dc.l MOUSEDUMMY
[0008708c]                           dc.w $0001
[0008708e]                           dc.w $0003
[00087090]                           dc.w $0004
[00087092]                           dc.w $0002
_18aPALETTE_MOUSE:
[00087094] 000120ca                  dc.l edmp_set
[00087098] 00011f5e                  dc.l edmp_acc
[0008709c]                           dc.w $8000
[0008709e]                           dc.w $0000
[000870a0]                           dc.w $0000
[000870a2]                           dc.w $0000
[000870a4]                           dc.w $0000
[000870a6]                           dc.w $0000
[000870a8]                           dc.w $0000
[000870aa]                           dc.w $0000
_20_PALETTE_MOUSE:
[000870ac]                           dc.w $0016
[000870ae]                           dc.w $ffff
[000870b0]                           dc.w $ffff
[000870b2]                           dc.w $001f
[000870b4]                           dc.w $3005
[000870b6]                           dc.w $0000
[000870b8] 00086b76                  dc.l MOUSEDUMMY
[000870bc]                           dc.w $0005
[000870be]                           dc.w $0003
[000870c0]                           dc.w $0004
[000870c2]                           dc.w $0002
_20aPALETTE_MOUSE:
[000870c4] 000120ca                  dc.l edmp_set
[000870c8] 00011f5e                  dc.l edmp_acc
[000870cc]                           dc.w $8000
[000870ce]                           dc.w $0000
[000870d0]                           dc.w $0000
[000870d2]                           dc.w $0000
[000870d4]                           dc.w $0000
[000870d6]                           dc.w $0000
[000870d8]                           dc.w $0000
[000870da]                           dc.w $0000
_22_PALETTE_MOUSE:
[000870dc]                           dc.w $0018
[000870de]                           dc.w $ffff
[000870e0]                           dc.w $ffff
[000870e2]                           dc.w $001f
[000870e4]                           dc.w $3005
[000870e6]                           dc.w $0000
[000870e8] 00086b76                  dc.l MOUSEDUMMY
[000870ec]                           dc.w $0009
[000870ee]                           dc.w $0003
[000870f0]                           dc.w $0004
[000870f2]                           dc.w $0002
_22aPALETTE_MOUSE:
[000870f4] 000120ca                  dc.l edmp_set
[000870f8] 00011f5e                  dc.l edmp_acc
[000870fc]                           dc.w $8000
[000870fe]                           dc.w $0000
[00087100]                           dc.w $0000
[00087102]                           dc.w $0000
[00087104]                           dc.w $0000
[00087106]                           dc.w $0000
[00087108]                           dc.w $0000
[0008710a]                           dc.w $0000
_24_PALETTE_MOUSE:
[0008710c]                           dc.w $001a
[0008710e]                           dc.w $ffff
[00087110]                           dc.w $ffff
[00087112]                           dc.w $001f
[00087114]                           dc.w $3005
[00087116]                           dc.w $0000
[00087118] 00086b76                  dc.l MOUSEDUMMY
[0008711c]                           dc.w $000d
[0008711e]                           dc.w $0003
[00087120]                           dc.w $0004
[00087122]                           dc.w $0002
_24aPALETTE_MOUSE:
[00087124] 000120ca                  dc.l edmp_set
[00087128] 00011f5e                  dc.l edmp_acc
[0008712c]                           dc.w $8000
[0008712e]                           dc.w $0000
[00087130]                           dc.w $0000
[00087132]                           dc.w $0000
[00087134]                           dc.w $0000
[00087136]                           dc.w $0000
[00087138]                           dc.w $0000
[0008713a]                           dc.w $0000
_26_PALETTE_MOUSE:
[0008713c]                           dc.w $001c
[0008713e]                           dc.w $ffff
[00087140]                           dc.w $ffff
[00087142]                           dc.w $001f
[00087144]                           dc.w $3005
[00087146]                           dc.w $0000
[00087148] 00086b76                  dc.l MOUSEDUMMY
[0008714c]                           dc.w $0011
[0008714e]                           dc.w $0003
[00087150]                           dc.w $0004
[00087152]                           dc.w $0002
_26aPALETTE_MOUSE:
[00087154] 000120ca                  dc.l edmp_set
[00087158] 00011f5e                  dc.l edmp_acc
[0008715c]                           dc.w $8000
[0008715e]                           dc.w $0000
[00087160]                           dc.w $0000
[00087162]                           dc.w $0000
[00087164]                           dc.w $0000
[00087166]                           dc.w $0000
[00087168]                           dc.w $0000
[0008716a]                           dc.w $0000
_28_PALETTE_MOUSE:
[0008716c]                           dc.w $001e
[0008716e]                           dc.w $ffff
[00087170]                           dc.w $ffff
[00087172]                           dc.w $001f
[00087174]                           dc.w $3005
[00087176]                           dc.w $0000
[00087178] 00086b76                  dc.l MOUSEDUMMY
[0008717c]                           dc.w $0015
[0008717e]                           dc.w $0003
[00087180]                           dc.w $0004
[00087182]                           dc.w $0002
_28aPALETTE_MOUSE:
[00087184] 000120ca                  dc.l edmp_set
[00087188] 00011f5e                  dc.l edmp_acc
[0008718c]                           dc.w $8000
[0008718e]                           dc.w $0000
[00087190]                           dc.w $0000
[00087192]                           dc.w $0000
[00087194]                           dc.w $0000
[00087196]                           dc.w $0000
[00087198]                           dc.w $0000
[0008719a]                           dc.w $0000
_30_PALETTE_MOUSE:
[0008719c]                           dc.w $0020
[0008719e]                           dc.w $ffff
[000871a0]                           dc.w $ffff
[000871a2]                           dc.w $001f
[000871a4]                           dc.w $3005
[000871a6]                           dc.w $0000
[000871a8] 00086b76                  dc.l MOUSEDUMMY
[000871ac]                           dc.w $0019
[000871ae]                           dc.w $0003
[000871b0]                           dc.w $0004
[000871b2]                           dc.w $0002
_30aPALETTE_MOUSE:
[000871b4] 000120ca                  dc.l edmp_set
[000871b8] 00011f5e                  dc.l edmp_acc
[000871bc]                           dc.w $8000
[000871be]                           dc.w $0000
[000871c0]                           dc.w $0000
[000871c2]                           dc.w $0000
[000871c4]                           dc.w $0000
[000871c6]                           dc.w $0000
[000871c8]                           dc.w $0000
[000871ca]                           dc.w $0000
_32_PALETTE_MOUSE:
[000871cc]                           dc.w $0022
[000871ce]                           dc.w $ffff
[000871d0]                           dc.w $ffff
[000871d2]                           dc.w $001f
[000871d4]                           dc.w $3005
[000871d6]                           dc.w $0000
[000871d8] 00086b76                  dc.l MOUSEDUMMY
[000871dc]                           dc.w $001d
[000871de]                           dc.w $0003
[000871e0]                           dc.w $0004
[000871e2]                           dc.w $0002
_32aPALETTE_MOUSE:
[000871e4] 000120ca                  dc.l edmp_set
[000871e8] 00011f5e                  dc.l edmp_acc
[000871ec]                           dc.w $8000
[000871ee]                           dc.w $0000
[000871f0]                           dc.w $0000
[000871f2]                           dc.w $0000
[000871f4]                           dc.w $0000
[000871f6]                           dc.w $0000
[000871f8]                           dc.w $0000
[000871fa]                           dc.w $0000
_34_PALETTE_MOUSE:
[000871fc]                           dc.w $0024
[000871fe]                           dc.w $ffff
[00087200]                           dc.w $ffff
[00087202]                           dc.w $001f
[00087204]                           dc.w $3005
[00087206]                           dc.w $0000
[00087208] 00086b76                  dc.l MOUSEDUMMY
[0008720c]                           dc.w $0001
[0008720e]                           dc.w $0005
[00087210]                           dc.w $0004
[00087212]                           dc.w $0002
_34aPALETTE_MOUSE:
[00087214] 000120ca                  dc.l edmp_set
[00087218] 00011f5e                  dc.l edmp_acc
[0008721c]                           dc.w $8000
[0008721e]                           dc.w $0000
[00087220]                           dc.w $0000
[00087222]                           dc.w $0000
[00087224]                           dc.w $0000
[00087226]                           dc.w $0000
[00087228]                           dc.w $0000
[0008722a]                           dc.w $0000
_36_PALETTE_MOUSE:
[0008722c]                           dc.w $0026
[0008722e]                           dc.w $ffff
[00087230]                           dc.w $ffff
[00087232]                           dc.w $001f
[00087234]                           dc.w $3005
[00087236]                           dc.w $0000
[00087238] 00086b76                  dc.l MOUSEDUMMY
[0008723c]                           dc.w $0005
[0008723e]                           dc.w $0005
[00087240]                           dc.w $0004
[00087242]                           dc.w $0002
_36aPALETTE_MOUSE:
[00087244] 000120ca                  dc.l edmp_set
[00087248] 00011f5e                  dc.l edmp_acc
[0008724c]                           dc.w $8000
[0008724e]                           dc.w $0000
[00087250]                           dc.w $0000
[00087252]                           dc.w $0000
[00087254]                           dc.w $0000
[00087256]                           dc.w $0000
[00087258]                           dc.w $0000
[0008725a]                           dc.w $0000
_38_PALETTE_MOUSE:
[0008725c]                           dc.w $0028
[0008725e]                           dc.w $ffff
[00087260]                           dc.w $ffff
[00087262]                           dc.w $001f
[00087264]                           dc.w $3005
[00087266]                           dc.w $0000
[00087268] 00086b76                  dc.l MOUSEDUMMY
[0008726c]                           dc.w $0009
[0008726e]                           dc.w $0005
[00087270]                           dc.w $0004
[00087272]                           dc.w $0002
_38aPALETTE_MOUSE:
[00087274] 000120ca                  dc.l edmp_set
[00087278] 00011f5e                  dc.l edmp_acc
[0008727c]                           dc.w $8000
[0008727e]                           dc.w $0000
[00087280]                           dc.w $0000
[00087282]                           dc.w $0000
[00087284]                           dc.w $0000
[00087286]                           dc.w $0000
[00087288]                           dc.w $0000
[0008728a]                           dc.w $0000
_40_PALETTE_MOUSE:
[0008728c]                           dc.w $002a
[0008728e]                           dc.w $ffff
[00087290]                           dc.w $ffff
[00087292]                           dc.w $001f
[00087294]                           dc.w $3005
[00087296]                           dc.w $0000
[00087298] 00086b76                  dc.l MOUSEDUMMY
[0008729c]                           dc.w $000d
[0008729e]                           dc.w $0005
[000872a0]                           dc.w $0004
[000872a2]                           dc.w $0002
_40aPALETTE_MOUSE:
[000872a4] 000120ca                  dc.l edmp_set
[000872a8] 00011f5e                  dc.l edmp_acc
[000872ac]                           dc.w $8000
[000872ae]                           dc.w $0000
[000872b0]                           dc.w $0000
[000872b2]                           dc.w $0000
[000872b4]                           dc.w $0000
[000872b6]                           dc.w $0000
[000872b8]                           dc.w $0000
[000872ba]                           dc.w $0000
_42_PALETTE_MOUSE:
[000872bc]                           dc.w $002c
[000872be]                           dc.w $ffff
[000872c0]                           dc.w $ffff
[000872c2]                           dc.w $001f
[000872c4]                           dc.w $3005
[000872c6]                           dc.w $0000
[000872c8] 00086b76                  dc.l MOUSEDUMMY
[000872cc]                           dc.w $0011
[000872ce]                           dc.w $0005
[000872d0]                           dc.w $0004
[000872d2]                           dc.w $0002
_42aPALETTE_MOUSE:
[000872d4] 000120ca                  dc.l edmp_set
[000872d8] 00011f5e                  dc.l edmp_acc
[000872dc]                           dc.w $8000
[000872de]                           dc.w $0000
[000872e0]                           dc.w $0000
[000872e2]                           dc.w $0000
[000872e4]                           dc.w $0000
[000872e6]                           dc.w $0000
[000872e8]                           dc.w $0000
[000872ea]                           dc.w $0000
_44_PALETTE_MOUSE:
[000872ec]                           dc.w $002e
[000872ee]                           dc.w $ffff
[000872f0]                           dc.w $ffff
[000872f2]                           dc.w $001f
[000872f4]                           dc.w $3005
[000872f6]                           dc.w $0000
[000872f8] 00086b76                  dc.l MOUSEDUMMY
[000872fc]                           dc.w $0015
[000872fe]                           dc.w $0005
[00087300]                           dc.w $0004
[00087302]                           dc.w $0002
_44aPALETTE_MOUSE:
[00087304] 000120ca                  dc.l edmp_set
[00087308] 00011f5e                  dc.l edmp_acc
[0008730c]                           dc.w $8000
[0008730e]                           dc.w $0000
[00087310]                           dc.w $0000
[00087312]                           dc.w $0000
[00087314]                           dc.w $0000
[00087316]                           dc.w $0000
[00087318]                           dc.w $0000
[0008731a]                           dc.w $0000
_46_PALETTE_MOUSE:
[0008731c]                           dc.w $0030
[0008731e]                           dc.w $ffff
[00087320]                           dc.w $ffff
[00087322]                           dc.w $001f
[00087324]                           dc.w $3005
[00087326]                           dc.w $0000
[00087328] 00086b76                  dc.l MOUSEDUMMY
[0008732c]                           dc.w $0019
[0008732e]                           dc.w $0005
[00087330]                           dc.w $0004
[00087332]                           dc.w $0002
_46aPALETTE_MOUSE:
[00087334] 000120ca                  dc.l edmp_set
[00087338] 00011f5e                  dc.l edmp_acc
[0008733c]                           dc.w $8000
[0008733e]                           dc.w $0000
[00087340]                           dc.w $0000
[00087342]                           dc.w $0000
[00087344]                           dc.w $0000
[00087346]                           dc.w $0000
[00087348]                           dc.w $0000
[0008734a]                           dc.w $0000
_48_PALETTE_MOUSE:
[0008734c]                           dc.w $0032
[0008734e]                           dc.w $ffff
[00087350]                           dc.w $ffff
[00087352]                           dc.w $001f
[00087354]                           dc.w $3005
[00087356]                           dc.w $0000
[00087358] 00086b76                  dc.l MOUSEDUMMY
[0008735c]                           dc.w $001d
[0008735e]                           dc.w $0005
[00087360]                           dc.w $0004
[00087362]                           dc.w $0002
_48aPALETTE_MOUSE:
[00087364] 000120ca                  dc.l edmp_set
[00087368] 00011f5e                  dc.l edmp_acc
[0008736c]                           dc.w $8000
[0008736e]                           dc.w $0000
[00087370]                           dc.w $0000
[00087372]                           dc.w $0000
[00087374]                           dc.w $0000
[00087376]                           dc.w $0000
[00087378]                           dc.w $0000
[0008737a]                           dc.w $0000
_50_PALETTE_MOUSE:
[0008737c]                           dc.w $0034
[0008737e]                           dc.w $ffff
[00087380]                           dc.w $ffff
[00087382]                           dc.w $001f
[00087384]                           dc.w $3005
[00087386]                           dc.w $0000
[00087388] 00086b76                  dc.l MOUSEDUMMY
[0008738c]                           dc.w $0001
[0008738e]                           dc.w $0007
[00087390]                           dc.w $0004
[00087392]                           dc.w $0002
_50aPALETTE_MOUSE:
[00087394] 000120ca                  dc.l edmp_set
[00087398] 00011f5e                  dc.l edmp_acc
[0008739c]                           dc.w $8000
[0008739e]                           dc.w $0000
[000873a0]                           dc.w $0000
[000873a2]                           dc.w $0000
[000873a4]                           dc.w $0000
[000873a6]                           dc.w $0000
[000873a8]                           dc.w $0000
[000873aa]                           dc.w $0000
_52_PALETTE_MOUSE:
[000873ac]                           dc.w $0036
[000873ae]                           dc.w $ffff
[000873b0]                           dc.w $ffff
[000873b2]                           dc.w $001f
[000873b4]                           dc.w $3005
[000873b6]                           dc.w $0000
[000873b8] 00086b76                  dc.l MOUSEDUMMY
[000873bc]                           dc.w $0005
[000873be]                           dc.w $0007
[000873c0]                           dc.w $0004
[000873c2]                           dc.w $0002
_52aPALETTE_MOUSE:
[000873c4] 000120ca                  dc.l edmp_set
[000873c8] 00011f5e                  dc.l edmp_acc
[000873cc]                           dc.w $8000
[000873ce]                           dc.w $0000
[000873d0]                           dc.w $0000
[000873d2]                           dc.w $0000
[000873d4]                           dc.w $0000
[000873d6]                           dc.w $0000
[000873d8]                           dc.w $0000
[000873da]                           dc.w $0000
_54_PALETTE_MOUSE:
[000873dc]                           dc.w $0038
[000873de]                           dc.w $ffff
[000873e0]                           dc.w $ffff
[000873e2]                           dc.w $001f
[000873e4]                           dc.w $3005
[000873e6]                           dc.w $0000
[000873e8] 00086b76                  dc.l MOUSEDUMMY
[000873ec]                           dc.w $0009
[000873ee]                           dc.w $0007
[000873f0]                           dc.w $0004
[000873f2]                           dc.w $0002
_54aPALETTE_MOUSE:
[000873f4] 000120ca                  dc.l edmp_set
[000873f8] 00011f5e                  dc.l edmp_acc
[000873fc]                           dc.w $8000
[000873fe]                           dc.w $0000
[00087400]                           dc.w $0000
[00087402]                           dc.w $0000
[00087404]                           dc.w $0000
[00087406]                           dc.w $0000
[00087408]                           dc.w $0000
[0008740a]                           dc.w $0000
_56_PALETTE_MOUSE:
[0008740c]                           dc.w $003a
[0008740e]                           dc.w $ffff
[00087410]                           dc.w $ffff
[00087412]                           dc.w $001f
[00087414]                           dc.w $3005
[00087416]                           dc.w $0000
[00087418] 00086b76                  dc.l MOUSEDUMMY
[0008741c]                           dc.w $000d
[0008741e]                           dc.w $0007
[00087420]                           dc.w $0004
[00087422]                           dc.w $0002
_56aPALETTE_MOUSE:
[00087424] 000120ca                  dc.l edmp_set
[00087428] 00011f5e                  dc.l edmp_acc
[0008742c]                           dc.w $8000
[0008742e]                           dc.w $0000
[00087430]                           dc.w $0000
[00087432]                           dc.w $0000
[00087434]                           dc.w $0000
[00087436]                           dc.w $0000
[00087438]                           dc.w $0000
[0008743a]                           dc.w $0000
_58_PALETTE_MOUSE:
[0008743c]                           dc.w $003c
[0008743e]                           dc.w $ffff
[00087440]                           dc.w $ffff
[00087442]                           dc.w $001f
[00087444]                           dc.w $3005
[00087446]                           dc.w $0000
[00087448] 00086b76                  dc.l MOUSEDUMMY
[0008744c]                           dc.w $0011
[0008744e]                           dc.w $0007
[00087450]                           dc.w $0004
[00087452]                           dc.w $0002
_58aPALETTE_MOUSE:
[00087454] 000120ca                  dc.l edmp_set
[00087458] 00011f5e                  dc.l edmp_acc
[0008745c]                           dc.w $8000
[0008745e]                           dc.w $0000
[00087460]                           dc.w $0000
[00087462]                           dc.w $0000
[00087464]                           dc.w $0000
[00087466]                           dc.w $0000
[00087468]                           dc.w $0000
[0008746a]                           dc.w $0000
_60_PALETTE_MOUSE:
[0008746c]                           dc.w $003e
[0008746e]                           dc.w $ffff
[00087470]                           dc.w $ffff
[00087472]                           dc.w $001f
[00087474]                           dc.w $3005
[00087476]                           dc.w $0000
[00087478] 00086b76                  dc.l MOUSEDUMMY
[0008747c]                           dc.w $0015
[0008747e]                           dc.w $0007
[00087480]                           dc.w $0004
[00087482]                           dc.w $0002
_60aPALETTE_MOUSE:
[00087484] 000120ca                  dc.l edmp_set
[00087488] 00011f5e                  dc.l edmp_acc
[0008748c]                           dc.w $8000
[0008748e]                           dc.w $0000
[00087490]                           dc.w $0000
[00087492]                           dc.w $0000
[00087494]                           dc.w $0000
[00087496]                           dc.w $0000
[00087498]                           dc.w $0000
[0008749a]                           dc.w $0000
_62_PALETTE_MOUSE:
[0008749c]                           dc.w $0040
[0008749e]                           dc.w $ffff
[000874a0]                           dc.w $ffff
[000874a2]                           dc.w $001f
[000874a4]                           dc.w $3005
[000874a6]                           dc.w $0000
[000874a8] 00086b76                  dc.l MOUSEDUMMY
[000874ac]                           dc.w $0019
[000874ae]                           dc.w $0007
[000874b0]                           dc.w $0004
[000874b2]                           dc.w $0002
_62aPALETTE_MOUSE:
[000874b4] 000120ca                  dc.l edmp_set
[000874b8] 00011f5e                  dc.l edmp_acc
[000874bc]                           dc.w $8000
[000874be]                           dc.w $0000
[000874c0]                           dc.w $0000
[000874c2]                           dc.w $0000
[000874c4]                           dc.w $0000
[000874c6]                           dc.w $0000
[000874c8]                           dc.w $0000
[000874ca]                           dc.w $0000
_64_PALETTE_MOUSE:
[000874cc]                           dc.w $0000
[000874ce]                           dc.w $ffff
[000874d0]                           dc.w $ffff
[000874d2]                           dc.w $001f
[000874d4]                           dc.w $3005
[000874d6]                           dc.w $0000
[000874d8] 00086b76                  dc.l MOUSEDUMMY
[000874dc]                           dc.w $001d
[000874de]                           dc.w $0007
[000874e0]                           dc.w $0004
[000874e2]                           dc.w $0002
_64aPALETTE_MOUSE:
[000874e4] 000120ca                  dc.l edmp_set
[000874e8] 00011f5e                  dc.l edmp_acc
[000874ec]                           dc.w $8020
[000874ee]                           dc.w $0000
[000874f0]                           dc.w $0000
[000874f2]                           dc.w $0000
[000874f4]                           dc.w $0000
[000874f6]                           dc.w $0000
[000874f8]                           dc.w $0000
[000874fa]                           dc.w $0000

	.globl WI_PALETTE
WI_PALETTE:
[000874fc]                           dc.w $0000
[000874fe]                           dc.w $0000
[00087500] 00012216                  dc.l mp_service
[00087504] 0001214e                  dc.l mp_make
[00087508] 00057428                  dc.l Awi_open
[0008750c] 00055e94                  dc.l Awi_init
[00087510] 00086ecc                  dc.l PALETTE_MOUSE
[00087514]                           dc.w $0000
[00087516]                           dc.w $0000
[00087518]                           dc.w $0000
[0008751a]                           dc.w $0000
[0008751c]                           dc.w $ffff
[0008751e]                           dc.w $4fff
[00087520]                           dc.w $0000
[00087522]                           dc.w $0000
[00087524]                           dc.w $0018
[00087526]                           dc.w $0008
[00087528]                           dc.w $0000
[0008752a]                           dc.w $0000
[0008752c]                           dc.w $0000
[0008752e]                           dc.w $0000
[00087530]                           dc.w $0000
[00087532]                           dc.w $0000
[00087534]                           dc.w $0000
[00087536]                           dc.w $0000
[00087538]                           dc.w $ffff
[0008753a]                           dc.w $ffff
[0008753c]                           dc.w $ffff
[0008753e]                           dc.w $ffff
[00087540]                           dc.w $0000
[00087542]                           dc.w $0000
[00087544]                           dc.w $fcf8
[00087546] 00086969                  dc.l TEXT_01
[0008754a] 00086968                  dc.l TEXT_002
[0008754e]                           dc.w $2710
[00087550]                           dc.w $0108
[00087552]                           dc.w $0000
[00087554]                           dc.w $ffff
[00087556] 00086b10                  dc.l IC_PALETTE
[0008755a]                           dc.w $0000
[0008755c]                           dc.w $0000
[0008755e] 0006b744                  dc.l Awi_keys
[00087562] 00051852                  dc.l Awi_obchange
[00087566] 00051c46                  dc.l Awi_redraw
[0008756a] 000587a4                  dc.l Awi_topped
[0008756e] 00058362                  dc.l Awi_closed
[00087572] 000587ec                  dc.l Awi_fulled
[00087576] 0005217c                  dc.l Awi_arrowed
[0008757a] 000524b4                  dc.l Awi_hslid
[0008757e] 0005255e                  dc.l Awi_vslid
[00087582] 00058bb0                  dc.l Awi_sized
[00087586] 00058d50                  dc.l Awi_moved
[0008758a] 0005998a                  dc.l Awi_iconify
[0008758e] 00059c6c                  dc.l Awi_uniconify
[00087592] 0005b5b6                  dc.l Awi_gemscript
[00087596]                           dc.w $0000
[00087598]                           dc.w $0000
[0008759a]                           dc.w $0000
[0008759c]                           dc.w $0000
