load_dfn:
[00018cae] 48e7 1820                 movem.l    d3-d4/a2,-(a7)
[00018cb2] 2448                      movea.l    a0,a2
[00018cb4] 4240                      clr.w      d0
[00018cb6] 206a 0008                 movea.l    8(a2),a0
[00018cba] 4eb9 0008 0cc0            jsr        Fopen
[00018cc0] 2600                      move.l     d0,d3
[00018cc2] 45f9 0010 836a            lea.l      dfn_size,a2
[00018cc8] 4a43                      tst.w      d3
[00018cca] 6b36                      bmi.s      load_dfn_1
[00018ccc] 204a                      movea.l    a2,a0
[00018cce] 7202                      moveq.l    #2,d1
[00018cd0] 3003                      move.w     d3,d0
[00018cd2] 4eb9 0008 0cd2            jsr        Fread
[00018cd8] 3012                      move.w     (a2),d0
[00018cda] e040                      asr.w      #8,d0
[00018cdc] c07c 00ff                 and.w      #$00FF,d0
[00018ce0] 3212                      move.w     (a2),d1
[00018ce2] e149                      lsl.w      #8,d1
[00018ce4] 8041                      or.w       d1,d0
[00018ce6] 3480                      move.w     d0,(a2)
[00018ce8] 48c0                      ext.l      d0
[00018cea] 2800                      move.l     d0,d4
[00018cec] e78c                      lsl.l      #3,d4
[00018cee] 9880                      sub.l      d0,d4
[00018cf0] d884                      add.l      d4,d4
[00018cf2] 2004                      move.l     d4,d0
[00018cf4] 4eb9 0004 c608            jsr        Ax_malloc
[00018cfa] 2548 fffc                 move.l     a0,-4(a2)
[00018cfe] 2008                      move.l     a0,d0
[00018d00] 6604                      bne.s      load_dfn_2
load_dfn_1:
[00018d02] 4252                      clr.w      (a2)
[00018d04] 6016                      bra.s      load_dfn_3
load_dfn_2:
[00018d06] 206a fffc                 movea.l    -4(a2),a0
[00018d0a] 2204                      move.l     d4,d1
[00018d0c] 3003                      move.w     d3,d0
[00018d0e] 4eb9 0008 0cd2            jsr        Fread
[00018d14] 3003                      move.w     d3,d0
[00018d16] 4eb9 0008 0c7e            jsr        Fclose
load_dfn_3:
[00018d1c] 4cdf 0418                 movem.l    (a7)+,d3-d4/a2
[00018d20] 4e75                      rts

tree_label:
[00018d22] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[00018d26] 3800                      move.w     d0,d4
[00018d28] 2648                      movea.l    a0,a3
[00018d2a] 2849                      movea.l    a1,a4
[00018d2c] 4243                      clr.w      d3
[00018d2e] 45f9 0010 8366            lea.l      dfna,a2
[00018d34] 605a                      bra.s      tree_label_1
tree_label_4:
[00018d36] 3203                      move.w     d3,d1
[00018d38] 48c1                      ext.l      d1
[00018d3a] 2001                      move.l     d1,d0
[00018d3c] e788                      lsl.l      #3,d0
[00018d3e] 9081                      sub.l      d1,d0
[00018d40] d080                      add.l      d0,d0
[00018d42] 2052                      movea.l    (a2),a0
[00018d44] 1430 0800                 move.b     0(a0,d0.l),d2
[00018d48] 4882                      ext.w      d2
[00018d4a] b842                      cmp.w      d2,d4
[00018d4c] 6640                      bne.s      tree_label_2
[00018d4e] 1230 0803                 move.b     3(a0,d0.l),d1
[00018d52] 663a                      bne.s      tree_label_2
[00018d54] 0c30 0001 0802            cmpi.b     #$01,2(a0,d0.l)
[00018d5a] 6d32                      blt.s      tree_label_2
[00018d5c] 0c30 0003 0802            cmpi.b     #$03,2(a0,d0.l)
[00018d62] 6e2a                      bgt.s      tree_label_2
[00018d64] 2248                      movea.l    a0,a1
[00018d66] 43f1 0804                 lea.l      4(a1,d0.l),a1
[00018d6a] 204b                      movea.l    a3,a0
[00018d6c] 4eb9 0008 2f0c            jsr        strcpy
[00018d72] 3203                      move.w     d3,d1
[00018d74] 48c1                      ext.l      d1
[00018d76] 2001                      move.l     d1,d0
[00018d78] e788                      lsl.l      #3,d0
[00018d7a] 9081                      sub.l      d1,d0
[00018d7c] d080                      add.l      d0,d0
[00018d7e] 2052                      movea.l    (a2),a0
[00018d80] 0c30 0002 0802            cmpi.b     #$02,2(a0,d0.l)
[00018d86] 6610                      bne.s      tree_label_3
[00018d88] 38bc 0001                 move.w     #$0001,(a4)
[00018d8c] 600a                      bra.s      tree_label_3
tree_label_2:
[00018d8e] 5243                      addq.w     #1,d3
tree_label_1:
[00018d90] b66a 0004                 cmp.w      4(a2),d3
[00018d94] 6da0                      blt.s      tree_label_4
[00018d96] 4213                      clr.b      (a3)
tree_label_3:
[00018d98] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00018d9c] 4e75                      rts

