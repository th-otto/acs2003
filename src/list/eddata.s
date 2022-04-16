add_data:
[000342d4] 48e7 003c                 movem.l    a2-a5,-(a7)
[000342d8] 2448                      movea.l    a0,a2
[000342da] 2849                      movea.l    a1,a4
[000342dc] 266a 0044                 movea.l    68(a2),a3
[000342e0] 006a 0001 0006            ori.w      #$0001,6(a2)
[000342e6] 3039 0008 480c            move.w     refimages,d0
[000342ec] 6718                      beq.s      add_data_1
[000342ee] 43ec 0016                 lea.l      22(a4),a1
[000342f2] 204b                      movea.l    a3,a0
[000342f4] 4eb9 0003 337c            jsr        find_entry
[000342fa] b9c8                      cmpa.l     a0,a4
[000342fc] 6608                      bne.s      add_data_1
[000342fe] 526c 0036                 addq.w     #1,54(a4)
[00034302] 204c                      movea.l    a4,a0
[00034304] 6044                      bra.s      add_data_2
add_data_1:
[00034306] 7004                      moveq.l    #4,d0
[00034308] 204b                      movea.l    a3,a0
[0003430a] 4eb9 0001 8028            jsr        objextent
[00034310] 4a40                      tst.w      d0
[00034312] 6610                      bne.s      add_data_3
[00034314] 224c                      movea.l    a4,a1
[00034316] 204a                      movea.l    a2,a0
[00034318] 4eb9 0003 4350            jsr        copy_data
[0003431e] 2a48                      movea.l    a0,a5
[00034320] 200d                      move.l     a5,d0
[00034322] 6604                      bne.s      add_data_4
add_data_3:
[00034324] 91c8                      suba.l     a0,a0
[00034326] 6022                      bra.s      add_data_2
add_data_4:
[00034328] 2f39 000c deca            move.l     $000CDECA,-(a7)
[0003432e] 486c 0016                 pea.l      22(a4)
[00034332] 224d                      movea.l    a5,a1
[00034334] 204a                      movea.l    a2,a0
[00034336] 4eb9 0001 81c6            jsr        objname
[0003433c] 504f                      addq.w     #8,a7
[0003433e] 224d                      movea.l    a5,a1
[00034340] 204b                      movea.l    a3,a0
[00034342] 4eb9 0003 33b4            jsr        add_entry
[00034348] 204d                      movea.l    a5,a0
add_data_2:
[0003434a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003434e] 4e75                      rts

copy_data:
[00034350] 48e7 003c                 movem.l    a2-a5,-(a7)
[00034354] 2648                      movea.l    a0,a3
[00034356] 2449                      movea.l    a1,a2
[00034358] 202a 000e                 move.l     14(a2),d0
[0003435c] 4eb9 0001 7fae            jsr        objmalloc
[00034362] 2648                      movea.l    a0,a3
[00034364] 200b                      move.l     a3,d0
[00034366] 6604                      bne.s      copy_data_1
[00034368] 91c8                      suba.l     a0,a0
[0003436a] 601e                      bra.s      copy_data_2
copy_data_1:
[0003436c] 276a 000e 000e            move.l     14(a2),14(a3)
[00034372] 286a 0004                 movea.l    4(a2),a4
[00034376] 2a6b 0004                 movea.l    4(a3),a5
[0003437a] 202a 000e                 move.l     14(a2),d0
[0003437e] 224c                      movea.l    a4,a1
[00034380] 204d                      movea.l    a5,a0
[00034382] 4eb9 0008 3500            jsr        memcpy
[00034388] 204b                      movea.l    a3,a0
copy_data_2:
[0003438a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003438e] 4e75                      rts

dup_data:
[00034390] 2f0a                      move.l     a2,-(a7)
[00034392] 2f0b                      move.l     a3,-(a7)
[00034394] 2648                      movea.l    a0,a3
[00034396] 45f9 000c dee4            lea.l      free_data,a2
[0003439c] 2549 0004                 move.l     a1,4(a2)
[000343a0] 2540 000a                 move.l     d0,10(a2)
[000343a4] 2540 000e                 move.l     d0,14(a2)
[000343a8] 224a                      movea.l    a2,a1
[000343aa] 204b                      movea.l    a3,a0
[000343ac] 6100 ff26                 bsr        add_data
[000343b0] 265f                      movea.l    (a7)+,a3
[000343b2] 245f                      movea.l    (a7)+,a2
[000343b4] 4e75                      rts

del_data:
[000343b6] 48e7 003c                 movem.l    a2-a5,-(a7)
[000343ba] 2448                      movea.l    a0,a2
[000343bc] 2649                      movea.l    a1,a3
[000343be] 006a 0001 0006            ori.w      #$0001,6(a2)
[000343c4] 536b 0036                 subq.w     #1,54(a3)
[000343c8] 302b 0036                 move.w     54(a3),d0
[000343cc] 6e2a                      bgt.s      del_data_1
[000343ce] 286b 0012                 movea.l    18(a3),a4
[000343d2] 220c                      move.l     a4,d1
[000343d4] 670c                      beq.s      del_data_2
[000343d6] 2a6c 0004                 movea.l    4(a4),a5
[000343da] 204c                      movea.l    a4,a0
[000343dc] 7002                      moveq.l    #2,d0
[000343de] 93c9                      suba.l     a1,a1
[000343e0] 4e95                      jsr        (a5)
del_data_2:
[000343e2] 224b                      movea.l    a3,a1
[000343e4] 206a 0044                 movea.l    68(a2),a0
[000343e8] 4eb9 0003 3420            jsr        del_entry
[000343ee] 224b                      movea.l    a3,a1
[000343f0] 204a                      movea.l    a2,a0
[000343f2] 4eb9 0001 7f52            jsr        objfree
del_data_1:
[000343f8] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000343fc] 4e75                      rts

new_work:
[000343fe] 303c 2724                 move.w     #$2724,d0
[00034402] 2279 000a 9482            movea.l    $000A9482,a1
[00034408] 4eb9 0003 3dd6            jsr        work_icon
[0003440e] 4e75                      rts

