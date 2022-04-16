add_men:
[00035770] 48e7 003c                 movem.l    a2-a5,-(a7)
[00035774] 2448                      movea.l    a0,a2
[00035776] 2849                      movea.l    a1,a4
[00035778] 006a 0001 0006            ori.w      #$0001,6(a2)
[0003577e] 266a 001c                 movea.l    28(a2),a3
[00035782] 7038                      moveq.l    #56,d0
[00035784] 204b                      movea.l    a3,a0
[00035786] 4eb9 0001 8028            jsr        objextent
[0003578c] 4a40                      tst.w      d0
[0003578e] 6610                      bne.s      add_men_1
[00035790] 224c                      movea.l    a4,a1
[00035792] 204a                      movea.l    a2,a0
[00035794] 4eb9 0003 57cc            jsr        copy_men
[0003579a] 2a48                      movea.l    a0,a5
[0003579c] 200d                      move.l     a5,d0
[0003579e] 6604                      bne.s      add_men_2
add_men_1:
[000357a0] 91c8                      suba.l     a0,a0
[000357a2] 6022                      bra.s      add_men_3
add_men_2:
[000357a4] 2f39 000c ec42            move.l     $000CEC42,-(a7)
[000357aa] 486c 0016                 pea.l      22(a4)
[000357ae] 224d                      movea.l    a5,a1
[000357b0] 204a                      movea.l    a2,a0
[000357b2] 4eb9 0001 81c6            jsr        objname
[000357b8] 504f                      addq.w     #8,a7
[000357ba] 224d                      movea.l    a5,a1
[000357bc] 204b                      movea.l    a3,a0
[000357be] 4eb9 0003 33b4            jsr        add_entry
[000357c4] 204d                      movea.l    a5,a0
add_men_3:
[000357c6] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000357ca] 4e75                      rts

copy_men:
[000357cc] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[000357d0] 2648                      movea.l    a0,a3
[000357d2] 2449                      movea.l    a1,a2
[000357d4] 202a 000e                 move.l     14(a2),d0
[000357d8] 4eb9 0001 7fae            jsr        objmalloc
[000357de] 2848                      movea.l    a0,a4
[000357e0] 200c                      move.l     a4,d0
[000357e2] 6604                      bne.s      copy_men_1
[000357e4] 91c8                      suba.l     a0,a0
[000357e6] 6046                      bra.s      copy_men_2
copy_men_1:
[000357e8] 202a 000e                 move.l     14(a2),d0
[000357ec] 7238                      moveq.l    #56,d1
[000357ee] 4eb9 0008 3c5a            jsr        _uldiv
[000357f4] 2600                      move.l     d0,d3
[000357f6] 2a6a 0004                 movea.l    4(a2),a5
[000357fa] 2c6c 0004                 movea.l    4(a4),a6
[000357fe] 4244                      clr.w      d4
[00035800] 6020                      bra.s      copy_men_3
[00035802] 3204                      move.w     d4,d1
copy_men_4:
[00035804] 48c1                      ext.l      d1
[00035806] 2001                      move.l     d1,d0
[00035808] e788                      lsl.l      #3,d0
[0003580a] 9081                      sub.l      d1,d0
[0003580c] e788                      lsl.l      #3,d0
[0003580e] 4875 0800                 pea.l      0(a5,d0.l)
[00035812] 43f6 0800                 lea.l      0(a6,d0.l),a1
[00035816] 204b                      movea.l    a3,a0
[00035818] 4eb9 0002 cf48            jsr        copy_ob
[0003581e] 584f                      addq.w     #4,a7
[00035820] 5244                      addq.w     #1,d4
copy_men_3:
[00035822] b644                      cmp.w      d4,d3
[00035824] 6edc                      bgt.s      copy_men_4
[00035826] 296a 000e 000e            move.l     14(a2),14(a4)
[0003582c] 204c                      movea.l    a4,a0
copy_men_2:
[0003582e] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[00035832] 4e75                      rts