index_label:
[00018d9e] 48e7 1c30                 movem.l    d3-d5/a2-a3,-(a7)
[00018da2] 3a00                      move.w     d0,d5
[00018da4] 3801                      move.w     d1,d4
[00018da6] 2648                      movea.l    a0,a3
[00018da8] 4243                      clr.w      d3
[00018daa] 45f9 0010 8366            lea.l      dfna,a2
[00018db0] 6042                      bra.s      index_label_1
index_label_4:
[00018db2] 3203                      move.w     d3,d1
[00018db4] 48c1                      ext.l      d1
[00018db6] 2001                      move.l     d1,d0
[00018db8] e788                      lsl.l      #3,d0
[00018dba] 9081                      sub.l      d1,d0
[00018dbc] d080                      add.l      d0,d0
[00018dbe] 2052                      movea.l    (a2),a0
[00018dc0] 1430 0800                 move.b     0(a0,d0.l),d2
[00018dc4] 4882                      ext.w      d2
[00018dc6] b842                      cmp.w      d2,d4
[00018dc8] 6628                      bne.s      index_label_2
[00018dca] 1230 0802                 move.b     2(a0,d0.l),d1
[00018dce] 6622                      bne.s      index_label_2
[00018dd0] 0c30 0001 0803            cmpi.b     #$01,3(a0,d0.l)
[00018dd6] 661a                      bne.s      index_label_2
[00018dd8] 1430 0801                 move.b     1(a0,d0.l),d2
[00018ddc] 4882                      ext.w      d2
[00018dde] ba42                      cmp.w      d2,d5
[00018de0] 6610                      bne.s      index_label_2
[00018de2] 2248                      movea.l    a0,a1
[00018de4] 43f1 0804                 lea.l      4(a1,d0.l),a1
[00018de8] 204b                      movea.l    a3,a0
[00018dea] 4eb9 0008 2f0c            jsr        strcpy
[00018df0] 600a                      bra.s      index_label_3
index_label_2:
[00018df2] 5243                      addq.w     #1,d3
index_label_1:
[00018df4] b66a 0004                 cmp.w      4(a2),d3
[00018df8] 6db8                      blt.s      index_label_4
[00018dfa] 4213                      clr.b      (a3)
index_label_3:
[00018dfc] 4cdf 0c38                 movem.l    (a7)+,d3-d5/a2-a3
[00018e00] 4e75                      rts

image_label:
[00018e02] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[00018e06] 3800                      move.w     d0,d4
[00018e08] 2648                      movea.l    a0,a3
[00018e0a] 4243                      clr.w      d3
[00018e0c] 45f9 0010 8366            lea.l      dfna,a2
[00018e12] 603a                      bra.s      image_label_1
image_label_4:
[00018e14] 3203                      move.w     d3,d1
[00018e16] 48c1                      ext.l      d1
[00018e18] 2001                      move.l     d1,d0
[00018e1a] e788                      lsl.l      #3,d0
[00018e1c] 9081                      sub.l      d1,d0
[00018e1e] d080                      add.l      d0,d0
[00018e20] 2052                      movea.l    (a2),a0
[00018e22] 1430 0800                 move.b     0(a0,d0.l),d2
[00018e26] 4882                      ext.w      d2
[00018e28] b842                      cmp.w      d2,d4
[00018e2a] 6620                      bne.s      image_label_2
[00018e2c] 0c30 0002 0802            cmpi.b     #$02,2(a0,d0.l)
[00018e32] 6618                      bne.s      image_label_2
[00018e34] 0c30 0001 0803            cmpi.b     #$01,3(a0,d0.l)
[00018e3a] 6610                      bne.s      image_label_2
[00018e3c] 2248                      movea.l    a0,a1
[00018e3e] 43f1 0804                 lea.l      4(a1,d0.l),a1
[00018e42] 204b                      movea.l    a3,a0
[00018e44] 4eb9 0008 2f0c            jsr        strcpy
[00018e4a] 600a                      bra.s      image_label_3
image_label_2:
[00018e4c] 5243                      addq.w     #1,d3
image_label_1:
[00018e4e] b66a 0004                 cmp.w      4(a2),d3
[00018e52] 6dc0                      blt.s      image_label_4
[00018e54] 4213                      clr.b      (a3)
image_label_3:
[00018e56] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[00018e5a] 4e75                      rts

string_label:
[00018e5c] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[00018e60] 3800                      move.w     d0,d4
[00018e62] 2848                      movea.l    a0,a4
[00018e64] 2649                      movea.l    a1,a3
[00018e66] 4243                      clr.w      d3
[00018e68] 45f9 0010 8366            lea.l      dfna,a2
[00018e6e] 6066                      bra.s      string_label_1
string_label_6:
[00018e70] 3203                      move.w     d3,d1
[00018e72] 48c1                      ext.l      d1
[00018e74] 2001                      move.l     d1,d0
[00018e76] e788                      lsl.l      #3,d0
[00018e78] 9081                      sub.l      d1,d0
[00018e7a] d080                      add.l      d0,d0
[00018e7c] 2052                      movea.l    (a2),a0
[00018e7e] 1430 0800                 move.b     0(a0,d0.l),d2
[00018e82] 4882                      ext.w      d2
[00018e84] b842                      cmp.w      d2,d4
[00018e86] 664c                      bne.s      string_label_2
[00018e88] 0c30 0001 0802            cmpi.b     #$01,2(a0,d0.l)
[00018e8e] 6608                      bne.s      string_label_3
[00018e90] 0c30 0001 0803            cmpi.b     #$01,3(a0,d0.l)
[00018e96] 6720                      beq.s      string_label_4
string_label_3:
[00018e98] 3203                      move.w     d3,d1
[00018e9a] 48c1                      ext.l      d1
[00018e9c] 2001                      move.l     d1,d0
[00018e9e] e788                      lsl.l      #3,d0
[00018ea0] 9081                      sub.l      d1,d0
[00018ea2] d080                      add.l      d0,d0
[00018ea4] 2052                      movea.l    (a2),a0
[00018ea6] 0c30 0004 0802            cmpi.b     #$04,2(a0,d0.l)
[00018eac] 6626                      bne.s      string_label_2
[00018eae] 1430 0803                 move.b     3(a0,d0.l),d2
[00018eb2] 6620                      bne.s      string_label_2
[00018eb4] 36bc 0001                 move.w     #$0001,(a3)
string_label_4:
[00018eb8] 3203                      move.w     d3,d1
[00018eba] 48c1                      ext.l      d1
[00018ebc] 2001                      move.l     d1,d0
[00018ebe] e788                      lsl.l      #3,d0
[00018ec0] 9081                      sub.l      d1,d0
[00018ec2] d080                      add.l      d0,d0
[00018ec4] 2252                      movea.l    (a2),a1
[00018ec6] 43f1 0804                 lea.l      4(a1,d0.l),a1
[00018eca] 204c                      movea.l    a4,a0
[00018ecc] 4eb9 0008 2f0c            jsr        strcpy
[00018ed2] 600a                      bra.s      string_label_5
string_label_2:
[00018ed4] 5243                      addq.w     #1,d3
string_label_1:
[00018ed6] b66a 0004                 cmp.w      4(a2),d3
[00018eda] 6d94                      blt.s      string_label_6
[00018edc] 4214                      clr.b      (a4)
string_label_5:
[00018ede] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[00018ee2] 4e75                      rts

