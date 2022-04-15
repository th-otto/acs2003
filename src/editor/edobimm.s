edoim_new:
[000317c8] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000317cc] 594f                      subq.w     #4,a7
[000317ce] 41f9 0010 ee4e            lea.l      ACSblk,a0
[000317d4] 2250                      movea.l    (a0),a1
[000317d6] 2469 0258                 movea.l    600(a1),a2
[000317da] 266a 0014                 movea.l    20(a2),a3
[000317de] 2869 0240                 movea.l    576(a1),a4
[000317e2] 4269 0248                 clr.w      584(a1)
[000317e6] 4eb9 0004 7e2a            jsr        Adr_next
[000317ec] 3600                      move.w     d0,d3
[000317ee] 6f50                      ble.s      $00031840
[000317f0] 48c0                      ext.l      d0
[000317f2] 2200                      move.l     d0,d1
[000317f4] d281                      add.l      d1,d1
[000317f6] d280                      add.l      d0,d1
[000317f8] e789                      lsl.l      #3,d1
[000317fa] 206c 0014                 movea.l    20(a4),a0
[000317fe] 41f0 1818                 lea.l      24(a0,d1.l),a0
[00031802] 0c68 2721 0016            cmpi.w     #$2721,22(a0)
[00031808] 6636                      bne.s      $00031840
[0003180a] 2ea8 000c                 move.l     12(a0),(a7)
[0003180e] 4eb9 0005 1388            jsr        Awi_diaend
[00031814] 2257                      movea.l    (a7),a1
[00031816] 43e9 0016                 lea.l      22(a1),a1
[0003181a] 7002                      moveq.l    #2,d0
[0003181c] 204b                      movea.l    a3,a0
[0003181e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031824] 72ff                      moveq.l    #-1,d1
[00031826] 7002                      moveq.l    #2,d0
[00031828] 204a                      movea.l    a2,a0
[0003182a] 226a 0066                 movea.l    102(a2),a1
[0003182e] 4e91                      jsr        (a1)
[00031830] 4eb9 0005 147c            jsr        Awi_diastart
[00031836] 3003                      move.w     d3,d0
[00031838] 204c                      movea.l    a4,a0
[0003183a] 4eb9 0004 7f76            jsr        Adr_del
[00031840] 584f                      addq.w     #4,a7
[00031842] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00031846] 4e75                      rts
edoim_edit:
[00031848] 2f0a                      move.l     a2,-(a7)
[0003184a] 2f0b                      move.l     a3,-(a7)
[0003184c] 514f                      subq.w     #8,a7
[0003184e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031854] 2468 0258                 movea.l    600(a0),a2
[00031858] 2652                      movea.l    (a2),a3
[0003185a] 226a 0014                 movea.l    20(a2),a1
[0003185e] 2069 003c                 movea.l    60(a1),a0
[00031862] 2250                      movea.l    (a0),a1
[00031864] 2053                      movea.l    (a3),a0
[00031866] 2068 0030                 movea.l    48(a0),a0
[0003186a] 4eb9 0003 337c            jsr        find_entry
[00031870] 2008                      move.l     a0,d0
[00031872] 671c                      beq.s      $00031890
[00031874] 006a 0004 0054            ori.w      #$0004,84(a2)
[0003187a] 2e93                      move.l     (a3),(a7)
[0003187c] 2f40 0004                 move.l     d0,4(a7)
[00031880] 41d7                      lea.l      (a7),a0
[00031882] 2279 000b 1d66            movea.l    $000B1D66,a1
[00031888] 4e91                      jsr        (a1)
[0003188a] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[00031890] 504f                      addq.w     #8,a7
[00031892] 265f                      movea.l    (a7)+,a3
[00031894] 245f                      movea.l    (a7)+,a2
[00031896] 4e75                      rts
edoim_ok:
[00031898] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003189c] 2079 0010 ee4e            movea.l    ACSblk,a0
[000318a2] 2868 0258                 movea.l    600(a0),a4
[000318a6] 2a54                      movea.l    (a4),a5
[000318a8] 2455                      movea.l    (a5),a2
[000318aa] 006a 0001 0006            ori.w      #$0001,6(a2)
[000318b0] 206d 0004                 movea.l    4(a5),a0
[000318b4] 2668 0004                 movea.l    4(a0),a3
[000318b8] 322d 000a                 move.w     10(a5),d1
[000318bc] 48c1                      ext.l      d1
[000318be] 2001                      move.l     d1,d0
[000318c0] e788                      lsl.l      #3,d0
[000318c2] 9081                      sub.l      d1,d0
[000318c4] e788                      lsl.l      #3,d0
[000318c6] d7c0                      adda.l     d0,a3
[000318c8] 226c 0014                 movea.l    20(a4),a1
[000318cc] 2a69 003c                 movea.l    60(a1),a5
[000318d0] 2a55                      movea.l    (a5),a5
[000318d2] 206a 0030                 movea.l    48(a2),a0
[000318d6] 224d                      movea.l    a5,a1
[000318d8] 4eb9 0003 337c            jsr        find_entry
[000318de] 2848                      movea.l    a0,a4
[000318e0] 200c                      move.l     a4,d0
[000318e2] 6610                      bne.s      $000318F4
[000318e4] 224d                      movea.l    a5,a1
[000318e6] 41f9 000c a99a            lea.l      ERR_IM_DEL,a0
[000318ec] 4eb9 0006 b80c            jsr        alert_str
[000318f2] 6020                      bra.s      $00031914
[000318f4] 2a6b 0014                 movea.l    20(a3),a5
[000318f8] bbcc                      cmpa.l     a4,a5
[000318fa] 6712                      beq.s      $0003190E
[000318fc] 526c 0036                 addq.w     #1,54(a4)
[00031900] 274c 0014                 move.l     a4,20(a3)
[00031904] 224d                      movea.l    a5,a1
[00031906] 204a                      movea.l    a2,a0
[00031908] 4eb9 0003 4d5a            jsr        del_image
[0003190e] 4eb9 0002 f27c            jsr        ed_abort
[00031914] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00031918] 4e75                      rts
set_image:
[0003191a] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003191e] 2648                      movea.l    a0,a3
[00031920] 49f9 000c abf2            lea.l      sm,a4
[00031926] 41ec ff10                 lea.l      -240(a4),a0
[0003192a] 4eb9 0004 f064            jsr        Aob_create
[00031930] 2448                      movea.l    a0,a2
[00031932] 200a                      move.l     a2,d0
[00031934] 6604                      bne.s      $0003193A
[00031936] 91c8                      suba.l     a0,a0
[00031938] 6016                      bra.s      $00031950
[0003193a] 266b 0014                 movea.l    20(a3),a3
[0003193e] 43eb 0016                 lea.l      22(a3),a1
[00031942] 7002                      moveq.l    #2,d0
[00031944] 204a                      movea.l    a2,a0
[00031946] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003194c] 288a                      move.l     a2,(a4)
[0003194e] 204c                      movea.l    a4,a0
[00031950] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[00031954] 4e75                      rts
edoim_list:
[00031956] 2f0a                      move.l     a2,-(a7)
[00031958] 2f0b                      move.l     a3,-(a7)
[0003195a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031960] 2468 0258                 movea.l    600(a0),a2
[00031964] 2052                      movea.l    (a2),a0
[00031966] 006a 0004 0054            ori.w      #$0004,84(a2)
[0003196c] 47f9 000c e4d6            lea.l      list_image,a3
[00031972] 2690                      move.l     (a0),(a3)
[00031974] 2250                      movea.l    (a0),a1
[00031976] 2769 0030 0004            move.l     48(a1),4(a3)
[0003197c] 204b                      movea.l    a3,a0
[0003197e] 2279 000c dc9e            movea.l    $000CDC9E,a1
[00031984] 4e91                      jsr        (a1)
[00031986] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[0003198c] 265f                      movea.l    (a7)+,a3
[0003198e] 245f                      movea.l    (a7)+,a2
[00031990] 4e75                      rts

	.data

