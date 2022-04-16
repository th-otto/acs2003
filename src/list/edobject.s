add_object:
[000359de] 48e7 003c                 movem.l    a2-a5,-(a7)
[000359e2] 2448                      movea.l    a0,a2
[000359e4] 2849                      movea.l    a1,a4
[000359e6] 006a 0001 0006            ori.w      #$0001,6(a2)
[000359ec] 266a 0018                 movea.l    24(a2),a3
[000359f0] 7038                      moveq.l    #56,d0
[000359f2] 204b                      movea.l    a3,a0
[000359f4] 4eb9 0001 8028            jsr        objextent
[000359fa] 4a40                      tst.w      d0
[000359fc] 6610                      bne.s      add_object_1
[000359fe] 224c                      movea.l    a4,a1
[00035a00] 204a                      movea.l    a2,a0
[00035a02] 4eb9 0003 5a3a            jsr        copy_obj
[00035a08] 2a48                      movea.l    a0,a5
[00035a0a] 200d                      move.l     a5,d0
[00035a0c] 6604                      bne.s      add_object_2
add_object_1:
[00035a0e] 91c8                      suba.l     a0,a0
[00035a10] 6022                      bra.s      add_object_3
add_object_2:
[00035a12] 2f39 000c ed9c            move.l     $000CED9C,-(a7)
[00035a18] 486c 0016                 pea.l      22(a4)
[00035a1c] 224d                      movea.l    a5,a1
[00035a1e] 204a                      movea.l    a2,a0
[00035a20] 4eb9 0001 81c6            jsr        objname
[00035a26] 504f                      addq.w     #8,a7
[00035a28] 224d                      movea.l    a5,a1
[00035a2a] 204b                      movea.l    a3,a0
[00035a2c] 4eb9 0003 33b4            jsr        add_entry
[00035a32] 204d                      movea.l    a5,a0
add_object_3:
[00035a34] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00035a38] 4e75                      rts

copy_obj:
[00035a3a] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[00035a3e] 2648                      movea.l    a0,a3
[00035a40] 2449                      movea.l    a1,a2
[00035a42] 202a 000e                 move.l     14(a2),d0
[00035a46] 4eb9 0001 7fae            jsr        objmalloc
[00035a4c] 2848                      movea.l    a0,a4
[00035a4e] 200c                      move.l     a4,d0
[00035a50] 6604                      bne.s      copy_obj_1
[00035a52] 91c8                      suba.l     a0,a0
[00035a54] 6046                      bra.s      copy_obj_2
copy_obj_1:
[00035a56] 202a 000e                 move.l     14(a2),d0
[00035a5a] 7238                      moveq.l    #56,d1
[00035a5c] 4eb9 0008 3c5a            jsr        _uldiv
[00035a62] 2600                      move.l     d0,d3
[00035a64] 2a6a 0004                 movea.l    4(a2),a5
[00035a68] 2c6c 0004                 movea.l    4(a4),a6
[00035a6c] 4244                      clr.w      d4
[00035a6e] 6020                      bra.s      copy_obj_3
[00035a70] 3204                      move.w     d4,d1
copy_obj_4:
[00035a72] 48c1                      ext.l      d1
[00035a74] 2001                      move.l     d1,d0
[00035a76] e788                      lsl.l      #3,d0
[00035a78] 9081                      sub.l      d1,d0
[00035a7a] e788                      lsl.l      #3,d0
[00035a7c] 4875 0800                 pea.l      0(a5,d0.l)
[00035a80] 43f6 0800                 lea.l      0(a6,d0.l),a1
[00035a84] 204b                      movea.l    a3,a0
[00035a86] 4eb9 0002 cf48            jsr        copy_ob
[00035a8c] 584f                      addq.w     #4,a7
[00035a8e] 5244                      addq.w     #1,d4
copy_obj_3:
[00035a90] b644                      cmp.w      d4,d3
[00035a92] 6edc                      bgt.s      copy_obj_4
[00035a94] 296a 000e 000e            move.l     14(a2),14(a4)
[00035a9a] 204c                      movea.l    a4,a0
copy_obj_2:
[00035a9c] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[00035aa0] 4e75                      rts