strings:
[00018ee4] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[00018ee8] 4fef ffe6                 lea.l      -26(a7),a7
[00018eec] 2a48                      movea.l    a0,a5
[00018eee] 2f49 0016                 move.l     a1,22(a7)
[00018ef2] 2049                      movea.l    a1,a0
[00018ef4] 3628 001e                 move.w     30(a0),d3
[00018ef8] 7000                      moveq.l    #0,d0
[00018efa] 3028 000a                 move.w     10(a0),d0
[00018efe] 43f0 0800                 lea.l      0(a0,d0.l),a1
[00018f02] 2f49 0012                 move.l     a1,18(a7)
[00018f06] 4244                      clr.w      d4
[00018f08] 45ef 0010                 lea.l      16(a7),a2
[00018f0c] 6000 010a                 bra        strings_1
strings_10:
[00018f10] 3004                      move.w     d4,d0
[00018f12] 48c0                      ext.l      d0
[00018f14] e588                      lsl.l      #2,d0
[00018f16] 206f 0012                 movea.l    18(a7),a0
[00018f1a] 2230 0800                 move.l     0(a0,d0.l),d1
[00018f1e] 286f 0016                 movea.l    22(a7),a4
[00018f22] d9c1                      adda.l     d1,a4
[00018f24] 204c                      movea.l    a4,a0
[00018f26] 4eb9 0008 2f6c            jsr        strlen
[00018f2c] 2a00                      move.l     d0,d5
[00018f2e] 5285                      addq.l     #1,d5
[00018f30] 2005                      move.l     d5,d0
[00018f32] 204d                      movea.l    a5,a0
[00018f34] 4eb9 0001 7fae            jsr        objmalloc
[00018f3a] 2648                      movea.l    a0,a3
[00018f3c] 006b 0100 0038            ori.w      #$0100,56(a3)
[00018f42] 200b                      move.l     a3,d0
[00018f44] 6700 00d8                 beq        strings_2
[00018f48] 2745 000e                 move.l     d5,14(a3)
[00018f4c] 224c                      movea.l    a4,a1
[00018f4e] 206b 0004                 movea.l    4(a3),a0
[00018f52] 4eb9 0008 2f0c            jsr        strcpy
[00018f58] 006b 0100 0038            ori.w      #$0100,56(a3)
[00018f5e] 4252                      clr.w      (a2)
[00018f60] 224a                      movea.l    a2,a1
[00018f62] 41d7                      lea.l      (a7),a0
[00018f64] 3004                      move.w     d4,d0
[00018f66] 6100 fef4                 bsr        string_label
[00018f6a] 1017                      move.b     (a7),d0
[00018f6c] 671a                      beq.s      strings_3
[00018f6e] 4879 000a 53a0            pea.l      $000A53A0
[00018f74] 486f 0004                 pea.l      4(a7)
[00018f78] 224b                      movea.l    a3,a1
[00018f7a] 204d                      movea.l    a5,a0
[00018f7c] 4eb9 0001 81c6            jsr        objname
[00018f82] 504f                      addq.w     #8,a7
[00018f84] 6000 0072                 bra.w      strings_4
strings_3:
[00018f88] 0c14 005b                 cmpi.b     #$5B,(a4)
[00018f8c] 6634                      bne.s      strings_5
[00018f8e] 0c2c 0030 0001            cmpi.b     #$30,1(a4)
[00018f94] 6718                      beq.s      strings_6
[00018f96] 0c2c 0031 0001            cmpi.b     #$31,1(a4)
[00018f9c] 6710                      beq.s      strings_6
[00018f9e] 0c2c 0032 0001            cmpi.b     #$32,1(a4)
[00018fa4] 6708                      beq.s      strings_6
[00018fa6] 0c2c 0033 0001            cmpi.b     #$33,1(a4)
[00018fac] 6614                      bne.s      strings_5
strings_6:
[00018fae] 0c2c 005d 0002            cmpi.b     #$5D,2(a4)
[00018fb4] 660c                      bne.s      strings_5
[00018fb6] 0c2c 005b 0003            cmpi.b     #$5B,3(a4)
[00018fbc] 6604                      bne.s      strings_5
[00018fbe] 34bc 0001                 move.w     #$0001,(a2)
strings_5:
[00018fc2] 3012                      move.w     (a2),d0
[00018fc4] 671a                      beq.s      strings_7
[00018fc6] 4879 000a 53ad            pea.l      $000A53AD
[00018fcc] 4879 000a 53a1            pea.l      $000A53A1
[00018fd2] 224b                      movea.l    a3,a1
[00018fd4] 204d                      movea.l    a5,a0
[00018fd6] 4eb9 0001 81c6            jsr        objname
[00018fdc] 504f                      addq.w     #8,a7
[00018fde] 6018                      bra.s      strings_4
strings_7:
[00018fe0] 4879 000a 53be            pea.l      $000A53BE
[00018fe6] 4879 000a 53b6            pea.l      $000A53B6
[00018fec] 224b                      movea.l    a3,a1
[00018fee] 204d                      movea.l    a5,a0
[00018ff0] 4eb9 0001 81c6            jsr        objname
[00018ff6] 504f                      addq.w     #8,a7
strings_4:
[00018ff8] 3012                      move.w     (a2),d0
[00018ffa] 670e                      beq.s      strings_8
[00018ffc] 224b                      movea.l    a3,a1
[00018ffe] 206d 0024                 movea.l    36(a5),a0
[00019002] 4eb9 0003 33b4            jsr        add_entry
[00019008] 600c                      bra.s      strings_9
strings_8:
[0001900a] 224b                      movea.l    a3,a1
[0001900c] 206d 0034                 movea.l    52(a5),a0
[00019010] 4eb9 0003 33b4            jsr        add_entry
strings_9:
[00019016] 5244                      addq.w     #1,d4
strings_1:
[00019018] b644                      cmp.w      d4,d3
[0001901a] 6e00 fef4                 bgt        strings_10
strings_2:
[0001901e] 4fef 001a                 lea.l      26(a7),a7
[00019022] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[00019026] 4e75                      rts