ERR_IM_DEL:
[000ca99a]                           dc.b '[3][ Das Bild| '%s' | ist nicht (mehr) Teil | dieser Datei][ OK ]',0
TEXT_001:
[000ca9dc]                           dc.b 'Abbruch',0
TEXT_002:
[000ca9e4]                           dc.w $004f
[000ca9e6]                           dc.w $4b00
TEXT_004:
[000ca9e8]                           dc.b 'Edit',0
TEXT_005:
[000ca9ed]                           dc.b '1234567890123456789012345678901',0
TEXT_03:
[000caa0d]                           dc.b 'Bild (aus Liste ablegen):',0
help_title:
[000caa27]                           dc.b 'Die Graphik-Zuordnung',0
title:
[000caa3d]                           dc.b ' BILD -',0
[000caa45]                           dc.b $00
[000caa46] 000ca9ed                  dc.l TEXT_005
[000caa4a] 000ca9e4                  dc.l TEXT_002
[000caa4e] 000ca9e4                  dc.l TEXT_002
[000caa52]                           dc.w $0003
[000caa54]                           dc.w $0006
[000caa56]                           dc.w $0002
[000caa58]                           dc.w $1180
[000caa5a]                           dc.w $0000
[000caa5c]                           dc.w $0000
[000caa5e]                           dc.w $0020
[000caa60]                           dc.w $0001
A_3DBUTTON01:
[000caa62] 00064a22                  dc.l A_3Dbutton
[000caa66]                           dc.w $29c1
[000caa68]                           dc.w $0178
[000caa6a] 000630f2                  dc.l Auo_string
[000caa6e] 000ca9e8                  dc.l TEXT_004
[000caa72]                           dc.w $0000
[000caa74]                           dc.w $0000
[000caa76]                           dc.w $0000
[000caa78]                           dc.w $0000
[000caa7a]                           dc.w $0000
[000caa7c]                           dc.w $0000
[000caa7e]                           dc.w $0000
[000caa80]                           dc.w $0000
A_3DBUTTON02:
[000caa82] 00064a22                  dc.l A_3Dbutton
[000caa86]                           dc.w $21f1
[000caa88]                           dc.w $0178
[000caa8a] 000630f2                  dc.l Auo_string
[000caa8e]                           dc.w $0000
[000caa90]                           dc.w $0000
[000caa92]                           dc.w $0000
[000caa94]                           dc.w $0000
[000caa96]                           dc.w $0000
[000caa98]                           dc.w $0000
[000caa9a]                           dc.w $0000
[000caa9c]                           dc.w $0000
[000caa9e]                           dc.w $0000
[000caaa0]                           dc.w $0000
A_3DBUTTON03:
[000caaa2] 00064a22                  dc.l A_3Dbutton
[000caaa6]                           dc.w $29c1
[000caaa8]                           dc.w $0178
[000caaaa] 000630f2                  dc.l Auo_string
[000caaae] 000ca9dc                  dc.l TEXT_001
[000caab2]                           dc.w $0000
[000caab4]                           dc.w $0000
[000caab6]                           dc.w $0000
[000caab8]                           dc.w $0000
[000caaba]                           dc.w $0000
[000caabc]                           dc.w $0000
[000caabe]                           dc.w $0000
[000caac0]                           dc.w $0000
A_3DBUTTON04:
[000caac2] 00064a22                  dc.l A_3Dbutton
[000caac6]                           dc.w $29c1
[000caac8]                           dc.w $0178
[000caaca] 000630f2                  dc.l Auo_string
[000caace] 000ca9e5                  dc.l TEXT_003
[000caad2]                           dc.w $0000
[000caad4]                           dc.w $0000
[000caad6]                           dc.w $0000
[000caad8]                           dc.w $0000
[000caada]                           dc.w $0000
[000caadc]                           dc.w $0000
[000caade]                           dc.w $0000
[000caae0]                           dc.w $0000
A_INNERFRAME02:
[000caae2] 00064256                  dc.l A_innerframe
[000caae6]                           dc.w $1800
[000caae8]                           dc.w $8f19
[000caaea] 000630f2                  dc.l Auo_string
[000caaee] 000caa0d                  dc.l TEXT_03
[000caaf2]                           dc.w $0000
[000caaf4]                           dc.w $0000
[000caaf6]                           dc.w $0000
[000caaf8]                           dc.w $0000
[000caafa]                           dc.w $0000
[000caafc]                           dc.w $0000
[000caafe]                           dc.w $0000
[000cab00]                           dc.w $0000
ED_IMAGE:
[000cab02]                           dc.w $ffff
[000cab04]                           dc.w $0001
[000cab06]                           dc.w $0008
[000cab08]                           dc.w $0018
[000cab0a]                           dc.w $0040
[000cab0c]                           dc.w $0010
[000cab0e] 000caa82                  dc.l A_3DBUTTON02
[000cab12]                           dc.w $0000
[000cab14]                           dc.w $0000
[000cab16]                           dc.w $0024
[000cab18]                           dc.w $0006
_01_ED_IMAGE:
[000cab1a]                           dc.w $0004
[000cab1c]                           dc.w $0002
[000cab1e]                           dc.w $0002
[000cab20]                           dc.w $0018
[000cab22]                           dc.w $0040
[000cab24]                           dc.w $0000
[000cab26] 000caae2                  dc.l A_INNERFRAME02
[000cab2a]                           dc.w $0001
[000cab2c]                           dc.w $0000
[000cab2e]                           dc.w $0022
[000cab30]                           dc.w $0003
_02_ED_IMAGE:
[000cab32]                           dc.w $0001
[000cab34]                           dc.w $ffff
[000cab36]                           dc.w $ffff
[000cab38]                           dc.w $0016
[000cab3a]                           dc.w $1005
[000cab3c]                           dc.w $0000
[000cab3e] 000caa46                  dc.l TEDI_001
[000cab42]                           dc.w $0001
[000cab44]                           dc.w $0001
[000cab46]                           dc.w $0020
[000cab48]                           dc.w $0001
_02aED_IMAGE:
[000cab4a] 00031956                  dc.l edoim_list
[000cab4e] 000317c8                  dc.l edoim_new
[000cab52]                           dc.w $8000
[000cab54]                           dc.w $0000
[000cab56]                           dc.w $0000
[000cab58]                           dc.w $0000
[000cab5a]                           dc.w $0000
[000cab5c]                           dc.w $0000
[000cab5e]                           dc.w $0000
[000cab60]                           dc.w $0000
_04_ED_IMAGE:
[000cab62]                           dc.w $0006
[000cab64]                           dc.w $ffff
[000cab66]                           dc.w $ffff
[000cab68]                           dc.w $0018
[000cab6a]                           dc.w $4007
[000cab6c]                           dc.w $0010
[000cab6e] 000caac2                  dc.l A_3DBUTTON04
[000cab72]                           dc.w $0001
[000cab74]                           dc.w $0003
[000cab76]                           dc.w $000a
[000cab78]                           dc.w $0002
_04aED_IMAGE:
[000cab7a] 00031898                  dc.l edoim_ok
[000cab7e]                           dc.w $0000
[000cab80]                           dc.w $0000
[000cab82]                           dc.w $8000
[000cab84]                           dc.w $884f
[000cab86]                           dc.w $0000
[000cab88]                           dc.w $0000
[000cab8a]                           dc.w $0000
[000cab8c]                           dc.w $0000
[000cab8e]                           dc.w $0000
[000cab90]                           dc.w $0000
_06_ED_IMAGE:
[000cab92]                           dc.w $0008
[000cab94]                           dc.w $ffff
[000cab96]                           dc.w $ffff
[000cab98]                           dc.w $0018
[000cab9a]                           dc.w $4005
[000cab9c]                           dc.w $0010
[000cab9e] 000caaa2                  dc.l A_3DBUTTON03
[000caba2]                           dc.w $000d
[000caba4]                           dc.w $0003
[000caba6]                           dc.w $000a
[000caba8]                           dc.w $0002
_06aED_IMAGE:
[000cabaa] 0002f27c                  dc.l ed_abort
[000cabae]                           dc.w $0000
[000cabb0]                           dc.w $0000
[000cabb2]                           dc.w $8000
[000cabb4]                           dc.w $8841
[000cabb6]                           dc.w $0000
[000cabb8]                           dc.w $0000
[000cabba]                           dc.w $0000
[000cabbc]                           dc.w $0000
[000cabbe]                           dc.w $0000
[000cabc0]                           dc.w $0000
_08_ED_IMAGE:
[000cabc2]                           dc.w $0000
[000cabc4]                           dc.w $ffff
[000cabc6]                           dc.w $ffff
[000cabc8]                           dc.w $0018
[000cabca]                           dc.w $4005
[000cabcc]                           dc.w $0010
[000cabce] 000caa62                  dc.l A_3DBUTTON01
[000cabd2]                           dc.w $0019
[000cabd4]                           dc.w $0003
[000cabd6]                           dc.w $000a
[000cabd8]                           dc.w $0002
_08aED_IMAGE:
[000cabda] 00031848                  dc.l edoim_edit
[000cabde]                           dc.w $0000
[000cabe0]                           dc.w $0000
[000cabe2]                           dc.w $8020
[000cabe4]                           dc.w $8845
[000cabe6]                           dc.w $0000
[000cabe8]                           dc.w $0000
[000cabea]                           dc.w $0000
[000cabec]                           dc.w $0000
[000cabee]                           dc.w $0000
[000cabf0]                           dc.w $0000
sm:
[000cabf2]                           dc.w $0000
[000cabf4]                           dc.w $0000
[000cabf6] 00031898                  dc.l edoim_ok
[000cabfa] 0004f20a                  dc.l Aob_delete
[000cabfe] 000caa3d                  dc.l title
[000cac02] 000caa27                  dc.l help_title
[000cac06]                           dc.w $0000
[000cac08]                           dc.w $0000
