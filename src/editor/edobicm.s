edoic_new:
[0003160a] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003160e] 594f                      subq.w     #4,a7
[00031610] 41f9 0010 ee4e            lea.l      ACSblk,a0
[00031616] 2250                      movea.l    (a0),a1
[00031618] 2469 0258                 movea.l    600(a1),a2
[0003161c] 266a 0014                 movea.l    20(a2),a3
[00031620] 2869 0240                 movea.l    576(a1),a4
[00031624] 4269 0248                 clr.w      584(a1)
[00031628] 4eb9 0004 7e2a            jsr        Adr_next
[0003162e] 3600                      move.w     d0,d3
[00031630] 6f44                      ble.s      edoic_new_1
[00031632] 48c0                      ext.l      d0
[00031634] 2200                      move.l     d0,d1
[00031636] d281                      add.l      d1,d1
[00031638] d280                      add.l      d0,d1
[0003163a] e789                      lsl.l      #3,d1
[0003163c] 206c 0014                 movea.l    20(a4),a0
[00031640] 41f0 1818                 lea.l      24(a0,d1.l),a0
[00031644] 0c68 2720 0016            cmpi.w     #$2720,22(a0)
[0003164a] 662a                      bne.s      edoic_new_1
[0003164c] 2ea8 000c                 move.l     12(a0),(a7)
[00031650] 2257                      movea.l    (a7),a1
[00031652] 43e9 0016                 lea.l      22(a1),a1
[00031656] 204b                      movea.l    a3,a0
[00031658] 7002                      moveq.l    #2,d0
[0003165a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031660] 72ff                      moveq.l    #-1,d1
[00031662] 7002                      moveq.l    #2,d0
[00031664] 204a                      movea.l    a2,a0
[00031666] 226a 0066                 movea.l    102(a2),a1
[0003166a] 4e91                      jsr        (a1)
[0003166c] 3003                      move.w     d3,d0
[0003166e] 204c                      movea.l    a4,a0
[00031670] 4eb9 0004 7f76            jsr        Adr_del
edoic_new_1:
[00031676] 584f                      addq.w     #4,a7
[00031678] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003167c] 4e75                      rts

edoic_edit:
[0003167e] 2f0a                      move.l     a2,-(a7)
[00031680] 2f0b                      move.l     a3,-(a7)
[00031682] 514f                      subq.w     #8,a7
[00031684] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003168a] 2468 0258                 movea.l    600(a0),a2
[0003168e] 2652                      movea.l    (a2),a3
[00031690] 226a 0014                 movea.l    20(a2),a1
[00031694] 2069 003c                 movea.l    60(a1),a0
[00031698] 2250                      movea.l    (a0),a1
[0003169a] 2053                      movea.l    (a3),a0
[0003169c] 2068 002c                 movea.l    44(a0),a0
[000316a0] 4eb9 0003 337c            jsr        find_entry
[000316a6] 2008                      move.l     a0,d0
[000316a8] 671c                      beq.s      edoic_edit_1
[000316aa] 006a 0004 0054            ori.w      #$0004,84(a2)
[000316b0] 2e93                      move.l     (a3),(a7)
[000316b2] 2f40 0004                 move.l     d0,4(a7)
[000316b6] 41d7                      lea.l      (a7),a0
[000316b8] 2279 000b 0cee            movea.l    $000B0CEE,a1
[000316be] 4e91                      jsr        (a1)
[000316c0] 026a fffb 0054            andi.w     #$FFFB,84(a2)
edoic_edit_1:
[000316c6] 504f                      addq.w     #8,a7
[000316c8] 265f                      movea.l    (a7)+,a3
[000316ca] 245f                      movea.l    (a7)+,a2
[000316cc] 4e75                      rts

