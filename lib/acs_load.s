; Pure-C object:
; magic          = 0x4efa
; headerSize     = 0x001c
; imageBytes     = 0x0000347c
; symInfoBytes   = 0x00001e38
; nameBytes      = 0x0000624a
; versionInfo    = 0x00000000
; debugInfo      = 0x0000b4fe size 0x00001723
; reserved1      = 0x00000000
; reserved2      = 0x00000000
compiler:
[00000000] 4267                      clr.w      -(a7)
[00000002] 4e41                      trap       #1
[00000004] 4143                      lea.l      d3,b0 ; apollo only
[00000006] 5339 0000 0000            subq.b     #1,ACSinit
ACSblk:
[0000000c] 0000                      dc.w       $0000
[0000000e] 0000                      dc.w       $0000
[00000010] 0000                      dc.w       $0000
[00000012] 0019 0000                 ori.b      #$00,(a1)+
[00000016] 0000                      dc.w       $0000
[00000018] 0000                      dc.w       $0000
funcAcfg:
[0000001a] 0000                      dc.w       $0000
[0000001c] 0000                      dc.w       $0000
[0000001e] 0000                      dc.w       $0000
funcAch:
[00000020] 0000                      dc.w       $0000
[00000022] 0000                      dc.w       $0000
[00000024] 0000                      dc.w       $0000
funcAdr:
[00000026] 0000                      dc.w       $0000
[00000028] 0000                      dc.w       $0000
[0000002a] 0000                      dc.w       $0000
funcAev:
[0000002c] 0000                      dc.w       $0000
[0000002e] 0000                      dc.w       $0000
[00000030] 0000                      dc.w       $0000
funcAf:
[00000032] 0000                      dc.w       $0000
[00000034] 0000                      dc.w       $0000
[00000036] 0000                      dc.w       $0000
funcAic:
[00000038] 0000                      dc.w       $0000
[0000003a] 0000                      dc.w       $0000
[0000003c] 0000                      dc.w       $0000
funcAim:
[0000003e] 0000                      dc.w       $0000
[00000040] 0000                      dc.w       $0000
[00000042] 0000                      dc.w       $0000
funcAlu:
[00000044] 0000                      dc.w       $0000
[00000046] 0000                      dc.w       $0000
[00000048] 0000                      dc.w       $0000
funcAme:
[0000004a] 0000                      dc.w       $0000
[0000004c] 0000                      dc.w       $0000
[0000004e] 0000                      dc.w       $0000
funcAmo:
[00000050] 0000                      dc.w       $0000
[00000052] 0000                      dc.w       $0000
[00000054] 0000                      dc.w       $0000
funcAob:
[00000056] 0000                      dc.w       $0000
[00000058] 0000                      dc.w       $0000
[0000005a] 0000                      dc.w       $0000
funcAscrp:
[0000005c] 0000                      dc.w       $0000
[0000005e] 0000                      dc.w       $0000
[00000060] 0000                      dc.w       $0000
funcAsh:
[00000062] 0000                      dc.w       $0000
[00000064] 0000                      dc.w       $0000
[00000066] 0000                      dc.w       $0000
funcAst:
[00000068] 0000                      dc.w       $0000
[0000006a] 0000                      dc.w       $0000
[0000006c] 0000                      dc.w       $0000
funcAte:
[0000006e] 0000                      dc.w       $0000
[00000070] 0000                      dc.w       $0000
[00000072] 0000                      dc.w       $0000
funcAuo:
[00000074] 0000                      dc.w       $0000
[00000076] 0000                      dc.w       $0000
[00000078] 0000                      dc.w       $0000
funcAus:
[0000007a] 0000                      dc.w       $0000
[0000007c] 0000                      dc.w       $0000
[0000007e] 0000                      dc.w       $0000
funcAwi:
[00000080] 0000                      dc.w       $0000
[00000082] 0000                      dc.w       $0000
[00000084] 0000                      dc.w       $0000
funcA:
[00000086] 0000                      dc.w       $0000
[00000088] 0000                      dc.w       $0000
[0000008a] 0000                      dc.w       $0000
funcSonst:
[0000008c] 0000                      dc.w       $0000
[0000008e] 0000                      dc.w       $0000
[00000090] 0000                      dc.w       $0000
funcVdi:
[00000092] 0000                      dc.w       $0000
[00000094] 0000                      dc.w       $0000
[00000096] 0000                      dc.w       $0000
funcAes:
[00000098] 0000                      dc.w       $0000
[0000009a] 0000                      dc.w       $0000
[0000009c] 0000                      dc.w       $0000
funcKeytab:
[0000009e] 0000                      dc.w       $0000
[000000a0] 0000                      dc.w       $0000
[000000a2] 0000                      dc.w       $0000
funcMtAes:
[000000a4] 0000                      dc.w       $0000
[000000a6] 0000                      dc.w       $0000
[000000a8] 0000                      dc.w       $0000
aess:
[000000aa] 0000                      dc.w       $0000
[000000ac] 0000                      dc.w       $0000
vdis:
[000000ae] 0000                      dc.w       $0000
[000000b0] 0000                      dc.w       $0000
indirect:
[000000b2] 2f08                      move.l     a0,-(a7)
[000000b4] 206f 0004                 movea.l    4(a7),a0
[000000b8] d1ef 0008                 adda.l     8(a7),a0
[000000bc] 2f50 0008                 move.l     (a0),8(a7)
[000000c0] 205f                      movea.l    (a7)+,a0
[000000c2] 588f                      addq.l     #4,a7
[000000c4] 4e75                      rts
ABP_CREATE:
[000000c6] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[000000cc] 2f3a ff46                 move.l     funcAbp(pc),-(a7)
[000000d0] 60e0                      bra.s      indirect
ABP_DELETE:
[000000d2] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[000000d8] 2f3a ff3a                 move.l     funcAbp(pc),-(a7)
[000000dc] 60d4                      bra.s      indirect
Abp_start:
[000000de] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[000000e4] 2f3a ff2e                 move.l     funcAbp(pc),-(a7)
[000000e8] 60c8                      bra.s      indirect
Abp_end:
[000000ea] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[000000f0] 2f3a ff22                 move.l     funcAbp(pc),-(a7)
[000000f4] 60bc                      bra.s      indirect
Abp_mfdb2img:
[000000f6] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[000000fc] 2f3a ff16                 move.l     funcAbp(pc),-(a7)
[00000100] 60b0                      bra.s      indirect
Abp_img2mfdb:
[00000102] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00000108] 2f3a ff0a                 move.l     funcAbp(pc),-(a7)
[0000010c] 60a4                      bra.s      indirect
Acfg_create:
[0000010e] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000114] 2f3a ff04                 move.l     funcAcfg(pc),-(a7)
[00000118] 6098                      bra.s      indirect
Acfg_delete:
[0000011a] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000120] 2f3a fef8                 move.l     funcAcfg(pc),-(a7)
[00000124] 608c                      bra.s      indirect
Acfg_clear:
[00000126] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[0000012c] 2f3a feec                 move.l     funcAcfg(pc),-(a7)
[00000130] 6080                      bra.s      indirect
ACFG_CLEARALLGROUPS:
[00000132] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00000138] 2f3a fee0                 move.l     funcAcfg(pc),-(a7)
[0000013c] 6000 ff74                 bra        indirect
ACFG_CLEARGROUP:
[00000140] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[00000146] 2f3a fed2                 move.l     funcAcfg(pc),-(a7)
[0000014a] 6000 ff66                 bra        indirect
ACFG_LOAD:
[0000014e] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00000154] 2f3a fec4                 move.l     funcAcfg(pc),-(a7)
[00000158] 6000 ff58                 bra        indirect
ACFG_SAVE:
[0000015c] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000162] 2f3a feb6                 move.l     funcAcfg(pc),-(a7)
[00000166] 6000 ff4a                 bra        indirect
ACFG_ISCHANGED:
[0000016a] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00000170] 2f3a fea8                 move.l     funcAcfg(pc),-(a7)
[00000174] 6000 ff3c                 bra        indirect
ACFG_GETVALUE:
[00000178] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[0000017e] 2f3a fe9a                 move.l     funcAcfg(pc),-(a7)
[00000182] 6000 ff2e                 bra        indirect
ACFG_SETVALUE:
[00000186] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[0000018c] 2f3a fe8c                 move.l     funcAcfg(pc),-(a7)
[00000190] 6000 ff20                 bra        indirect
ACFG_CLEARVALUE:
[00000194] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[0000019a] 2f3a fe7e                 move.l     funcAcfg(pc),-(a7)
[0000019e] 6000 ff12                 bra        indirect
Acfg_getChar:
[000001a2] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[000001a8] 2f3a fe70                 move.l     funcAcfg(pc),-(a7)
[000001ac] 6000 ff04                 bra        indirect
Acfg_setChar:
[000001b0] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[000001b6] 2f3a fe62                 move.l     funcAcfg(pc),-(a7)
[000001ba] 6000 fef6                 bra        indirect
Acfg_getLong:
[000001be] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[000001c4] 2f3a fe54                 move.l     funcAcfg(pc),-(a7)
[000001c8] 6000 fee8                 bra        indirect
Acfg_setLong:
[000001cc] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[000001d2] 2f3a fe46                 move.l     funcAcfg(pc),-(a7)
[000001d6] 6000 feda                 bra        indirect
Acfg_getString:
[000001da] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[000001e0] 2f3a fe38                 move.l     funcAcfg(pc),-(a7)
[000001e4] 6000 fecc                 bra        indirect
Acfg_getBool:
[000001e8] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[000001ee] 2f3a fe2a                 move.l     funcAcfg(pc),-(a7)
[000001f2] 6000 febe                 bra        indirect
Acfg_setBool:
[000001f6] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[000001fc] 2f3a fe1c                 move.l     funcAcfg(pc),-(a7)
[00000200] 6000 feb0                 bra        indirect
Acfg_clearHeader:
[00000204] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[0000020a] 2f3a fe0e                 move.l     funcAcfg(pc),-(a7)
[0000020e] 6000 fea2                 bra        indirect
Acfg_headAnzahl:
[00000212] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[00000218] 2f3a fe00                 move.l     funcAcfg(pc),-(a7)
[0000021c] 6000 fe94                 bra        indirect
Acfg_setHeader:
[00000220] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[00000226] 2f3a fdf2                 move.l     funcAcfg(pc),-(a7)
[0000022a] 6000 fe86                 bra        indirect
Acfg_getHeader:
[0000022e] 2f3c 0000 0054            move.l     #$00000054,-(a7)
[00000234] 2f3a fde4                 move.l     funcAcfg(pc),-(a7)
[00000238] 6000 fe78                 bra        indirect
Acfg_grpAnzahl:
[0000023c] 2f3c 0000 0058            move.l     #$00000058,-(a7)
[00000242] 2f3a fdd6                 move.l     funcAcfg(pc),-(a7)
[00000246] 6000 fe6a                 bra        indirect
Acfg_grpName:
[0000024a] 2f3c 0000 005c            move.l     #$0000005C,-(a7)
[00000250] 2f3a fdc8                 move.l     funcAcfg(pc),-(a7)
[00000254] 6000 fe5c                 bra        indirect
Acfg_strAnzahl:
[00000258] 2f3c 0000 0060            move.l     #$00000060,-(a7)
[0000025e] 2f3a fdba                 move.l     funcAcfg(pc),-(a7)
[00000262] 6000 fe4e                 bra        indirect
Acfg_strName:
[00000266] 2f3c 0000 0064            move.l     #$00000064,-(a7)
[0000026c] 2f3a fdac                 move.l     funcAcfg(pc),-(a7)
[00000270] 6000 fe40                 bra        indirect
ACFG_STRVALUE:
[00000274] 2f3c 0000 0068            move.l     #$00000068,-(a7)
[0000027a] 2f3a fd9e                 move.l     funcAcfg(pc),-(a7)
[0000027e] 6000 fe32                 bra        indirect
ACFG_STRISCOMMENT:
[00000282] 2f3c 0000 006c            move.l     #$0000006C,-(a7)
[00000288] 2f3a fd90                 move.l     funcAcfg(pc),-(a7)
[0000028c] 6000 fe24                 bra        indirect
ACFG_ISCFGFILE:
[00000290] 2f3c 0000 0070            move.l     #$00000070,-(a7)
[00000296] 2f3a fd82                 move.l     funcAcfg(pc),-(a7)
[0000029a] 6000 fe16                 bra        indirect
ACFG_CREATEINFO:
[0000029e] 2f3c 0000 0074            move.l     #$00000074,-(a7)
[000002a4] 2f3a fd74                 move.l     funcAcfg(pc),-(a7)
[000002a8] 6000 fe08                 bra        indirect
ACFG_DELETEINFO:
[000002ac] 2f3c 0000 0078            move.l     #$00000078,-(a7)
[000002b2] 2f3a fd66                 move.l     funcAcfg(pc),-(a7)
[000002b6] 6000 fdfa                 bra        indirect
ACFG_SETINFO:
[000002ba] 2f3c 0000 007c            move.l     #$0000007C,-(a7)
[000002c0] 2f3a fd58                 move.l     funcAcfg(pc),-(a7)
[000002c4] 6000 fdec                 bra        indirect
ACFG_GETINFO:
[000002c8] 2f3c 0000 0080            move.l     #$00000080,-(a7)
[000002ce] 2f3a fd4a                 move.l     funcAcfg(pc),-(a7)
[000002d2] 6000 fdde                 bra        indirect
ACFG_COPYINFO:
[000002d6] 2f3c 0000 0084            move.l     #$00000084,-(a7)
[000002dc] 2f3a fd3c                 move.l     funcAcfg(pc),-(a7)
[000002e0] 6000 fdd0                 bra        indirect
Acfg_flags:
[000002e4] 2f3c 0000 0088            move.l     #$00000088,-(a7)
[000002ea] 2f3a fd2e                 move.l     funcAcfg(pc),-(a7)
[000002ee] 6000 fdc2                 bra        indirect
Acfg_isGroupPresent:
[000002f2] 2f3c 0000 008c            move.l     #$0000008C,-(a7)
[000002f8] 2f3a fd20                 move.l     funcAcfg(pc),-(a7)
[000002fc] 6000 fdb4                 bra        indirect
Acfg_isStringPresent:
[00000300] 2f3c 0000 0090            move.l     #$00000090,-(a7)
[00000306] 2f3a fd12                 move.l     funcAcfg(pc),-(a7)
[0000030a] 6000 fda6                 bra        indirect
Ach_tolower:
[0000030e] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000314] 2f3a fd0a                 move.l     funcAch(pc),-(a7)
[00000318] 6000 fd98                 bra        indirect
Ach_toupper:
[0000031c] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000322] 2f3a fcfc                 move.l     funcAch(pc),-(a7)
[00000326] 6000 fd8a                 bra        indirect
Ach_isWhite:
[0000032a] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00000330] 2f3a fcee                 move.l     funcAch(pc),-(a7)
[00000334] 6000 fd7c                 bra        indirect
Adr_box:
[00000338] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[0000033e] 2f3a fce6                 move.l     funcAdr(pc),-(a7)
[00000342] 6000 fd6e                 bra        indirect
ADR_DRAG:
[00000346] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[0000034c] 2f3a fcd8                 move.l     funcAdr(pc),-(a7)
[00000350] 6000 fd60                 bra        indirect
ADR_NEXT:
[00000354] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[0000035a] 2f3a fcca                 move.l     funcAdr(pc),-(a7)
[0000035e] 6000 fd52                 bra        indirect
ADR_ADD:
[00000362] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00000368] 2f3a fcbc                 move.l     funcAdr(pc),-(a7)
[0000036c] 6000 fd44                 bra        indirect
ADR_DEL:
[00000370] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[00000376] 2f3a fcae                 move.l     funcAdr(pc),-(a7)
[0000037a] 6000 fd36                 bra        indirect
ADR_UNSELECT:
[0000037e] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00000384] 2f3a fca0                 move.l     funcAdr(pc),-(a7)
[00000388] 6000 fd28                 bra        indirect
ADR_START:
[0000038c] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000392] 2f3a fc92                 move.l     funcAdr(pc),-(a7)
[00000396] 6000 fd1a                 bra        indirect
AEV_QUIT:
[0000039a] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[000003a0] 2f3a fc8a                 move.l     funcAev(pc),-(a7)
[000003a4] 6000 fd0c                 bra        indirect
AEV_RELEASE:
[000003a8] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[000003ae] 2f3a fc7c                 move.l     funcAev(pc),-(a7)
[000003b2] 6000 fcfe                 bra        indirect
AEV_MESS:
[000003b6] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[000003bc] 2f3a fc6e                 move.l     funcAev(pc),-(a7)
[000003c0] 6000 fcf0                 bra        indirect
AEV_UNHIDEPOINTER:
[000003c4] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[000003ca] 2f3a fc60                 move.l     funcAev(pc),-(a7)
[000003ce] 6000 fce2                 bra        indirect
AEV_DHSTADD:
[000003d2] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[000003d8] 2f3a fc52                 move.l     funcAev(pc),-(a7)
[000003dc] 6000 fcd4                 bra        indirect
AEV_DHSTSAVED:
[000003e0] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[000003e6] 2f3a fc44                 move.l     funcAev(pc),-(a7)
[000003ea] 6000 fcc6                 bra        indirect
AEV_WMREDRAW:
[000003ee] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[000003f4] 2f3a fc36                 move.l     funcAev(pc),-(a7)
[000003f8] 6000 fcb8                 bra        indirect
AF_CFGFILE:
[000003fc] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000402] 2f3a fc2e                 move.l     funcAf(pc),-(a7)
[00000406] 6000 fcaa                 bra        indirect
AF_SELECT:
[0000040a] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000410] 2f3a fc20                 move.l     funcAf(pc),-(a7)
[00000414] 6000 fc9c                 bra        indirect
AF_2DRV:
[00000418] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[0000041e] 2f3a fc12                 move.l     funcAf(pc),-(a7)
[00000422] 6000 fc8e                 bra        indirect
Af_2path:
[00000426] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[0000042c] 2f3a fc04                 move.l     funcAf(pc),-(a7)
[00000430] 6000 fc80                 bra        indirect
Af_2name:
[00000434] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[0000043a] 2f3a fbf6                 move.l     funcAf(pc),-(a7)
[0000043e] 6000 fc72                 bra        indirect
Af_2fullname:
[00000442] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00000448] 2f3a fbe8                 move.l     funcAf(pc),-(a7)
[0000044c] 6000 fc64                 bra        indirect
Af_2ext:
[00000450] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000456] 2f3a fbda                 move.l     funcAf(pc),-(a7)
[0000045a] 6000 fc56                 bra        indirect
Af_buildname:
[0000045e] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00000464] 2f3a fbcc                 move.l     funcAf(pc),-(a7)
[00000468] 6000 fc48                 bra        indirect
Af_length:
[0000046c] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[00000472] 2f3a fbbe                 move.l     funcAf(pc),-(a7)
[00000476] 6000 fc3a                 bra        indirect
Af_first_fsel:
[0000047a] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[00000480] 2f3a fbb0                 move.l     funcAf(pc),-(a7)
[00000484] 6000 fc2c                 bra        indirect
AF_NEXT_FSEL:
[00000488] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[0000048e] 2f3a fba2                 move.l     funcAf(pc),-(a7)
[00000492] 6000 fc1e                 bra        indirect
AF_FIRST:
[00000496] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[0000049c] 2f3a fb94                 move.l     funcAf(pc),-(a7)
[000004a0] 6000 fc10                 bra        indirect
AF_NEXT:
[000004a4] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[000004aa] 2f3a fb86                 move.l     funcAf(pc),-(a7)
[000004ae] 6000 fc02                 bra        indirect
AF_READDIR:
[000004b2] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[000004b8] 2f3a fb78                 move.l     funcAf(pc),-(a7)
[000004bc] 6000 fbf4                 bra        indirect
AF_FREEDIR:
[000004c0] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[000004c6] 2f3a fb6a                 move.l     funcAf(pc),-(a7)
[000004ca] 6000 fbe6                 bra        indirect
AF_FILESELECT:
[000004ce] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[000004d4] 2f3a fb5c                 move.l     funcAf(pc),-(a7)
[000004d8] 6000 fbd8                 bra        indirect
AF_QUOTE:
[000004dc] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[000004e2] 2f3a fb4e                 move.l     funcAf(pc),-(a7)
[000004e6] 6000 fbca                 bra        indirect
AF_UNQUOTE:
[000004ea] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[000004f0] 2f3a fb40                 move.l     funcAf(pc),-(a7)
[000004f4] 6000 fbbc                 bra        indirect
Aic_create:
[000004f8] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[000004fe] 2f3a fb38                 move.l     funcAic(pc),-(a7)
[00000502] 6000 fbae                 bra        indirect
Aic_delete:
[00000506] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[0000050c] 2f3a fb2a                 move.l     funcAic(pc),-(a7)
[00000510] 6000 fba0                 bra        indirect
Aim_create:
[00000514] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[0000051a] 2f3a fb22                 move.l     funcAim(pc),-(a7)
[0000051e] 6000 fb92                 bra        indirect
Aim_delete:
[00000522] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000528] 2f3a fb14                 move.l     funcAim(pc),-(a7)
[0000052c] 6000 fb84                 bra        indirect
Alu_create:
[00000530] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000536] 2f3a fb0c                 move.l     funcAlu(pc),-(a7)
[0000053a] 6000 fb76                 bra        indirect
Alu_delete:
[0000053e] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000544] 2f3a fafe                 move.l     funcAlu(pc),-(a7)
[00000548] 6000 fb68                 bra        indirect
Ame_namefix:
[0000054c] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000552] 2f3a faf6                 move.l     funcAme(pc),-(a7)
[00000556] 6000 fb5a                 bra        indirect
Ame_popup:
[0000055a] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000560] 2f3a fae8                 move.l     funcAme(pc),-(a7)
[00000564] 6000 fb4c                 bra        indirect
Amo_new:
[00000568] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[0000056e] 2f3a fae0                 move.l     funcAmo(pc),-(a7)
[00000572] 6000 fb3e                 bra        indirect
Amo_busy:
[00000576] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[0000057c] 2f3a fad2                 move.l     funcAmo(pc),-(a7)
[00000580] 6000 fb30                 bra        indirect
Amo_unbusy:
[00000584] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[0000058a] 2f3a fac4                 move.l     funcAmo(pc),-(a7)
[0000058e] 6000 fb22                 bra        indirect
Amo_hide:
[00000592] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00000598] 2f3a fab6                 move.l     funcAmo(pc),-(a7)
[0000059c] 6000 fb14                 bra        indirect
Amo_show:
[000005a0] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[000005a6] 2f3a faa8                 move.l     funcAmo(pc),-(a7)
[000005aa] 6000 fb06                 bra        indirect
Aob_create:
[000005ae] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[000005b4] 2f3a faa0                 move.l     funcAob(pc),-(a7)
[000005b8] 6000 faf8                 bra        indirect
Aob_delete:
[000005bc] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[000005c2] 2f3a fa92                 move.l     funcAob(pc),-(a7)
[000005c6] 6000 faea                 bra        indirect
AOB_FIX:
[000005ca] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[000005d0] 2f3a fa84                 move.l     funcAob(pc),-(a7)
[000005d4] 6000 fadc                 bra        indirect
AOB_OFFSET:
[000005d8] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[000005de] 2f3a fa76                 move.l     funcAob(pc),-(a7)
[000005e2] 6000 face                 bra        indirect
AOB_SAVE:
[000005e6] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[000005ec] 2f3a fa68                 move.l     funcAob(pc),-(a7)
[000005f0] 6000 fac0                 bra        indirect
AOB_RESTORE:
[000005f4] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[000005fa] 2f3a fa5a                 move.l     funcAob(pc),-(a7)
[000005fe] 6000 fab2                 bra        indirect
AOB_WATCH:
[00000602] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000608] 2f3a fa4c                 move.l     funcAob(pc),-(a7)
[0000060c] 6000 faa4                 bra        indirect
AOB_FINDFLAG:
[00000610] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00000616] 2f3a fa3e                 move.l     funcAob(pc),-(a7)
[0000061a] 6000 fa96                 bra        indirect
AOB_ALIAS:
[0000061e] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[00000624] 2f3a fa30                 move.l     funcAob(pc),-(a7)
[00000628] 6000 fa88                 bra        indirect
Aob_up:
[0000062c] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[00000632] 2f3a fa22                 move.l     funcAob(pc),-(a7)
[00000636] 6000 fa7a                 bra        indirect
Aob_icon:
[0000063a] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[00000640] 2f3a fa14                 move.l     funcAob(pc),-(a7)
[00000644] 6000 fa6c                 bra        indirect
Aob_puttext:
[00000648] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[0000064e] 2f3a fa06                 move.l     funcAob(pc),-(a7)
[00000652] 6000 fa5e                 bra        indirect
Aob_gettext:
[00000656] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[0000065c] 2f3a f9f8                 move.l     funcAob(pc),-(a7)
[00000660] 6000 fa50                 bra        indirect
Aob_within:
[00000664] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[0000066a] 2f3a f9ea                 move.l     funcAob(pc),-(a7)
[0000066e] 6000 fa42                 bra        indirect
Aob_printf:
[00000672] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[00000678] 2f3a f9dc                 move.l     funcAob(pc),-(a7)
[0000067c] 6000 fa34                 bra        indirect
Aob_scanf:
[00000680] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[00000686] 2f3a f9ce                 move.l     funcAob(pc),-(a7)
[0000068a] 6000 fa26                 bra        indirect
Aob_flags:
[0000068e] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[00000694] 2f3a f9c0                 move.l     funcAob(pc),-(a7)
[00000698] 6000 fa18                 bra        indirect
AOB_STATE:
[0000069c] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[000006a2] 2f3a f9b2                 move.l     funcAob(pc),-(a7)
[000006a6] 6000 fa0a                 bra        indirect
AOB_SERVICE:
[000006aa] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[000006b0] 2f3a f9a4                 move.l     funcAob(pc),-(a7)
[000006b4] 6000 f9fc                 bra        indirect
AOB_VISIBLE:
[000006b8] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[000006be] 2f3a f996                 move.l     funcAob(pc),-(a7)
[000006c2] 6000 f9ee                 bra        indirect
AOB_COUNT:
[000006c6] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[000006cc] 2f3a f988                 move.l     funcAob(pc),-(a7)
[000006d0] 6000 f9e0                 bra        indirect
ASCRP_CLEAR:
[000006d4] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[000006da] 2f3a f980                 move.l     funcAscrp(pc),-(a7)
[000006de] 6000 f9d2                 bra        indirect
ASCRP_GET:
[000006e2] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[000006e8] 2f3a f972                 move.l     funcAscrp(pc),-(a7)
[000006ec] 6000 f9c4                 bra        indirect
ASCRP_PUT:
[000006f0] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[000006f6] 2f3a f964                 move.l     funcAscrp(pc),-(a7)
[000006fa] 6000 f9b6                 bra        indirect
ASH_PROG:
[000006fe] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000704] 2f3a f95c                 move.l     funcAsh(pc),-(a7)
[00000708] 6000 f9a8                 bra        indirect
ASH_ERROR:
[0000070c] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000712] 2f3a f94e                 move.l     funcAsh(pc),-(a7)
[00000716] 6000 f99a                 bra        indirect
ASH_GETCOOKIE:
[0000071a] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00000720] 2f3a f940                 move.l     funcAsh(pc),-(a7)
[00000724] 6000 f98c                 bra        indirect
ASH_GETENV:
[00000728] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[0000072e] 2f3a f932                 move.l     funcAsh(pc),-(a7)
[00000732] 6000 f97e                 bra        indirect
ASH_NEXTDD:
[00000736] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[0000073c] 2f3a f924                 move.l     funcAsh(pc),-(a7)
[00000740] 6000 f970                 bra        indirect
ASH_SENDALL:
[00000744] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[0000074a] 2f3a f916                 move.l     funcAsh(pc),-(a7)
[0000074e] 6000 f962                 bra        indirect
ASH_CALLEDDI:
[00000752] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000758] 2f3a f908                 move.l     funcAsh(pc),-(a7)
[0000075c] 6000 f954                 bra        indirect
ASH_NVDICOOKIE:
[00000760] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00000766] 2f3a f8fa                 move.l     funcAsh(pc),-(a7)
[0000076a] 6000 f946                 bra        indirect
ASH_NVDIVERSION:
[0000076e] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[00000774] 2f3a f8ec                 move.l     funcAsh(pc),-(a7)
[00000778] 6000 f938                 bra        indirect
Ash_NVDIDatum:
[0000077c] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[00000782] 2f3a f8de                 move.l     funcAsh(pc),-(a7)
[00000786] 6000 f92a                 bra        indirect
Ash_thermometer:
[0000078a] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[00000790] 2f3a f8d0                 move.l     funcAsh(pc),-(a7)
[00000794] 6000 f91c                 bra        indirect
Ash_fileselect:
[00000798] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[0000079e] 2f3a f8c2                 move.l     funcAsh(pc),-(a7)
[000007a2] 6000 f90e                 bra        indirect
Ash_font:
[000007a6] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[000007ac] 2f3a f8b4                 move.l     funcAsh(pc),-(a7)
[000007b0] 6000 f900                 bra        indirect
Ash_print:
[000007b4] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[000007ba] 2f3a f8a6                 move.l     funcAsh(pc),-(a7)
[000007be] 6000 f8f2                 bra        indirect
Ash_gettimer:
[000007c2] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[000007c8] 2f3a f898                 move.l     funcAsh(pc),-(a7)
[000007cc] 6000 f8e4                 bra        indirect
Ash_printSetIcon:
[000007d0] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[000007d6] 2f3a f88a                 move.l     funcAsh(pc),-(a7)
[000007da] 6000 f8d6                 bra        indirect
ASH_FONTSETICON:
[000007de] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[000007e4] 2f3a f87c                 move.l     funcAsh(pc),-(a7)
[000007e8] 6000 f8c8                 bra        indirect
ASH_FILESETICON:
[000007ec] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[000007f2] 2f3a f86e                 move.l     funcAsh(pc),-(a7)
[000007f6] 6000 f8ba                 bra        indirect
ASH_GETOSHEADER:
[000007fa] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[00000800] 2f3a f860                 move.l     funcAsh(pc),-(a7)
[00000804] 6000 f8ac                 bra        indirect
ASH_GETMAGIC:
[00000808] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[0000080e] 2f3a f852                 move.l     funcAsh(pc),-(a7)
[00000812] 6000 f89e                 bra        indirect
ASH_GETNAES:
[00000816] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[0000081c] 2f3a f844                 move.l     funcAsh(pc),-(a7)
[00000820] 6000 f890                 bra        indirect
ASH_GETMAGICVERSION:
[00000824] 2f3c 0000 0054            move.l     #$00000054,-(a7)
[0000082a] 2f3a f836                 move.l     funcAsh(pc),-(a7)
[0000082e] 6000 f882                 bra        indirect
ASH_GETMAGICAESVARS:
[00000832] 2f3c 0000 0058            move.l     #$00000058,-(a7)
[00000838] 2f3a f828                 move.l     funcAsh(pc),-(a7)
[0000083c] 6000 f874                 bra        indirect
AST_CREATE:
[00000840] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000846] 2f3a f820                 move.l     funcAst(pc),-(a7)
[0000084a] 6000 f866                 bra        indirect
Ast_delete:
[0000084e] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000854] 2f3a f812                 move.l     funcAst(pc),-(a7)
[00000858] 6000 f858                 bra        indirect
Ast_tolower:
[0000085c] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00000862] 2f3a f804                 move.l     funcAst(pc),-(a7)
[00000866] 6000 f84a                 bra        indirect
Ast_toupper:
[0000086a] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00000870] 2f3a f7f6                 move.l     funcAst(pc),-(a7)
[00000874] 6000 f83c                 bra        indirect
Ast_ltrim:
[00000878] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[0000087e] 2f3a f7e8                 move.l     funcAst(pc),-(a7)
[00000882] 6000 f82e                 bra        indirect
Ast_rtrim:
[00000886] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[0000088c] 2f3a f7da                 move.l     funcAst(pc),-(a7)
[00000890] 6000 f820                 bra        indirect
Ast_alltrim:
[00000894] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[0000089a] 2f3a f7cc                 move.l     funcAst(pc),-(a7)
[0000089e] 6000 f812                 bra        indirect
Ast_cmp:
[000008a2] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[000008a8] 2f3a f7be                 move.l     funcAst(pc),-(a7)
[000008ac] 6000 f804                 bra        indirect
Ast_icmp:
[000008b0] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[000008b6] 2f3a f7b0                 move.l     funcAst(pc),-(a7)
[000008ba] 6000 f7f6                 bra        indirect
Ast_isEmpty:
[000008be] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[000008c4] 2f3a f7a2                 move.l     funcAst(pc),-(a7)
[000008c8] 6000 f7e8                 bra        indirect
Ast_add:
[000008cc] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[000008d2] 2f3a f794                 move.l     funcAst(pc),-(a7)
[000008d6] 6000 f7da                 bra        indirect
Ast_adl:
[000008da] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[000008e0] 2f3a f786                 move.l     funcAst(pc),-(a7)
[000008e4] 6000 f7cc                 bra        indirect
Ast_adr:
[000008e8] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[000008ee] 2f3a f778                 move.l     funcAst(pc),-(a7)
[000008f2] 6000 f7be                 bra        indirect
Ast_adc:
[000008f6] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[000008fc] 2f3a f76a                 move.l     funcAst(pc),-(a7)
[00000900] 6000 f7b0                 bra        indirect
Ast_filter:
[00000904] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[0000090a] 2f3a f75c                 move.l     funcAst(pc),-(a7)
[0000090e] 6000 f7a2                 bra        indirect
Ast_count:
[00000912] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[00000918] 2f3a f74e                 move.l     funcAst(pc),-(a7)
[0000091c] 6000 f794                 bra        indirect
AST_FCMP:
[00000920] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[00000926] 2f3a f740                 move.l     funcAst(pc),-(a7)
[0000092a] 6000 f786                 bra        indirect
AST_NCMP:
[0000092e] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[00000934] 2f3a f732                 move.l     funcAst(pc),-(a7)
[00000938] 6000 f778                 bra        indirect
AST_INCMP:
[0000093c] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[00000942] 2f3a f724                 move.l     funcAst(pc),-(a7)
[00000946] 6000 f76a                 bra        indirect
AST_ISTR:
[0000094a] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[00000950] 2f3a f716                 move.l     funcAst(pc),-(a7)
[00000954] 6000 f75c                 bra        indirect
ATE_CREATE:
[00000958] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[0000095e] 2f3a f70e                 move.l     funcAte(pc),-(a7)
[00000962] 6000 f74e                 bra        indirect
ATE_DELETE:
[00000966] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[0000096c] 2f3a f700                 move.l     funcAte(pc),-(a7)
[00000970] 6000 f740                 bra        indirect
AUO_FTEXT:
[00000974] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[0000097a] 2f3a f6f8                 move.l     funcAuo(pc),-(a7)
[0000097e] 6000 f732                 bra        indirect
AUO_STRING:
[00000982] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000988] 2f3a f6ea                 move.l     funcAuo(pc),-(a7)
[0000098c] 6000 f724                 bra        indirect
Auo_cycle:
[00000990] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00000996] 2f3a f6dc                 move.l     funcAuo(pc),-(a7)
[0000099a] 6000 f716                 bra        indirect
Auo_picture:
[0000099e] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[000009a4] 2f3a f6ce                 move.l     funcAuo(pc),-(a7)
[000009a8] 6000 f708                 bra        indirect
Auo_boxed:
[000009ac] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[000009b2] 2f3a f6c0                 move.l     funcAuo(pc),-(a7)
[000009b6] 6000 f6fa                 bra        indirect
Aus_create:
[000009ba] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[000009c0] 2f3a f6b8                 move.l     funcAus(pc),-(a7)
[000009c4] 6000 f6ec                 bra        indirect
Aus_delete:
[000009c8] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[000009ce] 2f3a f6aa                 move.l     funcAus(pc),-(a7)
[000009d2] 6000 f6de                 bra        indirect
Aus_boxed:
[000009d6] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[000009dc] 2f3a f69c                 move.l     funcAus(pc),-(a7)
[000009e0] 6000 f6d0                 bra        indirect
Aus_cycle:
[000009e4] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[000009ea] 2f3a f68e                 move.l     funcAus(pc),-(a7)
[000009ee] 6000 f6c2                 bra        indirect
AWI_WID:
[000009f2] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[000009f8] 2f3a f686                 move.l     funcAwi(pc),-(a7)
[000009fc] 6000 f6b4                 bra        indirect
AWI_ROOT:
[00000a00] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000a06] 2f3a f678                 move.l     funcAwi(pc),-(a7)
[00000a0a] 6000 f6a6                 bra        indirect
AWI_LIST:
[00000a0e] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00000a14] 2f3a f66a                 move.l     funcAwi(pc),-(a7)
[00000a18] 6000 f698                 bra        indirect
AWI_SENDALL:
[00000a1c] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00000a22] 2f3a f65c                 move.l     funcAwi(pc),-(a7)
[00000a26] 6000 f68a                 bra        indirect
AWI_DOWN:
[00000a2a] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[00000a30] 2f3a f64e                 move.l     funcAwi(pc),-(a7)
[00000a34] 6000 f67c                 bra        indirect
Awi_up:
[00000a38] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00000a3e] 2f3a f640                 move.l     funcAwi(pc),-(a7)
[00000a42] 6000 f66e                 bra        indirect
AWI_SHOW:
[00000a46] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000a4c] 2f3a f632                 move.l     funcAwi(pc),-(a7)
[00000a50] 6000 f660                 bra        indirect
AWI_INIT:
[00000a54] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00000a5a] 2f3a f624                 move.l     funcAwi(pc),-(a7)
[00000a5e] 6000 f652                 bra        indirect
AWI_CREATE:
[00000a62] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[00000a68] 2f3a f616                 move.l     funcAwi(pc),-(a7)
[00000a6c] 6000 f644                 bra        indirect
AWI_OPEN:
[00000a70] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[00000a76] 2f3a f608                 move.l     funcAwi(pc),-(a7)
[00000a7a] 6000 f636                 bra        indirect
AWI_CLOSED:
[00000a7e] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[00000a84] 2f3a f5fa                 move.l     funcAwi(pc),-(a7)
[00000a88] 6000 f628                 bra        indirect
AWI_DELETE:
[00000a8c] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[00000a92] 2f3a f5ec                 move.l     funcAwi(pc),-(a7)
[00000a96] 6000 f61a                 bra        indirect
AWI_TOPPED:
[00000a9a] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[00000aa0] 2f3a f5de                 move.l     funcAwi(pc),-(a7)
[00000aa4] 6000 f60c                 bra        indirect
AWI_FULLED:
[00000aa8] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[00000aae] 2f3a f5d0                 move.l     funcAwi(pc),-(a7)
[00000ab2] 6000 f5fe                 bra        indirect
AWI_SIZED:
[00000ab6] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[00000abc] 2f3a f5c2                 move.l     funcAwi(pc),-(a7)
[00000ac0] 6000 f5f0                 bra        indirect
AWI_MOVED:
[00000ac4] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[00000aca] 2f3a f5b4                 move.l     funcAwi(pc),-(a7)
[00000ace] 6000 f5e2                 bra        indirect
Awi_diaend:
[00000ad2] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[00000ad8] 2f3a f5a6                 move.l     funcAwi(pc),-(a7)
[00000adc] 6000 f5d4                 bra        indirect
Awi_diastart:
[00000ae0] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[00000ae6] 2f3a f598                 move.l     funcAwi(pc),-(a7)
[00000aea] 6000 f5c6                 bra        indirect
Awi_keys:
[00000aee] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[00000af4] 2f3a f58a                 move.l     funcAwi(pc),-(a7)
[00000af8] 6000 f5b8                 bra        indirect
Awi_obview:
[00000afc] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[00000b02] 2f3a f57c                 move.l     funcAwi(pc),-(a7)
[00000b06] 6000 f5aa                 bra        indirect
Awi_service:
[00000b0a] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[00000b10] 2f3a f56e                 move.l     funcAwi(pc),-(a7)
[00000b14] 6000 f59c                 bra        indirect
Awi_scroll:
[00000b18] 2f3c 0000 0054            move.l     #$00000054,-(a7)
[00000b1e] 2f3a f560                 move.l     funcAwi(pc),-(a7)
[00000b22] 6000 f58e                 bra        indirect
Awi_obchange:
[00000b26] 2f3c 0000 0058            move.l     #$00000058,-(a7)
[00000b2c] 2f3a f552                 move.l     funcAwi(pc),-(a7)
[00000b30] 6000 f580                 bra        indirect
AWI_OBREDRAW:
[00000b34] 2f3c 0000 005c            move.l     #$0000005C,-(a7)
[00000b3a] 2f3a f544                 move.l     funcAwi(pc),-(a7)
[00000b3e] 6000 f572                 bra        indirect
AWI_REDRAW:
[00000b42] 2f3c 0000 0060            move.l     #$00000060,-(a7)
[00000b48] 2f3a f536                 move.l     funcAwi(pc),-(a7)
[00000b4c] 6000 f564                 bra        indirect
AWI_ARROWED:
[00000b50] 2f3c 0000 0064            move.l     #$00000064,-(a7)
[00000b56] 2f3a f528                 move.l     funcAwi(pc),-(a7)
[00000b5a] 6000 f556                 bra        indirect
AWI_HSLID:
[00000b5e] 2f3c 0000 0068            move.l     #$00000068,-(a7)
[00000b64] 2f3a f51a                 move.l     funcAwi(pc),-(a7)
[00000b68] 6000 f548                 bra        indirect
AWI_VSLID:
[00000b6c] 2f3c 0000 006c            move.l     #$0000006C,-(a7)
[00000b72] 2f3a f50c                 move.l     funcAwi(pc),-(a7)
[00000b76] 6000 f53a                 bra        indirect
AWI_ICONIFY:
[00000b7a] 2f3c 0000 0070            move.l     #$00000070,-(a7)
[00000b80] 2f3a f4fe                 move.l     funcAwi(pc),-(a7)
[00000b84] 6000 f52c                 bra        indirect
AWI_UNICONIFY:
[00000b88] 2f3c 0000 0074            move.l     #$00000074,-(a7)
[00000b8e] 2f3a f4f0                 move.l     funcAwi(pc),-(a7)
[00000b92] 6000 f51e                 bra        indirect
AWI_GEMSCRIPT:
[00000b96] 2f3c 0000 0078            move.l     #$00000078,-(a7)
[00000b9c] 2f3a f4e2                 move.l     funcAwi(pc),-(a7)
[00000ba0] 6000 f510                 bra        indirect
Awi_modal:
[00000ba4] 2f3c 0000 007c            move.l     #$0000007C,-(a7)
[00000baa] 2f3a f4d4                 move.l     funcAwi(pc),-(a7)
[00000bae] 6000 f502                 bra        indirect
Awi_dialog:
[00000bb2] 2f3c 0000 0080            move.l     #$00000080,-(a7)
[00000bb8] 2f3a f4c6                 move.l     funcAwi(pc),-(a7)
[00000bbc] 6000 f4f4                 bra        indirect
Awi_alert:
[00000bc0] 2f3c 0000 0084            move.l     #$00000084,-(a7)
[00000bc6] 2f3a f4b8                 move.l     funcAwi(pc),-(a7)
[00000bca] 6000 f4e6                 bra        indirect
Awi_selfcreate:
[00000bce] 2f3c 0000 0088            move.l     #$00000088,-(a7)
[00000bd4] 2f3a f4aa                 move.l     funcAwi(pc),-(a7)
[00000bd8] 6000 f4d8                 bra        indirect
Awi_nokey:
[00000bdc] 2f3c 0000 008c            move.l     #$0000008C,-(a7)
[00000be2] 2f3a f49c                 move.l     funcAwi(pc),-(a7)
[00000be6] 6000 f4ca                 bra        indirect
Awi_update:
[00000bea] 2f3c 0000 0090            move.l     #$00000090,-(a7)
[00000bf0] 2f3a f48e                 move.l     funcAwi(pc),-(a7)
[00000bf4] 6000 f4bc                 bra        indirect
Awi_uoself:
[00000bf8] 2f3c 0000 0094            move.l     #$00000094,-(a7)
[00000bfe] 2f3a f480                 move.l     funcAwi(pc),-(a7)
[00000c02] 6000 f4ae                 bra        indirect
Awi_doform:
[00000c06] 2f3c 0000 0098            move.l     #$00000098,-(a7)
[00000c0c] 2f3a f472                 move.l     funcAwi(pc),-(a7)
[00000c10] 6000 f4a0                 bra        indirect
Awi_observice:
[00000c14] 2f3c 0000 009c            move.l     #$0000009C,-(a7)
[00000c1a] 2f3a f464                 move.l     funcAwi(pc),-(a7)
[00000c1e] 6000 f492                 bra        indirect
Awi_ontop:
[00000c22] 2f3c 0000 00a0            move.l     #$000000A0,-(a7)
[00000c28] 2f3a f456                 move.l     funcAwi(pc),-(a7)
[00000c2c] 6000 f484                 bra        indirect
Awi_layout:
[00000c30] 2f3c 0000 00a4            move.l     #$000000A4,-(a7)
[00000c36] 2f3a f448                 move.l     funcAwi(pc),-(a7)
[00000c3a] 6000 f476                 bra        indirect
Awi_obvisible:
[00000c3e] 2f3c 0000 00a8            move.l     #$000000A8,-(a7)
[00000c44] 2f3a f43a                 move.l     funcAwi(pc),-(a7)
[00000c48] 6000 f468                 bra        indirect
A_dialog:
[00000c4c] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000c52] 2f3a f432                 move.l     funcA(pc),-(a7)
[00000c56] 6000 f45a                 bra        indirect
A_checkbox:
[00000c5a] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000c60] 2f3a f424                 move.l     funcA(pc),-(a7)
[00000c64] 6000 f44c                 bra        indirect
A_radiobutton:
[00000c68] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00000c6e] 2f3a f416                 move.l     funcA(pc),-(a7)
[00000c72] 6000 f43e                 bra        indirect
A_INNERFRAME:
[00000c76] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00000c7c] 2f3a f408                 move.l     funcA(pc),-(a7)
[00000c80] 6000 f430                 bra        indirect
A_PATTERN:
[00000c84] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[00000c8a] 2f3a f3fa                 move.l     funcA(pc),-(a7)
[00000c8e] 6000 f422                 bra        indirect
A_ARROWS:
[00000c92] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00000c98] 2f3a f3ec                 move.l     funcA(pc),-(a7)
[00000c9c] 6000 f414                 bra        indirect
A_SELECT:
[00000ca0] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000ca6] 2f3a f3de                 move.l     funcA(pc),-(a7)
[00000caa] 6000 f406                 bra        indirect
A_FTEXT:
[00000cae] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00000cb4] 2f3a f3d0                 move.l     funcA(pc),-(a7)
[00000cb8] 6000 f3f8                 bra        indirect
A_TITLEACSFkt:
[00000cbc] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[00000cc2] 2f3a f3c2                 move.l     funcA(pc),-(a7)
[00000cc6] 6000 f3ea                 bra        indirect
A_3Dbutton:
[00000cca] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[00000cd0] 2f3a f3b4                 move.l     funcA(pc),-(a7)
[00000cd4] 6000 f3dc                 bra        indirect
A_CYCLE:
[00000cd8] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[00000cde] 2f3a f3a6                 move.l     funcA(pc),-(a7)
[00000ce2] 6000 f3ce                 bra        indirect
A_picture:
[00000ce6] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[00000cec] 2f3a f398                 move.l     funcA(pc),-(a7)
[00000cf0] 6000 f3c0                 bra        indirect
A_dialog2:
[00000cf4] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[00000cfa] 2f3a f38a                 move.l     funcA(pc),-(a7)
[00000cfe] 6000 f3b2                 bra        indirect
A_boxed:
[00000d02] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[00000d08] 2f3a f37c                 move.l     funcA(pc),-(a7)
[00000d0c] 6000 f3a4                 bra        indirect
Ax_malloc:
[00000d10] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000d16] 2f3a f374                 move.l     funcSonst(pc),-(a7)
[00000d1a] 6000 f396                 bra        indirect
Ax_free:
[00000d1e] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000d24] 2f3a f366                 move.l     funcSonst(pc),-(a7)
[00000d28] 6000 f388                 bra        indirect
Ax_ifree:
[00000d2c] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00000d32] 2f3a f358                 move.l     funcSonst(pc),-(a7)
[00000d36] 6000 f37a                 bra        indirect
Ax_glmalloc:
[00000d3a] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00000d40] 2f3a f34a                 move.l     funcSonst(pc),-(a7)
[00000d44] 6000 f36c                 bra        indirect
AX_GLFREE:
[00000d48] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[00000d4e] 2f3a f33c                 move.l     funcSonst(pc),-(a7)
[00000d52] 6000 f35e                 bra        indirect
ACSmoduleterm:
[00000d56] 207c ffff ff00            movea.l    #compiler+$FFFFFF00,a0
[00000d5c] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00000d62] 2f3a f328                 move.l     funcSonst(pc),-(a7)
[00000d66] 6000 f34a                 bra        indirect
ALERT_STR:
[00000d6a] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000d70] 2f3a f31a                 move.l     funcSonst(pc),-(a7)
[00000d74] 6000 f33c                 bra        indirect
intersect:
[00000d78] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00000d7e] 2f3a f30c                 move.l     funcSonst(pc),-(a7)
[00000d82] 6000 f32e                 bra        indirect
xywh2array:
[00000d86] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[00000d8c] 2f3a f2fe                 move.l     funcSonst(pc),-(a7)
[00000d90] 6000 f320                 bra        indirect
ARRAY2XYWH:
[00000d94] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[00000d9a] 2f3a f2f0                 move.l     funcSonst(pc),-(a7)
[00000d9e] 6000 f312                 bra        indirect
DOTTED_XLINE:
[00000da2] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[00000da8] 2f3a f2e2                 move.l     funcSonst(pc),-(a7)
[00000dac] 6000 f304                 bra        indirect
DOTTED_YLINE:
[00000db0] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[00000db6] 2f3a f2d4                 move.l     funcSonst(pc),-(a7)
[00000dba] 6000 f2f6                 bra        indirect
nkc_tos2n:
[00000dbe] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[00000dc4] 2f3a f2c6                 move.l     funcSonst(pc),-(a7)
[00000dc8] 6000 f2e8                 bra        indirect
nkc_n2tos:
[00000dcc] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[00000dd2] 2f3a f2b8                 move.l     funcSonst(pc),-(a7)
[00000dd6] 6000 f2da                 bra        indirect
nkc_gem2n:
[00000dda] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[00000de0] 2f3a f2aa                 move.l     funcSonst(pc),-(a7)
[00000de4] 6000 f2cc                 bra        indirect
nkc_n2gem:
[00000de8] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[00000dee] 2f3a f29c                 move.l     funcSonst(pc),-(a7)
[00000df2] 6000 f2be                 bra        indirect
nkc_gemks2n:
[00000df6] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[00000dfc] 2f3a f28e                 move.l     funcSonst(pc),-(a7)
[00000e00] 6000 f2b0                 bra        indirect
nkc_n2gemks:
[00000e04] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[00000e0a] 2f3a f280                 move.l     funcSonst(pc),-(a7)
[00000e0e] 6000 f2a2                 bra        indirect
nkc_n2kstate:
[00000e12] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[00000e18] 2f3a f272                 move.l     funcSonst(pc),-(a7)
[00000e1c] 6000 f294                 bra        indirect
nkc_kstate:
[00000e20] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[00000e26] 2f3a f264                 move.l     funcSonst(pc),-(a7)
[00000e2a] 6000 f286                 bra        indirect
NKC_CMP:
[00000e2e] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[00000e34] 2f3a f256                 move.l     funcSonst(pc),-(a7)
[00000e38] 6000 f278                 bra        indirect
NKC_TOLOWER:
[00000e3c] 2f3c 0000 0054            move.l     #$00000054,-(a7)
[00000e42] 2f3a f248                 move.l     funcSonst(pc),-(a7)
[00000e46] 6000 f26a                 bra        indirect
NKC_TOUPPER:
[00000e4a] 2f3c 0000 0058            move.l     #$00000058,-(a7)
[00000e50] 2f3a f23a                 move.l     funcSonst(pc),-(a7)
[00000e54] 6000 f25c                 bra        indirect
appl_xgetinfo:
[00000e58] 2f3c 0000 005c            move.l     #$0000005C,-(a7)
[00000e5e] 2f3a f22c                 move.l     funcSonst(pc),-(a7)
[00000e62] 6000 f24e                 bra        indirect
Ax_setRecycleSize:
[00000e66] 2f3c 0000 0060            move.l     #$00000060,-(a7)
[00000e6c] 2f3a f21e                 move.l     funcSonst(pc),-(a7)
[00000e70] 6000 f240                 bra        indirect
Ax_getRecycleStat:
[00000e74] 2f3c 0000 0064            move.l     #$00000064,-(a7)
[00000e7a] 2f3a f210                 move.l     funcSonst(pc),-(a7)
[00000e7e] 6000 f232                 bra        indirect
Ax_recycle:
[00000e82] 2f3c 0000 0068            move.l     #$00000068,-(a7)
[00000e88] 2f3a f202                 move.l     funcSonst(pc),-(a7)
[00000e8c] 6000 f224                 bra        indirect
AVDI_GETRGB:
[00000e90] 2f3c 0000 006c            move.l     #$0000006C,-(a7)
[00000e96] 2f3a f1f4                 move.l     funcSonst(pc),-(a7)
[00000e9a] 6000 f216                 bra        indirect
vdi:
[00000e9e] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00000ea4] 2f3a f1ec                 move.l     funcVdi(pc),-(a7)
[00000ea8] 6000 f208                 bra        indirect
VDI_:
[00000eac] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00000eb2] 2f3a f1de                 move.l     funcVdi(pc),-(a7)
[00000eb6] 6000 f1fa                 bra        indirect
v_opnwk:
[00000eba] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00000ec0] 2f3a f1d0                 move.l     funcVdi(pc),-(a7)
[00000ec4] 6000 f1ec                 bra        indirect
v_clswk:
[00000ec8] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00000ece] 2f3a f1c2                 move.l     funcVdi(pc),-(a7)
[00000ed2] 6000 f1de                 bra        indirect
v_opnvwk:
[00000ed6] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[00000edc] 2f3a f1b4                 move.l     funcVdi(pc),-(a7)
[00000ee0] 6000 f1d0                 bra        indirect
v_clsvwk:
[00000ee4] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00000eea] 2f3a f1a6                 move.l     funcVdi(pc),-(a7)
[00000eee] 6000 f1c2                 bra        indirect
v_clrwk:
[00000ef2] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00000ef8] 2f3a f198                 move.l     funcVdi(pc),-(a7)
[00000efc] 6000 f1b4                 bra        indirect
V_UPDWK:
[00000f00] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00000f06] 2f3a f18a                 move.l     funcVdi(pc),-(a7)
[00000f0a] 6000 f1a6                 bra        indirect
V_OPNBM:
[00000f0e] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[00000f14] 2f3a f17c                 move.l     funcVdi(pc),-(a7)
[00000f18] 6000 f198                 bra        indirect
V_CLSBM:
[00000f1c] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[00000f22] 2f3a f16e                 move.l     funcVdi(pc),-(a7)
[00000f26] 6000 f18a                 bra        indirect
VST_LOAD_FONTS:
[00000f2a] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[00000f30] 2f3a f160                 move.l     funcVdi(pc),-(a7)
[00000f34] 6000 f17c                 bra        indirect
VST_UNLOAD_FONTS:
[00000f38] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[00000f3e] 2f3a f152                 move.l     funcVdi(pc),-(a7)
[00000f42] 6000 f16e                 bra        indirect
VS_CLIP:
[00000f46] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[00000f4c] 2f3a f144                 move.l     funcVdi(pc),-(a7)
[00000f50] 6000 f160                 bra        indirect
V_PLINE:
[00000f54] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[00000f5a] 2f3a f136                 move.l     funcVdi(pc),-(a7)
[00000f5e] 6000 f152                 bra        indirect
V_PMARKER:
[00000f62] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[00000f68] 2f3a f128                 move.l     funcVdi(pc),-(a7)
[00000f6c] 6000 f144                 bra        indirect
V_GTEXT:
[00000f70] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[00000f76] 2f3a f11a                 move.l     funcVdi(pc),-(a7)
[00000f7a] 6000 f136                 bra        indirect
V_FILLAREA:
[00000f7e] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[00000f84] 2f3a f10c                 move.l     funcVdi(pc),-(a7)
[00000f88] 6000 f128                 bra        indirect
V_CELLARRAY:
[00000f8c] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[00000f92] 2f3a f0fe                 move.l     funcVdi(pc),-(a7)
[00000f96] 6000 f11a                 bra        indirect
V_CONTOURFILL:
[00000f9a] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[00000fa0] 2f3a f0f0                 move.l     funcVdi(pc),-(a7)
[00000fa4] 6000 f10c                 bra        indirect
V_BAR:
[00000fa8] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[00000fae] 2f3a f0e2                 move.l     funcVdi(pc),-(a7)
[00000fb2] 6000 f0fe                 bra        indirect
V_ARC:
[00000fb6] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[00000fbc] 2f3a f0d4                 move.l     funcVdi(pc),-(a7)
[00000fc0] 6000 f0f0                 bra        indirect
V_PIESLICE:
[00000fc4] 2f3c 0000 0054            move.l     #$00000054,-(a7)
[00000fca] 2f3a f0c6                 move.l     funcVdi(pc),-(a7)
[00000fce] 6000 f0e2                 bra        indirect
v_circle:
[00000fd2] 2f3c 0000 0058            move.l     #$00000058,-(a7)
[00000fd8] 2f3a f0b8                 move.l     funcVdi(pc),-(a7)
[00000fdc] 6000 f0d4                 bra        indirect
v_ellipse:
[00000fe0] 2f3c 0000 005c            move.l     #$0000005C,-(a7)
[00000fe6] 2f3a f0aa                 move.l     funcVdi(pc),-(a7)
[00000fea] 6000 f0c6                 bra        indirect
v_ellarc:
[00000fee] 2f3c 0000 0060            move.l     #$00000060,-(a7)
[00000ff4] 2f3a f09c                 move.l     funcVdi(pc),-(a7)
[00000ff8] 6000 f0b8                 bra        indirect
v_ellpie:
[00000ffc] 2f3c 0000 0064            move.l     #$00000064,-(a7)
[00001002] 2f3a f08e                 move.l     funcVdi(pc),-(a7)
[00001006] 6000 f0aa                 bra        indirect
v_justified:
[0000100a] 2f3c 0000 0068            move.l     #$00000068,-(a7)
[00001010] 2f3a f080                 move.l     funcVdi(pc),-(a7)
[00001014] 6000 f09c                 bra        indirect
vr_recfl:
[00001018] 2f3c 0000 006c            move.l     #$0000006C,-(a7)
[0000101e] 2f3a f072                 move.l     funcVdi(pc),-(a7)
[00001022] 6000 f08e                 bra        indirect
v_rfbox:
[00001026] 2f3c 0000 0070            move.l     #$00000070,-(a7)
[0000102c] 2f3a f064                 move.l     funcVdi(pc),-(a7)
[00001030] 6000 f080                 bra        indirect
v_rbox:
[00001034] 2f3c 0000 0074            move.l     #$00000074,-(a7)
[0000103a] 2f3a f056                 move.l     funcVdi(pc),-(a7)
[0000103e] 6000 f072                 bra        indirect
VQ_GDOS:
[00001042] 2f3c 0000 0078            move.l     #$00000078,-(a7)
[00001048] 2f3a f048                 move.l     funcVdi(pc),-(a7)
[0000104c] 6000 f064                 bra        indirect
VSWR_MODE:
[00001050] 2f3c 0000 007c            move.l     #$0000007C,-(a7)
[00001056] 2f3a f03a                 move.l     funcVdi(pc),-(a7)
[0000105a] 6000 f056                 bra        indirect
VSL_TYPE:
[0000105e] 2f3c 0000 0080            move.l     #$00000080,-(a7)
[00001064] 2f3a f02c                 move.l     funcVdi(pc),-(a7)
[00001068] 6000 f048                 bra        indirect
VSL_UDSTY:
[0000106c] 2f3c 0000 0084            move.l     #$00000084,-(a7)
[00001072] 2f3a f01e                 move.l     funcVdi(pc),-(a7)
[00001076] 6000 f03a                 bra        indirect
VSL_WIDTH:
[0000107a] 2f3c 0000 0088            move.l     #$00000088,-(a7)
[00001080] 2f3a f010                 move.l     funcVdi(pc),-(a7)
[00001084] 6000 f02c                 bra        indirect
VSL_COLOR:
[00001088] 2f3c 0000 008c            move.l     #$0000008C,-(a7)
[0000108e] 2f3a f002                 move.l     funcVdi(pc),-(a7)
[00001092] 6000 f01e                 bra        indirect
VSL_ENDS:
[00001096] 2f3c 0000 0090            move.l     #$00000090,-(a7)
[0000109c] 2f3a eff4                 move.l     funcVdi(pc),-(a7)
[000010a0] 6000 f010                 bra        indirect
vsm_type:
[000010a4] 2f3c 0000 0094            move.l     #$00000094,-(a7)
[000010aa] 2f3a efe6                 move.l     funcVdi(pc),-(a7)
[000010ae] 6000 f002                 bra        indirect
vsm_height:
[000010b2] 2f3c 0000 0098            move.l     #$00000098,-(a7)
[000010b8] 2f3a efd8                 move.l     funcVdi(pc),-(a7)
[000010bc] 6000 eff4                 bra        indirect
vsm_color:
[000010c0] 2f3c 0000 009c            move.l     #$0000009C,-(a7)
[000010c6] 2f3a efca                 move.l     funcVdi(pc),-(a7)
[000010ca] 6000 efe6                 bra        indirect
vst_height:
[000010ce] 2f3c 0000 00a0            move.l     #$000000A0,-(a7)
[000010d4] 2f3a efbc                 move.l     funcVdi(pc),-(a7)
[000010d8] 6000 efd8                 bra        indirect
vst_point:
[000010dc] 2f3c 0000 00a4            move.l     #$000000A4,-(a7)
[000010e2] 2f3a efae                 move.l     funcVdi(pc),-(a7)
[000010e6] 6000 efca                 bra        indirect
vst_rotation:
[000010ea] 2f3c 0000 00a8            move.l     #$000000A8,-(a7)
[000010f0] 2f3a efa0                 move.l     funcVdi(pc),-(a7)
[000010f4] 6000 efbc                 bra        indirect
vst_font:
[000010f8] 2f3c 0000 00ac            move.l     #$000000AC,-(a7)
[000010fe] 2f3a ef92                 move.l     funcVdi(pc),-(a7)
[00001102] 6000 efae                 bra        indirect
vst_color:
[00001106] 2f3c 0000 00b0            move.l     #$000000B0,-(a7)
[0000110c] 2f3a ef84                 move.l     funcVdi(pc),-(a7)
[00001110] 6000 efa0                 bra        indirect
vst_effects:
[00001114] 2f3c 0000 00b4            move.l     #$000000B4,-(a7)
[0000111a] 2f3a ef76                 move.l     funcVdi(pc),-(a7)
[0000111e] 6000 ef92                 bra        indirect
vst_alignment:
[00001122] 2f3c 0000 00b8            move.l     #$000000B8,-(a7)
[00001128] 2f3a ef68                 move.l     funcVdi(pc),-(a7)
[0000112c] 6000 ef84                 bra        indirect
vsf_interior:
[00001130] 2f3c 0000 00bc            move.l     #$000000BC,-(a7)
[00001136] 2f3a ef5a                 move.l     funcVdi(pc),-(a7)
[0000113a] 6000 ef76                 bra        indirect
vsf_style:
[0000113e] 2f3c 0000 00c0            move.l     #$000000C0,-(a7)
[00001144] 2f3a ef4c                 move.l     funcVdi(pc),-(a7)
[00001148] 6000 ef68                 bra        indirect
vsf_color:
[0000114c] 2f3c 0000 00c4            move.l     #$000000C4,-(a7)
[00001152] 2f3a ef3e                 move.l     funcVdi(pc),-(a7)
[00001156] 6000 ef5a                 bra        indirect
vsf_perimeter:
[0000115a] 2f3c 0000 00c8            move.l     #$000000C8,-(a7)
[00001160] 2f3a ef30                 move.l     funcVdi(pc),-(a7)
[00001164] 6000 ef4c                 bra        indirect
vsf_udpat:
[00001168] 2f3c 0000 00cc            move.l     #$000000CC,-(a7)
[0000116e] 2f3a ef22                 move.l     funcVdi(pc),-(a7)
[00001172] 6000 ef3e                 bra        indirect
vsf_udpat:
[00001176] 2f3c 0000 00d0            move.l     #$000000D0,-(a7)
[0000117c] 2f3a ef14                 move.l     funcVdi(pc),-(a7)
[00001180] 6000 ef30                 bra        indirect
VS_COLOR:
[00001184] 2f3c 0000 00d4            move.l     #$000000D4,-(a7)
[0000118a] 2f3a ef06                 move.l     funcVdi(pc),-(a7)
[0000118e] 6000 ef22                 bra        indirect
VR_TRNFM:
[00001192] 2f3c 0000 00d8            move.l     #$000000D8,-(a7)
[00001198] 2f3a eef8                 move.l     funcVdi(pc),-(a7)
[0000119c] 6000 ef14                 bra        indirect
VRO_CPYFM:
[000011a0] 2f3c 0000 00dc            move.l     #$000000DC,-(a7)
[000011a6] 2f3a eeea                 move.l     funcVdi(pc),-(a7)
[000011aa] 6000 ef06                 bra        indirect
VRT_CPYFM:
[000011ae] 2f3c 0000 00e0            move.l     #$000000E0,-(a7)
[000011b4] 2f3a eedc                 move.l     funcVdi(pc),-(a7)
[000011b8] 6000 eef8                 bra        indirect
V_GET_PIXEL:
[000011bc] 2f3c 0000 00e4            move.l     #$000000E4,-(a7)
[000011c2] 2f3a eece                 move.l     funcVdi(pc),-(a7)
[000011c6] 6000 eeea                 bra        indirect
VSIN_MODE:
[000011ca] 2f3c 0000 00e8            move.l     #$000000E8,-(a7)
[000011d0] 2f3a eec0                 move.l     funcVdi(pc),-(a7)
[000011d4] 6000 eedc                 bra        indirect
VRQ_LOCATOR:
[000011d8] 2f3c 0000 00ec            move.l     #$000000EC,-(a7)
[000011de] 2f3a eeb2                 move.l     funcVdi(pc),-(a7)
[000011e2] 6000 eece                 bra        indirect
vsm_locator:
[000011e6] 2f3c 0000 00f0            move.l     #$000000F0,-(a7)
[000011ec] 2f3a eea4                 move.l     funcVdi(pc),-(a7)
[000011f0] 6000 eec0                 bra        indirect
vrq_valuator:
[000011f4] 2f3c 0000 00f4            move.l     #$000000F4,-(a7)
[000011fa] 2f3a ee96                 move.l     funcVdi(pc),-(a7)
[000011fe] 6000 eeb2                 bra        indirect
vsm_valuator:
[00001202] 2f3c 0000 00f8            move.l     #$000000F8,-(a7)
[00001208] 2f3a ee88                 move.l     funcVdi(pc),-(a7)
[0000120c] 6000 eea4                 bra        indirect
vrq_choice:
[00001210] 2f3c 0000 00fc            move.l     #$000000FC,-(a7)
[00001216] 2f3a ee7a                 move.l     funcVdi(pc),-(a7)
[0000121a] 6000 ee96                 bra        indirect
vsm_choice:
[0000121e] 2f3c 0000 0100            move.l     #$00000100,-(a7)
[00001224] 2f3a ee6c                 move.l     funcVdi(pc),-(a7)
[00001228] 6000 ee88                 bra        indirect
vrq_string:
[0000122c] 2f3c 0000 0104            move.l     #$00000104,-(a7)
[00001232] 2f3a ee5e                 move.l     funcVdi(pc),-(a7)
[00001236] 6000 ee7a                 bra        indirect
vsm_string:
[0000123a] 2f3c 0000 0108            move.l     #$00000108,-(a7)
[00001240] 2f3a ee50                 move.l     funcVdi(pc),-(a7)
[00001244] 6000 ee6c                 bra        indirect
vex_timv:
[00001248] 2f3c 0000 010c            move.l     #$0000010C,-(a7)
[0000124e] 2f3a ee42                 move.l     funcVdi(pc),-(a7)
[00001252] 6000 ee5e                 bra        indirect
V_SHOW_C:
[00001256] 2f3c 0000 0110            move.l     #$00000110,-(a7)
[0000125c] 2f3a ee34                 move.l     funcVdi(pc),-(a7)
[00001260] 6000 ee50                 bra        indirect
V_HIDE_C:
[00001264] 2f3c 0000 0114            move.l     #$00000114,-(a7)
[0000126a] 2f3a ee26                 move.l     funcVdi(pc),-(a7)
[0000126e] 6000 ee42                 bra        indirect
VQ_MOUSE:
[00001272] 2f3c 0000 0118            move.l     #$00000118,-(a7)
[00001278] 2f3a ee18                 move.l     funcVdi(pc),-(a7)
[0000127c] 6000 ee34                 bra        indirect
VEX_BUTV:
[00001280] 2f3c 0000 011c            move.l     #$0000011C,-(a7)
[00001286] 2f3a ee0a                 move.l     funcVdi(pc),-(a7)
[0000128a] 6000 ee26                 bra        indirect
VEX_MOTV:
[0000128e] 2f3c 0000 0120            move.l     #$00000120,-(a7)
[00001294] 2f3a edfc                 move.l     funcVdi(pc),-(a7)
[00001298] 6000 ee18                 bra        indirect
VEX_CURV:
[0000129c] 2f3c 0000 0124            move.l     #$00000124,-(a7)
[000012a2] 2f3a edee                 move.l     funcVdi(pc),-(a7)
[000012a6] 6000 ee0a                 bra        indirect
VQ_KEY_S:
[000012aa] 2f3c 0000 0128            move.l     #$00000128,-(a7)
[000012b0] 2f3a ede0                 move.l     funcVdi(pc),-(a7)
[000012b4] 6000 edfc                 bra        indirect
VQ_EXTND:
[000012b8] 2f3c 0000 012c            move.l     #$0000012C,-(a7)
[000012be] 2f3a edd2                 move.l     funcVdi(pc),-(a7)
[000012c2] 6000 edee                 bra        indirect
VQL_ATTRIBUTES:
[000012c6] 2f3c 0000 0130            move.l     #$00000130,-(a7)
[000012cc] 2f3a edc4                 move.l     funcVdi(pc),-(a7)
[000012d0] 6000 ede0                 bra        indirect
VQM_ATTRIBUTES:
[000012d4] 2f3c 0000 0134            move.l     #$00000134,-(a7)
[000012da] 2f3a edb6                 move.l     funcVdi(pc),-(a7)
[000012de] 6000 edd2                 bra        indirect
VQF_ATTRIBUTES:
[000012e2] 2f3c 0000 0138            move.l     #$00000138,-(a7)
[000012e8] 2f3a eda8                 move.l     funcVdi(pc),-(a7)
[000012ec] 6000 edc4                 bra        indirect
VQT_ATTRIBUTES:
[000012f0] 2f3c 0000 013c            move.l     #$0000013C,-(a7)
[000012f6] 2f3a ed9a                 move.l     funcVdi(pc),-(a7)
[000012fa] 6000 edb6                 bra        indirect
VQT_EXTENT:
[000012fe] 2f3c 0000 0140            move.l     #$00000140,-(a7)
[00001304] 2f3a ed8c                 move.l     funcVdi(pc),-(a7)
[00001308] 6000 eda8                 bra        indirect
VQT_WIDTH:
[0000130c] 2f3c 0000 0144            move.l     #$00000144,-(a7)
[00001312] 2f3a ed7e                 move.l     funcVdi(pc),-(a7)
[00001316] 6000 ed9a                 bra        indirect
VQT_NAME:
[0000131a] 2f3c 0000 0148            move.l     #$00000148,-(a7)
[00001320] 2f3a ed70                 move.l     funcVdi(pc),-(a7)
[00001324] 6000 ed8c                 bra        indirect
vqin_mode:
[00001328] 2f3c 0000 014c            move.l     #$0000014C,-(a7)
[0000132e] 2f3a ed62                 move.l     funcVdi(pc),-(a7)
[00001332] 6000 ed7e                 bra        indirect
vqt_fontinfo:
[00001336] 2f3c 0000 0150            move.l     #$00000150,-(a7)
[0000133c] 2f3a ed54                 move.l     funcVdi(pc),-(a7)
[00001340] 6000 ed70                 bra        indirect
vq_scrninfo:
[00001344] 2f3c 0000 0154            move.l     #$00000154,-(a7)
[0000134a] 2f3a ed46                 move.l     funcVdi(pc),-(a7)
[0000134e] 6000 ed62                 bra        indirect
vq_color:
[00001352] 2f3c 0000 0158            move.l     #$00000158,-(a7)
[00001358] 2f3a ed38                 move.l     funcVdi(pc),-(a7)
[0000135c] 6000 ed54                 bra        indirect
vq_cellarray:
[00001360] 2f3c 0000 015c            move.l     #$0000015C,-(a7)
[00001366] 2f3a ed2a                 move.l     funcVdi(pc),-(a7)
[0000136a] 6000 ed46                 bra        indirect
vq_chcells:
[0000136e] 2f3c 0000 0160            move.l     #$00000160,-(a7)
[00001374] 2f3a ed1c                 move.l     funcVdi(pc),-(a7)
[00001378] 6000 ed38                 bra        indirect
v_exit_cur:
[0000137c] 2f3c 0000 0164            move.l     #$00000164,-(a7)
[00001382] 2f3a ed0e                 move.l     funcVdi(pc),-(a7)
[00001386] 6000 ed2a                 bra        indirect
v_enter_cur:
[0000138a] 2f3c 0000 0168            move.l     #$00000168,-(a7)
[00001390] 2f3a ed00                 move.l     funcVdi(pc),-(a7)
[00001394] 6000 ed1c                 bra        indirect
V_CURUP:
[00001398] 2f3c 0000 016c            move.l     #$0000016C,-(a7)
[0000139e] 2f3a ecf2                 move.l     funcVdi(pc),-(a7)
[000013a2] 6000 ed0e                 bra        indirect
V_CURDOWN:
[000013a6] 2f3c 0000 0170            move.l     #$00000170,-(a7)
[000013ac] 2f3a ece4                 move.l     funcVdi(pc),-(a7)
[000013b0] 6000 ed00                 bra        indirect
V_CURRIGHT:
[000013b4] 2f3c 0000 0174            move.l     #$00000174,-(a7)
[000013ba] 2f3a ecd6                 move.l     funcVdi(pc),-(a7)
[000013be] 6000 ecf2                 bra        indirect
V_CURLEFT:
[000013c2] 2f3c 0000 0178            move.l     #$00000178,-(a7)
[000013c8] 2f3a ecc8                 move.l     funcVdi(pc),-(a7)
[000013cc] 6000 ece4                 bra        indirect
V_CURHOME:
[000013d0] 2f3c 0000 017c            move.l     #$0000017C,-(a7)
[000013d6] 2f3a ecba                 move.l     funcVdi(pc),-(a7)
[000013da] 6000 ecd6                 bra        indirect
V_EEOS:
[000013de] 2f3c 0000 0180            move.l     #$00000180,-(a7)
[000013e4] 2f3a ecac                 move.l     funcVdi(pc),-(a7)
[000013e8] 6000 ecc8                 bra        indirect
V_EEOL:
[000013ec] 2f3c 0000 0184            move.l     #$00000184,-(a7)
[000013f2] 2f3a ec9e                 move.l     funcVdi(pc),-(a7)
[000013f6] 6000 ecba                 bra        indirect
v_curaddress:
[000013fa] 2f3c 0000 0188            move.l     #$00000188,-(a7)
[00001400] 2f3a ec90                 move.l     funcVdi(pc),-(a7)
[00001404] 6000 ecac                 bra        indirect
v_curtext:
[00001408] 2f3c 0000 018c            move.l     #$0000018C,-(a7)
[0000140e] 2f3a ec82                 move.l     funcVdi(pc),-(a7)
[00001412] 6000 ec9e                 bra        indirect
v_rvon:
[00001416] 2f3c 0000 0190            move.l     #$00000190,-(a7)
[0000141c] 2f3a ec74                 move.l     funcVdi(pc),-(a7)
[00001420] 6000 ec90                 bra        indirect
v_rvoff:
[00001424] 2f3c 0000 0194            move.l     #$00000194,-(a7)
[0000142a] 2f3a ec66                 move.l     funcVdi(pc),-(a7)
[0000142e] 6000 ec82                 bra        indirect
vq_curaddress:
[00001432] 2f3c 0000 0198            move.l     #$00000198,-(a7)
[00001438] 2f3a ec58                 move.l     funcVdi(pc),-(a7)
[0000143c] 6000 ec74                 bra        indirect
vq_tabstatus:
[00001440] 2f3c 0000 019c            move.l     #$0000019C,-(a7)
[00001446] 2f3a ec4a                 move.l     funcVdi(pc),-(a7)
[0000144a] 6000 ec66                 bra        indirect
v_hardcopy:
[0000144e] 2f3c 0000 01a0            move.l     #$000001A0,-(a7)
[00001454] 2f3a ec3c                 move.l     funcVdi(pc),-(a7)
[00001458] 6000 ec58                 bra        indirect
v_dspcur:
[0000145c] 2f3c 0000 01a4            move.l     #$000001A4,-(a7)
[00001462] 2f3a ec2e                 move.l     funcVdi(pc),-(a7)
[00001466] 6000 ec4a                 bra        indirect
v_rmcur:
[0000146a] 2f3c 0000 01a8            move.l     #$000001A8,-(a7)
[00001470] 2f3a ec20                 move.l     funcVdi(pc),-(a7)
[00001474] 6000 ec3c                 bra        indirect
v_form_adv:
[00001478] 2f3c 0000 01ac            move.l     #$000001AC,-(a7)
[0000147e] 2f3a ec12                 move.l     funcVdi(pc),-(a7)
[00001482] 6000 ec2e                 bra        indirect
v_clear_disp_list:
[00001486] 2f3c 0000 01b0            move.l     #$000001B0,-(a7)
[0000148c] 2f3a ec04                 move.l     funcVdi(pc),-(a7)
[00001490] 6000 ec20                 bra        indirect
vq_scan:
[00001494] 2f3c 0000 01b4            move.l     #$000001B4,-(a7)
[0000149a] 2f3a ebf6                 move.l     funcVdi(pc),-(a7)
[0000149e] 6000 ec12                 bra        indirect
v_alpha_text:
[000014a2] 2f3c 0000 01b8            move.l     #$000001B8,-(a7)
[000014a8] 2f3a ebe8                 move.l     funcVdi(pc),-(a7)
[000014ac] 6000 ec04                 bra        indirect
vs_palette:
[000014b0] 2f3c 0000 01bc            move.l     #$000001BC,-(a7)
[000014b6] 2f3a ebda                 move.l     funcVdi(pc),-(a7)
[000014ba] 6000 ebf6                 bra        indirect
v_sound:
[000014be] 2f3c 0000 01c0            move.l     #$000001C0,-(a7)
[000014c4] 2f3a ebcc                 move.l     funcVdi(pc),-(a7)
[000014c8] 6000 ebe8                 bra        indirect
vs_mute:
[000014cc] 2f3c 0000 01c4            move.l     #$000001C4,-(a7)
[000014d2] 2f3a ebbe                 move.l     funcVdi(pc),-(a7)
[000014d6] 6000 ebda                 bra        indirect
VT_RESOLUTION:
[000014da] 2f3c 0000 01c8            move.l     #$000001C8,-(a7)
[000014e0] 2f3a ebb0                 move.l     funcVdi(pc),-(a7)
[000014e4] 6000 ebcc                 bra        indirect
VT_AXIS:
[000014e8] 2f3c 0000 01cc            move.l     #$000001CC,-(a7)
[000014ee] 2f3a eba2                 move.l     funcVdi(pc),-(a7)
[000014f2] 6000 ebbe                 bra        indirect
VT_ORIGIN:
[000014f6] 2f3c 0000 01d0            move.l     #$000001D0,-(a7)
[000014fc] 2f3a eb94                 move.l     funcVdi(pc),-(a7)
[00001500] 6000 ebb0                 bra        indirect
VQ_TDIMENSIONS:
[00001504] 2f3c 0000 01d4            move.l     #$000001D4,-(a7)
[0000150a] 2f3a eb86                 move.l     funcVdi(pc),-(a7)
[0000150e] 6000 eba2                 bra        indirect
VT_ALIGNMENT:
[00001512] 2f3c 0000 01d8            move.l     #$000001D8,-(a7)
[00001518] 2f3a eb78                 move.l     funcVdi(pc),-(a7)
[0000151c] 6000 eb94                 bra        indirect
VSP_FILM:
[00001520] 2f3c 0000 01dc            move.l     #$000001DC,-(a7)
[00001526] 2f3a eb6a                 move.l     funcVdi(pc),-(a7)
[0000152a] 6000 eb86                 bra        indirect
VQP_FILMNAME:
[0000152e] 2f3c 0000 01e0            move.l     #$000001E0,-(a7)
[00001534] 2f3a eb5c                 move.l     funcVdi(pc),-(a7)
[00001538] 6000 eb78                 bra        indirect
vsc_expose:
[0000153c] 2f3c 0000 01e4            move.l     #$000001E4,-(a7)
[00001542] 2f3a eb4e                 move.l     funcVdi(pc),-(a7)
[00001546] 6000 eb6a                 bra        indirect
v_meta_extents:
[0000154a] 2f3c 0000 01e8            move.l     #$000001E8,-(a7)
[00001550] 2f3a eb40                 move.l     funcVdi(pc),-(a7)
[00001554] 6000 eb5c                 bra        indirect
v_write_meta:
[00001558] 2f3c 0000 01ec            move.l     #$000001EC,-(a7)
[0000155e] 2f3a eb32                 move.l     funcVdi(pc),-(a7)
[00001562] 6000 eb4e                 bra        indirect
vm_pagesize:
[00001566] 2f3c 0000 01f0            move.l     #$000001F0,-(a7)
[0000156c] 2f3a eb24                 move.l     funcVdi(pc),-(a7)
[00001570] 6000 eb40                 bra        indirect
vm_coords:
[00001574] 2f3c 0000 01f4            move.l     #$000001F4,-(a7)
[0000157a] 2f3a eb16                 move.l     funcVdi(pc),-(a7)
[0000157e] 6000 eb32                 bra        indirect
vm_filename:
[00001582] 2f3c 0000 01f8            move.l     #$000001F8,-(a7)
[00001588] 2f3a eb08                 move.l     funcVdi(pc),-(a7)
[0000158c] 6000 eb24                 bra        indirect
v_offset:
[00001590] 2f3c 0000 01fc            move.l     #$000001FC,-(a7)
[00001596] 2f3a eafa                 move.l     funcVdi(pc),-(a7)
[0000159a] 6000 eb16                 bra        indirect
v_fontinit:
[0000159e] 2f3c 0000 0200            move.l     #$00000200,-(a7)
[000015a4] 2f3a eaec                 move.l     funcVdi(pc),-(a7)
[000015a8] 6000 eb08                 bra        indirect
V_ESCAPE2000:
[000015ac] 2f3c 0000 0204            move.l     #$00000204,-(a7)
[000015b2] 2f3a eade                 move.l     funcVdi(pc),-(a7)
[000015b6] 6000 eafa                 bra        indirect
V_OUTPUT_WINDOW:
[000015ba] 2f3c 0000 0208            move.l     #$00000208,-(a7)
[000015c0] 2f3a ead0                 move.l     funcVdi(pc),-(a7)
[000015c4] 6000 eaec                 bra        indirect
V_BIT_IMAGE:
[000015c8] 2f3c 0000 020c            move.l     #$0000020C,-(a7)
[000015ce] 2f3a eac2                 move.l     funcVdi(pc),-(a7)
[000015d2] 6000 eade                 bra        indirect
FIX31TOPIXEL:
[000015d6] 2f3c 0000 0210            move.l     #$00000210,-(a7)
[000015dc] 2f3a eab4                 move.l     funcVdi(pc),-(a7)
[000015e0] 6000 ead0                 bra        indirect
V_OPNPRN:
[000015e4] 2f3c 0000 0214            move.l     #$00000214,-(a7)
[000015ea] 2f3a eaa6                 move.l     funcVdi(pc),-(a7)
[000015ee] 6000 eac2                 bra        indirect
V_OPNMETA:
[000015f2] 2f3c 0000 0218            move.l     #$00000218,-(a7)
[000015f8] 2f3a ea98                 move.l     funcVdi(pc),-(a7)
[000015fc] 6000 eab4                 bra        indirect
VQ_DEVINFO:
[00001600] 2f3c 0000 021c            move.l     #$0000021C,-(a7)
[00001606] 2f3a ea8a                 move.l     funcVdi(pc),-(a7)
[0000160a] 6000 eaa6                 bra        indirect
VQ_EXT_DEVINFO:
[0000160e] 2f3c 0000 0220            move.l     #$00000220,-(a7)
[00001614] 2f3a ea7c                 move.l     funcVdi(pc),-(a7)
[00001618] 6000 ea98                 bra        indirect
VS_CALIBRATE:
[0000161c] 2f3c 0000 0224            move.l     #$00000224,-(a7)
[00001622] 2f3a ea6e                 move.l     funcVdi(pc),-(a7)
[00001626] 6000 ea8a                 bra        indirect
VQ_CALIBRATE:
[0000162a] 2f3c 0000 0228            move.l     #$00000228,-(a7)
[00001630] 2f3a ea60                 move.l     funcVdi(pc),-(a7)
[00001634] 6000 ea7c                 bra        indirect
V_BEZ:
[00001638] 2f3c 0000 022c            move.l     #$0000022C,-(a7)
[0000163e] 2f3a ea52                 move.l     funcVdi(pc),-(a7)
[00001642] 6000 ea6e                 bra        indirect
V_BEZ_ON:
[00001646] 2f3c 0000 0230            move.l     #$00000230,-(a7)
[0000164c] 2f3a ea44                 move.l     funcVdi(pc),-(a7)
[00001650] 6000 ea60                 bra        indirect
V_BEZ_OFF:
[00001654] 2f3c 0000 0234            move.l     #$00000234,-(a7)
[0000165a] 2f3a ea36                 move.l     funcVdi(pc),-(a7)
[0000165e] 6000 ea52                 bra        indirect
V_BEZ_QUAL:
[00001662] 2f3c 0000 0238            move.l     #$00000238,-(a7)
[00001668] 2f3a ea28                 move.l     funcVdi(pc),-(a7)
[0000166c] 6000 ea44                 bra        indirect
V_BEZ_FILL:
[00001670] 2f3c 0000 023c            move.l     #$0000023C,-(a7)
[00001676] 2f3a ea1a                 move.l     funcVdi(pc),-(a7)
[0000167a] 6000 ea36                 bra        indirect
vqt_ext_name:
[0000167e] 2f3c 0000 0240            move.l     #$00000240,-(a7)
[00001684] 2f3a ea0c                 move.l     funcVdi(pc),-(a7)
[00001688] 6000 ea28                 bra        indirect
vqt_char_index:
[0000168c] 2f3c 0000 0244            move.l     #$00000244,-(a7)
[00001692] 2f3a e9fe                 move.l     funcVdi(pc),-(a7)
[00001696] 6000 ea1a                 bra        indirect
vqt_isCharAvailable:
[0000169a] 2f3c 0000 0248            move.l     #$00000248,-(a7)
[000016a0] 2f3a e9f0                 move.l     funcVdi(pc),-(a7)
[000016a4] 6000 ea0c                 bra        indirect
vqt_xfntinfo:
[000016a8] 2f3c 0000 024c            move.l     #$0000024C,-(a7)
[000016ae] 2f3a e9e2                 move.l     funcVdi(pc),-(a7)
[000016b2] 6000 e9fe                 bra        indirect
vst_name:
[000016b6] 2f3c 0000 0250            move.l     #$00000250,-(a7)
[000016bc] 2f3a e9d4                 move.l     funcVdi(pc),-(a7)
[000016c0] 6000 e9f0                 bra        indirect
vqt_name_and_id:
[000016c4] 2f3c 0000 0254            move.l     #$00000254,-(a7)
[000016ca] 2f3a e9c6                 move.l     funcVdi(pc),-(a7)
[000016ce] 6000 e9e2                 bra        indirect
vqt_fontheader:
[000016d2] 2f3c 0000 0258            move.l     #$00000258,-(a7)
[000016d8] 2f3a e9b8                 move.l     funcVdi(pc),-(a7)
[000016dc] 6000 e9d4                 bra        indirect
vqt_trackkern:
[000016e0] 2f3c 0000 025c            move.l     #$0000025C,-(a7)
[000016e6] 2f3a e9aa                 move.l     funcVdi(pc),-(a7)
[000016ea] 6000 e9c6                 bra        indirect
VQT_PAIRKERN:
[000016ee] 2f3c 0000 0260            move.l     #$00000260,-(a7)
[000016f4] 2f3a e99c                 move.l     funcVdi(pc),-(a7)
[000016f8] 6000 e9b8                 bra        indirect
VST_CHARMAP:
[000016fc] 2f3c 0000 0264            move.l     #$00000264,-(a7)
[00001702] 2f3a e98e                 move.l     funcVdi(pc),-(a7)
[00001706] 6000 e9aa                 bra        indirect
VST_KERN:
[0000170a] 2f3c 0000 0268            move.l     #$00000268,-(a7)
[00001710] 2f3a e980                 move.l     funcVdi(pc),-(a7)
[00001714] 6000 e99c                 bra        indirect
VST_KERN_OFFSET:
[00001718] 2f3c 0000 026c            move.l     #$0000026C,-(a7)
[0000171e] 2f3a e972                 move.l     funcVdi(pc),-(a7)
[00001722] 6000 e98e                 bra        indirect
V_GETBITMAP_INFO:
[00001726] 2f3c 0000 0270            move.l     #$00000270,-(a7)
[0000172c] 2f3a e964                 move.l     funcVdi(pc),-(a7)
[00001730] 6000 e980                 bra        indirect
VQT_F_EXTENT:
[00001734] 2f3c 0000 0274            move.l     #$00000274,-(a7)
[0000173a] 2f3a e956                 move.l     funcVdi(pc),-(a7)
[0000173e] 6000 e972                 bra        indirect
VQT_REAL_EXTENT:
[00001742] 2f3c 0000 0278            move.l     #$00000278,-(a7)
[00001748] 2f3a e948                 move.l     funcVdi(pc),-(a7)
[0000174c] 6000 e964                 bra        indirect
v_ftext:
[00001750] 2f3c 0000 027c            move.l     #$0000027C,-(a7)
[00001756] 2f3a e93a                 move.l     funcVdi(pc),-(a7)
[0000175a] 6000 e956                 bra        indirect
v_ftext_offset:
[0000175e] 2f3c 0000 0280            move.l     #$00000280,-(a7)
[00001764] 2f3a e92c                 move.l     funcVdi(pc),-(a7)
[00001768] 6000 e948                 bra        indirect
v_getoutline:
[0000176c] 2f3c 0000 0284            move.l     #$00000284,-(a7)
[00001772] 2f3a e91e                 move.l     funcVdi(pc),-(a7)
[00001776] 6000 e93a                 bra        indirect
vst_arbpt32:
[0000177a] 2f3c 0000 0288            move.l     #$00000288,-(a7)
[00001780] 2f3a e910                 move.l     funcVdi(pc),-(a7)
[00001784] 6000 e92c                 bra        indirect
vqt_advance32:
[00001788] 2f3c 0000 028c            move.l     #$0000028C,-(a7)
[0000178e] 2f3a e902                 move.l     funcVdi(pc),-(a7)
[00001792] 6000 e91e                 bra        indirect
vst_setsize32:
[00001796] 2f3c 0000 0290            move.l     #$00000290,-(a7)
[0000179c] 2f3a e8f4                 move.l     funcVdi(pc),-(a7)
[000017a0] 6000 e910                 bra        indirect
vst_skew:
[000017a4] 2f3c 0000 0294            move.l     #$00000294,-(a7)
[000017aa] 2f3a e8e6                 move.l     funcVdi(pc),-(a7)
[000017ae] 6000 e902                 bra        indirect
v_orient:
[000017b2] 2f3c 0000 0298            move.l     #$00000298,-(a7)
[000017b8] 2f3a e8d8                 move.l     funcVdi(pc),-(a7)
[000017bc] 6000 e8f4                 bra        indirect
v_trays:
[000017c0] 2f3c 0000 029c            move.l     #$0000029C,-(a7)
[000017c6] 2f3a e8ca                 move.l     funcVdi(pc),-(a7)
[000017ca] 6000 e8e6                 bra        indirect
vq_tray_names:
[000017ce] 2f3c 0000 02a0            move.l     #$000002A0,-(a7)
[000017d4] 2f3a e8bc                 move.l     funcVdi(pc),-(a7)
[000017d8] 6000 e8d8                 bra        indirect
v_page_size:
[000017dc] 2f3c 0000 02a4            move.l     #$000002A4,-(a7)
[000017e2] 2f3a e8ae                 move.l     funcVdi(pc),-(a7)
[000017e6] 6000 e8ca                 bra        indirect
vq_page_name:
[000017ea] 2f3c 0000 02a8            move.l     #$000002A8,-(a7)
[000017f0] 2f3a e8a0                 move.l     funcVdi(pc),-(a7)
[000017f4] 6000 e8bc                 bra        indirect
vst_fg_color:
[000017f8] 2f3c 0000 02ac            move.l     #$000002AC,-(a7)
[000017fe] 2f3a e892                 move.l     funcVdi(pc),-(a7)
[00001802] 6000 e8ae                 bra        indirect
vsf_fg_color:
[00001806] 2f3c 0000 02b0            move.l     #$000002B0,-(a7)
[0000180c] 2f3a e884                 move.l     funcVdi(pc),-(a7)
[00001810] 6000 e8a0                 bra        indirect
vsl_fg_color:
[00001814] 2f3c 0000 02b4            move.l     #$000002B4,-(a7)
[0000181a] 2f3a e876                 move.l     funcVdi(pc),-(a7)
[0000181e] 6000 e892                 bra        indirect
vsm_fg_color:
[00001822] 2f3c 0000 02b8            move.l     #$000002B8,-(a7)
[00001828] 2f3a e868                 move.l     funcVdi(pc),-(a7)
[0000182c] 6000 e884                 bra        indirect
VSR_FG_COLOR:
[00001830] 2f3c 0000 02bc            move.l     #$000002BC,-(a7)
[00001836] 2f3a e85a                 move.l     funcVdi(pc),-(a7)
[0000183a] 6000 e876                 bra        indirect
VST_BG_COLOR:
[0000183e] 2f3c 0000 02c0            move.l     #$000002C0,-(a7)
[00001844] 2f3a e84c                 move.l     funcVdi(pc),-(a7)
[00001848] 6000 e868                 bra        indirect
VSF_BG_COLOR:
[0000184c] 2f3c 0000 02c4            move.l     #$000002C4,-(a7)
[00001852] 2f3a e83e                 move.l     funcVdi(pc),-(a7)
[00001856] 6000 e85a                 bra        indirect
VSL_BG_COLOR:
[0000185a] 2f3c 0000 02c8            move.l     #$000002C8,-(a7)
[00001860] 2f3a e830                 move.l     funcVdi(pc),-(a7)
[00001864] 6000 e84c                 bra        indirect
VSM_BG_COLOR:
[00001868] 2f3c 0000 02cc            move.l     #$000002CC,-(a7)
[0000186e] 2f3a e822                 move.l     funcVdi(pc),-(a7)
[00001872] 6000 e83e                 bra        indirect
VSR_BG_COLOR:
[00001876] 2f3c 0000 02d0            move.l     #$000002D0,-(a7)
[0000187c] 2f3a e814                 move.l     funcVdi(pc),-(a7)
[00001880] 6000 e830                 bra        indirect
VQT_FG_COLOR:
[00001884] 2f3c 0000 02d4            move.l     #$000002D4,-(a7)
[0000188a] 2f3a e806                 move.l     funcVdi(pc),-(a7)
[0000188e] 6000 e822                 bra        indirect
vqf_fg_color:
[00001892] 2f3c 0000 02d8            move.l     #$000002D8,-(a7)
[00001898] 2f3a e7f8                 move.l     funcVdi(pc),-(a7)
[0000189c] 6000 e814                 bra        indirect
vql_fg_color:
[000018a0] 2f3c 0000 02dc            move.l     #$000002DC,-(a7)
[000018a6] 2f3a e7ea                 move.l     funcVdi(pc),-(a7)
[000018aa] 6000 e806                 bra        indirect
vqm_fg_color:
[000018ae] 2f3c 0000 02e0            move.l     #$000002E0,-(a7)
[000018b4] 2f3a e7dc                 move.l     funcVdi(pc),-(a7)
[000018b8] 6000 e7f8                 bra        indirect
vqr_fg_color:
[000018bc] 2f3c 0000 02e4            move.l     #$000002E4,-(a7)
[000018c2] 2f3a e7ce                 move.l     funcVdi(pc),-(a7)
[000018c6] 6000 e7ea                 bra        indirect
vqt_bg_color:
[000018ca] 2f3c 0000 02e8            move.l     #$000002E8,-(a7)
[000018d0] 2f3a e7c0                 move.l     funcVdi(pc),-(a7)
[000018d4] 6000 e7dc                 bra        indirect
vqf_bg_color:
[000018d8] 2f3c 0000 02ec            move.l     #$000002EC,-(a7)
[000018de] 2f3a e7b2                 move.l     funcVdi(pc),-(a7)
[000018e2] 6000 e7ce                 bra        indirect
vql_bg_color:
[000018e6] 2f3c 0000 02f0            move.l     #$000002F0,-(a7)
[000018ec] 2f3a e7a4                 move.l     funcVdi(pc),-(a7)
[000018f0] 6000 e7c0                 bra        indirect
vqm_bg_color:
[000018f4] 2f3c 0000 02f4            move.l     #$000002F4,-(a7)
[000018fa] 2f3a e796                 move.l     funcVdi(pc),-(a7)
[000018fe] 6000 e7b2                 bra        indirect
VQR_BG_COLOR:
[00001902] 2f3c 0000 02f8            move.l     #$000002F8,-(a7)
[00001908] 2f3a e788                 move.l     funcVdi(pc),-(a7)
[0000190c] 6000 e7a4                 bra        indirect
V_COLOR2VALUE:
[00001910] 2f3c 0000 02fc            move.l     #$000002FC,-(a7)
[00001916] 2f3a e77a                 move.l     funcVdi(pc),-(a7)
[0000191a] 6000 e796                 bra        indirect
V_VALUE2COLOR:
[0000191e] 2f3c 0000 0300            move.l     #$00000300,-(a7)
[00001924] 2f3a e76c                 move.l     funcVdi(pc),-(a7)
[00001928] 6000 e788                 bra        indirect
V_COLOR2NEAREST:
[0000192c] 2f3c 0000 0304            move.l     #$00000304,-(a7)
[00001932] 2f3a e75e                 move.l     funcVdi(pc),-(a7)
[00001936] 6000 e77a                 bra        indirect
VQ_PX_FORMAT:
[0000193a] 2f3c 0000 0308            move.l     #$00000308,-(a7)
[00001940] 2f3a e750                 move.l     funcVdi(pc),-(a7)
[00001944] 6000 e76c                 bra        indirect
VS_CTAB:
[00001948] 2f3c 0000 030c            move.l     #$0000030C,-(a7)
[0000194e] 2f3a e742                 move.l     funcVdi(pc),-(a7)
[00001952] 6000 e75e                 bra        indirect
VS_CTAB_ENTRY:
[00001956] 2f3c 0000 0310            move.l     #$00000310,-(a7)
[0000195c] 2f3a e734                 move.l     funcVdi(pc),-(a7)
[00001960] 6000 e750                 bra        indirect
VS_DFLT_CTAB:
[00001964] 2f3c 0000 0314            move.l     #$00000314,-(a7)
[0000196a] 2f3a e726                 move.l     funcVdi(pc),-(a7)
[0000196e] 6000 e742                 bra        indirect
VQ_CTAB:
[00001972] 2f3c 0000 0318            move.l     #$00000318,-(a7)
[00001978] 2f3a e718                 move.l     funcVdi(pc),-(a7)
[0000197c] 6000 e734                 bra        indirect
VQ_CTAB_ENTRY:
[00001980] 2f3c 0000 031c            move.l     #$0000031C,-(a7)
[00001986] 2f3a e70a                 move.l     funcVdi(pc),-(a7)
[0000198a] 6000 e726                 bra        indirect
VQ_CTAB_ID:
[0000198e] 2f3c 0000 0320            move.l     #$00000320,-(a7)
[00001994] 2f3a e6fc                 move.l     funcVdi(pc),-(a7)
[00001998] 6000 e718                 bra        indirect
V_CTAB_IDX2VDI:
[0000199c] 2f3c 0000 0324            move.l     #$00000324,-(a7)
[000019a2] 2f3a e6ee                 move.l     funcVdi(pc),-(a7)
[000019a6] 6000 e70a                 bra        indirect
V_CTAB_VDI2IDX:
[000019aa] 2f3c 0000 0328            move.l     #$00000328,-(a7)
[000019b0] 2f3a e6e0                 move.l     funcVdi(pc),-(a7)
[000019b4] 6000 e6fc                 bra        indirect
V_CTAB_IDX2VALUE:
[000019b8] 2f3c 0000 032c            move.l     #$0000032C,-(a7)
[000019be] 2f3a e6d2                 move.l     funcVdi(pc),-(a7)
[000019c2] 6000 e6ee                 bra        indirect
V_GET_CTAB_ID:
[000019c6] 2f3c 0000 0330            move.l     #$00000330,-(a7)
[000019cc] 2f3a e6c4                 move.l     funcVdi(pc),-(a7)
[000019d0] 6000 e6e0                 bra        indirect
vq_dflt_ctab:
[000019d4] 2f3c 0000 0334            move.l     #$00000334,-(a7)
[000019da] 2f3a e6b6                 move.l     funcVdi(pc),-(a7)
[000019de] 6000 e6d2                 bra        indirect
v_create_itab:
[000019e2] 2f3c 0000 0338            move.l     #$00000338,-(a7)
[000019e8] 2f3a e6a8                 move.l     funcVdi(pc),-(a7)
[000019ec] 6000 e6c4                 bra        indirect
v_delete_itab:
[000019f0] 2f3c 0000 033c            move.l     #$0000033C,-(a7)
[000019f6] 2f3a e69a                 move.l     funcVdi(pc),-(a7)
[000019fa] 6000 e6b6                 bra        indirect
vr_transfer_bits:
[000019fe] 2f3c 0000 0340            move.l     #$00000340,-(a7)
[00001a04] 2f3a e68c                 move.l     funcVdi(pc),-(a7)
[00001a08] 6000 e6a8                 bra        indirect
vs_hilite_color:
[00001a0c] 2f3c 0000 0344            move.l     #$00000344,-(a7)
[00001a12] 2f3a e67e                 move.l     funcVdi(pc),-(a7)
[00001a16] 6000 e69a                 bra        indirect
vs_min_color:
[00001a1a] 2f3c 0000 0348            move.l     #$00000348,-(a7)
[00001a20] 2f3a e670                 move.l     funcVdi(pc),-(a7)
[00001a24] 6000 e68c                 bra        indirect
vs_max_color:
[00001a28] 2f3c 0000 034c            move.l     #$0000034C,-(a7)
[00001a2e] 2f3a e662                 move.l     funcVdi(pc),-(a7)
[00001a32] 6000 e67e                 bra        indirect
vs_weight_color:
[00001a36] 2f3c 0000 0350            move.l     #$00000350,-(a7)
[00001a3c] 2f3a e654                 move.l     funcVdi(pc),-(a7)
[00001a40] 6000 e670                 bra        indirect
VQ_HILITE_COLOR:
[00001a44] 2f3c 0000 0354            move.l     #$00000354,-(a7)
[00001a4a] 2f3a e646                 move.l     funcVdi(pc),-(a7)
[00001a4e] 6000 e662                 bra        indirect
VQ_MIN_COLOR:
[00001a52] 2f3c 0000 0358            move.l     #$00000358,-(a7)
[00001a58] 2f3a e638                 move.l     funcVdi(pc),-(a7)
[00001a5c] 6000 e654                 bra        indirect
VQ_MAX_COLOR:
[00001a60] 2f3c 0000 035c            move.l     #$0000035C,-(a7)
[00001a66] 2f3a e62a                 move.l     funcVdi(pc),-(a7)
[00001a6a] 6000 e646                 bra        indirect
VQ_WEIGHT_COLOR:
[00001a6e] 2f3c 0000 0360            move.l     #$00000360,-(a7)
[00001a74] 2f3a e61c                 move.l     funcVdi(pc),-(a7)
[00001a78] 6000 e638                 bra        indirect
VS_DOCUMENT_INFO:
[00001a7c] 2f3c 0000 0364            move.l     #$00000364,-(a7)
[00001a82] 2f3a e60e                 move.l     funcVdi(pc),-(a7)
[00001a86] 6000 e62a                 bra        indirect
VQ_PRN_SCALING:
[00001a8a] 2f3c 0000 0368            move.l     #$00000368,-(a7)
[00001a90] 2f3a e600                 move.l     funcVdi(pc),-(a7)
[00001a94] 6000 e61c                 bra        indirect
V_OPEN_BM:
[00001a98] 2f3c 0000 036c            move.l     #$0000036C,-(a7)
[00001a9e] 2f3a e5f2                 move.l     funcVdi(pc),-(a7)
[00001aa2] 6000 e60e                 bra        indirect
v_resize_bm:
[00001aa6] 2f3c 0000 0370            move.l     #$00000370,-(a7)
[00001aac] 2f3a e5e4                 move.l     funcVdi(pc),-(a7)
[00001ab0] 6000 e600                 bra        indirect
v_get_outline:
[00001ab4] 2f3c 0000 0374            move.l     #$00000374,-(a7)
[00001aba] 2f3a e5d6                 move.l     funcVdi(pc),-(a7)
[00001abe] 6000 e5f2                 bra        indirect
vst_track_offset:
[00001ac2] 2f3c 0000 0378            move.l     #$00000378,-(a7)
[00001ac8] 2f3a e5c8                 move.l     funcVdi(pc),-(a7)
[00001acc] 6000 e5e4                 bra        indirect
vst_arbpt:
[00001ad0] 2f3c 0000 037c            move.l     #$0000037C,-(a7)
[00001ad6] 2f3a e5ba                 move.l     funcVdi(pc),-(a7)
[00001ada] 6000 e5d6                 bra        indirect
vqt_advance:
[00001ade] 2f3c 0000 0380            move.l     #$00000380,-(a7)
[00001ae4] 2f3a e5ac                 move.l     funcVdi(pc),-(a7)
[00001ae8] 6000 e5c8                 bra        indirect
vst_setsize:
[00001aec] 2f3c 0000 0384            move.l     #$00000384,-(a7)
[00001af2] 2f3a e59e                 move.l     funcVdi(pc),-(a7)
[00001af6] 6000 e5ba                 bra        indirect
vq_vgdos:
[00001afa] 2f3c 0000 0388            move.l     #$00000388,-(a7)
[00001b00] 2f3a e590                 move.l     funcVdi(pc),-(a7)
[00001b04] 6000 e5ac                 bra        indirect
vst_width:
[00001b08] 2f3c 0000 038c            move.l     #$0000038C,-(a7)
[00001b0e] 2f3a e582                 move.l     funcVdi(pc),-(a7)
[00001b12] 6000 e59e                 bra        indirect
vst_scratch:
[00001b16] 2f3c 0000 0390            move.l     #$00000390,-(a7)
[00001b1c] 2f3a e574                 move.l     funcVdi(pc),-(a7)
[00001b20] 6000 e590                 bra        indirect
vst_error:
[00001b24] 2f3c 0000 0394            move.l     #$00000394,-(a7)
[00001b2a] 2f3a e566                 move.l     funcVdi(pc),-(a7)
[00001b2e] 6000 e582                 bra        indirect
v_savecache:
[00001b32] 2f3c 0000 0398            move.l     #$00000398,-(a7)
[00001b38] 2f3a e558                 move.l     funcVdi(pc),-(a7)
[00001b3c] 6000 e574                 bra        indirect
v_loadcache:
[00001b40] 2f3c 0000 039c            move.l     #$0000039C,-(a7)
[00001b46] 2f3a e54a                 move.l     funcVdi(pc),-(a7)
[00001b4a] 6000 e566                 bra        indirect
v_flushcache:
[00001b4e] 2f3c 0000 03a0            move.l     #$000003A0,-(a7)
[00001b54] 2f3a e53c                 move.l     funcVdi(pc),-(a7)
[00001b58] 6000 e558                 bra        indirect
vqt_cachesize:
[00001b5c] 2f3c 0000 03a4            move.l     #$000003A4,-(a7)
[00001b62] 2f3a e52e                 move.l     funcVdi(pc),-(a7)
[00001b66] 6000 e54a                 bra        indirect
vqt_get_table:
[00001b6a] 2f3c 0000 03a8            move.l     #$000003A8,-(a7)
[00001b70] 2f3a e520                 move.l     funcVdi(pc),-(a7)
[00001b74] 6000 e53c                 bra        indirect
vs_curaddress:
[00001b78] 2f3c 0000 03ac            move.l     #$000003AC,-(a7)
[00001b7e] 2f3a e512                 move.l     funcVdi(pc),-(a7)
[00001b82] 6000 e52e                 bra        indirect
VSF_PERIMETER3:
[00001b86] 2f3c 0000 03b0            move.l     #$000003B0,-(a7)
[00001b8c] 2f3a e504                 move.l     funcVdi(pc),-(a7)
[00001b90] 6000 e520                 bra        indirect
VQT_JUSTIFIED:
[00001b94] 2f3c 0000 03b4            move.l     #$000003B4,-(a7)
[00001b9a] 2f3a e4f6                 move.l     funcVdi(pc),-(a7)
[00001b9e] 6000 e512                 bra        indirect
V_OPNPRNWRK:
[00001ba2] 2f3c 0000 03b8            move.l     #$000003B8,-(a7)
[00001ba8] 2f3a e4e8                 move.l     funcVdi(pc),-(a7)
[00001bac] 6000 e504                 bra        indirect
V_OPNMATRIXPRN:
[00001bb0] 2f3c 0000 03bc            move.l     #$000003BC,-(a7)
[00001bb6] 2f3a e4da                 move.l     funcVdi(pc),-(a7)
[00001bba] 6000 e4f6                 bra        indirect
V_SET_APP_BUFF:
[00001bbe] 2f3c 0000 03c0            move.l     #$000003C0,-(a7)
[00001bc4] 2f3a e4cc                 move.l     funcVdi(pc),-(a7)
[00001bc8] 6000 e4e8                 bra        indirect
VQT_DEVINFO:
[00001bcc] 2f3c 0000 03c4            move.l     #$000003C4,-(a7)
[00001bd2] 2f3a e4be                 move.l     funcVdi(pc),-(a7)
[00001bd6] 6000 e4da                 bra        indirect
V_CREATE_CTAB:
[00001bda] 2f3c 0000 03c8            move.l     #$000003C8,-(a7)
[00001be0] 2f3a e4b0                 move.l     funcVdi(pc),-(a7)
[00001be4] 6000 e4cc                 bra        indirect
v_delete_ctab:
[00001be8] 2f3c 0000 03cc            move.l     #$000003CC,-(a7)
[00001bee] 2f3a e4a2                 move.l     funcVdi(pc),-(a7)
[00001bf2] 6000 e4be                 bra        indirect
v_setrgb:
[00001bf6] 2f3c 0000 03d0            move.l     #$000003D0,-(a7)
[00001bfc] 2f3a e494                 move.l     funcVdi(pc),-(a7)
[00001c00] 6000 e4b0                 bra        indirect
aes:
[00001c04] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00001c0a] 2f3a e48c                 move.l     funcAes(pc),-(a7)
[00001c0e] 6000 e4a2                 bra        indirect
APPL_INIT:
[00001c12] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00001c18] 2f3a e47e                 move.l     funcAes(pc),-(a7)
[00001c1c] 6000 e494                 bra        indirect
APPL_READ:
[00001c20] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[00001c26] 2f3a e470                 move.l     funcAes(pc),-(a7)
[00001c2a] 6000 e486                 bra        indirect
APPL_WRITE:
[00001c2e] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[00001c34] 2f3a e462                 move.l     funcAes(pc),-(a7)
[00001c38] 6000 e478                 bra        indirect
APPL_FIND:
[00001c3c] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[00001c42] 2f3a e454                 move.l     funcAes(pc),-(a7)
[00001c46] 6000 e46a                 bra        indirect
APPL_SEARCH:
[00001c4a] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00001c50] 2f3a e446                 move.l     funcAes(pc),-(a7)
[00001c54] 6000 e45c                 bra        indirect
appl_tplay:
[00001c58] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00001c5e] 2f3a e438                 move.l     funcAes(pc),-(a7)
[00001c62] 6000 e44e                 bra        indirect
appl_trecord:
[00001c66] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[00001c6c] 2f3a e42a                 move.l     funcAes(pc),-(a7)
[00001c70] 6000 e440                 bra        indirect
appl_yield:
[00001c74] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[00001c7a] 2f3a e41c                 move.l     funcAes(pc),-(a7)
[00001c7e] 6000 e432                 bra        indirect
appl_exit:
[00001c82] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[00001c88] 2f3a e40e                 move.l     funcAes(pc),-(a7)
[00001c8c] 6000 e424                 bra        indirect
appl_getinfo:
[00001c90] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[00001c96] 2f3a e400                 move.l     funcAes(pc),-(a7)
[00001c9a] 6000 e416                 bra        indirect
appl_control:
[00001c9e] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[00001ca4] 2f3a e3f2                 move.l     funcAes(pc),-(a7)
[00001ca8] 6000 e408                 bra        indirect
evnt_keybd:
[00001cac] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[00001cb2] 2f3a e3e4                 move.l     funcAes(pc),-(a7)
[00001cb6] 6000 e3fa                 bra        indirect
evnt_button:
[00001cba] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[00001cc0] 2f3a e3d6                 move.l     funcAes(pc),-(a7)
[00001cc4] 6000 e3ec                 bra        indirect
evnt_mouse:
[00001cc8] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[00001cce] 2f3a e3c8                 move.l     funcAes(pc),-(a7)
[00001cd2] 6000 e3de                 bra        indirect
evnt_mesag:
[00001cd6] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[00001cdc] 2f3a e3ba                 move.l     funcAes(pc),-(a7)
[00001ce0] 6000 e3d0                 bra        indirect
evnt_timer:
[00001ce4] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[00001cea] 2f3a e3ac                 move.l     funcAes(pc),-(a7)
[00001cee] 6000 e3c2                 bra        indirect
evnt_event:
[00001cf2] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[00001cf8] 2f3a e39e                 move.l     funcAes(pc),-(a7)
[00001cfc] 6000 e3b4                 bra        indirect
evnt_multi:
[00001d00] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[00001d06] 2f3a e390                 move.l     funcAes(pc),-(a7)
[00001d0a] 6000 e3a6                 bra        indirect
evnt_dclick:
[00001d0e] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[00001d14] 2f3a e382                 move.l     funcAes(pc),-(a7)
[00001d18] 6000 e398                 bra        indirect
MENU_BAR:
[00001d1c] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[00001d22] 2f3a e374                 move.l     funcAes(pc),-(a7)
[00001d26] 6000 e38a                 bra        indirect
menu_icheck:
[00001d2a] 2f3c 0000 0054            move.l     #$00000054,-(a7)
[00001d30] 2f3a e366                 move.l     funcAes(pc),-(a7)
[00001d34] 6000 e37c                 bra        indirect
menu_ienable:
[00001d38] 2f3c 0000 0058            move.l     #$00000058,-(a7)
[00001d3e] 2f3a e358                 move.l     funcAes(pc),-(a7)
[00001d42] 6000 e36e                 bra        indirect
menu_tnormal:
[00001d46] 2f3c 0000 005c            move.l     #$0000005C,-(a7)
[00001d4c] 2f3a e34a                 move.l     funcAes(pc),-(a7)
[00001d50] 6000 e360                 bra        indirect
menu_text:
[00001d54] 2f3c 0000 0060            move.l     #$00000060,-(a7)
[00001d5a] 2f3a e33c                 move.l     funcAes(pc),-(a7)
[00001d5e] 6000 e352                 bra        indirect
menu_register:
[00001d62] 2f3c 0000 0064            move.l     #$00000064,-(a7)
[00001d68] 2f3a e32e                 move.l     funcAes(pc),-(a7)
[00001d6c] 6000 e344                 bra        indirect
menu_unregister:
[00001d70] 2f3c 0000 0068            move.l     #$00000068,-(a7)
[00001d76] 2f3a e320                 move.l     funcAes(pc),-(a7)
[00001d7a] 6000 e336                 bra        indirect
menu_click:
[00001d7e] 2f3c 0000 006c            move.l     #$0000006C,-(a7)
[00001d84] 2f3a e312                 move.l     funcAes(pc),-(a7)
[00001d88] 6000 e328                 bra        indirect
menu_attach:
[00001d8c] 2f3c 0000 0070            move.l     #$00000070,-(a7)
[00001d92] 2f3a e304                 move.l     funcAes(pc),-(a7)
[00001d96] 6000 e31a                 bra        indirect
MENU_ISTART:
[00001d9a] 2f3c 0000 0074            move.l     #$00000074,-(a7)
[00001da0] 2f3a e2f6                 move.l     funcAes(pc),-(a7)
[00001da4] 6000 e30c                 bra        indirect
MENU_POPUP:
[00001da8] 2f3c 0000 0078            move.l     #$00000078,-(a7)
[00001dae] 2f3a e2e8                 move.l     funcAes(pc),-(a7)
[00001db2] 6000 e2fe                 bra        indirect
MENU_SETTINGS:
[00001db6] 2f3c 0000 007c            move.l     #$0000007C,-(a7)
[00001dbc] 2f3a e2da                 move.l     funcAes(pc),-(a7)
[00001dc0] 6000 e2f0                 bra        indirect
OBJC_ADD:
[00001dc4] 2f3c 0000 0080            move.l     #$00000080,-(a7)
[00001dca] 2f3a e2cc                 move.l     funcAes(pc),-(a7)
[00001dce] 6000 e2e2                 bra        indirect
OBJC_DELETE:
[00001dd2] 2f3c 0000 0084            move.l     #$00000084,-(a7)
[00001dd8] 2f3a e2be                 move.l     funcAes(pc),-(a7)
[00001ddc] 6000 e2d4                 bra        indirect
OBJC_DRAW:
[00001de0] 2f3c 0000 0088            move.l     #$00000088,-(a7)
[00001de6] 2f3a e2b0                 move.l     funcAes(pc),-(a7)
[00001dea] 6000 e2c6                 bra        indirect
OBJC_FIND:
[00001dee] 2f3c 0000 008c            move.l     #$0000008C,-(a7)
[00001df4] 2f3a e2a2                 move.l     funcAes(pc),-(a7)
[00001df8] 6000 e2b8                 bra        indirect
objc_offset:
[00001dfc] 2f3c 0000 0090            move.l     #$00000090,-(a7)
[00001e02] 2f3a e294                 move.l     funcAes(pc),-(a7)
[00001e06] 6000 e2aa                 bra        indirect
objc_order:
[00001e0a] 2f3c 0000 0094            move.l     #$00000094,-(a7)
[00001e10] 2f3a e286                 move.l     funcAes(pc),-(a7)
[00001e14] 6000 e29c                 bra        indirect
objc_edit:
[00001e18] 2f3c 0000 0098            move.l     #$00000098,-(a7)
[00001e1e] 2f3a e278                 move.l     funcAes(pc),-(a7)
[00001e22] 6000 e28e                 bra        indirect
objc_change:
[00001e26] 2f3c 0000 009c            move.l     #$0000009C,-(a7)
[00001e2c] 2f3a e26a                 move.l     funcAes(pc),-(a7)
[00001e30] 6000 e280                 bra        indirect
objc_sysvar:
[00001e34] 2f3c 0000 00a0            move.l     #$000000A0,-(a7)
[00001e3a] 2f3a e25c                 move.l     funcAes(pc),-(a7)
[00001e3e] 6000 e272                 bra        indirect
form_do:
[00001e42] 2f3c 0000 00a4            move.l     #$000000A4,-(a7)
[00001e48] 2f3a e24e                 move.l     funcAes(pc),-(a7)
[00001e4c] 6000 e264                 bra        indirect
form_dial:
[00001e50] 2f3c 0000 00a8            move.l     #$000000A8,-(a7)
[00001e56] 2f3a e240                 move.l     funcAes(pc),-(a7)
[00001e5a] 6000 e256                 bra        indirect
form_alert:
[00001e5e] 2f3c 0000 00ac            move.l     #$000000AC,-(a7)
[00001e64] 2f3a e232                 move.l     funcAes(pc),-(a7)
[00001e68] 6000 e248                 bra        indirect
form_error:
[00001e6c] 2f3c 0000 00b0            move.l     #$000000B0,-(a7)
[00001e72] 2f3a e224                 move.l     funcAes(pc),-(a7)
[00001e76] 6000 e23a                 bra        indirect
form_center:
[00001e7a] 2f3c 0000 00b4            move.l     #$000000B4,-(a7)
[00001e80] 2f3a e216                 move.l     funcAes(pc),-(a7)
[00001e84] 6000 e22c                 bra        indirect
form_keybd:
[00001e88] 2f3c 0000 00b8            move.l     #$000000B8,-(a7)
[00001e8e] 2f3a e208                 move.l     funcAes(pc),-(a7)
[00001e92] 6000 e21e                 bra        indirect
form_button:
[00001e96] 2f3c 0000 00bc            move.l     #$000000BC,-(a7)
[00001e9c] 2f3a e1fa                 move.l     funcAes(pc),-(a7)
[00001ea0] 6000 e210                 bra        indirect
GRAF_RUBBOX:
[00001ea4] 2f3c 0000 00c0            move.l     #$000000C0,-(a7)
[00001eaa] 2f3a e1ec                 move.l     funcAes(pc),-(a7)
[00001eae] 6000 e202                 bra        indirect
GRAF_RUBBERBOX:
[00001eb2] 2f3c 0000 00c4            move.l     #$000000C4,-(a7)
[00001eb8] 2f3a e1de                 move.l     funcAes(pc),-(a7)
[00001ebc] 6000 e1f4                 bra        indirect
GRAF_DRAGBOX:
[00001ec0] 2f3c 0000 00c8            move.l     #$000000C8,-(a7)
[00001ec6] 2f3a e1d0                 move.l     funcAes(pc),-(a7)
[00001eca] 6000 e1e6                 bra        indirect
GRAF_MBOX:
[00001ece] 2f3c 0000 00cc            move.l     #$000000CC,-(a7)
[00001ed4] 2f3a e1c2                 move.l     funcAes(pc),-(a7)
[00001ed8] 6000 e1d8                 bra        indirect
graf_movebox:
[00001edc] 2f3c 0000 00d0            move.l     #$000000D0,-(a7)
[00001ee2] 2f3a e1b4                 move.l     funcAes(pc),-(a7)
[00001ee6] 6000 e1ca                 bra        indirect
graf_growbox:
[00001eea] 2f3c 0000 00d4            move.l     #$000000D4,-(a7)
[00001ef0] 2f3a e1a6                 move.l     funcAes(pc),-(a7)
[00001ef4] 6000 e1bc                 bra        indirect
graf_shrinkbox:
[00001ef8] 2f3c 0000 00d8            move.l     #$000000D8,-(a7)
[00001efe] 2f3a e198                 move.l     funcAes(pc),-(a7)
[00001f02] 6000 e1ae                 bra        indirect
graf_watchbox:
[00001f06] 2f3c 0000 00dc            move.l     #$000000DC,-(a7)
[00001f0c] 2f3a e18a                 move.l     funcAes(pc),-(a7)
[00001f10] 6000 e1a0                 bra        indirect
graf_slidebox:
[00001f14] 2f3c 0000 00e0            move.l     #$000000E0,-(a7)
[00001f1a] 2f3a e17c                 move.l     funcAes(pc),-(a7)
[00001f1e] 6000 e192                 bra        indirect
graf_handle:
[00001f22] 2f3c 0000 00e4            move.l     #$000000E4,-(a7)
[00001f28] 2f3a e16e                 move.l     funcAes(pc),-(a7)
[00001f2c] 6000 e184                 bra        indirect
graf_mouse:
[00001f30] 2f3c 0000 00e8            move.l     #$000000E8,-(a7)
[00001f36] 2f3a e160                 move.l     funcAes(pc),-(a7)
[00001f3a] 6000 e176                 bra        indirect
GRAF_MKSTATE:
[00001f3e] 2f3c 0000 00ec            move.l     #$000000EC,-(a7)
[00001f44] 2f3a e152                 move.l     funcAes(pc),-(a7)
[00001f48] 6000 e168                 bra        indirect
GRAF_MULTIRUBBER:
[00001f4c] 2f3c 0000 00f0            move.l     #$000000F0,-(a7)
[00001f52] 2f3a e144                 move.l     funcAes(pc),-(a7)
[00001f56] 6000 e15a                 bra        indirect
scrp_read:
[00001f5a] 2f3c 0000 00f4            move.l     #$000000F4,-(a7)
[00001f60] 2f3a e136                 move.l     funcAes(pc),-(a7)
[00001f64] 6000 e14c                 bra        indirect
scrp_write:
[00001f68] 2f3c 0000 00f8            move.l     #$000000F8,-(a7)
[00001f6e] 2f3a e128                 move.l     funcAes(pc),-(a7)
[00001f72] 6000 e13e                 bra        indirect
FSEL_INPUT:
[00001f76] 2f3c 0000 00fc            move.l     #$000000FC,-(a7)
[00001f7c] 2f3a e11a                 move.l     funcAes(pc),-(a7)
[00001f80] 6000 e130                 bra        indirect
FSEL_EXINPUT:
[00001f84] 2f3c 0000 0100            move.l     #$00000100,-(a7)
[00001f8a] 2f3a e10c                 move.l     funcAes(pc),-(a7)
[00001f8e] 6000 e122                 bra        indirect
FSEL_BOXINPUT:
[00001f92] 2f3c 0000 0104            move.l     #$00000104,-(a7)
[00001f98] 2f3a e0fe                 move.l     funcAes(pc),-(a7)
[00001f9c] 6000 e114                 bra        indirect
fslx_open:
[00001fa0] 2f3c 0000 0108            move.l     #$00000108,-(a7)
[00001fa6] 2f3a e0f0                 move.l     funcAes(pc),-(a7)
[00001faa] 6000 e106                 bra        indirect
FSLX_CLOSE:
[00001fae] 2f3c 0000 010c            move.l     #$0000010C,-(a7)
[00001fb4] 2f3a e0e2                 move.l     funcAes(pc),-(a7)
[00001fb8] 6000 e0f8                 bra        indirect
FSLX_GETNXTFILE:
[00001fbc] 2f3c 0000 0110            move.l     #$00000110,-(a7)
[00001fc2] 2f3a e0d4                 move.l     funcAes(pc),-(a7)
[00001fc6] 6000 e0ea                 bra        indirect
FSLX_EVNT:
[00001fca] 2f3c 0000 0114            move.l     #$00000114,-(a7)
[00001fd0] 2f3a e0c6                 move.l     funcAes(pc),-(a7)
[00001fd4] 6000 e0dc                 bra        indirect
FSLX_DO:
[00001fd8] 2f3c 0000 0118            move.l     #$00000118,-(a7)
[00001fde] 2f3a e0b8                 move.l     funcAes(pc),-(a7)
[00001fe2] 6000 e0ce                 bra        indirect
FSLX_SET_FLAGS:
[00001fe6] 2f3c 0000 011c            move.l     #$0000011C,-(a7)
[00001fec] 2f3a e0aa                 move.l     funcAes(pc),-(a7)
[00001ff0] 6000 e0c0                 bra        indirect
WIND_CREATE:
[00001ff4] 2f3c 0000 0120            move.l     #$00000120,-(a7)
[00001ffa] 2f3a e09c                 move.l     funcAes(pc),-(a7)
[00001ffe] 6000 e0b2                 bra        indirect
WIND_OPEN:
[00002002] 2f3c 0000 0124            move.l     #$00000124,-(a7)
[00002008] 2f3a e08e                 move.l     funcAes(pc),-(a7)
[0000200c] 6000 e0a4                 bra        indirect
WIND_CLOSE:
[00002010] 2f3c 0000 0128            move.l     #$00000128,-(a7)
[00002016] 2f3a e080                 move.l     funcAes(pc),-(a7)
[0000201a] 6000 e096                 bra        indirect
WIND_DELETE:
[0000201e] 2f3c 0000 012c            move.l     #$0000012C,-(a7)
[00002024] 2f3a e072                 move.l     funcAes(pc),-(a7)
[00002028] 6000 e088                 bra        indirect
WIND_GET:
[0000202c] 2f3c 0000 0130            move.l     #$00000130,-(a7)
[00002032] 2f3a e064                 move.l     funcAes(pc),-(a7)
[00002036] 6000 e07a                 bra        indirect
WIND_GETQSB:
[0000203a] 2f3c 0000 0134            move.l     #$00000134,-(a7)
[00002040] 2f3a e056                 move.l     funcAes(pc),-(a7)
[00002044] 6000 e06c                 bra        indirect
WIND_SET:
[00002048] 2f3c 0000 0138            move.l     #$00000138,-(a7)
[0000204e] 2f3a e048                 move.l     funcAes(pc),-(a7)
[00002052] 6000 e05e                 bra        indirect
WIND_FIND:
[00002056] 2f3c 0000 013c            move.l     #$0000013C,-(a7)
[0000205c] 2f3a e03a                 move.l     funcAes(pc),-(a7)
[00002060] 6000 e050                 bra        indirect
WIND_UPDATE:
[00002064] 2f3c 0000 0140            move.l     #$00000140,-(a7)
[0000206a] 2f3a e02c                 move.l     funcAes(pc),-(a7)
[0000206e] 6000 e042                 bra        indirect
WIND_CALC:
[00002072] 2f3c 0000 0144            move.l     #$00000144,-(a7)
[00002078] 2f3a e01e                 move.l     funcAes(pc),-(a7)
[0000207c] 6000 e034                 bra        indirect
wind_new:
[00002080] 2f3c 0000 0148            move.l     #$00000148,-(a7)
[00002086] 2f3a e010                 move.l     funcAes(pc),-(a7)
[0000208a] 6000 e026                 bra        indirect
rsrc_load:
[0000208e] 2f3c 0000 014c            move.l     #$0000014C,-(a7)
[00002094] 2f3a e002                 move.l     funcAes(pc),-(a7)
[00002098] 6000 e018                 bra        indirect
rsrc_free:
[0000209c] 2f3c 0000 0150            move.l     #$00000150,-(a7)
[000020a2] 2f3a dff4                 move.l     funcAes(pc),-(a7)
[000020a6] 6000 e00a                 bra        indirect
rsrc_gaddr:
[000020aa] 2f3c 0000 0154            move.l     #$00000154,-(a7)
[000020b0] 2f3a dfe6                 move.l     funcAes(pc),-(a7)
[000020b4] 6000 dffc                 bra        indirect
rsrc_saddr:
[000020b8] 2f3c 0000 0158            move.l     #$00000158,-(a7)
[000020be] 2f3a dfd8                 move.l     funcAes(pc),-(a7)
[000020c2] 6000 dfee                 bra        indirect
rsrc_obfix:
[000020c6] 2f3c 0000 015c            move.l     #$0000015C,-(a7)
[000020cc] 2f3a dfca                 move.l     funcAes(pc),-(a7)
[000020d0] 6000 dfe0                 bra        indirect
rsrc_rcfix:
[000020d4] 2f3c 0000 0160            move.l     #$00000160,-(a7)
[000020da] 2f3a dfbc                 move.l     funcAes(pc),-(a7)
[000020de] 6000 dfd2                 bra        indirect
shel_read:
[000020e2] 2f3c 0000 0164            move.l     #$00000164,-(a7)
[000020e8] 2f3a dfae                 move.l     funcAes(pc),-(a7)
[000020ec] 6000 dfc4                 bra        indirect
SHEL_WRITE:
[000020f0] 2f3c 0000 0168            move.l     #$00000168,-(a7)
[000020f6] 2f3a dfa0                 move.l     funcAes(pc),-(a7)
[000020fa] 6000 dfb6                 bra        indirect
SHEL_GET:
[000020fe] 2f3c 0000 016c            move.l     #$0000016C,-(a7)
[00002104] 2f3a df92                 move.l     funcAes(pc),-(a7)
[00002108] 6000 dfa8                 bra        indirect
SHEL_PUT:
[0000210c] 2f3c 0000 0170            move.l     #$00000170,-(a7)
[00002112] 2f3a df84                 move.l     funcAes(pc),-(a7)
[00002116] 6000 df9a                 bra        indirect
SHEL_FIND:
[0000211a] 2f3c 0000 0174            move.l     #$00000174,-(a7)
[00002120] 2f3a df76                 move.l     funcAes(pc),-(a7)
[00002124] 6000 df8c                 bra        indirect
SHEL_ENVRN:
[00002128] 2f3c 0000 0178            move.l     #$00000178,-(a7)
[0000212e] 2f3a df68                 move.l     funcAes(pc),-(a7)
[00002132] 6000 df7e                 bra        indirect
SHEL_HELP:
[00002136] 2f3c 0000 017c            move.l     #$0000017C,-(a7)
[0000213c] 2f3a df5a                 move.l     funcAes(pc),-(a7)
[00002140] 6000 df70                 bra        indirect
FNTS_ADD:
[00002144] 2f3c 0000 0180            move.l     #$00000180,-(a7)
[0000214a] 2f3a df4c                 move.l     funcAes(pc),-(a7)
[0000214e] 6000 df62                 bra        indirect
fnts_close:
[00002152] 2f3c 0000 0184            move.l     #$00000184,-(a7)
[00002158] 2f3a df3e                 move.l     funcAes(pc),-(a7)
[0000215c] 6000 df54                 bra        indirect
fnts_create:
[00002160] 2f3c 0000 0188            move.l     #$00000188,-(a7)
[00002166] 2f3a df30                 move.l     funcAes(pc),-(a7)
[0000216a] 6000 df46                 bra        indirect
fnts_delete:
[0000216e] 2f3c 0000 018c            move.l     #$0000018C,-(a7)
[00002174] 2f3a df22                 move.l     funcAes(pc),-(a7)
[00002178] 6000 df38                 bra        indirect
fnts_do:
[0000217c] 2f3c 0000 0190            move.l     #$00000190,-(a7)
[00002182] 2f3a df14                 move.l     funcAes(pc),-(a7)
[00002186] 6000 df2a                 bra        indirect
fnts_evnt:
[0000218a] 2f3c 0000 0194            move.l     #$00000194,-(a7)
[00002190] 2f3a df06                 move.l     funcAes(pc),-(a7)
[00002194] 6000 df1c                 bra        indirect
fnts_get_info:
[00002198] 2f3c 0000 0198            move.l     #$00000198,-(a7)
[0000219e] 2f3a def8                 move.l     funcAes(pc),-(a7)
[000021a2] 6000 df0e                 bra        indirect
fnts_get_name:
[000021a6] 2f3c 0000 019c            move.l     #$0000019C,-(a7)
[000021ac] 2f3a deea                 move.l     funcAes(pc),-(a7)
[000021b0] 6000 df00                 bra        indirect
fnts_get_no_styles:
[000021b4] 2f3c 0000 01a0            move.l     #$000001A0,-(a7)
[000021ba] 2f3a dedc                 move.l     funcAes(pc),-(a7)
[000021be] 6000 def2                 bra        indirect
fnts_get_style:
[000021c2] 2f3c 0000 01a4            move.l     #$000001A4,-(a7)
[000021c8] 2f3a dece                 move.l     funcAes(pc),-(a7)
[000021cc] 6000 dee4                 bra        indirect
fnts_open:
[000021d0] 2f3c 0000 01a8            move.l     #$000001A8,-(a7)
[000021d6] 2f3a dec0                 move.l     funcAes(pc),-(a7)
[000021da] 6000 ded6                 bra        indirect
fnts_remove:
[000021de] 2f3c 0000 01ac            move.l     #$000001AC,-(a7)
[000021e4] 2f3a deb2                 move.l     funcAes(pc),-(a7)
[000021e8] 6000 dec8                 bra        indirect
fnts_update:
[000021ec] 2f3c 0000 01b0            move.l     #$000001B0,-(a7)
[000021f2] 2f3a dea4                 move.l     funcAes(pc),-(a7)
[000021f6] 6000 deba                 bra        indirect
lbox_ascroll_to:
[000021fa] 2f3c 0000 01b4            move.l     #$000001B4,-(a7)
[00002200] 2f3a de96                 move.l     funcAes(pc),-(a7)
[00002204] 6000 deac                 bra        indirect
lbox_scroll_to:
[00002208] 2f3c 0000 01b8            move.l     #$000001B8,-(a7)
[0000220e] 2f3a de88                 move.l     funcAes(pc),-(a7)
[00002212] 6000 de9e                 bra        indirect
lbox_bscroll_to:
[00002216] 2f3c 0000 01bc            move.l     #$000001BC,-(a7)
[0000221c] 2f3a de7a                 move.l     funcAes(pc),-(a7)
[00002220] 6000 de90                 bra        indirect
lbox_cnt_items:
[00002224] 2f3c 0000 01c0            move.l     #$000001C0,-(a7)
[0000222a] 2f3a de6c                 move.l     funcAes(pc),-(a7)
[0000222e] 6000 de82                 bra        indirect
LBOX_CREATE:
[00002232] 2f3c 0000 01c4            move.l     #$000001C4,-(a7)
[00002238] 2f3a de5e                 move.l     funcAes(pc),-(a7)
[0000223c] 6000 de74                 bra        indirect
LBOX_DELETE:
[00002240] 2f3c 0000 01c8            move.l     #$000001C8,-(a7)
[00002246] 2f3a de50                 move.l     funcAes(pc),-(a7)
[0000224a] 6000 de66                 bra        indirect
LBOX_DO:
[0000224e] 2f3c 0000 01cc            move.l     #$000001CC,-(a7)
[00002254] 2f3a de42                 move.l     funcAes(pc),-(a7)
[00002258] 6000 de58                 bra        indirect
LBOX_FREE_ITEMS:
[0000225c] 2f3c 0000 01d0            move.l     #$000001D0,-(a7)
[00002262] 2f3a de34                 move.l     funcAes(pc),-(a7)
[00002266] 6000 de4a                 bra        indirect
LBOX_FREE_LIST:
[0000226a] 2f3c 0000 01d4            move.l     #$000001D4,-(a7)
[00002270] 2f3a de26                 move.l     funcAes(pc),-(a7)
[00002274] 6000 de3c                 bra        indirect
LBOX_GET_AFIRST:
[00002278] 2f3c 0000 01d8            move.l     #$000001D8,-(a7)
[0000227e] 2f3a de18                 move.l     funcAes(pc),-(a7)
[00002282] 6000 de2e                 bra        indirect
LBOX_GET_FIRST:
[00002286] 2f3c 0000 01dc            move.l     #$000001DC,-(a7)
[0000228c] 2f3a de0a                 move.l     funcAes(pc),-(a7)
[00002290] 6000 de20                 bra        indirect
lbox_get_avis:
[00002294] 2f3c 0000 01e0            move.l     #$000001E0,-(a7)
[0000229a] 2f3a ddfc                 move.l     funcAes(pc),-(a7)
[0000229e] 6000 de12                 bra        indirect
lbox_get_visible:
[000022a2] 2f3c 0000 01e4            move.l     #$000001E4,-(a7)
[000022a8] 2f3a ddee                 move.l     funcAes(pc),-(a7)
[000022ac] 6000 de04                 bra        indirect
lbox_get_bentries:
[000022b0] 2f3c 0000 01e8            move.l     #$000001E8,-(a7)
[000022b6] 2f3a dde0                 move.l     funcAes(pc),-(a7)
[000022ba] 6000 ddf6                 bra        indirect
lbox_get_bfirst:
[000022be] 2f3c 0000 01ec            move.l     #$000001EC,-(a7)
[000022c4] 2f3a ddd2                 move.l     funcAes(pc),-(a7)
[000022c8] 6000 dde8                 bra        indirect
lbox_get_idx:
[000022cc] 2f3c 0000 01f0            move.l     #$000001F0,-(a7)
[000022d2] 2f3a ddc4                 move.l     funcAes(pc),-(a7)
[000022d6] 6000 ddda                 bra        indirect
lbox_get_item:
[000022da] 2f3c 0000 01f4            move.l     #$000001F4,-(a7)
[000022e0] 2f3a ddb6                 move.l     funcAes(pc),-(a7)
[000022e4] 6000 ddcc                 bra        indirect
lbox_get_items:
[000022e8] 2f3c 0000 01f8            move.l     #$000001F8,-(a7)
[000022ee] 2f3a dda8                 move.l     funcAes(pc),-(a7)
[000022f2] 6000 ddbe                 bra        indirect
lbox_get_slct_idx:
[000022f6] 2f3c 0000 01fc            move.l     #$000001FC,-(a7)
[000022fc] 2f3a dd9a                 move.l     funcAes(pc),-(a7)
[00002300] 6000 ddb0                 bra        indirect
LBOX_GET_SLCT_ITEM:
[00002304] 2f3c 0000 0200            move.l     #$00000200,-(a7)
[0000230a] 2f3a dd8c                 move.l     funcAes(pc),-(a7)
[0000230e] 6000 dda2                 bra        indirect
LBOX_GET_TREE:
[00002312] 2f3c 0000 0204            move.l     #$00000204,-(a7)
[00002318] 2f3a dd7e                 move.l     funcAes(pc),-(a7)
[0000231c] 6000 dd94                 bra        indirect
LBOX_GET_UDATA:
[00002320] 2f3c 0000 0208            move.l     #$00000208,-(a7)
[00002326] 2f3a dd70                 move.l     funcAes(pc),-(a7)
[0000232a] 6000 dd86                 bra        indirect
LBOX_SET_ASLDR:
[0000232e] 2f3c 0000 020c            move.l     #$0000020C,-(a7)
[00002334] 2f3a dd62                 move.l     funcAes(pc),-(a7)
[00002338] 6000 dd78                 bra        indirect
LBOX_SET_SLIDER:
[0000233c] 2f3c 0000 0210            move.l     #$00000210,-(a7)
[00002342] 2f3a dd54                 move.l     funcAes(pc),-(a7)
[00002346] 6000 dd6a                 bra        indirect
LBOX_SET_BENTRIES:
[0000234a] 2f3c 0000 0214            move.l     #$00000214,-(a7)
[00002350] 2f3a dd46                 move.l     funcAes(pc),-(a7)
[00002354] 6000 dd5c                 bra        indirect
LBOX_SET_BSLDR:
[00002358] 2f3c 0000 0218            move.l     #$00000218,-(a7)
[0000235e] 2f3a dd38                 move.l     funcAes(pc),-(a7)
[00002362] 6000 dd4e                 bra        indirect
LBOX_SET_ITEMS:
[00002366] 2f3c 0000 021c            move.l     #$0000021C,-(a7)
[0000236c] 2f3a dd2a                 move.l     funcAes(pc),-(a7)
[00002370] 6000 dd40                 bra        indirect
LBOX_UPDATE:
[00002374] 2f3c 0000 0220            move.l     #$00000220,-(a7)
[0000237a] 2f3a dd1c                 move.l     funcAes(pc),-(a7)
[0000237e] 6000 dd32                 bra        indirect
PDLG_ADD_PRINTERS:
[00002382] 2f3c 0000 0224            move.l     #$00000224,-(a7)
[00002388] 2f3a dd0e                 move.l     funcAes(pc),-(a7)
[0000238c] 6000 dd24                 bra        indirect
PDLG_ADD_SUB_DIALOGS:
[00002390] 2f3c 0000 0228            move.l     #$00000228,-(a7)
[00002396] 2f3a dd00                 move.l     funcAes(pc),-(a7)
[0000239a] 6000 dd16                 bra        indirect
PDLG_CLOSE:
[0000239e] 2f3c 0000 022c            move.l     #$0000022C,-(a7)
[000023a4] 2f3a dcf2                 move.l     funcAes(pc),-(a7)
[000023a8] 6000 dd08                 bra        indirect
PDLG_CREATE:
[000023ac] 2f3c 0000 0230            move.l     #$00000230,-(a7)
[000023b2] 2f3a dce4                 move.l     funcAes(pc),-(a7)
[000023b6] 6000 dcfa                 bra        indirect
PDLG_DELETE:
[000023ba] 2f3c 0000 0234            move.l     #$00000234,-(a7)
[000023c0] 2f3a dcd6                 move.l     funcAes(pc),-(a7)
[000023c4] 6000 dcec                 bra        indirect
PDLG_DFLT_SETTINGS:
[000023c8] 2f3c 0000 0238            move.l     #$00000238,-(a7)
[000023ce] 2f3a dcc8                 move.l     funcAes(pc),-(a7)
[000023d2] 6000 dcde                 bra        indirect
pdlg_do:
[000023d6] 2f3c 0000 023c            move.l     #$0000023C,-(a7)
[000023dc] 2f3a dcba                 move.l     funcAes(pc),-(a7)
[000023e0] 6000 dcd0                 bra        indirect
pdlg_evnt:
[000023e4] 2f3c 0000 0240            move.l     #$00000240,-(a7)
[000023ea] 2f3a dcac                 move.l     funcAes(pc),-(a7)
[000023ee] 6000 dcc2                 bra        indirect
pdlg_free_settings:
[000023f2] 2f3c 0000 0244            move.l     #$00000244,-(a7)
[000023f8] 2f3a dc9e                 move.l     funcAes(pc),-(a7)
[000023fc] 6000 dcb4                 bra        indirect
pdlg_get_setsize:
[00002400] 2f3c 0000 0248            move.l     #$00000248,-(a7)
[00002406] 2f3a dc90                 move.l     funcAes(pc),-(a7)
[0000240a] 6000 dca6                 bra        indirect
pdlg_new_settings:
[0000240e] 2f3c 0000 024c            move.l     #$0000024C,-(a7)
[00002414] 2f3a dc82                 move.l     funcAes(pc),-(a7)
[00002418] 6000 dc98                 bra        indirect
pdlg_open:
[0000241c] 2f3c 0000 0250            move.l     #$00000250,-(a7)
[00002422] 2f3a dc74                 move.l     funcAes(pc),-(a7)
[00002426] 6000 dc8a                 bra        indirect
pdlg_remove_printers:
[0000242a] 2f3c 0000 0254            move.l     #$00000254,-(a7)
[00002430] 2f3a dc66                 move.l     funcAes(pc),-(a7)
[00002434] 6000 dc7c                 bra        indirect
pdlg_remove_sub_dialogs:
[00002438] 2f3c 0000 0258            move.l     #$00000258,-(a7)
[0000243e] 2f3a dc58                 move.l     funcAes(pc),-(a7)
[00002442] 6000 dc6e                 bra        indirect
PDLG_UPDATE:
[00002446] 2f3c 0000 025c            move.l     #$0000025C,-(a7)
[0000244c] 2f3a dc4a                 move.l     funcAes(pc),-(a7)
[00002450] 6000 dc60                 bra        indirect
PDLG_USE_SETTINGS:
[00002454] 2f3c 0000 0260            move.l     #$00000260,-(a7)
[0000245a] 2f3a dc3c                 move.l     funcAes(pc),-(a7)
[0000245e] 6000 dc52                 bra        indirect
PDLG_VALIDATE_SETTINGS:
[00002462] 2f3c 0000 0264            move.l     #$00000264,-(a7)
[00002468] 2f3a dc2e                 move.l     funcAes(pc),-(a7)
[0000246c] 6000 dc44                 bra        indirect
edit_create:
[00002470] 2f3c 0000 0268            move.l     #$00000268,-(a7)
[00002476] 2f3a dc20                 move.l     funcAes(pc),-(a7)
[0000247a] 6000 dc36                 bra        indirect
edit_set_buf:
[0000247e] 2f3c 0000 026c            move.l     #$0000026C,-(a7)
[00002484] 2f3a dc12                 move.l     funcAes(pc),-(a7)
[00002488] 6000 dc28                 bra        indirect
edit_open:
[0000248c] 2f3c 0000 0270            move.l     #$00000270,-(a7)
[00002492] 2f3a dc04                 move.l     funcAes(pc),-(a7)
[00002496] 6000 dc1a                 bra        indirect
edit_close:
[0000249a] 2f3c 0000 0274            move.l     #$00000274,-(a7)
[000024a0] 2f3a dbf6                 move.l     funcAes(pc),-(a7)
[000024a4] 6000 dc0c                 bra        indirect
EDIT_DELETE:
[000024a8] 2f3c 0000 0278            move.l     #$00000278,-(a7)
[000024ae] 2f3a dbe8                 move.l     funcAes(pc),-(a7)
[000024b2] 6000 dbfe                 bra        indirect
EDIT_CURSOR:
[000024b6] 2f3c 0000 027c            move.l     #$0000027C,-(a7)
[000024bc] 2f3a dbda                 move.l     funcAes(pc),-(a7)
[000024c0] 6000 dbf0                 bra        indirect
EDIT_EVNT:
[000024c4] 2f3c 0000 0280            move.l     #$00000280,-(a7)
[000024ca] 2f3a dbcc                 move.l     funcAes(pc),-(a7)
[000024ce] 6000 dbe2                 bra        indirect
EDIT_GET_BUF:
[000024d2] 2f3c 0000 0284            move.l     #$00000284,-(a7)
[000024d8] 2f3a dbbe                 move.l     funcAes(pc),-(a7)
[000024dc] 6000 dbd4                 bra        indirect
EDIT_GET_FORMAT:
[000024e0] 2f3c 0000 0288            move.l     #$00000288,-(a7)
[000024e6] 2f3a dbb0                 move.l     funcAes(pc),-(a7)
[000024ea] 6000 dbc6                 bra        indirect
EDIT_GET_COLOUR:
[000024ee] 2f3c 0000 028c            move.l     #$0000028C,-(a7)
[000024f4] 2f3a dba2                 move.l     funcAes(pc),-(a7)
[000024f8] 6000 dbb8                 bra        indirect
EDIT_GET_COLOR:
[000024fc] 2f3c 0000 0290            move.l     #$00000290,-(a7)
[00002502] 2f3a db94                 move.l     funcAes(pc),-(a7)
[00002506] 6000 dbaa                 bra        indirect
EDIT_GET_FONT:
[0000250a] 2f3c 0000 0294            move.l     #$00000294,-(a7)
[00002510] 2f3a db86                 move.l     funcAes(pc),-(a7)
[00002514] 6000 db9c                 bra        indirect
EDIT_GET_CURSOR:
[00002518] 2f3c 0000 0298            move.l     #$00000298,-(a7)
[0000251e] 2f3a db78                 move.l     funcAes(pc),-(a7)
[00002522] 6000 db8e                 bra        indirect
EDIT_GET_DIRTY:
[00002526] 2f3c 0000 029c            move.l     #$0000029C,-(a7)
[0000252c] 2f3a db6a                 move.l     funcAes(pc),-(a7)
[00002530] 6000 db80                 bra        indirect
EDIT_GET_SEL:
[00002534] 2f3c 0000 02a0            move.l     #$000002A0,-(a7)
[0000253a] 2f3a db5c                 move.l     funcAes(pc),-(a7)
[0000253e] 6000 db72                 bra        indirect
EDIT_GET_SCROLLINFO:
[00002542] 2f3c 0000 02a4            move.l     #$000002A4,-(a7)
[00002548] 2f3a db4e                 move.l     funcAes(pc),-(a7)
[0000254c] 6000 db64                 bra        indirect
EDIT_SET_FORMAT:
[00002550] 2f3c 0000 02a8            move.l     #$000002A8,-(a7)
[00002556] 2f3a db40                 move.l     funcAes(pc),-(a7)
[0000255a] 6000 db56                 bra        indirect
EDIT_SET_COLOUR:
[0000255e] 2f3c 0000 02ac            move.l     #$000002AC,-(a7)
[00002564] 2f3a db32                 move.l     funcAes(pc),-(a7)
[00002568] 6000 db48                 bra        indirect
EDIT_SET_COLOR:
[0000256c] 2f3c 0000 02b0            move.l     #$000002B0,-(a7)
[00002572] 2f3a db24                 move.l     funcAes(pc),-(a7)
[00002576] 6000 db3a                 bra        indirect
EDIT_SET_FONT:
[0000257a] 2f3c 0000 02b4            move.l     #$000002B4,-(a7)
[00002580] 2f3a db16                 move.l     funcAes(pc),-(a7)
[00002584] 6000 db2c                 bra        indirect
edit_set_cursor:
[00002588] 2f3c 0000 02b8            move.l     #$000002B8,-(a7)
[0000258e] 2f3a db08                 move.l     funcAes(pc),-(a7)
[00002592] 6000 db1e                 bra        indirect
edit_resized:
[00002596] 2f3c 0000 02bc            move.l     #$000002BC,-(a7)
[0000259c] 2f3a dafa                 move.l     funcAes(pc),-(a7)
[000025a0] 6000 db10                 bra        indirect
edit_set_dirty:
[000025a4] 2f3c 0000 02c0            move.l     #$000002C0,-(a7)
[000025aa] 2f3a daec                 move.l     funcAes(pc),-(a7)
[000025ae] 6000 db02                 bra        indirect
edit_scroll:
[000025b2] 2f3c 0000 02c4            move.l     #$000002C4,-(a7)
[000025b8] 2f3a dade                 move.l     funcAes(pc),-(a7)
[000025bc] 6000 daf4                 bra        indirect
EvntMulti:
[000025c0] 2f3c 0000 02c8            move.l     #$000002C8,-(a7)
[000025c6] 2f3a dad0                 move.l     funcAes(pc),-(a7)
[000025ca] 6000 dae6                 bra        indirect
FORM_WBUTTON:
[000025ce] 2f3c 0000 02cc            move.l     #$000002CC,-(a7)
[000025d4] 2f3a dac2                 move.l     funcAes(pc),-(a7)
[000025d8] 6000 dad8                 bra        indirect
FORM_XDIAL:
[000025dc] 2f3c 0000 02d0            move.l     #$000002D0,-(a7)
[000025e2] 2f3a dab4                 move.l     funcAes(pc),-(a7)
[000025e6] 6000 daca                 bra        indirect
form_xdo:
[000025ea] 2f3c 0000 02d4            move.l     #$000002D4,-(a7)
[000025f0] 2f3a daa6                 move.l     funcAes(pc),-(a7)
[000025f4] 6000 dabc                 bra        indirect
form_xerr:
[000025f8] 2f3c 0000 02d8            move.l     #$000002D8,-(a7)
[000025fe] 2f3a da98                 move.l     funcAes(pc),-(a7)
[00002602] 6000 daae                 bra        indirect
_CRYSTAL:
[00002606] 2f3c 0000 02dc            move.l     #$000002DC,-(a7)
[0000260c] 2f3a da8a                 move.l     funcAes(pc),-(a7)
[00002610] 6000 daa0                 bra        indirect
GRAF_WWATCHBOX:
[00002614] 2f3c 0000 02e0            move.l     #$000002E0,-(a7)
[0000261a] 2f3a da7c                 move.l     funcAes(pc),-(a7)
[0000261e] 6000 da92                 bra        indirect
GRAF_XHANDLE:
[00002622] 2f3c 0000 02e4            move.l     #$000002E4,-(a7)
[00002628] 2f3a da6e                 move.l     funcAes(pc),-(a7)
[0000262c] 6000 da84                 bra        indirect
wdlg_create:
[00002630] 2f3c 0000 02e8            move.l     #$000002E8,-(a7)
[00002636] 2f3a da60                 move.l     funcAes(pc),-(a7)
[0000263a] 6000 da76                 bra        indirect
wdlg_open:
[0000263e] 2f3c 0000 02ec            move.l     #$000002EC,-(a7)
[00002644] 2f3a da52                 move.l     funcAes(pc),-(a7)
[00002648] 6000 da68                 bra        indirect
wdlg_close:
[0000264c] 2f3c 0000 02f0            move.l     #$000002F0,-(a7)
[00002652] 2f3a da44                 move.l     funcAes(pc),-(a7)
[00002656] 6000 da5a                 bra        indirect
WDLG_DELETE:
[0000265a] 2f3c 0000 02f4            move.l     #$000002F4,-(a7)
[00002660] 2f3a da36                 move.l     funcAes(pc),-(a7)
[00002664] 6000 da4c                 bra        indirect
WDLG_GET_TREE:
[00002668] 2f3c 0000 02f8            move.l     #$000002F8,-(a7)
[0000266e] 2f3a da28                 move.l     funcAes(pc),-(a7)
[00002672] 6000 da3e                 bra        indirect
WDLG_GET_EDIT:
[00002676] 2f3c 0000 02fc            move.l     #$000002FC,-(a7)
[0000267c] 2f3a da1a                 move.l     funcAes(pc),-(a7)
[00002680] 6000 da30                 bra        indirect
WDLG_GET_UDATA:
[00002684] 2f3c 0000 0300            move.l     #$00000300,-(a7)
[0000268a] 2f3a da0c                 move.l     funcAes(pc),-(a7)
[0000268e] 6000 da22                 bra        indirect
WDLG_GET_HANDLE:
[00002692] 2f3c 0000 0304            move.l     #$00000304,-(a7)
[00002698] 2f3a d9fe                 move.l     funcAes(pc),-(a7)
[0000269c] 6000 da14                 bra        indirect
WDLG_SET_EDIT:
[000026a0] 2f3c 0000 0308            move.l     #$00000308,-(a7)
[000026a6] 2f3a d9f0                 move.l     funcAes(pc),-(a7)
[000026aa] 6000 da06                 bra        indirect
WDLG_SET_TREE:
[000026ae] 2f3c 0000 030c            move.l     #$0000030C,-(a7)
[000026b4] 2f3a d9e2                 move.l     funcAes(pc),-(a7)
[000026b8] 6000 d9f8                 bra        indirect
WDLG_SET_SIZE:
[000026bc] 2f3c 0000 0310            move.l     #$00000310,-(a7)
[000026c2] 2f3a d9d4                 move.l     funcAes(pc),-(a7)
[000026c6] 6000 d9ea                 bra        indirect
WDLG_SET_ICONIFY:
[000026ca] 2f3c 0000 0314            move.l     #$00000314,-(a7)
[000026d0] 2f3a d9c6                 move.l     funcAes(pc),-(a7)
[000026d4] 6000 d9dc                 bra        indirect
WDLG_SET_UNICONIFY:
[000026d8] 2f3c 0000 0318            move.l     #$00000318,-(a7)
[000026de] 2f3a d9b8                 move.l     funcAes(pc),-(a7)
[000026e2] 6000 d9ce                 bra        indirect
WDLG_EVNT:
[000026e6] 2f3c 0000 031c            move.l     #$0000031C,-(a7)
[000026ec] 2f3a d9aa                 move.l     funcAes(pc),-(a7)
[000026f0] 6000 d9c0                 bra        indirect
WDLG_REDRAW:
[000026f4] 2f3c 0000 0320            move.l     #$00000320,-(a7)
[000026fa] 2f3a d99c                 move.l     funcAes(pc),-(a7)
[000026fe] 6000 d9b2                 bra        indirect
WIND_DRAW:
[00002702] 2f3c 0000 0324            move.l     #$00000324,-(a7)
[00002708] 2f3a d98e                 move.l     funcAes(pc),-(a7)
[0000270c] 6000 d9a4                 bra        indirect
SRCP_CLEAR:
[00002710] 2f3c 0000 0328            move.l     #$00000328,-(a7)
[00002716] 2f3a d980                 move.l     funcAes(pc),-(a7)
[0000271a] 6000 d996                 bra        indirect
OBJC_XEDIT:
[0000271e] 2f3c 0000 032c            move.l     #$0000032C,-(a7)
[00002724] 2f3a d972                 move.l     funcAes(pc),-(a7)
[00002728] 6000 d988                 bra        indirect
GRAF_RUBBBOX:
[0000272c] 2f3c 0000 0330            move.l     #$00000330,-(a7)
[00002732] 2f3a d964                 move.l     funcAes(pc),-(a7)
[00002736] 6000 d97a                 bra        indirect
AKT_GETKEYTAB:
[0000273a] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00002740] 2f3a d95c                 move.l     funcKeytab(pc),-(a7)
[00002744] 6000 d96c                 bra        indirect
AKT_GETRELEASE:
[00002748] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[0000274e] 2f3a d94e                 move.l     funcKeytab(pc),-(a7)
[00002752] 6000 d95e                 bra        indirect
AKT_GETEURO:
[00002756] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[0000275c] 2f3a d940                 move.l     funcKeytab(pc),-(a7)
[00002760] 6000 d950                 bra        indirect
AKT_GETEXPMAXNR:
[00002764] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[0000276a] 2f3a d932                 move.l     funcKeytab(pc),-(a7)
[0000276e] 6000 d942                 bra        indirect
AKT_GETIMPMAXNR:
[00002772] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[00002778] 2f3a d924                 move.l     funcKeytab(pc),-(a7)
[0000277c] 6000 d934                 bra        indirect
AKT_GETEXPNAMEFROMNR:
[00002780] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[00002786] 2f3a d916                 move.l     funcKeytab(pc),-(a7)
[0000278a] 6000 d926                 bra        indirect
AKT_GETIMPNAMEFROMNR:
[0000278e] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[00002794] 2f3a d908                 move.l     funcKeytab(pc),-(a7)
[00002798] 6000 d918                 bra        indirect
Akt_getExpShortNameFromNr:
[0000279c] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[000027a2] 2f3a d8fa                 move.l     funcKeytab(pc),-(a7)
[000027a6] 6000 d90a                 bra        indirect
Akt_getImpShortNameFromNr:
[000027aa] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[000027b0] 2f3a d8ec                 move.l     funcKeytab(pc),-(a7)
[000027b4] 6000 d8fc                 bra        indirect
Akt_getExpNrFromId:
[000027b8] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[000027be] 2f3a d8de                 move.l     funcKeytab(pc),-(a7)
[000027c2] 6000 d8ee                 bra        indirect
Akt_getImpNrFromId:
[000027c6] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[000027cc] 2f3a d8d0                 move.l     funcKeytab(pc),-(a7)
[000027d0] 6000 d8e0                 bra        indirect
Akt_getExpIdFromNr:
[000027d4] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[000027da] 2f3a d8c2                 move.l     funcKeytab(pc),-(a7)
[000027de] 6000 d8d2                 bra        indirect
Akt_getImpIdFromNr:
[000027e2] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[000027e8] 2f3a d8b4                 move.l     funcKeytab(pc),-(a7)
[000027ec] 6000 d8c4                 bra        indirect
Akt_getExpNrFromName:
[000027f0] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[000027f6] 2f3a d8a6                 move.l     funcKeytab(pc),-(a7)
[000027fa] 6000 d8b6                 bra        indirect
AKT_GETIMPNRFROMNAME:
[000027fe] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[00002804] 2f3a d898                 move.l     funcKeytab(pc),-(a7)
[00002808] 6000 d8a8                 bra        indirect
AKT_CHARATARI2X:
[0000280c] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[00002812] 2f3a d88a                 move.l     funcKeytab(pc),-(a7)
[00002816] 6000 d89a                 bra        indirect
AKT_CHARX2ATARI:
[0000281a] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[00002820] 2f3a d87c                 move.l     funcKeytab(pc),-(a7)
[00002824] 6000 d88c                 bra        indirect
AKT_BLOCKATARI2X:
[00002828] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[0000282e] 2f3a d86e                 move.l     funcKeytab(pc),-(a7)
[00002832] 6000 d87e                 bra        indirect
AKT_BLOCKX2ATARI:
[00002836] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[0000283c] 2f3a d860                 move.l     funcKeytab(pc),-(a7)
[00002840] 6000 d870                 bra        indirect
AKT_STRINGATARI2X:
[00002844] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[0000284a] 2f3a d852                 move.l     funcKeytab(pc),-(a7)
[0000284e] 6000 d862                 bra        indirect
AKT_STRINGX2ATARI:
[00002852] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[00002858] 2f3a d844                 move.l     funcKeytab(pc),-(a7)
[0000285c] 6000 d854                 bra        indirect
AKT_CHARX2UNICODE:
[00002860] 2f3c 0000 0054            move.l     #$00000054,-(a7)
[00002866] 2f3a d836                 move.l     funcKeytab(pc),-(a7)
[0000286a] 6000 d846                 bra        indirect
AKT_CHARUNICODE2X:
[0000286e] 2f3c 0000 0058            move.l     #$00000058,-(a7)
[00002874] 2f3a d828                 move.l     funcKeytab(pc),-(a7)
[00002878] 6000 d838                 bra        indirect
AKT_BLOCKX2UNICODE:
[0000287c] 2f3c 0000 005c            move.l     #$0000005C,-(a7)
[00002882] 2f3a d81a                 move.l     funcKeytab(pc),-(a7)
[00002886] 6000 d82a                 bra        indirect
AKT_BLOCKUNICODE2X:
[0000288a] 2f3c 0000 0060            move.l     #$00000060,-(a7)
[00002890] 2f3a d80c                 move.l     funcKeytab(pc),-(a7)
[00002894] 6000 d81c                 bra        indirect
AKT_STRINGX2UNICODE:
[00002898] 2f3c 0000 0064            move.l     #$00000064,-(a7)
[0000289e] 2f3a d7fe                 move.l     funcKeytab(pc),-(a7)
[000028a2] 6000 d80e                 bra        indirect
AKT_POPEXPNAME:
[000028a6] 2f3c 0000 0068            move.l     #$00000068,-(a7)
[000028ac] 2f3a d7f0                 move.l     funcKeytab(pc),-(a7)
[000028b0] 6000 d800                 bra        indirect
AKT_POPIMPNAME:
[000028b4] 2f3c 0000 006c            move.l     #$0000006C,-(a7)
[000028ba] 2f3a d7e2                 move.l     funcKeytab(pc),-(a7)
[000028be] 6000 d7f2                 bra        indirect
AKT_CHOOSEEXPNR:
[000028c2] 2f3c 0000 0070            move.l     #$00000070,-(a7)
[000028c8] 2f3a d7d4                 move.l     funcKeytab(pc),-(a7)
[000028cc] 6000 d7e4                 bra        indirect
AKT_CHOOSEIMPNR:
[000028d0] 2f3c 0000 0074            move.l     #$00000074,-(a7)
[000028d6] 2f3a d7c6                 move.l     funcKeytab(pc),-(a7)
[000028da] 6000 d7d6                 bra        indirect
Akt_getExpMinNr:
[000028de] 2f3c 0000 0078            move.l     #$00000078,-(a7)
[000028e4] 2f3a d7b8                 move.l     funcKeytab(pc),-(a7)
[000028e8] 6000 d7c8                 bra        indirect
Akt_getImpMinNr:
[000028ec] 2f3c 0000 007c            move.l     #$0000007C,-(a7)
[000028f2] 2f3a d7aa                 move.l     funcKeytab(pc),-(a7)
[000028f6] 6000 d7ba                 bra        indirect
Akt_BlockXUtf2Unicode:
[000028fa] 2f3c 0000 0080            move.l     #$00000080,-(a7)
[00002900] 2f3a d79c                 move.l     funcKeytab(pc),-(a7)
[00002904] 6000 d7ac                 bra        indirect
Akt_BlockUnicode2XUtf:
[00002908] 2f3c 0000 0084            move.l     #$00000084,-(a7)
[0000290e] 2f3a d78e                 move.l     funcKeytab(pc),-(a7)
[00002912] 6000 d79e                 bra        indirect
Akt_StringXUtf2Unicode:
[00002916] 2f3c 0000 0088            move.l     #$00000088,-(a7)
[0000291c] 2f3a d780                 move.l     funcKeytab(pc),-(a7)
[00002920] 6000 d790                 bra        indirect
Akt_BlockXUtf2U2XUtf:
[00002924] 2f3c 0000 008c            move.l     #$0000008C,-(a7)
[0000292a] 2f3a d772                 move.l     funcKeytab(pc),-(a7)
[0000292e] 6000 d782                 bra        indirect
Akt_BlockXUtf2XUtf:
[00002932] 2f3c 0000 0090            move.l     #$00000090,-(a7)
[00002938] 2f3a d764                 move.l     funcKeytab(pc),-(a7)
[0000293c] 6000 d774                 bra        indirect
AKT_STRINGXUTF2U2XUTF:
[00002940] 2f3c 0000 0094            move.l     #$00000094,-(a7)
[00002946] 2f3a d756                 move.l     funcKeytab(pc),-(a7)
[0000294a] 6000 d766                 bra        indirect
AKT_STRINGXUTF2XUTF:
[0000294e] 2f3c 0000 0098            move.l     #$00000098,-(a7)
[00002954] 2f3a d748                 move.l     funcKeytab(pc),-(a7)
[00002958] 6000 d758                 bra        indirect
mt_appl_init:
[0000295c] 2f3c 0000 0000            move.l     #$00000000,-(a7)
[00002962] 2f3a d740                 move.l     funcMtAes(pc),-(a7)
[00002966] 6000 d74a                 bra        indirect
mt_appl_read:
[0000296a] 2f3c 0000 0004            move.l     #$00000004,-(a7)
[00002970] 2f3a d732                 move.l     funcMtAes(pc),-(a7)
[00002974] 6000 d73c                 bra        indirect
mt_appl_write:
[00002978] 2f3c 0000 0008            move.l     #$00000008,-(a7)
[0000297e] 2f3a d724                 move.l     funcMtAes(pc),-(a7)
[00002982] 6000 d72e                 bra        indirect
mt_appl_find:
[00002986] 2f3c 0000 000c            move.l     #$0000000C,-(a7)
[0000298c] 2f3a d716                 move.l     funcMtAes(pc),-(a7)
[00002990] 6000 d720                 bra        indirect
mt_appl_search:
[00002994] 2f3c 0000 0010            move.l     #$00000010,-(a7)
[0000299a] 2f3a d708                 move.l     funcMtAes(pc),-(a7)
[0000299e] 6000 d712                 bra        indirect
mt_appl_tplay:
[000029a2] 2f3c 0000 0014            move.l     #$00000014,-(a7)
[000029a8] 2f3a d6fa                 move.l     funcMtAes(pc),-(a7)
[000029ac] 6000 d704                 bra        indirect
MT_APPL_TRECORD:
[000029b0] 2f3c 0000 0018            move.l     #$00000018,-(a7)
[000029b6] 2f3a d6ec                 move.l     funcMtAes(pc),-(a7)
[000029ba] 6000 d6f6                 bra        indirect
MT_APPL_YIELD:
[000029be] 2f3c 0000 001c            move.l     #$0000001C,-(a7)
[000029c4] 2f3a d6de                 move.l     funcMtAes(pc),-(a7)
[000029c8] 6000 d6e8                 bra        indirect
MT_APPL_EXIT:
[000029cc] 2f3c 0000 0020            move.l     #$00000020,-(a7)
[000029d2] 2f3a d6d0                 move.l     funcMtAes(pc),-(a7)
[000029d6] 6000 d6da                 bra        indirect
MT_APPL_GETINFO:
[000029da] 2f3c 0000 0024            move.l     #$00000024,-(a7)
[000029e0] 2f3a d6c2                 move.l     funcMtAes(pc),-(a7)
[000029e4] 6000 d6cc                 bra        indirect
MT_APPL_CONTROL:
[000029e8] 2f3c 0000 0028            move.l     #$00000028,-(a7)
[000029ee] 2f3a d6b4                 move.l     funcMtAes(pc),-(a7)
[000029f2] 6000 d6be                 bra        indirect
MT_EVNT_KEYBD:
[000029f6] 2f3c 0000 0334            move.l     #$00000334,-(a7)
[000029fc] 2f3a d69a                 move.l     funcAes(pc),-(a7)
[00002a00] 6000 d6b0                 bra        indirect
MT_EVNT_BUTTON:
[00002a04] 2f3c 0000 002c            move.l     #$0000002C,-(a7)
[00002a0a] 2f3a d698                 move.l     funcMtAes(pc),-(a7)
[00002a0e] 6000 d6a2                 bra        indirect
MT_EVNT_MOUSE:
[00002a12] 2f3c 0000 0030            move.l     #$00000030,-(a7)
[00002a18] 2f3a d68a                 move.l     funcMtAes(pc),-(a7)
[00002a1c] 6000 d694                 bra        indirect
MT_EVNT_MESAG:
[00002a20] 2f3c 0000 0034            move.l     #$00000034,-(a7)
[00002a26] 2f3a d67c                 move.l     funcMtAes(pc),-(a7)
[00002a2a] 6000 d686                 bra        indirect
MT_EVNT_TIMER:
[00002a2e] 2f3c 0000 0038            move.l     #$00000038,-(a7)
[00002a34] 2f3a d66e                 move.l     funcMtAes(pc),-(a7)
[00002a38] 6000 d678                 bra        indirect
MT_EVNT_EVENT:
[00002a3c] 2f3c 0000 003c            move.l     #$0000003C,-(a7)
[00002a42] 2f3a d660                 move.l     funcMtAes(pc),-(a7)
[00002a46] 6000 d66a                 bra        indirect
MT_EVNT_MULTI:
[00002a4a] 2f3c 0000 0040            move.l     #$00000040,-(a7)
[00002a50] 2f3a d652                 move.l     funcMtAes(pc),-(a7)
[00002a54] 6000 d65c                 bra        indirect
MT_EVNT_DCLICK:
[00002a58] 2f3c 0000 0044            move.l     #$00000044,-(a7)
[00002a5e] 2f3a d644                 move.l     funcMtAes(pc),-(a7)
[00002a62] 6000 d64e                 bra        indirect
MT_MENU_BAR:
[00002a66] 2f3c 0000 0048            move.l     #$00000048,-(a7)
[00002a6c] 2f3a d636                 move.l     funcMtAes(pc),-(a7)
[00002a70] 6000 d640                 bra        indirect
MT_MENU_ICHECK:
[00002a74] 2f3c 0000 004c            move.l     #$0000004C,-(a7)
[00002a7a] 2f3a d628                 move.l     funcMtAes(pc),-(a7)
[00002a7e] 6000 d632                 bra        indirect
mt_menu_ienable:
[00002a82] 2f3c 0000 0050            move.l     #$00000050,-(a7)
[00002a88] 2f3a d61a                 move.l     funcMtAes(pc),-(a7)
[00002a8c] 6000 d624                 bra        indirect
mt_menu_tnormal:
[00002a90] 2f3c 0000 0054            move.l     #$00000054,-(a7)
[00002a96] 2f3a d60c                 move.l     funcMtAes(pc),-(a7)
[00002a9a] 6000 d616                 bra        indirect
mt_menu_text:
[00002a9e] 2f3c 0000 0058            move.l     #$00000058,-(a7)
[00002aa4] 2f3a d5fe                 move.l     funcMtAes(pc),-(a7)
[00002aa8] 6000 d608                 bra        indirect
mt_menu_register:
[00002aac] 2f3c 0000 005c            move.l     #$0000005C,-(a7)
[00002ab2] 2f3a d5f0                 move.l     funcMtAes(pc),-(a7)
[00002ab6] 6000 d5fa                 bra        indirect
mt_menu_unregister:
[00002aba] 2f3c 0000 0060            move.l     #$00000060,-(a7)
[00002ac0] 2f3a d5e2                 move.l     funcMtAes(pc),-(a7)
[00002ac4] 6000 d5ec                 bra        indirect
mt_menu_click:
[00002ac8] 2f3c 0000 0064            move.l     #$00000064,-(a7)
[00002ace] 2f3a d5d4                 move.l     funcMtAes(pc),-(a7)
[00002ad2] 6000 d5de                 bra        indirect
mt_menu_attach:
[00002ad6] 2f3c 0000 0068            move.l     #$00000068,-(a7)
[00002adc] 2f3a d5c6                 move.l     funcMtAes(pc),-(a7)
[00002ae0] 6000 d5d0                 bra        indirect
mt_menu_istart:
[00002ae4] 2f3c 0000 006c            move.l     #$0000006C,-(a7)
[00002aea] 2f3a d5b8                 move.l     funcMtAes(pc),-(a7)
[00002aee] 6000 d5c2                 bra        indirect
MT_MENU_POPUP:
[00002af2] 2f3c 0000 0070            move.l     #$00000070,-(a7)
[00002af8] 2f3a d5aa                 move.l     funcMtAes(pc),-(a7)
[00002afc] 6000 d5b4                 bra        indirect
MT_MENU_SETTINGS:
[00002b00] 2f3c 0000 0074            move.l     #$00000074,-(a7)
[00002b06] 2f3a d59c                 move.l     funcMtAes(pc),-(a7)
[00002b0a] 6000 d5a6                 bra        indirect
MT_OBJC_ADD:
[00002b0e] 2f3c 0000 0078            move.l     #$00000078,-(a7)
[00002b14] 2f3a d58e                 move.l     funcMtAes(pc),-(a7)
[00002b18] 6000 d598                 bra        indirect
MT_OBJC_DELETE:
[00002b1c] 2f3c 0000 007c            move.l     #$0000007C,-(a7)
[00002b22] 2f3a d580                 move.l     funcMtAes(pc),-(a7)
[00002b26] 6000 d58a                 bra        indirect
MT_OBJC_DRAW:
[00002b2a] 2f3c 0000 0338            move.l     #$00000338,-(a7)
[00002b30] 2f3a d566                 move.l     funcAes(pc),-(a7)
[00002b34] 6000 d57c                 bra        indirect
MT_OBJC_FIND:
[00002b38] 2f3c 0000 0080            move.l     #$00000080,-(a7)
[00002b3e] 2f3a d564                 move.l     funcMtAes(pc),-(a7)
[00002b42] 6000 d56e                 bra        indirect
MT_OBJC_OFFSET:
[00002b46] 2f3c 0000 0084            move.l     #$00000084,-(a7)
[00002b4c] 2f3a d556                 move.l     funcMtAes(pc),-(a7)
[00002b50] 6000 d560                 bra        indirect
mt_objc_order:
[00002b54] 2f3c 0000 0088            move.l     #$00000088,-(a7)
[00002b5a] 2f3a d548                 move.l     funcMtAes(pc),-(a7)
[00002b5e] 6000 d552                 bra        indirect
mt_objc_edit:
[00002b62] 2f3c 0000 008c            move.l     #$0000008C,-(a7)
[00002b68] 2f3a d53a                 move.l     funcMtAes(pc),-(a7)
[00002b6c] 6000 d544                 bra        indirect
mt_objc_change:
[00002b70] 2f3c 0000 0090            move.l     #$00000090,-(a7)
[00002b76] 2f3a d52c                 move.l     funcMtAes(pc),-(a7)
[00002b7a] 6000 d536                 bra        indirect
mt_objc_sysvar:
[00002b7e] 2f3c 0000 0094            move.l     #$00000094,-(a7)
[00002b84] 2f3a d51e                 move.l     funcMtAes(pc),-(a7)
[00002b88] 6000 d528                 bra        indirect
mt_form_do:
[00002b8c] 2f3c 0000 0098            move.l     #$00000098,-(a7)
[00002b92] 2f3a d510                 move.l     funcMtAes(pc),-(a7)
[00002b96] 6000 d51a                 bra        indirect
mt_form_dial:
[00002b9a] 2f3c 0000 009c            move.l     #$0000009C,-(a7)
[00002ba0] 2f3a d502                 move.l     funcMtAes(pc),-(a7)
[00002ba4] 6000 d50c                 bra        indirect
mt_form_alert:
[00002ba8] 2f3c 0000 00a0            move.l     #$000000A0,-(a7)
[00002bae] 2f3a d4f4                 move.l     funcMtAes(pc),-(a7)
[00002bb2] 6000 d4fe                 bra        indirect
mt_form_error:
[00002bb6] 2f3c 0000 00a4            move.l     #$000000A4,-(a7)
[00002bbc] 2f3a d4e6                 move.l     funcMtAes(pc),-(a7)
[00002bc0] 6000 d4f0                 bra        indirect
mt_form_center:
[00002bc4] 2f3c 0000 00a8            move.l     #$000000A8,-(a7)
[00002bca] 2f3a d4d8                 move.l     funcMtAes(pc),-(a7)
[00002bce] 6000 d4e2                 bra        indirect
mt_form_keybd:
[00002bd2] 2f3c 0000 00ac            move.l     #$000000AC,-(a7)
[00002bd8] 2f3a d4ca                 move.l     funcMtAes(pc),-(a7)
[00002bdc] 6000 d4d4                 bra        indirect
mt_form_button:
[00002be0] 2f3c 0000 00b0            move.l     #$000000B0,-(a7)
[00002be6] 2f3a d4bc                 move.l     funcMtAes(pc),-(a7)
[00002bea] 6000 d4c6                 bra        indirect
mt_graf_rubbox:
[00002bee] 2f3c 0000 00b4            move.l     #$000000B4,-(a7)
[00002bf4] 2f3a d4ae                 move.l     funcMtAes(pc),-(a7)
[00002bf8] 6000 d4b8                 bra        indirect
mt_graf_rubberbox:
[00002bfc] 2f3c 0000 00b8            move.l     #$000000B8,-(a7)
[00002c02] 2f3a d4a0                 move.l     funcMtAes(pc),-(a7)
[00002c06] 6000 d4aa                 bra        indirect
mt_graf_dragbox:
[00002c0a] 2f3c 0000 00bc            move.l     #$000000BC,-(a7)
[00002c10] 2f3a d492                 move.l     funcMtAes(pc),-(a7)
[00002c14] 6000 d49c                 bra        indirect
mt_graf_mbox:
[00002c18] 2f3c 0000 00c0            move.l     #$000000C0,-(a7)
[00002c1e] 2f3a d484                 move.l     funcMtAes(pc),-(a7)
[00002c22] 6000 d48e                 bra        indirect
mt_graf_movebox:
[00002c26] 2f3c 0000 00c4            move.l     #$000000C4,-(a7)
[00002c2c] 2f3a d476                 move.l     funcMtAes(pc),-(a7)
[00002c30] 6000 d480                 bra        indirect
MT_GRAF_GROWBOX:
[00002c34] 2f3c 0000 00c8            move.l     #$000000C8,-(a7)
[00002c3a] 2f3a d468                 move.l     funcMtAes(pc),-(a7)
[00002c3e] 6000 d472                 bra        indirect
MT_GRAF_SHRINKBOX:
[00002c42] 2f3c 0000 00cc            move.l     #$000000CC,-(a7)
[00002c48] 2f3a d45a                 move.l     funcMtAes(pc),-(a7)
[00002c4c] 6000 d464                 bra        indirect
MT_GRAF_WATCHBOX:
[00002c50] 2f3c 0000 00d0            move.l     #$000000D0,-(a7)
[00002c56] 2f3a d44c                 move.l     funcMtAes(pc),-(a7)
[00002c5a] 6000 d456                 bra        indirect
MT_GRAF_SLIDEBOX:
[00002c5e] 2f3c 0000 00d4            move.l     #$000000D4,-(a7)
[00002c64] 2f3a d43e                 move.l     funcMtAes(pc),-(a7)
[00002c68] 6000 d448                 bra        indirect
MT_GRAF_HANDLE:
[00002c6c] 2f3c 0000 00d8            move.l     #$000000D8,-(a7)
[00002c72] 2f3a d430                 move.l     funcMtAes(pc),-(a7)
[00002c76] 6000 d43a                 bra        indirect
MT_GRAF_MOUSE:
[00002c7a] 2f3c 0000 00dc            move.l     #$000000DC,-(a7)
[00002c80] 2f3a d422                 move.l     funcMtAes(pc),-(a7)
[00002c84] 6000 d42c                 bra        indirect
MT_GRAF_MKSTATE:
[00002c88] 2f3c 0000 00e0            move.l     #$000000E0,-(a7)
[00002c8e] 2f3a d414                 move.l     funcMtAes(pc),-(a7)
[00002c92] 6000 d41e                 bra        indirect
mt_graf_multirubber:
[00002c96] 2f3c 0000 00e4            move.l     #$000000E4,-(a7)
[00002c9c] 2f3a d406                 move.l     funcMtAes(pc),-(a7)
[00002ca0] 6000 d410                 bra        indirect
mt_scrp_read:
[00002ca4] 2f3c 0000 00e8            move.l     #$000000E8,-(a7)
[00002caa] 2f3a d3f8                 move.l     funcMtAes(pc),-(a7)
[00002cae] 6000 d402                 bra        indirect
mt_scrp_write:
[00002cb2] 2f3c 0000 00ec            move.l     #$000000EC,-(a7)
[00002cb8] 2f3a d3ea                 move.l     funcMtAes(pc),-(a7)
[00002cbc] 6000 d3f4                 bra        indirect
mt_fsel_input:
[00002cc0] 2f3c 0000 00f0            move.l     #$000000F0,-(a7)
[00002cc6] 2f3a d3dc                 move.l     funcMtAes(pc),-(a7)
[00002cca] 6000 d3e6                 bra        indirect
mt_fsel_exinput:
[00002cce] 2f3c 0000 00f4            move.l     #$000000F4,-(a7)
[00002cd4] 2f3a d3ce                 move.l     funcMtAes(pc),-(a7)
[00002cd8] 6000 d3d8                 bra        indirect
mt_fsel_boxinput:
[00002cdc] 2f3c 0000 00f8            move.l     #$000000F8,-(a7)
[00002ce2] 2f3a d3c0                 move.l     funcMtAes(pc),-(a7)
[00002ce6] 6000 d3ca                 bra        indirect
mt_fslx_open:
[00002cea] 2f3c 0000 00fc            move.l     #$000000FC,-(a7)
[00002cf0] 2f3a d3b2                 move.l     funcMtAes(pc),-(a7)
[00002cf4] 6000 d3bc                 bra        indirect
mt_fslx_close:
[00002cf8] 2f3c 0000 0100            move.l     #$00000100,-(a7)
[00002cfe] 2f3a d3a4                 move.l     funcMtAes(pc),-(a7)
[00002d02] 6000 d3ae                 bra        indirect
MT_FSLX_GETNXTFILE:
[00002d06] 2f3c 0000 0104            move.l     #$00000104,-(a7)
[00002d0c] 2f3a d396                 move.l     funcMtAes(pc),-(a7)
[00002d10] 6000 d3a0                 bra        indirect
MT_FSLX_EVNT:
[00002d14] 2f3c 0000 0108            move.l     #$00000108,-(a7)
[00002d1a] 2f3a d388                 move.l     funcMtAes(pc),-(a7)
[00002d1e] 6000 d392                 bra        indirect
MT_FSLX_DO:
[00002d22] 2f3c 0000 010c            move.l     #$0000010C,-(a7)
[00002d28] 2f3a d37a                 move.l     funcMtAes(pc),-(a7)
[00002d2c] 6000 d384                 bra        indirect
MT_FSLX_SET_FLAGS:
[00002d30] 2f3c 0000 0110            move.l     #$00000110,-(a7)
[00002d36] 2f3a d36c                 move.l     funcMtAes(pc),-(a7)
[00002d3a] 6000 d376                 bra        indirect
MT_WIND_CREATE:
[00002d3e] 2f3c 0000 033c            move.l     #$0000033C,-(a7)
[00002d44] 2f3a d352                 move.l     funcAes(pc),-(a7)
[00002d48] 6000 d368                 bra        indirect
MT_WIND_OPEN:
[00002d4c] 2f3c 0000 0114            move.l     #$00000114,-(a7)
[00002d52] 2f3a d350                 move.l     funcMtAes(pc),-(a7)
[00002d56] 6000 d35a                 bra        indirect
MT_WIND_CLOSE:
[00002d5a] 2f3c 0000 0118            move.l     #$00000118,-(a7)
[00002d60] 2f3a d342                 move.l     funcMtAes(pc),-(a7)
[00002d64] 6000 d34c                 bra        indirect
MT_WIND_DELETE:
[00002d68] 2f3c 0000 011c            move.l     #$0000011C,-(a7)
[00002d6e] 2f3a d334                 move.l     funcMtAes(pc),-(a7)
[00002d72] 6000 d33e                 bra        indirect
MT_WIND_GET:
[00002d76] 2f3c 0000 0120            move.l     #$00000120,-(a7)
[00002d7c] 2f3a d326                 move.l     funcMtAes(pc),-(a7)
[00002d80] 6000 d330                 bra        indirect
MT_WIND_GETQSB:
[00002d84] 2f3c 0000 0124            move.l     #$00000124,-(a7)
[00002d8a] 2f3a d318                 move.l     funcMtAes(pc),-(a7)
[00002d8e] 6000 d322                 bra        indirect
MT_WIND_SET:
[00002d92] 2f3c 0000 0128            move.l     #$00000128,-(a7)
[00002d98] 2f3a d30a                 move.l     funcMtAes(pc),-(a7)
[00002d9c] 6000 d314                 bra        indirect
MT_WIND_FIND:
[00002da0] 2f3c 0000 012c            move.l     #$0000012C,-(a7)
[00002da6] 2f3a d2fc                 move.l     funcMtAes(pc),-(a7)
[00002daa] 6000 d306                 bra        indirect
MT_WIND_UPDATE:
[00002dae] 2f3c 0000 0130            move.l     #$00000130,-(a7)
[00002db4] 2f3a d2ee                 move.l     funcMtAes(pc),-(a7)
[00002db8] 6000 d2f8                 bra        indirect
MT_WIND_CALC:
[00002dbc] 2f3c 0000 0134            move.l     #$00000134,-(a7)
[00002dc2] 2f3a d2e0                 move.l     funcMtAes(pc),-(a7)
[00002dc6] 6000 d2ea                 bra        indirect
MT_WIND_NEW:
[00002dca] 2f3c 0000 0138            move.l     #$00000138,-(a7)
[00002dd0] 2f3a d2d2                 move.l     funcMtAes(pc),-(a7)
[00002dd4] 6000 d2dc                 bra        indirect
mt_rsrc_load:
[00002dd8] 2f3c 0000 013c            move.l     #$0000013C,-(a7)
[00002dde] 2f3a d2c4                 move.l     funcMtAes(pc),-(a7)
[00002de2] 6000 d2ce                 bra        indirect
mt_rsrc_free:
[00002de6] 2f3c 0000 0140            move.l     #$00000140,-(a7)
[00002dec] 2f3a d2b6                 move.l     funcMtAes(pc),-(a7)
[00002df0] 6000 d2c0                 bra        indirect
mt_rsrc_gaddr:
[00002df4] 2f3c 0000 0144            move.l     #$00000144,-(a7)
[00002dfa] 2f3a d2a8                 move.l     funcMtAes(pc),-(a7)
[00002dfe] 6000 d2b2                 bra        indirect
mt_rsrc_saddr:
[00002e02] 2f3c 0000 0148            move.l     #$00000148,-(a7)
[00002e08] 2f3a d29a                 move.l     funcMtAes(pc),-(a7)
[00002e0c] 6000 d2a4                 bra        indirect
mt_rsrc_obfix:
[00002e10] 2f3c 0000 014c            move.l     #$0000014C,-(a7)
[00002e16] 2f3a d28c                 move.l     funcMtAes(pc),-(a7)
[00002e1a] 6000 d296                 bra        indirect
mt_rsrc_rcfix:
[00002e1e] 2f3c 0000 0150            move.l     #$00000150,-(a7)
[00002e24] 2f3a d27e                 move.l     funcMtAes(pc),-(a7)
[00002e28] 6000 d288                 bra        indirect
mt_shel_read:
[00002e2c] 2f3c 0000 0154            move.l     #$00000154,-(a7)
[00002e32] 2f3a d270                 move.l     funcMtAes(pc),-(a7)
[00002e36] 6000 d27a                 bra        indirect
mt_shel_write:
[00002e3a] 2f3c 0000 0158            move.l     #$00000158,-(a7)
[00002e40] 2f3a d262                 move.l     funcMtAes(pc),-(a7)
[00002e44] 6000 d26c                 bra        indirect
MT_SHEL_GET:
[00002e48] 2f3c 0000 015c            move.l     #$0000015C,-(a7)
[00002e4e] 2f3a d254                 move.l     funcMtAes(pc),-(a7)
[00002e52] 6000 d25e                 bra        indirect
MT_SHEL_PUT:
[00002e56] 2f3c 0000 0160            move.l     #$00000160,-(a7)
[00002e5c] 2f3a d246                 move.l     funcMtAes(pc),-(a7)
[00002e60] 6000 d250                 bra        indirect
MT_SHEL_FIND:
[00002e64] 2f3c 0000 0164            move.l     #$00000164,-(a7)
[00002e6a] 2f3a d238                 move.l     funcMtAes(pc),-(a7)
[00002e6e] 6000 d242                 bra        indirect
MT_SHEL_ENVRN:
[00002e72] 2f3c 0000 0168            move.l     #$00000168,-(a7)
[00002e78] 2f3a d22a                 move.l     funcMtAes(pc),-(a7)
[00002e7c] 6000 d234                 bra        indirect
MT_SHEL_HELP:
[00002e80] 2f3c 0000 016c            move.l     #$0000016C,-(a7)
[00002e86] 2f3a d21c                 move.l     funcMtAes(pc),-(a7)
[00002e8a] 6000 d226                 bra        indirect
MT_FNTS_ADD:
[00002e8e] 2f3c 0000 0170            move.l     #$00000170,-(a7)
[00002e94] 2f3a d20e                 move.l     funcMtAes(pc),-(a7)
[00002e98] 6000 d218                 bra        indirect
MT_FNTS_CLOSE:
[00002e9c] 2f3c 0000 0174            move.l     #$00000174,-(a7)
[00002ea2] 2f3a d200                 move.l     funcMtAes(pc),-(a7)
[00002ea6] 6000 d20a                 bra        indirect
mt_fnts_create:
[00002eaa] 2f3c 0000 0178            move.l     #$00000178,-(a7)
[00002eb0] 2f3a d1f2                 move.l     funcMtAes(pc),-(a7)
[00002eb4] 6000 d1fc                 bra        indirect
mt_fnts_delete:
[00002eb8] 2f3c 0000 017c            move.l     #$0000017C,-(a7)
[00002ebe] 2f3a d1e4                 move.l     funcMtAes(pc),-(a7)
[00002ec2] 6000 d1ee                 bra        indirect
mt_fnts_do:
[00002ec6] 2f3c 0000 0180            move.l     #$00000180,-(a7)
[00002ecc] 2f3a d1d6                 move.l     funcMtAes(pc),-(a7)
[00002ed0] 6000 d1e0                 bra        indirect
mt_fnts_evnt:
[00002ed4] 2f3c 0000 0184            move.l     #$00000184,-(a7)
[00002eda] 2f3a d1c8                 move.l     funcMtAes(pc),-(a7)
[00002ede] 6000 d1d2                 bra        indirect
mt_fnts_get_info:
[00002ee2] 2f3c 0000 0188            move.l     #$00000188,-(a7)
[00002ee8] 2f3a d1ba                 move.l     funcMtAes(pc),-(a7)
[00002eec] 6000 d1c4                 bra        indirect
mt_fnts_get_name:
[00002ef0] 2f3c 0000 018c            move.l     #$0000018C,-(a7)
[00002ef6] 2f3a d1ac                 move.l     funcMtAes(pc),-(a7)
[00002efa] 6000 d1b6                 bra        indirect
mt_fnts_get_no_styles:
[00002efe] 2f3c 0000 0190            move.l     #$00000190,-(a7)
[00002f04] 2f3a d19e                 move.l     funcMtAes(pc),-(a7)
[00002f08] 6000 d1a8                 bra        indirect
mt_fnts_get_style:
[00002f0c] 2f3c 0000 0194            move.l     #$00000194,-(a7)
[00002f12] 2f3a d190                 move.l     funcMtAes(pc),-(a7)
[00002f16] 6000 d19a                 bra        indirect
mt_fnts_open:
[00002f1a] 2f3c 0000 0198            move.l     #$00000198,-(a7)
[00002f20] 2f3a d182                 move.l     funcMtAes(pc),-(a7)
[00002f24] 6000 d18c                 bra        indirect
mt_fnts_remove:
[00002f28] 2f3c 0000 019c            move.l     #$0000019C,-(a7)
[00002f2e] 2f3a d174                 move.l     funcMtAes(pc),-(a7)
[00002f32] 6000 d17e                 bra        indirect
mt_fnts_update:
[00002f36] 2f3c 0000 01a0            move.l     #$000001A0,-(a7)
[00002f3c] 2f3a d166                 move.l     funcMtAes(pc),-(a7)
[00002f40] 6000 d170                 bra        indirect
mt_lbox_ascroll_to:
[00002f44] 2f3c 0000 01a4            move.l     #$000001A4,-(a7)
[00002f4a] 2f3a d158                 move.l     funcMtAes(pc),-(a7)
[00002f4e] 6000 d162                 bra        indirect
mt_lbox_scroll_to:
[00002f52] 2f3c 0000 01a8            move.l     #$000001A8,-(a7)
[00002f58] 2f3a d14a                 move.l     funcMtAes(pc),-(a7)
[00002f5c] 6000 d154                 bra        indirect
mt_lbox_bscroll_to:
[00002f60] 2f3c 0000 01ac            move.l     #$000001AC,-(a7)
[00002f66] 2f3a d13c                 move.l     funcMtAes(pc),-(a7)
[00002f6a] 6000 d146                 bra        indirect
mt_lbox_cnt_items:
[00002f6e] 2f3c 0000 01b0            move.l     #$000001B0,-(a7)
[00002f74] 2f3a d12e                 move.l     funcMtAes(pc),-(a7)
[00002f78] 6000 d138                 bra        indirect
mt_lbox_create:
[00002f7c] 2f3c 0000 01b4            move.l     #$000001B4,-(a7)
[00002f82] 2f3a d120                 move.l     funcMtAes(pc),-(a7)
[00002f86] 6000 d12a                 bra        indirect
MT_LBOX_DELETE:
[00002f8a] 2f3c 0000 01b8            move.l     #$000001B8,-(a7)
[00002f90] 2f3a d112                 move.l     funcMtAes(pc),-(a7)
[00002f94] 6000 d11c                 bra        indirect
MT_LBOX_DO:
[00002f98] 2f3c 0000 01bc            move.l     #$000001BC,-(a7)
[00002f9e] 2f3a d104                 move.l     funcMtAes(pc),-(a7)
[00002fa2] 6000 d10e                 bra        indirect
MT_LBOX_FREE_ITEMS:
[00002fa6] 2f3c 0000 01c0            move.l     #$000001C0,-(a7)
[00002fac] 2f3a d0f6                 move.l     funcMtAes(pc),-(a7)
[00002fb0] 6000 d100                 bra        indirect
MT_LBOX_FREE_LIST:
[00002fb4] 2f3c 0000 01c4            move.l     #$000001C4,-(a7)
[00002fba] 2f3a d0e8                 move.l     funcMtAes(pc),-(a7)
[00002fbe] 6000 d0f2                 bra        indirect
MT_LBOX_GET_AFIRST:
[00002fc2] 2f3c 0000 01c8            move.l     #$000001C8,-(a7)
[00002fc8] 2f3a d0da                 move.l     funcMtAes(pc),-(a7)
[00002fcc] 6000 d0e4                 bra        indirect
MT_LBOX_GET_FIRST:
[00002fd0] 2f3c 0000 01cc            move.l     #$000001CC,-(a7)
[00002fd6] 2f3a d0cc                 move.l     funcMtAes(pc),-(a7)
[00002fda] 6000 d0d6                 bra        indirect
MT_LBOX_GET_AVIS:
[00002fde] 2f3c 0000 01d0            move.l     #$000001D0,-(a7)
[00002fe4] 2f3a d0be                 move.l     funcMtAes(pc),-(a7)
[00002fe8] 6000 d0c8                 bra        indirect
mt_lbox_get_visible:
[00002fec] 2f3c 0000 01d4            move.l     #$000001D4,-(a7)
[00002ff2] 2f3a d0b0                 move.l     funcMtAes(pc),-(a7)
[00002ff6] 6000 d0ba                 bra        indirect
mt_lbox_get_bentries:
[00002ffa] 2f3c 0000 01d8            move.l     #$000001D8,-(a7)
[00003000] 2f3a d0a2                 move.l     funcMtAes(pc),-(a7)
[00003004] 6000 d0ac                 bra        indirect
mt_lbox_get_bfirst:
[00003008] 2f3c 0000 01dc            move.l     #$000001DC,-(a7)
[0000300e] 2f3a d094                 move.l     funcMtAes(pc),-(a7)
[00003012] 6000 d09e                 bra        indirect
mt_lbox_get_idx:
[00003016] 2f3c 0000 01e0            move.l     #$000001E0,-(a7)
[0000301c] 2f3a d086                 move.l     funcMtAes(pc),-(a7)
[00003020] 6000 d090                 bra        indirect
mt_lbox_get_item:
[00003024] 2f3c 0000 01e4            move.l     #$000001E4,-(a7)
[0000302a] 2f3a d078                 move.l     funcMtAes(pc),-(a7)
[0000302e] 6000 d082                 bra        indirect
mt_lbox_get_items:
[00003032] 2f3c 0000 01e8            move.l     #$000001E8,-(a7)
[00003038] 2f3a d06a                 move.l     funcMtAes(pc),-(a7)
[0000303c] 6000 d074                 bra        indirect
mt_lbox_get_slct_idx:
[00003040] 2f3c 0000 01ec            move.l     #$000001EC,-(a7)
[00003046] 2f3a d05c                 move.l     funcMtAes(pc),-(a7)
[0000304a] 6000 d066                 bra        indirect
mt_lbox_get_slct_item:
[0000304e] 2f3c 0000 01f0            move.l     #$000001F0,-(a7)
[00003054] 2f3a d04e                 move.l     funcMtAes(pc),-(a7)
[00003058] 6000 d058                 bra        indirect
MT_LBOX_GET_TREE:
[0000305c] 2f3c 0000 01f4            move.l     #$000001F4,-(a7)
[00003062] 2f3a d040                 move.l     funcMtAes(pc),-(a7)
[00003066] 6000 d04a                 bra        indirect
MT_LBOX_GET_UDATA:
[0000306a] 2f3c 0000 01f8            move.l     #$000001F8,-(a7)
[00003070] 2f3a d032                 move.l     funcMtAes(pc),-(a7)
[00003074] 6000 d03c                 bra        indirect
MT_LBOX_SET_ASLDR:
[00003078] 2f3c 0000 01fc            move.l     #$000001FC,-(a7)
[0000307e] 2f3a d024                 move.l     funcMtAes(pc),-(a7)
[00003082] 6000 d02e                 bra        indirect
MT_LBOX_SET_SLIDER:
[00003086] 2f3c 0000 0200            move.l     #$00000200,-(a7)
[0000308c] 2f3a d016                 move.l     funcMtAes(pc),-(a7)
[00003090] 6000 d020                 bra        indirect
MT_LBOX_SET_BENTRIES:
[00003094] 2f3c 0000 0204            move.l     #$00000204,-(a7)
[0000309a] 2f3a d008                 move.l     funcMtAes(pc),-(a7)
[0000309e] 6000 d012                 bra        indirect
MT_LBOX_SET_BSLDR:
[000030a2] 2f3c 0000 0208            move.l     #$00000208,-(a7)
[000030a8] 2f3a cffa                 move.l     funcMtAes(pc),-(a7)
[000030ac] 6000 d004                 bra        indirect
MT_LBOX_SET_ITEMS:
[000030b0] 2f3c 0000 020c            move.l     #$0000020C,-(a7)
[000030b6] 2f3a cfec                 move.l     funcMtAes(pc),-(a7)
[000030ba] 6000 cff6                 bra        indirect
MT_LBOX_UPDATE:
[000030be] 2f3c 0000 0210            move.l     #$00000210,-(a7)
[000030c4] 2f3a cfde                 move.l     funcMtAes(pc),-(a7)
[000030c8] 6000 cfe8                 bra        indirect
MT_PDLG_ADD_PRINTERS:
[000030cc] 2f3c 0000 0214            move.l     #$00000214,-(a7)
[000030d2] 2f3a cfd0                 move.l     funcMtAes(pc),-(a7)
[000030d6] 6000 cfda                 bra        indirect
MT_PDLG_ADD_SUB_DIALOGS:
[000030da] 2f3c 0000 0218            move.l     #$00000218,-(a7)
[000030e0] 2f3a cfc2                 move.l     funcMtAes(pc),-(a7)
[000030e4] 6000 cfcc                 bra        indirect
MT_PDLG_CLOSE:
[000030e8] 2f3c 0000 021c            move.l     #$0000021C,-(a7)
[000030ee] 2f3a cfb4                 move.l     funcMtAes(pc),-(a7)
[000030f2] 6000 cfbe                 bra        indirect
MT_PDLG_CREATE:
[000030f6] 2f3c 0000 0220            move.l     #$00000220,-(a7)
[000030fc] 2f3a cfa6                 move.l     funcMtAes(pc),-(a7)
[00003100] 6000 cfb0                 bra        indirect
MT_PDLG_DELETE:
[00003104] 2f3c 0000 0224            move.l     #$00000224,-(a7)
[0000310a] 2f3a cf98                 move.l     funcMtAes(pc),-(a7)
[0000310e] 6000 cfa2                 bra        indirect
MT_PDLG_DFLT_SETTINGS:
[00003112] 2f3c 0000 0228            move.l     #$00000228,-(a7)
[00003118] 2f3a cf8a                 move.l     funcMtAes(pc),-(a7)
[0000311c] 6000 cf94                 bra        indirect
MT_PDLG_DO:
[00003120] 2f3c 0000 022c            move.l     #$0000022C,-(a7)
[00003126] 2f3a cf7c                 move.l     funcMtAes(pc),-(a7)
[0000312a] 6000 cf86                 bra        indirect
mt_pdlg_evnt:
[0000312e] 2f3c 0000 0230            move.l     #$00000230,-(a7)
[00003134] 2f3a cf6e                 move.l     funcMtAes(pc),-(a7)
[00003138] 6000 cf78                 bra        indirect
mt_pdlg_free_settings:
[0000313c] 2f3c 0000 0234            move.l     #$00000234,-(a7)
[00003142] 2f3a cf60                 move.l     funcMtAes(pc),-(a7)
[00003146] 6000 cf6a                 bra        indirect
mt_pdlg_get_setsize:
[0000314a] 2f3c 0000 0238            move.l     #$00000238,-(a7)
[00003150] 2f3a cf52                 move.l     funcMtAes(pc),-(a7)
[00003154] 6000 cf5c                 bra        indirect
mt_pdlg_new_settings:
[00003158] 2f3c 0000 023c            move.l     #$0000023C,-(a7)
[0000315e] 2f3a cf44                 move.l     funcMtAes(pc),-(a7)
[00003162] 6000 cf4e                 bra        indirect
mt_pdlg_open:
[00003166] 2f3c 0000 0240            move.l     #$00000240,-(a7)
[0000316c] 2f3a cf36                 move.l     funcMtAes(pc),-(a7)
[00003170] 6000 cf40                 bra        indirect
mt_pdlg_remove_printers:
[00003174] 2f3c 0000 0244            move.l     #$00000244,-(a7)
[0000317a] 2f3a cf28                 move.l     funcMtAes(pc),-(a7)
[0000317e] 6000 cf32                 bra        indirect
mt_pdlg_remove_sub_dialogs:
[00003182] 2f3c 0000 0248            move.l     #$00000248,-(a7)
[00003188] 2f3a cf1a                 move.l     funcMtAes(pc),-(a7)
[0000318c] 6000 cf24                 bra        indirect
mt_pdlg_update:
[00003190] 2f3c 0000 024c            move.l     #$0000024C,-(a7)
[00003196] 2f3a cf0c                 move.l     funcMtAes(pc),-(a7)
[0000319a] 6000 cf16                 bra        indirect
MT_PDLG_USE_SETTINGS:
[0000319e] 2f3c 0000 0250            move.l     #$00000250,-(a7)
[000031a4] 2f3a cefe                 move.l     funcMtAes(pc),-(a7)
[000031a8] 6000 cf08                 bra        indirect
MT_PDLG_VALIDATE_SETTINGS:
[000031ac] 2f3c 0000 0254            move.l     #$00000254,-(a7)
[000031b2] 2f3a cef0                 move.l     funcMtAes(pc),-(a7)
[000031b6] 6000 cefa                 bra        indirect
MT_EDIT_CREATE:
[000031ba] 2f3c 0000 0258            move.l     #$00000258,-(a7)
[000031c0] 2f3a cee2                 move.l     funcMtAes(pc),-(a7)
[000031c4] 6000 ceec                 bra        indirect
MT_EDIT_SET_BUG:
[000031c8] 2f3c 0000 025c            move.l     #$0000025C,-(a7)
[000031ce] 2f3a ced4                 move.l     funcMtAes(pc),-(a7)
[000031d2] 6000 cede                 bra        indirect
MT_EDIT_OPEN:
[000031d6] 2f3c 0000 0260            move.l     #$00000260,-(a7)
[000031dc] 2f3a cec6                 move.l     funcMtAes(pc),-(a7)
[000031e0] 6000 ced0                 bra        indirect
MT_EDIT_CLOSE:
[000031e4] 2f3c 0000 0264            move.l     #$00000264,-(a7)
[000031ea] 2f3a ceb8                 move.l     funcMtAes(pc),-(a7)
[000031ee] 6000 cec2                 bra        indirect
MT_EDIT_DELETE:
[000031f2] 2f3c 0000 0268            move.l     #$00000268,-(a7)
[000031f8] 2f3a ceaa                 move.l     funcMtAes(pc),-(a7)
[000031fc] 6000 ceb4                 bra        indirect
mt_edit_cursor:
[00003200] 2f3c 0000 026c            move.l     #$0000026C,-(a7)
[00003206] 2f3a ce9c                 move.l     funcMtAes(pc),-(a7)
[0000320a] 6000 cea6                 bra        indirect
mt_edit_evnt:
[0000320e] 2f3c 0000 0270            move.l     #$00000270,-(a7)
[00003214] 2f3a ce8e                 move.l     funcMtAes(pc),-(a7)
[00003218] 6000 ce98                 bra        indirect
mt_edit_get_buf:
[0000321c] 2f3c 0000 0274            move.l     #$00000274,-(a7)
[00003222] 2f3a ce80                 move.l     funcMtAes(pc),-(a7)
[00003226] 6000 ce8a                 bra        indirect
mt_edit_get_format:
[0000322a] 2f3c 0000 0278            move.l     #$00000278,-(a7)
[00003230] 2f3a ce72                 move.l     funcMtAes(pc),-(a7)
[00003234] 6000 ce7c                 bra        indirect
mt_edit_get_colour:
[00003238] 2f3c 0000 027c            move.l     #$0000027C,-(a7)
[0000323e] 2f3a ce64                 move.l     funcMtAes(pc),-(a7)
[00003242] 6000 ce6e                 bra        indirect
mt_edit_get_color:
[00003246] 2f3c 0000 0280            move.l     #$00000280,-(a7)
[0000324c] 2f3a ce56                 move.l     funcMtAes(pc),-(a7)
[00003250] 6000 ce60                 bra        indirect
mt_edit_get_font:
[00003254] 2f3c 0000 0284            move.l     #$00000284,-(a7)
[0000325a] 2f3a ce48                 move.l     funcMtAes(pc),-(a7)
[0000325e] 6000 ce52                 bra        indirect
mt_edit_get_cursor:
[00003262] 2f3c 0000 0288            move.l     #$00000288,-(a7)
[00003268] 2f3a ce3a                 move.l     funcMtAes(pc),-(a7)
[0000326c] 6000 ce44                 bra        indirect
mt_edit_get_dirty:
[00003270] 2f3c 0000 028c            move.l     #$0000028C,-(a7)
[00003276] 2f3a ce2c                 move.l     funcMtAes(pc),-(a7)
[0000327a] 6000 ce36                 bra        indirect
mt_edit_get_sel:
[0000327e] 2f3c 0000 0290            move.l     #$00000290,-(a7)
[00003284] 2f3a ce1e                 move.l     funcMtAes(pc),-(a7)
[00003288] 6000 ce28                 bra        indirect
mt_edit_get_scrollinfo:
[0000328c] 2f3c 0000 0294            move.l     #$00000294,-(a7)
[00003292] 2f3a ce10                 move.l     funcMtAes(pc),-(a7)
[00003296] 6000 ce1a                 bra        indirect
mt_edit_set_format:
[0000329a] 2f3c 0000 0298            move.l     #$00000298,-(a7)
[000032a0] 2f3a ce02                 move.l     funcMtAes(pc),-(a7)
[000032a4] 6000 ce0c                 bra        indirect
mt_edit_set_colour:
[000032a8] 2f3c 0000 029c            move.l     #$0000029C,-(a7)
[000032ae] 2f3a cdf4                 move.l     funcMtAes(pc),-(a7)
[000032b2] 6000 cdfe                 bra        indirect
mt_edit_set_color:
[000032b6] 2f3c 0000 02a0            move.l     #$000002A0,-(a7)
[000032bc] 2f3a cde6                 move.l     funcMtAes(pc),-(a7)
[000032c0] 6000 cdf0                 bra        indirect
mt_edit_set_font:
[000032c4] 2f3c 0000 02a4            move.l     #$000002A4,-(a7)
[000032ca] 2f3a cdd8                 move.l     funcMtAes(pc),-(a7)
[000032ce] 6000 cde2                 bra        indirect
mt_edit_set_cursor:
[000032d2] 2f3c 0000 02a8            move.l     #$000002A8,-(a7)
[000032d8] 2f3a cdca                 move.l     funcMtAes(pc),-(a7)
[000032dc] 6000 cdd4                 bra        indirect
MT_EDIT_RESIZED:
[000032e0] 2f3c 0000 02ac            move.l     #$000002AC,-(a7)
[000032e6] 2f3a cdbc                 move.l     funcMtAes(pc),-(a7)
[000032ea] 6000 cdc6                 bra        indirect
MT_EDIT_SET_DIRTY:
[000032ee] 2f3c 0000 02b0            move.l     #$000002B0,-(a7)
[000032f4] 2f3a cdae                 move.l     funcMtAes(pc),-(a7)
[000032f8] 6000 cdb8                 bra        indirect
MT_EDIT_SCROLL:
[000032fc] 2f3c 0000 02b4            move.l     #$000002B4,-(a7)
[00003302] 2f3a cda0                 move.l     funcMtAes(pc),-(a7)
[00003306] 6000 cdaa                 bra        indirect
MT_EVNTMULTI:
[0000330a] 2f3c 0000 02b8            move.l     #$000002B8,-(a7)
[00003310] 2f3a cd92                 move.l     funcMtAes(pc),-(a7)
[00003314] 6000 cd9c                 bra        indirect
MT_FORM_WBUTTON:
[00003318] 2f3c 0000 02bc            move.l     #$000002BC,-(a7)
[0000331e] 2f3a cd84                 move.l     funcMtAes(pc),-(a7)
[00003322] 6000 cd8e                 bra        indirect
MT_FORM_XDIAL:
[00003326] 2f3c 0000 02c0            move.l     #$000002C0,-(a7)
[0000332c] 2f3a cd76                 move.l     funcMtAes(pc),-(a7)
[00003330] 6000 cd80                 bra        indirect
MT_FORM_XDO:
[00003334] 2f3c 0000 02c4            move.l     #$000002C4,-(a7)
[0000333a] 2f3a cd68                 move.l     funcMtAes(pc),-(a7)
[0000333e] 6000 cd72                 bra        indirect
MT_FORM_XERR:
[00003342] 2f3c 0000 02c8            move.l     #$000002C8,-(a7)
[00003348] 2f3a cd5a                 move.l     funcMtAes(pc),-(a7)
[0000334c] 6000 cd64                 bra        indirect
MT_GRAF_WWATCHBOX:
[00003350] 2f3c 0000 02cc            move.l     #$000002CC,-(a7)
[00003356] 2f3a cd4c                 move.l     funcMtAes(pc),-(a7)
[0000335a] 6000 cd56                 bra        indirect
MT_GRAF_XHANDLE:
[0000335e] 2f3c 0000 02d0            move.l     #$000002D0,-(a7)
[00003364] 2f3a cd3e                 move.l     funcMtAes(pc),-(a7)
[00003368] 6000 cd48                 bra        indirect
MT_WDLG_CREATE:
[0000336c] 2f3c 0000 02d4            move.l     #$000002D4,-(a7)
[00003372] 2f3a cd30                 move.l     funcMtAes(pc),-(a7)
[00003376] 6000 cd3a                 bra        indirect
MT_WDLG_OPEN:
[0000337a] 2f3c 0000 02d8            move.l     #$000002D8,-(a7)
[00003380] 2f3a cd22                 move.l     funcMtAes(pc),-(a7)
[00003384] 6000 cd2c                 bra        indirect
MT_WDLG_CLOSE:
[00003388] 2f3c 0000 02dc            move.l     #$000002DC,-(a7)
[0000338e] 2f3a cd14                 move.l     funcMtAes(pc),-(a7)
[00003392] 6000 cd1e                 bra        indirect
MT_WDLG_DELETE:
[00003396] 2f3c 0000 02e0            move.l     #$000002E0,-(a7)
[0000339c] 2f3a cd06                 move.l     funcMtAes(pc),-(a7)
[000033a0] 6000 cd10                 bra        indirect
MT_WDLG_GET_TREE:
[000033a4] 2f3c 0000 02e4            move.l     #$000002E4,-(a7)
[000033aa] 2f3a ccf8                 move.l     funcMtAes(pc),-(a7)
[000033ae] 6000 cd02                 bra        indirect
mt_wdlg_get_edit:
[000033b2] 2f3c 0000 02e8            move.l     #$000002E8,-(a7)
[000033b8] 2f3a ccea                 move.l     funcMtAes(pc),-(a7)
[000033bc] 6000 ccf4                 bra        indirect
mt_wdlg_get_udata:
[000033c0] 2f3c 0000 02ec            move.l     #$000002EC,-(a7)
[000033c6] 2f3a ccdc                 move.l     funcMtAes(pc),-(a7)
[000033ca] 6000 cce6                 bra        indirect
mt_wdlg_get_handle:
[000033ce] 2f3c 0000 02f0            move.l     #$000002F0,-(a7)
[000033d4] 2f3a ccce                 move.l     funcMtAes(pc),-(a7)
[000033d8] 6000 ccd8                 bra        indirect
mt_wdlg_set_edit:
[000033dc] 2f3c 0000 02f4            move.l     #$000002F4,-(a7)
[000033e2] 2f3a ccc0                 move.l     funcMtAes(pc),-(a7)
[000033e6] 6000 ccca                 bra        indirect
mt_wdlg_set_tree:
[000033ea] 2f3c 0000 02f8            move.l     #$000002F8,-(a7)
[000033f0] 2f3a ccb2                 move.l     funcMtAes(pc),-(a7)
[000033f4] 6000 ccbc                 bra        indirect
mt_wdlg_set_size:
[000033f8] 2f3c 0000 02fc            move.l     #$000002FC,-(a7)
[000033fe] 2f3a cca4                 move.l     funcMtAes(pc),-(a7)
[00003402] 6000 ccae                 bra        indirect
mt_wdlg_set_iconify:
[00003406] 2f3c 0000 0300            move.l     #$00000300,-(a7)
[0000340c] 2f3a cc96                 move.l     funcMtAes(pc),-(a7)
[00003410] 6000 cca0                 bra        indirect
mt_wdlg_set_uniconify:
[00003414] 2f3c 0000 0304            move.l     #$00000304,-(a7)
[0000341a] 2f3a cc88                 move.l     funcMtAes(pc),-(a7)
[0000341e] 6000 cc92                 bra        indirect
mt_wdlg_evnt:
[00003422] 2f3c 0000 0308            move.l     #$00000308,-(a7)
[00003428] 2f3a cc7a                 move.l     funcMtAes(pc),-(a7)
[0000342c] 6000 cc84                 bra        indirect
mt_wdlg_redraw:
[00003430] 2f3c 0000 030c            move.l     #$0000030C,-(a7)
[00003436] 2f3a cc6c                 move.l     funcMtAes(pc),-(a7)
[0000343a] 6000 cc76                 bra        indirect
mt_wind_draw:
[0000343e] 2f3c 0000 0310            move.l     #$00000310,-(a7)
[00003444] 2f3a cc5e                 move.l     funcMtAes(pc),-(a7)
[00003448] 6000 cc68                 bra        indirect
mt_scrp_clear:
[0000344c] 2f3c 0000 0314            move.l     #$00000314,-(a7)
[00003452] 2f3a cc50                 move.l     funcMtAes(pc),-(a7)
[00003456] 6000 cc5a                 bra        indirect
mt_objc_xedit:
[0000345a] 2f3c 0000 0318            move.l     #$00000318,-(a7)
[00003460] 2f3a cc42                 move.l     funcMtAes(pc),-(a7)
[00003464] 6000 cc4c                 bra        indirect
mt_graf_rubbbox:
[00003468] 2f3c 0000 031c            move.l     #$0000031C,-(a7)
[0000346e] 2f3a cc34                 move.l     funcMtAes(pc),-(a7)
[00003472] 6000 cc3e                 bra        indirect

	.data
