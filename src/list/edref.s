add_ref:
[00035c26] 48e7 1e3c                 movem.l    d3-d6/a2-a5,-(a7)
[00035c2a] 4fef fff4                 lea.l      -12(a7),a7
[00035c2e] 2f48 0008                 move.l     a0,8(a7)
[00035c32] 2a49                      movea.l    a1,a5
[00035c34] 0068 0001 0006            ori.w      #$0001,6(a0)
[00035c3a] 2f68 003c 0004            move.l     60(a0),4(a7)
[00035c40] 226f 0004                 movea.l    4(a7),a1
[00035c44] 2ea9 0004                 move.l     4(a1),(a7)
[00035c48] 2629 000e                 move.l     14(a1),d3
[00035c4c] e48b                      lsr.l      #2,d3
[00035c4e] 382d 0038                 move.w     56(a5),d4
[00035c52] c87c 00ff                 and.w      #$00FF,d4
[00035c56] 4245                      clr.w      d5
[00035c58] 6000 00f2                 bra        add_ref_1
add_ref_7:
[00035c5c] 3005                      move.w     d5,d0
[00035c5e] 48c0                      ext.l      d0
[00035c60] e588                      lsl.l      #2,d0
[00035c62] 2057                      movea.l    (a7),a0
[00035c64] 2470 0800                 movea.l    0(a0,d0.l),a2
[00035c68] 43ed 0016                 lea.l      22(a5),a1
[00035c6c] 41ea 0016                 lea.l      22(a2),a0
[00035c70] 4eb9 0008 2eba            jsr        strcmp
[00035c76] 4a40                      tst.w      d0
[00035c78] 6600 00d0                 bne        add_ref_2
[00035c7c] 3c2a 0038                 move.w     56(a2),d6
[00035c80] cc7c 00ff                 and.w      #$00FF,d6
[00035c84] 4a46                      tst.w      d6
[00035c86] 6700 00ae                 beq        add_ref_3
[00035c8a] 4a44                      tst.w      d4
[00035c8c] 6700 00b6                 beq        add_ref_4
[00035c90] b846                      cmp.w      d6,d4
[00035c92] 6700 00b0                 beq        add_ref_4
[00035c96] 49f9 000a a19a            lea.l      REF_TYPE,a4
[00035c9c] 41f9 000c da0e            lea.l      WI_DIFF_TYPE,a0
[00035ca2] 2279 000c da16            movea.l    $000CDA16,a1
[00035ca8] 4e91                      jsr        (a1)
[00035caa] 2648                      movea.l    a0,a3
[00035cac] 200b                      move.l     a3,d0
[00035cae] 6700 00c4                 beq        add_ref_5
[00035cb2] 43ea 0016                 lea.l      22(a2),a1
[00035cb6] 700c                      moveq.l    #12,d0
[00035cb8] 206b 0014                 movea.l    20(a3),a0
[00035cbc] 4eb9 0005 0fd8            jsr        Aob_puttext
[00035cc2] 3206                      move.w     d6,d1
[00035cc4] 48c1                      ext.l      d1
[00035cc6] d281                      add.l      d1,d1
[00035cc8] 41f9 000a af44            lea.l      cross_type,a0
[00035cce] 3430 1800                 move.w     0(a0,d1.l),d2
[00035cd2] 48c2                      ext.l      d2
[00035cd4] 2002                      move.l     d2,d0
[00035cd6] d080                      add.l      d0,d0
[00035cd8] d082                      add.l      d2,d0
[00035cda] e788                      lsl.l      #3,d0
[00035cdc] 2274 080c                 movea.l    12(a4,d0.l),a1
[00035ce0] 206b 0014                 movea.l    20(a3),a0
[00035ce4] 7003                      moveq.l    #3,d0
[00035ce6] 4eb9 0005 0fd8            jsr        Aob_puttext
[00035cec] 3204                      move.w     d4,d1
[00035cee] 48c1                      ext.l      d1
[00035cf0] d281                      add.l      d1,d1
[00035cf2] 41f9 000a af44            lea.l      cross_type,a0
[00035cf8] 3430 1800                 move.w     0(a0,d1.l),d2
[00035cfc] 48c2                      ext.l      d2
[00035cfe] 2002                      move.l     d2,d0
[00035d00] d080                      add.l      d0,d0
[00035d02] d082                      add.l      d2,d0
[00035d04] e788                      lsl.l      #3,d0
[00035d06] 2274 080c                 movea.l    12(a4,d0.l),a1
[00035d0a] 206b 0014                 movea.l    20(a3),a0
[00035d0e] 7004                      moveq.l    #4,d0
[00035d10] 4eb9 0005 0fd8            jsr        Aob_puttext
[00035d16] 204b                      movea.l    a3,a0
[00035d18] 4eb9 0005 9df4            jsr        Awi_dialog
[00035d1e] 3c00                      move.w     d0,d6
[00035d20] 204b                      movea.l    a3,a0
[00035d22] 4eb9 0005 85f2            jsr        Awi_delete
[00035d28] bc7c 0006                 cmp.w      #$0006,d6
[00035d2c] 6708                      beq.s      add_ref_3
[00035d2e] bc7c 0006                 cmp.w      #$0006,d6
[00035d32] 6640                      bne.s      add_ref_5
[00035d34] 600e                      bra.s      add_ref_4
add_ref_3:
[00035d36] 302a 0038                 move.w     56(a2),d0
[00035d3a] c07c ff00                 and.w      #$FF00,d0
[00035d3e] 8044                      or.w       d4,d0
[00035d40] 3540 0038                 move.w     d0,56(a2)
add_ref_4:
[00035d44] 526a 0036                 addq.w     #1,54(a2)
[00035d48] 6058                      bra.s      add_ref_6
add_ref_2:
[00035d4a] 5245                      addq.w     #1,d5
add_ref_1:
[00035d4c] b645                      cmp.w      d5,d3
[00035d4e] 6e00 ff0c                 bgt        add_ref_7
[00035d52] 7004                      moveq.l    #4,d0
[00035d54] 206f 0004                 movea.l    4(a7),a0
[00035d58] 4eb9 0001 8028            jsr        objextent
[00035d5e] 4a40                      tst.w      d0
[00035d60] 6612                      bne.s      add_ref_5
[00035d62] 7000                      moveq.l    #0,d0
[00035d64] 206f 0008                 movea.l    8(a7),a0
[00035d68] 4eb9 0001 7fae            jsr        objmalloc
[00035d6e] 2448                      movea.l    a0,a2
[00035d70] 200a                      move.l     a2,d0
[00035d72] 6604                      bne.s      add_ref_8
add_ref_5:
[00035d74] 91c8                      suba.l     a0,a0
[00035d76] 602c                      bra.s      add_ref_9
add_ref_8:
[00035d78] 356d 0038 0038            move.w     56(a5),56(a2)
[00035d7e] 2f39 000c ef0c            move.l     $000CEF0C,-(a7)
[00035d84] 486d 0016                 pea.l      22(a5)
[00035d88] 224a                      movea.l    a2,a1
[00035d8a] 206f 0010                 movea.l    16(a7),a0
[00035d8e] 4eb9 0001 81c6            jsr        objname
[00035d94] 504f                      addq.w     #8,a7
[00035d96] 224a                      movea.l    a2,a1
[00035d98] 206f 0004                 movea.l    4(a7),a0
[00035d9c] 4eb9 0003 33b4            jsr        add_entry
add_ref_6:
[00035da2] 204a                      movea.l    a2,a0
add_ref_9:
[00035da4] 4fef 000c                 lea.l      12(a7),a7
[00035da8] 4cdf 3c78                 movem.l    (a7)+,d3-d6/a2-a5
[00035dac] 4e75                      rts