images:
[00019028] 48e7 182c                 movem.l    d3-d4/a2/a4-a5,-(a7)
[0001902c] 4fef ffec                 lea.l      -20(a7),a7
[00019030] 2848                      movea.l    a0,a4
[00019032] 2449                      movea.l    a1,a2
[00019034] 2049                      movea.l    a1,a0
[00019036] 3628 0020                 move.w     32(a0),d3
[0001903a] 7000                      moveq.l    #0,d0
[0001903c] 3028 0010                 move.w     16(a0),d0
[00019040] 43f2 0800                 lea.l      0(a2,d0.l),a1
[00019044] 2f49 0010                 move.l     a1,16(a7)
[00019048] 4244                      clr.w      d4
[0001904a] 6050                      bra.s      images_1
images_3:
[0001904c] 3004                      move.w     d4,d0
[0001904e] 48c0                      ext.l      d0
[00019050] e588                      lsl.l      #2,d0
[00019052] 206f 0010                 movea.l    16(a7),a0
[00019056] 2230 0800                 move.l     0(a0,d0.l),d1
[0001905a] 4bf2 1800                 lea.l      0(a2,d1.l),a5
[0001905e] 2415                      move.l     (a5),d2
[00019060] 43f2 2800                 lea.l      0(a2,d2.l),a1
[00019064] 2a89                      move.l     a1,(a5)
[00019066] 204c                      movea.l    a4,a0
[00019068] 224d                      movea.l    a5,a1
[0001906a] 4eb9 0003 4ce2            jsr        dup_image
[00019070] 2a48                      movea.l    a0,a5
[00019072] 006d 0100 0038            ori.w      #$0100,56(a5)
[00019078] 41d7                      lea.l      (a7),a0
[0001907a] 3004                      move.w     d4,d0
[0001907c] 6100 fd84                 bsr        image_label
[00019080] 1017                      move.b     (a7),d0
[00019082] 6716                      beq.s      images_2
[00019084] 4879 000a 53a0            pea.l      $000A53A0
[0001908a] 486f 0004                 pea.l      4(a7)
[0001908e] 224d                      movea.l    a5,a1
[00019090] 204c                      movea.l    a4,a0
[00019092] 4eb9 0001 81c6            jsr        objname
[00019098] 504f                      addq.w     #8,a7
images_2:
[0001909a] 5244                      addq.w     #1,d4
images_1:
[0001909c] b644                      cmp.w      d4,d3
[0001909e] 6eac                      bgt.s      images_3
[000190a0] 4fef 0014                 lea.l      20(a7),a7
[000190a4] 4cdf 3418                 movem.l    (a7)+,d3-d4/a2/a4-a5
[000190a8] 4e75                      rts

fix_cicon:
[000190aa] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[000190ae] 514f                      subq.w     #8,a7
[000190b0] 2f48 0004                 move.l     a0,4(a7)
[000190b4] 2e88                      move.l     a0,(a7)
fix_cicon_1:
[000190b6] 2057                      movea.l    (a7),a0
[000190b8] 5897                      addq.l     #4,(a7)
[000190ba] 2010                      move.l     (a0),d0
[000190bc] 67f8                      beq.s      fix_cicon_1
[000190be] 6000 00ac                 bra        fix_cicon_2
fix_cicon_9:
[000190c2] 206f 0004                 movea.l    4(a7),a0
[000190c6] 58af 0004                 addq.l     #4,4(a7)
[000190ca] 2097                      move.l     (a7),(a0)
[000190cc] 2857                      movea.l    (a7),a4
[000190ce] 760f                      moveq.l    #15,d3
[000190d0] d66c 0016                 add.w      22(a4),d3
[000190d4] c67c fff0                 and.w      #$FFF0,d3
[000190d8] c7ec 0018                 muls.w     24(a4),d3
[000190dc] e643                      asr.w      #3,d3
[000190de] 48c3                      ext.l      d3
[000190e0] 4bec 0026                 lea.l      38(a4),a5
[000190e4] 294d 0004                 move.l     a5,4(a4)
[000190e8] dbc3                      adda.l     d3,a5
[000190ea] 288d                      move.l     a5,(a4)
[000190ec] dbc3                      adda.l     d3,a5
[000190ee] 294d 0008                 move.l     a5,8(a4)
[000190f2] 4bed 000c                 lea.l      12(a5),a5
[000190f6] 9dce                      suba.l     a6,a6
[000190f8] 244e                      movea.l    a6,a2
fix_cicon_6:
[000190fa] 264d                      movea.l    a5,a3
[000190fc] 0c53 0004                 cmpi.w     #$0004,(a3)
[00019100] 6602                      bne.s      fix_cicon_3
[00019102] 244b                      movea.l    a3,a2
fix_cicon_3:
[00019104] 0c53 0008                 cmpi.w     #$0008,(a3)
[00019108] 6602                      bne.s      fix_cicon_4
[0001910a] 2c4b                      movea.l    a3,a6
fix_cicon_4:
[0001910c] 4bed 0016                 lea.l      22(a5),a5
[00019110] 274d 0002                 move.l     a5,2(a3)
[00019114] 2003                      move.l     d3,d0
[00019116] 3213                      move.w     (a3),d1
[00019118] 48c1                      ext.l      d1
[0001911a] 4eb9 0008 3cac            jsr        _lmul
[00019120] dbc0                      adda.l     d0,a5
[00019122] 274d 0006                 move.l     a5,6(a3)
[00019126] dbc3                      adda.l     d3,a5
[00019128] 202b 000a                 move.l     10(a3),d0
[0001912c] 6718                      beq.s      fix_cicon_5
[0001912e] 274d 000a                 move.l     a5,10(a3)
[00019132] 2003                      move.l     d3,d0
[00019134] 3213                      move.w     (a3),d1
[00019136] 48c1                      ext.l      d1
[00019138] 4eb9 0008 3cac            jsr        _lmul
[0001913e] dbc0                      adda.l     d0,a5
[00019140] 274d 000e                 move.l     a5,14(a3)
[00019144] dbc3                      adda.l     d3,a5
fix_cicon_5:
[00019146] 202b 0012                 move.l     18(a3),d0
[0001914a] 66ae                      bne.s      fix_cicon_6
[0001914c] 42ac 0022                 clr.l      34(a4)
[00019150] 200a                      move.l     a2,d0
[00019152] 670e                      beq.s      fix_cicon_7
[00019154] 2940 0022                 move.l     d0,34(a4)
[00019158] 220e                      move.l     a6,d1
[0001915a] 670e                      beq.s      fix_cicon_8
[0001915c] 2541 0012                 move.l     d1,18(a2)
[00019160] 6008                      bra.s      fix_cicon_8
fix_cicon_7:
[00019162] 200e                      move.l     a6,d0
[00019164] 6704                      beq.s      fix_cicon_8
[00019166] 2940 0022                 move.l     d0,34(a4)
fix_cicon_8:
[0001916a] 2e8d                      move.l     a5,(a7)
fix_cicon_2:
[0001916c] 206f 0004                 movea.l    4(a7),a0
[00019170] 2010                      move.l     (a0),d0
[00019172] 6700 ff4e                 beq        fix_cicon_9
[00019176] 504f                      addq.w     #8,a7
[00019178] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[0001917c] 4e75                      rts
J3:
[0001944a] 001a                      dc.w $001a   ; $00019464-$0001944a
[0001944c] 001a                      dc.w $001a   ; $00019464-$0001944a
[0001944e] 0056                      dc.w $0056   ; $000194a0-$0001944a
[00019450] 007a                      dc.w $007a   ; $000194c4-$0001944a
[00019452] 0108                      dc.w $0108   ; $00019552-$0001944a
[00019454] 0082                      dc.w $0082   ; $000194cc-$0001944a
[00019456] 0108                      dc.w $0108   ; $00019552-$0001944a
[00019458] 0082                      dc.w $0082   ; $000194cc-$0001944a
[0001945a] 001a                      dc.w $001a   ; $00019464-$0001944a
[0001945c] 001a                      dc.w $001a   ; $00019464-$0001944a
[0001945e] 00bc                      dc.w $00bc   ; $00019506-$0001944a
[00019460] 0082                      dc.w $0082   ; $000194cc-$0001944a
[00019462] 009a                      dc.w $009a   ; $000194e4-$0001944a

