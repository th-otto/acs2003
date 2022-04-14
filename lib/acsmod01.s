* Object File "acsmod01.lib"



          .TEXT   

          .MODULE GLOBAL

Ax_mterm:
T000000:   MOVE.L    A2,-(A7)
T000002:   MOVE.L    A3,-(A7)
T000004:   MOVEA.L   A0,A3
T000006:   LEA.L     oldbas,A2
T00000c:   MOVE.L    (A2),D0
T00000e:   BEQ.B     T000040
T000010:   MOVEA.L   ACSblk,A0
T000016:   MOVE.W    $0236(A0),D1
T00001a:   BNE.B     T000022
T00001c:   MOVE.W    $0238(A0),D2
T000020:   BEQ.B     T00002C
T000022:   MOVEA.L   (A2),A0
T000024:   JSR       Mfree
T00002a:   BRA.B     T000040
T00002c:   JSR       accgemdos
T000032:   MOVEA.L   (A2),A0
T000034:   JSR       Mfree
T00003a:   JSR       oldgemdos
T000040:   MOVE.L    A3,(A2)
T000042:   MOVEA.L   (A7)+,A3
T000044:   MOVEA.L   (A7)+,A2
T000046:   RTS

          .ENDMOD


          .MODULE LOCAL

noop:
T000000:   RTS

          .ENDMOD


          .MODULE GLOBAL

Ash_module:
T000000:   MOVEM.L   D3/A2-A5,-(A7)
T000004:   MOVEA.L   A0,A3
T000006:   LEA.L     ACSblk,A2
T00000c:   MOVEA.L   (A2),A0
T00000e:   MOVE.W    $0236(A0),D0
T000012:   BNE.B     T00001E
T000014:   MOVE.W    $0238(A0),D1
T000018:   BNE.B     T00001E
T00001a:   MOVEQ.L   #$01,D3
T00001c:   BRA.B     T000020
T00001e:   CLR.W     D3
T000020:   TST.W     D3
T000022:   BEQ.B     T00002A
T000024:   JSR       accgemdos
T00002a:   LEA.L     nix,A5
T000030:   PEA.L     (A5)
T000032:   MOVEA.L   A5,A1
T000034:   MOVEA.L   A3,A0
T000036:   MOVEQ.L   #$03,D0
T000038:   JSR       Pexec
T00003e:   ADDQ.W    #4,A7
T000040:   MOVEA.L   D0,A5
T000042:   LEA.L     $0100(A5),A4
T000046:   TST.L     D0
T000048:   BMI       T000100
T00004c:   CMP.L     #$0000FFFF,D0
T000052:   BEQ       T000100
T000056:   MOVE.L    $000C(A5),D1
T00005a:   ADD.L     $0014(A5),D1
T00005e:   ADD.L     $001C(A5),D1
T000062:   ADD.L     #$00000400,D1
T000068:   MOVEA.L   A5,A0
T00006a:   CLR.W     D0
T00006c:   JSR       Mshrink
T000072:   TST.W     D0
T000074:   BEQ.B     T000082
T000076:   MOVEA.L   A3,A0
T000078:   MOVEQ.L   #$0F,D0
T00007a:   MOVEA.L   (A2),A1
T00007c:   MOVEA.L   $03D6(A1),A1
T000080:   JSR       (A1)
T000082:   CMPI.L    #$41435330,(A4)
T000088:   BLT.B     T000092
T00008a:   CMPI.L    #$41435338,(A4)
T000090:   BLE.B     T0000B0
T000092:   CMPI.L    #$42674E41,(A4)
T000098:   BNE.B     T0000B0
T00009a:   CMPI.L    #$41435339,$0004(A4)
T0000a2:   BNE.B     T0000B0
T0000a4:   MOVEA.L   A4,A0
T0000a6:   JSR       PushFuncLists
T0000ac:   TST.W     D0
T0000ae:   BNE.B     T0000D0
T0000b0:   MOVEA.L   A5,A0
T0000b2:   JSR       Mfree
T0000b8:   TST.W     D3
T0000ba:   BEQ.B     T0000C2
T0000bc:   JSR       oldgemdos
T0000c2:   MOVEA.L   A3,A0
T0000c4:   MOVEQ.L   #$0E,D0
T0000c6:   MOVEA.L   (A2),A1
T0000c8:   MOVEA.L   $03D6(A1),A1
T0000cc:   JSR       (A1)
T0000ce:   BRA.B     T000116
T0000d0:   TST.W     D3
T0000d2:   BEQ.B     T0000DA
T0000d4:   JSR       oldgemdos
T0000da:   CLR.L     -(A7)
T0000dc:   MOVEA.L   A5,A1
T0000de:   SUBA.L    A0,A0
T0000e0:   MOVEQ.L   #$04,D0
T0000e2:   JSR       Pexec
T0000e8:   ADDQ.W    #4,A7
T0000ea:   TST.L     D0
T0000ec:   BEQ.B     T00011A
T0000ee:   TST.W     D3
T0000f0:   BEQ.B     T0000F8
T0000f2:   JSR       accgemdos
T0000f8:   MOVEA.L   A5,A0
T0000fa:   JSR       Mfree
T000100:   TST.W     D3
T000102:   BEQ.B     T00010A
T000104:   JSR       oldgemdos
T00010a:   MOVEA.L   A3,A0
T00010c:   MOVEQ.L   #$0D,D0
T00010e:   MOVEA.L   (A2),A1
T000110:   MOVEA.L   $03D6(A1),A1
T000114:   JSR       (A1)
T000116:   MOVEQ.L   #-$01,D0
T000118:   BRA.B     T000124
T00011a:   MOVEA.L   $0008(A4),A5
T00011e:   MOVE.L    (A2),$000C(A4)
T000122:   JSR       (A5)
T000124:   MOVEM.L   (A7)+,D3/A2-A5
T000128:   RTS

          .ENDMOD


          .MODULE LOCAL

PushFuncLists:
T000000:   MOVEM.L   A2-A4,-(A7)
T000004:   LEA.L     $0014(A0),A1
T000008:   LEA.L     funcs,A2
T00000e:   LEA.L     funcsAnz,A3
T000014:   MOVE.L    $0010(A0),D1
T000018:   CMP.L     (A3),D1
T00001a:   BNE.B     T000048
T00001c:   CLR.W     D0
T00001e:   BRA.B     T000052
T000020:   MOVE.W    $0004(A1),D1
T000024:   CLR.L     (A1)
T000026:   CLR.W     D2
T000028:   MOVEA.L   (A2),A0
T00002a:   BRA.B     T000038
T00002c:   CMP.W     $0004(A0),D1
T000030:   BNE.B     T000034
T000032:   MOVE.L    (A0),(A1)
T000034:   ADDQ.W    #1,D2
T000036:   ADDQ.W    #6,A0
T000038:   TST.L     (A1)
T00003a:   BNE.B     T000044
T00003c:   MOVEA.L   $0004(A2),A4
T000040:   CMP.W     (A4),D2
T000042:   BLT.B     T00002C
T000044:   MOVE.L    (A1),D1
T000046:   BNE.B     T00004C
T000048:   CLR.W     D0
T00004a:   BRA.B     T00005C
T00004c:   ADDQ.W    #1,D0
T00004e:   ADDQ.W    #6,A1
T000050:   ADDQ.W    #8,A2
T000052:   MOVE.W    D0,D1
T000054:   EXT.L     D1
T000056:   CMP.L     (A3),D1
T000058:   BLT.B     T000020
T00005a:   MOVEQ.L   #$01,D0
T00005c:   MOVEM.L   (A7)+,A2-A4
T000060:   RTS

          .ENDMOD



          .DATA   

          .MODULE LOCAL

oldbas:
D000000:   .DC.W   $0000, $0000
nix:
D000004:   .DC.W   $0000, $0000

          .ENDMOD


          .MODULE LOCAL