del_ref:
[00035dae] 2f0a                      move.l     a2,-(a7)
[00035db0] 2f0b                      move.l     a3,-(a7)
[00035db2] 2448                      movea.l    a0,a2
[00035db4] 2649                      movea.l    a1,a3
[00035db6] 006a 0001 0006            ori.w      #$0001,6(a2)
[00035dbc] 536b 0036                 subq.w     #1,54(a3)
[00035dc0] 302b 0036                 move.w     54(a3),d0
[00035dc4] 6e14                      bgt.s      del_ref_1
[00035dc6] 206a 003c                 movea.l    60(a2),a0
[00035dca] 4eb9 0003 3420            jsr        del_entry
[00035dd0] 224b                      movea.l    a3,a1
[00035dd2] 204a                      movea.l    a2,a0
[00035dd4] 4eb9 0001 7f52            jsr        objfree
del_ref_1:
[00035dda] 265f                      movea.l    (a7)+,a3
[00035ddc] 245f                      movea.l    (a7)+,a2
[00035dde] 4e75                      rts

dup_ref:
[00035de0] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00035de4] 2848                      movea.l    a0,a4
[00035de6] 2449                      movea.l    a1,a2
[00035de8] 3600                      move.w     d0,d3
[00035dea] 47f9 000c ef26            lea.l      free_ref,a3
[00035df0] 224a                      movea.l    a2,a1
[00035df2] 41eb 0016                 lea.l      22(a3),a0
[00035df6] 4eb9 0008 2f0c            jsr        strcpy
[00035dfc] 303c 00ff                 move.w     #$00FF,d0
[00035e00] c043                      and.w      d3,d0
[00035e02] 3740 0038                 move.w     d0,56(a3)
[00035e06] 224b                      movea.l    a3,a1
[00035e08] 204c                      movea.l    a4,a0
[00035e0a] 6100 fe1a                 bsr        add_ref
[00035e0e] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00035e12] 4e75                      rts