del_men:
[00035834] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00035838] 2448                      movea.l    a0,a2
[0003583a] 2649                      movea.l    a1,a3
[0003583c] 006a 0001 0006            ori.w      #$0001,6(a2)
[00035842] 536b 0036                 subq.w     #1,54(a3)
[00035846] 302b 0036                 move.w     54(a3),d0
[0003584a] 6e5e                      bgt.s      del_men_1
[0003584c] 286b 0012                 movea.l    18(a3),a4
[00035850] 220c                      move.l     a4,d1
[00035852] 670c                      beq.s      del_men_2
[00035854] 2a6c 0004                 movea.l    4(a4),a5
[00035858] 204c                      movea.l    a4,a0
[0003585a] 7002                      moveq.l    #2,d0
[0003585c] 93c9                      suba.l     a1,a1
[0003585e] 4e95                      jsr        (a5)
del_men_2:
[00035860] 202b 000e                 move.l     14(a3),d0
[00035864] 7238                      moveq.l    #56,d1
[00035866] 4eb9 0008 3c5a            jsr        _uldiv
[0003586c] 2600                      move.l     d0,d3
[0003586e] 286b 0004                 movea.l    4(a3),a4
[00035872] 4244                      clr.w      d4
[00035874] 601a                      bra.s      del_men_3
[00035876] 3204                      move.w     d4,d1
del_men_4:
[00035878] 48c1                      ext.l      d1
[0003587a] 2001                      move.l     d1,d0
[0003587c] e788                      lsl.l      #3,d0
[0003587e] 9081                      sub.l      d1,d0
[00035880] e788                      lsl.l      #3,d0
[00035882] 43f4 0800                 lea.l      0(a4,d0.l),a1
[00035886] 204a                      movea.l    a2,a0
[00035888] 4eb9 0002 d214            jsr        del_ob
[0003588e] 5244                      addq.w     #1,d4
del_men_3:
[00035890] b644                      cmp.w      d4,d3
[00035892] 6ee2                      bgt.s      del_men_4
[00035894] 224b                      movea.l    a3,a1
[00035896] 206a 001c                 movea.l    28(a2),a0
[0003589a] 4eb9 0003 3420            jsr        del_entry
[000358a0] 224b                      movea.l    a3,a1
[000358a2] 204a                      movea.l    a2,a0
[000358a4] 4eb9 0001 7f52            jsr        objfree
del_men_1:
[000358aa] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[000358ae] 4e75                      rts

new_work:
[000358b0] 303c 2711                 move.w     #$2711,d0
[000358b4] 2279 000c 8d94            movea.l    $000C8D94,a1
[000358ba] 4eb9 0003 3dd6            jsr        work_icon
[000358c0] 4e75                      rts

	.data