func1Abp:
D000000:   .DC.L   Abp_create
D000004:   .DC.L   Abp_delete
D000008:   .DC.L   Abp_start
D00000c:   .DC.L   Abp_end
D000010:   .DC.L   Abp_mfdb2img
D000014:   .DC.L   Abp_img2mfdb
funcAbp:
D000018:   .DC.L   func1Abp
D00001c:   .DC.W   $0000
funcAnzAbp:
D00001e:   .DC.W   $0001
func1Acfg:
D000020:   .DC.L   Acfg_create
D000024:   .DC.L   Acfg_delete
D000028:   .DC.L   Acfg_clear
D00002c:   .DC.L   Acfg_clearAllGroups
D000030:   .DC.L   Acfg_clearGroup
D000034:   .DC.L   Acfg_load
D000038:   .DC.L   Acfg_save
D00003c:   .DC.L   Acfg_isChanged
D000040:   .DC.L   Acfg_getValue
D000044:   .DC.L   Acfg_setValue
D000048:   .DC.L   Acfg_clearValue
D00004c:   .DC.L   Acfg_getChar
D000050:   .DC.L   Acfg_setChar
D000054:   .DC.L   Acfg_getLong
D000058:   .DC.L   Acfg_setLong
D00005c:   .DC.L   Acfg_getString
D000060:   .DC.L   Acfg_getBool
D000064:   .DC.L   Acfg_setBool
D000068:   .DC.L   Acfg_clearHeader
D00006c:   .DC.L   Acfg_headAnzahl
D000070:   .DC.L   Acfg_setHeader
D000074:   .DC.L   Acfg_getHeader
D000078:   .DC.L   Acfg_grpAnzahl
D00007c:   .DC.L   Acfg_grpName
D000080:   .DC.L   Acfg_strAnzahl
D000084:   .DC.L   Acfg_strName
D000088:   .DC.L   Acfg_strValue
D00008c:   .DC.L   Acfg_strIsComment
D000090:   .DC.L   Acfg_isCfgfile
D000094:   .DC.L   Acfg_createInfo
D000098:   .DC.L   Acfg_deleteInfo
D00009c:   .DC.L   Acfg_setInfo
D0000a0:   .DC.L   Acfg_getInfo
D0000a4:   .DC.L   Acfg_copyInfo
D0000a8:   .DC.L   Acfg_flags
D0000ac:   .DC.L   Acfg_isGroupPresent
D0000b0:   .DC.L   Acfg_isStringPresent
funcAcfg:
D0000b4:   .DC.L   func1Acfg
D0000b8:   .DC.W   $0000
funcAnzAcfg:
D0000ba:   .DC.W   $0001
func1Ach:
D0000bc:   .DC.L   Ach_tolower
D0000c0:   .DC.L   Ach_toupper
D0000c4:   .DC.L   Ach_isWhite
funcAch:
D0000c8:   .DC.L   func1Ach
D0000cc:   .DC.W   $0000
funcAnzAch:
D0000ce:   .DC.W   $0001
func1Adr:
D0000d0:   .DC.L   Adr_box
D0000d4:   .DC.L   Adr_drag
D0000d8:   .DC.L   Adr_next
D0000dc:   .DC.L   Adr_add
D0000e0:   .DC.L   Adr_del
D0000e4:   .DC.L   Adr_unselect
D0000e8:   .DC.L   Adr_start
funcAdr:
D0000ec:   .DC.L   func1Adr
D0000f0:   .DC.W   $0000
funcAnzAdr:
D0000f2:   .DC.W   $0001
func1Aev:
D0000f4:   .DC.L   Aev_quit
D0000f8:   .DC.L   Aev_release
D0000fc:   .DC.L   Aev_mess
D000100:   .DC.L   Aev_unhidepointer
D000104:   .DC.L   Aev_DhstAdd
D000108:   .DC.L   Aev_DhstSaved
D00010c:   .DC.L   Aev_WmRedraw
funcAev:
D000110:   .DC.L   func1Aev
D000114:   .DC.W   $0000
funcAnzAev:
D000116:   .DC.W   $0001
func1Af:
D000118:   .DC.L   Af_cfgfile
D00011c:   .DC.L   Af_select
D000120:   .DC.L   Af_2drv
D000124:   .DC.L   Af_2path
D000128:   .DC.L   Af_2name
D00012c:   .DC.L   Af_2fullname
D000130:   .DC.L   Af_2ext
D000134:   .DC.L   Af_buildname
D000138:   .DC.L   Af_length
D00013c:   .DC.L   Af_first_fsel
D000140:   .DC.L   Af_next_fsel
D000144:   .DC.L   Af_first
D000148:   .DC.L   Af_next
D00014c:   .DC.L   Af_readdir
D000150:   .DC.L   Af_freedir
D000154:   .DC.L   Af_fileselect
D000158:   .DC.L   Af_quote
D00015c:   .DC.L   Af_unquote
funcAf:
D000160:   .DC.L   func1Af
D000164:   .DC.W   $0000
funcAnzAf:
D000166:   .DC.W   $0001
func1Aic:
D000168:   .DC.L   Aic_create
D00016c:   .DC.L   Aic_delete
funcAic:
D000170:   .DC.L   func1Aic
D000174:   .DC.W   $0000
funcAnzAic:
D000176:   .DC.W   $0001
func1Aim:
D000178:   .DC.L   Aim_create
D00017c:   .DC.L   Aim_delete
funcAim:
D000180:   .DC.L   func1Aim
D000184:   .DC.W   $0000
funcAnzAim:
D000186:   .DC.W   $0001
func1Alu:
D000188:   .DC.L   Alu_create
D00018c:   .DC.L   Alu_delete
funcAlu:
D000190:   .DC.L   func1Alu
D000194:   .DC.W   $0000
funcAnzAlu:
D000196:   .DC.W   $0001
func1Ame:
D000198:   .DC.L   Ame_namefix
D00019c:   .DC.L   Ame_popup
funcAme:
D0001a0:   .DC.L   func1Ame
D0001a4:   .DC.W   $0000
funcAnzAme:
D0001a6:   .DC.W   $0001
func1Amo:
D0001a8:   .DC.L   Amo_new
D0001ac:   .DC.L   Amo_busy
D0001b0:   .DC.L   Amo_unbusy
D0001b4:   .DC.L   Amo_hide
D0001b8:   .DC.L   Amo_show
funcAmo:
D0001bc:   .DC.L   func1Amo
D0001c0:   .DC.W   $0000
funcAnzAmo:
D0001c2:   .DC.W   $0001
func1Aob:
D0001c4:   .DC.L   Aob_create
D0001c8:   .DC.L   Aob_delete
D0001cc:   .DC.L   Aob_fix
D0001d0:   .DC.L   Aob_offset
D0001d4:   .DC.L   Aob_save
D0001d8:   .DC.L   Aob_restore
D0001dc:   .DC.L   Aob_watch
D0001e0:   .DC.L   Aob_findflag
D0001e4:   .DC.L   Aob_alias
D0001e8:   .DC.L   Aob_up
D0001ec:   .DC.L   Aob_icon
D0001f0:   .DC.L   Aob_puttext
D0001f4:   .DC.L   Aob_gettext
D0001f8:   .DC.L   Aob_within
D0001fc:   .DC.L   Aob_printf
D000200:   .DC.L   Aob_scanf
D000204:   .DC.L   Aob_flags
D000208:   .DC.L   Aob_state
D00020c:   .DC.L   Aob_service
D000210:   .DC.L   Aob_visible
D000214:   .DC.L   Aob_count
funcAob:
D000218:   .DC.L   func1Aob
D00021c:   .DC.W   $0000
funcAnzAob:
D00021e:   .DC.W   $0001
func1Ascrp:
D000220:   .DC.L   Ascrp_clear
D000224:   .DC.L   Ascrp_get
D000228:   .DC.L   Ascrp_put
funcAscrp:
D00022c:   .DC.L   func1Ascrp
D000230:   .DC.W   $0000
funcAnzAscrp:
D000232:   .DC.W   $0001
func1Ash:
D000234:   .DC.L   Ash_prog
D000238:   .DC.L   Ash_error
D00023c:   .DC.L   Ash_getcookie
D000240:   .DC.L   Ash_getenv
D000244:   .DC.L   Ash_nextdd
D000248:   .DC.L   Ash_sendall
D00024c:   .DC.L   Ash_CallEdDI
D000250:   .DC.L   Ash_NVDICookie
D000254:   .DC.L   Ash_NVDIVersion
D000258:   .DC.L   Ash_NVDIDatum
D00025c:   .DC.L   Ash_thermometer
D000260:   .DC.L   Ash_fileselect
D000264:   .DC.L   Ash_font
D000268:   .DC.L   Ash_print
D00026c:   .DC.L   Ash_gettimer
D000270:   .DC.L   Ash_printSetIcon
D000274:   .DC.L   Ash_fontSetIcon
D000278:   .DC.L   Ash_fileSetIcon
D00027c:   .DC.L   Ash_getOSHeader
D000280:   .DC.L   Ash_getMagiC
D000284:   .DC.L   Ash_getNAES
D000288:   .DC.L   Ash_getMagiCVersion
D00028c:   .DC.L   Ash_getMagiCAESVars
funcAsh:
D000290:   .DC.L   func1Ash
D000294:   .DC.W   $0000
funcAnzAsh:
D000296:   .DC.W   $0001
func1Ast:
D000298:   .DC.L   Ast_create
D00029c:   .DC.L   Ast_delete
D0002a0:   .DC.L   Ast_tolower
D0002a4:   .DC.L   Ast_toupper
D0002a8:   .DC.L   Ast_ltrim
D0002ac:   .DC.L   Ast_rtrim
D0002b0:   .DC.L   Ast_alltrim
D0002b4:   .DC.L   Ast_cmp
D0002b8:   .DC.L   Ast_icmp
D0002bc:   .DC.L   Ast_isEmpty
D0002c0:   .DC.L   Ast_add
D0002c4:   .DC.L   Ast_adl
D0002c8:   .DC.L   Ast_adr
D0002cc:   .DC.L   Ast_adc
D0002d0:   .DC.L   Ast_filter
D0002d4:   .DC.L   Ast_count
D0002d8:   .DC.L   Ast_fcmp
D0002dc:   .DC.L   Ast_ncmp
D0002e0:   .DC.L   Ast_incmp
D0002e4:   .DC.L   Ast_istr
funcAst:
D0002e8:   .DC.L   func1Ast
D0002ec:   .DC.W   $0000
funcAnzAst:
D0002ee:   .DC.W   $0001
func1Ate:
D0002f0:   .DC.L   Ate_create
D0002f4:   .DC.L   Ate_delete
funcAte:
D0002f8:   .DC.L   func1Ate
D0002fc:   .DC.W   $0000
funcAnzAte:
D0002fe:   .DC.W   $0001
func1Auo:
D000300:   .DC.L   Auo_ftext
D000304:   .DC.L   Auo_string
D000308:   .DC.L   Auo_cycle
D00030c:   .DC.L   Auo_picture
D000310:   .DC.L   Auo_boxed
funcAuo:
D000314:   .DC.L   func1Auo
D000318:   .DC.W   $0000
funcAnzAuo:
D00031a:   .DC.W   $0001
func1Aus:
D00031c:   .DC.L   Aus_create
D000320:   .DC.L   Aus_delete
D000324:   .DC.L   Aus_boxed
D000328:   .DC.L   Aus_cycle
funcAus:
D00032c:   .DC.L   func1Aus
D000330:   .DC.W   $0000
funcAnzAus:
D000332:   .DC.W   $0001
func1Awi:
D000334:   .DC.L   Awi_wid
D000338:   .DC.L   Awi_root
D00033c:   .DC.L   Awi_list
D000340:   .DC.L   Awi_sendall
D000344:   .DC.L   Awi_down
D000348:   .DC.L   Awi_up
D00034c:   .DC.L   Awi_show
D000350:   .DC.L   Awi_init
D000354:   .DC.L   Awi_create
D000358:   .DC.L   Awi_open
D00035c:   .DC.L   Awi_closed
D000360:   .DC.L   Awi_delete
D000364:   .DC.L   Awi_topped
D000368:   .DC.L   Awi_fulled
D00036c:   .DC.L   Awi_sized
D000370:   .DC.L   Awi_moved
D000374:   .DC.L   Awi_diaend
D000378:   .DC.L   Awi_diastart
D00037c:   .DC.L   Awi_keys
D000380:   .DC.L   Awi_obview
D000384:   .DC.L   Awi_service
D000388:   .DC.L   Awi_scroll
D00038c:   .DC.L   Awi_obchange
D000390:   .DC.L   Awi_obredraw
D000394:   .DC.L   Awi_redraw
D000398:   .DC.L   Awi_arrowed
D00039c:   .DC.L   Awi_hslid
D0003a0:   .DC.L   Awi_vslid
D0003a4:   .DC.L   Awi_iconify
D0003a8:   .DC.L   Awi_uniconify
D0003ac:   .DC.L   Awi_gemscript
D0003b0:   .DC.L   Awi_modal
D0003b4:   .DC.L   Awi_dialog
D0003b8:   .DC.L   Awi_alert
D0003bc:   .DC.L   Awi_selfcreate
D0003c0:   .DC.L   Awi_nokey
D0003c4:   .DC.L   Awi_update
D0003c8:   .DC.L   Awi_uoself
D0003cc:   .DC.L   Awi_doform
D0003d0:   .DC.L   Awi_observice
D0003d4:   .DC.L   Awi_ontop
D0003d8:   .DC.L   Awi_layout
D0003dc:   .DC.L   Awi_obvisible
funcAwi:
D0003e0:   .DC.L   func1Awi
D0003e4:   .DC.W   $0000
funcAnzAwi:
D0003e6:   .DC.W   $0001
func1A:
D0003e8:   .DC.L   A_dialog
D0003ec:   .DC.L   A_checkbox
D0003f0:   .DC.L   A_radiobutton
D0003f4:   .DC.L   A_innerframe
D0003f8:   .DC.L   A_pattern
D0003fc:   .DC.L   A_arrows
D000400:   .DC.L   A_select
D000404:   .DC.L   A_ftext
D000408:   .DC.L   A_title
D00040c:   .DC.L   A_3Dbutton
D000410:   .DC.L   A_cycle
D000414:   .DC.L   A_picture
D000418:   .DC.L   A_dialog2
D00041c:   .DC.L   A_boxed
funcA:
D000420:   .DC.L   func1A
D000424:   .DC.W   $0000
funcAnzA:
D000426:   .DC.W   $0001
func1Sonst:
D000428:   .DC.L   Ax_malloc
D00042c:   .DC.L   Ax_free
D000430:   .DC.L   Ax_ifree
D000434:   .DC.L   Ax_glmalloc
D000438:   .DC.L   Ax_glfree
D00043c:   .DC.L   Ax_mterm
D000440:   .DC.L   alert_str
D000444:   .DC.L   intersect
D000448:   .DC.L   xywh2array
D00044c:   .DC.L   array2xywh
D000450:   .DC.L   dotted_xline
D000454:   .DC.L   dotted_yline
D000458:   .DC.L   nkc_tos2n
D00045c:   .DC.L   nkc_n2tos
D000460:   .DC.L   nkc_gem2n
D000464:   .DC.L   nkc_n2gem
D000468:   .DC.L   nkc_gemks2n
D00046c:   .DC.L   nkc_n2gemks
D000470:   .DC.L   nkc_n2kstate
D000474:   .DC.L   nkc_kstate
D000478:   .DC.L   nkc_cmp
D00047c:   .DC.L   nkc_tolower
D000480:   .DC.L   nkc_toupper
D000484:   .DC.L   appl_getinfo
D000488:   .DC.L   Ax_setRecycleSize
D00048c:   .DC.L   Ax_getRecycleStat
D000490:   .DC.L   Ax_recycle
D000494:   .DC.L   Avdi_getRGB
funcSonst:
D000498:   .DC.L   func1Sonst
D00049c:   .DC.W   $0000
funcAnzSonst:
D00049e:   .DC.W   $0001
func1Vdi:
D0004a0:   .DC.L   vdi
D0004a4:   .DC.L   vdi_
D0004a8:   .DC.L   v_opnwk
D0004ac:   .DC.L   v_clswk
D0004b0:   .DC.L   v_opnvwk
D0004b4:   .DC.L   v_clsvwk
D0004b8:   .DC.L   v_clrwk
D0004bc:   .DC.L   v_updwk
D0004c0:   .DC.L   v_opnbm
D0004c4:   .DC.L   v_clsbm
D0004c8:   .DC.L   vst_load_fonts
D0004cc:   .DC.L   vst_unload_fonts
D0004d0:   .DC.L   vs_clip
D0004d4:   .DC.L   v_pline
D0004d8:   .DC.L   v_pmarker
D0004dc:   .DC.L   v_gtext
D0004e0:   .DC.L   v_fillarea
D0004e4:   .DC.L   v_cellarray
D0004e8:   .DC.L   v_contourfill
D0004ec:   .DC.L   v_bar
D0004f0:   .DC.L   v_arc
D0004f4:   .DC.L   v_pieslice
D0004f8:   .DC.L   v_circle
D0004fc:   .DC.L   v_ellipse
D000500:   .DC.L   v_ellarc
D000504:   .DC.L   v_ellpie
D000508:   .DC.L   v_justified
D00050c:   .DC.L   vr_recfl
D000510:   .DC.L   v_rfbox
D000514:   .DC.L   v_rbox
D000518:   .DC.L   vq_gdos
D00051c:   .DC.L   vswr_mode
D000520:   .DC.L   vsl_type
D000524:   .DC.L   vsl_udsty
D000528:   .DC.L   vsl_width
D00052c:   .DC.L   vsl_color
D000530:   .DC.L   vsl_ends
D000534:   .DC.L   vsm_type
D000538:   .DC.L   vsm_height
D00053c:   .DC.L   vsm_color
D000540:   .DC.L   vst_height
D000544:   .DC.L   vst_point
D000548:   .DC.L   vst_rotation
D00054c:   .DC.L   vst_font
D000550:   .DC.L   vst_color
D000554:   .DC.L   vst_effects
D000558:   .DC.L   vst_alignment
D00055c:   .DC.L   vsf_interior
D000560:   .DC.L   vsf_style
D000564:   .DC.L   vsf_color
D000568:   .DC.L   vsf_perimeter
D00056c:   .DC.L   vsf_udpat
D000570:   .DC.L   vsf_updat
D000574:   .DC.L   vs_color
D000578:   .DC.L   vr_trnfm
D00057c:   .DC.L   vro_cpyfm
D000580:   .DC.L   vrt_cpyfm
D000584:   .DC.L   v_get_pixel
D000588:   .DC.L   vsin_mode
D00058c:   .DC.L   vrq_locator
D000590:   .DC.L   vsm_locator
D000594:   .DC.L   vrq_valuator
D000598:   .DC.L   vsm_valuator
D00059c:   .DC.L   vrq_choice
D0005a0:   .DC.L   vsm_choice
D0005a4:   .DC.L   vrq_string
D0005a8:   .DC.L   vsm_string
D0005ac:   .DC.L   vex_timv
D0005b0:   .DC.L   v_show_c
D0005b4:   .DC.L   v_hide_c
D0005b8:   .DC.L   vq_mouse
D0005bc:   .DC.L   vex_butv
D0005c0:   .DC.L   vex_motv
D0005c4:   .DC.L   vex_curv
D0005c8:   .DC.L   vq_key_s
D0005cc:   .DC.L   vq_extnd
D0005d0:   .DC.L   vql_attributes
D0005d4:   .DC.L   vqm_attributes
D0005d8:   .DC.L   vqf_attributes
D0005dc:   .DC.L   vqt_attributes
D0005e0:   .DC.L   vqt_extent
D0005e4:   .DC.L   vqt_width
D0005e8:   .DC.L   vqt_name
D0005ec:   .DC.L   vqin_mode
D0005f0:   .DC.L   vqt_fontinfo
D0005f4:   .DC.L   vq_scrninfo
D0005f8:   .DC.L   vq_color
D0005fc:   .DC.L   vq_cellarray
D000600:   .DC.L   vq_chcells
D000604:   .DC.L   v_exit_cur
D000608:   .DC.L   v_enter_cur
D00060c:   .DC.L   v_curup
D000610:   .DC.L   v_curdown
D000614:   .DC.L   v_curright
D000618:   .DC.L   v_curleft
D00061c:   .DC.L   v_curhome
D000620:   .DC.L   v_eeos
D000624:   .DC.L   v_eeol
D000628:   .DC.L   v_curaddress
D00062c:   .DC.L   v_curtext
D000630:   .DC.L   v_rvon
D000634:   .DC.L   v_rvoff
D000638:   .DC.L   vq_curaddress
D00063c:   .DC.L   vq_tabstatus
D000640:   .DC.L   v_hardcopy
D000644:   .DC.L   v_dspcur
D000648:   .DC.L   v_rmcur
D00064c:   .DC.L   v_form_adv
D000650:   .DC.L   v_clear_disp_list
D000654:   .DC.L   vq_scan
D000658:   .DC.L   v_alpha_text
D00065c:   .DC.L   vs_palette
D000660:   .DC.L   v_sound
D000664:   .DC.L   vs_mute
D000668:   .DC.L   vt_resolution
D00066c:   .DC.L   vt_axis
D000670:   .DC.L   vt_origin
D000674:   .DC.L   vq_tdimensions
D000678:   .DC.L   vt_alignment
D00067c:   .DC.L   vsp_film
D000680:   .DC.L   vqp_filmname
D000684:   .DC.L   vsc_expose
D000688:   .DC.L   v_meta_extents
D00068c:   .DC.L   v_write_meta
D000690:   .DC.L   vm_pagesize
D000694:   .DC.L   vm_coords
D000698:   .DC.L   vm_filename
D00069c:   .DC.L   v_offset
D0006a0:   .DC.L   v_fontinit
D0006a4:   .DC.L   v_escape2000
D0006a8:   .DC.L   v_output_window
D0006ac:   .DC.L   v_bit_image
D0006b0:   .DC.L   fix31ToPixel
D0006b4:   .DC.L   v_opnprn
D0006b8:   .DC.L   v_opnmeta
D0006bc:   .DC.L   vq_devinfo
D0006c0:   .DC.L   vq_ext_devinfo
D0006c4:   .DC.L   vs_calibrate
D0006c8:   .DC.L   vq_calibrate
D0006cc:   .DC.L   v_bez
D0006d0:   .DC.L   v_bez_on
D0006d4:   .DC.L   v_bez_off
D0006d8:   .DC.L   v_bez_qual
D0006dc:   .DC.L   v_bez_fill
D0006e0:   .DC.L   vqt_ext_name
D0006e4:   .DC.L   vqt_char_index
D0006e8:   .DC.L   vqt_isCharAvailable
D0006ec:   .DC.L   vqt_xfntinfo
D0006f0:   .DC.L   vst_name
D0006f4:   .DC.L   vqt_name_and_id
D0006f8:   .DC.L   vqt_fontheader
D0006fc:   .DC.L   vqt_trackkern
D000700:   .DC.L   vqt_pairkern
D000704:   .DC.L   vst_charmap
D000708:   .DC.L   vst_kern
D00070c:   .DC.L   vst_kern_offset
D000710:   .DC.L   v_getbitmap_info
D000714:   .DC.L   vqt_f_extent
D000718:   .DC.L   vqt_real_extent
D00071c:   .DC.L   v_ftext
D000720:   .DC.L   v_ftext_offset
D000724:   .DC.L   v_getoutline
D000728:   .DC.L   vst_arbpt32
D00072c:   .DC.L   vqt_advance32
D000730:   .DC.L   vst_setsize32
D000734:   .DC.L   vst_skew
D000738:   .DC.L   v_orient
D00073c:   .DC.L   v_trays
D000740:   .DC.L   vq_tray_names
D000744:   .DC.L   v_page_size
D000748:   .DC.L   vq_page_name
D00074c:   .DC.L   vst_fg_color
D000750:   .DC.L   vsf_fg_color
D000754:   .DC.L   vsl_fg_color
D000758:   .DC.L   vsm_fg_color
D00075c:   .DC.L   vsr_fg_color
D000760:   .DC.L   vst_bg_color
D000764:   .DC.L   vsf_bg_color
D000768:   .DC.L   vsl_bg_color
D00076c:   .DC.L   vsm_bg_color
D000770:   .DC.L   vsr_bg_color
D000774:   .DC.L   vqt_fg_color
D000778:   .DC.L   vqf_fg_color
D00077c:   .DC.L   vql_fg_color
D000780:   .DC.L   vqm_fg_color
D000784:   .DC.L   vqr_fg_color
D000788:   .DC.L   vqt_bg_color
D00078c:   .DC.L   vqf_bg_color
D000790:   .DC.L   vql_bg_color
D000794:   .DC.L   vqm_bg_color
D000798:   .DC.L   vqr_bg_color
D00079c:   .DC.L   v_color2value
D0007a0:   .DC.L   v_value2color
D0007a4:   .DC.L   v_color2nearest
D0007a8:   .DC.L   vq_px_format
D0007ac:   .DC.L   vs_ctab
D0007b0:   .DC.L   vs_ctab_entry
D0007b4:   .DC.L   vs_dflt_ctab
D0007b8:   .DC.L   vq_ctab
D0007bc:   .DC.L   vq_ctab_entry
D0007c0:   .DC.L   vq_ctab_id
D0007c4:   .DC.L   v_ctab_idx2vdi
D0007c8:   .DC.L   v_ctab_vdi2idx
D0007cc:   .DC.L   v_ctab_idx2value
D0007d0:   .DC.L   v_get_ctab_id
D0007d4:   .DC.L   vq_dflt_ctab
D0007d8:   .DC.L   v_create_itab
D0007dc:   .DC.L   v_delete_itab
D0007e0:   .DC.L   vr_transfer_bits
D0007e4:   .DC.L   vs_hilite_color
D0007e8:   .DC.L   vs_min_color
D0007ec:   .DC.L   vs_max_color
D0007f0:   .DC.L   vs_weight_color
D0007f4:   .DC.L   vq_hilite_color
D0007f8:   .DC.L   vq_min_color
D0007fc:   .DC.L   vq_max_color
D000800:   .DC.L   vq_weight_color
D000804:   .DC.L   vs_document_info
D000808:   .DC.L   vq_prn_scaling
D00080c:   .DC.L   v_open_bm
D000810:   .DC.L   v_resize_bm
D000814:   .DC.L   v_get_outline
D000818:   .DC.L   vst_track_offset
D00081c:   .DC.L   vst_arbpt
D000820:   .DC.L   vqt_advance
D000824:   .DC.L   vst_setsize
D000828:   .DC.L   vq_vgdos
D00082c:   .DC.L   vst_width
D000830:   .DC.L   vst_scratch
D000834:   .DC.L   vst_error
D000838:   .DC.L   v_savecache
D00083c:   .DC.L   v_loadcache
D000840:   .DC.L   v_flushcache
D000844:   .DC.L   vqt_cachesize
D000848:   .DC.L   vqt_get_table
D00084c:   .DC.L   vs_curaddress
D000850:   .DC.L   vsf_perimeter3
D000854:   .DC.L   vqt_justified
D000858:   .DC.L   v_opnprnwrk
D00085c:   .DC.L   v_opnmatrixprn
D000860:   .DC.L   v_set_app_buff
D000864:   .DC.L   vqt_devinfo
D000868:   .DC.L   v_create_ctab
D00086c:   .DC.L   v_delete_ctab
D000870:   .DC.L   v_setrgb
funcVdi:
D000874:   .DC.L   func1Vdi
D000878:   .DC.W   $0000
funcAnzVdi:
D00087a:   .DC.W   $0001
func1Aes:
D00087c:   .DC.L   aes
D000880:   .DC.L   appl_init
D000884:   .DC.L   appl_read
D000888:   .DC.L   appl_write
D00088c:   .DC.L   appl_find
D000890:   .DC.L   appl_search
D000894:   .DC.L   appl_tplay
D000898:   .DC.L   appl_trecord
D00089c:   .DC.L   appl_yield
D0008a0:   .DC.L   appl_exit
D0008a4:   .DC.L   appl_getinfo
D0008a8:   .DC.L   appl_control
D0008ac:   .DC.L   evnt_keybd
D0008b0:   .DC.L   evnt_button
D0008b4:   .DC.L   evnt_mouse
D0008b8:   .DC.L   evnt_mesag
D0008bc:   .DC.L   evnt_timer
D0008c0:   .DC.L   evnt_event
D0008c4:   .DC.L   evnt_multi
D0008c8:   .DC.L   evnt_dclick
D0008cc:   .DC.L   menu_bar
D0008d0:   .DC.L   menu_icheck
D0008d4:   .DC.L   menu_ienable
D0008d8:   .DC.L   menu_tnormal
D0008dc:   .DC.L   menu_text
D0008e0:   .DC.L   menu_register
D0008e4:   .DC.L   menu_unregister
D0008e8:   .DC.L   menu_click
D0008ec:   .DC.L   menu_attach
D0008f0:   .DC.L   menu_istart
D0008f4:   .DC.L   menu_popup
D0008f8:   .DC.L   menu_settings
D0008fc:   .DC.L   objc_add
D000900:   .DC.L   objc_delete
D000904:   .DC.L   objc_draw
D000908:   .DC.L   objc_find
D00090c:   .DC.L   objc_offset
D000910:   .DC.L   objc_order
D000914:   .DC.L   objc_edit
D000918:   .DC.L   objc_change
D00091c:   .DC.L   objc_sysvar
D000920:   .DC.L   form_do
D000924:   .DC.L   form_dial
D000928:   .DC.L   form_alert
D00092c:   .DC.L   form_error
D000930:   .DC.L   form_center
D000934:   .DC.L   form_keybd
D000938:   .DC.L   form_button
D00093c:   .DC.L   graf_rubbox
D000940:   .DC.L   graf_rubberbox
D000944:   .DC.L   graf_dragbox
D000948:   .DC.L   graf_mbox
D00094c:   .DC.L   graf_movebox
D000950:   .DC.L   graf_growbox
D000954:   .DC.L   graf_shrinkbox
D000958:   .DC.L   graf_watchbox
D00095c:   .DC.L   graf_slidebox
D000960:   .DC.L   graf_handle
D000964:   .DC.L   graf_mouse
D000968:   .DC.L   graf_mkstate
D00096c:   .DC.L   graf_multirubber
D000970:   .DC.L   scrp_read
D000974:   .DC.L   scrp_write
D000978:   .DC.L   fsel_input
D00097c:   .DC.L   fsel_exinput
D000980:   .DC.L   fsel_boxinput
D000984:   .DC.L   fslx_open
D000988:   .DC.L   fslx_close
D00098c:   .DC.L   fslx_getnxtfile
D000990:   .DC.L   fslx_evnt
D000994:   .DC.L   fslx_do
D000998:   .DC.L   fslx_set_flags
D00099c:   .DC.L   wind_create
D0009a0:   .DC.L   wind_open
D0009a4:   .DC.L   wind_close
D0009a8:   .DC.L   wind_delete
D0009ac:   .DC.L   wind_get
D0009b0:   .DC.L   wind_getQSB
D0009b4:   .DC.L   wind_set
D0009b8:   .DC.L   wind_find
D0009bc:   .DC.L   wind_update
D0009c0:   .DC.L   wind_calc
D0009c4:   .DC.L   wind_new
D0009c8:   .DC.L   rsrc_load
D0009cc:   .DC.L   rsrc_free
D0009d0:   .DC.L   rsrc_gaddr
D0009d4:   .DC.L   rsrc_saddr
D0009d8:   .DC.L   rsrc_obfix
D0009dc:   .DC.L   rsrc_rcfix
D0009e0:   .DC.L   shel_read
D0009e4:   .DC.L   shel_write
D0009e8:   .DC.L   shel_get
D0009ec:   .DC.L   shel_put
D0009f0:   .DC.L   shel_find
D0009f4:   .DC.L   shel_envrn
D0009f8:   .DC.L   shel_help
D0009fc:   .DC.L   fnts_add
D000a00:   .DC.L   fnts_close
D000a04:   .DC.L   fnts_create
D000a08:   .DC.L   fnts_delete
D000a0c:   .DC.L   fnts_do
D000a10:   .DC.L   fnts_evnt
D000a14:   .DC.L   fnts_get_info
D000a18:   .DC.L   fnts_get_name
D000a1c:   .DC.L   fnts_get_no_styles
D000a20:   .DC.L   fnts_get_style
D000a24:   .DC.L   fnts_open
D000a28:   .DC.L   fnts_remove
D000a2c:   .DC.L   fnts_update
D000a30:   .DC.L   lbox_ascroll_to
D000a34:   .DC.L   lbox_scroll_to
D000a38:   .DC.L   lbox_bscroll_to
D000a3c:   .DC.L   lbox_cnt_items
D000a40:   .DC.L   lbox_create
D000a44:   .DC.L   lbox_delete
D000a48:   .DC.L   lbox_do
D000a4c:   .DC.L   lbox_free_items
D000a50:   .DC.L   lbox_free_list
D000a54:   .DC.L   lbox_get_afirst
D000a58:   .DC.L   lbox_get_first
D000a5c:   .DC.L   lbox_get_avis
D000a60:   .DC.L   lbox_get_visible
D000a64:   .DC.L   lbox_get_bentries
D000a68:   .DC.L   lbox_get_bfirst
D000a6c:   .DC.L   lbox_get_idx
D000a70:   .DC.L   lbox_get_item
D000a74:   .DC.L   lbox_get_items
D000a78:   .DC.L   lbox_get_slct_idx
D000a7c:   .DC.L   lbox_get_slct_item
D000a80:   .DC.L   lbox_get_tree
D000a84:   .DC.L   lbox_get_udata
D000a88:   .DC.L   lbox_set_asldr
D000a8c:   .DC.L   lbox_set_slider
D000a90:   .DC.L   lbox_set_bentries
D000a94:   .DC.L   lbox_set_bsldr
D000a98:   .DC.L   lbox_set_items
D000a9c:   .DC.L   lbox_update
D000aa0:   .DC.L   pdlg_add_printers
D000aa4:   .DC.L   pdlg_add_sub_dialogs
D000aa8:   .DC.L   pdlg_close
D000aac:   .DC.L   pdlg_create
D000ab0:   .DC.L   pdlg_delete
D000ab4:   .DC.L   pdlg_dflt_settings
D000ab8:   .DC.L   pdlg_do
D000abc:   .DC.L   pdlg_evnt
D000ac0:   .DC.L   pdlg_free_settings
D000ac4:   .DC.L   pdlg_get_setsize
D000ac8:   .DC.L   pdlg_new_settings
D000acc:   .DC.L   pdlg_open
D000ad0:   .DC.L   pdlg_remove_printers
D000ad4:   .DC.L   pdlg_remove_sub_dialogs
D000ad8:   .DC.L   pdlg_update
D000adc:   .DC.L   pdlg_use_settings
D000ae0:   .DC.L   pdlg_validate_settings
D000ae4:   .DC.L   edit_create
D000ae8:   .DC.L   edit_set_buf
D000aec:   .DC.L   edit_open
D000af0:   .DC.L   edit_close
D000af4:   .DC.L   edit_delete
D000af8:   .DC.L   edit_cursor
D000afc:   .DC.L   edit_evnt
D000b00:   .DC.L   edit_get_buf
D000b04:   .DC.L   edit_get_format
D000b08:   .DC.L   edit_get_colour
D000b0c:   .DC.L   edit_get_color
D000b10:   .DC.L   edit_get_font
D000b14:   .DC.L   edit_get_cursor
D000b18:   .DC.L   edit_get_dirty
D000b1c:   .DC.L   edit_get_sel
D000b20:   .DC.L   edit_get_scrollinfo
D000b24:   .DC.L   edit_set_format
D000b28:   .DC.L   edit_set_colour
D000b2c:   .DC.L   edit_set_colour
D000b30:   .DC.L   edit_set_font
D000b34:   .DC.L   edit_set_cursor
D000b38:   .DC.L   edit_resized
D000b3c:   .DC.L   edit_set_dirty
D000b40:   .DC.L   edit_scroll
D000b44:   .DC.L   EvntMulti
D000b48:   .DC.L   form_wbutton
D000b4c:   .DC.L   form_xdial
D000b50:   .DC.L   form_xdo
D000b54:   .DC.L   form_xerr
D000b58:   .DC.L   _crystal
D000b5c:   .DC.L   graf_wwatchbox
D000b60:   .DC.L   graf_xhandle
D000b64:   .DC.L   wdlg_create
D000b68:   .DC.L   wdlg_open
D000b6c:   .DC.L   wdlg_close
D000b70:   .DC.L   wdlg_delete
D000b74:   .DC.L   wdlg_get_tree
D000b78:   .DC.L   wdlg_get_edit
D000b7c:   .DC.L   wdlg_get_udata
D000b80:   .DC.L   wdlg_get_handle
D000b84:   .DC.L   wdlg_set_edit
D000b88:   .DC.L   wdlg_set_tree
D000b8c:   .DC.L   wdlg_set_size
D000b90:   .DC.L   wdlg_set_iconify
D000b94:   .DC.L   wdlg_set_uniconify
D000b98:   .DC.L   wdlg_evnt
D000b9c:   .DC.L   wdlg_redraw
D000ba0:   .DC.L   wind_draw
D000ba4:   .DC.L   scrp_clear
D000ba8:   .DC.L   objc_xedit
D000bac:   .DC.L   graf_rubbbox
funcAes:
D000bb0:   .DC.L   func1Aes
D000bb4:   .DC.W   $0000
funcAnzAes:
D000bb6:   .DC.W   $0001
func1MtAes:
D000bb8:   .DC.L   mt_appl_init
D000bbc:   .DC.L   mt_appl_read
D000bc0:   .DC.L   mt_appl_write
D000bc4:   .DC.L   mt_appl_find
D000bc8:   .DC.L   mt_appl_search
D000bcc:   .DC.L   mt_appl_tplay
D000bd0:   .DC.L   mt_appl_trecord
D000bd4:   .DC.L   mt_appl_yield
D000bd8:   .DC.L   mt_appl_exit
D000bdc:   .DC.L   mt_appl_getinfo
D000be0:   .DC.L   mt_appl_control
D000be4:   .DC.L   mt_evnt_keybd
D000be8:   .DC.L   mt_evnt_button
D000bec:   .DC.L   mt_evnt_mouse
D000bf0:   .DC.L   mt_evnt_mesag
D000bf4:   .DC.L   mt_evnt_timer
D000bf8:   .DC.L   mt_evnt_event
D000bfc:   .DC.L   mt_evnt_multi
D000c00:   .DC.L   mt_evnt_dclick
D000c04:   .DC.L   mt_menu_bar
D000c08:   .DC.L   mt_menu_icheck
D000c0c:   .DC.L   mt_menu_ienable
D000c10:   .DC.L   mt_menu_tnormal
D000c14:   .DC.L   mt_menu_text
D000c18:   .DC.L   mt_menu_register
D000c1c:   .DC.L   mt_menu_unregister
D000c20:   .DC.L   mt_menu_click
D000c24:   .DC.L   mt_menu_attach
D000c28:   .DC.L   mt_menu_istart
D000c2c:   .DC.L   mt_menu_popup
D000c30:   .DC.L   mt_menu_settings
D000c34:   .DC.L   mt_objc_add
D000c38:   .DC.L   mt_objc_delete
D000c3c:   .DC.L   mt_objc_draw
D000c40:   .DC.L   mt_objc_find
D000c44:   .DC.L   mt_objc_offset
D000c48:   .DC.L   mt_objc_order
D000c4c:   .DC.L   mt_objc_edit
D000c50:   .DC.L   mt_objc_change
D000c54:   .DC.L   mt_objc_sysvar
D000c58:   .DC.L   mt_form_do
D000c5c:   .DC.L   mt_form_dial
D000c60:   .DC.L   mt_form_alert
D000c64:   .DC.L   mt_form_error
D000c68:   .DC.L   mt_form_center
D000c6c:   .DC.L   mt_form_keybd
D000c70:   .DC.L   mt_form_button
D000c74:   .DC.L   mt_graf_rubbox
D000c78:   .DC.L   mt_graf_rubberbox
D000c7c:   .DC.L   mt_graf_dragbox
D000c80:   .DC.L   mt_graf_mbox
D000c84:   .DC.L   mt_graf_movebox
D000c88:   .DC.L   mt_graf_growbox
D000c8c:   .DC.L   mt_graf_shrinkbox
D000c90:   .DC.L   mt_graf_watchbox
D000c94:   .DC.L   mt_graf_slidebox
D000c98:   .DC.L   mt_graf_handle
D000c9c:   .DC.L   mt_graf_mouse
D000ca0:   .DC.L   mt_graf_mkstate
D000ca4:   .DC.L   mt_graf_multirubber
D000ca8:   .DC.L   mt_scrp_read
D000cac:   .DC.L   mt_scrp_write
D000cb0:   .DC.L   mt_fsel_input
D000cb4:   .DC.L   mt_fsel_exinput
D000cb8:   .DC.L   mt_fsel_boxinput
D000cbc:   .DC.L   mt_fslx_open
D000cc0:   .DC.L   mt_fslx_close
D000cc4:   .DC.L   mt_fslx_getnxtfile
D000cc8:   .DC.L   mt_fslx_evnt
D000ccc:   .DC.L   mt_fslx_do
D000cd0:   .DC.L   mt_fslx_set_flags
D000cd4:   .DC.L   mt_wind_create
D000cd8:   .DC.L   mt_wind_open
D000cdc:   .DC.L   mt_wind_close
D000ce0:   .DC.L   mt_wind_delete
D000ce4:   .DC.L   mt_wind_get
D000ce8:   .DC.L   mt_wind_getQSB
D000cec:   .DC.L   mt_wind_set
D000cf0:   .DC.L   mt_wind_find
D000cf4:   .DC.L   mt_wind_update
D000cf8:   .DC.L   mt_wind_calc
D000cfc:   .DC.L   mt_wind_new
D000d00:   .DC.L   mt_rsrc_load
D000d04:   .DC.L   mt_rsrc_free
D000d08:   .DC.L   mt_rsrc_gaddr
D000d0c:   .DC.L   mt_rsrc_saddr
D000d10:   .DC.L   mt_rsrc_obfix
D000d14:   .DC.L   mt_rsrc_rcfix
D000d18:   .DC.L   mt_shel_read
D000d1c:   .DC.L   mt_shel_write
D000d20:   .DC.L   mt_shel_get
D000d24:   .DC.L   mt_shel_put
D000d28:   .DC.L   mt_shel_find
D000d2c:   .DC.L   mt_shel_envrn
D000d30:   .DC.L   mt_shel_help
D000d34:   .DC.L   mt_fnts_add
D000d38:   .DC.L   mt_fnts_close
D000d3c:   .DC.L   mt_fnts_create
D000d40:   .DC.L   mt_fnts_delete
D000d44:   .DC.L   mt_fnts_do
D000d48:   .DC.L   mt_fnts_evnt
D000d4c:   .DC.L   mt_fnts_get_info
D000d50:   .DC.L   mt_fnts_get_name
D000d54:   .DC.L   mt_fnts_get_no_styles
D000d58:   .DC.L   mt_fnts_get_style
D000d5c:   .DC.L   mt_fnts_open
D000d60:   .DC.L   mt_fnts_remove
D000d64:   .DC.L   mt_fnts_update
D000d68:   .DC.L   mt_lbox_ascroll_to
D000d6c:   .DC.L   mt_lbox_scroll_to
D000d70:   .DC.L   mt_lbox_bscroll_to
D000d74:   .DC.L   mt_lbox_cnt_items
D000d78:   .DC.L   mt_lbox_create
D000d7c:   .DC.L   mt_lbox_delete
D000d80:   .DC.L   mt_lbox_do
D000d84:   .DC.L   mt_lbox_free_items
D000d88:   .DC.L   mt_lbox_free_list
D000d8c:   .DC.L   mt_lbox_get_afirst
D000d90:   .DC.L   mt_lbox_get_first
D000d94:   .DC.L   mt_lbox_get_avis
D000d98:   .DC.L   mt_lbox_get_visible
D000d9c:   .DC.L   mt_lbox_get_bentries
D000da0:   .DC.L   mt_lbox_get_bfirst
D000da4:   .DC.L   mt_lbox_get_idx
D000da8:   .DC.L   mt_lbox_get_item
D000dac:   .DC.L   mt_lbox_get_items
D000db0:   .DC.L   mt_lbox_get_slct_idx
D000db4:   .DC.L   mt_lbox_get_slct_item
D000db8:   .DC.L   mt_lbox_get_tree
D000dbc:   .DC.L   mt_lbox_get_udata
D000dc0:   .DC.L   mt_lbox_set_asldr
D000dc4:   .DC.L   mt_lbox_set_slider
D000dc8:   .DC.L   mt_lbox_set_bentries
D000dcc:   .DC.L   mt_lbox_set_bsldr
D000dd0:   .DC.L   mt_lbox_set_items
D000dd4:   .DC.L   mt_lbox_update
D000dd8:   .DC.L   mt_pdlg_add_printers
D000ddc:   .DC.L   mt_pdlg_add_sub_dialogs
D000de0:   .DC.L   mt_pdlg_close
D000de4:   .DC.L   mt_pdlg_create
D000de8:   .DC.L   mt_pdlg_delete
D000dec:   .DC.L   mt_pdlg_dflt_settings
D000df0:   .DC.L   mt_pdlg_do
D000df4:   .DC.L   mt_pdlg_evnt
D000df8:   .DC.L   mt_pdlg_free_settings
D000dfc:   .DC.L   mt_pdlg_get_setsize
D000e00:   .DC.L   mt_pdlg_new_settings
D000e04:   .DC.L   mt_pdlg_open
D000e08:   .DC.L   mt_pdlg_remove_printers
D000e0c:   .DC.L   mt_pdlg_remove_sub_dialogs
D000e10:   .DC.L   mt_pdlg_update
D000e14:   .DC.L   mt_pdlg_use_settings
D000e18:   .DC.L   mt_pdlg_validate_settings
D000e1c:   .DC.L   mt_edit_create
D000e20:   .DC.L   mt_edit_set_buf
D000e24:   .DC.L   mt_edit_open
D000e28:   .DC.L   mt_edit_close
D000e2c:   .DC.L   mt_edit_delete
D000e30:   .DC.L   mt_edit_cursor
D000e34:   .DC.L   mt_edit_evnt
D000e38:   .DC.L   mt_edit_get_buf
D000e3c:   .DC.L   mt_edit_get_format
D000e40:   .DC.L   mt_edit_get_colour
D000e44:   .DC.L   mt_edit_get_color
D000e48:   .DC.L   mt_edit_get_font
D000e4c:   .DC.L   mt_edit_get_cursor
D000e50:   .DC.L   mt_edit_get_dirty
D000e54:   .DC.L   mt_edit_get_sel
D000e58:   .DC.L   mt_edit_get_scrollinfo
D000e5c:   .DC.L   mt_edit_set_format
D000e60:   .DC.L   mt_edit_set_colour
D000e64:   .DC.L   mt_edit_set_colour
D000e68:   .DC.L   mt_edit_set_font
D000e6c:   .DC.L   mt_edit_set_cursor
D000e70:   .DC.L   mt_edit_resized
D000e74:   .DC.L   mt_edit_set_dirty
D000e78:   .DC.L   mt_edit_scroll
D000e7c:   .DC.L   mt_EvntMulti
D000e80:   .DC.L   mt_form_wbutton
D000e84:   .DC.L   mt_form_xdial
D000e88:   .DC.L   mt_form_xdo
D000e8c:   .DC.L   mt_form_xerr
D000e90:   .DC.L   mt_graf_wwatchbox
D000e94:   .DC.L   mt_graf_xhandle
D000e98:   .DC.L   mt_wdlg_create
D000e9c:   .DC.L   mt_wdlg_open
D000ea0:   .DC.L   mt_wdlg_close
D000ea4:   .DC.L   mt_wdlg_delete
D000ea8:   .DC.L   mt_wdlg_get_tree
D000eac:   .DC.L   mt_wdlg_get_edit
D000eb0:   .DC.L   mt_wdlg_get_udata
D000eb4:   .DC.L   mt_wdlg_get_handle
D000eb8:   .DC.L   mt_wdlg_set_edit
D000ebc:   .DC.L   mt_wdlg_set_tree
D000ec0:   .DC.L   mt_wdlg_set_size
D000ec4:   .DC.L   mt_wdlg_set_iconify
D000ec8:   .DC.L   mt_wdlg_set_uniconify
D000ecc:   .DC.L   mt_wdlg_evnt
D000ed0:   .DC.L   mt_wdlg_redraw
D000ed4:   .DC.L   mt_wind_draw
D000ed8:   .DC.L   mt_scrp_clear
D000edc:   .DC.L   mt_objc_xedit
D000ee0:   .DC.L   mt_graf_rubbbox
funcMtAes:
D000ee4:   .DC.L   func1MtAes
D000ee8:   .DC.W   $0000
funcAnzMtAes:
D000eea:   .DC.W   $0001
func1Keytab:
D000eec:   .DC.L   Akt_getKeyTab
D000ef0:   .DC.L   Akt_getRelease
D000ef4:   .DC.L   Akt_getEuro
D000ef8:   .DC.L   Akt_getExpMaxNr
D000efc:   .DC.L   Akt_getImpMaxNr
D000f00:   .DC.L   Akt_getExpNameFromNr
D000f04:   .DC.L   Akt_getImpNameFromNr
D000f08:   .DC.L   Akt_getExpShortNameFromNr
D000f0c:   .DC.L   Akt_getImpShortNameFromNr
D000f10:   .DC.L   Akt_getExpNrFromId
D000f14:   .DC.L   Akt_getImpNrFromId
D000f18:   .DC.L   Akt_getExpIdFromNr
D000f1c:   .DC.L   Akt_getImpIdFromNr
D000f20:   .DC.L   Akt_getExpNrFromName
D000f24:   .DC.L   Akt_getImpNrFromName
D000f28:   .DC.L   Akt_CharAtari2X
D000f2c:   .DC.L   Akt_CharX2Atari
D000f30:   .DC.L   Akt_BlockAtari2X
D000f34:   .DC.L   Akt_BlockX2Atari
D000f38:   .DC.L   Akt_StringAtari2X
D000f3c:   .DC.L   Akt_StringX2Atari
D000f40:   .DC.L   Akt_CharX2Unicode
D000f44:   .DC.L   Akt_CharUnicode2X
D000f48:   .DC.L   Akt_BlockX2Unicode
D000f4c:   .DC.L   Akt_BlockUnicode2X
D000f50:   .DC.L   Akt_StringX2Unicode
D000f54:   .DC.L   Akt_popExpName
D000f58:   .DC.L   Akt_popImpName
D000f5c:   .DC.L   Akt_chooseExpNr
D000f60:   .DC.L   Akt_chooseImpNr
D000f64:   .DC.L   Akt_getExpMinNr
D000f68:   .DC.L   Akt_getImpMinNr
D000f6c:   .DC.L   Akt_BlockXUtf2Unicode
D000f70:   .DC.L   Akt_BlockUnicode2XUtf
D000f74:   .DC.L   Akt_StringXUtf2Unicode
D000f78:   .DC.L   Akt_BlockXUtf2U2XUtf
D000f7c:   .DC.L   Akt_BlockXUtf2XUtf
D000f80:   .DC.L   Akt_StringXUtf2U2XUtf
D000f84:   .DC.L   Akt_StringXUtf2XUtf
funcKeytab:
D000f88:   .DC.L   func1Keytab
D000f8c:   .DC.W   $0000
funcAnzKeytab:
D000f8e:   .DC.W   $0001
funcs::
D000f90:   .DC.L   funcAbp
D000f94:   .DC.L   funcAnzAbp
D000f98:   .DC.L   funcAcfg
D000f9c:   .DC.L   funcAnzAcfg
D000fa0:   .DC.L   funcAch
D000fa4:   .DC.L   funcAnzAch
D000fa8:   .DC.L   funcAdr
D000fac:   .DC.L   funcAnzAdr
D000fb0:   .DC.L   funcAev
D000fb4:   .DC.L   funcAnzAev
D000fb8:   .DC.L   funcAf
D000fbc:   .DC.L   funcAnzAf
D000fc0:   .DC.L   funcAic
D000fc4:   .DC.L   funcAnzAic
D000fc8:   .DC.L   funcAim
D000fcc:   .DC.L   funcAnzAim
D000fd0:   .DC.L   funcAlu
D000fd4:   .DC.L   funcAnzAlu
D000fd8:   .DC.L   funcAme
D000fdc:   .DC.L   funcAnzAme
D000fe0:   .DC.L   funcAmo
D000fe4:   .DC.L   funcAnzAmo
D000fe8:   .DC.L   funcAob
D000fec:   .DC.L   funcAnzAob
D000ff0:   .DC.L   funcAscrp
D000ff4:   .DC.L   funcAnzAscrp
D000ff8:   .DC.L   funcAsh
D000ffc:   .DC.L   funcAnzAsh
D001000:   .DC.L   funcAst
D001004:   .DC.L   funcAnzAst
D001008:   .DC.L   funcAte
D00100c:   .DC.L   funcAnzAte
D001010:   .DC.L   funcAuo
D001014:   .DC.L   funcAnzAuo
D001018:   .DC.L   funcAus
D00101c:   .DC.L   funcAnzAus
D001020:   .DC.L   funcAwi
D001024:   .DC.L   funcAnzAwi
D001028:   .DC.L   funcA
D00102c:   .DC.L   funcAnzA
D001030:   .DC.L   funcSonst
D001034:   .DC.L   funcAnzSonst
D001038:   .DC.L   funcVdi
D00103c:   .DC.L   funcAnzVdi
D001040:   .DC.L   funcAes
D001044:   .DC.L   funcAnzAes
D001048:   .DC.L   funcKeytab
D00104c:   .DC.L   funcAnzKeytab
D001050:   .DC.L   funcMtAes
D001054:   .DC.L   funcAnzMtAes
funcsAnz::
D001058:   .DC.W   $0000, $0019

          .ENDMOD



          .BSS    


          .OFFSET 


          .END