objects:
[0001917e] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[00019182] 4fef ffb4                 lea.l      -76(a7),a7
[00019186] 2f48 0048                 move.l     a0,72(a7)
[0001918a] 2449                      movea.l    a1,a2
[0001918c] 2f49 0004                 move.l     a1,4(a7)
[00019190] 7000                      moveq.l    #0,d0
[00019192] 3029 0022                 move.w     34(a1),d0
[00019196] 41f2 0800                 lea.l      0(a2,d0.l),a0
[0001919a] 2228 0004                 move.l     4(a0),d1
[0001919e] 43f2 1800                 lea.l      0(a2,d1.l),a1
[000191a2] 2e89                      move.l     a1,(a7)
[000191a4] 7404                      moveq.l    #4,d2
[000191a6] 206f 0004                 movea.l    4(a7),a0
[000191aa] c450                      and.w      (a0),d2
[000191ac] 6706                      beq.s      objects_1
[000191ae] 2049                      movea.l    a1,a0
[000191b0] 6100 fef8                 bsr        fix_cicon
objects_1:
[000191b4] 76ff                      moveq.l    #-1,d3
[000191b6] 206f 0004                 movea.l    4(a7),a0
[000191ba] d668 0016                 add.w      22(a0),d3
[000191be] 7000                      moveq.l    #0,d0
[000191c0] 3028 0012                 move.w     18(a0),d0
[000191c4] 43f2 0800                 lea.l      0(a2,d0.l),a1
[000191c8] 2f49 001a                 move.l     a1,26(a7)
[000191cc] 4244                      clr.w      d4
[000191ce] 6000 03c4                 bra        objects_2
objects_27:
[000191d2] 3004                      move.w     d4,d0
[000191d4] 48c0                      ext.l      d0
[000191d6] e588                      lsl.l      #2,d0
[000191d8] 206f 001a                 movea.l    26(a7),a0
[000191dc] 2230 0800                 move.l     0(a0,d0.l),d1
[000191e0] 47f2 1800                 lea.l      0(a2,d1.l),a3
[000191e4] 226f 0004                 movea.l    4(a7),a1
[000191e8] 7e00                      moveq.l    #0,d7
[000191ea] 3e29 0002                 move.w     2(a1),d7
[000191ee] 7000                      moveq.l    #0,d0
[000191f0] 3029 0014                 move.w     20(a1),d0
[000191f4] 2400                      move.l     d0,d2
[000191f6] d482                      add.l      d2,d2
[000191f8] d480                      add.l      d0,d2
[000191fa] e78a                      lsl.l      #3,d2
[000191fc] de82                      add.l      d2,d7
[000191fe] 2a01                      move.l     d1,d5
[00019200] 4246                      clr.w      d6
[00019202] 601c                      bra.s      objects_3
objects_5:
[00019204] 3006                      move.w     d6,d0
[00019206] 48c0                      ext.l      d0
[00019208] e588                      lsl.l      #2,d0
[0001920a] 206f 001a                 movea.l    26(a7),a0
[0001920e] bab0 0800                 cmp.l      0(a0,d0.l),d5
[00019212] 6c0a                      bge.s      objects_4
[00019214] beb0 0800                 cmp.l      0(a0,d0.l),d7
[00019218] 6f04                      ble.s      objects_4
[0001921a] 2e30 0800                 move.l     0(a0,d0.l),d7
objects_4:
[0001921e] 5246                      addq.w     #1,d6
objects_3:
[00019220] b646                      cmp.w      d6,d3
[00019222] 6ce0                      bge.s      objects_5
[00019224] 2007                      move.l     d7,d0
[00019226] 9085                      sub.l      d5,d0
[00019228] 7218                      moveq.l    #24,d1
[0001922a] 4eb9 0008 3c5a            jsr        _uldiv
[00019230] 2a00                      move.l     d0,d5
[00019232] 2005                      move.l     d5,d0
[00019234] e788                      lsl.l      #3,d0
[00019236] 9085                      sub.l      d5,d0
[00019238] e788                      lsl.l      #3,d0
[0001923a] 206f 0048                 movea.l    72(a7),a0
[0001923e] 4eb9 0001 7fae            jsr        objmalloc
[00019244] 2f48 0044                 move.l     a0,68(a7)
[00019248] 2008                      move.l     a0,d0
[0001924a] 6700 034e                 beq        objects_6
[0001924e] 0068 0100 0038            ori.w      #$0100,56(a0)
[00019254] 2240                      movea.l    d0,a1
[00019256] 2368 000a 000e            move.l     10(a0),14(a1)
[0001925c] 3f7c 0002 0018            move.w     #$0002,24(a7)
[00019262] 43ef 0018                 lea.l      24(a7),a1
[00019266] 41ef 0008                 lea.l      8(a7),a0
[0001926a] 3004                      move.w     d4,d0
[0001926c] 6100 fab4                 bsr        tree_label
[00019270] 0c6f 0002 0018            cmpi.w     #$0002,24(a7)
[00019276] 6646                      bne.s      objects_7
[00019278] 0c2b 0019 0007            cmpi.b     #$19,7(a3)
[0001927e] 663a                      bne.s      objects_8
[00019280] 302b 0004                 move.w     4(a3),d0
[00019284] b06b 0018                 cmp.w      24(a3),d0
[00019288] 6630                      bne.s      objects_8
[0001928a] 0c2b 0014 001f            cmpi.b     #$14,31(a3)
[00019290] 6628                      bne.s      objects_8
[00019292] 0c6b 0002 001a            cmpi.w     #$0002,26(a3)
[00019298] 6620                      bne.s      objects_8
[0001929a] 0c6b 0002 001c            cmpi.w     #$0002,28(a3)
[000192a0] 6618                      bne.s      objects_8
[000192a2] 0c6b 0001 0030            cmpi.w     #$0001,48(a3)
[000192a8] 6610                      bne.s      objects_8
[000192aa] 0c2b 0019 0037            cmpi.b     #$19,55(a3)
[000192b0] 6608                      bne.s      objects_8
[000192b2] 3f7c 0001 0018            move.w     #$0001,24(a7)
[000192b8] 6004                      bra.s      objects_7
objects_8:
[000192ba] 426f 0018                 clr.w      24(a7)
objects_7:
[000192be] 102f 0008                 move.b     8(a7),d0
[000192c2] 6642                      bne.s      objects_9
[000192c4] 322f 0018                 move.w     24(a7),d1
[000192c8] 671e                      beq.s      objects_10
[000192ca] 4879 000a 53a0            pea.l      $000A53A0
[000192d0] 4879 000a 53cc            pea.l      $000A53CC
[000192d6] 226f 004c                 movea.l    76(a7),a1
[000192da] 206f 0050                 movea.l    80(a7),a0
[000192de] 4eb9 0001 81c6            jsr        objname
[000192e4] 504f                      addq.w     #8,a7
[000192e6] 6038                      bra.s      objects_11
objects_10:
[000192e8] 4879 000a 53a0            pea.l      $000A53A0
[000192ee] 4879 000a 53d4            pea.l      $000A53D4
[000192f4] 226f 004c                 movea.l    76(a7),a1
[000192f8] 206f 0050                 movea.l    80(a7),a0
[000192fc] 4eb9 0001 81c6            jsr        objname
[00019302] 504f                      addq.w     #8,a7
[00019304] 601a                      bra.s      objects_11
objects_9:
[00019306] 4879 000a 53a0            pea.l      $000A53A0
[0001930c] 486f 000c                 pea.l      12(a7)
[00019310] 226f 004c                 movea.l    76(a7),a1
[00019314] 206f 0050                 movea.l    80(a7),a0
[00019318] 4eb9 0001 81c6            jsr        objname
[0001931e] 504f                      addq.w     #8,a7
objects_11:
[00019320] 302f 0018                 move.w     24(a7),d0
[00019324] 6700 0080                 beq        objects_12
[00019328] 3e2b 0002                 move.w     2(a3),d7
[0001932c] 48c7                      ext.l      d7
[0001932e] 2407                      move.l     d7,d2
[00019330] d482                      add.l      d2,d2
[00019332] d487                      add.l      d7,d2
[00019334] e78a                      lsl.l      #3,d2
[00019336] 3033 2802                 move.w     2(a3,d2.l),d0
[0001933a] 48c0                      ext.l      d0
[0001933c] 2200                      move.l     d0,d1
[0001933e] d281                      add.l      d1,d1
[00019340] d280                      add.l      d0,d1
[00019342] e789                      lsl.l      #3,d1
[00019344] 3c33 1802                 move.w     2(a3,d1.l),d6
[00019348] 3406                      move.w     d6,d2
[0001934a] 48c2                      ext.l      d2
[0001934c] 2202                      move.l     d2,d1
[0001934e] d281                      add.l      d1,d1
[00019350] d282                      add.l      d2,d1
[00019352] e789                      lsl.l      #3,d1
[00019354] 2e33 180c                 move.l     12(a3,d1.l),d7
[00019358] 37bc 0006 1814            move.w     #$0006,20(a3,d1.l)
[0001935e] 0073 2000 180a            ori.w      #$2000,10(a3,d1.l)
[00019364] 4232 7800                 clr.b      0(a2,d7.l)
[00019368] 3e2b 0004                 move.w     4(a3),d7
[0001936c] 48c7                      ext.l      d7
[0001936e] 2007                      move.l     d7,d0
[00019370] d080                      add.l      d0,d0
[00019372] d087                      add.l      d7,d0
[00019374] e788                      lsl.l      #3,d0
[00019376] 3e33 0802                 move.w     2(a3,d0.l),d7
[0001937a] 3207                      move.w     d7,d1
[0001937c] 48c1                      ext.l      d1
[0001937e] 2401                      move.l     d1,d2
[00019380] d482                      add.l      d2,d2
[00019382] d481                      add.l      d1,d2
[00019384] e78a                      lsl.l      #3,d2
[00019386] 3c33 2802                 move.w     2(a3,d2.l),d6
[0001938a] 6016                      bra.s      objects_13
objects_14:
[0001938c] 3206                      move.w     d6,d1
[0001938e] 48c1                      ext.l      d1
[00019390] 2001                      move.l     d1,d0
[00019392] d080                      add.l      d0,d0
[00019394] d081                      add.l      d1,d0
[00019396] e788                      lsl.l      #3,d0
[00019398] 0073 2000 080a            ori.w      #$2000,10(a3,d0.l)
[0001939e] 3c33 0800                 move.w     0(a3,d0.l),d6
objects_13:
[000193a2] bc47                      cmp.w      d7,d6
[000193a4] 66e6                      bne.s      objects_14
objects_12:
[000193a6] 206f 0044                 movea.l    68(a7),a0
[000193aa] 2a68 0004                 movea.l    4(a0),a5
[000193ae] 4240                      clr.w      d0
[000193b0] 3740 0012                 move.w     d0,18(a3)
[000193b4] 3740 0010                 move.w     d0,16(a3)
[000193b8] 4246                      clr.w      d6
[000193ba] 6000 01a0                 bra        objects_15
objects_24:
[000193be] 7038                      moveq.l    #56,d0
[000193c0] 43f9 000a 5368            lea.l      obsproto,a1
[000193c6] 204d                      movea.l    a5,a0
[000193c8] 4eb9 0008 3500            jsr        memcpy
[000193ce] 41ef 0008                 lea.l      8(a7),a0
[000193d2] 3206                      move.w     d6,d1
[000193d4] 3004                      move.w     d4,d0
[000193d6] 6100 f9c6                 bsr        index_label
[000193da] 102f 0008                 move.b     8(a7),d0
[000193de] 672e                      beq.s      objects_16
[000193e0] 206f 0048                 movea.l    72(a7),a0
[000193e4] 7000                      moveq.l    #0,d0
[000193e6] 4eb9 0001 7fae            jsr        objmalloc
[000193ec] 2848                      movea.l    a0,a4
[000193ee] 200c                      move.l     a4,d0
[000193f0] 6700 01a8                 beq        objects_6
[000193f4] 4879 000a 53a0            pea.l      $000A53A0
[000193fa] 486f 000c                 pea.l      12(a7)
[000193fe] 224c                      movea.l    a4,a1
[00019400] 206f 0050                 movea.l    80(a7),a0
[00019404] 4eb9 0001 81c6            jsr        objname
[0001940a] 504f                      addq.w     #8,a7
[0001940c] 2a8c                      move.l     a4,(a5)
objects_16:
[0001940e] 7018                      moveq.l    #24,d0
[00019410] 224b                      movea.l    a3,a1
[00019412] 41ed 0008                 lea.l      8(a5),a0
[00019416] 4eb9 0008 3500            jsr        memcpy
[0001941c] 026d 00ff 000e            andi.w     #$00FF,14(a5)
[00019422] 026d 00df 0010            andi.w     #$00DF,16(a5)
[00019428] 026d 203f 0012            andi.w     #$203F,18(a5)
[0001942e] 102b 0007                 move.b     7(a3),d0
[00019432] 4880                      ext.w      d0
[00019434] 907c 0015                 sub.w      #$0015,d0
[00019438] b07c 000c                 cmp.w      #$000C,d0
[0001943c] 6200 0114                 bhi        objects_17
[00019440] d040                      add.w      d0,d0
[00019442] 303b 0006                 move.w     $0001944A(pc,d0.w),d0
[00019446] 4efb 0002                 jmp        $0001944A(pc,d0.w)
J3:
[0001944a] 001a                      dc.w $001a   ; objects_18-J3
[0001944c] 001a                      dc.w $001a   ; objects_18-J3
[0001944e] 0056                      dc.w $0056   ; objects_19-J3
[00019450] 007a                      dc.w $007a   ; objects_20-J3
[00019452] 0108                      dc.w $0108   ; objects_17-J3
[00019454] 0082                      dc.w $0082   ; objects_21-J3
[00019456] 0108                      dc.w $0108   ; objects_17-J3
[00019458] 0082                      dc.w $0082   ; objects_21-J3
[0001945a] 001a                      dc.w $001a   ; objects_18-J3
[0001945c] 001a                      dc.w $001a   ; objects_18-J3
[0001945e] 00bc                      dc.w $00bc   ; objects_22-J3
[00019460] 0082                      dc.w $0082   ; objects_21-J3
[00019462] 009a                      dc.w $009a   ; objects_23-J3
objects_18:
[00019464] 202b 000c                 move.l     12(a3),d0
[00019468] 49f2 0800                 lea.l      0(a2,d0.l),a4
[0001946c] 2214                      move.l     (a4),d1
[0001946e] 41f2 1800                 lea.l      0(a2,d1.l),a0
[00019472] 2888                      move.l     a0,(a4)
[00019474] 202c 0004                 move.l     4(a4),d0
[00019478] 43f2 0800                 lea.l      0(a2,d0.l),a1
[0001947c] 2949 0004                 move.l     a1,4(a4)
[00019480] 202c 0008                 move.l     8(a4),d0
[00019484] 41f2 0800                 lea.l      0(a2,d0.l),a0
[00019488] 2948 0008                 move.l     a0,8(a4)
[0001948c] 224c                      movea.l    a4,a1
[0001948e] 206f 0048                 movea.l    72(a7),a0
[00019492] 4eb9 0003 66de            jsr        dup_tedinfo
[00019498] 2b48 0014                 move.l     a0,20(a5)
[0001949c] 6000 00b4                 bra        objects_17
objects_19:
[000194a0] 202b 000c                 move.l     12(a3),d0
[000194a4] 49f2 0800                 lea.l      0(a2,d0.l),a4
[000194a8] 2214                      move.l     (a4),d1
[000194aa] 41f2 1800                 lea.l      0(a2,d1.l),a0
[000194ae] 2888                      move.l     a0,(a4)
[000194b0] 224c                      movea.l    a4,a1
[000194b2] 206f 0048                 movea.l    72(a7),a0
[000194b6] 4eb9 0003 4ce2            jsr        dup_image
[000194bc] 2b48 0014                 move.l     a0,20(a5)
[000194c0] 6000 0090                 bra        objects_17
objects_20:
[000194c4] 42ad 0014                 clr.l      20(a5)
[000194c8] 6000 0088                 bra        objects_17
objects_21:
[000194cc] 202d 0014                 move.l     20(a5),d0
[000194d0] 43f2 0800                 lea.l      0(a2,d0.l),a1
[000194d4] 206f 0048                 movea.l    72(a7),a0
[000194d8] 4eb9 0003 615c            jsr        dup_string
[000194de] 2b48 0014                 move.l     a0,20(a5)
[000194e2] 606e                      bra.s      objects_17
objects_23:
[000194e4] 3b7c 001f 000e            move.w     #$001F,14(a5)
[000194ea] 202b 000c                 move.l     12(a3),d0
[000194ee] e588                      lsl.l      #2,d0
[000194f0] 2057                      movea.l    (a7),a0
[000194f2] 2270 0800                 movea.l    0(a0,d0.l),a1
[000194f6] 206f 0048                 movea.l    72(a7),a0
[000194fa] 4eb9 0003 490a            jsr        dup_icon
[00019500] 2b48 0014                 move.l     a0,20(a5)
[00019504] 604c                      bra.s      objects_17
objects_22:
[00019506] 202b 000c                 move.l     12(a3),d0
[0001950a] 49f2 0800                 lea.l      0(a2,d0.l),a4
[0001950e] 2214                      move.l     (a4),d1
[00019510] 41f2 1800                 lea.l      0(a2,d1.l),a0
[00019514] 2888                      move.l     a0,(a4)
[00019516] 202c 0004                 move.l     4(a4),d0
[0001951a] 43f2 0800                 lea.l      0(a2,d0.l),a1
[0001951e] 2949 0004                 move.l     a1,4(a4)
[00019522] 202c 0008                 move.l     8(a4),d0
[00019526] 41f2 0800                 lea.l      0(a2,d0.l),a0
[0001952a] 2948 0008                 move.l     a0,8(a4)
[0001952e] 7022                      moveq.l    #34,d0
[00019530] 224c                      movea.l    a4,a1
[00019532] 41ef 001e                 lea.l      30(a7),a0
[00019536] 4eb9 0008 3500            jsr        memcpy
[0001953c] 42af 0040                 clr.l      64(a7)
[00019540] 43ef 001e                 lea.l      30(a7),a1
[00019544] 206f 0048                 movea.l    72(a7),a0
[00019548] 4eb9 0003 490a            jsr        dup_icon
[0001954e] 2b48 0014                 move.l     a0,20(a5)
objects_17:
[00019552] 4bed 0038                 lea.l      56(a5),a5
[00019556] 47eb 0018                 lea.l      24(a3),a3
[0001955a] 5246                      addq.w     #1,d6
objects_15:
[0001955c] 3006                      move.w     d6,d0
[0001955e] 48c0                      ext.l      d0
[00019560] ba80                      cmp.l      d0,d5
[00019562] 6e00 fe5a                 bgt        objects_24
[00019566] 322f 0018                 move.w     24(a7),d1
[0001956a] 6714                      beq.s      objects_25
[0001956c] 226f 0044                 movea.l    68(a7),a1
[00019570] 206f 0048                 movea.l    72(a7),a0
[00019574] 2068 001c                 movea.l    28(a0),a0
[00019578] 4eb9 0003 33b4            jsr        add_entry
[0001957e] 6012                      bra.s      objects_26
objects_25:
[00019580] 226f 0044                 movea.l    68(a7),a1
[00019584] 206f 0048                 movea.l    72(a7),a0
[00019588] 2068 0018                 movea.l    24(a0),a0
[0001958c] 4eb9 0003 33b4            jsr        add_entry
objects_26:
[00019592] 5244                      addq.w     #1,d4
objects_2:
[00019594] b644                      cmp.w      d4,d3
[00019596] 6c00 fc3a                 bge        objects_27
objects_6:
[0001959a] 4fef 004c                 lea.l      76(a7),a7
[0001959e] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[000195a2] 4e75                      rts