aboutme:
[000ce802]                           dc.w $0000
[000ce804]                           dc.w $0000
[000ce806] 000cce5a                  dc.l ABOUT
[000ce80a]                           dc.w $0000
[000ce80c]                           dc.w $0000
[000ce80e]                           dc.w $0010
[000ce810]                           dc.w $0000
[000ce812]                           dc.w $0010
[000ce814]                           dc.w $0000
[000ce816]                           dc.w $0000
[000ce818]                           dc.b 'TEXT_01',0
[000ce820]                           dc.w $0000
[000ce822]                           dc.w $0000
[000ce824]                           dc.w $0000
[000ce826]                           dc.w $0000
[000ce828]                           dc.w $0000
[000ce82a]                           dc.w $0000
[000ce82c]                           dc.w $0000
[000ce82e]                           dc.w $0000
[000ce830]                           dc.w $0000
[000ce832]                           dc.w $0000
[000ce834]                           dc.w $0000
[000ce836]                           dc.w $0000
[000ce838]                           dc.w $0001
[000ce83a]                           dc.w $0000
[000ce83c]                           dc.w $0000
[000ce83e]                           dc.w $0000
[000ce840]                           dc.w $0000
[000ce842]                           dc.w $0000
sep:
[000ce844]                           dc.b '--------------------',0
[000ce859]                           dc.b $00
separator:
[000ce85a]                           dc.w $0000
[000ce85c]                           dc.w $0000
[000ce85e] 000ce844                  dc.l sep
[000ce862]                           dc.w $0000
[000ce864]                           dc.w $0000
[000ce866]                           dc.w $0015
[000ce868]                           dc.w $0000
[000ce86a]                           dc.w $0015
[000ce86c]                           dc.w $0000
[000ce86e]                           dc.w $0000
[000ce870]                           dc.b 'TEXT_01',0
[000ce878]                           dc.w $0000
[000ce87a]                           dc.w $0000
[000ce87c]                           dc.w $0000
[000ce87e]                           dc.w $0000
[000ce880]                           dc.w $0000
[000ce882]                           dc.w $0000
[000ce884]                           dc.w $0000
[000ce886]                           dc.w $0000
[000ce888]                           dc.w $0000
[000ce88a]                           dc.w $0000
[000ce88c]                           dc.w $0000
[000ce88e]                           dc.w $0000
[000ce890]                           dc.w $0001
[000ce892]                           dc.w $0000
[000ce894]                           dc.w $0000
[000ce896]                           dc.w $0000
[000ce898]                           dc.w $0000
[000ce89a]                           dc.w $0000
dummy:
[000ce89c]                           dc.w $0000
anystr:
[000ce89e]                           dc.w $0000
[000ce8a0]                           dc.w $0000
[000ce8a2] 000ce89c                  dc.l dummy
[000ce8a6]                           dc.w $0000
[000ce8a8]                           dc.w $0000
[000ce8aa]                           dc.w $0001
[000ce8ac]                           dc.w $0000
[000ce8ae]                           dc.w $0001
[000ce8b0]                           dc.w $0000
[000ce8b2]                           dc.w $0000
[000ce8b4]                           dc.b 'NULL_STRING',0
[000ce8c0]                           dc.w $0000
[000ce8c2]                           dc.w $0000
[000ce8c4]                           dc.w $0000
[000ce8c6]                           dc.w $0000
[000ce8c8]                           dc.w $0000
[000ce8ca]                           dc.w $0000
[000ce8cc]                           dc.w $0000
[000ce8ce]                           dc.w $0000
[000ce8d0]                           dc.w $0000
[000ce8d2]                           dc.w $0000
[000ce8d4]                           dc.w $0001
[000ce8d6]                           dc.w $0000
[000ce8d8]                           dc.w $0000
[000ce8da]                           dc.w $0000
[000ce8dc]                           dc.w $0000
[000ce8de]                           dc.w $0000
protomen:
[000ce8e0]                           dc.w $0000
[000ce8e2]                           dc.w $0000
[000ce8e4]                           dc.w $0000
[000ce8e6]                           dc.w $0000
[000ce8e8]                           dc.w $ffff
[000ce8ea]                           dc.w $0001
[000ce8ec]                           dc.w $0004
[000ce8ee]                           dc.w $0019
[000ce8f0]                           dc.w $0000
[000ce8f2]                           dc.w $0000
[000ce8f4]                           dc.w $0000
[000ce8f6]                           dc.w $0000
[000ce8f8]                           dc.w $0000
[000ce8fa]                           dc.w $0000
[000ce8fc]                           dc.w $005a
[000ce8fe]                           dc.w $0019
[000ce900]                           dc.w $0000
[000ce902]                           dc.w $0000
[000ce904]                           dc.w $0000
[000ce906]                           dc.w $0000
[000ce908]                           dc.w $8000
[000ce90a]                           dc.w $0000
[000ce90c]                           dc.w $0000
[000ce90e]                           dc.w $0000
[000ce910]                           dc.w $0000
[000ce912]                           dc.w $0000
[000ce914]                           dc.w $0000
[000ce916]                           dc.w $0000
[000ce918]                           dc.w $0000
[000ce91a]                           dc.w $0000
[000ce91c]                           dc.w $0000
[000ce91e]                           dc.w $0000
[000ce920]                           dc.w $0004
[000ce922]                           dc.w $0002
[000ce924]                           dc.w $0002
[000ce926]                           dc.w $0014
[000ce928]                           dc.w $0000
[000ce92a]                           dc.w $0000
[000ce92c]                           dc.w $0000
[000ce92e]                           dc.w $1100
[000ce930]                           dc.w $0000
[000ce932]                           dc.w $0000
[000ce934]                           dc.w $005a
[000ce936]                           dc.w $0201
[000ce938]                           dc.w $0000
[000ce93a]                           dc.w $0000
[000ce93c]                           dc.w $0000
[000ce93e]                           dc.w $0000
[000ce940]                           dc.w $8000
[000ce942]                           dc.w $0000
[000ce944]                           dc.w $0000
[000ce946]                           dc.w $0000
[000ce948]                           dc.w $0000
[000ce94a]                           dc.w $0000
[000ce94c]                           dc.w $0000
[000ce94e]                           dc.w $0000
[000ce950]                           dc.w $0000
[000ce952]                           dc.w $0000
[000ce954]                           dc.w $0000
[000ce956]                           dc.w $0000
[000ce958]                           dc.w $0001
[000ce95a]                           dc.w $0003
[000ce95c]                           dc.w $0003
[000ce95e]                           dc.w $0019
[000ce960]                           dc.w $0000
[000ce962]                           dc.w $0000
[000ce964]                           dc.w $0000
[000ce966]                           dc.w $0000
[000ce968]                           dc.w $0002
[000ce96a]                           dc.w $0000
[000ce96c]                           dc.w $0006
[000ce96e]                           dc.w $0301
[000ce970]                           dc.w $0000
[000ce972]                           dc.w $0000
[000ce974]                           dc.w $0000
[000ce976]                           dc.w $0000
[000ce978]                           dc.w $8000
[000ce97a]                           dc.w $0000
[000ce97c]                           dc.w $0000
[000ce97e]                           dc.w $0000
[000ce980]                           dc.w $0000
[000ce982]                           dc.w $0000
[000ce984]                           dc.w $0000
[000ce986]                           dc.w $0000
[000ce988]                           dc.w $0000
[000ce98a]                           dc.w $0000
[000ce98c]                           dc.w $0000
[000ce98e]                           dc.w $0000
[000ce990]                           dc.w $0002
[000ce992]                           dc.w $ffff
[000ce994]                           dc.w $ffff
[000ce996]                           dc.w $0020
[000ce998]                           dc.w $0000
[000ce99a]                           dc.w $0000
[000ce99c] 000ce89e                  dc.l anystr
[000ce9a0]                           dc.w $0000
[000ce9a2]                           dc.w $0000
[000ce9a4]                           dc.w $0006
[000ce9a6]                           dc.w $0301
[000ce9a8]                           dc.w $0000
[000ce9aa]                           dc.w $0000
[000ce9ac]                           dc.w $0000
[000ce9ae]                           dc.w $0000
[000ce9b0]                           dc.w $8000
[000ce9b2]                           dc.w $0000
[000ce9b4]                           dc.w $0000
[000ce9b6]                           dc.w $0000
[000ce9b8]                           dc.w $0000
[000ce9ba]                           dc.w $0000
[000ce9bc]                           dc.w $0000
[000ce9be]                           dc.w $0000
[000ce9c0]                           dc.w $0000
[000ce9c2]                           dc.w $0000
[000ce9c4]                           dc.w $0000
[000ce9c6]                           dc.w $0000
[000ce9c8]                           dc.w $0000
[000ce9ca]                           dc.w $0005
[000ce9cc]                           dc.w $0005
[000ce9ce]                           dc.w $0019
[000ce9d0]                           dc.w $0000
[000ce9d2]                           dc.w $0000
[000ce9d4]                           dc.w $0000
[000ce9d6]                           dc.w $0000
[000ce9d8]                           dc.w $0000
[000ce9da]                           dc.w $0301
[000ce9dc]                           dc.w $0050
[000ce9de]                           dc.w $0013
[000ce9e0]                           dc.w $0000
[000ce9e2]                           dc.w $0000
[000ce9e4]                           dc.w $0000
[000ce9e6]                           dc.w $0000
[000ce9e8]                           dc.w $8000
[000ce9ea]                           dc.w $0000
[000ce9ec]                           dc.w $0000
[000ce9ee]                           dc.w $0000
[000ce9f0]                           dc.w $0000
[000ce9f2]                           dc.w $0000
[000ce9f4]                           dc.w $0000
[000ce9f6]                           dc.w $0000
[000ce9f8]                           dc.w $0000
[000ce9fa]                           dc.w $0000
[000ce9fc]                           dc.w $0000
[000ce9fe]                           dc.w $0000
[000cea00]                           dc.w $0004
[000cea02]                           dc.w $0006
[000cea04]                           dc.w $000d
[000cea06]                           dc.w $0014
[000cea08]                           dc.w $0000
[000cea0a]                           dc.w $0000
[000cea0c]                           dc.w $00ff
[000cea0e]                           dc.w $1100
[000cea10]                           dc.w $0002
[000cea12]                           dc.w $0000
[000cea14]                           dc.w $0014
[000cea16]                           dc.w $0008
[000cea18]                           dc.w $0000
[000cea1a]                           dc.w $0000
[000cea1c]                           dc.w $0000
[000cea1e]                           dc.w $0000
[000cea20]                           dc.w $8000
[000cea22]                           dc.w $0000
[000cea24]                           dc.w $0000
[000cea26]                           dc.w $0000
[000cea28]                           dc.w $0000
[000cea2a]                           dc.w $0000
[000cea2c]                           dc.w $0000
[000cea2e]                           dc.w $0000
[000cea30]                           dc.w $0000
[000cea32]                           dc.w $0000
[000cea34]                           dc.w $0000
[000cea36]                           dc.w $0000
[000cea38]                           dc.w $0007
[000cea3a]                           dc.w $ffff
[000cea3c]                           dc.w $ffff
[000cea3e]                           dc.w $001c
[000cea40]                           dc.w $0000
[000cea42]                           dc.w $2000
[000cea44] 000ce802                  dc.l aboutme
[000cea48]                           dc.w $0000
[000cea4a]                           dc.w $0000
[000cea4c]                           dc.w $0014
[000cea4e]                           dc.w $0001
[000cea50]                           dc.w $0000
[000cea52]                           dc.w $0000
[000cea54]                           dc.w $0000
[000cea56]                           dc.w $0000
[000cea58]                           dc.w $8000
[000cea5a]                           dc.w $0000
[000cea5c]                           dc.w $0000
[000cea5e]                           dc.w $0000
[000cea60]                           dc.w $0000
[000cea62]                           dc.w $0000
[000cea64]                           dc.w $0000
[000cea66]                           dc.w $0000
[000cea68]                           dc.w $0000
[000cea6a]                           dc.w $0000
[000cea6c]                           dc.w $0000
[000cea6e]                           dc.w $0000
[000cea70]                           dc.w $0008
[000cea72]                           dc.w $ffff
[000cea74]                           dc.w $ffff
[000cea76]                           dc.w $001c
[000cea78]                           dc.w $0000
[000cea7a]                           dc.w $2008
[000cea7c] 000ce85a                  dc.l separator
[000cea80]                           dc.w $0000
[000cea82]                           dc.w $0001
[000cea84]                           dc.w $0014
[000cea86]                           dc.w $0001
[000cea88]                           dc.w $0000
[000cea8a]                           dc.w $0000
[000cea8c]                           dc.w $0000
[000cea8e]                           dc.w $0000
[000cea90]                           dc.w $8000
[000cea92]                           dc.w $0000
[000cea94]                           dc.w $0000
[000cea96]                           dc.w $0000
[000cea98]                           dc.w $0000
[000cea9a]                           dc.w $0000
[000cea9c]                           dc.w $0000
[000cea9e]                           dc.w $0000
[000ceaa0]                           dc.w $0000
[000ceaa2]                           dc.w $0000
[000ceaa4]                           dc.w $0000
[000ceaa6]                           dc.w $0000
[000ceaa8]                           dc.w $0009
[000ceaaa]                           dc.w $ffff
[000ceaac]                           dc.w $ffff
[000ceaae]                           dc.w $001c
[000ceab0]                           dc.w $0000
[000ceab2]                           dc.w $2000
[000ceab4] 000ce89e                  dc.l anystr
[000ceab8]                           dc.w $0000
[000ceaba]                           dc.w $0002
[000ceabc]                           dc.w $0014
[000ceabe]                           dc.w $0001
[000ceac0]                           dc.w $0000
[000ceac2]                           dc.w $0000
[000ceac4]                           dc.w $0000
[000ceac6]                           dc.w $0000
[000ceac8]                           dc.w $8000
[000ceaca]                           dc.w $0000
[000ceacc]                           dc.w $0000
[000ceace]                           dc.w $0000
[000cead0]                           dc.w $0000
[000cead2]                           dc.w $0000
[000cead4]                           dc.w $0000
[000cead6]                           dc.w $0000
[000cead8]                           dc.w $0000
[000ceada]                           dc.w $0000
[000ceadc]                           dc.w $0000
[000ceade]                           dc.w $0000
[000ceae0]                           dc.w $000a
[000ceae2]                           dc.w $ffff
[000ceae4]                           dc.w $ffff
[000ceae6]                           dc.w $001c
[000ceae8]                           dc.w $0000
[000ceaea]                           dc.w $2000
[000ceaec] 000ce89e                  dc.l anystr
[000ceaf0]                           dc.w $0000
[000ceaf2]                           dc.w $0003
[000ceaf4]                           dc.w $0014
[000ceaf6]                           dc.w $0001
[000ceaf8]                           dc.w $0000
[000ceafa]                           dc.w $0000
[000ceafc]                           dc.w $0000
[000ceafe]                           dc.w $0000
[000ceb00]                           dc.w $8000
[000ceb02]                           dc.w $0000
[000ceb04]                           dc.w $0000
[000ceb06]                           dc.w $0000
[000ceb08]                           dc.w $0000
[000ceb0a]                           dc.w $0000
[000ceb0c]                           dc.w $0000
[000ceb0e]                           dc.w $0000
[000ceb10]                           dc.w $0000
[000ceb12]                           dc.w $0000
[000ceb14]                           dc.w $0000
[000ceb16]                           dc.w $0000
[000ceb18]                           dc.w $000b
[000ceb1a]                           dc.w $ffff
[000ceb1c]                           dc.w $ffff
[000ceb1e]                           dc.w $001c
[000ceb20]                           dc.w $0000
[000ceb22]                           dc.w $2000
[000ceb24] 000ce89e                  dc.l anystr
[000ceb28]                           dc.w $0000
[000ceb2a]                           dc.w $0004
[000ceb2c]                           dc.w $0014
[000ceb2e]                           dc.w $0001
[000ceb30]                           dc.w $0000
[000ceb32]                           dc.w $0000
[000ceb34]                           dc.w $0000
[000ceb36]                           dc.w $0000
[000ceb38]                           dc.w $8000
[000ceb3a]                           dc.w $0000
[000ceb3c]                           dc.w $0000
[000ceb3e]                           dc.w $0000
[000ceb40]                           dc.w $0000
[000ceb42]                           dc.w $0000
[000ceb44]                           dc.w $0000
[000ceb46]                           dc.w $0000
[000ceb48]                           dc.w $0000
[000ceb4a]                           dc.w $0000
[000ceb4c]                           dc.w $0000
[000ceb4e]                           dc.w $0000
[000ceb50]                           dc.w $000c
[000ceb52]                           dc.w $ffff
[000ceb54]                           dc.w $ffff
[000ceb56]                           dc.w $001c
[000ceb58]                           dc.w $0000
[000ceb5a]                           dc.w $2000
[000ceb5c] 000ce89e                  dc.l anystr
[000ceb60]                           dc.w $0000
[000ceb62]                           dc.w $0005
[000ceb64]                           dc.w $0014
[000ceb66]                           dc.w $0001
[000ceb68]                           dc.w $0000
[000ceb6a]                           dc.w $0000
[000ceb6c]                           dc.w $0000
[000ceb6e]                           dc.w $0000
[000ceb70]                           dc.w $8000
[000ceb72]                           dc.w $0000
[000ceb74]                           dc.w $0000
[000ceb76]                           dc.w $0000
[000ceb78]                           dc.w $0000
[000ceb7a]                           dc.w $0000
[000ceb7c]                           dc.w $0000
[000ceb7e]                           dc.w $0000
[000ceb80]                           dc.w $0000
[000ceb82]                           dc.w $0000
[000ceb84]                           dc.w $0000
[000ceb86]                           dc.w $0000
[000ceb88]                           dc.w $000d
[000ceb8a]                           dc.w $ffff
[000ceb8c]                           dc.w $ffff
[000ceb8e]                           dc.w $001c
[000ceb90]                           dc.w $0000
[000ceb92]                           dc.w $2000
[000ceb94] 000ce89e                  dc.l anystr
[000ceb98]                           dc.w $0000
[000ceb9a]                           dc.w $0006
[000ceb9c]                           dc.w $0014
[000ceb9e]                           dc.w $0001
[000ceba0]                           dc.w $0000
[000ceba2]                           dc.w $0000
[000ceba4]                           dc.w $0000
[000ceba6]                           dc.w $0000
[000ceba8]                           dc.w $8000
[000cebaa]                           dc.w $0000
[000cebac]                           dc.w $0000
[000cebae]                           dc.w $0000
[000cebb0]                           dc.w $0000
[000cebb2]                           dc.w $0000
[000cebb4]                           dc.w $0000
[000cebb6]                           dc.w $0000
[000cebb8]                           dc.w $0000
[000cebba]                           dc.w $0000
[000cebbc]                           dc.w $0000
[000cebbe]                           dc.w $0000
[000cebc0]                           dc.w $0005
[000cebc2]                           dc.w $ffff
[000cebc4]                           dc.w $ffff
[000cebc6]                           dc.w $001c
[000cebc8]                           dc.w $0000
[000cebca]                           dc.w $2000
[000cebcc] 000ce89e                  dc.l anystr
[000cebd0]                           dc.w $0000
[000cebd2]                           dc.w $0007
[000cebd4]                           dc.w $0014
[000cebd6]                           dc.w $0001
[000cebd8]                           dc.w $0000
[000cebda]                           dc.w $0000
[000cebdc]                           dc.w $0000
[000cebde]                           dc.w $0000
[000cebe0]                           dc.w $8000
[000cebe2]                           dc.w $0000
[000cebe4]                           dc.w $0000
[000cebe6]                           dc.w $0000
[000cebe8]                           dc.w $0000
[000cebea]                           dc.w $0000
[000cebec]                           dc.w $0000
[000cebee]                           dc.w $0000
protomenu:
[000cebf0]                           dc.w $0000
[000cebf2]                           dc.w $0000
[000cebf4] 000ce8e0                  dc.l protomen
[000cebf8]                           dc.w $0000
[000cebfa]                           dc.w $0000
[000cebfc]                           dc.w $0310
[000cebfe]                           dc.w $0000
[000cec00]                           dc.w $0310
[000cec02]                           dc.w $0000
[000cec04]                           dc.w $0000
[000cec06]                           dc.b 'MENU_01',0
[000cec0e]                           dc.w $0000
[000cec10]                           dc.w $0000
[000cec12]                           dc.w $0000
[000cec14]                           dc.w $0000
[000cec16]                           dc.w $0000
[000cec18]                           dc.w $0000
[000cec1a]                           dc.w $0000
[000cec1c]                           dc.w $0000
[000cec1e]                           dc.w $0000
[000cec20]                           dc.w $0000
[000cec22]                           dc.w $0000
[000cec24]                           dc.w $0000
[000cec26]                           dc.w $0001
[000cec28]                           dc.w $0000
[000cec2a]                           dc.w $0000
[000cec2c]                           dc.w $0000
[000cec2e]                           dc.w $0000
[000cec30]                           dc.w $0000
list_menu:
[000cec32]                           dc.w $0000
[000cec34]                           dc.w $0000
[000cec36]                           dc.w $0000
[000cec38]                           dc.w $0000
[000cec3a] 000c8d3a                  dc.l WI_MENU
[000cec3e] 000cd046                  dc.l me_list
[000cec42] 000cd053                  dc.l me_name
[000cec46]                           dc.w $2711
[000cec48] 000cebf0                  dc.l protomenu
[000cec4c] 000357cc                  dc.l copy_men
[000cec50] 00035834                  dc.l del_men
[000cec54] 000358b0                  dc.l new_work
[000cec58]                           dc.w $0000
[000cec5a]                           dc.w $0000