edoic_ok:
[000316ce] 48e7 003c                 movem.l    a2-a5,-(a7)
[000316d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000316d8] 2868 0258                 movea.l    600(a0),a4
[000316dc] 2a54                      movea.l    (a4),a5
[000316de] 2455                      movea.l    (a5),a2
[000316e0] 006a 0001 0006            ori.w      #$0001,6(a2)
[000316e6] 206d 0004                 movea.l    4(a5),a0
[000316ea] 2668 0004                 movea.l    4(a0),a3
[000316ee] 322d 000a                 move.w     10(a5),d1
[000316f2] 48c1                      ext.l      d1
[000316f4] 2001                      move.l     d1,d0
[000316f6] e788                      lsl.l      #3,d0
[000316f8] 9081                      sub.l      d1,d0
[000316fa] e788                      lsl.l      #3,d0
[000316fc] d7c0                      adda.l     d0,a3
[000316fe] 226c 0014                 movea.l    20(a4),a1
[00031702] 2a69 003c                 movea.l    60(a1),a5
[00031706] 2a55                      movea.l    (a5),a5
[00031708] 206a 002c                 movea.l    44(a2),a0
[0003170c] 224d                      movea.l    a5,a1
[0003170e] 4eb9 0003 337c            jsr        find_entry
[00031714] 2848                      movea.l    a0,a4
[00031716] 200c                      move.l     a4,d0
[00031718] 6610                      bne.s      edoic_ok_1
[0003171a] 224d                      movea.l    a5,a1
[0003171c] 41f9 000c a72a            lea.l      ERR_IC_DEL,a0
[00031722] 4eb9 0006 b80c            jsr        alert_str
[00031728] 6020                      bra.s      edoic_ok_2
edoic_ok_1:
[0003172a] 2a6b 0014                 movea.l    20(a3),a5
[0003172e] bbcc                      cmpa.l     a4,a5
[00031730] 6712                      beq.s      edoic_ok_3
[00031732] 526c 0036                 addq.w     #1,54(a4)
[00031736] 274c 0014                 move.l     a4,20(a3)
[0003173a] 224d                      movea.l    a5,a1
[0003173c] 204a                      movea.l    a2,a0
[0003173e] 4eb9 0003 4b40            jsr        del_icon
edoic_ok_3:
[00031744] 4eb9 0002 f27c            jsr        ed_abort
edoic_ok_2:
[0003174a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003174e] 4e75                      rts

set_icon:
[00031750] 48e7 0038                 movem.l    a2-a4,-(a7)
[00031754] 2648                      movea.l    a0,a3
[00031756] 49f9 000c a982            lea.l      sm,a4
[0003175c] 41ec ff10                 lea.l      -240(a4),a0
[00031760] 4eb9 0004 f064            jsr        Aob_create
[00031766] 2448                      movea.l    a0,a2
[00031768] 200a                      move.l     a2,d0
[0003176a] 6604                      bne.s      set_icon_1
[0003176c] 91c8                      suba.l     a0,a0
[0003176e] 6016                      bra.s      set_icon_2
set_icon_1:
[00031770] 266b 0014                 movea.l    20(a3),a3
[00031774] 43eb 0016                 lea.l      22(a3),a1
[00031778] 7002                      moveq.l    #2,d0
[0003177a] 204a                      movea.l    a2,a0
[0003177c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00031782] 288a                      move.l     a2,(a4)
[00031784] 204c                      movea.l    a4,a0
set_icon_2:
[00031786] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003178a] 4e75                      rts

edoic_list:
[0003178c] 2f0a                      move.l     a2,-(a7)
[0003178e] 2f0b                      move.l     a3,-(a7)
[00031790] 2079 0010 ee4e            movea.l    ACSblk,a0
[00031796] 2468 0258                 movea.l    600(a0),a2
[0003179a] 2052                      movea.l    (a2),a0
[0003179c] 006a 0004 0054            ori.w      #$0004,84(a2)
[000317a2] 47f9 000c e332            lea.l      list_icon,a3
[000317a8] 2690                      move.l     (a0),(a3)
[000317aa] 2250                      movea.l    (a0),a1
[000317ac] 2769 002c 0004            move.l     44(a1),4(a3)
[000317b2] 204b                      movea.l    a3,a0
[000317b4] 2279 000c dc9e            movea.l    $000CDC9E,a1
[000317ba] 4e91                      jsr        (a1)
[000317bc] 026a fffb 0054            andi.w     #$FFFB,84(a2)
[000317c2] 265f                      movea.l    (a7)+,a3
[000317c4] 245f                      movea.l    (a7)+,a2
[000317c6] 4e75                      rts

	.data