read_rsc:
[000195a4] 2f0a                      move.l     a2,-(a7)
[000195a6] 2f0b                      move.l     a3,-(a7)
[000195a8] 4fef ffdc                 lea.l      -36(a7),a7
[000195ac] 2448                      movea.l    a0,a2
[000195ae] 702e                      moveq.l    #46,d0
[000195b0] 206a 0008                 movea.l    8(a2),a0
[000195b4] 4eb9 0008 2e9e            jsr        strrchr
[000195ba] 2648                      movea.l    a0,a3
[000195bc] 43f9 000a 53de            lea.l      $000A53DE,a1
[000195c2] 4eb9 0008 2f0c            jsr        strcpy
[000195c8] 204a                      movea.l    a2,a0
[000195ca] 6100 f6e2                 bsr        load_dfn
[000195ce] 43f9 000a 53e3            lea.l      $000A53E3,a1
[000195d4] 204b                      movea.l    a3,a0
[000195d6] 4eb9 0008 2f0c            jsr        strcpy
[000195dc] 7024                      moveq.l    #36,d0
[000195de] 41d7                      lea.l      (a7),a0
[000195e0] 4eb9 0001 83c8            jsr        read_buf
[000195e6] 204a                      movea.l    a2,a0
[000195e8] 4eb9 0001 8514            jsr        init_acs
[000195ee] 47f9 000e 7f66            lea.l      iobuf,a3
[000195f4] 224b                      movea.l    a3,a1
[000195f6] 204a                      movea.l    a2,a0
[000195f8] 6100 fb84                 bsr        objects
[000195fc] 224b                      movea.l    a3,a1
[000195fe] 204a                      movea.l    a2,a0
[00019600] 6100 f8e2                 bsr        strings
[00019604] 224b                      movea.l    a3,a1
[00019606] 204a                      movea.l    a2,a0
[00019608] 6100 fa1e                 bsr        images
[0001960c] 2079 0010 8366            movea.l    dfna,a0
[00019612] 4eb9 0004 c7c8            jsr        Ax_free
[00019618] 4fef 0024                 lea.l      36(a7),a7
[0001961c] 265f                      movea.l    (a7)+,a3
[0001961e] 245f                      movea.l    (a7)+,a2
[00019620] 4e75                      rts