copy_ref:
[00035e14] 2f0a                      move.l     a2,-(a7)
[00035e16] 2f0c                      move.l     a4,-(a7)
[00035e18] 2449                      movea.l    a1,a2
[00035e1a] 202a 000a                 move.l     10(a2),d0
[00035e1e] 4eb9 0001 7fae            jsr        objmalloc
[00035e24] 2848                      movea.l    a0,a4
[00035e26] 200c                      move.l     a4,d0
[00035e28] 6604                      bne.s      copy_ref_1
[00035e2a] 91c8                      suba.l     a0,a0
[00035e2c] 6020                      bra.s      copy_ref_2
copy_ref_1:
[00035e2e] 202a 000a                 move.l     10(a2),d0
[00035e32] 226a 0004                 movea.l    4(a2),a1
[00035e36] 206c 0004                 movea.l    4(a4),a0
[00035e3a] 4eb9 0008 3500            jsr        memcpy
[00035e40] 296a 000e 000e            move.l     14(a2),14(a4)
[00035e46] 396a 0038 0038            move.w     56(a2),56(a4)
[00035e4c] 204c                      movea.l    a4,a0
copy_ref_2:
[00035e4e] 285f                      movea.l    (a7)+,a4
[00035e50] 245f                      movea.l    (a7)+,a2
[00035e52] 4e75                      rts