errno:
[00003476]                           dc.b $00
[00003477]                           dc.b $00
_FilSysVec:
[00003478]                           dc.b $00
[00003479]                           dc.b $00
[0000347a]                           dc.b $00
[0000347b]                           dc.b $00
;
         u ACSinit
         u FktNrAwi
         u FktNrAus
         u FktNrAuo
         u FktNrAte
         u FktNrMtAes
         u FktNrAst
         u FktNrAsh
         u FktNrAscrp
         u FktNrAob
         u FktNrSonst
         u FktNrAmo
         u FktNrAme
         u FktNrAlu
         u FktNrAim
         u FktNrAic
         u FktNrAf
         u FktNrAev
         u FktNrAes
         u FktNrKeytab
         u FktNrVdi
         u FktNrAdr
         u FktNrAch
         u FktNrAcfg
         u FktNrAbp
         u FktNrA
00000000 t compiler
00000008 t init_modul
0000000c T ACSblk
00000014 t funcAbp
0000001a t funcAcfg
00000020 t funcAch
00000026 t funcAdr
0000002c t funcAev
00000032 t funcAf
00000038 t funcAic
0000003e t funcAim
00000044 t funcAlu
0000004a t funcAme
00000050 t funcAmo
00000056 t funcAob
0000005c t funcAscrp
00000062 t funcAsh
00000068 t funcAst
0000006e t funcAte
00000074 t funcAuo
0000007a t funcAus
00000080 t funcAwi
00000086 t funcA
0000008c t funcSonst
00000092 t funcVdi
00000098 t funcAes
0000009e t funcKeytab
000000a4 t funcMtAes
000000aa t aess
000000ae t vdis
000000b2 t indirect
000000c6 T ABP_CREATE
000000c6 T Abp_create
000000d2 T ABP_DELETE
000000d2 T Abp_delete
000000de T ABP_START
000000de T Abp_start
000000ea T ABP_END
000000ea T Abp_end
000000f6 T ABP_MFDB2IMG
000000f6 T Abp_mfdb2img
00000102 T ABP_IMG2MFDB
00000102 T Abp_img2mfdb
0000010e T ACFG_CREATE
0000010e T Acfg_create
0000011a T ACFG_DELETE
0000011a T Acfg_delete
00000126 T ACFG_CLEAR
00000126 T Acfg_clear
00000132 T ACFG_CLEARALLGROUPS
00000132 T Acfg_clearAllGroups
00000140 T ACFG_CLEARGROUP
00000140 T Acfg_clearGroup
0000014e T ACFG_LOAD
0000014e T Acfg_load
0000015c T ACFG_SAVE
0000015c T Acfg_save
0000016a T ACFG_ISCHANGED
0000016a T Acfg_isChanged
00000178 T ACFG_GETVALUE
00000178 T Acfg_getValue
00000186 T ACFG_SETVALUE
00000186 T Acfg_setValue
00000194 T ACFG_CLEARVALUE
00000194 T Acfg_clearValue
000001a2 T ACFG_GETCHAR
000001a2 T Acfg_getChar
000001b0 T ACFG_SETCHAR
000001b0 T Acfg_setChar
000001be T ACFG_GETLONG
000001be T Acfg_getLong
000001cc T ACFG_SETLONG
000001cc T Acfg_setLong
000001da T ACFG_GETSTRING
000001da T Acfg_getString
000001e8 T ACFG_GETBOOL
000001e8 T Acfg_getBool
000001f6 T ACFG_SETBOOL
000001f6 T Acfg_setBool
00000204 T ACFG_CLEARHEADER
00000204 T Acfg_clearHeader
00000212 T ACFG_HEADANZAHL
00000212 T Acfg_headAnzahl
00000220 T ACFG_SETHEADER
00000220 T Acfg_setHeader
0000022e T ACFG_GETHEADER
0000022e T Acfg_getHeader
0000023c T ACFG_GRPANZAHL
0000023c T Acfg_grpAnzahl
0000024a T ACFG_GRPNAME
0000024a T Acfg_grpName
00000258 T ACFG_STRANZAHL
00000258 T Acfg_strAnzahl
00000266 T ACFG_STRNAME
00000266 T Acfg_strName
00000274 T ACFG_STRVALUE
00000274 T Acfg_strValue
00000282 T ACFG_STRISCOMMENT
00000282 T Acfg_strIsComment
00000290 T ACFG_ISCFGFILE
00000290 T Acfg_isCfgfile
0000029e T ACFG_CREATEINFO
0000029e T Acfg_createInfo
000002ac T ACFG_DELETEINFO
000002ac T Acfg_deleteInfo
000002ba T ACFG_SETINFO
000002ba T Acfg_setInfo
000002c8 T ACFG_GETINFO
000002c8 T Acfg_getInfo
000002d6 T ACFG_COPYINFO
000002d6 T Acfg_copyInfo
000002e4 T ACFG_FLAGS
000002e4 T Acfg_flags
000002f2 T ACFG_ISGROUPPRESENT
000002f2 T Acfg_isGroupPresent
00000300 T ACFG_ISSTRINGPRESENT
00000300 T Acfg_isStringPresent
0000030e T ACH_TOLOWER
0000030e T Ach_tolower
0000031c T ACH_TOUPPER
0000031c T Ach_toupper
0000032a T ACH_ISWHITE
0000032a T Ach_isWhite
00000338 T ADR_BOX
00000338 T Adr_box
00000346 T ADR_DRAG
00000346 T Adr_drag
00000354 T ADR_NEXT
00000354 T Adr_next
00000362 T ADR_ADD
00000362 T Adr_add
00000370 T ADR_DEL
00000370 T Adr_del
0000037e T ADR_UNSELECT
0000037e T Adr_unselect
0000038c T ADR_START
0000038c T Adr_start
0000039a T AEV_QUIT
0000039a T Aev_quit
000003a8 T AEV_RELEASE
000003a8 T Aev_release
000003b6 T AEV_MESS
000003b6 T Aev_mess
000003c4 T AEV_UNHIDEPOINTER
000003c4 T Aev_unhidepointer
000003d2 T AEV_DHSTADD
000003d2 T Aev_DhstAdd
000003e0 T AEV_DHSTSAVED
000003e0 T Aev_DhstSaved
000003ee T AEV_WMREDRAW
000003ee T Aev_WmRedraw
000003fc T AF_CFGFILE
000003fc T Af_cfgfile
0000040a T AF_SELECT
0000040a T Af_select
00000418 T AF_2DRV
00000418 T Af_2drv
00000426 T AF_2PATH
00000426 T Af_2path
00000434 T AF_2NAME
00000434 T Af_2name
00000442 T AF_2FULLNAME
00000442 T Af_2fullname
00000450 T AF_2EXT
00000450 T Af_2ext
0000045e T AF_BUILDNAME
0000045e T Af_buildname
0000046c T AF_LENGTH
0000046c T Af_length
0000047a T AF_FIRST_FSEL
0000047a T Af_first_fsel
00000488 T AF_NEXT_FSEL
00000488 T Af_next_fsel
00000496 T AF_FIRST
00000496 T Af_first
000004a4 T AF_NEXT
000004a4 T Af_next
000004b2 T AF_READDIR
000004b2 T Af_readdir
000004c0 T AF_FREEDIR
000004c0 T Af_freedir
000004ce T AF_FILESELECT
000004ce T Af_fileselect
000004dc T AF_QUOTE
000004dc T Af_quote
000004ea T AF_UNQUOTE
000004ea T Af_unquote
000004f8 T AIC_CREATE
000004f8 T Aic_create
00000506 T AIC_DELETE
00000506 T Aic_delete
00000514 T AIM_CREATE
00000514 T Aim_create
00000522 T AIM_DELETE
00000522 T Aim_delete
00000530 T ALU_CREATE
00000530 T Alu_create
0000053e T ALU_DELETE
0000053e T Alu_delete
0000054c T AME_NAMEFIX
0000054c T Ame_namefix
0000055a T AME_POPUP
0000055a T Ame_popup
00000568 T AMO_NEW
00000568 T Amo_new
00000576 T AMO_BUSY
00000576 T Amo_busy
00000584 T AMO_UNBUSY
00000584 T Amo_unbusy
00000592 T AMO_HIDE
00000592 T Amo_hide
000005a0 T AMO_SHOW
000005a0 T Amo_show
000005ae T AOB_CREATE
000005ae T Aob_create
000005bc T AOB_DELETE
000005bc T Aob_delete
000005ca T AOB_FIX
000005ca T Aob_fix
000005d8 T AOB_OFFSET
000005d8 T Aob_offset
000005e6 T AOB_SAVE
000005e6 T Aob_save
000005f4 T AOB_RESTORE
000005f4 T Aob_restore
00000602 T AOB_WATCH
00000602 T Aob_watch
00000610 T AOB_FINDFLAG
00000610 T Aob_findflag
0000061e T AOB_ALIAS
0000061e T Aob_alias
0000062c T Aob_up
0000062c T AOB_UP
0000063a T AOB_ICON
0000063a T Aob_icon
00000648 T AOB_PUTTEXT
00000648 T Aob_puttext
00000656 T AOB_GETTEXT
00000656 T Aob_gettext
00000664 T AOB_WITHIN
00000664 T Aob_within
00000672 T AOB_PRINTF
00000672 T Aob_printf
00000680 T AOB_SCANF
00000680 T Aob_scanf
0000068e T AOB_FLAGS
0000068e T Aob_flags
0000069c T AOB_STATE
0000069c T Aob_state
000006aa T AOB_SERVICE
000006aa T Aob_service
000006b8 T AOB_VISIBLE
000006b8 T Aob_visible
000006c6 T AOB_COUNT
000006c6 T Aob_count
000006d4 T ASCRP_CLEAR
000006d4 T Ascrp_clear
000006e2 T ASCRP_GET
000006e2 T Ascrp_get
000006f0 T ASCRP_PUT
000006f0 T Ascrp_put
000006fe T ASH_PROG
000006fe T Ash_prog
0000070c T ASH_ERROR
0000070c T Ash_error
0000071a T ASH_GETCOOKIE
0000071a T Ash_getcookie
00000728 T ASH_GETENV
00000728 T Ash_getenv
00000736 T ASH_NEXTDD
00000736 T Ash_nextdd
00000744 T ASH_SENDALL
00000744 T Ash_sendall
00000752 T ASH_CALLEDDI
00000752 T Ash_CallEdDI
00000760 T ASH_NVDICOOKIE
00000760 T Ash_NVDICookie
0000076e T ASH_NVDIVERSION
0000076e T Ash_NVDIVersion
0000077c T ASH_NVDIDATUM
0000077c T Ash_NVDIDatum
0000078a T ASH_THERMOMETER
0000078a T Ash_thermometer
00000798 T ASH_FILESELECT
00000798 T Ash_fileselect
000007a6 T ASH_FONT
000007a6 T Ash_font
000007b4 T ASH_PRINT
000007b4 T Ash_print
000007c2 T ASH_GETTIMER
000007c2 T Ash_gettimer
000007d0 T ASH_PRINTSETICON
000007d0 T Ash_printSetIcon
000007de T ASH_FONTSETICON
000007de T Ash_fontSetIcon
000007ec T ASH_FILESETICON
000007ec T Ash_fileSetIcon
000007fa T ASH_GETOSHEADER
000007fa T Ash_getOSHeader
00000808 T ASH_GETMAGIC
00000808 T Ash_getMagiC
00000816 T ASH_GETNAES
00000816 T Ash_getNAES
00000824 T ASH_GETMAGICVERSION
00000824 T Ash_getMagiCVersion
00000832 T ASH_GETMAGICAESVARS
00000832 T Ash_getMagiCAESVars
00000840 T AST_CREATE
00000840 T Ast_create
0000084e T AST_DELETE
0000084e T Ast_delete
0000085c T AST_TOLOWER
0000085c T Ast_tolower
0000086a T AST_TOUPPER
0000086a T Ast_toupper
00000878 T AST_LTRIM
00000878 T Ast_ltrim
00000886 T AST_RTRIM
00000886 T Ast_rtrim
00000894 T AST_ALLTRIM
00000894 T Ast_alltrim
000008a2 T AST_CMP
000008a2 T Ast_cmp
000008b0 T AST_ICMP
000008b0 T Ast_icmp
000008be T AST_ISEMPTY
000008be T Ast_isEmpty
000008cc T AST_ADD
000008cc T Ast_add
000008da T AST_ADL
000008da T Ast_adl
000008e8 T AST_ADR
000008e8 T Ast_adr
000008f6 T AST_ADC
000008f6 T Ast_adc
00000904 T AST_FILTER
00000904 T Ast_filter
00000912 T AST_COUNT
00000912 T Ast_count
00000920 T AST_FCMP
00000920 T Ast_fcmp
0000092e T AST_NCMP
0000092e T Ast_ncmp
0000093c T AST_INCMP
0000093c T Ast_incmp
0000094a T AST_ISTR
0000094a T Ast_istr
00000958 T ATE_CREATE
00000958 T Ate_create
00000966 T ATE_DELETE
00000966 T Ate_delete
00000974 T AUO_FTEXT
00000974 T Auo_ftext
00000982 T AUO_STRING
00000982 T Auo_string
00000990 T AUO_CYCLE
00000990 T Auo_cycle
0000099e T AUO_PICTURE
0000099e T Auo_picture
000009ac T AUO_BOXED
000009ac T Auo_boxed
000009ba T AUS_CREATE
000009ba T Aus_create
000009c8 T AUS_DELETE
000009c8 T Aus_delete
000009d6 T AUS_BOXED
000009d6 T Aus_boxed
000009e4 T AUS_CYCLE
000009e4 T Aus_cycle
000009f2 T AWI_WID
000009f2 T Awi_wid
00000a00 T AWI_ROOT
00000a00 T Awi_root
00000a0e T AWI_LIST
00000a0e T Awi_list
00000a1c T AWI_SENDALL
00000a1c T Awi_sendall
00000a2a T AWI_DOWN
00000a2a T Awi_down
00000a38 T Awi_up
00000a38 T AWI_UP
00000a46 T AWI_SHOW
00000a46 T Awi_show
00000a54 T AWI_INIT
00000a54 T Awi_init
00000a62 T AWI_CREATE
00000a62 T Awi_create
00000a70 T AWI_OPEN
00000a70 T Awi_open
00000a7e T AWI_CLOSED
00000a7e T Awi_closed
00000a8c T AWI_DELETE
00000a8c T Awi_delete
00000a9a T AWI_TOPPED
00000a9a T Awi_topped
00000aa8 T AWI_FULLED
00000aa8 T Awi_fulled
00000ab6 T AWI_SIZED
00000ab6 T Awi_sized
00000ac4 T AWI_MOVED
00000ac4 T Awi_moved
00000ad2 T AWI_DIAEND
00000ad2 T Awi_diaend
00000ae0 T AWI_DIASTART
00000ae0 T Awi_diastart
00000aee T AWI_KEYS
00000aee T Awi_keys
00000afc T AWI_OBVIEW
00000afc T Awi_obview
00000b0a T AWI_SERVICE
00000b0a T Awi_service
00000b18 T AWI_SCROLL
00000b18 T Awi_scroll
00000b26 T AWI_OBCHANGE
00000b26 T Awi_obchange
00000b34 T AWI_OBREDRAW
00000b34 T Awi_obredraw
00000b42 T AWI_REDRAW
00000b42 T Awi_redraw
00000b50 T AWI_ARROWED
00000b50 T Awi_arrowed
00000b5e T AWI_HSLID
00000b5e T Awi_hslid
00000b6c T AWI_VSLID
00000b6c T Awi_vslid
00000b7a T AWI_ICONIFY
00000b7a T Awi_iconify
00000b88 T AWI_UNICONIFY
00000b88 T Awi_uniconify
00000b96 T AWI_GEMSCRIPT
00000b96 T Awi_gemscript
00000ba4 T AWI_MODAL
00000ba4 T Awi_modal
00000bb2 T AWI_DIALOG
00000bb2 T Awi_dialog
00000bc0 T AWI_ALERT
00000bc0 T Awi_alert
00000bce T AWI_SELFCREATE
00000bce T Awi_selfcreate
00000bdc T AWI_NOKEY
00000bdc T Awi_nokey
00000bea T AWI_UPDATE
00000bea T Awi_update
00000bf8 T AWI_UOSELF
00000bf8 T Awi_uoself
00000c06 T AWI_DOFORM
00000c06 T Awi_doform
00000c14 T AWI_OBSERVICE
00000c14 T Awi_observice
00000c22 T AWI_ONTOP
00000c22 T Awi_ontop
00000c30 T AWI_LAYOUT
00000c30 T Awi_layout
00000c3e T AWI_OBVISIBLE
00000c3e T Awi_obvisible
00000c4c T A_DIALOG
00000c4c T A_dialog
00000c5a T A_CHECKBOX
00000c5a T A_checkbox
00000c68 T A_RADIOBUTTON
00000c68 T A_radiobutton
00000c76 T A_INNERFRAME
00000c76 T A_innerframe
00000c84 T A_PATTERN
00000c84 T A_pattern
00000c92 T A_ARROWS
00000c92 T A_arrows
00000ca0 T A_SELECT
00000ca0 T A_select
00000cae T A_FTEXT
00000cae T A_ftext
00000cbc T A_TITLEACSFkt
00000cbc T A_title
00000cca T A_3Dbutton
00000cca T A_3DBUTTON
00000cd8 T A_CYCLE
00000cd8 T A_cycle
00000ce6 T A_PICTURE
00000ce6 T A_picture
00000cf4 T A_DIALOG2
00000cf4 T A_dialog2
00000d02 T A_BOXED
00000d02 T A_boxed
00000d10 T AX_MALLOC
00000d10 T Ax_malloc
00000d1e T AX_FREE
00000d1e T Ax_free
00000d2c T AX_IFREE
00000d2c T Ax_ifree
00000d3a T AX_GLMALLOC
00000d3a T Ax_glmalloc
00000d48 T AX_GLFREE
00000d48 T Ax_glfree
00000d56 T ACSmoduleterm
00000d56 T ACSMODULETERM
00000d6a T ALERT_STR
00000d6a T alert_str
00000d78 T intersect
00000d78 T INTERSECT
00000d86 T xywh2array
00000d86 T XYWH2ARRAY
00000d94 T ARRAY2XYWH
00000d94 T array2xywh
00000da2 T DOTTED_XLINE
00000da2 T dotted_xline
00000db0 T DOTTED_YLINE
00000db0 T dotted_yline
00000dbe T nkc_tos2n
00000dbe T NKC_TOS2N
00000dcc T nkc_n2tos
00000dcc T NKC_N2TOS
00000dda T nkc_gem2n
00000dda T NKC_GEM2N
00000de8 T nkc_n2gem
00000de8 T NKC_N2GEM
00000df6 T nkc_gemks2n
00000df6 T NKC_GEMKS2N
00000e04 T nkc_n2gemks
00000e04 T NKC_N2GEMKS
00000e12 T nkc_n2kstate
00000e12 T NKC_N2KSTATE
00000e20 T nkc_kstate
00000e20 T NKC_KSTATE
00000e2e T nkc_cmp
00000e2e T NKC_CMP
00000e3c T nkc_tolower
00000e3c T NKC_TOLOWER
00000e4a T nkc_toupper
00000e4a T NKC_TOUPPER
00000e58 T APPL_XGETINFO
00000e58 T appl_xgetinfo
00000e66 T AX_SETRECYCLESIZE
00000e66 T Ax_setRecycleSize
00000e74 T AX_GETRECYCLESTAT
00000e74 T Ax_getRecycleStat
00000e82 T AX_RECYCLE
00000e82 T Ax_recycle
00000e90 T AVDI_GETRGB
00000e90 T Avdi_getRGB
00000e9e T vdi
00000e9e T VDI
00000eac T VDI_
00000eac T vdi_
00000eba T v_opnwk
00000eba T V_OPNWK
00000ec8 T v_clswk
00000ec8 T V_CLSWK
00000ed6 T v_opnvwk
00000ed6 T V_OPNVWK
00000ee4 T v_clsvwk
00000ee4 T V_CLSVWK
00000ef2 T v_clrwk
00000ef2 T V_CLRWK
00000f00 T v_updwk
00000f00 T V_UPDWK
00000f0e T v_opnbm
00000f0e T V_OPNBM
00000f1c T v_clsbm
00000f1c T V_CLSBM
00000f2a T vst_load_fonts
00000f2a T VST_LOAD_FONTS
00000f38 T vst_unload_fonts
00000f38 T VST_UNLOAD_FONTS
00000f46 T vs_clip
00000f46 T VS_CLIP
00000f54 T v_pline
00000f54 T V_PLINE
00000f62 T v_pmarker
00000f62 T V_PMARKER
00000f70 T v_gtext
00000f70 T V_GTEXT
00000f7e T v_fillarea
00000f7e T V_FILLAREA
00000f8c T v_cellarray
00000f8c T V_CELLARRAY
00000f9a T v_contourfill
00000f9a T V_CONTOURFILL
00000fa8 T v_bar
00000fa8 T V_BAR
00000fb6 T v_arc
00000fb6 T V_ARC
00000fc4 T v_pieslice
00000fc4 T V_PIESLICE
00000fd2 T v_circle
00000fd2 T V_CIRCLE
00000fe0 T v_ellipse
00000fe0 T V_ELLIPSE
00000fee T v_ellarc
00000fee T V_ELLARC
00000ffc T v_ellpie
00000ffc T V_ELLPIE
0000100a T v_justified
0000100a T V_JUSTIFIED
00001018 T vr_recfl
00001018 T VR_RECFL
00001026 T v_rfbox
00001026 T V_RFBOX
00001034 T v_rbox
00001034 T V_RBOX
00001042 T vq_gdos
00001042 T VQ_GDOS
00001050 T vswr_mode
00001050 T VSWR_MODE
0000105e T vsl_type
0000105e T VSL_TYPE
0000106c T vsl_udsty
0000106c T VSL_UDSTY
0000107a T vsl_width
0000107a T VSL_WIDTH
00001088 T vsl_color
00001088 T VSL_COLOR
00001096 T vsl_ends
00001096 T VSL_ENDS
000010a4 T vsm_type
000010a4 T VSM_TYPE
000010b2 T vsm_height
000010b2 T VSM_HEIGHT
000010c0 T vsm_color
000010c0 T VSM_COLOR
000010ce T vst_height
000010ce T VST_HEIGHT
000010dc T vst_point
000010dc T VSM_POINT
000010ea T vst_rotation
000010ea T VST_ROTATION
000010f8 T vst_font
000010f8 T VST_FONT
00001106 T vst_color
00001106 T VST_COLOR
00001114 T vst_effects
00001114 T VST_EFFECTS
00001122 T vst_alignment
00001122 T VST_ALIGNMENT
00001130 T vsf_interior
00001130 T VSF_INTERIOR
0000113e T vsf_style
0000113e T VSF_STYLE
0000114c T vsf_color
0000114c T VSF_COLOR
0000115a T vsf_perimeter
0000115a T VSF_PERIMETER
00001168 T vsf_udpat
00001168 T VSF_UDPAT
00001176 T vsf_udpat
00001176 T VSF_UDPAT
00001184 T vs_color
00001184 T VS_COLOR
00001192 T vr_trnfm
00001192 T VR_TRNFM
000011a0 T vro_cpyfm
000011a0 T VRO_CPYFM
000011ae T vrt_cpyfm
000011ae T VRT_CPYFM
000011bc T v_get_pixel
000011bc T V_GET_PIXEL
000011ca T vsin_mode
000011ca T VSIN_MODE
000011d8 T vrq_locator
000011d8 T VRQ_LOCATOR
000011e6 T vsm_locator
000011e6 T VSM_LOCATOR
000011f4 T vrq_valuator
000011f4 T VRQ_VALUATOR
00001202 T vsm_valuator
00001202 T VSM_VALUATOR
00001210 T vrq_choice
00001210 T VRQ_CHOICE
0000121e T vsm_choice
0000121e T VSM_CHOICE
0000122c T vrq_string
0000122c T VRQ_STRING
0000123a T vsm_string
0000123a T VSM_STRING
00001248 T vex_timv
00001248 T VEX_TIMV
00001256 T v_show_c
00001256 T V_SHOW_C
00001264 T v_hide_c
00001264 T V_HIDE_C
00001272 T vq_mouse
00001272 T VQ_MOUSE
00001280 T vex_butv
00001280 T VEX_BUTV
0000128e T vex_motv
0000128e T VEX_MOTV
0000129c T vex_curv
0000129c T VEX_CURV
000012aa T vq_key_s
000012aa T VQ_KEY_S
000012b8 T vq_extnd
000012b8 T VQ_EXTND
000012c6 T vql_attributes
000012c6 T VQL_ATTRIBUTES
000012d4 T vqm_attributes
000012d4 T VQM_ATTRIBUTES
000012e2 T vqf_attributes
000012e2 T VQF_ATTRIBUTES
000012f0 T vqt_attributes
000012f0 T VQT_ATTRIBUTES
000012fe T vqt_extent
000012fe T VQT_EXTENT
0000130c T vqt_width
0000130c T VQT_WIDTH
0000131a T vqt_name
0000131a T VQT_NAME
00001328 T vqin_mode
00001328 T VQIN_MODE
00001336 T vqt_fontinfo
00001336 T VQT_FONTINFO
00001344 T vq_scrninfo
00001344 T VQ_SCRNINFO
00001352 T vq_color
00001352 T VQ_COLOR
00001360 T vq_cellarray
00001360 T VQ_CELLARRAY
0000136e T vq_chcells
0000136e T VQ_CHCELLS
0000137c T v_exit_cur
0000137c T V_EXIT_CUR
0000138a T v_enter_cur
0000138a T V_ENTER_CUR
00001398 T v_curup
00001398 T V_CURUP
000013a6 T v_curdown
000013a6 T V_CURDOWN
000013b4 T v_curright
000013b4 T V_CURRIGHT
000013c2 T v_curleft
000013c2 T V_CURLEFT
000013d0 T v_curhome
000013d0 T V_CURHOME
000013de T v_eeos
000013de T V_EEOS
000013ec T v_eeol
000013ec T V_EEOL
000013fa T v_curaddress
000013fa T V_CURADDRESS
00001408 T v_curtext
00001408 T V_CURTEXT
00001416 T v_rvon
00001416 T V_RVON
00001424 T v_rvoff
00001424 T V_RVOFF
00001432 T vq_curaddress
00001432 T VQ_CURADDRESS
00001440 T vq_tabstatus
00001440 T VQ_TABSTATUS
0000144e T v_hardcopy
0000144e T V_HARDCOPY
0000145c T v_dspcur
0000145c T V_DSPCUR
0000146a T v_rmcur
0000146a T V_RMCUR
00001478 T v_form_adv
00001478 T V_FORM_ADV
00001486 T v_clear_disp_list
00001486 T V_CLEAR_DISP_LIST
00001494 T vq_scan
00001494 T VQ_SCAN
000014a2 T v_alpha_text
000014a2 T V_ALPHA_TEXT
000014b0 T vs_palette
000014b0 T VS_PALETTE
000014be T v_sound
000014be T V_SOUND
000014cc T vs_mute
000014cc T VS_MUTE
000014da T vt_resolution
000014da T VT_RESOLUTION
000014e8 T vt_axis
000014e8 T VT_AXIS
000014f6 T vt_origin
000014f6 T VT_ORIGIN
00001504 T vq_tdimensions
00001504 T VQ_TDIMENSIONS
00001512 T vt_alignment
00001512 T VT_ALIGNMENT
00001520 T vsp_film
00001520 T VSP_FILM
0000152e T vqp_filmname
0000152e T VQP_FILMNAME
0000153c T vsc_expose
0000153c T VSC_EXPOSE
0000154a T v_meta_extents
0000154a T V_META_EXTENTS
00001558 T v_write_meta
00001558 T V_WRITE_META
00001566 T vm_pagesize
00001566 T VM_PAGESIZE
00001574 T vm_coords
00001574 T VM_COORDS
00001582 T vm_filename
00001582 T VM_FILENAME
00001590 T v_offset
00001590 T V_OFFSET
0000159e T v_fontinit
0000159e T V_FONTINIT
000015ac T v_escape2000
000015ac T V_ESCAPE2000
000015ba T v_output_window
000015ba T V_OUTPUT_WINDOW
000015c8 T v_bit_image
000015c8 T V_BIT_IMAGE
000015d6 T fix31ToPixel
000015d6 T FIX31TOPIXEL
000015e4 T v_opnprn
000015e4 T V_OPNPRN
000015f2 T v_opnmeta
000015f2 T V_OPNMETA
00001600 T vq_devinfo
00001600 T VQ_DEVINFO
0000160e T vq_ext_devinfo
0000160e T VQ_EXT_DEVINFO
0000161c T vs_calibrate
0000161c T VS_CALIBRATE
0000162a T vq_calibrate
0000162a T VQ_CALIBRATE
00001638 T v_bez
00001638 T V_BEZ
00001646 T v_bez_on
00001646 T V_BEZ_ON
00001654 T v_bez_off
00001654 T V_BEZ_OFF
00001662 T v_bez_qual
00001662 T V_BEZ_QUAL
00001670 T v_bez_fill
00001670 T V_BEZ_FILL
0000167e T vqt_ext_name
0000167e T VQT_EXT_NAME
0000168c T vqt_char_index
0000168c T VQT_CHAR_INDEX
0000169a T vqt_isCharAvailable
0000169a T VQT_ISCHARAVAILABLE
000016a8 T vqt_xfntinfo
000016a8 T VQT_XFNTINFO
000016b6 T vst_name
000016b6 T VST_NAME
000016c4 T vqt_name_and_id
000016c4 T VQT_NAME_AND_ID
000016d2 T vqt_fontheader
000016d2 T VQT_FONTHEADER
000016e0 T vqt_trackkern
000016e0 T VQT_TRACKKERN
000016ee T vqt_pairkern
000016ee T VQT_PAIRKERN
000016fc T vst_charmap
000016fc T VST_CHARMAP
0000170a T vst_kern
0000170a T VST_KERN
00001718 T vst_kern_offset
00001718 T VST_KERN_OFFSET
00001726 T v_getbitmap_info
00001726 T V_GETBITMAP_INFO
00001734 T vqt_f_extent
00001734 T VQT_F_EXTENT
00001742 T vqt_real_extent
00001742 T VQT_REAL_EXTENT
00001750 T v_ftext
00001750 T V_FTEXT
0000175e T v_ftext_offset
0000175e T V_FTEXT_OFFSET
0000176c T v_getoutline
0000176c T V_GETOUTLINE
0000177a T vst_arbpt32
0000177a T VST_ARBPT32
00001788 T vqt_advance32
00001788 T VQT_ADVANCE32
00001796 T vst_setsize32
00001796 T VST_SETSIZE32
000017a4 T vst_skew
000017a4 T VST_SKEW
000017b2 T v_orient
000017b2 T V_ORIENT
000017c0 T v_trays
000017c0 T V_TRAYS
000017ce T vq_tray_names
000017ce T VQ_TRAY_NAMES
000017dc T v_page_size
000017dc T V_PAGE_SIZE
000017ea T vq_page_name
000017ea T VQ_PAGE_NAME
000017f8 T vst_fg_color
000017f8 T VST_FG_COLOR
00001806 T vsf_fg_color
00001806 T VSF_FG_COLOR
00001814 T vsl_fg_color
00001814 T VSL_FG_COLOR
00001822 T vsm_fg_color
00001822 T VSM_FG_COLOR
00001830 T vsr_fg_color
00001830 T VSR_FG_COLOR
0000183e T vst_bg_color
0000183e T VST_BG_COLOR
0000184c T vsf_bg_color
0000184c T VSF_BG_COLOR
0000185a T vsl_bg_color
0000185a T VSL_BG_COLOR
00001868 T vsm_bg_color
00001868 T VSM_BG_COLOR
00001876 T vsr_bg_color
00001876 T VSR_BG_COLOR
00001884 T vqt_fg_color
00001884 T VQT_FG_COLOR
00001892 T vqf_fg_color
00001892 T VQF_FG_COLOR
000018a0 T vql_fg_color
000018a0 T VQL_FG_COLOR
000018ae T vqm_fg_color
000018ae T VQM_FG_COLOR
000018bc T vqr_fg_color
000018bc T VQR_FG_COLOR
000018ca T vqt_bg_color
000018ca T VQT_BG_COLOR
000018d8 T vqf_bg_color
000018d8 T VQF_BG_COLOR
000018e6 T vql_bg_color
000018e6 T VQL_BG_COLOR
000018f4 T vqm_bg_color
000018f4 T VQM_BG_COLOR
00001902 T vqr_bg_color
00001902 T VQR_BG_COLOR
00001910 T v_color2value
00001910 T V_COLOR2VALUE
0000191e T v_value2color
0000191e T V_VALUE2COLOR
0000192c T v_color2nearest
0000192c T V_COLOR2NEAREST
0000193a T vq_px_format
0000193a T VQ_PX_FORMAT
00001948 T vs_ctab
00001948 T VS_CTAB
00001956 T vs_ctab_entry
00001956 T VS_CTAB_ENTRY
00001964 T vs_dflt_ctab
00001964 T VS_DFLT_CTAB
00001972 T vq_ctab
00001972 T VQ_CTAB
00001980 T vq_ctab_entry
00001980 T VQ_CTAB_ENTRY
0000198e T vq_ctab_id
0000198e T VQ_CTAB_ID
0000199c T v_ctab_idx2vdi
0000199c T V_CTAB_IDX2VDI
000019aa T v_ctab_vdi2idx
000019aa T V_CTAB_VDI2IDX
000019b8 T v_ctab_idx2value
000019b8 T V_CTAB_IDX2VALUE
000019c6 T v_get_ctab_id
000019c6 T V_GET_CTAB_ID
000019d4 T vq_dflt_ctab
000019d4 T VQ_DFLT_CTAB
000019e2 T v_create_itab
000019e2 T V_CREATE_ITAB
000019f0 T v_delete_itab
000019f0 T V_DELETE_ITAB
000019fe T vr_transfer_bits
000019fe T VR_TRANSFER_BITS
00001a0c T vs_hilite_color
00001a0c T VS_HILITE_COLOR
00001a1a T vs_min_color
00001a1a T VS_MIN_COLOR
00001a28 T vs_max_color
00001a28 T VS_MAX_COLOR
00001a36 T vs_weight_color
00001a36 T VS_WEIGHT_COLOR
00001a44 T vq_hilite_color
00001a44 T VQ_HILITE_COLOR
00001a52 T vq_min_color
00001a52 T VQ_MIN_COLOR
00001a60 T vq_max_color
00001a60 T VQ_MAX_COLOR
00001a6e T vq_weight_color
00001a6e T VQ_WEIGHT_COLOR
00001a7c T vs_document_info
00001a7c T VS_DOCUMENT_INFO
00001a8a T vq_prn_scaling
00001a8a T VQ_PRN_SCALING
00001a98 T v_open_bm
00001a98 T V_OPEN_BM
00001aa6 T v_resize_bm
00001aa6 T V_RESIZE_BM
00001ab4 T v_get_outline
00001ab4 T V_GET_OUTLINE
00001ac2 T vst_track_offset
00001ac2 T VST_TRACK_OFFSET
00001ad0 T vst_arbpt
00001ad0 T VST_ARBPT
00001ade T vqt_advance
00001ade T VQT_ADVANCE
00001aec T vst_setsize
00001aec T VST_SETSIZE
00001afa T vq_vgdos
00001afa T VQ_VGDOS
00001b08 T vst_width
00001b08 T VST_WIDTH
00001b16 T vst_scratch
00001b16 T VST_SCRATCH
00001b24 T vst_error
00001b24 T VST_ERROR
00001b32 T v_savecache
00001b32 T VST_SAVECACHE
00001b40 T v_loadcache
00001b40 T VST_LOADCACHE
00001b4e T v_flushcache
00001b4e T VST_FLUSHCACHE
00001b5c T vqt_cachesize
00001b5c T VST_CACHESIZE
00001b6a T vqt_get_table
00001b6a T VST_GET_TABLE
00001b78 T vs_curaddress
00001b78 T VS_CURADDRESS
00001b86 T vsf_perimeter3
00001b86 T VSF_PERIMETER3
00001b94 T vqt_justified
00001b94 T VQT_JUSTIFIED
00001ba2 T v_opnprnwrk
00001ba2 T V_OPNPRNWRK
00001bb0 T v_opnmatrixprn
00001bb0 T V_OPNMATRIXPRN
00001bbe T v_set_app_buff
00001bbe T V_SET_APP_BUFF
00001bcc T vqt_devinfo
00001bcc T VQT_DEVINFO
00001bda T v_create_ctab
00001bda T V_CREATE_CTAB
00001be8 T v_delete_ctab
00001be8 T V_DELETE_CTAB
00001bf6 T v_setrgb
00001bf6 T V_SETRGB
00001c04 T aes
00001c04 T AES
00001c12 T APPL_INIT
00001c12 T appl_init
00001c20 T APPL_READ
00001c20 T appl_read
00001c2e T APPL_WRITE
00001c2e T appl_write
00001c3c T APPL_FIND
00001c3c T appl_find
00001c4a T APPL_SEARCH
00001c4a T appl_search
00001c58 T APPL_TPLAY
00001c58 T appl_tplay
00001c66 T APPL_TRECORD
00001c66 T appl_trecord
00001c74 T APPL_YIELD
00001c74 T appl_yield
00001c82 T APPL_EXIT
00001c82 T appl_exit
00001c90 T APPL_GETINFO
00001c90 T appl_getinfo
00001c9e T APPL_CONTROL
00001c9e T appl_control
00001cac T EVNT_KEYBD
00001cac T evnt_keybd
00001cba T EVNT_BUTTON
00001cba T evnt_button
00001cc8 T EVNT_MOUSE
00001cc8 T evnt_mouse
00001cd6 T EVNT_MESAG
00001cd6 T evnt_mesag
00001ce4 T EVNT_TIMER
00001ce4 T evnt_timer
00001cf2 T EVNT_EVENT
00001cf2 T evnt_event
00001d00 T EVNT_MULTI
00001d00 T evnt_multi
00001d0e T EVNT_DCLICK
00001d0e T evnt_dclick
00001d1c T menu_bar
00001d1c T MENU_BAR
00001d2a T menu_icheck
00001d2a T MENU_ICHECK
00001d38 T menu_ienable
00001d38 T MENU_IENABLE
00001d46 T menu_tnormal
00001d46 T MENU_TNORMAL
00001d54 T menu_text
00001d54 T MENU_TEXT
00001d62 T menu_register
00001d62 T MENU_REGISTER
00001d70 T menu_unregister
00001d70 T MENU_UNREGISTER
00001d7e T menu_click
00001d7e T MENU_CLICK
00001d8c T menu_attach
00001d8c T MENU_ATTACH
00001d9a T menu_istart
00001d9a T MENU_ISTART
00001da8 T menu_popup
00001da8 T MENU_POPUP
00001db6 T menu_settings
00001db6 T MENU_SETTINGS
00001dc4 T objc_add
00001dc4 T OBJC_ADD
00001dd2 T objc_delete
00001dd2 T OBJC_DELETE
00001de0 T objc_draw
00001de0 T OBJC_DRAW
00001dee T objc_find
00001dee T OBJC_FIND
00001dfc T objc_offset
00001dfc T OBJC_OFFSET
00001e0a T objc_order
00001e0a T OBJC_ORDER
00001e18 T objc_edit
00001e18 T OBJC_EDIT
00001e26 T objc_change
00001e26 T OBJC_CHANGE
00001e34 T objc_sysvar
00001e34 T OBJC_SYSVAR
00001e42 T form_do
00001e42 T FORM_DO
00001e50 T form_dial
00001e50 T FORM_DIAL
00001e5e T form_alert
00001e5e T FORM_ALERT
00001e6c T form_error
00001e6c T FORM_ERROR
00001e7a T form_center
00001e7a T FORM_CENTER
00001e88 T form_keybd
00001e88 T FORM_KEYBD
00001e96 T form_button
00001e96 T FORM_BUTTON
00001ea4 T GRAF_RUBBOX
00001ea4 T graf_rubbox
00001eb2 T GRAF_RUBBERBOX
00001eb2 T graf_rubberbox
00001ec0 T GRAF_DRAGBOX
00001ec0 T graf_dragbox
00001ece T GRAF_MBOX
00001ece T graf_mbox
00001edc T GRAF_MOVEBOX
00001edc T graf_movebox
00001eea T GRAF_GROWBOX
00001eea T graf_growbox
00001ef8 T GRAF_SHRINKBOX
00001ef8 T graf_shrinkbox
00001f06 T GRAF_WATCHBOX
00001f06 T graf_watchbox
00001f14 T GRAF_SLIDEBOX
00001f14 T graf_slidebox
00001f22 T GRAF_HANDLE
00001f22 T graf_handle
00001f30 T GRAF_MOUSE
00001f30 T graf_mouse
00001f3e T GRAF_MKSTATE
00001f3e T graf_mkstate
00001f4c T GRAF_MULTIRUBBER
00001f4c T graf_multirubber
00001f5a T scrp_read
00001f5a T SCRP_READ
00001f68 T scrp_write
00001f68 T SCRP_WRITE
00001f76 T FSEL_INPUT
00001f76 T fsel_input
00001f84 T FSEL_EXINPUT
00001f84 T fsel_exinput
00001f92 T FSEL_BOXINPUT
00001f92 T fsel_boxinput
00001fa0 T fslx_open
00001fa0 T FSLX_OPEN
00001fae T fslx_close
00001fae T FSLX_CLOSE
00001fbc T fslx_getnxtfile
00001fbc T FSLX_GETNXTFILE
00001fca T fslx_evnt
00001fca T FSLX_EVNT
00001fd8 T fslx_do
00001fd8 T FSLX_DO
00001fe6 T fslx_set_flags
00001fe6 T FSLX_SET_FLAGS
00001ff4 T wind_create
00001ff4 T WIND_CREATE
00002002 T wind_open
00002002 T WIND_OPEN
00002010 T wind_close
00002010 T WIND_CLOSE
0000201e T wind_delete
0000201e T WIND_DELETE
0000202c T wind_get
0000202c T WIND_GET
0000203a T wind_getQSB
0000203a T WIND_GETQSB
00002048 T wind_set
00002048 T WIND_SET
00002056 T wind_find
00002056 T WIND_FIND
00002064 T wind_update
00002064 T WIND_UPDATE
00002072 T wind_calc
00002072 T WIND_CALC
00002080 T wind_new
00002080 T WIND_NEW
0000208e T rsrc_load
0000208e T RSRC_LOAD
0000209c T rsrc_free
0000209c T RSRC_FREE
000020aa T rsrc_gaddr
000020aa T RSRC_GADDR
000020b8 T rsrc_saddr
000020b8 T RSRC_SADDR
000020c6 T rsrc_obfix
000020c6 T RSRC_OBFIX
000020d4 T rsrc_rcfix
000020d4 T RSRC_RCFIX
000020e2 T shel_read
000020e2 T SHEL_READ
000020f0 T shel_write
000020f0 T SHEL_WRITE
000020fe T shel_get
000020fe T SHEL_GET
0000210c T shel_put
0000210c T SHEL_PUT
0000211a T shel_find
0000211a T SHEL_FIND
00002128 T shel_envrn
00002128 T SHEL_ENVRN
00002136 T shel_help
00002136 T SHEL_HELP
00002144 T fnts_add
00002144 T FNTS_ADD
00002152 T fnts_close
00002152 T FNTS_CLOSE
00002160 T fnts_create
00002160 T FNTS_CREATE
0000216e T fnts_delete
0000216e T FNTS_DELETE
0000217c T fnts_do
0000217c T FNTS_DO
0000218a T fnts_evnt
0000218a T FNTS_EVNT
00002198 T fnts_get_info
00002198 T FNTS_GET_INFO
000021a6 T fnts_get_name
000021a6 T FNTS_GET_NAME
000021b4 T fnts_get_no_styles
000021b4 T FNTS_GET_NO_STYLES
000021c2 T fnts_get_style
000021c2 T FNTS_GET_STYLE
000021d0 T fnts_open
000021d0 T FNTS_OPEN
000021de T fnts_remove
000021de T FNTS_REMOVE
000021ec T fnts_update
000021ec T FNTS_UPDATE
000021fa T lbox_ascroll_to
000021fa T LBOX_ASCROL_TO
00002208 T lbox_scroll_to
00002208 T LBOX_SCROLL_TO
00002216 T lbox_bscroll_to
00002216 T LBOX_BSCROLL_TO
00002224 T lbox_cnt_items
00002224 T LBOX_CNT_ITEMS
00002232 T lbox_create
00002232 T LBOX_CREATE
00002240 T lbox_delete
00002240 T LBOX_DELETE
0000224e T lbox_do
0000224e T LBOX_DO
0000225c T lbox_free_items
0000225c T LBOX_FREE_ITEMS
0000226a T lbox_free_list
0000226a T LBOX_FREE_LIST
00002278 T lbox_get_afirst
00002278 T LBOX_GET_AFIRST
00002286 T lbox_get_first
00002286 T LBOX_GET_FIRST
00002294 T lbox_get_avis
00002294 T LBOX_GET_AVIS
000022a2 T lbox_get_visible
000022a2 T LBOX_GET_VISIBLE
000022b0 T lbox_get_bentries
000022b0 T LBOX_GET_BENTRIES
000022be T lbox_get_bfirst
000022be T LBOX_GET_BFIRST
000022cc T lbox_get_idx
000022cc T LBOX_GET_IDX
000022da T lbox_get_item
000022da T LBOX_GET_ITEM
000022e8 T lbox_get_items
000022e8 T LBOX_GET_ITEMS
000022f6 T lbox_get_slct_idx
000022f6 T LBOX_GET_SLCT_IDX
00002304 T lbox_get_slct_item
00002304 T LBOX_GET_SLCT_ITEM
00002312 T lbox_get_tree
00002312 T LBOX_GET_TREE
00002320 T lbox_get_udata
00002320 T LBOX_GET_UDATA
0000232e T lbox_set_asldr
0000232e T LBOX_SET_ASLDR
0000233c T lbox_set_slider
0000233c T LBOX_SET_SLIDER
0000234a T lbox_set_bentries
0000234a T LBOX_SET_BENTRIES
00002358 T lbox_set_bsldr
00002358 T LBOX_SET_BSLDR
00002366 T lbox_set_items
00002366 T LBOX_SET_ITEMS
00002374 T lbox_update
00002374 T LBOX_UPDATE
00002382 T pdlg_add_printers
00002382 T PDLG_ADD_PRINTERS
00002390 T pdlg_add_sub_dialogs
00002390 T PDLG_ADD_SUB_DIALOGS
0000239e T pdlg_close
0000239e T PDLG_CLOSE
000023ac T pdlg_create
000023ac T PDLG_CREATE
000023ba T pdlg_delete
000023ba T PDLG_DELETE
000023c8 T pdlg_dflt_settings
000023c8 T PDLG_DFLT_SETTINGS
000023d6 T pdlg_do
000023d6 T PDLG_DO
000023e4 T pdlg_evnt
000023e4 T PDLG_EVNT
000023f2 T pdlg_free_settings
000023f2 T PDLG_FREE_SETTINGS
00002400 T pdlg_get_setsize
00002400 T PDLG_GET_SETSIZE
0000240e T pdlg_new_settings
0000240e T PDLG_NEW_SETTINGS
0000241c T pdlg_open
0000241c T PDLG_OPEN
0000242a T pdlg_remove_printers
0000242a T PDLG_REMOVE_PRINTERS
00002438 T pdlg_remove_sub_dialogs
00002438 T PDLG_REMOVE_SUB_DIALOGS
00002446 T pdlg_update
00002446 T PDLG_UPDATE
00002454 T pdlg_use_settings
00002454 T PDLG_USE_SETTINGS
00002462 T pdlg_validate_settings
00002462 T PDLG_VALIDATE_SETTINGS
00002470 T EDIT_CREATE
00002470 T edit_create
0000247e T EDIT_SET_BUG
0000247e T edit_set_buf
0000248c T EDIT_OPEN
0000248c T edit_open
0000249a T EDIT_CLOSE
0000249a T edit_close
000024a8 T EDIT_DELETE
000024a8 T edit_delete
000024b6 T EDIT_CURSOR
000024b6 T edit_cursor
000024c4 T EDIT_EVNT
000024c4 T edit_evnt
000024d2 T EDIT_GET_BUF
000024d2 T edit_get_buf
000024e0 T EDIT_GET_FORMAT
000024e0 T edit_get_format
000024ee T EDIT_GET_COLOUR
000024ee T edit_get_colour
000024fc T EDIT_GET_COLOR
000024fc T edit_get_color
0000250a T EDIT_GET_FONT
0000250a T edit_get_font
00002518 T EDIT_GET_CURSOR
00002518 T edit_get_cursor
00002526 T EDIT_GET_DIRTY
00002526 T edit_get_dirty
00002534 T EDIT_GET_SEL
00002534 T edit_get_sel
00002542 T EDIT_GET_SCROLLINFO
00002542 T edit_get_scrollinfo
00002550 T EDIT_SET_FORMAT
00002550 T edit_set_format
0000255e T EDIT_SET_COLOUR
0000255e T edit_set_colour
0000256c T EDIT_SET_COLOR
0000256c T edit_set_color
0000257a T EDIT_SET_FONT
0000257a T edit_set_font
00002588 T EDIT_SET_CURSOR
00002588 T edit_set_cursor
00002596 T EDIT_RESIZED
00002596 T edit_resized
000025a4 T EDIT_SET_DIRTY
000025a4 T edit_set_dirty
000025b2 T EDIT_SCROLL
000025b2 T edit_scroll
000025c0 T EVNTMULTI
000025c0 T EvntMulti
000025ce T form_wbutton
000025ce T FORM_WBUTTON
000025dc T form_xdial
000025dc T FORM_XDIAL
000025ea T form_xdo
000025ea T FORM_XDO
000025f8 T form_xerr
000025f8 T FORM_XERR
00002606 T _CRYSTAL
00002606 T _crystal
00002614 T GRAF_WWATCHBOX
00002614 T graf_wwatchbox
00002622 T GRAF_XHANDLE
00002622 T graf_xhandle
00002630 T wdlg_create
00002630 T WDLG_CREATE
0000263e T wdlg_open
0000263e T WDLG_OPEN
0000264c T wdlg_close
0000264c T WDLG_CLOSE
0000265a T wdlg_delete
0000265a T WDLG_DELETE
00002668 T wdlg_get_tree
00002668 T WDLG_GET_TREE
00002676 T wdlg_get_edit
00002676 T WDLG_GET_EDIT
00002684 T wdlg_get_udata
00002684 T WDLG_GET_UDATA
00002692 T wdlg_get_handle
00002692 T WDLG_GET_HANDLE
000026a0 T wdlg_set_edit
000026a0 T WDLG_SET_EDIT
000026ae T wdlg_set_tree
000026ae T WDLG_SET_TREE
000026bc T wdlg_set_size
000026bc T WDLG_SET_SIZE
000026ca T wdlg_set_iconify
000026ca T WDLG_SET_ICONIFY
000026d8 T wdlg_set_uniconify
000026d8 T WDLG_SET_UNICONIFY
000026e6 T wdlg_evnt
000026e6 T WDLG_EVNT
000026f4 T wdlg_redraw
000026f4 T WDLG_REDRAW
00002702 T wind_draw
00002702 T WIND_DRAW
00002710 T scrp_clear
00002710 T SRCP_CLEAR
0000271e T objc_xedit
0000271e T OBJC_XEDIT
0000272c T GRAF_RUBBBOX
0000272c T graf_rubbbox
0000273a T AKT_GETKEYTAB
0000273a T Akt_getKeyTab
00002748 T AKT_GETRELEASE
00002748 T Akt_getRelease
00002756 T AKT_GETEURO
00002756 T Akt_getEuro
00002764 T AKT_GETEXPMAXNR
00002764 T Akt_getExpMaxNr
00002772 T AKT_GETIMPMAXNR
00002772 T Akt_getImpMaxNr
00002780 T AKT_GETEXPNAMEFROMNR
00002780 T Akt_getExpNameFromNr
0000278e T AKT_GETIMPNAMEFROMNR
0000278e T Akt_getImpNameFromNr
0000279c T AKT_GETEXPSHORTNAMEFROMNR
0000279c T Akt_getExpShortNameFromNr
000027aa T AKT_GETIMPSHORTNAMEFROMNR
000027aa T Akt_getImpShortNameFromNr
000027b8 T AKT_GETEXPNRFROMID
000027b8 T Akt_getExpNrFromId
000027c6 T AKT_GETIMPNRFROMID
000027c6 T Akt_getImpNrFromId
000027d4 T AKT_GETEXPIDFROMNR
000027d4 T Akt_getExpIdFromNr
000027e2 T AKT_GETIMPIDFROMNR
000027e2 T Akt_getImpIdFromNr
000027f0 T AKT_GETEXPNRFROMNAME
000027f0 T Akt_getExpNrFromName
000027fe T AKT_GETIMPNRFROMNAME
000027fe T Akt_getImpNrFromName
0000280c T AKT_CHARATARI2X
0000280c T Akt_CharAtari2X
0000281a T AKT_CHARX2ATARI
0000281a T Akt_CharX2Atari
00002828 T AKT_BLOCKATARI2X
00002828 T Akt_BlockAtari2X
00002836 T AKT_BLOCKX2ATARI
00002836 T Akt_BlockX2Atari
00002844 T AKT_STRINGATARI2X
00002844 T Akt_StringAtari2X
00002852 T AKT_STRINGX2ATARI
00002852 T Akt_StringX2Atari
00002860 T AKT_CHARX2UNICODE
00002860 T Akt_CharX2Unicode
0000286e T AKT_CHARUNICODE2X
0000286e T Akt_CharUnicode2X
0000287c T AKT_BLOCKX2UNICODE
0000287c T Akt_BlockX2Unicode
0000288a T AKT_BLOCKUNICODE2X
0000288a T Akt_BlockUnicode2X
00002898 T AKT_STRINGX2UNICODE
00002898 T Akt_StringX2Unicode
000028a6 T AKT_POPEXPNAME
000028a6 T Akt_popExpName
000028b4 T AKT_POPIMPNAME
000028b4 T Akt_popImpName
000028c2 T AKT_CHOOSEEXPNR
000028c2 T Akt_chooseExpNr
000028d0 T AKT_CHOOSEIMPNR
000028d0 T Akt_chooseImpNr
000028de T AKT_GETEXPMINNR
000028de T Akt_getExpMinNr
000028ec T AKT_GETIMPMINNR
000028ec T Akt_getImpMinNr
000028fa T AKT_BLOCKXUTF2UNICODE
000028fa T Akt_BlockXUtf2Unicode
00002908 T AKT_BLOCKUNICODE2XUTF
00002908 T Akt_BlockUnicode2XUtf
00002916 T AKT_STRINGXUTF2UNICODE
00002916 T Akt_StringXUtf2Unicode
00002924 T AKT_BLOCKXUTF2U2XUTF
00002924 T Akt_BlockXUtf2U2XUtf
00002932 T AKT_BLOCKXUTF2XUTF
00002932 T Akt_BlockXUtf2XUtf
00002940 T AKT_STRINGXUTF2U2XUTF
00002940 T Akt_StringXUtf2U2XUtf
0000294e T AKT_STRINGXUTF2XUTF
0000294e T Akt_StringXUtf2XUtf
0000295c T mt_appl_init
0000295c T MT_APPL_INIT
0000296a T mt_appl_read
0000296a T MT_APPL_READ
00002978 T mt_appl_write
00002978 T MT_APPL_WRITE
00002986 T mt_appl_find
00002986 T MT_APPL_FIND
00002994 T mt_appl_search
00002994 T MT_APPL_SEARCH
000029a2 T mt_appl_tplay
000029a2 T MT_APPL_TPLAY
000029b0 T mt_appl_trecord
000029b0 T MT_APPL_TRECORD
000029be T mt_appl_yield
000029be T MT_APPL_YIELD
000029cc T mt_appl_exit
000029cc T MT_APPL_EXIT
000029da T mt_appl_getinfo
000029da T MT_APPL_GETINFO
000029e8 T mt_appl_control
000029e8 T MT_APPL_CONTROL
000029f6 T mt_evnt_keybd
000029f6 T MT_EVNT_KEYBD
00002a04 T mt_evnt_button
00002a04 T MT_EVNT_BUTTON
00002a12 T mt_evnt_mouse
00002a12 T MT_EVNT_MOUSE
00002a20 T mt_evnt_mesag
00002a20 T MT_EVNT_MESAG
00002a2e T mt_evnt_timer
00002a2e T MT_EVNT_TIMER
00002a3c T mt_evnt_event
00002a3c T MT_EVNT_EVENT
00002a4a T mt_evnt_multi
00002a4a T MT_EVNT_MULTI
00002a58 T mt_evnt_dclick
00002a58 T MT_EVNT_DCLICK
00002a66 T mt_menu_bar
00002a66 T MT_MENU_BAR
00002a74 T mt_menu_icheck
00002a74 T MT_MENU_ICHECK
00002a82 T mt_menu_ienable
00002a82 T MT_MENU_IENABLE
00002a90 T mt_menu_tnormal
00002a90 T MT_MENU_TNORMAL
00002a9e T mt_menu_text
00002a9e T MT_MENU_TEXT
00002aac T mt_menu_register
00002aac T MT_MENU_REGISTER
00002aba T mt_menu_unregister
00002aba T MT_MENU_UNREGISTER
00002ac8 T mt_menu_click
00002ac8 T MT_MENU_CLICK
00002ad6 T mt_menu_attach
00002ad6 T MT_MENU_ATTACH
00002ae4 T mt_menu_istart
00002ae4 T MT_MENU_ISTART
00002af2 T mt_menu_popup
00002af2 T MT_MENU_POPUP
00002b00 T mt_menu_settings
00002b00 T MT_MENU_SETTINGS
00002b0e T mt_objc_add
00002b0e T MT_OBJC_ADD
00002b1c T mt_objc_delete
00002b1c T MT_OBJC_DELETE
00002b2a T mt_objc_draw
00002b2a T MT_OBJC_DRAW
00002b38 T mt_objc_find
00002b38 T MT_OBJC_FIND
00002b46 T mt_objc_offset
00002b46 T MT_OBJC_OFFSET
00002b54 T mt_objc_order
00002b54 T MT_OBJC_ORDER
00002b62 T mt_objc_edit
00002b62 T MT_OBJC_EDIT
00002b70 T mt_objc_change
00002b70 T MT_OBJC_CHANGE
00002b7e T mt_objc_sysvar
00002b7e T MT_OBJC_SYSVAR
00002b8c T mt_form_do
00002b8c T MT_FORM_DO
00002b9a T mt_form_dial
00002b9a T MT_FORM_DIAL
00002ba8 T mt_form_alert
00002ba8 T MT_FORM_ALERT
00002bb6 T mt_form_error
00002bb6 T MT_FORM_ERROR
00002bc4 T mt_form_center
00002bc4 T MT_FORM_CENTER
00002bd2 T mt_form_keybd
00002bd2 T MT_FORM_KEYBD
00002be0 T mt_form_button
00002be0 T MT_FORM_BUTTON
00002bee T mt_graf_rubbox
00002bee T MT_GRAF_RUBBOX
00002bfc T mt_graf_rubberbox
00002bfc T MT_GRAF_RUBBERBOX
00002c0a T mt_graf_dragbox
00002c0a T MT_GRAF_DRAGBOX
00002c18 T mt_graf_mbox
00002c18 T MT_GRAF_MBOX
00002c26 T mt_graf_movebox
00002c26 T MT_GRAF_MOVEBOX
00002c34 T mt_graf_growbox
00002c34 T MT_GRAF_GROWBOX
00002c42 T mt_graf_shrinkbox
00002c42 T MT_GRAF_SHRINKBOX
00002c50 T mt_graf_watchbox
00002c50 T MT_GRAF_WATCHBOX
00002c5e T mt_graf_slidebox
00002c5e T MT_GRAF_SLIDEBOX
00002c6c T mt_graf_handle
00002c6c T MT_GRAF_HANDLE
00002c7a T mt_graf_mouse
00002c7a T MT_GRAF_MOUSE
00002c88 T mt_graf_mkstate
00002c88 T MT_GRAF_MKSTATE
00002c96 T mt_graf_multirubber
00002c96 T MT_GRAF_MULTIRUBBER
00002ca4 T mt_scrp_read
00002ca4 T MT_SCRP_READ
00002cb2 T mt_scrp_write
00002cb2 T MT_SCRP_WRITE
00002cc0 T mt_fsel_input
00002cc0 T MT_FSEL_INPUT
00002cce T mt_fsel_exinput
00002cce T MT_FSEL_EXINPUT
00002cdc T mt_fsel_boxinput
00002cdc T MT_FSEL_BOXINPUT
00002cea T mt_fslx_open
00002cea T MT_FSLX_OPEN
00002cf8 T mt_fslx_close
00002cf8 T MT_FSLX_CLOSE
00002d06 T mt_fslx_getnxtfile
00002d06 T MT_FSLX_GETNXTFILE
00002d14 T mt_fslx_evnt
00002d14 T MT_FSLX_EVNT
00002d22 T mt_fslx_do
00002d22 T MT_FSLX_DO
00002d30 T mt_fslx_set_flags
00002d30 T MT_FSLX_SET_FLAGS
00002d3e T mt_wind_create
00002d3e T MT_WIND_CREATE
00002d4c T mt_wind_open
00002d4c T MT_WIND_OPEN
00002d5a T mt_wind_close
00002d5a T MT_WIND_CLOSE
00002d68 T mt_wind_delete
00002d68 T MT_WIND_DELETE
00002d76 T mt_wind_get
00002d76 T MT_WIND_GET
00002d84 T mt_wind_getQSB
00002d84 T MT_WIND_GETQSB
00002d92 T mt_wind_set
00002d92 T MT_WIND_SET
00002da0 T mt_wind_find
00002da0 T MT_WIND_FIND
00002dae T mt_wind_update
00002dae T MT_WIND_UPDATE
00002dbc T mt_wind_calc
00002dbc T MT_WIND_CALC
00002dca T mt_wind_new
00002dca T MT_WIND_NEW
00002dd8 T mt_rsrc_load
00002dd8 T MT_RSRC_LOAD
00002de6 T mt_rsrc_free
00002de6 T MT_RSRC_FREE
00002df4 T mt_rsrc_gaddr
00002df4 T MT_RSRC_GADDR
00002e02 T mt_rsrc_saddr
00002e02 T MT_RSRC_SADDR
00002e10 T mt_rsrc_obfix
00002e10 T MT_RSRC_OBFIX
00002e1e T mt_rsrc_rcfix
00002e1e T MT_RSRC_RCFIX
00002e2c T mt_shel_read
00002e2c T MT_SHEL_READ
00002e3a T mt_shel_write
00002e3a T MT_SHEL_WRITE
00002e48 T mt_shel_get
00002e48 T MT_SHEL_GET
00002e56 T mt_shel_put
00002e56 T MT_SHEL_PUT
00002e64 T mt_shel_find
00002e64 T MT_SHEL_FIND
00002e72 T mt_shel_envrn
00002e72 T MT_SHEL_ENVRN
00002e80 T mt_shel_help
00002e80 T MT_SHEL_HELP
00002e8e T mt_fnts_add
00002e8e T MT_FNTS_ADD
00002e9c T mt_fnts_close
00002e9c T MT_FNTS_CLOSE
00002eaa T mt_fnts_create
00002eaa T MT_FNTS_CREATE
00002eb8 T mt_fnts_delete
00002eb8 T MT_FNTS_DELETE
00002ec6 T mt_fnts_do
00002ec6 T MT_FNTS_DO
00002ed4 T mt_fnts_evnt
00002ed4 T MT_FNTS_EVNT
00002ee2 T mt_fnts_get_info
00002ee2 T MT_FNTS_GET_INFO
00002ef0 T mt_fnts_get_name
00002ef0 T MT_FNTS_GET_NAME
00002efe T mt_fnts_get_no_styles
00002efe T MT_FNTS_GET_NO_STYLES
00002f0c T mt_fnts_get_style
00002f0c T MT_FNTS_GET_STYLE
00002f1a T mt_fnts_open
00002f1a T MT_FNTS_OPEN
00002f28 T mt_fnts_remove
00002f28 T MT_FNTS_REMOVE
00002f36 T mt_fnts_update
00002f36 T MT_FNTS_UPDATE
00002f44 T mt_lbox_ascroll_to
00002f44 T MT_LBOX_ASCROL_TO
00002f52 T mt_lbox_scroll_to
00002f52 T MT_LBOX_SCROLL_TO
00002f60 T mt_lbox_bscroll_to
00002f60 T MT_LBOX_BSCROLL_TO
00002f6e T mt_lbox_cnt_items
00002f6e T MT_LBOX_CNT_ITEMS
00002f7c T mt_lbox_create
00002f7c T MT_LBOX_CREATE
00002f8a T mt_lbox_delete
00002f8a T MT_LBOX_DELETE
00002f98 T mt_lbox_do
00002f98 T MT_LBOX_DO
00002fa6 T mt_lbox_free_items
00002fa6 T MT_LBOX_FREE_ITEMS
00002fb4 T mt_lbox_free_list
00002fb4 T MT_LBOX_FREE_LIST
00002fc2 T mt_lbox_get_afirst
00002fc2 T MT_LBOX_GET_AFIRST
00002fd0 T mt_lbox_get_first
00002fd0 T MT_LBOX_GET_FIRST
00002fde T mt_lbox_get_avis
00002fde T MT_LBOX_GET_AVIS
00002fec T mt_lbox_get_visible
00002fec T MT_LBOX_GET_VISIBLE
00002ffa T mt_lbox_get_bentries
00002ffa T MT_LBOX_GET_BENTRIES
00003008 T mt_lbox_get_bfirst
00003008 T MT_LBOX_GET_BFIRST
00003016 T mt_lbox_get_idx
00003016 T MT_LBOX_GET_IDX
00003024 T mt_lbox_get_item
00003024 T MT_LBOX_GET_ITEM
00003032 T mt_lbox_get_items
00003032 T MT_LBOX_GET_ITEMS
00003040 T mt_lbox_get_slct_idx
00003040 T MT_LBOX_GET_SLCT_IDX
0000304e T mt_lbox_get_slct_item
0000304e T MT_LBOX_GET_SLCT_ITEM
0000305c T mt_lbox_get_tree
0000305c T MT_LBOX_GET_TREE
0000306a T mt_lbox_get_udata
0000306a T MT_LBOX_GET_UDATA
00003078 T mt_lbox_set_asldr
00003078 T MT_LBOX_SET_ASLDR
00003086 T mt_lbox_set_slider
00003086 T MT_LBOX_SET_SLIDER
00003094 T mt_lbox_set_bentries
00003094 T MT_LBOX_SET_BENTRIES
000030a2 T mt_lbox_set_bsldr
000030a2 T MT_LBOX_SET_BSLDR
000030b0 T mt_lbox_set_items
000030b0 T MT_LBOX_SET_ITEMS
000030be T mt_lbox_update
000030be T MT_LBOX_UPDATE
000030cc T mt_pdlg_add_printers
000030cc T MT_PDLG_ADD_PRINTERS
000030da T mt_pdlg_add_sub_dialogs
000030da T MT_PDLG_ADD_SUB_DIALOGS
000030e8 T mt_pdlg_close
000030e8 T MT_PDLG_CLOSE
000030f6 T mt_pdlg_create
000030f6 T MT_PDLG_CREATE
00003104 T mt_pdlg_delete
00003104 T MT_PDLG_DELETE
00003112 T mt_pdlg_dflt_settings
00003112 T MT_PDLG_DFLT_SETTINGS
00003120 T mt_pdlg_do
00003120 T MT_PDLG_DO
0000312e T mt_pdlg_evnt
0000312e T MT_PDLG_EVNT
0000313c T mt_pdlg_free_settings
0000313c T MT_PDLG_FREE_SETTINGS
0000314a T mt_pdlg_get_setsize
0000314a T MT_PDLG_GET_SETSIZE
00003158 T mt_pdlg_new_settings
00003158 T MT_PDLG_NEW_SETTINGS
00003166 T mt_pdlg_open
00003166 T MT_PDLG_OPEN
00003174 T mt_pdlg_remove_printers
00003174 T MT_PDLG_REMOVE_PRINTERS
00003182 T mt_pdlg_remove_sub_dialogs
00003182 T MT_PDLG_REMOVE_SUB_DIALOGS
00003190 T mt_pdlg_update
00003190 T MT_PDLG_UPDATE
0000319e T mt_pdlg_use_settings
0000319e T MT_PDLG_USE_SETTINGS
000031ac T mt_pdlg_validate_settings
000031ac T MT_PDLG_VALIDATE_SETTINGS
000031ba T mt_edit_create
000031ba T MT_EDIT_CREATE
000031c8 T mt_edit_set_buf
000031c8 T MT_EDIT_SET_BUG
000031d6 T mt_edit_open
000031d6 T MT_EDIT_OPEN
000031e4 T mt_edit_close
000031e4 T MT_EDIT_CLOSE
000031f2 T mt_edit_delete
000031f2 T MT_EDIT_DELETE
00003200 T mt_edit_cursor
00003200 T MT_EDIT_CURSOR
0000320e T mt_edit_evnt
0000320e T MT_EDIT_EVNT
0000321c T mt_edit_get_buf
0000321c T MT_EDIT_GET_BUF
0000322a T mt_edit_get_format
0000322a T MT_EDIT_GET_FORMAT
00003238 T mt_edit_get_colour
00003238 T MT_EDIT_GET_COLOUR
00003246 T mt_edit_get_color
00003246 T MT_EDIT_GET_COLOR
00003254 T mt_edit_get_font
00003254 T MT_EDIT_GET_FONT
00003262 T mt_edit_get_cursor
00003262 T MT_EDIT_GET_CURSOR
00003270 T mt_edit_get_dirty
00003270 T MT_EDIT_GET_DIRTY
0000327e T mt_edit_get_sel
0000327e T MT_EDIT_GET_SEL
0000328c T mt_edit_get_scrollinfo
0000328c T MT_EDIT_GET_SCROLLINFO
0000329a T mt_edit_set_format
0000329a T MT_EDIT_SET_FORMAT
000032a8 T mt_edit_set_colour
000032a8 T MT_EDIT_SET_COLOUR
000032b6 T mt_edit_set_color
000032b6 T MT_EDIT_SET_COLOR
000032c4 T mt_edit_set_font
000032c4 T MT_EDIT_SET_FONT
000032d2 T mt_edit_set_cursor
000032d2 T MT_EDIT_SET_CURSOR
000032e0 T mt_edit_resized
000032e0 T MT_EDIT_RESIZED
000032ee T mt_edit_set_dirty
000032ee T MT_EDIT_SET_DIRTY
000032fc T mt_edit_scroll
000032fc T MT_EDIT_SCROLL
0000330a T mt_EvntMulti
0000330a T MT_EVNTMULTI
00003318 T mt_form_wbutton
00003318 T MT_FORM_WBUTTON
00003326 T mt_form_xdial
00003326 T MT_FORM_XDIAL
00003334 T mt_form_xdo
00003334 T MT_FORM_XDO
00003342 T mt_form_xerr
00003342 T MT_FORM_XERR
00003350 T mt_graf_wwatchbox
00003350 T MT_GRAF_WWATCHBOX
0000335e T mt_graf_xhandle
0000335e T MT_GRAF_XHANDLE
0000336c T mt_wdlg_create
0000336c T MT_WDLG_CREATE
0000337a T mt_wdlg_open
0000337a T MT_WDLG_OPEN
00003388 T mt_wdlg_close
00003388 T MT_WDLG_CLOSE
00003396 T mt_wdlg_delete
00003396 T MT_WDLG_DELETE
000033a4 T mt_wdlg_get_tree
000033a4 T MT_WDLG_GET_TREE
000033b2 T mt_wdlg_get_edit
000033b2 T MT_WDLG_GET_EDIT
000033c0 T mt_wdlg_get_udata
000033c0 T MT_WDLG_GET_UDATA
000033ce T mt_wdlg_get_handle
000033ce T MT_WDLG_GET_HANDLE
000033dc T mt_wdlg_set_edit
000033dc T MT_WDLG_SET_EDIT
000033ea T mt_wdlg_set_tree
000033ea T MT_WDLG_SET_TREE
000033f8 T mt_wdlg_set_size
000033f8 T MT_WDLG_SET_SIZE
00003406 T mt_wdlg_set_iconify
00003406 T MT_WDLG_SET_ICONIFY
00003414 T mt_wdlg_set_uniconify
00003414 T MT_WDLG_SET_UNICONIFY
00003422 T mt_wdlg_evnt
00003422 T MT_WDLG_EVNT
00003430 T mt_wdlg_redraw
00003430 T MT_WDLG_REDRAW
0000343e T mt_wind_draw
0000343e T MT_WIND_DRAW
0000344c T mt_scrp_clear
0000344c T MT_SRCP_CLEAR
0000345a T mt_objc_xedit
0000345a T MT_OBJC_XEDIT
00003468 T mt_graf_rubbbox
00003468 T MT_GRAF_RUBBBOX
00003476 D errno
00003478 D _FilSysVec
;