ERR_IC_DEL:
[000ca72a]                           dc.b '[3][ Die Ikone| '%s' | ist nicht (mehr) Teil | dieser Datei][ OK ]',0
TEXT_001:
[000ca76d]                           dc.b 'Abbruch',0
TEXT_002:
[000ca775]                           dc.b $00
TEXT_003:
[000ca776]                           dc.w $4f4b
[000ca778]                           dc.w $0045
[000ca77a]                           dc.b 'dit',0
TEXT_005:
[000ca77e]                           dc.b '1234567890123456789012345678901',0
TEXT_02:
[000ca79e]                           dc.b 'Ikone (aus Liste ablegen):',0
help_title:
[000ca7b9]                           dc.b 'Die Icon-Zuordnung',0
title:
[000ca7cc]                           dc.b ' ICONS -',0
[000ca7d5]                           dc.b $00
[000ca7d6] 000ca77e                  dc.l TEXT_005
[000ca7da] 000ca775                  dc.l TEXT_002
[000ca7de] 000ca775                  dc.l TEXT_002
[000ca7e2]                           dc.w $0003
[000ca7e4]                           dc.w $0006
[000ca7e6]                           dc.w $0002
[000ca7e8]                           dc.w $1180
[000ca7ea]                           dc.w $0000
[000ca7ec]                           dc.w $0000
[000ca7ee]                           dc.w $0020
[000ca7f0]                           dc.w $0001
A_3DBUTTON01:
[000ca7f2] 00064a22                  dc.l A_3Dbutton
[000ca7f6]                           dc.w $29c1
[000ca7f8]                           dc.w $0178
[000ca7fa] 000630f2                  dc.l Auo_string
[000ca7fe] 000ca779                  dc.l TEXT_004
[000ca802]                           dc.w $0000
[000ca804]                           dc.w $0000
[000ca806]                           dc.w $0000
[000ca808]                           dc.w $0000
[000ca80a]                           dc.w $0000
[000ca80c]                           dc.w $0000
[000ca80e]                           dc.w $0000
[000ca810]                           dc.w $0000
A_3DBUTTON02:
[000ca812] 00064a22                  dc.l A_3Dbutton
[000ca816]                           dc.w $21f1
[000ca818]                           dc.w $0178
[000ca81a] 000630f2                  dc.l Auo_string
[000ca81e]                           dc.w $0000
[000ca820]                           dc.w $0000
[000ca822]                           dc.w $0000
[000ca824]                           dc.w $0000
[000ca826]                           dc.w $0000
[000ca828]                           dc.w $0000
[000ca82a]                           dc.w $0000
[000ca82c]                           dc.w $0000
[000ca82e]                           dc.w $0000
[000ca830]                           dc.w $0000
A_3DBUTTON05:
[000ca832] 00064a22                  dc.l A_3Dbutton
[000ca836]                           dc.w $29c1
[000ca838]                           dc.w $0178
[000ca83a] 000630f2                  dc.l Auo_string
[000ca83e] 000ca76d                  dc.l TEXT_001
[000ca842]                           dc.w $0000
[000ca844]                           dc.w $0000
[000ca846]                           dc.w $0000
[000ca848]                           dc.w $0000
[000ca84a]                           dc.w $0000
[000ca84c]                           dc.w $0000
[000ca84e]                           dc.w $0000
[000ca850]                           dc.w $0000
A_3DBUTTON06:
[000ca852] 00064a22                  dc.l A_3Dbutton
[000ca856]                           dc.w $29c1
[000ca858]                           dc.w $0178
[000ca85a] 000630f2                  dc.l Auo_string
[000ca85e] 000ca776                  dc.l TEXT_003
[000ca862]                           dc.w $0000
[000ca864]                           dc.w $0000
[000ca866]                           dc.w $0000
[000ca868]                           dc.w $0000
[000ca86a]                           dc.w $0000
[000ca86c]                           dc.w $0000
[000ca86e]                           dc.w $0000
[000ca870]                           dc.w $0000
A_INNERFRAME01:
[000ca872] 00064256                  dc.l A_innerframe
[000ca876]                           dc.w $1800
[000ca878]                           dc.w $8f19
[000ca87a] 000630f2                  dc.l Auo_string
[000ca87e] 000ca79e                  dc.l TEXT_02
[000ca882]                           dc.w $0000
[000ca884]                           dc.w $0000
[000ca886]                           dc.w $0000
[000ca888]                           dc.w $0000
[000ca88a]                           dc.w $0000
[000ca88c]                           dc.w $0000
[000ca88e]                           dc.w $0000
[000ca890]                           dc.w $0000
ED_ICON:
[000ca892]                           dc.w $ffff
[000ca894]                           dc.w $0001
[000ca896]                           dc.w $0008
[000ca898]                           dc.w $0018
[000ca89a]                           dc.w $0040
[000ca89c]                           dc.w $0010
[000ca89e] 000ca812                  dc.l A_3DBUTTON02
[000ca8a2]                           dc.w $0000
[000ca8a4]                           dc.w $0000
[000ca8a6]                           dc.w $0024
[000ca8a8]                           dc.w $0006
_01_ED_ICON:
[000ca8aa]                           dc.w $0004
[000ca8ac]                           dc.w $0002
[000ca8ae]                           dc.w $0002
[000ca8b0]                           dc.w $0018
[000ca8b2]                           dc.w $0040
[000ca8b4]                           dc.w $0000
[000ca8b6] 000ca872                  dc.l A_INNERFRAME01
[000ca8ba]                           dc.w $0001
[000ca8bc]                           dc.w $0000
[000ca8be]                           dc.w $0022
[000ca8c0]                           dc.w $0003
_02_ED_ICON:
[000ca8c2]                           dc.w $0001
[000ca8c4]                           dc.w $ffff
[000ca8c6]                           dc.w $ffff
[000ca8c8]                           dc.w $0016
[000ca8ca]                           dc.w $1005
[000ca8cc]                           dc.w $0000
[000ca8ce] 000ca7d6                  dc.l TEDI_001
[000ca8d2]                           dc.w $0001
[000ca8d4]                           dc.w $0001
[000ca8d6]                           dc.w $0020
[000ca8d8]                           dc.w $0001
_02aED_ICON:
[000ca8da] 0003178c                  dc.l edoic_list
[000ca8de] 0003160a                  dc.l edoic_new
[000ca8e2]                           dc.w $8000
[000ca8e4]                           dc.w $0000
[000ca8e6]                           dc.w $0000
[000ca8e8]                           dc.w $0000
[000ca8ea]                           dc.w $0000
[000ca8ec]                           dc.w $0000
[000ca8ee]                           dc.w $0000
[000ca8f0]                           dc.w $0000
_04_ED_ICON:
[000ca8f2]                           dc.w $0006
[000ca8f4]                           dc.w $ffff
[000ca8f6]                           dc.w $ffff
[000ca8f8]                           dc.w $0018
[000ca8fa]                           dc.w $4007
[000ca8fc]                           dc.w $0010
[000ca8fe] 000ca852                  dc.l A_3DBUTTON06
[000ca902]                           dc.w $0001
[000ca904]                           dc.w $0003
[000ca906]                           dc.w $000a
[000ca908]                           dc.w $0002
_04aED_ICON:
[000ca90a] 000316ce                  dc.l edoic_ok
[000ca90e]                           dc.w $0000
[000ca910]                           dc.w $0000
[000ca912]                           dc.w $8000
[000ca914]                           dc.w $884f
[000ca916]                           dc.w $0000
[000ca918]                           dc.w $0000
[000ca91a]                           dc.w $0000
[000ca91c]                           dc.w $0000
[000ca91e]                           dc.w $0000
[000ca920]                           dc.w $0000
_06_ED_ICON:
[000ca922]                           dc.w $0008
[000ca924]                           dc.w $ffff
[000ca926]                           dc.w $ffff
[000ca928]                           dc.w $0018
[000ca92a]                           dc.w $4005
[000ca92c]                           dc.w $0010
[000ca92e] 000ca832                  dc.l A_3DBUTTON05
[000ca932]                           dc.w $000d
[000ca934]                           dc.w $0003
[000ca936]                           dc.w $000a
[000ca938]                           dc.w $0002
_06aED_ICON:
[000ca93a] 0002f27c                  dc.l ed_abort
[000ca93e]                           dc.w $0000
[000ca940]                           dc.w $0000
[000ca942]                           dc.w $8000
[000ca944]                           dc.w $8841
[000ca946]                           dc.w $0000
[000ca948]                           dc.w $0000
[000ca94a]                           dc.w $0000
[000ca94c]                           dc.w $0000
[000ca94e]                           dc.w $0000
[000ca950]                           dc.w $0000
_08_ED_ICON:
[000ca952]                           dc.w $0000
[000ca954]                           dc.w $ffff
[000ca956]                           dc.w $ffff
[000ca958]                           dc.w $0018
[000ca95a]                           dc.w $4005
[000ca95c]                           dc.w $0010
[000ca95e] 000ca7f2                  dc.l A_3DBUTTON01
[000ca962]                           dc.w $0019
[000ca964]                           dc.w $0003
[000ca966]                           dc.w $000a
[000ca968]                           dc.w $0002
_08aED_ICON:
[000ca96a] 0003167e                  dc.l edoic_edit
[000ca96e]                           dc.w $0000
[000ca970]                           dc.w $0000
[000ca972]                           dc.w $8020
[000ca974]                           dc.w $8845
[000ca976]                           dc.w $0000
[000ca978]                           dc.w $0000
[000ca97a]                           dc.w $0000
[000ca97c]                           dc.w $0000
[000ca97e]                           dc.w $0000
[000ca980]                           dc.w $0000
sm:
[000ca982]                           dc.w $0000
[000ca984]                           dc.w $0000
[000ca986] 000316ce                  dc.l edoic_ok
[000ca98a] 0004f20a                  dc.l Aob_delete
[000ca98e] 000ca7cc                  dc.l title
[000ca992] 000ca7b9                  dc.l help_title
[000ca996]                           dc.w $0000
[000ca998]                           dc.w $0000