new_work:
[00035e54] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[00035e58] 594f                      subq.w     #4,a7
[00035e5a] 2ea8 0004                 move.l     4(a0),(a7)
[00035e5e] 2628 000e                 move.l     14(a0),d3
[00035e62] e48b                      lsr.l      #2,d3
[00035e64] 3203                      move.w     d3,d1
[00035e66] 48c1                      ext.l      d1
[00035e68] 2001                      move.l     d1,d0
[00035e6a] e588                      lsl.l      #2,d0
[00035e6c] d081                      add.l      d1,d0
[00035e6e] e988                      lsl.l      #4,d0
[00035e70] d0bc 0000 0030            add.l      #$00000030,d0
[00035e76] 4eb9 0004 c608            jsr        Ax_malloc
[00035e7c] 2648                      movea.l    a0,a3
[00035e7e] 200b                      move.l     a3,d0
[00035e80] 6606                      bne.s      new_work_1
[00035e82] 91c8                      suba.l     a0,a0
[00035e84] 6000 00b0                 bra        new_work_2
new_work_1:
[00035e88] 7030                      moveq.l    #48,d0
[00035e8a] 43f9 000c ee5a            lea.l      inner,a1
[00035e90] 204b                      movea.l    a3,a0
[00035e92] 4eb9 0008 3500            jsr        memcpy
[00035e98] 49eb 0030                 lea.l      48(a3),a4
[00035e9c] 4a43                      tst.w      d3
[00035e9e] 6f00 008c                 ble        new_work_3
[00035ea2] 3203                      move.w     d3,d1
[00035ea4] d241                      add.w      d1,d1
[00035ea6] 48c1                      ext.l      d1
[00035ea8] 2001                      move.l     d1,d0
[00035eaa] d080                      add.l      d0,d0
[00035eac] d081                      add.l      d1,d0
[00035eae] e788                      lsl.l      #3,d0
[00035eb0] 4bf3 0830                 lea.l      48(a3,d0.l),a5
[00035eb4] 4244                      clr.w      d4
[00035eb6] 6052                      bra.s      new_work_4
new_work_6:
[00035eb8] 7030                      moveq.l    #48,d0
[00035eba] 43f9 000c ee8a            lea.l      proto,a1
[00035ec0] 204c                      movea.l    a4,a0
[00035ec2] 4eb9 0008 3500            jsr        memcpy
[00035ec8] 3004                      move.w     d4,d0
[00035eca] d040                      add.w      d0,d0
[00035ecc] 5840                      addq.w     #4,d0
[00035ece] 3880                      move.w     d0,(a4)
[00035ed0] 294d 000c                 move.l     a5,12(a4)
[00035ed4] 3204                      move.w     d4,d1
[00035ed6] 48c1                      ext.l      d1
[00035ed8] e589                      lsl.l      #2,d1
[00035eda] 2057                      movea.l    (a7),a0
[00035edc] 2470 1800                 movea.l    0(a0,d1.l),a2
[00035ee0] 342a 0038                 move.w     56(a2),d2
[00035ee4] c47c 0100                 and.w      #$0100,d2
[00035ee8] 6606                      bne.s      new_work_5
[00035eea] 006c 0010 000a            ori.w      #$0010,10(a4)
new_work_5:
[00035ef0] 294a 0024                 move.l     a2,36(a4)
[00035ef4] 43ea 0016                 lea.l      22(a2),a1
[00035ef8] 204d                      movea.l    a5,a0
[00035efa] 4eb9 0008 2f0c            jsr        strcpy
[00035f00] 4bed 0020                 lea.l      32(a5),a5
[00035f04] 49ec 0030                 lea.l      48(a4),a4
[00035f08] 5244                      addq.w     #1,d4
new_work_4:
[00035f0a] b644                      cmp.w      d4,d3
[00035f0c] 6eaa                      bgt.s      new_work_6
[00035f0e] 3003                      move.w     d3,d0
[00035f10] d040                      add.w      d0,d0
[00035f12] 3740 0004                 move.w     d0,4(a3)
[00035f16] 377c 0002 0002            move.w     #$0002,2(a3)
[00035f1c] 026b ffdf 0020            andi.w     #$FFDF,32(a3)
[00035f22] 426c ffd0                 clr.w      -48(a4)
[00035f26] 006c 0020 fff0            ori.w      #$0020,-16(a4)
new_work_3:
[00035f2c] 204b                      movea.l    a3,a0
[00035f2e] 4eb9 0004 fbdc            jsr        Aob_fix
[00035f34] 204b                      movea.l    a3,a0
new_work_2:
[00035f36] 584f                      addq.w     #4,a7
[00035f38] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00035f3c] 4e75                      rts

	.data