del_object:
[00035aa2] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00035aa6] 2448                      movea.l    a0,a2
[00035aa8] 2649                      movea.l    a1,a3
[00035aaa] 006a 0001 0006            ori.w      #$0001,6(a2)
[00035ab0] 536b 0036                 subq.w     #1,54(a3)
[00035ab4] 302b 0036                 move.w     54(a3),d0
[00035ab8] 6e5e                      bgt.s      del_object_1
[00035aba] 286b 0012                 movea.l    18(a3),a4
[00035abe] 220c                      move.l     a4,d1
[00035ac0] 670c                      beq.s      del_object_2
[00035ac2] 2a6c 0004                 movea.l    4(a4),a5
[00035ac6] 204c                      movea.l    a4,a0
[00035ac8] 7002                      moveq.l    #2,d0
[00035aca] 93c9                      suba.l     a1,a1
[00035acc] 4e95                      jsr        (a5)
del_object_2:
[00035ace] 202b 000e                 move.l     14(a3),d0
[00035ad2] 7238                      moveq.l    #56,d1
[00035ad4] 4eb9 0008 3c5a            jsr        _uldiv
[00035ada] 2600                      move.l     d0,d3
[00035adc] 286b 0004                 movea.l    4(a3),a4
[00035ae0] 4244                      clr.w      d4
[00035ae2] 601a                      bra.s      del_object_3
[00035ae4] 3204                      move.w     d4,d1
del_object_4:
[00035ae6] 48c1                      ext.l      d1
[00035ae8] 2001                      move.l     d1,d0
[00035aea] e788                      lsl.l      #3,d0
[00035aec] 9081                      sub.l      d1,d0
[00035aee] e788                      lsl.l      #3,d0
[00035af0] 43f4 0800                 lea.l      0(a4,d0.l),a1
[00035af4] 204a                      movea.l    a2,a0
[00035af6] 4eb9 0002 d214            jsr        del_ob
[00035afc] 5244                      addq.w     #1,d4
del_object_3:
[00035afe] b644                      cmp.w      d4,d3
[00035b00] 6ee2                      bgt.s      del_object_4
[00035b02] 224b                      movea.l    a3,a1
[00035b04] 206a 0018                 movea.l    24(a2),a0
[00035b08] 4eb9 0003 3420            jsr        del_entry
[00035b0e] 224b                      movea.l    a3,a1
[00035b10] 204a                      movea.l    a2,a0
[00035b12] 4eb9 0001 7f52            jsr        objfree
del_object_1:
[00035b18] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00035b1c] 4e75                      rts

new_work:
[00035b1e] 303c 2710                 move.w     #$2710,d0
[00035b22] 2279 000c 8e36            movea.l    $000C8E36,a1
[00035b28] 4eb9 0003 3dd6            jsr        work_icon
[00035b2e] 4e75                      rts

	.data

protoobj:
[000ced12]                           dc.w $0000
[000ced14]                           dc.w $0000
[000ced16]                           dc.w $0000
[000ced18]                           dc.w $0000
[000ced1a]                           dc.w $ffff
[000ced1c]                           dc.w $ffff
[000ced1e]                           dc.w $ffff
[000ced20]                           dc.w $0014
[000ced22]                           dc.w $0000
[000ced24]                           dc.w $0010
[000ced26]                           dc.w $0002
[000ced28]                           dc.w $1100
[000ced2a]                           dc.w $0000
[000ced2c]                           dc.w $0000
[000ced2e]                           dc.w $0020
[000ced30]                           dc.w $000c
[000ced32]                           dc.w $0000
[000ced34]                           dc.w $0000
[000ced36]                           dc.w $0000
[000ced38]                           dc.w $0000
[000ced3a]                           dc.w $8000
[000ced3c]                           dc.w $0000
[000ced3e]                           dc.w $0000
[000ced40]                           dc.w $0000
[000ced42]                           dc.w $0000
[000ced44]                           dc.w $0000
[000ced46]                           dc.w $0000
[000ced48]                           dc.w $0000
protoobject:
[000ced4a]                           dc.w $0000
[000ced4c]                           dc.w $0000
[000ced4e] 000ced12                  dc.l protoobj
[000ced52]                           dc.w $0000
[000ced54]                           dc.w $0000
[000ced56]                           dc.w $0038
[000ced58]                           dc.w $0000
[000ced5a]                           dc.w $0038
[000ced5c]                           dc.w $0000
[000ced5e]                           dc.w $0000
[000ced60]                           dc.b 'OBJECT_01',0
[000ced6a]                           dc.w $0000
[000ced6c]                           dc.w $0000
[000ced6e]                           dc.w $0000
[000ced70]                           dc.w $0000
[000ced72]                           dc.w $0000
[000ced74]                           dc.w $0000
[000ced76]                           dc.w $0000
[000ced78]                           dc.w $0000
[000ced7a]                           dc.w $0000
[000ced7c]                           dc.w $0000
[000ced7e]                           dc.w $0000
[000ced80]                           dc.w $0001
[000ced82]                           dc.w $0000
[000ced84]                           dc.w $0000
[000ced86]                           dc.w $0000
[000ced88]                           dc.w $0000
[000ced8a]                           dc.w $0000
list_object:
[000ced8c]                           dc.w $0000
[000ced8e]                           dc.w $0000
[000ced90]                           dc.w $0000
[000ced92]                           dc.w $0000
[000ced94] 000c8ddc                  dc.l WI_OBJECT
[000ced98] 000cd07e                  dc.l ob_list
[000ced9c] 000cd092                  dc.l ob_name
[000ceda0]                           dc.w $2710
[000ceda2] 000ced4a                  dc.l protoobject
[000ceda6] 00035a3a                  dc.l copy_obj
[000cedaa] 00035aa2                  dc.l del_object
[000cedae] 00035b1e                  dc.l new_work
[000cedb2]                           dc.w $0000
[000cedb4]                           dc.w $0000