inner:
[000cee5a]                           dc.w $ffff
[000cee5c]                           dc.w $ffff
[000cee5e]                           dc.w $ffff
[000cee60]                           dc.w $0014
[000cee62]                           dc.w $1800
[000cee64]                           dc.w $0000
[000cee66]                           dc.w $0000
[000cee68]                           dc.w $1101
[000cee6a]                           dc.w $0000
[000cee6c]                           dc.w $0000
[000cee6e]                           dc.w $0064
[000cee70]                           dc.w $0064
pra00:
[000cee72]                           dc.w $0000
[000cee74]                           dc.w $0000
[000cee76]                           dc.w $0000
[000cee78]                           dc.w $0000
[000cee7a]                           dc.w $8020
[000cee7c]                           dc.w $0000
[000cee7e]                           dc.w $0000
[000cee80]                           dc.w $0000
[000cee82]                           dc.w $0000
[000cee84]                           dc.w $0000
[000cee86]                           dc.w $0000
[000cee88]                           dc.w $0000
proto:
[000cee8a]                           dc.w $0000
[000cee8c]                           dc.w $ffff
[000cee8e]                           dc.w $ffff
[000cee90]                           dc.w $001c
[000cee92]                           dc.w $2005
[000cee94]                           dc.w $0000
[000cee96]                           dc.w $0000
[000cee98]                           dc.w $0000
[000cee9a]                           dc.w $0002
[000cee9c]                           dc.w $0400
[000cee9e]                           dc.w $0020
[000ceea0]                           dc.w $0001
pra04:
[000ceea2]                           dc.w $0000
[000ceea4]                           dc.w $0000
[000ceea6]                           dc.w $0000
[000ceea8]                           dc.w $0000
[000ceeaa]                           dc.w $8000
[000ceeac]                           dc.w $0000
[000ceeae]                           dc.w $0000
[000ceeb0]                           dc.w $0000
[000ceeb2]                           dc.w $0000
[000ceeb4]                           dc.w $0000
[000ceeb6]                           dc.w $0000
[000ceeb8]                           dc.w $271c
protoref:
[000ceeba]                           dc.w $0000
[000ceebc]                           dc.w $0000
[000ceebe]                           dc.w $0000
[000ceec0]                           dc.w $0000
[000ceec2]                           dc.w $0000
[000ceec4]                           dc.w $0000
[000ceec6]                           dc.w $0000
[000ceec8]                           dc.w $0000
[000ceeca]                           dc.w $0000
[000ceecc]                           dc.w $0000
[000ceece]                           dc.w $0000
[000ceed0]                           dc.b 'REFERENCE_01',0
[000ceedd]                           dc.b $00
[000ceede]                           dc.w $0000
[000ceee0]                           dc.w $0000
[000ceee2]                           dc.w $0000
[000ceee4]                           dc.w $0000
[000ceee6]                           dc.w $0000
[000ceee8]                           dc.w $0000
[000ceeea]                           dc.w $0000
[000ceeec]                           dc.w $0000
[000ceeee]                           dc.w $0000
[000ceef0]                           dc.w $0001
[000ceef2]                           dc.w $0000
[000ceef4]                           dc.w $0000
[000ceef6]                           dc.w $0000
[000ceef8]                           dc.w $0000
[000ceefa]                           dc.w $0000
list_reference:
[000ceefc]                           dc.w $0000
[000ceefe]                           dc.w $0000
[000cef00]                           dc.w $0000
[000cef02]                           dc.w $0000
[000cef04] 000aaea2                  dc.l WI_REF
[000cef08] 000cd0d6                  dc.l rf_list
[000cef0c] 000cd0e9                  dc.l rf_name
[000cef10]                           dc.w $271c
[000cef12] 000ceeba                  dc.l protoref
[000cef16] 00035e14                  dc.l copy_ref
[000cef1a] 00035dae                  dc.l del_ref
[000cef1e] 00035e54                  dc.l new_work
[000cef22]                           dc.w $0000
[000cef24]                           dc.w $0000
free_ref:
[000cef26]                           dc.w $0000
[000cef28]                           dc.w $0000
[000cef2a]                           dc.w $0000
[000cef2c]                           dc.w $0000
[000cef2e]                           dc.w $0000
[000cef30]                           dc.w $0000
[000cef32]                           dc.w $0000
[000cef34]                           dc.w $0000
[000cef36]                           dc.w $0000
[000cef38]                           dc.w $0000
[000cef3a]                           dc.w $0000
[000cef3c]                           dc.w $0000
[000cef3e]                           dc.w $0000
[000cef40]                           dc.w $0000
[000cef42]                           dc.w $0000
[000cef44]                           dc.w $0000
[000cef46]                           dc.w $0000
[000cef48]                           dc.w $0000
[000cef4a]                           dc.w $0000
[000cef4c]                           dc.w $0000
[000cef4e]                           dc.w $0000
[000cef50]                           dc.w $0000
[000cef52]                           dc.w $0000
[000cef54]                           dc.w $0000
[000cef56]                           dc.w $0000
[000cef58]                           dc.w $0000
[000cef5a]                           dc.w $0000
[000cef5c]                           dc.w $0001
[000cef5e]                           dc.w $0000
[000cef60]                           dc.w $0000
[000cef62]                           dc.w $0000
[000cef64]                           dc.w $0000
[000cef66]                           dc.w $0000
