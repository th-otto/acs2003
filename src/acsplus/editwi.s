set_icon:
[0003cc76] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003cc7a] 594f                      subq.w     #4,a7
[0003cc7c] 2e88                      move.l     a0,(a7)
[0003cc7e] 2668 005a                 movea.l    90(a0),a3
[0003cc82] 200b                      move.l     a3,d0
[0003cc84] 6700 0078                 beq.w      set_icon_1
[0003cc88] 2850                      movea.l    (a0),a4
[0003cc8a] 102c 00a8                 move.b     168(a4),d0
[0003cc8e] 6706                      beq.s      set_icon_2
[0003cc90] 4bec 00a8                 lea.l      168(a4),a5
[0003cc94] 601a                      bra.s      set_icon_3
set_icon_2:
[0003cc96] 45ec 0192                 lea.l      402(a4),a2
[0003cc9a] 705c                      moveq.l    #92,d0
[0003cc9c] 204a                      movea.l    a2,a0
[0003cc9e] 4eb9 0008 2e9e            jsr        strrchr
[0003cca4] 2a48                      movea.l    a0,a5
[0003cca6] 200d                      move.l     a5,d0
[0003cca8] 6704                      beq.s      set_icon_4
[0003ccaa] 524d                      addq.w     #1,a5
[0003ccac] 6002                      bra.s      set_icon_3
set_icon_4:
[0003ccae] 2a4a                      movea.l    a2,a5
set_icon_3:
[0003ccb0] 43ec 00b8                 lea.l      184(a4),a1
[0003ccb4] 204d                      movea.l    a5,a0
[0003ccb6] 4eb9 0008 2eba            jsr        strcmp
[0003ccbc] 4a40                      tst.w      d0
[0003ccbe] 673e                      beq.s      set_icon_1
[0003ccc0] 422c 00b8                 clr.b      184(a4)
[0003ccc4] 700f                      moveq.l    #15,d0
[0003ccc6] 224d                      movea.l    a5,a1
[0003ccc8] 41ec 00b8                 lea.l      184(a4),a0
[0003cccc] 4eb9 0008 2f96            jsr        strncat
[0003ccd2] 206b 0008                 movea.l    8(a3),a0
[0003ccd6] 4eb9 0004 649c            jsr        Ast_delete
[0003ccdc] 204d                      movea.l    a5,a0
[0003ccde] 4eb9 0004 643c            jsr        Ast_create
[0003cce4] 2748 0008                 move.l     a0,8(a3)
[0003cce8] 4eb9 0005 5e8c            jsr        Awi_root
[0003ccee] 2448                      movea.l    a0,a2
[0003ccf0] 2257                      movea.l    (a7),a1
[0003ccf2] 43e9 0058                 lea.l      88(a1),a1
[0003ccf6] 706d                      moveq.l    #109,d0
[0003ccf8] 266a 0004                 movea.l    4(a2),a3
[0003ccfc] 4e93                      jsr        (a3)
set_icon_1:
[0003ccfe] 584f                      addq.w     #4,a7
[0003cd00] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003cd04] 4e75                      rts

home:
[0003cd06] 2f0a                      move.l     a2,-(a7)
[0003cd08] 594f                      subq.w     #4,a7
[0003cd0a] 2448                      movea.l    a0,a2
[0003cd0c] 4297                      clr.l      (a7)
[0003cd0e] 93c9                      suba.l     a1,a1
[0003cd10] 303c 00d5                 move.w     #$00D5,d0
[0003cd14] 4eb9 0003 a772            jsr        Auo_editor
[0003cd1a] 93c9                      suba.l     a1,a1
[0003cd1c] 700e                      moveq.l    #14,d0
[0003cd1e] 204a                      movea.l    a2,a0
[0003cd20] 4eb9 0003 a772            jsr        Auo_editor
[0003cd26] 43d7                      lea.l      (a7),a1
[0003cd28] 303c 00d7                 move.w     #$00D7,d0
[0003cd2c] 204a                      movea.l    a2,a0
[0003cd2e] 4eb9 0003 a772            jsr        Auo_editor
[0003cd34] 93c9                      suba.l     a1,a1
[0003cd36] 303c 00db                 move.w     #$00DB,d0
[0003cd3a] 204a                      movea.l    a2,a0
[0003cd3c] 4eb9 0003 a772            jsr        Auo_editor
[0003cd42] 93c9                      suba.l     a1,a1
[0003cd44] 7005                      moveq.l    #5,d0
[0003cd46] 204a                      movea.l    a2,a0
[0003cd48] 4eb9 0003 a772            jsr        Auo_editor
[0003cd4e] 93c9                      suba.l     a1,a1
[0003cd50] 303c 00d6                 move.w     #$00D6,d0
[0003cd54] 204a                      movea.l    a2,a0
[0003cd56] 4eb9 0003 a772            jsr        Auo_editor
[0003cd5c] 584f                      addq.w     #4,a7
[0003cd5e] 245f                      movea.l    (a7)+,a2
[0003cd60] 4e75                      rts

set_select:
[0003cd62] 4a40                      tst.w      d0
[0003cd64] 6708                      beq.s      set_select_1
[0003cd66] 0068 0001 000a            ori.w      #$0001,10(a0)
[0003cd6c] 4e75                      rts
set_select_1:

[0003cd6e] 0268 fffe 000a            andi.w     #$FFFE,10(a0)
[0003cd74] 4e75                      rts

undirty:
[0003cd76] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003cd7a] 2448                      movea.l    a0,a2
[0003cd7c] 2650                      movea.l    (a0),a3
[0003cd7e] 026b ff7f 0294            andi.w     #$FF7F,660(a3)
[0003cd84] 93c9                      suba.l     a1,a1
[0003cd86] 303c 00f9                 move.w     #$00F9,d0
[0003cd8a] 206a 0014                 movea.l    20(a2),a0
[0003cd8e] 4eb9 0003 a772            jsr        Auo_editor
[0003cd94] 49f9 0010 ce40            lea.l      buffer,a4
[0003cd9a] 486b 0192                 pea.l      402(a3)
[0003cd9e] 43eb 0068                 lea.l      104(a3),a1
[0003cda2] 204c                      movea.l    a4,a0
[0003cda4] 4eb9 0008 15ac            jsr        sprintf
[0003cdaa] 584f                      addq.w     #4,a7
[0003cdac] 224c                      movea.l    a4,a1
[0003cdae] 204a                      movea.l    a2,a0
[0003cdb0] 4eb9 0003 e7bc            jsr        set_title
[0003cdb6] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003cdba] 4e75                      rts

dirty:
[0003cdbc] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003cdc0] 554f                      subq.w     #2,a7
[0003cdc2] 2448                      movea.l    a0,a2
[0003cdc4] 2650                      movea.l    (a0),a3
[0003cdc6] 303c 0080                 move.w     #$0080,d0
[0003cdca] c06b 0294                 and.w      660(a3),d0
[0003cdce] 663c                      bne.s      dirty_1
[0003cdd0] 43d7                      lea.l      (a7),a1
[0003cdd2] 206a 0014                 movea.l    20(a2),a0
[0003cdd6] 303c 00fa                 move.w     #$00FA,d0
[0003cdda] 4eb9 0003 a772            jsr        Auo_editor
[0003cde0] 3017                      move.w     (a7),d0
[0003cde2] 6728                      beq.s      dirty_1
[0003cde4] 006b 0080 0294            ori.w      #$0080,660(a3)
[0003cdea] 49f9 0010 ce40            lea.l      buffer,a4
[0003cdf0] 486b 0192                 pea.l      402(a3)
[0003cdf4] 43eb 0088                 lea.l      136(a3),a1
[0003cdf8] 204c                      movea.l    a4,a0
[0003cdfa] 4eb9 0008 15ac            jsr        sprintf
[0003ce00] 584f                      addq.w     #4,a7
[0003ce02] 224c                      movea.l    a4,a1
[0003ce04] 204a                      movea.l    a2,a0
[0003ce06] 4eb9 0003 e7bc            jsr        set_title
dirty_1:
[0003ce0c] 544f                      addq.w     #2,a7
[0003ce0e] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003ce12] 4e75                      rts

edit_key:
[0003ce14] 48e7 1f3c                 movem.l    d3-d7/a2-a5,-(a7)
[0003ce18] 4fef fdae                 lea.l      -594(a7),a7
[0003ce1c] 2f48 024e                 move.l     a0,590(a7)
[0003ce20] 3f41 024c                 move.w     d1,588(a7)
[0003ce24] 2668 0014                 movea.l    20(a0),a3
[0003ce28] 76ff                      moveq.l    #-1,d3
[0003ce2a] 2f50 0240                 move.l     (a0),576(a7)
[0003ce2e] 3f7c 0008 0216            move.w     #$0008,534(a7)
[0003ce34] 42af 022c                 clr.l      556(a7)
[0003ce38] 2f6b 000c 0244            move.l     12(a3),580(a7)
[0003ce3e] 226f 0244                 movea.l    580(a7),a1
[0003ce42] 2a69 0008                 movea.l    8(a1),a5
[0003ce46] 303c 00d5                 move.w     #$00D5,d0
[0003ce4a] 204b                      movea.l    a3,a0
[0003ce4c] 93c9                      suba.l     a1,a1
[0003ce4e] 4e95                      jsr        (a5)
[0003ce50] 45ef 0218                 lea.l      536(a7),a2
[0003ce54] 6000 0d98                 bra        edit_key_1
[0003ce58] 302f 024c                 move.w     588(a7),d0
edit_key_126:
[0003ce5c] 6a00 0b82                 bpl        edit_key_2
[0003ce60] 122f 024d                 move.b     589(a7),d1
[0003ce64] 4881                      ext.w      d1
[0003ce66] b27c 0079                 cmp.w      #$0079,d1
[0003ce6a] 6200 0b6e                 bhi        edit_key_3
[0003ce6e] d241                      add.w      d1,d1
[0003ce70] 323b 1006                 move.w     $0003CE78(pc,d1.w),d1
[0003ce74] 4efb 1002                 jmp        $0003CE78(pc,d1.w)
J30:
[0003ce78] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ce7a] 0276                      dc.w $0276   ; edit_key_4-J30
[0003ce7c] 02aa                      dc.w $02aa   ; edit_key_5-J30
[0003ce7e] 0446                      dc.w $0446   ; edit_key_6-J30
[0003ce80] 02e0                      dc.w $02e0   ; edit_key_7-J30
[0003ce82] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ce84] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ce86] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ce88] 07a6                      dc.w $07a6   ; edit_key_8-J30
[0003ce8a] 0a0e                      dc.w $0a0e   ; edit_key_9-J30
[0003ce8c] 0906                      dc.w $0906   ; edit_key_10-J30
[0003ce8e] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ce90] 05fa                      dc.w $05fa   ; edit_key_11-J30
[0003ce92] 0906                      dc.w $0906   ; edit_key_10-J30
[0003ce94] 010a                      dc.w $010a   ; edit_key_12-J30
[0003ce96] 00f4                      dc.w $00f4   ; edit_key_13-J30
[0003ce98] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003ce9a] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003ce9c] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003ce9e] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003cea0] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003cea2] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003cea4] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003cea6] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003cea8] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003ceaa] 0aee                      dc.w $0aee   ; edit_key_14-J30
[0003ceac] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceae] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceb0] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceb2] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceb4] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceb6] 0626                      dc.w $0626   ; edit_key_15-J30
[0003ceb8] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceba] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cebc] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cebe] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cec0] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cec2] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cec4] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cec6] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cec8] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceca] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cecc] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cece] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ced0] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ced2] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ced4] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ced6] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ced8] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceda] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cedc] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cede] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cee0] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cee2] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cee4] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cee6] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cee8] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceea] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceec] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003ceee] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cef0] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cef2] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cef4] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cef6] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cef8] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cefa] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cefc] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cefe] 0ac2                      dc.w $0ac2   ; edit_key_16-J30
[0003cf00] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf02] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf04] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf06] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf08] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf0a] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf0c] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf0e] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf10] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf12] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf14] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf16] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf18] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf1a] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf1c] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf1e] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf20] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf22] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf24] 0ad8                      dc.w $0ad8   ; edit_key_17-J30
[0003cf26] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf28] 0aac                      dc.w $0aac   ; edit_key_18-J30
[0003cf2a] 0a96                      dc.w $0a96   ; edit_key_19-J30
[0003cf2c] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf2e] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf30] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf32] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf34] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf36] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf38] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf3a] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf3c] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf3e] 0ac2                      dc.w $0ac2   ; edit_key_16-J30
[0003cf40] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf42] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf44] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf46] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf48] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf4a] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf4c] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf4e] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf50] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf52] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf54] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf56] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf58] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf5a] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf5c] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf5e] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf60] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf62] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf64] 0ad8                      dc.w $0ad8   ; edit_key_17-J30
[0003cf66] 0b62                      dc.w $0b62   ; edit_key_3-J30
[0003cf68] 0aac                      dc.w $0aac   ; edit_key_18-J30
[0003cf6a] 0a96                      dc.w $0a96   ; edit_key_19-J30
edit_key_13:
[0003cf6c] 93c9                      suba.l     a1,a1
[0003cf6e] 303c 00eb                 move.w     #$00EB,d0
[0003cf72] 204b                      movea.l    a3,a0
[0003cf74] 4e95                      jsr        (a5)
[0003cf76] 93c9                      suba.l     a1,a1
[0003cf78] 7005                      moveq.l    #5,d0
[0003cf7a] 204b                      movea.l    a3,a0
[0003cf7c] 4e95                      jsr        (a5)
[0003cf7e] 6000 0c58                 bra        edit_key_20
edit_key_12:
[0003cf82] 43ef 021c                 lea.l      540(a7),a1
[0003cf86] 303c 00e3                 move.w     #$00E3,d0
[0003cf8a] 204b                      movea.l    a3,a0
[0003cf8c] 4e95                      jsr        (a5)
[0003cf8e] 202f 021c                 move.l     540(a7),d0
[0003cf92] 6a00 009c                 bpl        edit_key_21
[0003cf96] 43ef 0010                 lea.l      16(a7),a1
[0003cf9a] 204b                      movea.l    a3,a0
[0003cf9c] 303c 0107                 move.w     #$0107,d0
[0003cfa0] 4e95                      jsr        (a5)
[0003cfa2] 43ef 0238                 lea.l      568(a7),a1
[0003cfa6] 303c 00d8                 move.w     #$00D8,d0
[0003cfaa] 204b                      movea.l    a3,a0
[0003cfac] 4e95                      jsr        (a5)
[0003cfae] 43ef 0234                 lea.l      564(a7),a1
[0003cfb2] 303c 00e7                 move.w     #$00E7,d0
[0003cfb6] 204b                      movea.l    a3,a0
[0003cfb8] 4e95                      jsr        (a5)
[0003cfba] 202f 0238                 move.l     568(a7),d0
[0003cfbe] 2e80                      move.l     d0,(a7)
[0003cfc0] 2f40 0224                 move.l     d0,548(a7)
[0003cfc4] 2f40 021c                 move.l     d0,540(a7)
[0003cfc8] 43d7                      lea.l      (a7),a1
[0003cfca] 204b                      movea.l    a3,a0
[0003cfcc] 303c 00ca                 move.w     #$00CA,d0
[0003cfd0] 4e95                      jsr        (a5)
[0003cfd2] 24af 0234                 move.l     564(a7),(a2)
[0003cfd6] 601c                      bra.s      edit_key_22
[0003cfd8] 2212                      move.l     (a2),d1
edit_key_24:
[0003cfda] 206f 0008                 movea.l    8(a7),a0
[0003cfde] 1030 1800                 move.b     0(a0,d1.l),d0
[0003cfe2] 4880                      ext.w      d0
[0003cfe4] 206f 0010                 movea.l    16(a7),a0
[0003cfe8] 4eb9 0008 2e8a            jsr        strchr
[0003cfee] 2008                      move.l     a0,d0
[0003cff0] 6606                      bne.s      edit_key_23
[0003cff2] 5392                      subq.l     #1,(a2)
edit_key_22:
[0003cff4] 2012                      move.l     (a2),d0
[0003cff6] 6ae0                      bpl.s      edit_key_24
edit_key_23:
[0003cff8] 7001                      moveq.l    #1,d0
[0003cffa] d092                      add.l      (a2),d0
[0003cffc] 2f40 0220                 move.l     d0,544(a7)
[0003d000] 24af 0234                 move.l     564(a7),(a2)
[0003d004] 601c                      bra.s      edit_key_25
[0003d006] 2212                      move.l     (a2),d1
edit_key_27:
[0003d008] 206f 0008                 movea.l    8(a7),a0
[0003d00c] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d010] 4880                      ext.w      d0
[0003d012] 206f 0010                 movea.l    16(a7),a0
[0003d016] 4eb9 0008 2e8a            jsr        strchr
[0003d01c] 2008                      move.l     a0,d0
[0003d01e] 660a                      bne.s      edit_key_26
[0003d020] 5292                      addq.l     #1,(a2)
edit_key_25:
[0003d022] 2012                      move.l     (a2),d0
[0003d024] b0af 0004                 cmp.l      4(a7),d0
[0003d028] 6ddc                      blt.s      edit_key_27
edit_key_26:
[0003d02a] 2f52 0228                 move.l     (a2),552(a7)
[0003d02e] 602c                      bra.s      edit_key_28
edit_key_21:
[0003d030] 93c9                      suba.l     a1,a1
[0003d032] 303c 00e2                 move.w     #$00E2,d0
[0003d036] 204b                      movea.l    a3,a0
[0003d038] 4e95                      jsr        (a5)
[0003d03a] 2eaf 021c                 move.l     540(a7),(a7)
[0003d03e] 43d7                      lea.l      (a7),a1
[0003d040] 303c 00ca                 move.w     #$00CA,d0
[0003d044] 204b                      movea.l    a3,a0
[0003d046] 4e95                      jsr        (a5)
[0003d048] 202f 021c                 move.l     540(a7),d0
[0003d04c] b0af 0224                 cmp.l      548(a7),d0
[0003d050] 670a                      beq.s      edit_key_28
[0003d052] 2f40 0224                 move.l     d0,548(a7)
[0003d056] 2f6f 0004 0228            move.l     4(a7),552(a7)
edit_key_28:
[0003d05c] 202f 0228                 move.l     552(a7),d0
[0003d060] b0af 0220                 cmp.l      544(a7),d0
[0003d064] 6f00 0974                 ble        edit_key_3
[0003d068] 42af 0248                 clr.l      584(a7)
[0003d06c] 41ef 0248                 lea.l      584(a7),a0
[0003d070] 303c 03e8                 move.w     #$03E8,d0
[0003d074] 4eb9 0005 6a20            jsr        Awi_sendall
[0003d07a] 43f9 000d 49e3            lea.l      $000D49E3,a1
[0003d080] 41ef 0014                 lea.l      20(a7),a0
[0003d084] 4eb9 0008 2f0c            jsr        strcpy
[0003d08a] 202f 0228                 move.l     552(a7),d0
[0003d08e] 90af 0220                 sub.l      544(a7),d0
[0003d092] 222f 0220                 move.l     544(a7),d1
[0003d096] 226f 0008                 movea.l    8(a7),a1
[0003d09a] d3c1                      adda.l     d1,a1
[0003d09c] 41ef 0014                 lea.l      20(a7),a0
[0003d0a0] 4eb9 0008 2f96            jsr        strncat
[0003d0a6] 43ef 021c                 lea.l      540(a7),a1
[0003d0aa] 303c 00e4                 move.w     #$00E4,d0
[0003d0ae] 204b                      movea.l    a3,a0
[0003d0b0] 4e95                      jsr        (a5)
[0003d0b2] 202f 0248                 move.l     584(a7),d0
[0003d0b6] 6716                      beq.s      edit_key_29
[0003d0b8] 43ef 0014                 lea.l      20(a7),a1
[0003d0bc] 2040                      movea.l    d0,a0
[0003d0be] 2840                      movea.l    d0,a4
[0003d0c0] 286c 0004                 movea.l    4(a4),a4
[0003d0c4] 303c 03e9                 move.w     #$03E9,d0
[0003d0c8] 4e94                      jsr        (a4)
[0003d0ca] 6000 0b0c                 bra        edit_key_20
edit_key_29:
[0003d0ce] 42a7                      clr.l      -(a7)
[0003d0d0] 43ef 0019                 lea.l      25(a7),a1
[0003d0d4] 206f 0244                 movea.l    580(a7),a0
[0003d0d8] 41e8 0697                 lea.l      1687(a0),a0
[0003d0dc] 4eb9 0006 24f6            jsr        Aev_AcHelp
[0003d0e2] 584f                      addq.w     #4,a7
[0003d0e4] 5340                      subq.w     #1,d0
[0003d0e6] 6700 0af0                 beq        edit_key_20
[0003d0ea] 6000 08ee                 bra        edit_key_3
edit_key_4:
[0003d0ee] 43ef 021c                 lea.l      540(a7),a1
[0003d0f2] 303c 00e3                 move.w     #$00E3,d0
[0003d0f6] 204b                      movea.l    a3,a0
[0003d0f8] 4e95                      jsr        (a5)
[0003d0fa] 202f 021c                 move.l     540(a7),d0
[0003d0fe] 6a6a                      bpl.s      edit_key_30
[0003d100] 322f 024c                 move.w     588(a7),d1
[0003d104] c27c 0300                 and.w      #$0300,d1
[0003d108] 670c                      beq.s      edit_key_31
[0003d10a] 93c9                      suba.l     a1,a1
[0003d10c] 204b                      movea.l    a3,a0
[0003d10e] 700d                      moveq.l    #13,d0
[0003d110] 4e95                      jsr        (a5)
[0003d112] 6000 0ac4                 bra        edit_key_20
edit_key_31:
[0003d116] 93c9                      suba.l     a1,a1
[0003d118] 700b                      moveq.l    #11,d0
[0003d11a] 204b                      movea.l    a3,a0
[0003d11c] 4e95                      jsr        (a5)
[0003d11e] 6000 0ab8                 bra        edit_key_20
edit_key_5:
[0003d122] 43ef 021c                 lea.l      540(a7),a1
[0003d126] 303c 00e3                 move.w     #$00E3,d0
[0003d12a] 204b                      movea.l    a3,a0
[0003d12c] 4e95                      jsr        (a5)
[0003d12e] 202f 021c                 move.l     540(a7),d0
[0003d132] 6a00 019c                 bpl        edit_key_32
[0003d136] 322f 024c                 move.w     588(a7),d1
[0003d13a] c27c 0300                 and.w      #$0300,d1
[0003d13e] 670c                      beq.s      edit_key_33
[0003d140] 93c9                      suba.l     a1,a1
[0003d142] 204b                      movea.l    a3,a0
[0003d144] 700c                      moveq.l    #12,d0
[0003d146] 4e95                      jsr        (a5)
[0003d148] 6000 0a8e                 bra        edit_key_20
edit_key_33:
[0003d14c] 93c9                      suba.l     a1,a1
[0003d14e] 700a                      moveq.l    #10,d0
[0003d150] 204b                      movea.l    a3,a0
[0003d152] 4e95                      jsr        (a5)
[0003d154] 6000 0a82                 bra        edit_key_20
edit_key_7:
[0003d158] 43ef 021c                 lea.l      540(a7),a1
[0003d15c] 303c 00e3                 move.w     #$00E3,d0
[0003d160] 204b                      movea.l    a3,a0
[0003d162] 4e95                      jsr        (a5)
[0003d164] 202f 021c                 move.l     540(a7),d0
[0003d168] 6b24                      bmi.s      edit_key_34
edit_key_30:
[0003d16a] 93c9                      suba.l     a1,a1
[0003d16c] 303c 00e2                 move.w     #$00E2,d0
[0003d170] 204b                      movea.l    a3,a0
[0003d172] 4e95                      jsr        (a5)
[0003d174] 43ef 021c                 lea.l      540(a7),a1
[0003d178] 7011                      moveq.l    #17,d0
[0003d17a] 204b                      movea.l    a3,a0
[0003d17c] 4e95                      jsr        (a5)
[0003d17e] 43ef 0220                 lea.l      544(a7),a1
[0003d182] 303c 00d7                 move.w     #$00D7,d0
[0003d186] 204b                      movea.l    a3,a0
[0003d188] 4e95                      jsr        (a5)
[0003d18a] 6000 0a4c                 bra        edit_key_20
edit_key_34:
[0003d18e] 302f 024c                 move.w     588(a7),d0
[0003d192] c07c 0400                 and.w      #$0400,d0
[0003d196] 6700 00c6                 beq        edit_key_35
[0003d19a] 93c9                      suba.l     a1,a1
[0003d19c] 204b                      movea.l    a3,a0
[0003d19e] 303c 00e2                 move.w     #$00E2,d0
[0003d1a2] 4e95                      jsr        (a5)
[0003d1a4] 43ef 0238                 lea.l      568(a7),a1
[0003d1a8] 303c 00d8                 move.w     #$00D8,d0
[0003d1ac] 204b                      movea.l    a3,a0
[0003d1ae] 4e95                      jsr        (a5)
[0003d1b0] 43ef 0234                 lea.l      564(a7),a1
[0003d1b4] 303c 00e7                 move.w     #$00E7,d0
[0003d1b8] 204b                      movea.l    a3,a0
[0003d1ba] 4e95                      jsr        (a5)
[0003d1bc] 202f 0234                 move.l     564(a7),d0
[0003d1c0] 6626                      bne.s      edit_key_36
[0003d1c2] 222f 0238                 move.l     568(a7),d1
[0003d1c6] 6700 0a10                 beq        edit_key_20
[0003d1ca] 53af 0238                 subq.l     #1,568(a7)
[0003d1ce] 43ef 0238                 lea.l      568(a7),a1
[0003d1d2] 204b                      movea.l    a3,a0
[0003d1d4] 7011                      moveq.l    #17,d0
[0003d1d6] 4e95                      jsr        (a5)
[0003d1d8] 43ef 0234                 lea.l      564(a7),a1
[0003d1dc] 303c 00e8                 move.w     #$00E8,d0
[0003d1e0] 204b                      movea.l    a3,a0
[0003d1e2] 4e95                      jsr        (a5)
[0003d1e4] 6000 024a                 bra        edit_key_37
edit_key_36:
[0003d1e8] 43ef 0010                 lea.l      16(a7),a1
[0003d1ec] 303c 0107                 move.w     #$0107,d0
[0003d1f0] 204b                      movea.l    a3,a0
[0003d1f2] 4e95                      jsr        (a5)
[0003d1f4] 2eaf 0238                 move.l     568(a7),(a7)
[0003d1f8] 43d7                      lea.l      (a7),a1
[0003d1fa] 303c 00ca                 move.w     #$00CA,d0
[0003d1fe] 204b                      movea.l    a3,a0
[0003d200] 4e95                      jsr        (a5)
[0003d202] 70ff                      moveq.l    #-1,d0
[0003d204] d0af 0234                 add.l      564(a7),d0
[0003d208] 2480                      move.l     d0,(a2)
[0003d20a] 6040                      bra.s      edit_key_38
[0003d20c] 2212                      move.l     (a2),d1
edit_key_43:
[0003d20e] 206f 0008                 movea.l    8(a7),a0
[0003d212] 1030 18ff                 move.b     -1(a0,d1.l),d0
[0003d216] 4880                      ext.w      d0
[0003d218] 206f 0010                 movea.l    16(a7),a0
[0003d21c] 4eb9 0008 2e8a            jsr        strchr
[0003d222] 2008                      move.l     a0,d0
[0003d224] 6624                      bne.s      edit_key_39
[0003d226] 601c                      bra.s      edit_key_40
[0003d228] 2212                      move.l     (a2),d1
edit_key_42:
[0003d22a] 206f 0008                 movea.l    8(a7),a0
[0003d22e] 1030 18ff                 move.b     -1(a0,d1.l),d0
[0003d232] 4880                      ext.w      d0
[0003d234] 206f 0010                 movea.l    16(a7),a0
[0003d238] 4eb9 0008 2e8a            jsr        strchr
[0003d23e] 2008                      move.l     a0,d0
[0003d240] 660e                      bne.s      edit_key_41
[0003d242] 5392                      subq.l     #1,(a2)
edit_key_40:
[0003d244] 2012                      move.l     (a2),d0
[0003d246] 6ee0                      bgt.s      edit_key_42
[0003d248] 6006                      bra.s      edit_key_41
edit_key_39:
[0003d24a] 5392                      subq.l     #1,(a2)
edit_key_38:
[0003d24c] 2012                      move.l     (a2),d0
[0003d24e] 6ebc                      bgt.s      edit_key_43
edit_key_41:
[0003d250] 224a                      movea.l    a2,a1
[0003d252] 303c 00d7                 move.w     #$00D7,d0
[0003d256] 204b                      movea.l    a3,a0
[0003d258] 4e95                      jsr        (a5)
[0003d25a] 6000 097c                 bra        edit_key_20
edit_key_35:
[0003d25e] 302f 024c                 move.w     588(a7),d0
[0003d262] c07c 0300                 and.w      #$0300,d0
[0003d266] 6710                      beq.s      edit_key_44
[0003d268] 43ef 022c                 lea.l      556(a7),a1
edit_key_57:
[0003d26c] 303c 00d7                 move.w     #$00D7,d0
[0003d270] 204b                      movea.l    a3,a0
[0003d272] 4e95                      jsr        (a5)
[0003d274] 6000 0962                 bra        edit_key_20
edit_key_44:
[0003d278] 43ef 0234                 lea.l      564(a7),a1
[0003d27c] 303c 00e7                 move.w     #$00E7,d0
[0003d280] 204b                      movea.l    a3,a0
[0003d282] 4e95                      jsr        (a5)
[0003d284] 202f 0234                 move.l     564(a7),d0
[0003d288] 6708                      beq.s      edit_key_45
[0003d28a] 53af 0234                 subq.l     #1,564(a7)
[0003d28e] 6000 01a0                 bra        edit_key_37
edit_key_45:
[0003d292] 43ef 0238                 lea.l      568(a7),a1
[0003d296] 303c 00d8                 move.w     #$00D8,d0
[0003d29a] 204b                      movea.l    a3,a0
[0003d29c] 4e95                      jsr        (a5)
[0003d29e] 202f 0238                 move.l     568(a7),d0
[0003d2a2] 6f00 0934                 ble        edit_key_20
[0003d2a6] 93c9                      suba.l     a1,a1
[0003d2a8] 204b                      movea.l    a3,a0
[0003d2aa] 700b                      moveq.l    #11,d0
[0003d2ac] 4e95                      jsr        (a5)
[0003d2ae] 43ef 0230                 lea.l      560(a7),a1
edit_key_59:
[0003d2b2] 303c 00e8                 move.w     #$00E8,d0
[0003d2b6] 204b                      movea.l    a3,a0
[0003d2b8] 4e95                      jsr        (a5)
[0003d2ba] 6000 014a                 bra        edit_key_46
edit_key_6:
[0003d2be] 43ef 021c                 lea.l      540(a7),a1
[0003d2c2] 303c 00e3                 move.w     #$00E3,d0
[0003d2c6] 204b                      movea.l    a3,a0
[0003d2c8] 4e95                      jsr        (a5)
[0003d2ca] 202f 021c                 move.l     540(a7),d0
[0003d2ce] 6b24                      bmi.s      edit_key_47
edit_key_32:
[0003d2d0] 93c9                      suba.l     a1,a1
[0003d2d2] 303c 00e2                 move.w     #$00E2,d0
[0003d2d6] 204b                      movea.l    a3,a0
[0003d2d8] 4e95                      jsr        (a5)
[0003d2da] 43ef 0224                 lea.l      548(a7),a1
[0003d2de] 7011                      moveq.l    #17,d0
[0003d2e0] 204b                      movea.l    a3,a0
[0003d2e2] 4e95                      jsr        (a5)
[0003d2e4] 43ef 0228                 lea.l      552(a7),a1
[0003d2e8] 303c 00d7                 move.w     #$00D7,d0
[0003d2ec] 204b                      movea.l    a3,a0
[0003d2ee] 4e95                      jsr        (a5)
[0003d2f0] 6000 08e6                 bra        edit_key_20
edit_key_47:
[0003d2f4] 302f 024c                 move.w     588(a7),d0
[0003d2f8] c07c 0400                 and.w      #$0400,d0
[0003d2fc] 6700 00e8                 beq        edit_key_48
[0003d300] 93c9                      suba.l     a1,a1
[0003d302] 204b                      movea.l    a3,a0
[0003d304] 303c 00e2                 move.w     #$00E2,d0
[0003d308] 4e95                      jsr        (a5)
[0003d30a] 43ef 0238                 lea.l      568(a7),a1
[0003d30e] 303c 00d8                 move.w     #$00D8,d0
[0003d312] 204b                      movea.l    a3,a0
[0003d314] 4e95                      jsr        (a5)
[0003d316] 43ef 0234                 lea.l      564(a7),a1
[0003d31a] 303c 00e7                 move.w     #$00E7,d0
[0003d31e] 204b                      movea.l    a3,a0
[0003d320] 4e95                      jsr        (a5)
[0003d322] 43ef 023c                 lea.l      572(a7),a1
[0003d326] 303c 00e9                 move.w     #$00E9,d0
[0003d32a] 204b                      movea.l    a3,a0
[0003d32c] 4e95                      jsr        (a5)
[0003d32e] 43ef 0230                 lea.l      560(a7),a1
[0003d332] 303c 00e8                 move.w     #$00E8,d0
[0003d336] 204b                      movea.l    a3,a0
[0003d338] 4e95                      jsr        (a5)
[0003d33a] 202f 0234                 move.l     564(a7),d0
[0003d33e] b0af 0230                 cmp.l      560(a7),d0
[0003d342] 662e                      bne.s      edit_key_49
[0003d344] 72ff                      moveq.l    #-1,d1
[0003d346] d2af 023c                 add.l      572(a7),d1
[0003d34a] 242f 0238                 move.l     568(a7),d2
[0003d34e] b481                      cmp.l      d1,d2
[0003d350] 6700 0886                 beq        edit_key_20
[0003d354] 43ef 022c                 lea.l      556(a7),a1
[0003d358] 204b                      movea.l    a3,a0
[0003d35a] 303c 00d7                 move.w     #$00D7,d0
[0003d35e] 4e95                      jsr        (a5)
[0003d360] 52af 0238                 addq.l     #1,568(a7)
[0003d364] 43ef 0238                 lea.l      568(a7),a1
[0003d368] 7011                      moveq.l    #17,d0
[0003d36a] 204b                      movea.l    a3,a0
[0003d36c] 4e95                      jsr        (a5)
[0003d36e] 6000 0868                 bra        edit_key_20
edit_key_49:
[0003d372] 43ef 0010                 lea.l      16(a7),a1
[0003d376] 303c 0107                 move.w     #$0107,d0
[0003d37a] 204b                      movea.l    a3,a0
[0003d37c] 4e95                      jsr        (a5)
[0003d37e] 2eaf 0238                 move.l     568(a7),(a7)
[0003d382] 43d7                      lea.l      (a7),a1
[0003d384] 303c 00ca                 move.w     #$00CA,d0
[0003d388] 204b                      movea.l    a3,a0
[0003d38a] 4e95                      jsr        (a5)
[0003d38c] 24af 0234                 move.l     564(a7),(a2)
[0003d390] 6048                      bra.s      edit_key_50
[0003d392] 2212                      move.l     (a2),d1
edit_key_54:
[0003d394] 206f 0008                 movea.l    8(a7),a0
[0003d398] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d39c] 4880                      ext.w      d0
[0003d39e] 206f 0010                 movea.l    16(a7),a0
[0003d3a2] 4eb9 0008 2e8a            jsr        strchr
[0003d3a8] 2008                      move.l     a0,d0
[0003d3aa] 672c                      beq.s      edit_key_51
[0003d3ac] 601e                      bra.s      edit_key_52
[0003d3ae] 2212                      move.l     (a2),d1
edit_key_53:
[0003d3b0] 206f 0008                 movea.l    8(a7),a0
[0003d3b4] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d3b8] 4880                      ext.w      d0
[0003d3ba] 206f 0010                 movea.l    16(a7),a0
[0003d3be] 4eb9 0008 2e8a            jsr        strchr
[0003d3c4] 2008                      move.l     a0,d0
[0003d3c6] 6700 fe88                 beq        edit_key_41
[0003d3ca] 5292                      addq.l     #1,(a2)
edit_key_52:
[0003d3cc] 2012                      move.l     (a2),d0
[0003d3ce] b0af 0230                 cmp.l      560(a7),d0
[0003d3d2] 6dda                      blt.s      edit_key_53
[0003d3d4] 6000 fe7a                 bra        edit_key_41
edit_key_51:
[0003d3d8] 5292                      addq.l     #1,(a2)
edit_key_50:
[0003d3da] 2012                      move.l     (a2),d0
[0003d3dc] b0af 0230                 cmp.l      560(a7),d0
[0003d3e0] 6db0                      blt.s      edit_key_54
[0003d3e2] 6000 fe6c                 bra        edit_key_41
edit_key_48:
[0003d3e6] 93c9                      suba.l     a1,a1
[0003d3e8] 303c 00e2                 move.w     #$00E2,d0
[0003d3ec] 204b                      movea.l    a3,a0
[0003d3ee] 4e95                      jsr        (a5)
[0003d3f0] 43ef 0230                 lea.l      560(a7),a1
[0003d3f4] 303c 00e8                 move.w     #$00E8,d0
[0003d3f8] 204b                      movea.l    a3,a0
[0003d3fa] 4e95                      jsr        (a5)
[0003d3fc] 302f 024c                 move.w     588(a7),d0
[0003d400] c07c 0300                 and.w      #$0300,d0
[0003d404] 6710                      beq.s      edit_key_55
edit_key_46:
[0003d406] 43ef 0230                 lea.l      560(a7),a1
[0003d40a] 303c 00d7                 move.w     #$00D7,d0
[0003d40e] 204b                      movea.l    a3,a0
[0003d410] 4e95                      jsr        (a5)
[0003d412] 6000 07c4                 bra        edit_key_20
edit_key_55:
[0003d416] 43ef 0234                 lea.l      564(a7),a1
[0003d41a] 303c 00e7                 move.w     #$00E7,d0
[0003d41e] 204b                      movea.l    a3,a0
[0003d420] 4e95                      jsr        (a5)
[0003d422] 202f 0234                 move.l     564(a7),d0
[0003d426] b0af 0230                 cmp.l      560(a7),d0
[0003d42a] 6c14                      bge.s      edit_key_56
[0003d42c] 52af 0234                 addq.l     #1,564(a7)
edit_key_37:
[0003d430] 43ef 0234                 lea.l      564(a7),a1
[0003d434] 303c 00d7                 move.w     #$00D7,d0
[0003d438] 204b                      movea.l    a3,a0
[0003d43a] 4e95                      jsr        (a5)
[0003d43c] 6000 079a                 bra        edit_key_20
edit_key_56:
[0003d440] 43ef 023c                 lea.l      572(a7),a1
[0003d444] 303c 00e9                 move.w     #$00E9,d0
[0003d448] 204b                      movea.l    a3,a0
[0003d44a] 4e95                      jsr        (a5)
[0003d44c] 43ef 0238                 lea.l      568(a7),a1
[0003d450] 303c 00d8                 move.w     #$00D8,d0
[0003d454] 204b                      movea.l    a3,a0
[0003d456] 4e95                      jsr        (a5)
[0003d458] 7001                      moveq.l    #1,d0
[0003d45a] d0af 0238                 add.l      568(a7),d0
[0003d45e] b0af 023c                 cmp.l      572(a7),d0
[0003d462] 6c00 0774                 bge        edit_key_20
[0003d466] 93c9                      suba.l     a1,a1
[0003d468] 204b                      movea.l    a3,a0
[0003d46a] 700a                      moveq.l    #10,d0
[0003d46c] 4e95                      jsr        (a5)
[0003d46e] 6000 fdf8                 bra        edit_key_57
edit_key_11:
[0003d472] 93c9                      suba.l     a1,a1
[0003d474] 303c 00e2                 move.w     #$00E2,d0
[0003d478] 204b                      movea.l    a3,a0
[0003d47a] 4e95                      jsr        (a5)
[0003d47c] 302f 024c                 move.w     588(a7),d0
[0003d480] c07c 0300                 and.w      #$0300,d0
[0003d484] 670c                      beq.s      edit_key_58
[0003d486] 93c9                      suba.l     a1,a1
[0003d488] 204b                      movea.l    a3,a0
[0003d48a] 700f                      moveq.l    #15,d0
[0003d48c] 4e95                      jsr        (a5)
[0003d48e] 6000 fe1e                 bra        edit_key_59
edit_key_58:
[0003d492] 93c9                      suba.l     a1,a1
[0003d494] 700e                      moveq.l    #14,d0
[0003d496] 204b                      movea.l    a3,a0
[0003d498] 4e95                      jsr        (a5)
[0003d49a] 6000 fdcc                 bra        edit_key_57
edit_key_15:
[0003d49e] 43ef 021c                 lea.l      540(a7),a1
[0003d4a2] 303c 00e3                 move.w     #$00E3,d0
[0003d4a6] 204b                      movea.l    a3,a0
[0003d4a8] 4e95                      jsr        (a5)
[0003d4aa] 202f 021c                 move.l     540(a7),d0
[0003d4ae] 6b24                      bmi.s      edit_key_60
[0003d4b0] 23ef 021c 000d 4692       move.l     540(a7),subdel
edit_key_73:
[0003d4b8] 23ef 0220 000d 4696       move.l     544(a7),$000D4696
[0003d4c0] 23ef 0224 000d 469a       move.l     548(a7),$000D469A
[0003d4c8] 23ef 0228 000d 469e       move.l     552(a7),$000D469E
[0003d4d0] 6000 029a                 bra        edit_key_61
edit_key_60:
[0003d4d4] 43ef 0238                 lea.l      568(a7),a1
[0003d4d8] 303c 00d8                 move.w     #$00D8,d0
[0003d4dc] 204b                      movea.l    a3,a0
[0003d4de] 4e95                      jsr        (a5)
[0003d4e0] 43ef 0234                 lea.l      564(a7),a1
[0003d4e4] 303c 00e7                 move.w     #$00E7,d0
[0003d4e8] 204b                      movea.l    a3,a0
[0003d4ea] 4e95                      jsr        (a5)
[0003d4ec] 43ef 0230                 lea.l      560(a7),a1
[0003d4f0] 303c 00e8                 move.w     #$00E8,d0
[0003d4f4] 204b                      movea.l    a3,a0
[0003d4f6] 4e95                      jsr        (a5)
[0003d4f8] 202f 0234                 move.l     564(a7),d0
[0003d4fc] b0af 0230                 cmp.l      560(a7),d0
[0003d500] 6c00 00e2                 bge        edit_key_62
[0003d504] 222f 0238                 move.l     568(a7),d1
[0003d508] 23c1 000d 469a            move.l     d1,$000D469A
[0003d50e] 23c1 000d 4692            move.l     d1,subdel
[0003d514] 23c0 000d 4696            move.l     d0,$000D4696
[0003d51a] 322f 024c                 move.w     588(a7),d1
[0003d51e] c27c 0300                 and.w      #$0300,d1
[0003d522] 670c                      beq.s      edit_key_63
[0003d524] 23ef 0230 000d 469e       move.l     560(a7),$000D469E
[0003d52c] 6000 023e                 bra        edit_key_61
edit_key_63:
[0003d530] 302f 024c                 move.w     588(a7),d0
[0003d534] c07c 0400                 and.w      #$0400,d0
[0003d538] 6700 009a                 beq        edit_key_64
[0003d53c] 43ef 0010                 lea.l      16(a7),a1
[0003d540] 204b                      movea.l    a3,a0
[0003d542] 303c 0107                 move.w     #$0107,d0
[0003d546] 4e95                      jsr        (a5)
[0003d548] 2eaf 0238                 move.l     568(a7),(a7)
[0003d54c] 43d7                      lea.l      (a7),a1
[0003d54e] 303c 00ca                 move.w     #$00CA,d0
[0003d552] 204b                      movea.l    a3,a0
[0003d554] 4e95                      jsr        (a5)
[0003d556] 24af 0234                 move.l     564(a7),(a2)
[0003d55a] 2212                      move.l     (a2),d1
[0003d55c] 206f 0008                 movea.l    8(a7),a0
[0003d560] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d564] 4880                      ext.w      d0
[0003d566] 206f 0010                 movea.l    16(a7),a0
[0003d56a] 4eb9 0008 2e8a            jsr        strchr
[0003d570] 2f48 000c                 move.l     a0,12(a7)
[0003d574] 6002                      bra.s      edit_key_65
[0003d576] 5292                      addq.l     #1,(a2)
edit_key_72:
edit_key_65:
[0003d578] 2012                      move.l     (a2),d0
[0003d57a] b0af 0004                 cmp.l      4(a7),d0
[0003d57e] 6c4a                      bge.s      edit_key_66
[0003d580] 222f 000c                 move.l     12(a7),d1
[0003d584] 6720                      beq.s      edit_key_67
[0003d586] 206f 0008                 movea.l    8(a7),a0
[0003d58a] 1030 0800                 move.b     0(a0,d0.l),d0
[0003d58e] 4880                      ext.w      d0
[0003d590] 206f 0010                 movea.l    16(a7),a0
[0003d594] 4eb9 0008 2e8a            jsr        strchr
[0003d59a] 2008                      move.l     a0,d0
[0003d59c] 6704                      beq.s      edit_key_68
[0003d59e] 7001                      moveq.l    #1,d0
[0003d5a0] 6002                      bra.s      edit_key_69
edit_key_68:
[0003d5a2] 4240                      clr.w      d0
edit_key_69:
[0003d5a4] 6020                      bra.s      edit_key_70
edit_key_67:
[0003d5a6] 2212                      move.l     (a2),d1
[0003d5a8] 206f 0008                 movea.l    8(a7),a0
[0003d5ac] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d5b0] 4880                      ext.w      d0
[0003d5b2] 206f 0010                 movea.l    16(a7),a0
[0003d5b6] 4eb9 0008 2e8a            jsr        strchr
[0003d5bc] 2008                      move.l     a0,d0
[0003d5be] 6604                      bne.s      edit_key_71
[0003d5c0] 7001                      moveq.l    #1,d0
[0003d5c2] 6002                      bra.s      edit_key_70
edit_key_71:
[0003d5c4] 4240                      clr.w      d0
edit_key_70:
[0003d5c6] 4a40                      tst.w      d0
[0003d5c8] 66ac                      bne.s      edit_key_72
edit_key_66:
[0003d5ca] 23d2 000d 469e            move.l     (a2),$000D469E
[0003d5d0] 6000 019a                 bra        edit_key_61
edit_key_64:
[0003d5d4] 7001                      moveq.l    #1,d0
[0003d5d6] d0af 0234                 add.l      564(a7),d0
[0003d5da] 23c0 000d 469e            move.l     d0,$000D469E
[0003d5e0] 6000 018a                 bra        edit_key_61
edit_key_62:
[0003d5e4] 43ef 023c                 lea.l      572(a7),a1
[0003d5e8] 303c 00e9                 move.w     #$00E9,d0
[0003d5ec] 204b                      movea.l    a3,a0
[0003d5ee] 4e95                      jsr        (a5)
[0003d5f0] 7001                      moveq.l    #1,d0
[0003d5f2] d0af 0238                 add.l      568(a7),d0
[0003d5f6] b0af 023c                 cmp.l      572(a7),d0
[0003d5fa] 6c00 05dc                 bge        edit_key_20
[0003d5fe] 23ef 0238 000d 4692       move.l     568(a7),subdel
[0003d606] 23c0 000d 469a            move.l     d0,$000D469A
[0003d60c] 23ef 0230 000d 4696       move.l     560(a7),$000D4696
edit_key_85:
[0003d614] 42b9 000d 469e            clr.l      $000D469E
[0003d61a] 6000 0150                 bra        edit_key_61
edit_key_8:
[0003d61e] 43ef 021c                 lea.l      540(a7),a1
[0003d622] 303c 00e3                 move.w     #$00E3,d0
[0003d626] 204b                      movea.l    a3,a0
[0003d628] 4e95                      jsr        (a5)
[0003d62a] 202f 021c                 move.l     540(a7),d0
[0003d62e] 6a00 fe80                 bpl        edit_key_73
[0003d632] 43ef 0238                 lea.l      568(a7),a1
[0003d636] 204b                      movea.l    a3,a0
[0003d638] 303c 00d8                 move.w     #$00D8,d0
[0003d63c] 4e95                      jsr        (a5)
[0003d63e] 43ef 0234                 lea.l      564(a7),a1
[0003d642] 303c 00e7                 move.w     #$00E7,d0
[0003d646] 204b                      movea.l    a3,a0
[0003d648] 4e95                      jsr        (a5)
[0003d64a] 43ef 0230                 lea.l      560(a7),a1
[0003d64e] 303c 00e8                 move.w     #$00E8,d0
[0003d652] 204b                      movea.l    a3,a0
[0003d654] 4e95                      jsr        (a5)
[0003d656] 202f 0234                 move.l     564(a7),d0
[0003d65a] 6f00 00dc                 ble        edit_key_74
[0003d65e] 222f 0238                 move.l     568(a7),d1
[0003d662] 23c1 000d 469a            move.l     d1,$000D469A
[0003d668] 23c1 000d 4692            move.l     d1,subdel
[0003d66e] 23c0 000d 469e            move.l     d0,$000D469E
[0003d674] 322f 024c                 move.w     588(a7),d1
[0003d678] c27c 0300                 and.w      #$0300,d1
[0003d67c] 670a                      beq.s      edit_key_75
[0003d67e] 42b9 000d 4696            clr.l      $000D4696
[0003d684] 6000 00e6                 bra        edit_key_61
edit_key_75:
[0003d688] 302f 024c                 move.w     588(a7),d0
[0003d68c] c07c 0400                 and.w      #$0400,d0
[0003d690] 6700 0098                 beq        edit_key_76
[0003d694] 43ef 0010                 lea.l      16(a7),a1
[0003d698] 204b                      movea.l    a3,a0
[0003d69a] 303c 0107                 move.w     #$0107,d0
[0003d69e] 4e95                      jsr        (a5)
[0003d6a0] 2eaf 0238                 move.l     568(a7),(a7)
[0003d6a4] 43d7                      lea.l      (a7),a1
[0003d6a6] 303c 00ca                 move.w     #$00CA,d0
[0003d6aa] 204b                      movea.l    a3,a0
[0003d6ac] 4e95                      jsr        (a5)
[0003d6ae] 70ff                      moveq.l    #-1,d0
[0003d6b0] d0af 0234                 add.l      564(a7),d0
[0003d6b4] 2480                      move.l     d0,(a2)
[0003d6b6] 206f 0008                 movea.l    8(a7),a0
[0003d6ba] 1030 0800                 move.b     0(a0,d0.l),d0
[0003d6be] 4880                      ext.w      d0
[0003d6c0] 206f 0010                 movea.l    16(a7),a0
[0003d6c4] 4eb9 0008 2e8a            jsr        strchr
[0003d6ca] 2f48 000c                 move.l     a0,12(a7)
[0003d6ce] 6002                      bra.s      edit_key_77
[0003d6d0] 5392                      subq.l     #1,(a2)
edit_key_84:
edit_key_77:
[0003d6d2] 2012                      move.l     (a2),d0
[0003d6d4] 6b4a                      bmi.s      edit_key_78
[0003d6d6] 222f 000c                 move.l     12(a7),d1
[0003d6da] 6720                      beq.s      edit_key_79
[0003d6dc] 206f 0008                 movea.l    8(a7),a0
[0003d6e0] 1030 0800                 move.b     0(a0,d0.l),d0
[0003d6e4] 4880                      ext.w      d0
[0003d6e6] 206f 0010                 movea.l    16(a7),a0
[0003d6ea] 4eb9 0008 2e8a            jsr        strchr
[0003d6f0] 2008                      move.l     a0,d0
[0003d6f2] 6704                      beq.s      edit_key_80
[0003d6f4] 7001                      moveq.l    #1,d0
[0003d6f6] 6002                      bra.s      edit_key_81
edit_key_80:
[0003d6f8] 4240                      clr.w      d0
edit_key_81:
[0003d6fa] 6020                      bra.s      edit_key_82
edit_key_79:
[0003d6fc] 2212                      move.l     (a2),d1
[0003d6fe] 206f 0008                 movea.l    8(a7),a0
[0003d702] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d706] 4880                      ext.w      d0
[0003d708] 206f 0010                 movea.l    16(a7),a0
[0003d70c] 4eb9 0008 2e8a            jsr        strchr
[0003d712] 2008                      move.l     a0,d0
[0003d714] 6604                      bne.s      edit_key_83
[0003d716] 7001                      moveq.l    #1,d0
[0003d718] 6002                      bra.s      edit_key_82
edit_key_83:
[0003d71a] 4240                      clr.w      d0
edit_key_82:
[0003d71c] 4a40                      tst.w      d0
[0003d71e] 66b0                      bne.s      edit_key_84
edit_key_78:
[0003d720] 5292                      addq.l     #1,(a2)
[0003d722] 23d2 000d 4696            move.l     (a2),$000D4696
[0003d728] 6042                      bra.s      edit_key_61
edit_key_76:
[0003d72a] 70ff                      moveq.l    #-1,d0
[0003d72c] d0af 0234                 add.l      564(a7),d0
[0003d730] 23c0 000d 4696            move.l     d0,$000D4696
[0003d736] 6034                      bra.s      edit_key_61
edit_key_74:
[0003d738] 202f 0238                 move.l     568(a7),d0
[0003d73c] 6f00 049a                 ble        edit_key_20
[0003d740] 93c9                      suba.l     a1,a1
[0003d742] 204b                      movea.l    a3,a0
[0003d744] 700b                      moveq.l    #11,d0
[0003d746] 4e95                      jsr        (a5)
[0003d748] 43ef 0230                 lea.l      560(a7),a1
[0003d74c] 303c 00e8                 move.w     #$00E8,d0
[0003d750] 204b                      movea.l    a3,a0
[0003d752] 4e95                      jsr        (a5)
[0003d754] 70ff                      moveq.l    #-1,d0
[0003d756] d0af 0238                 add.l      568(a7),d0
[0003d75a] 23c0 000d 4692            move.l     d0,subdel
[0003d760] 23ef 0238 000d 469a       move.l     568(a7),$000D469A
[0003d768] 6000 fea2                 bra        edit_key_85
edit_key_61:
[0003d76c] 43f9 000d 4692            lea.l      subdel,a1
[0003d772] 303c 00ea                 move.w     #$00EA,d0
[0003d776] 204b                      movea.l    a3,a0
[0003d778] 4e95                      jsr        (a5)
[0003d77a] 6000 045c                 bra        edit_key_20
edit_key_10:
[0003d77e] 43ef 021c                 lea.l      540(a7),a1
[0003d782] 303c 00e3                 move.w     #$00E3,d0
[0003d786] 204b                      movea.l    a3,a0
[0003d788] 4e95                      jsr        (a5)
[0003d78a] 202f 021c                 move.l     540(a7),d0
[0003d78e] 6b30                      bmi.s      edit_key_86
[0003d790] 23c0 000d 467a            move.l     d0,subcr
[0003d796] 23ef 0220 000d 467e       move.l     544(a7),$000D467E
[0003d79e] 23ef 0224 000d 4682       move.l     548(a7),$000D4682
[0003d7a6] 23ef 0228 000d 4686       move.l     552(a7),$000D4686
[0003d7ae] 43f9 000d 467a            lea.l      subcr,a1
[0003d7b4] 204b                      movea.l    a3,a0
[0003d7b6] 303c 00ea                 move.w     #$00EA,d0
[0003d7ba] 4e95                      jsr        (a5)
[0003d7bc] 6000 041a                 bra        edit_key_20
edit_key_86:
[0003d7c0] 43ef 0238                 lea.l      568(a7),a1
[0003d7c4] 303c 00d8                 move.w     #$00D8,d0
[0003d7c8] 204b                      movea.l    a3,a0
[0003d7ca] 4e95                      jsr        (a5)
[0003d7cc] 43ef 0234                 lea.l      564(a7),a1
[0003d7d0] 303c 00e7                 move.w     #$00E7,d0
[0003d7d4] 204b                      movea.l    a3,a0
[0003d7d6] 4e95                      jsr        (a5)
[0003d7d8] 202f 0238                 move.l     568(a7),d0
[0003d7dc] 23c0 000d 4682            move.l     d0,$000D4682
[0003d7e2] 23c0 000d 467a            move.l     d0,subcr
[0003d7e8] 222f 0234                 move.l     564(a7),d1
[0003d7ec] 23c1 000d 4686            move.l     d1,$000D4686
[0003d7f2] 23c1 000d 467e            move.l     d1,$000D467E
[0003d7f8] 43f9 000d 467a            lea.l      subcr,a1
[0003d7fe] 303c 00ea                 move.w     #$00EA,d0
[0003d802] 204b                      movea.l    a3,a0
[0003d804] 4e95                      jsr        (a5)
[0003d806] 2eaf 0238                 move.l     568(a7),(a7)
[0003d80a] 43d7                      lea.l      (a7),a1
[0003d80c] 303c 00ca                 move.w     #$00CA,d0
[0003d810] 204b                      movea.l    a3,a0
[0003d812] 4e95                      jsr        (a5)
[0003d814] 4292                      clr.l      (a2)
[0003d816] 6010                      bra.s      edit_key_87
[0003d818] 2012                      move.l     (a2),d0
edit_key_89:
[0003d81a] 206f 0008                 movea.l    8(a7),a0
[0003d81e] 0c30 0009 0800            cmpi.b     #$09,0(a0,d0.l)
[0003d824] 660a                      bne.s      edit_key_88
[0003d826] 5292                      addq.l     #1,(a2)
edit_key_87:
[0003d828] 2012                      move.l     (a2),d0
[0003d82a] b0af 0004                 cmp.l      4(a7),d0
[0003d82e] 6de8                      blt.s      edit_key_89
edit_key_88:
[0003d830] 2012                      move.l     (a2),d0
[0003d832] 6f00 03a4                 ble        edit_key_20
[0003d836] b0af 0004                 cmp.l      4(a7),d0
[0003d83a] 6e00 039c                 bgt        edit_key_20
[0003d83e] 2079 000d 4676            movea.l    $000D4676,a0
[0003d844] 2250                      movea.l    (a0),a1
[0003d846] 12bc 0009                 move.b     #$09,(a1)
[0003d84a] 7001                      moveq.l    #1,d0
[0003d84c] d0af 0238                 add.l      568(a7),d0
[0003d850] 23c0 000d 466a            move.l     d0,$000D466A
[0003d856] 23c0 000d 4662            move.l     d0,subins
[0003d85c] 7a00                      moveq.l    #0,d5
[0003d85e] 601e                      bra.s      edit_key_90
[0003d860] 23c5 000d 466e            move.l     d5,$000D466E
edit_key_91:
[0003d866] 23c5 000d 4666            move.l     d5,$000D4666
[0003d86c] 43f9 000d 4662            lea.l      subins,a1
[0003d872] 303c 00ea                 move.w     #$00EA,d0
[0003d876] 204b                      movea.l    a3,a0
[0003d878] 4e95                      jsr        (a5)
[0003d87a] 5285                      addq.l     #1,d5
[0003d87c] 5392                      subq.l     #1,(a2)
edit_key_90:
[0003d87e] 2012                      move.l     (a2),d0
[0003d880] 6ede                      bgt.s      edit_key_91
[0003d882] 6000 0354                 bra        edit_key_20
edit_key_9:
[0003d886] 43ef 021c                 lea.l      540(a7),a1
[0003d88a] 303c 00e3                 move.w     #$00E3,d0
[0003d88e] 204b                      movea.l    a3,a0
[0003d890] 4e95                      jsr        (a5)
[0003d892] 2079 000d 4676            movea.l    $000D4676,a0
[0003d898] 2250                      movea.l    (a0),a1
[0003d89a] 12af 024d                 move.b     589(a7),(a1)
[0003d89e] 202f 021c                 move.l     540(a7),d0
[0003d8a2] 6b20                      bmi.s      edit_key_92
[0003d8a4] 23c0 000d 4662            move.l     d0,subins
[0003d8aa] 23ef 0220 000d 4666       move.l     544(a7),$000D4666
[0003d8b2] 23ef 0224 000d 466a       move.l     548(a7),$000D466A
[0003d8ba] 23ef 0228 000d 466e       move.l     552(a7),$000D466E
[0003d8c2] 6038                      bra.s      edit_key_93
edit_key_92:
[0003d8c4] 43ef 0238                 lea.l      568(a7),a1
[0003d8c8] 303c 00d8                 move.w     #$00D8,d0
[0003d8cc] 204b                      movea.l    a3,a0
[0003d8ce] 4e95                      jsr        (a5)
[0003d8d0] 43ef 0234                 lea.l      564(a7),a1
[0003d8d4] 303c 00e7                 move.w     #$00E7,d0
[0003d8d8] 204b                      movea.l    a3,a0
[0003d8da] 4e95                      jsr        (a5)
[0003d8dc] 202f 0238                 move.l     568(a7),d0
[0003d8e0] 23c0 000d 466a            move.l     d0,$000D466A
[0003d8e6] 23c0 000d 4662            move.l     d0,subins
[0003d8ec] 222f 0234                 move.l     564(a7),d1
[0003d8f0] 23c1 000d 466e            move.l     d1,$000D466E
[0003d8f6] 23c1 000d 4666            move.l     d1,$000D4666
edit_key_93:
[0003d8fc] 43f9 000d 4662            lea.l      subins,a1
[0003d902] 303c 00ea                 move.w     #$00EA,d0
[0003d906] 204b                      movea.l    a3,a0
[0003d908] 4e95                      jsr        (a5)
[0003d90a] 6000 02cc                 bra        edit_key_20
edit_key_19:
[0003d90e] 302f 024c                 move.w     588(a7),d0
[0003d912] c07c 0400                 and.w      #$0400,d0
[0003d916] 670c                      beq.s      edit_key_18
[0003d918] 204b                      movea.l    a3,a0
[0003d91a] 4eb9 0003 de9c            jsr        cutline
[0003d920] 6000 02b6                 bra        edit_key_20
edit_key_18:
[0003d924] 302f 024c                 move.w     588(a7),d0
[0003d928] c07c 0400                 and.w      #$0400,d0
[0003d92c] 670c                      beq.s      edit_key_16
[0003d92e] 204b                      movea.l    a3,a0
[0003d930] 4eb9 0003 de3c            jsr        cut
[0003d936] 6000 02a0                 bra        edit_key_20
edit_key_16:
[0003d93a] 302f 024c                 move.w     588(a7),d0
[0003d93e] c07c 0400                 and.w      #$0400,d0
[0003d942] 670c                      beq.s      edit_key_17
[0003d944] 204b                      movea.l    a3,a0
[0003d946] 4eb9 0003 dcd8            jsr        copy
[0003d94c] 6000 028a                 bra        edit_key_20
edit_key_17:
[0003d950] 302f 024c                 move.w     588(a7),d0
[0003d954] c07c 0400                 and.w      #$0400,d0
[0003d958] 670c                      beq.s      edit_key_14
[0003d95a] 204b                      movea.l    a3,a0
[0003d95c] 4eb9 0003 dda8            jsr        paste
[0003d962] 6000 0274                 bra        edit_key_20
edit_key_14:
[0003d966] 1c2f 024d                 move.b     589(a7),d6
[0003d96a] 4886                      ext.w      d6
[0003d96c] dc7c fff0                 add.w      #$FFF0,d6
[0003d970] 302f 024c                 move.w     588(a7),d0
[0003d974] c07c 0400                 and.w      #$0400,d0
[0003d978] 6704                      beq.s      edit_key_94
[0003d97a] dc7c 0014                 add.w      #$0014,d6
edit_key_94:
[0003d97e] 302f 024c                 move.w     588(a7),d0
[0003d982] c07c 0300                 and.w      #$0300,d0
[0003d986] 6704                      beq.s      edit_key_95
[0003d988] dc7c 000a                 add.w      #$000A,d6
edit_key_95:
[0003d98c] 3006                      move.w     d6,d0
[0003d98e] 48c0                      ext.l      d0
[0003d990] e588                      lsl.l      #2,d0
[0003d992] 206f 0240                 movea.l    576(a7),a0
[0003d996] d1c0                      adda.l     d0,a0
[0003d998] 2228 00d2                 move.l     210(a0),d1
[0003d99c] 673c                      beq.s      edit_key_3
[0003d99e] 93c9                      suba.l     a1,a1
[0003d9a0] 204b                      movea.l    a3,a0
[0003d9a2] 303c 00e2                 move.w     #$00E2,d0
[0003d9a6] 4eb9 0003 a772            jsr        Auo_editor
[0003d9ac] 3006                      move.w     d6,d0
[0003d9ae] 48c0                      ext.l      d0
[0003d9b0] e588                      lsl.l      #2,d0
[0003d9b2] 206f 0240                 movea.l    576(a7),a0
[0003d9b6] d1c0                      adda.l     d0,a0
[0003d9b8] 2268 00d2                 movea.l    210(a0),a1
[0003d9bc] 5449                      addq.w     #2,a1
[0003d9be] 206f 024e                 movea.l    590(a7),a0
[0003d9c2] 4eb9 0003 e894            jsr        put_string
[0003d9c8] 93c9                      suba.l     a1,a1
[0003d9ca] 303c 00db                 move.w     #$00DB,d0
[0003d9ce] 204b                      movea.l    a3,a0
[0003d9d0] 4eb9 0003 a772            jsr        Auo_editor
[0003d9d6] 6000 0200                 bra        edit_key_20
edit_key_3:
[0003d9da] 76fe                      moveq.l    #-2,d3
[0003d9dc] 6000 01fa                 bra        edit_key_20
edit_key_2:
[0003d9e0] 0c2f 0020 024d            cmpi.b     #$20,589(a7)
[0003d9e6] 6500 01f0                 bcs        edit_key_20
[0003d9ea] 43ef 021c                 lea.l      540(a7),a1
[0003d9ee] 303c 00e3                 move.w     #$00E3,d0
[0003d9f2] 204b                      movea.l    a3,a0
[0003d9f4] 4e95                      jsr        (a5)
[0003d9f6] 3c2f 024c                 move.w     588(a7),d6
[0003d9fa] cc7c 00ff                 and.w      #$00FF,d6
[0003d9fe] 3006                      move.w     d6,d0
[0003da00] 2079 000d 4676            movea.l    $000D4676,a0
[0003da06] 2250                      movea.l    (a0),a1
[0003da08] 1280                      move.b     d0,(a1)
[0003da0a] 222f 021c                 move.l     540(a7),d1
[0003da0e] 6b20                      bmi.s      edit_key_96
[0003da10] 23c1 000d 4662            move.l     d1,subins
[0003da16] 23ef 0220 000d 4666       move.l     544(a7),$000D4666
[0003da1e] 23ef 0224 000d 466a       move.l     548(a7),$000D466A
[0003da26] 23ef 0228 000d 466e       move.l     552(a7),$000D466E
[0003da2e] 6038                      bra.s      edit_key_97
edit_key_96:
[0003da30] 43ef 0238                 lea.l      568(a7),a1
[0003da34] 303c 00d8                 move.w     #$00D8,d0
[0003da38] 204b                      movea.l    a3,a0
[0003da3a] 4e95                      jsr        (a5)
[0003da3c] 43ef 0234                 lea.l      564(a7),a1
[0003da40] 303c 00e7                 move.w     #$00E7,d0
[0003da44] 204b                      movea.l    a3,a0
[0003da46] 4e95                      jsr        (a5)
[0003da48] 202f 0238                 move.l     568(a7),d0
[0003da4c] 23c0 000d 466a            move.l     d0,$000D466A
[0003da52] 23c0 000d 4662            move.l     d0,subins
[0003da58] 222f 0234                 move.l     564(a7),d1
[0003da5c] 23c1 000d 466e            move.l     d1,$000D466E
[0003da62] 23c1 000d 4666            move.l     d1,$000D4666
edit_key_97:
[0003da68] 43f9 000d 4662            lea.l      subins,a1
[0003da6e] 303c 00ea                 move.w     #$00EA,d0
[0003da72] 204b                      movea.l    a3,a0
[0003da74] 4e95                      jsr        (a5)
[0003da76] bc7c 005d                 cmp.w      #$005D,d6
[0003da7a] 670e                      beq.s      edit_key_98
[0003da7c] bc7c 007d                 cmp.w      #$007D,d6
[0003da80] 6708                      beq.s      edit_key_98
[0003da82] bc7c 0029                 cmp.w      #$0029,d6
[0003da86] 6600 0150                 bne        edit_key_20
edit_key_98:
[0003da8a] 7e01                      moveq.l    #1,d7
[0003da8c] 4244                      clr.w      d4
[0003da8e] 7aff                      moveq.l    #-1,d5
[0003da90] daaf 0234                 add.l      564(a7),d5
[0003da94] 2eaf 0238                 move.l     568(a7),(a7)
[0003da98] 6000 00bc                 bra        edit_key_99
[0003da9c] 43d7                      lea.l      (a7),a1
edit_key_119:
[0003da9e] 303c 00ca                 move.w     #$00CA,d0
[0003daa2] 204b                      movea.l    a3,a0
[0003daa4] 4e95                      jsr        (a5)
[0003daa6] 202f 0004                 move.l     4(a7),d0
[0003daaa] 206f 0008                 movea.l    8(a7),a0
[0003daae] 4230 0800                 clr.b      0(a0,d0.l)
[0003dab2] baaf 0004                 cmp.l      4(a7),d5
[0003dab6] 6c04                      bge.s      edit_key_100
[0003dab8] 2005                      move.l     d5,d0
[0003daba] 6004                      bra.s      edit_key_101
edit_key_100:
[0003dabc] 202f 0004                 move.l     4(a7),d0
edit_key_101:
[0003dac0] 2480                      move.l     d0,(a2)
[0003dac2] 6000 007c                 bra.w      edit_key_102
[0003dac6] 2012                      move.l     (a2),d0
edit_key_116:
[0003dac8] 206f 0008                 movea.l    8(a7),a0
[0003dacc] 1230 0800                 move.b     0(a0,d0.l),d1
[0003dad0] 4881                      ext.w      d1
[0003dad2] b27c 005d                 cmp.w      #$005D,d1
[0003dad6] 672e                      beq.s      edit_key_103
[0003dad8] 6e12                      bgt.s      edit_key_104
[0003dada] 927c 0028                 sub.w      #$0028,d1
[0003dade] 6744                      beq.s      edit_key_105
[0003dae0] 5341                      subq.w     #1,d1
[0003dae2] 6748                      beq.s      edit_key_106
[0003dae4] 927c 0032                 sub.w      #$0032,d1
[0003dae8] 670e                      beq.s      edit_key_107
[0003daea] 604a                      bra.s      edit_key_108
edit_key_104:
[0003daec] 927c 007b                 sub.w      #$007B,d1
[0003daf0] 6722                      beq.s      edit_key_109
[0003daf2] 5541                      subq.w     #2,d1
[0003daf4] 6726                      beq.s      edit_key_110
[0003daf6] 603e                      bra.s      edit_key_108
edit_key_107:
[0003daf8] bc7c 005d                 cmp.w      #$005D,d6
[0003dafc] 6638                      bne.s      edit_key_108
[0003dafe] 4a44                      tst.w      d4
edit_key_111:
[0003db00] 6634                      bne.s      edit_key_108
[0003db02] 5347                      subq.w     #1,d7
[0003db04] 6030                      bra.s      edit_key_108
edit_key_103:
[0003db06] bc7c 005d                 cmp.w      #$005D,d6
[0003db0a] 662a                      bne.s      edit_key_108
[0003db0c] 4a44                      tst.w      d4
edit_key_112:
[0003db0e] 6626                      bne.s      edit_key_108
[0003db10] 5247                      addq.w     #1,d7
edit_key_113:
[0003db12] 6022                      bra.s      edit_key_108
edit_key_109:
[0003db14] bc7c 007d                 cmp.w      #$007D,d6
[0003db18] 661c                      bne.s      edit_key_108
[0003db1a] 60e2                      bra.s      edit_key_111
edit_key_110:
[0003db1c] bc7c 007d                 cmp.w      #$007D,d6
[0003db20] 6614                      bne.s      edit_key_108
[0003db22] 60e8                      bra.s      edit_key_112
edit_key_105:
[0003db24] bc7c 0029                 cmp.w      #$0029,d6
[0003db28] 660c                      bne.s      edit_key_108
[0003db2a] 60d2                      bra.s      edit_key_111
edit_key_106:
[0003db2c] bc7c 0029                 cmp.w      #$0029,d6
[0003db30] 6604                      bne.s      edit_key_108
[0003db32] 4a44                      tst.w      d4
[0003db34] 67da                      beq.s      edit_key_113
edit_key_108:
[0003db36] 4a47                      tst.w      d7
[0003db38] 6604                      bne.s      edit_key_114
[0003db3a] 4a44                      tst.w      d4
[0003db3c] 6708                      beq.s      edit_key_115
edit_key_114:
[0003db3e] 5392                      subq.l     #1,(a2)
edit_key_102:
[0003db40] 2012                      move.l     (a2),d0
[0003db42] 6a00 ff82                 bpl.w      edit_key_116
edit_key_115:
[0003db46] 2a3c 0000 03e8            move.l     #$000003E8,d5
[0003db4c] 4a47                      tst.w      d7
[0003db4e] 6604                      bne.s      edit_key_117
[0003db50] 4a44                      tst.w      d4
[0003db52] 6708                      beq.s      edit_key_118
edit_key_117:
[0003db54] 5397                      subq.l     #1,(a7)
edit_key_99:
[0003db56] 2017                      move.l     (a7),d0
[0003db58] 6a00 ff42                 bpl        edit_key_119
edit_key_118:
[0003db5c] 4a47                      tst.w      d7
[0003db5e] 6668                      bne.s      edit_key_120
[0003db60] 4a44                      tst.w      d4
[0003db62] 6664                      bne.s      edit_key_120
[0003db64] 202f 0238                 move.l     568(a7),d0
[0003db68] b097                      cmp.l      (a7),d0
[0003db6a] 6612                      bne.s      edit_key_121
[0003db6c] 222f 0234                 move.l     564(a7),d1
[0003db70] 206f 0008                 movea.l    8(a7),a0
[0003db74] 1f70 1801 0214            move.b     1(a0,d1.l),532(a7)
[0003db7a] 4230 1801                 clr.b      1(a0,d1.l)
edit_key_121:
[0003db7e] 701e                      moveq.l    #30,d0
[0003db80] 2f00                      move.l     d0,-(a7)
[0003db82] 2212                      move.l     (a2),d1
[0003db84] 6a04                      bpl.s      edit_key_122
[0003db86] 7400                      moveq.l    #0,d2
[0003db88] 6002                      bra.s      edit_key_123
edit_key_122:
[0003db8a] 2412                      move.l     (a2),d2
edit_key_123:
[0003db8c] 226f 000c                 movea.l    12(a7),a1
[0003db90] d3c2                      adda.l     d2,a1
[0003db92] 41ef 0018                 lea.l      24(a7),a0
[0003db96] 201f                      move.l     (a7)+,d0
[0003db98] 4eb9 0008 2fd6            jsr        strncpy
[0003db9e] 422f 0032                 clr.b      50(a7)
[0003dba2] 202f 0238                 move.l     568(a7),d0
[0003dba6] b097                      cmp.l      (a7),d0
[0003dba8] 660e                      bne.s      edit_key_124
[0003dbaa] 222f 0234                 move.l     564(a7),d1
[0003dbae] 206f 0008                 movea.l    8(a7),a0
[0003dbb2] 11af 0214 1801            move.b     532(a7),1(a0,d1.l)
edit_key_124:
[0003dbb8] 43ef 0014                 lea.l      20(a7),a1
[0003dbbc] 206f 024e                 movea.l    590(a7),a0
[0003dbc0] 4eb9 0004 0696            jsr        info_string
[0003dbc6] 6010                      bra.s      edit_key_20
edit_key_120:
[0003dbc8] 43f9 000d 49e5            lea.l      $000D49E5,a1
[0003dbce] 206f 024e                 movea.l    590(a7),a0
[0003dbd2] 4eb9 0004 0696            jsr        info_string
edit_key_20:
[0003dbd8] b67c ffff                 cmp.w      #$FFFF,d3
[0003dbdc] 6d18                      blt.s      edit_key_125
[0003dbde] 536f 0216                 subq.w     #1,534(a7)
[0003dbe2] 6712                      beq.s      edit_key_125
[0003dbe4] 41ef 024c                 lea.l      588(a7),a0
[0003dbe8] 4eb9 0003 dc38            jsr        next_key
edit_key_1:
[0003dbee] 102f 024d                 move.b     589(a7),d0
[0003dbf2] 6600 f264                 bne        edit_key_126
edit_key_125:
[0003dbf6] 43ef 021c                 lea.l      540(a7),a1
[0003dbfa] 303c 00e3                 move.w     #$00E3,d0
[0003dbfe] 204b                      movea.l    a3,a0
[0003dc00] 4e95                      jsr        (a5)
[0003dc02] 202f 021c                 move.l     540(a7),d0
[0003dc06] 6a0a                      bpl.s      edit_key_127
[0003dc08] 93c9                      suba.l     a1,a1
[0003dc0a] 204b                      movea.l    a3,a0
[0003dc0c] 303c 00db                 move.w     #$00DB,d0
[0003dc10] 4e95                      jsr        (a5)
edit_key_127:
[0003dc12] 93c9                      suba.l     a1,a1
[0003dc14] 7005                      moveq.l    #5,d0
[0003dc16] 204b                      movea.l    a3,a0
[0003dc18] 4e95                      jsr        (a5)
[0003dc1a] 93c9                      suba.l     a1,a1
[0003dc1c] 303c 00d6                 move.w     #$00D6,d0
[0003dc20] 204b                      movea.l    a3,a0
[0003dc22] 4e95                      jsr        (a5)
[0003dc24] 206f 024e                 movea.l    590(a7),a0
[0003dc28] 6100 f192                 bsr        dirty
[0003dc2c] 3003                      move.w     d3,d0
[0003dc2e] 4fef 0252                 lea.l      594(a7),a7
[0003dc32] 4cdf 3cf8                 movem.l    (a7)+,d3-d7/a2-a5
[0003dc36] 4e75                      rts

next_key:
[0003dc38] 2f0a                      move.l     a2,-(a7)
[0003dc3a] 2f0b                      move.l     a3,-(a7)
[0003dc3c] 594f                      subq.w     #4,a7
[0003dc3e] 2648                      movea.l    a0,a3
[0003dc40] 45ef 0002                 lea.l      2(a7),a2
[0003dc44] 2f39 000e 692a            move.l     _globl,-(a7)
[0003dc4a] 4852                      pea.l      (a2)
[0003dc4c] 2f0b                      move.l     a3,-(a7)
[0003dc4e] 486f 000c                 pea.l      12(a7)
[0003dc52] 4852                      pea.l      (a2)
[0003dc54] 4852                      pea.l      (a2)
[0003dc56] 7005                      moveq.l    #5,d0
[0003dc58] 2f00                      move.l     d0,-(a7)
[0003dc5a] 4267                      clr.w      -(a7)
[0003dc5c] 4267                      clr.w      -(a7)
[0003dc5e] 4267                      clr.w      -(a7)
[0003dc60] 4267                      clr.w      -(a7)
[0003dc62] 4267                      clr.w      -(a7)
[0003dc64] 4267                      clr.w      -(a7)
[0003dc66] 4267                      clr.w      -(a7)
[0003dc68] 4267                      clr.w      -(a7)
[0003dc6a] 4267                      clr.w      -(a7)
[0003dc6c] 4267                      clr.w      -(a7)
[0003dc6e] 4267                      clr.w      -(a7)
[0003dc70] 224a                      movea.l    a2,a1
[0003dc72] 91c8                      suba.l     a0,a0
[0003dc74] 4242                      clr.w      d2
[0003dc76] 4241                      clr.w      d1
[0003dc78] 7021                      moveq.l    #33,d0
[0003dc7a] 4eb9 0007 9240            jsr        mt_evnt_multi
[0003dc80] 4fef 0032                 lea.l      50(a7),a7
[0003dc84] c07c 0001                 and.w      #$0001,d0
[0003dc88] 670e                      beq.s      next_key_1
[0003dc8a] 3217                      move.w     (a7),d1
[0003dc8c] 3013                      move.w     (a3),d0
[0003dc8e] 4eb9 0004 4284            jsr        nkc_gemks2n
[0003dc94] 3680                      move.w     d0,(a3)
[0003dc96] 6002                      bra.s      next_key_2
next_key_1:
[0003dc98] 4253                      clr.w      (a3)
next_key_2:
[0003dc9a] 584f                      addq.w     #4,a7
[0003dc9c] 265f                      movea.l    (a7)+,a3
[0003dc9e] 245f                      movea.l    (a7)+,a2
[0003dca0] 4e75                      rts

paste_free:
[0003dca2] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0003dca6] 45f9 000d 46ae            lea.l      Apaste_text,a2
[0003dcac] 262a fffc                 move.l     -4(a2),d3
[0003dcb0] 2652                      movea.l    (a2),a3
[0003dcb2] 6008                      bra.s      paste_free_1
[0003dcb4] 205b                      movea.l    (a3)+,a0
paste_free_2:
[0003dcb6] 4eb9 0004 c6c8            jsr        Ax_ifree
paste_free_1:
[0003dcbc] 2003                      move.l     d3,d0
[0003dcbe] 5383                      subq.l     #1,d3
[0003dcc0] 4a80                      tst.l      d0
[0003dcc2] 66f0                      bne.s      paste_free_2
[0003dcc4] 2052                      movea.l    (a2),a0
[0003dcc6] 4eb9 0004 c6c8            jsr        Ax_ifree
[0003dccc] 4292                      clr.l      (a2)
[0003dcce] 42aa fffc                 clr.l      -4(a2)
[0003dcd2] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0003dcd6] 4e75                      rts

copy:
[0003dcd8] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003dcdc] 4fef ffe0                 lea.l      -32(a7),a7
[0003dce0] 2f48 001c                 move.l     a0,28(a7)
[0003dce4] 2068 000c                 movea.l    12(a0),a0
[0003dce8] 2668 0008                 movea.l    8(a0),a3
[0003dcec] 43d7                      lea.l      (a7),a1
[0003dcee] 303c 00e3                 move.w     #$00E3,d0
[0003dcf2] 206f 001c                 movea.l    28(a7),a0
[0003dcf6] 4e93                      jsr        (a3)
[0003dcf8] 2017                      move.l     (a7),d0
[0003dcfa] 6b00 00a0                 bmi        copy_1
[0003dcfe] 6100 ffa2                 bsr.w      paste_free
[0003dd02] 262f 0008                 move.l     8(a7),d3
[0003dd06] 9697                      sub.l      (a7),d3
[0003dd08] 5283                      addq.l     #1,d3
[0003dd0a] 2003                      move.l     d3,d0
[0003dd0c] e588                      lsl.l      #2,d0
[0003dd0e] 4eb9 0004 c608            jsr        Ax_malloc
[0003dd14] 2848                      movea.l    a0,a4
[0003dd16] 200c                      move.l     a4,d0
[0003dd18] 6700 0082                 beq        copy_1
[0003dd1c] 23c3 000d 46aa            move.l     d3,Apaste_rows
[0003dd22] 23c0 000d 46ae            move.l     d0,Apaste_text
[0003dd28] 2203                      move.l     d3,d1
[0003dd2a] e589                      lsl.l      #2,d1
[0003dd2c] 4240                      clr.w      d0
[0003dd2e] 4eb9 0008 36ea            jsr        memset
[0003dd34] 2617                      move.l     (a7),d3
[0003dd36] 45ef 0010                 lea.l      16(a7),a2
[0003dd3a] 6052                      bra.s      copy_2
[0003dd3c] 2483                      move.l     d3,(a2)
copy_6:
[0003dd3e] 224a                      movea.l    a2,a1
[0003dd40] 303c 00ca                 move.w     #$00CA,d0
[0003dd44] 206f 001c                 movea.l    28(a7),a0
[0003dd48] 4e93                      jsr        (a3)
[0003dd4a] 202a 0004                 move.l     4(a2),d0
[0003dd4e] 6f2c                      ble.s      copy_3
[0003dd50] 7001                      moveq.l    #1,d0
[0003dd52] d0aa 0004                 add.l      4(a2),d0
[0003dd56] 4eb9 0004 c608            jsr        Ax_malloc
[0003dd5c] 2888                      move.l     a0,(a4)
[0003dd5e] 2008                      move.l     a0,d0
[0003dd60] 6736                      beq.s      copy_4
[0003dd62] 226a 0008                 movea.l    8(a2),a1
[0003dd66] 202a 0004                 move.l     4(a2),d0
[0003dd6a] 4eb9 0008 2fd6            jsr        strncpy
[0003dd70] 202a 0004                 move.l     4(a2),d0
[0003dd74] 2054                      movea.l    (a4),a0
[0003dd76] 4230 0800                 clr.b      0(a0,d0.l)
[0003dd7a] 600e                      bra.s      copy_5
copy_3:
[0003dd7c] 41f9 000d 49e2            lea.l      $000D49E2,a0
[0003dd82] 4eb9 0004 643c            jsr        Ast_create
[0003dd88] 2888                      move.l     a0,(a4)
copy_5:
[0003dd8a] 584c                      addq.w     #4,a4
[0003dd8c] 5283                      addq.l     #1,d3
copy_2:
[0003dd8e] b6af 0008                 cmp.l      8(a7),d3
[0003dd92] 6fa8                      ble.s      copy_6
[0003dd94] 4240                      clr.w      d0
[0003dd96] 6006                      bra.s      copy_7
copy_4:
[0003dd98] 6100 ff08                 bsr        paste_free
copy_1:
[0003dd9c] 70ff                      moveq.l    #-1,d0
copy_7:
[0003dd9e] 4fef 0020                 lea.l      32(a7),a7
[0003dda2] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003dda6] 4e75                      rts

paste:
[0003dda8] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003ddac] 4fef ffd0                 lea.l      -48(a7),a7
[0003ddb0] 2448                      movea.l    a0,a2
[0003ddb2] 206a 000c                 movea.l    12(a2),a0
[0003ddb6] 2668 0008                 movea.l    8(a0),a3
[0003ddba] 2039 000d 46aa            move.l     Apaste_rows,d0
[0003ddc0] 6f70                      ble.s      paste_1
[0003ddc2] 49ef 0018                 lea.l      24(a7),a4
[0003ddc6] 2979 000d 46aa 0010       move.l     Apaste_rows,16(a4)
[0003ddce] 2979 000d 46ae 0014       move.l     Apaste_text,20(a4)
[0003ddd6] 43d7                      lea.l      (a7),a1
[0003ddd8] 303c 00e3                 move.w     #$00E3,d0
[0003dddc] 204a                      movea.l    a2,a0
[0003ddde] 4e93                      jsr        (a3)
[0003dde0] 2017                      move.l     (a7),d0
[0003dde2] 6b16                      bmi.s      paste_2
[0003dde4] 2880                      move.l     d0,(a4)
[0003dde6] 296f 0004 0004            move.l     4(a7),4(a4)
[0003ddec] 296f 0008 0008            move.l     8(a7),8(a4)
[0003ddf2] 296f 000c 000c            move.l     12(a7),12(a4)
[0003ddf8] 602e                      bra.s      paste_3
paste_2:
[0003ddfa] 43ef 0014                 lea.l      20(a7),a1
[0003ddfe] 303c 00d8                 move.w     #$00D8,d0
[0003de02] 204a                      movea.l    a2,a0
[0003de04] 4e93                      jsr        (a3)
[0003de06] 43ef 0010                 lea.l      16(a7),a1
[0003de0a] 303c 00e7                 move.w     #$00E7,d0
[0003de0e] 204a                      movea.l    a2,a0
[0003de10] 4e93                      jsr        (a3)
[0003de12] 202f 0014                 move.l     20(a7),d0
[0003de16] 2940 0008                 move.l     d0,8(a4)
[0003de1a] 2880                      move.l     d0,(a4)
[0003de1c] 222f 0010                 move.l     16(a7),d1
[0003de20] 2941 000c                 move.l     d1,12(a4)
[0003de24] 2941 0004                 move.l     d1,4(a4)
paste_3:
[0003de28] 224c                      movea.l    a4,a1
[0003de2a] 303c 00ea                 move.w     #$00EA,d0
[0003de2e] 204a                      movea.l    a2,a0
[0003de30] 4e93                      jsr        (a3)
paste_1:
[0003de32] 4fef 0030                 lea.l      48(a7),a7
[0003de36] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003de3a] 4e75                      rts

cut:
[0003de3c] 2f0a                      move.l     a2,-(a7)
[0003de3e] 2f0b                      move.l     a3,-(a7)
[0003de40] 4fef fff0                 lea.l      -16(a7),a7
[0003de44] 2448                      movea.l    a0,a2
[0003de46] 206a 000c                 movea.l    12(a2),a0
[0003de4a] 2668 0008                 movea.l    8(a0),a3
[0003de4e] 43d7                      lea.l      (a7),a1
[0003de50] 303c 00e3                 move.w     #$00E3,d0
[0003de54] 204a                      movea.l    a2,a0
[0003de56] 4e93                      jsr        (a3)
[0003de58] 2017                      move.l     (a7),d0
[0003de5a] 6b36                      bmi.s      cut_1
[0003de5c] 204a                      movea.l    a2,a0
[0003de5e] 6100 fe78                 bsr        copy
[0003de62] 4a40                      tst.w      d0
[0003de64] 662c                      bne.s      cut_1
[0003de66] 23d7 000d 4692            move.l     (a7),subdel
[0003de6c] 23ef 0004 000d 4696       move.l     4(a7),$000D4696
[0003de74] 23ef 0008 000d 469a       move.l     8(a7),$000D469A
[0003de7c] 23ef 000c 000d 469e       move.l     12(a7),$000D469E
[0003de84] 43f9 000d 4692            lea.l      subdel,a1
[0003de8a] 303c 00ea                 move.w     #$00EA,d0
[0003de8e] 204a                      movea.l    a2,a0
[0003de90] 4e93                      jsr        (a3)
cut_1:
[0003de92] 4fef 0010                 lea.l      16(a7),a7
[0003de96] 265f                      movea.l    (a7)+,a3
[0003de98] 245f                      movea.l    (a7)+,a2
[0003de9a] 4e75                      rts

cutline:
[0003de9c] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003dea0] 4fef ffec                 lea.l      -20(a7),a7
[0003dea4] 2448                      movea.l    a0,a2
[0003dea6] 206a 000c                 movea.l    12(a2),a0
[0003deaa] 2668 0008                 movea.l    8(a0),a3
[0003deae] 93c9                      suba.l     a1,a1
[0003deb0] 303c 00e2                 move.w     #$00E2,d0
[0003deb4] 204a                      movea.l    a2,a0
[0003deb6] 4e93                      jsr        (a3)
[0003deb8] 43ef 000c                 lea.l      12(a7),a1
[0003debc] 303c 00d8                 move.w     #$00D8,d0
[0003dec0] 204a                      movea.l    a2,a0
[0003dec2] 4e93                      jsr        (a3)
[0003dec4] 43ef 0010                 lea.l      16(a7),a1
[0003dec8] 303c 00e9                 move.w     #$00E9,d0
[0003decc] 204a                      movea.l    a2,a0
[0003dece] 4e93                      jsr        (a3)
[0003ded0] 6100 fdd0                 bsr        paste_free
[0003ded4] 7001                      moveq.l    #1,d0
[0003ded6] d0af 000c                 add.l      12(a7),d0
[0003deda] b0af 0010                 cmp.l      16(a7),d0
[0003dede] 6c04                      bge.s      cutline_1
[0003dee0] 7602                      moveq.l    #2,d3
[0003dee2] 6002                      bra.s      cutline_2
cutline_1:
[0003dee4] 7601                      moveq.l    #1,d3
cutline_2:
[0003dee6] 2003                      move.l     d3,d0
[0003dee8] e588                      lsl.l      #2,d0
[0003deea] 4eb9 0004 c608            jsr        Ax_malloc
[0003def0] 2848                      movea.l    a0,a4
[0003def2] 200c                      move.l     a4,d0
[0003def4] 6700 00c0                 beq        cutline_3
[0003def8] 23c3 000d 46aa            move.l     d3,Apaste_rows
[0003defe] 23c0 000d 46ae            move.l     d0,Apaste_text
[0003df04] 2203                      move.l     d3,d1
[0003df06] e589                      lsl.l      #2,d1
[0003df08] 4240                      clr.w      d0
[0003df0a] 4eb9 0008 36ea            jsr        memset
[0003df10] 2eaf 000c                 move.l     12(a7),(a7)
[0003df14] 43d7                      lea.l      (a7),a1
[0003df16] 303c 00ca                 move.w     #$00CA,d0
[0003df1a] 204a                      movea.l    a2,a0
[0003df1c] 4e93                      jsr        (a3)
[0003df1e] 202f 0004                 move.l     4(a7),d0
[0003df22] 6f28                      ble.s      cutline_4
[0003df24] 7001                      moveq.l    #1,d0
[0003df26] d0af 0004                 add.l      4(a7),d0
[0003df2a] 4eb9 0004 c608            jsr        Ax_malloc
[0003df30] 2888                      move.l     a0,(a4)
[0003df32] 202f 0004                 move.l     4(a7),d0
[0003df36] 226f 0008                 movea.l    8(a7),a1
[0003df3a] 4eb9 0008 2fd6            jsr        strncpy
[0003df40] 202f 0004                 move.l     4(a7),d0
[0003df44] 2054                      movea.l    (a4),a0
[0003df46] 4230 0800                 clr.b      0(a0,d0.l)
[0003df4a] 600e                      bra.s      cutline_5
cutline_4:
[0003df4c] 41f9 000d 49e2            lea.l      $000D49E2,a0
[0003df52] 4eb9 0004 643c            jsr        Ast_create
[0003df58] 2888                      move.l     a0,(a4)
cutline_5:
[0003df5a] 23ef 000c 000d 4692       move.l     12(a7),subdel
[0003df62] 42b9 000d 4696            clr.l      $000D4696
[0003df68] 7001                      moveq.l    #1,d0
[0003df6a] d0af 000c                 add.l      12(a7),d0
[0003df6e] b0af 0010                 cmp.l      16(a7),d0
[0003df72] 6c24                      bge.s      cutline_6
[0003df74] 584c                      addq.w     #4,a4
[0003df76] 41f9 000d 49e2            lea.l      $000D49E2,a0
[0003df7c] 4eb9 0004 643c            jsr        Ast_create
[0003df82] 2888                      move.l     a0,(a4)
[0003df84] 7001                      moveq.l    #1,d0
[0003df86] d0af 000c                 add.l      12(a7),d0
[0003df8a] 23c0 000d 469a            move.l     d0,$000D469A
[0003df90] 42b9 000d 469e            clr.l      $000D469E
[0003df96] 6010                      bra.s      cutline_7
cutline_6:
[0003df98] 23ef 000c 000d 469a       move.l     12(a7),$000D469A
[0003dfa0] 23ef 0004 000d 469e       move.l     4(a7),$000D469E
cutline_7:
[0003dfa8] 43f9 000d 4692            lea.l      subdel,a1
[0003dfae] 303c 00ea                 move.w     #$00EA,d0
[0003dfb2] 204a                      movea.l    a2,a0
[0003dfb4] 4e93                      jsr        (a3)
cutline_3:
[0003dfb6] 4fef 0014                 lea.l      20(a7),a7
[0003dfba] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003dfbe] 4e75                      rts

edit_fulled:
[0003dfc0] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003dfc4] 2448                      movea.l    a0,a2
[0003dfc6] 47ea 0024                 lea.l      36(a2),a3
[0003dfca] 49ea 002c                 lea.l      44(a2),a4
[0003dfce] 7001                      moveq.l    #1,d0
[0003dfd0] c06a 0056                 and.w      86(a2),d0
[0003dfd4] 6724                      beq.s      edit_fulled_1
[0003dfd6] 3694                      move.w     (a4),(a3)
[0003dfd8] 376c 0002 0002            move.w     2(a4),2(a3)
[0003dfde] 376c 0004 0004            move.w     4(a4),4(a3)
[0003dfe4] 376c 0006 0006            move.w     6(a4),6(a3)
[0003dfea] 224c                      movea.l    a4,a1
[0003dfec] 4eb9 0003 eb3e            jsr        edit_sized
[0003dff2] 026a fffe 0056            andi.w     #$FFFE,86(a2)
[0003dff8] 602a                      bra.s      edit_fulled_2
edit_fulled_1:
[0003dffa] 3893                      move.w     (a3),(a4)
[0003dffc] 396b 0002 0002            move.w     2(a3),2(a4)
[0003e002] 396b 0004 0004            move.w     4(a3),4(a4)
[0003e008] 396b 0006 0006            move.w     6(a3),6(a4)
[0003e00e] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003e014] 5049                      addq.w     #8,a1
[0003e016] 204a                      movea.l    a2,a0
[0003e018] 4eb9 0003 eb3e            jsr        edit_sized
[0003e01e] 006a 0001 0056            ori.w      #$0001,86(a2)
edit_fulled_2:
[0003e024] 3f2b 0006                 move.w     6(a3),-(a7)
[0003e028] 3f2b 0004                 move.w     4(a3),-(a7)
[0003e02c] 3f2b 0002                 move.w     2(a3),-(a7)
[0003e030] 3f13                      move.w     (a3),-(a7)
[0003e032] 7205                      moveq.l    #5,d1
[0003e034] 302a 0020                 move.w     32(a2),d0
[0003e038] 4eb9 0007 f926            jsr        wind_set
[0003e03e] 504f                      addq.w     #8,a7
[0003e040] 4eb9 0004 b086            jsr        Aev_mess
[0003e046] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003e04a] 4e75                      rts

edit_arrowed:
[0003e04c] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[0003e050] 4fef fff6                 lea.l      -10(a7),a7
[0003e054] 3800                      move.w     d0,d4
[0003e056] 3f41 0008                 move.w     d1,8(a7)
[0003e05a] 2468 0014                 movea.l    20(a0),a2
[0003e05e] 45ea 0060                 lea.l      96(a2),a2
[0003e062] 266a 000c                 movea.l    12(a2),a3
[0003e066] 2868 0014                 movea.l    20(a0),a4
[0003e06a] 49ec 0078                 lea.l      120(a4),a4
[0003e06e] 2f6c 000c 0004            move.l     12(a4),4(a7)
[0003e074] 4243                      clr.w      d3
[0003e076] 3004                      move.w     d4,d0
edit_arrowed_18:
[0003e078] b07c 0007                 cmp.w      #$0007,d0
[0003e07c] 6200 00b2                 bhi        edit_arrowed_1
[0003e080] d040                      add.w      d0,d0
[0003e082] 303b 0006                 move.w     $0003E08A(pc,d0.w),d0
[0003e086] 4efb 0002                 jmp        $0003E08A(pc,d0.w)
J31:
[0003e08a] 0038                      dc.w $0038   ; edit_arrowed_2-J31
[0003e08c] 004c                      dc.w $004c   ; edit_arrowed_3-J31
[0003e08e] 0010                      dc.w $0010   ; edit_arrowed_4-J31
[0003e090] 0024                      dc.w $0024   ; edit_arrowed_5-J31
[0003e092] 0064                      dc.w $0064   ; edit_arrowed_6-J31
[0003e094] 0074                      dc.w $0074   ; edit_arrowed_7-J31
[0003e096] 0086                      dc.w $0086   ; edit_arrowed_8-J31
[0003e098] 0096                      dc.w $0096   ; edit_arrowed_9-J31
edit_arrowed_4:
[0003e09a] 43ef 0008                 lea.l      8(a7),a1
[0003e09e] 700b                      moveq.l    #11,d0
[0003e0a0] 204c                      movea.l    a4,a0
[0003e0a2] 2a6f 0004                 movea.l    4(a7),a5
[0003e0a6] 2a6d 0008                 movea.l    8(a5),a5
[0003e0aa] 4e95                      jsr        (a5)
[0003e0ac] 603c                      bra.s      edit_arrowed_10
edit_arrowed_5:
[0003e0ae] 43ef 0008                 lea.l      8(a7),a1
[0003e0b2] 700a                      moveq.l    #10,d0
[0003e0b4] 204c                      movea.l    a4,a0
[0003e0b6] 2a6f 0004                 movea.l    4(a7),a5
[0003e0ba] 2a6d 0008                 movea.l    8(a5),a5
[0003e0be] 4e95                      jsr        (a5)
[0003e0c0] 6028                      bra.s      edit_arrowed_10
edit_arrowed_2:
[0003e0c2] 43ef 0008                 lea.l      8(a7),a1
[0003e0c6] 700d                      moveq.l    #13,d0
[0003e0c8] 204c                      movea.l    a4,a0
[0003e0ca] 2a6f 0004                 movea.l    4(a7),a5
[0003e0ce] 2a6d 0008                 movea.l    8(a5),a5
[0003e0d2] 4e95                      jsr        (a5)
[0003e0d4] 6012                      bra.s      edit_arrowed_11
edit_arrowed_3:
[0003e0d6] 43ef 0008                 lea.l      8(a7),a1
[0003e0da] 700c                      moveq.l    #12,d0
[0003e0dc] 204c                      movea.l    a4,a0
[0003e0de] 2a6f 0004                 movea.l    4(a7),a5
[0003e0e2] 2a6d 0008                 movea.l    8(a5),a5
[0003e0e6] 4e95                      jsr        (a5)
edit_arrowed_11:
[0003e0e8] 4243                      clr.w      d3
edit_arrowed_10:
[0003e0ea] 7a01                      moveq.l    #1,d5
[0003e0ec] 6042                      bra.s      edit_arrowed_1
edit_arrowed_6:
[0003e0ee] 43ef 0008                 lea.l      8(a7),a1
[0003e0f2] 700d                      moveq.l    #13,d0
[0003e0f4] 204a                      movea.l    a2,a0
[0003e0f6] 2a6b 0008                 movea.l    8(a3),a5
[0003e0fa] 4e95                      jsr        (a5)
[0003e0fc] 600e                      bra.s      edit_arrowed_12
edit_arrowed_7:
[0003e0fe] 43ef 0008                 lea.l      8(a7),a1
[0003e102] 700c                      moveq.l    #12,d0
[0003e104] 204a                      movea.l    a2,a0
[0003e106] 2a6b 0008                 movea.l    8(a3),a5
[0003e10a] 4e95                      jsr        (a5)
edit_arrowed_12:
[0003e10c] 4243                      clr.w      d3
[0003e10e] 601e                      bra.s      edit_arrowed_13
edit_arrowed_8:
[0003e110] 43ef 0008                 lea.l      8(a7),a1
[0003e114] 700b                      moveq.l    #11,d0
[0003e116] 204a                      movea.l    a2,a0
[0003e118] 2a6b 0008                 movea.l    8(a3),a5
[0003e11c] 4e95                      jsr        (a5)
[0003e11e] 600e                      bra.s      edit_arrowed_13
edit_arrowed_9:
[0003e120] 43ef 0008                 lea.l      8(a7),a1
[0003e124] 700a                      moveq.l    #10,d0
[0003e126] 204a                      movea.l    a2,a0
[0003e128] 2a6b 0008                 movea.l    8(a3),a5
[0003e12c] 4e95                      jsr        (a5)
edit_arrowed_13:
[0003e12e] 4245                      clr.w      d5
edit_arrowed_1:
[0003e130] 4a45                      tst.w      d5
[0003e132] 672c                      beq.s      edit_arrowed_14
[0003e134] 3003                      move.w     d3,d0
[0003e136] 5343                      subq.w     #1,d3
[0003e138] 4a40                      tst.w      d0
[0003e13a] 6612                      bne.s      edit_arrowed_15
[0003e13c] 93c9                      suba.l     a1,a1
[0003e13e] 7005                      moveq.l    #5,d0
[0003e140] 204c                      movea.l    a4,a0
[0003e142] 2a6f 0004                 movea.l    4(a7),a5
[0003e146] 2a6d 0008                 movea.l    8(a5),a5
[0003e14a] 4e95                      jsr        (a5)
[0003e14c] 7604                      moveq.l    #4,d3
edit_arrowed_15:
[0003e14e] 93c9                      suba.l     a1,a1
[0003e150] 7069                      moveq.l    #105,d0
[0003e152] 204c                      movea.l    a4,a0
[0003e154] 2a6f 0004                 movea.l    4(a7),a5
[0003e158] 2a6d 0008                 movea.l    8(a5),a5
[0003e15c] 4e95                      jsr        (a5)
[0003e15e] 6022                      bra.s      edit_arrowed_16
edit_arrowed_14:
[0003e160] 3003                      move.w     d3,d0
[0003e162] 5343                      subq.w     #1,d3
[0003e164] 4a40                      tst.w      d0
[0003e166] 660e                      bne.s      edit_arrowed_17
[0003e168] 93c9                      suba.l     a1,a1
[0003e16a] 7005                      moveq.l    #5,d0
[0003e16c] 204a                      movea.l    a2,a0
[0003e16e] 2a6b 0008                 movea.l    8(a3),a5
[0003e172] 4e95                      jsr        (a5)
[0003e174] 7604                      moveq.l    #4,d3
edit_arrowed_17:
[0003e176] 93c9                      suba.l     a1,a1
[0003e178] 7069                      moveq.l    #105,d0
[0003e17a] 204a                      movea.l    a2,a0
[0003e17c] 2a6b 0008                 movea.l    8(a3),a5
[0003e180] 4e95                      jsr        (a5)
edit_arrowed_16:
[0003e182] 2f39 000e 692a            move.l     _globl,-(a7)
[0003e188] 486f 0006                 pea.l      6(a7)
[0003e18c] 486f 0008                 pea.l      8(a7)
[0003e190] 43ef 000e                 lea.l      14(a7),a1
[0003e194] 41ef 000e                 lea.l      14(a7),a0
[0003e198] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0003e19e] 4fef 000c                 lea.l      12(a7),a7
[0003e1a2] 7001                      moveq.l    #1,d0
[0003e1a4] c057                      and.w      (a7),d0
[0003e1a6] 6600 fece                 bne        edit_arrowed_18
[0003e1aa] b67c 0004                 cmp.w      #$0004,d3
[0003e1ae] 6722                      beq.s      edit_arrowed_19
[0003e1b0] 4a45                      tst.w      d5
[0003e1b2] 6712                      beq.s      edit_arrowed_20
[0003e1b4] 93c9                      suba.l     a1,a1
[0003e1b6] 204c                      movea.l    a4,a0
[0003e1b8] 246f 0004                 movea.l    4(a7),a2
[0003e1bc] 246a 0008                 movea.l    8(a2),a2
[0003e1c0] 7005                      moveq.l    #5,d0
[0003e1c2] 4e92                      jsr        (a2)
[0003e1c4] 600c                      bra.s      edit_arrowed_19
edit_arrowed_20:
[0003e1c6] 93c9                      suba.l     a1,a1
[0003e1c8] 7005                      moveq.l    #5,d0
[0003e1ca] 204c                      movea.l    a4,a0
[0003e1cc] 246b 0008                 movea.l    8(a3),a2
[0003e1d0] 4e92                      jsr        (a2)
edit_arrowed_19:
[0003e1d2] 4fef 000a                 lea.l      10(a7),a7
[0003e1d6] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[0003e1da] 4e75                      rts

edit_hslid:
[0003e1dc] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003e1e0] 554f                      subq.w     #2,a7
[0003e1e2] 3e80                      move.w     d0,(a7)
[0003e1e4] 2468 0014                 movea.l    20(a0),a2
[0003e1e8] 45ea 0060                 lea.l      96(a2),a2
[0003e1ec] 266a 000c                 movea.l    12(a2),a3
[0003e1f0] 43d7                      lea.l      (a7),a1
[0003e1f2] 204a                      movea.l    a2,a0
[0003e1f4] 286b 0008                 movea.l    8(a3),a4
[0003e1f8] 706a                      moveq.l    #106,d0
[0003e1fa] 4e94                      jsr        (a4)
[0003e1fc] 93c9                      suba.l     a1,a1
[0003e1fe] 7005                      moveq.l    #5,d0
[0003e200] 204a                      movea.l    a2,a0
[0003e202] 286b 0008                 movea.l    8(a3),a4
[0003e206] 4e94                      jsr        (a4)
[0003e208] 93c9                      suba.l     a1,a1
[0003e20a] 7069                      moveq.l    #105,d0
[0003e20c] 204a                      movea.l    a2,a0
[0003e20e] 286b 0008                 movea.l    8(a3),a4
[0003e212] 4e94                      jsr        (a4)
[0003e214] 544f                      addq.w     #2,a7
[0003e216] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003e21a] 4e75                      rts

edit_init:
[0003e21c] 48e7 0034                 movem.l    a2-a3/a5,-(a7)
[0003e220] 4fef ffb6                 lea.l      -74(a7),a7
[0003e224] 2448                      movea.l    a0,a2
[0003e226] 2650                      movea.l    (a0),a3
[0003e228] 302b 0294                 move.w     660(a3),d0
[0003e22c] c07c 0200                 and.w      #$0200,d0
[0003e230] 6600 00ea                 bne        edit_init_1
[0003e234] 006a 0020 0056            ori.w      #$0020,86(a2)
[0003e23a] 302a 0056                 move.w     86(a2),d0
[0003e23e] c07c 0800                 and.w      #$0800,d0
[0003e242] 6600 00d8                 bne        edit_init_1
[0003e246] 536b 00c8                 subq.w     #1,200(a3)
[0003e24a] 302b 00c8                 move.w     200(a3),d0
[0003e24e] 6e00 00cc                 bgt        edit_init_1
[0003e252] 2a6a 0014                 movea.l    20(a2),a5
[0003e256] 43ef 0014                 lea.l      20(a7),a1
[0003e25a] 204d                      movea.l    a5,a0
[0003e25c] 303c 00d8                 move.w     #$00D8,d0
[0003e260] 4eb9 0003 a772            jsr        Auo_editor
[0003e266] 43ef 0010                 lea.l      16(a7),a1
[0003e26a] 303c 00ff                 move.w     #$00FF,d0
[0003e26e] 204d                      movea.l    a5,a0
[0003e270] 4eb9 0003 a772            jsr        Auo_editor
[0003e276] 43d7                      lea.l      (a7),a1
[0003e278] 303c 00e3                 move.w     #$00E3,d0
[0003e27c] 204d                      movea.l    a5,a0
[0003e27e] 4eb9 0003 a772            jsr        Auo_editor
[0003e284] 4bef 0018                 lea.l      24(a7),a5
[0003e288] 2017                      move.l     (a7),d0
[0003e28a] 6b46                      bmi.s      edit_init_2
[0003e28c] 7201                      moveq.l    #1,d1
[0003e28e] d2af 0008                 add.l      8(a7),d1
[0003e292] 2f01                      move.l     d1,-(a7)
[0003e294] 7401                      moveq.l    #1,d2
[0003e296] d4af 0010                 add.l      16(a7),d2
[0003e29a] 2f02                      move.l     d2,-(a7)
[0003e29c] 7001                      moveq.l    #1,d0
[0003e29e] d0af 0008                 add.l      8(a7),d0
[0003e2a2] 2f00                      move.l     d0,-(a7)
[0003e2a4] 7201                      moveq.l    #1,d1
[0003e2a6] d2af 0010                 add.l      16(a7),d1
[0003e2aa] 2f01                      move.l     d1,-(a7)
[0003e2ac] 43f9 000d 49f5            lea.l      $000D49F5,a1
[0003e2b2] 204d                      movea.l    a5,a0
[0003e2b4] 4eb9 0008 15ac            jsr        sprintf
[0003e2ba] 4fef 0010                 lea.l      16(a7),a7
[0003e2be] 224d                      movea.l    a5,a1
[0003e2c0] 204a                      movea.l    a2,a0
[0003e2c2] 4eb9 0004 0696            jsr        info_string
[0003e2c8] 277c ffff ffff 00ca       move.l     #$FFFFFFFF,202(a3)
[0003e2d0] 604a                      bra.s      edit_init_1
edit_init_2:
[0003e2d2] 202b 00ca                 move.l     202(a3),d0
[0003e2d6] b0af 0010                 cmp.l      16(a7),d0
[0003e2da] 660a                      bne.s      edit_init_3
[0003e2dc] 222b 00ce                 move.l     206(a3),d1
[0003e2e0] b2af 0014                 cmp.l      20(a7),d1
[0003e2e4] 6736                      beq.s      edit_init_1
edit_init_3:
[0003e2e6] 7001                      moveq.l    #1,d0
[0003e2e8] d0af 0014                 add.l      20(a7),d0
[0003e2ec] 2f00                      move.l     d0,-(a7)
[0003e2ee] 7201                      moveq.l    #1,d1
[0003e2f0] d2af 0014                 add.l      20(a7),d1
[0003e2f4] 2f01                      move.l     d1,-(a7)
[0003e2f6] 43f9 000d 4a01            lea.l      $000D4A01,a1
[0003e2fc] 204d                      movea.l    a5,a0
[0003e2fe] 4eb9 0008 15ac            jsr        sprintf
[0003e304] 504f                      addq.w     #8,a7
[0003e306] 224d                      movea.l    a5,a1
[0003e308] 204a                      movea.l    a2,a0
[0003e30a] 4eb9 0004 0696            jsr        info_string
[0003e310] 276f 0010 00ca            move.l     16(a7),202(a3)
[0003e316] 276f 0014 00ce            move.l     20(a7),206(a3)
edit_init_1:
[0003e31c] 4240                      clr.w      d0
[0003e31e] 4fef 004a                 lea.l      74(a7),a7
[0003e322] 4cdf 2c00                 movem.l    (a7)+,a2-a3/a5
[0003e326] 4e75                      rts

edit_make:
[0003e328] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[0003e32c] 4fef f9b6                 lea.l      -1610(a7),a7
[0003e330] 2f7c 3b9a c9ff 0008       move.l     #$3B9AC9FF,8(a7)
[0003e338] 2f7c 0000 0100 0004       move.l     #$00000100,4(a7)
[0003e340] 47f9 000d 3fb4            lea.l      proto,a3
[0003e346] 203c 0000 06a0            move.l     #$000006A0,d0
[0003e34c] 4eb9 0004 c608            jsr        Ax_malloc
[0003e352] 2448                      movea.l    a0,a2
[0003e354] 200a                      move.l     a2,d0
[0003e356] 673c                      beq.s      edit_make_1
[0003e358] 203c 0000 06a0            move.l     #$000006A0,d0
[0003e35e] 224b                      movea.l    a3,a1
[0003e360] 4eb9 0008 3500            jsr        memcpy
[0003e366] 722c                      moveq.l    #44,d1
[0003e368] 4240                      clr.w      d0
[0003e36a] 41eb 00d2                 lea.l      210(a3),a0
[0003e36e] 4eb9 0008 36ea            jsr        memset
[0003e374] 277c 000d 4734 f534       move.l     #edit,-2764(a3)
[0003e37c] 41eb f520                 lea.l      -2784(a3),a0
[0003e380] 4eb9 0005 7052            jsr        Awi_create
[0003e386] 2848                      movea.l    a0,a4
[0003e388] 200c                      move.l     a4,d0
[0003e38a] 660e                      bne.s      edit_make_2
[0003e38c] 204a                      movea.l    a2,a0
[0003e38e] 4eb9 0004 c7c8            jsr        Ax_free
edit_make_1:
[0003e394] 91c8                      suba.l     a0,a0
[0003e396] 6000 0376                 bra        edit_make_3
edit_make_2:
[0003e39a] 2f39 000e 692a            move.l     _globl,-(a7)
[0003e3a0] 486f 0004                 pea.l      4(a7)
[0003e3a4] 486f 0008                 pea.l      8(a7)
[0003e3a8] 4267                      clr.w      -(a7)
[0003e3aa] 4267                      clr.w      -(a7)
[0003e3ac] 4267                      clr.w      -(a7)
[0003e3ae] 43ef 0012                 lea.l      18(a7),a1
[0003e3b2] 41ef 0014                 lea.l      20(a7),a0
[0003e3b6] 4242                      clr.w      d2
[0003e3b8] 322c 0022                 move.w     34(a4),d1
[0003e3bc] 7001                      moveq.l    #1,d0
[0003e3be] 4eb9 0007 b8da            jsr        mt_wind_calc
[0003e3c4] 4fef 0012                 lea.l      18(a7),a7
[0003e3c8] 7008                      moveq.l    #8,d0
[0003e3ca] d06c 0024                 add.w      36(a4),d0
[0003e3ce] c07c fff0                 and.w      #$FFF0,d0
[0003e3d2] 906f 0002                 sub.w      2(a7),d0
[0003e3d6] 3940 0024                 move.w     d0,36(a4)
[0003e3da] 288a                      move.l     a2,(a4)
[0003e3dc] 4def 001a                 lea.l      26(a7),a6
[0003e3e0] 4bf9 0010 ee4e            lea.l      ACSblk,a5
[0003e3e6] 302b 06fe                 move.w     1790(a3),d0
[0003e3ea] 6600 0142                 bne        edit_make_4
[0003e3ee] 41f9 000d 4a0c            lea.l      $000D4A0C,a0
[0003e3f4] 4eb9 0004 b496            jsr        Af_cfgfile
[0003e3fa] 4240                      clr.w      d0
[0003e3fc] 4eb9 0008 0cc0            jsr        Fopen
[0003e402] 2600                      move.l     d0,d3
[0003e404] 6f00 0110                 ble        edit_make_5
[0003e408] 41ef 0016                 lea.l      22(a7),a0
[0003e40c] 7204                      moveq.l    #4,d1
[0003e40e] 3003                      move.w     d3,d0
[0003e410] 4eb9 0008 0cd2            jsr        Fread
[0003e416] 7204                      moveq.l    #4,d1
[0003e418] b280                      cmp.l      d0,d1
[0003e41a] 6600 00f2                 bne        edit_make_6
[0003e41e] 0caf 4145 4431 0016       cmpi.l     #$41454431,22(a7)
[0003e426] 6600 00e6                 bne        edit_make_6
[0003e42a] 4242                      clr.w      d2
[0003e42c] 7000                      moveq.l    #0,d0
[0003e42e] 3203                      move.w     d3,d1
[0003e430] 4eb9 0008 0cfe            jsr        Fseek
[0003e436] 4a80                      tst.l      d0
[0003e438] 6600 00d4                 bne        edit_make_6
[0003e43c] 41ef 011c                 lea.l      284(a7),a0
[0003e440] 223c 0000 052e            move.l     #$0000052E,d1
[0003e446] 3003                      move.w     d3,d0
[0003e448] 4eb9 0008 0cd2            jsr        Fread
[0003e44e] b0bc 0000 052e            cmp.l      #$0000052E,d0
[0003e454] 6600 00b8                 bne        edit_make_6
[0003e458] 203c 0000 052e            move.l     #$0000052E,d0
[0003e45e] 43ef 011c                 lea.l      284(a7),a1
[0003e462] 41eb fad2                 lea.l      -1326(a3),a0
[0003e466] 4eb9 0008 3500            jsr        memcpy
[0003e46c] 41ef 0016                 lea.l      22(a7),a0
[0003e470] 7204                      moveq.l    #4,d1
[0003e472] 3003                      move.w     d3,d0
[0003e474] 4eb9 0008 0cd2            jsr        Fread
[0003e47a] 7204                      moveq.l    #4,d1
[0003e47c] b280                      cmp.l      d0,d1
[0003e47e] 6600 008e                 bne        edit_make_6
[0003e482] 7800                      moveq.l    #0,d4
[0003e484] 6000 0080                 bra        edit_make_7
[0003e488] 204e                      movea.l    a6,a0
edit_make_10:
[0003e48a] 223c 0000 0102            move.l     #$00000102,d1
[0003e490] 3003                      move.w     d3,d0
[0003e492] 4eb9 0008 0cd2            jsr        Fread
[0003e498] b0bc 0000 0102            cmp.l      #$00000102,d0
[0003e49e] 666e                      bne.s      edit_make_6
[0003e4a0] 182e 0001                 move.b     1(a6),d4
[0003e4a4] 4884                      ext.w      d4
[0003e4a6] d87c fff0                 add.w      #$FFF0,d4
[0003e4aa] 48c4                      ext.l      d4
[0003e4ac] 3016                      move.w     (a6),d0
[0003e4ae] c07c 0400                 and.w      #$0400,d0
[0003e4b2] 6706                      beq.s      edit_make_8
[0003e4b4] d8bc 0000 0014            add.l      #$00000014,d4
edit_make_8:
[0003e4ba] 3016                      move.w     (a6),d0
[0003e4bc] c07c 0300                 and.w      #$0300,d0
[0003e4c0] 6706                      beq.s      edit_make_9
[0003e4c2] d8bc 0000 000a            add.l      #$0000000A,d4
edit_make_9:
[0003e4c8] 203c 0000 0102            move.l     #$00000102,d0
[0003e4ce] 4eb9 0004 c608            jsr        Ax_malloc
[0003e4d4] 2004                      move.l     d4,d0
[0003e4d6] e588                      lsl.l      #2,d0
[0003e4d8] 43f2 0800                 lea.l      0(a2,d0.l),a1
[0003e4dc] 2348 00d2                 move.l     a0,210(a1)
[0003e4e0] 3204                      move.w     d4,d1
[0003e4e2] e549                      lsl.w      #2,d1
[0003e4e4] 43eb 00d2                 lea.l      210(a3),a1
[0003e4e8] 2388 1000                 move.l     a0,0(a1,d1.w)
[0003e4ec] 6720                      beq.s      edit_make_6
[0003e4ee] 224e                      movea.l    a6,a1
[0003e4f0] 41f2 0800                 lea.l      0(a2,d0.l),a0
[0003e4f4] 2068 00d2                 movea.l    210(a0),a0
[0003e4f8] 203c 0000 0102            move.l     #$00000102,d0
[0003e4fe] 4eb9 0008 3500            jsr        memcpy
[0003e504] 5284                      addq.l     #1,d4
edit_make_7:
[0003e506] b8af 0016                 cmp.l      22(a7),d4
[0003e50a] 6d00 ff7c                 blt        edit_make_10
edit_make_6:
[0003e50e] 3003                      move.w     d3,d0
[0003e510] 4eb9 0008 0c7e            jsr        Fclose
edit_make_5:
[0003e516] 102b fef6                 move.b     -266(a3),d0
[0003e51a] 6654                      bne.s      edit_make_11
[0003e51c] 2255                      movea.l    (a5),a1
[0003e51e] 43e9 03e6                 lea.l      998(a1),a1
[0003e522] 41eb fef6                 lea.l      -266(a3),a0
[0003e526] 4eb9 0008 2f0c            jsr        strcpy
[0003e52c] 6042                      bra.s      edit_make_11
edit_make_4:
[0003e52e] 7800                      moveq.l    #0,d4
[0003e530] 6038                      bra.s      edit_make_12
[0003e532] 3004                      move.w     d4,d0
edit_make_14:
[0003e534] e548                      lsl.w      #2,d0
[0003e536] 41eb 00d2                 lea.l      210(a3),a0
[0003e53a] 2230 0000                 move.l     0(a0,d0.w),d1
[0003e53e] 6728                      beq.s      edit_make_13
[0003e540] 203c 0000 0102            move.l     #$00000102,d0
[0003e546] 4eb9 0004 c608            jsr        Ax_malloc
[0003e54c] 2004                      move.l     d4,d0
[0003e54e] e588                      lsl.l      #2,d0
[0003e550] 43f2 0800                 lea.l      0(a2,d0.l),a1
[0003e554] 2348 00d2                 move.l     a0,210(a1)
[0003e558] 6716                      beq.s      edit_make_11
[0003e55a] 224e                      movea.l    a6,a1
[0003e55c] 203c 0000 0102            move.l     #$00000102,d0
[0003e562] 4eb9 0008 3500            jsr        memcpy
edit_make_13:
[0003e568] 5284                      addq.l     #1,d4
edit_make_12:
[0003e56a] 7028                      moveq.l    #40,d0
[0003e56c] b084                      cmp.l      d4,d0
[0003e56e] 6ec2                      bgt.s      edit_make_14
edit_make_11:
[0003e570] 026b 007f fbf4            andi.w     #$007F,-1036(a3)
[0003e576] 203c 0000 052e            move.l     #$0000052E,d0
[0003e57c] 43eb fad2                 lea.l      -1326(a3),a1
[0003e580] 41ea 0172                 lea.l      370(a2),a0
[0003e584] 4eb9 0008 3500            jsr        memcpy
[0003e58a] 206b f538                 movea.l    -2760(a3),a0
[0003e58e] b1fc 000d 32ac            cmpa.l     #_ED_TOOL,a0
[0003e594] 6706                      beq.s      edit_make_15
[0003e596] 006a 0200 0294            ori.w      #$0200,660(a2)
edit_make_15:
[0003e59c] 006c 0060 0054            ori.w      #$0060,84(a4)
[0003e5a2] 4240                      clr.w      d0
[0003e5a4] 206c 0014                 movea.l    20(a4),a0
[0003e5a8] 3140 0046                 move.w     d0,70(a0)
[0003e5ac] 206c 0014                 movea.l    20(a4),a0
[0003e5b0] 3140 0044                 move.w     d0,68(a0)
[0003e5b4] 2c6c 0014                 movea.l    20(a4),a6
[0003e5b8] 322a 0178                 move.w     376(a2),d1
[0003e5bc] 6712                      beq.s      edit_make_16
[0003e5be] 2055                      movea.l    (a5),a0
[0003e5c0] b268 000c                 cmp.w      12(a0),d1
[0003e5c4] 6e0a                      bgt.s      edit_make_16
[0003e5c6] 342a 017a                 move.w     378(a2),d2
[0003e5ca] b468 000e                 cmp.w      14(a0),d2
[0003e5ce] 6f26                      ble.s      edit_make_17
edit_make_16:
[0003e5d0] 2055                      movea.l    (a5),a0
[0003e5d2] 3028 000c                 move.w     12(a0),d0
[0003e5d6] 3228 000c                 move.w     12(a0),d1
[0003e5da] e441                      asr.w      #2,d1
[0003e5dc] 9041                      sub.w      d1,d0
[0003e5de] 3d40 0014                 move.w     d0,20(a6)
[0003e5e2] 2055                      movea.l    (a5),a0
[0003e5e4] 3228 000e                 move.w     14(a0),d1
[0003e5e8] 3428 000e                 move.w     14(a0),d2
[0003e5ec] e442                      asr.w      #2,d2
[0003e5ee] 9242                      sub.w      d2,d1
[0003e5f0] 3d41 0016                 move.w     d1,22(a6)
[0003e5f4] 600c                      bra.s      edit_make_18
edit_make_17:
[0003e5f6] 3d6a 0178 0014            move.w     376(a2),20(a6)
[0003e5fc] 3d6a 017a 0016            move.w     378(a2),22(a6)
edit_make_18:
[0003e602] 43ef 0004                 lea.l      4(a7),a1
[0003e606] 303c 00d2                 move.w     #$00D2,d0
[0003e60a] 204e                      movea.l    a6,a0
[0003e60c] 4eb9 0003 a772            jsr        Auo_editor
[0003e612] 43ea 0596                 lea.l      1430(a2),a1
[0003e616] 303c 0106                 move.w     #$0106,d0
[0003e61a] 204e                      movea.l    a6,a0
[0003e61c] 4eb9 0003 a772            jsr        Auo_editor
[0003e622] 43ea 0180                 lea.l      384(a2),a1
[0003e626] 303c 00fe                 move.w     #$00FE,d0
[0003e62a] 204e                      movea.l    a6,a0
[0003e62c] 4eb9 0003 a772            jsr        Auo_editor
[0003e632] 43ea 017c                 lea.l      380(a2),a1
[0003e636] 303c 00cf                 move.w     #$00CF,d0
[0003e63a] 204e                      movea.l    a6,a0
[0003e63c] 4eb9 0003 a772            jsr        Auo_editor
[0003e642] 43ea 017e                 lea.l      382(a2),a1
[0003e646] 303c 00d0                 move.w     #$00D0,d0
[0003e64a] 204e                      movea.l    a6,a0
[0003e64c] 4eb9 0003 a772            jsr        Auo_editor
[0003e652] 93c9                      suba.l     a1,a1
[0003e654] 303c 00ee                 move.w     #$00EE,d0
[0003e658] 204e                      movea.l    a6,a0
[0003e65a] 4eb9 0003 a772            jsr        Auo_editor
[0003e660] 4bef 000c                 lea.l      12(a7),a5
[0003e664] 2a8c                      move.l     a4,(a5)
[0003e666] 206c 0014                 movea.l    20(a4),a0
[0003e66a] 41e8 0060                 lea.l      96(a0),a0
[0003e66e] 2b48 0004                 move.l     a0,4(a5)
[0003e672] 3b7c 0004 0008            move.w     #$0004,8(a5)
[0003e678] 224d                      movea.l    a5,a1
[0003e67a] 303c 00c9                 move.w     #$00C9,d0
[0003e67e] 204e                      movea.l    a6,a0
[0003e680] 4eb9 0003 a772            jsr        Auo_editor
[0003e686] 206c 0014                 movea.l    20(a4),a0
[0003e68a] 41e8 0078                 lea.l      120(a0),a0
[0003e68e] 2b48 0004                 move.l     a0,4(a5)
[0003e692] 3b7c 0005 0008            move.w     #$0005,8(a5)
[0003e698] 224d                      movea.l    a5,a1
[0003e69a] 303c 00c8                 move.w     #$00C8,d0
[0003e69e] 204e                      movea.l    a6,a0
[0003e6a0] 4eb9 0003 a772            jsr        Auo_editor
[0003e6a6] 43ef 0008                 lea.l      8(a7),a1
[0003e6aa] 303c 00cd                 move.w     #$00CD,d0
[0003e6ae] 204e                      movea.l    a6,a0
[0003e6b0] 4eb9 0003 a772            jsr        Auo_editor
[0003e6b6] 93c9                      suba.l     a1,a1
[0003e6b8] 303c 00e0                 move.w     #$00E0,d0
[0003e6bc] 204e                      movea.l    a6,a0
[0003e6be] 4eb9 0003 a772            jsr        Auo_editor
[0003e6c4] 93c9                      suba.l     a1,a1
[0003e6c6] 303c 00d3                 move.w     #$00D3,d0
[0003e6ca] 204e                      movea.l    a6,a0
[0003e6cc] 4eb9 0003 a772            jsr        Auo_editor
[0003e6d2] 93c9                      suba.l     a1,a1
[0003e6d4] 303c 00d6                 move.w     #$00D6,d0
[0003e6d8] 204e                      movea.l    a6,a0
[0003e6da] 4eb9 0003 a772            jsr        Auo_editor
[0003e6e0] 43ea 0176                 lea.l      374(a2),a1
[0003e6e4] 303c 00ec                 move.w     #$00EC,d0
[0003e6e8] 204e                      movea.l    a6,a0
[0003e6ea] 4eb9 0003 a772            jsr        Auo_editor
[0003e6f0] 93c9                      suba.l     a1,a1
[0003e6f2] 7006                      moveq.l    #6,d0
[0003e6f4] 204e                      movea.l    a6,a0
[0003e6f6] 4eb9 0003 a772            jsr        Auo_editor
[0003e6fc] 526b 06fe                 addq.w     #1,1790(a3)
[0003e700] 204c                      movea.l    a4,a0
[0003e702] 6100 e572                 bsr        set_icon
[0003e706] 204c                      movea.l    a4,a0
[0003e708] 6100 e66c                 bsr        undirty
[0003e70c] 204c                      movea.l    a4,a0
edit_make_3:
[0003e70e] 4fef 064a                 lea.l      1610(a7),a7
[0003e712] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0003e716] 4e75                      rts

term:
[0003e718] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003e71c] 2448                      movea.l    a0,a2
[0003e71e] 302a 0056                 move.w     86(a2),d0
[0003e722] c07c 0200                 and.w      #$0200,d0
[0003e726] 6600 008e                 bne        term_1
[0003e72a] 2650                      movea.l    (a0),a3
[0003e72c] 323c 0080                 move.w     #$0080,d1
[0003e730] c26b 0294                 and.w      660(a3),d1
[0003e734] 674a                      beq.s      term_2
[0003e736] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003e73c] 3429 023a                 move.w     570(a1),d2
[0003e740] 6716                      beq.s      term_3
[0003e742] 43eb 00b8                 lea.l      184(a3),a1
[0003e746] 41f9 000d 057e            lea.l      WARN_SAVED,a0
[0003e74c] 4eb9 0006 b80c            jsr        alert_str
[0003e752] 5340                      subq.w     #1,d0
[0003e754] 662a                      bne.s      term_2
[0003e756] 601a                      bra.s      term_4
term_3:
[0003e758] 43eb 00b8                 lea.l      184(a3),a1
[0003e75c] 41f9 000d 0530            lea.l      WARN_2SAVED,a0
[0003e762] 4eb9 0006 b80c            jsr        alert_str
[0003e768] 5340                      subq.w     #1,d0
[0003e76a] 6706                      beq.s      term_4
[0003e76c] 5540                      subq.w     #2,d0
[0003e76e] 6746                      beq.s      term_1
[0003e770] 600e                      bra.s      term_2
term_4:
[0003e772] 006a 0200 0056            ori.w      #$0200,86(a2)
[0003e778] 204a                      movea.l    a2,a0
[0003e77a] 4eb9 0003 fac2            jsr        ed_save
term_2:
[0003e780] 006a 0200 0056            ori.w      #$0200,86(a2)
[0003e786] 202b 0004                 move.l     4(a3),d0
[0003e78a] 4e71                      nop
[0003e78c] 2853                      movea.l    (a3),a4
[0003e78e] 200c                      move.l     a4,d0
[0003e790] 670e                      beq.s      term_5
[0003e792] 224a                      movea.l    a2,a1
[0003e794] 303c 00d1                 move.w     #$00D1,d0
[0003e798] 204c                      movea.l    a4,a0
[0003e79a] 2a6c 0004                 movea.l    4(a4),a5
[0003e79e] 4e95                      jsr        (a5)
term_5:
[0003e7a0] 5379 000d 46b2            subq.w     #1,editors
[0003e7a6] 204b                      movea.l    a3,a0
[0003e7a8] 4eb9 0004 c7c8            jsr        Ax_free
[0003e7ae] 204a                      movea.l    a2,a0
[0003e7b0] 4eb9 0005 85f2            jsr        Awi_delete
term_1:
[0003e7b6] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003e7ba] 4e75                      rts

set_title:
[0003e7bc] 2f0a                      move.l     a2,-(a7)
[0003e7be] 2f0b                      move.l     a3,-(a7)
[0003e7c0] 2448                      movea.l    a0,a2
[0003e7c2] 266a 004a                 movea.l    74(a2),a3
[0003e7c6] 2049                      movea.l    a1,a0
[0003e7c8] 4eb9 0004 643c            jsr        Ast_create
[0003e7ce] 2548 004a                 move.l     a0,74(a2)
[0003e7d2] 6606                      bne.s      set_title_1
[0003e7d4] 254b 004a                 move.l     a3,74(a2)
[0003e7d8] 6020                      bra.s      set_title_2
set_title_1:
[0003e7da] 204b                      movea.l    a3,a0
[0003e7dc] 4eb9 0004 649c            jsr        Ast_delete
[0003e7e2] 302a 0020                 move.w     32(a2),d0
[0003e7e6] 6f12                      ble.s      set_title_2
[0003e7e8] 4267                      clr.w      -(a7)
[0003e7ea] 4267                      clr.w      -(a7)
[0003e7ec] 2f2a 004a                 move.l     74(a2),-(a7)
[0003e7f0] 7202                      moveq.l    #2,d1
[0003e7f2] 4eb9 0007 f926            jsr        wind_set
[0003e7f8] 504f                      addq.w     #8,a7
set_title_2:
[0003e7fa] 265f                      movea.l    (a7)+,a3
[0003e7fc] 245f                      movea.l    (a7)+,a2
[0003e7fe] 4e75                      rts

get_all:
[0003e800] 48e7 002c                 movem.l    a2/a4-a5,-(a7)
[0003e804] 4fef fff0                 lea.l      -16(a7),a7
[0003e808] 2448                      movea.l    a0,a2
[0003e80a] 2849                      movea.l    a1,a4
[0003e80c] 303c 00d5                 move.w     #$00D5,d0
[0003e810] 93c9                      suba.l     a1,a1
[0003e812] 4eb9 0003 a772            jsr        Auo_editor
[0003e818] 93c9                      suba.l     a1,a1
[0003e81a] 303c 00e2                 move.w     #$00E2,d0
[0003e81e] 204a                      movea.l    a2,a0
[0003e820] 4eb9 0003 a772            jsr        Auo_editor
[0003e826] 93c9                      suba.l     a1,a1
[0003e828] 303c 00d6                 move.w     #$00D6,d0
[0003e82c] 204a                      movea.l    a2,a0
[0003e82e] 4eb9 0003 a772            jsr        Auo_editor
[0003e834] 43d7                      lea.l      (a7),a1
[0003e836] 303c 00e9                 move.w     #$00E9,d0
[0003e83a] 204a                      movea.l    a2,a0
[0003e83c] 4eb9 0003 a772            jsr        Auo_editor
[0003e842] 4bef 0004                 lea.l      4(a7),a5
[0003e846] 4295                      clr.l      (a5)
[0003e848] 6038                      bra.s      get_all_1
[0003e84a] 224d                      movea.l    a5,a1
get_all_4:
[0003e84c] 303c 00ca                 move.w     #$00CA,d0
[0003e850] 204a                      movea.l    a2,a0
[0003e852] 4eb9 0003 a772            jsr        Auo_editor
[0003e858] 202d 0004                 move.l     4(a5),d0
[0003e85c] 6f0c                      ble.s      get_all_2
[0003e85e] 226d 0008                 movea.l    8(a5),a1
[0003e862] 204c                      movea.l    a4,a0
[0003e864] 4eb9 0008 2fd6            jsr        strncpy
get_all_2:
[0003e86a] d9ed 0004                 adda.l     4(a5),a4
[0003e86e] 70ff                      moveq.l    #-1,d0
[0003e870] d097                      add.l      (a7),d0
[0003e872] 2215                      move.l     (a5),d1
[0003e874] b280                      cmp.l      d0,d1
[0003e876] 6708                      beq.s      get_all_3
[0003e878] 18fc 000d                 move.b     #$0D,(a4)+
[0003e87c] 18fc 000a                 move.b     #$0A,(a4)+
get_all_3:
[0003e880] 5295                      addq.l     #1,(a5)
get_all_1:
[0003e882] 2015                      move.l     (a5),d0
[0003e884] b097                      cmp.l      (a7),d0
[0003e886] 6dc2                      blt.s      get_all_4
[0003e888] 4214                      clr.b      (a4)
[0003e88a] 4fef 0010                 lea.l      16(a7),a7
[0003e88e] 4cdf 3400                 movem.l    (a7)+,a2/a4-a5
[0003e892] 4e75                      rts

put_string:
[0003e894] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0003e898] 2848                      movea.l    a0,a4
[0003e89a] 2449                      movea.l    a1,a2
[0003e89c] 2049                      movea.l    a1,a0
[0003e89e] 4eb9 0008 2f6c            jsr        strlen
[0003e8a4] 2600                      move.l     d0,d3
[0003e8a6] 47f9 0010 ce40            lea.l      buffer,a3
[0003e8ac] 602c                      bra.s      put_string_1
[0003e8ae] 203c 0000 2000            move.l     #$00002000,d0
put_string_2:
[0003e8b4] 224a                      movea.l    a2,a1
[0003e8b6] 204b                      movea.l    a3,a0
[0003e8b8] 4eb9 0008 3500            jsr        memcpy
[0003e8be] 203c 0000 2000            move.l     #$00002000,d0
[0003e8c4] 224b                      movea.l    a3,a1
[0003e8c6] 206c 0014                 movea.l    20(a4),a0
[0003e8ca] 4eb9 0003 f26a            jsr        put_block
[0003e8d0] 96bc 0000 2000            sub.l      #$00002000,d3
[0003e8d6] 45ea 2000                 lea.l      8192(a2),a2
put_string_1:
[0003e8da] b6bc 0000 2000            cmp.l      #$00002000,d3
[0003e8e0] 6ecc                      bgt.s      put_string_2
[0003e8e2] 2003                      move.l     d3,d0
[0003e8e4] 224a                      movea.l    a2,a1
[0003e8e6] 204b                      movea.l    a3,a0
[0003e8e8] 4eb9 0008 3500            jsr        memcpy
[0003e8ee] 2003                      move.l     d3,d0
[0003e8f0] 224b                      movea.l    a3,a1
[0003e8f2] 206c 0014                 movea.l    20(a4),a0
[0003e8f6] 4eb9 0003 f26a            jsr        put_block
[0003e8fc] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0003e900] 4e75                      rts

edit_service_23:
edit_service:
[0003e902] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003e906] 2448                      movea.l    a0,a2
[0003e908] 3600                      move.w     d0,d3
[0003e90a] 2849                      movea.l    a1,a4
[0003e90c] 2650                      movea.l    (a0),a3
[0003e90e] b07c 00cd                 cmp.w      #$00CD,d0
[0003e912] 6700 00ce                 beq        edit_service_1
[0003e916] 6e40                      bgt.s      edit_service_2
[0003e918] b07c 00c9                 cmp.w      #$00C9,d0
[0003e91c] 6700 013e                 beq        edit_service_3
[0003e920] 6e1e                      bgt.s      edit_service_4
[0003e922] 5540                      subq.w     #2,d0
[0003e924] 675c                      beq.s      edit_service_5
[0003e926] 907c 000d                 sub.w      #$000D,d0
[0003e92a] 6700 0184                 beq        edit_service_6
[0003e92e] 5540                      subq.w     #2,d0
[0003e930] 6700 01ac                 beq        edit_service_7
[0003e934] 907c 00b7                 sub.w      #$00B7,d0
[0003e938] 6700 007e                 beq.w      edit_service_8
[0003e93c] 6000 0192                 bra        edit_service_9
edit_service_4:
[0003e940] 907c 00ca                 sub.w      #$00CA,d0
[0003e944] 6700 012a                 beq        edit_service_10
[0003e948] 5340                      subq.w     #1,d0
[0003e94a] 6700 00b8                 beq        edit_service_11
[0003e94e] 5340                      subq.w     #1,d0
[0003e950] 6700 00de                 beq        edit_service_12
[0003e954] 6000 017a                 bra        edit_service_9
edit_service_2:
[0003e958] 907c 00ce                 sub.w      #$00CE,d0
[0003e95c] b07c 0009                 cmp.w      #$0009,d0
[0003e960] 6200 016e                 bhi        edit_service_9
[0003e964] d040                      add.w      d0,d0
[0003e966] 303b 0006                 move.w     $0003E96E(pc,d0.w),d0
[0003e96a] 4efb 0002                 jmp        $0003E96E(pc,d0.w)
J32:
[0003e96e] 0052                      dc.w $0052   ; edit_service_13-J32
[0003e970] 0060                      dc.w $0060   ; edit_service_14-J32
[0003e972] 0044                      dc.w $0044   ; edit_service_15-J32
[0003e974] 0162                      dc.w $0162   ; edit_service_9-J32
[0003e976] 0162                      dc.w $0162   ; edit_service_9-J32
[0003e978] 008c                      dc.w $008c   ; edit_service_16-J32
[0003e97a] 0080                      dc.w $0080   ; edit_service_17-J32
[0003e97c] 001e                      dc.w $001e   ; edit_service_18-J32
[0003e97e] 0138                      dc.w $0138   ; edit_service_19-J32
[0003e980] 0154                      dc.w $0154   ; edit_service_20-J32
edit_service_5:
[0003e982] 204a                      dc.w $204a   ; edit_service_21-J32
[0003e984] 6100                      dc.w $6100   ; edit_service_22-J32
[0003e986] fd92                      dc.w $fd92   ; edit_service_23-J32
[0003e988] 6000                      dc.w $6000   ; edit_service_24-J32
[0003e98a] 0154                      dc.w $0154   ; edit_service_20-J32
edit_service_18:
[0003e98c] 200c                      move.l     a4,d0
[0003e98e] 6714                      beq.s      edit_service_25
[0003e990] 422b 00a8                 clr.b      168(a3)
[0003e994] 224c                      movea.l    a4,a1
[0003e996] 41eb 00a8                 lea.l      168(a3),a0
[0003e99a] 700f                      moveq.l    #15,d0
[0003e99c] 4eb9 0008 2f96            jsr        strncat
[0003e9a2] 6004                      bra.s      edit_service_26
edit_service_25:
[0003e9a4] 422b 00a8                 clr.b      168(a3)
edit_service_26:
[0003e9a8] 204a                      movea.l    a2,a0
[0003e9aa] 6100 e2ca                 bsr        set_icon
[0003e9ae] 6000 012e                 bra        edit_service_7
edit_service_15:
[0003e9b2] 268c                      move.l     a4,(a3)
[0003e9b4] 6000 0128                 bra        edit_service_7
edit_service_8:
[0003e9b8] 28aa 0014                 move.l     20(a2),(a4)
[0003e9bc] 6000 0120                 bra        edit_service_7
edit_service_13:
[0003e9c0] 224c                      movea.l    a4,a1
[0003e9c2] 206a 0014                 movea.l    20(a2),a0
[0003e9c6] 6100 fe38                 bsr        get_all
[0003e9ca] 6000 0112                 bra        edit_service_7
edit_service_14:
[0003e9ce] 224c                      movea.l    a4,a1
[0003e9d0] 303c 00fb                 move.w     #$00FB,d0
[0003e9d4] 206a 0014                 movea.l    20(a2),a0
[0003e9d8] 4eb9 0003 a772            jsr        Auo_editor
[0003e9de] 6000 00fe                 bra        edit_service_7
edit_service_1:
[0003e9e2] 224c                      movea.l    a4,a1
[0003e9e4] 204a                      movea.l    a2,a0
[0003e9e6] 6100 feac                 bsr        put_string
[0003e9ea] 6000 00f2                 bra        edit_service_7
edit_service_17:
[0003e9ee] 206a 0014                 movea.l    20(a2),a0
[0003e9f2] 6100 e312                 bsr        home
[0003e9f6] 6000 00e6                 bra        edit_service_7
edit_service_16:
[0003e9fa] 204a                      movea.l    a2,a0
[0003e9fc] 6100 e378                 bsr        undirty
[0003ea00] 6000 00dc                 bra        edit_service_7
edit_service_11:
[0003ea04] 7020                      moveq.l    #32,d0
[0003ea06] 224c                      movea.l    a4,a1
[0003ea08] 41eb 0068                 lea.l      104(a3),a0
[0003ea0c] 4eb9 0008 2fd6            jsr        strncpy
[0003ea12] 422b 0087                 clr.b      135(a3)
[0003ea16] 303c 0080                 move.w     #$0080,d0
[0003ea1a] c06b 0294                 and.w      660(a3),d0
[0003ea1e] 6600 00be                 bne        edit_service_7
[0003ea22] 43eb 0068                 lea.l      104(a3),a1
[0003ea26] 204a                      movea.l    a2,a0
[0003ea28] 6100 fd92                 bsr        set_title
[0003ea2c] 6000 00b0                 bra        edit_service_7
edit_service_12:
[0003ea30] 7020                      moveq.l    #32,d0
[0003ea32] 224c                      movea.l    a4,a1
[0003ea34] 41eb 0088                 lea.l      136(a3),a0
[0003ea38] 4eb9 0008 2fd6            jsr        strncpy
[0003ea3e] 422b 00a7                 clr.b      167(a3)
[0003ea42] 303c 0080                 move.w     #$0080,d0
[0003ea46] c06b 0294                 and.w      660(a3),d0
[0003ea4a] 6700 0092                 beq        edit_service_7
[0003ea4e] 43eb 0088                 lea.l      136(a3),a1
[0003ea52] 204a                      movea.l    a2,a0
[0003ea54] 6100 fd66                 bsr        set_title
[0003ea58] 6000 0084                 bra        edit_service_7
edit_service_3:
[0003ea5c] 7010                      moveq.l    #16,d0
[0003ea5e] 224c                      movea.l    a4,a1
[0003ea60] 41eb 0182                 lea.l      386(a3),a0
[0003ea64] 4eb9 0008 2fd6            jsr        strncpy
[0003ea6a] 422b 0191                 clr.b      401(a3)
[0003ea6e] 606e                      bra.s      edit_service_7
edit_service_10:
[0003ea70] 200c                      move.l     a4,d0
[0003ea72] 6626                      bne.s      edit_service_27
[0003ea74] 486b 0182                 pea.l      386(a3)
[0003ea78] 43eb 0192                 lea.l      402(a3),a1
[0003ea7c] 41eb 0008                 lea.l      8(a3),a0
[0003ea80] 4eb9 0006 cefe            jsr        Af_select
[0003ea86] 584f                      addq.w     #4,a7
[0003ea88] 2a48                      movea.l    a0,a5
[0003ea8a] 200d                      move.l     a5,d0
[0003ea8c] 6750                      beq.s      edit_service_7
[0003ea8e] 224d                      movea.l    a5,a1
[0003ea90] 204a                      movea.l    a2,a0
[0003ea92] 4eb9 0003 f37a            jsr        open_file
[0003ea98] 6044                      bra.s      edit_service_7
edit_service_27:
[0003ea9a] 224c                      movea.l    a4,a1
[0003ea9c] 204a                      movea.l    a2,a0
[0003ea9e] 4eb9 0003 f37a            jsr        open_file
[0003eaa4] 6038                      bra.s      edit_service_7
edit_service_19:
[0003eaa6] 204a                      movea.l    a2,a0
[0003eaa8] 4eb9 0003 fac2            jsr        ed_save
[0003eaae] 602e                      bra.s      edit_service_7
edit_service_6:
[0003eab0] 4bf9 000d 375c            lea.l      WIED_INFOBOX,a5
[0003eab6] 224d                      movea.l    a5,a1
[0003eab8] 204d                      movea.l    a5,a0
[0003eaba] 4eb9 0005 a366            jsr        Awi_doform
[0003eac0] 601c                      bra.s      edit_service_7
edit_service_20:
[0003eac2] 43eb 0192                 lea.l      402(a3),a1
[0003eac6] 204c                      movea.l    a4,a0
[0003eac8] 4eb9 0008 2f0c            jsr        strcpy
[0003eace] 600e                      bra.s      edit_service_7
edit_service_9:
[0003ead0] 224c                      movea.l    a4,a1
[0003ead2] 3003                      move.w     d3,d0
[0003ead4] 204a                      movea.l    a2,a0
[0003ead6] 4eb9 0005 9dd0            jsr        Awi_service
[0003eadc] 6002                      bra.s      edit_service_28
edit_service_7:
[0003eade] 7001                      moveq.l    #1,d0
edit_service_28:
[0003eae0] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003eae4] 4e75                      rts
edit_service_21:
edit_service_24:
edit_service_22:

edit_moved:
[0003eae6] 2f0b                      move.l     a3,-(a7)
[0003eae8] 2f0c                      move.l     a4,-(a7)
[0003eaea] 594f                      subq.w     #4,a7
[0003eaec] 2648                      movea.l    a0,a3
[0003eaee] 2849                      movea.l    a1,a4
[0003eaf0] 2f39 000e 692a            move.l     _globl,-(a7)
[0003eaf6] 486f 0004                 pea.l      4(a7)
[0003eafa] 486f 0008                 pea.l      8(a7)
[0003eafe] 4267                      clr.w      -(a7)
[0003eb00] 4267                      clr.w      -(a7)
[0003eb02] 4267                      clr.w      -(a7)
[0003eb04] 43ef 0012                 lea.l      18(a7),a1
[0003eb08] 41ef 0014                 lea.l      20(a7),a0
[0003eb0c] 4242                      clr.w      d2
[0003eb0e] 322b 0022                 move.w     34(a3),d1
[0003eb12] 7001                      moveq.l    #1,d0
[0003eb14] 4eb9 0007 b8da            jsr        mt_wind_calc
[0003eb1a] 4fef 0012                 lea.l      18(a7),a7
[0003eb1e] 7008                      moveq.l    #8,d0
[0003eb20] d054                      add.w      (a4),d0
[0003eb22] c07c fff0                 and.w      #$FFF0,d0
[0003eb26] 906f 0002                 sub.w      2(a7),d0
[0003eb2a] 3880                      move.w     d0,(a4)
[0003eb2c] 224c                      movea.l    a4,a1
[0003eb2e] 204b                      movea.l    a3,a0
[0003eb30] 4eb9 0005 8d50            jsr        Awi_moved
[0003eb36] 584f                      addq.w     #4,a7
[0003eb38] 285f                      movea.l    (a7)+,a4
[0003eb3a] 265f                      movea.l    (a7)+,a3
[0003eb3c] 4e75                      rts

edit_sized:
[0003eb3e] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003eb42] 594f                      subq.w     #4,a7
[0003eb44] 2448                      movea.l    a0,a2
[0003eb46] 2a49                      movea.l    a1,a5
[0003eb48] 266a 0014                 movea.l    20(a2),a3
[0003eb4c] 286a 005e                 movea.l    94(a2),a4
[0003eb50] 2f39 000e 692a            move.l     _globl,-(a7)
[0003eb56] 486b 0016                 pea.l      22(a3)
[0003eb5a] 486b 0014                 pea.l      20(a3)
[0003eb5e] 3f2d 0006                 move.w     6(a5),-(a7)
[0003eb62] 3f2d 0004                 move.w     4(a5),-(a7)
[0003eb66] 4267                      clr.w      -(a7)
[0003eb68] 43ef 0012                 lea.l      18(a7),a1
[0003eb6c] 41ef 0014                 lea.l      20(a7),a0
[0003eb70] 4242                      clr.w      d2
[0003eb72] 322a 0022                 move.w     34(a2),d1
[0003eb76] 7001                      moveq.l    #1,d0
[0003eb78] 4eb9 0007 b8da            jsr        mt_wind_calc
[0003eb7e] 4fef 0012                 lea.l      18(a7),a7
[0003eb82] 7008                      moveq.l    #8,d0
[0003eb84] d055                      add.w      (a5),d0
[0003eb86] c07c fff0                 and.w      #$FFF0,d0
[0003eb8a] 906f 0002                 sub.w      2(a7),d0
[0003eb8e] 3a80                      move.w     d0,(a5)
[0003eb90] 220c                      move.l     a4,d1
[0003eb92] 6716                      beq.s      edit_sized_1
[0003eb94] 302c 0002                 move.w     2(a4),d0
[0003eb98] 48c0                      ext.l      d0
[0003eb9a] 2400                      move.l     d0,d2
[0003eb9c] d482                      add.l      d2,d2
[0003eb9e] d480                      add.l      d0,d2
[0003eba0] e78a                      lsl.l      #3,d2
[0003eba2] 3234 2816                 move.w     22(a4,d2.l),d1
[0003eba6] 936b 0016                 sub.w      d1,22(a3)
edit_sized_1:
[0003ebaa] 202a 0018                 move.l     24(a2),d0
[0003ebae] 670a                      beq.s      edit_sized_2
[0003ebb0] 2040                      movea.l    d0,a0
[0003ebb2] 3228 0016                 move.w     22(a0),d1
[0003ebb6] 936b 0016                 sub.w      d1,22(a3)
edit_sized_2:
[0003ebba] 93c9                      suba.l     a1,a1
[0003ebbc] 303c 00ee                 move.w     #$00EE,d0
[0003ebc0] 204b                      movea.l    a3,a0
[0003ebc2] 4eb9 0003 a772            jsr        Auo_editor
[0003ebc8] 93c9                      suba.l     a1,a1
[0003ebca] 303c 00fd                 move.w     #$00FD,d0
[0003ebce] 204b                      movea.l    a3,a0
[0003ebd0] 4eb9 0003 a772            jsr        Auo_editor
[0003ebd6] 224d                      movea.l    a5,a1
[0003ebd8] 204a                      movea.l    a2,a0
[0003ebda] 4eb9 0005 8bb0            jsr        Awi_sized
[0003ebe0] 584f                      addq.w     #4,a7
[0003ebe2] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003ebe6] 4e75                      rts

edit_vslid:
[0003ebe8] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003ebec] 554f                      subq.w     #2,a7
[0003ebee] 3e80                      move.w     d0,(a7)
[0003ebf0] 2468 0014                 movea.l    20(a0),a2
[0003ebf4] 45ea 0078                 lea.l      120(a2),a2
[0003ebf8] 266a 000c                 movea.l    12(a2),a3
[0003ebfc] 43d7                      lea.l      (a7),a1
[0003ebfe] 204a                      movea.l    a2,a0
[0003ec00] 286b 0008                 movea.l    8(a3),a4
[0003ec04] 706a                      moveq.l    #106,d0
[0003ec06] 4e94                      jsr        (a4)
[0003ec08] 93c9                      suba.l     a1,a1
[0003ec0a] 7005                      moveq.l    #5,d0
[0003ec0c] 204a                      movea.l    a2,a0
[0003ec0e] 286b 0008                 movea.l    8(a3),a4
[0003ec12] 4e94                      jsr        (a4)
[0003ec14] 93c9                      suba.l     a1,a1
[0003ec16] 7069                      moveq.l    #105,d0
[0003ec18] 204a                      movea.l    a2,a0
[0003ec1a] 286b 0008                 movea.l    8(a3),a4
[0003ec1e] 4e94                      jsr        (a4)
[0003ec20] 544f                      addq.w     #2,a7
[0003ec22] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003ec26] 4e75                      rts

Aed_copy:
[0003ec28] 323c 8463                 move.w     #$8463,d1
[0003ec2c] 4240                      clr.w      d0
[0003ec2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003ec34] 2068 0258                 movea.l    600(a0),a0
[0003ec38] 6100 e1da                 bsr        edit_key
[0003ec3c] 4e75                      rts

Aed_cut:
[0003ec3e] 323c 8478                 move.w     #$8478,d1
[0003ec42] 4240                      clr.w      d0
[0003ec44] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003ec4a] 2068 0258                 movea.l    600(a0),a0
[0003ec4e] 6100 e1c4                 bsr        edit_key
[0003ec52] 4e75                      rts

Aed_cutline:
[0003ec54] 323c 8479                 move.w     #$8479,d1
[0003ec58] 4240                      clr.w      d0
[0003ec5a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003ec60] 2068 0258                 movea.l    600(a0),a0
[0003ec64] 6100 e1ae                 bsr        edit_key
[0003ec68] 4e75                      rts

find_next:
[0003ec6a] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003ec6e] 4fef ffe0                 lea.l      -32(a7),a7
[0003ec72] 2468 0014                 movea.l    20(a0),a2
[0003ec76] 2650                      movea.l    (a0),a3
[0003ec78] 4beb 0296                 lea.l      662(a3),a5
[0003ec7c] 1015                      move.b     (a5),d0
[0003ec7e] 6700 0108                 beq        find_next_1
[0003ec82] 7204                      moveq.l    #4,d1
[0003ec84] c26b 0294                 and.w      660(a3),d1
[0003ec88] 6710                      beq.s      find_next_2
[0003ec8a] 93c9                      suba.l     a1,a1
[0003ec8c] 204a                      movea.l    a2,a0
[0003ec8e] 303c 00f3                 move.w     #$00F3,d0
[0003ec92] 4eb9 0003 a772            jsr        Auo_editor
[0003ec98] 600e                      bra.s      find_next_3
find_next_2:
[0003ec9a] 93c9                      suba.l     a1,a1
[0003ec9c] 303c 00f4                 move.w     #$00F4,d0
[0003eca0] 204a                      movea.l    a2,a0
[0003eca2] 4eb9 0003 a772            jsr        Auo_editor
find_next_3:
[0003eca8] 7001                      moveq.l    #1,d0
[0003ecaa] c06b 0294                 and.w      660(a3),d0
[0003ecae] 6710                      beq.s      find_next_4
[0003ecb0] 93c9                      suba.l     a1,a1
[0003ecb2] 204a                      movea.l    a2,a0
[0003ecb4] 303c 00f6                 move.w     #$00F6,d0
[0003ecb8] 4eb9 0003 a772            jsr        Auo_editor
[0003ecbe] 600e                      bra.s      find_next_5
find_next_4:
[0003ecc0] 93c9                      suba.l     a1,a1
[0003ecc2] 303c 00f5                 move.w     #$00F5,d0
[0003ecc6] 204a                      movea.l    a2,a0
[0003ecc8] 4eb9 0003 a772            jsr        Auo_editor
find_next_5:
[0003ecce] 7002                      moveq.l    #2,d0
[0003ecd0] c06b 0294                 and.w      660(a3),d0
[0003ecd4] 6710                      beq.s      find_next_6
[0003ecd6] 93c9                      suba.l     a1,a1
[0003ecd8] 204a                      movea.l    a2,a0
[0003ecda] 303c 00f7                 move.w     #$00F7,d0
[0003ecde] 4eb9 0003 a772            jsr        Auo_editor
[0003ece4] 600e                      bra.s      find_next_7
find_next_6:
[0003ece6] 93c9                      suba.l     a1,a1
[0003ece8] 303c 00f8                 move.w     #$00F8,d0
[0003ecec] 204a                      movea.l    a2,a0
[0003ecee] 4eb9 0003 a772            jsr        Auo_editor
find_next_7:
[0003ecf4] 93c9                      suba.l     a1,a1
[0003ecf6] 303c 00d5                 move.w     #$00D5,d0
[0003ecfa] 204a                      movea.l    a2,a0
[0003ecfc] 4eb9 0003 a772            jsr        Auo_editor
[0003ed02] 49ef 0010                 lea.l      16(a7),a4
[0003ed06] 224c                      movea.l    a4,a1
[0003ed08] 303c 00e3                 move.w     #$00E3,d0
[0003ed0c] 204a                      movea.l    a2,a0
[0003ed0e] 4eb9 0003 a772            jsr        Auo_editor
[0003ed14] 224d                      movea.l    a5,a1
[0003ed16] 303c 00f2                 move.w     #$00F2,d0
[0003ed1a] 204a                      movea.l    a2,a0
[0003ed1c] 4eb9 0003 a772            jsr        Auo_editor
[0003ed22] 43d7                      lea.l      (a7),a1
[0003ed24] 303c 00e3                 move.w     #$00E3,d0
[0003ed28] 204a                      movea.l    a2,a0
[0003ed2a] 4eb9 0003 a772            jsr        Auo_editor
[0003ed30] 2017                      move.l     (a7),d0
[0003ed32] 6b24                      bmi.s      find_next_8
[0003ed34] 2214                      move.l     (a4),d1
[0003ed36] b280                      cmp.l      d0,d1
[0003ed38] 6626                      bne.s      find_next_9
[0003ed3a] 242c 0004                 move.l     4(a4),d2
[0003ed3e] b4af 0004                 cmp.l      4(a7),d2
[0003ed42] 661c                      bne.s      find_next_9
[0003ed44] 206c 0008                 movea.l    8(a4),a0
[0003ed48] b1ef 0008                 cmpa.l     8(a7),a0
[0003ed4c] 6612                      bne.s      find_next_9
[0003ed4e] 226c 000c                 movea.l    12(a4),a1
[0003ed52] b3ef 000c                 cmpa.l     12(a7),a1
[0003ed56] 6608                      bne.s      find_next_9
find_next_8:
[0003ed58] 0a6b 0004 0294            eori.w     #$0004,660(a3)
[0003ed5e] 601a                      bra.s      find_next_10
find_next_9:
[0003ed60] 93c9                      suba.l     a1,a1
[0003ed62] 303c 00db                 move.w     #$00DB,d0
[0003ed66] 204a                      movea.l    a2,a0
[0003ed68] 4eb9 0003 a772            jsr        Auo_editor
[0003ed6e] 93c9                      suba.l     a1,a1
[0003ed70] 7005                      moveq.l    #5,d0
[0003ed72] 204a                      movea.l    a2,a0
[0003ed74] 4eb9 0003 a772            jsr        Auo_editor
find_next_10:
[0003ed7a] 93c9                      suba.l     a1,a1
[0003ed7c] 303c 00d6                 move.w     #$00D6,d0
[0003ed80] 204a                      movea.l    a2,a0
[0003ed82] 4eb9 0003 a772            jsr        Auo_editor
find_next_1:
[0003ed88] 4fef 0020                 lea.l      32(a7),a7
[0003ed8c] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003ed90] 4e75                      rts

Aed_find:
[0003ed92] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003ed96] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003ed9c] 2468 0258                 movea.l    600(a0),a2
[0003eda0] 2652                      movea.l    (a2),a3
[0003eda2] 49f9 000d 3576            lea.l      WIED_FIND,a4
[0003eda8] 204c                      movea.l    a4,a0
[0003edaa] 226c 0008                 movea.l    8(a4),a1
[0003edae] 4e91                      jsr        (a1)
[0003edb0] 2a48                      movea.l    a0,a5
[0003edb2] 200d                      move.l     a5,d0
[0003edb4] 6700 00c8                 beq        Aed_find_1
[0003edb8] 43eb 0296                 lea.l      662(a3),a1
[0003edbc] 206d 0014                 movea.l    20(a5),a0
[0003edc0] 7003                      moveq.l    #3,d0
[0003edc2] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003edc8] 7002                      moveq.l    #2,d0
[0003edca] c06b 0294                 and.w      660(a3),d0
[0003edce] 206d 0014                 movea.l    20(a5),a0
[0003edd2] 41e8 00d8                 lea.l      216(a0),a0
[0003edd6] 6100 df8a                 bsr        set_select
[0003edda] 7004                      moveq.l    #4,d0
[0003eddc] c06b 0294                 and.w      660(a3),d0
[0003ede0] 206d 0014                 movea.l    20(a5),a0
[0003ede4] 41e8 0078                 lea.l      120(a0),a0
[0003ede8] 6100 df78                 bsr        set_select
[0003edec] 7001                      moveq.l    #1,d0
[0003edee] c06b 0294                 and.w      660(a3),d0
[0003edf2] 206d 0014                 movea.l    20(a5),a0
[0003edf6] 41e8 00a8                 lea.l      168(a0),a0
[0003edfa] 6100 df66                 bsr        set_select
[0003edfe] 204d                      movea.l    a5,a0
[0003ee00] 4eb9 0005 9df4            jsr        Awi_dialog
[0003ee06] b07c 000b                 cmp.w      #$000B,d0
[0003ee0a] 666a                      bne.s      Aed_find_2
[0003ee0c] 43eb 0296                 lea.l      662(a3),a1
[0003ee10] 7003                      moveq.l    #3,d0
[0003ee12] 206d 0014                 movea.l    20(a5),a0
[0003ee16] 4eb9 0005 11da            jsr        Aob_gettext
[0003ee1c] 4a40                      tst.w      d0
[0003ee1e] 6756                      beq.s      Aed_find_2
[0003ee20] 43eb 0296                 lea.l      662(a3),a1
[0003ee24] 41ec 0634                 lea.l      1588(a4),a0
[0003ee28] 4eb9 0008 2f0c            jsr        strcpy
[0003ee2e] 026b fff8 0294            andi.w     #$FFF8,660(a3)
[0003ee34] 7001                      moveq.l    #1,d0
[0003ee36] 206d 0014                 movea.l    20(a5),a0
[0003ee3a] c068 00e2                 and.w      226(a0),d0
[0003ee3e] 6706                      beq.s      Aed_find_3
[0003ee40] 006b 0002 0294            ori.w      #$0002,660(a3)
Aed_find_3:
[0003ee46] 7001                      moveq.l    #1,d0
[0003ee48] 206d 0014                 movea.l    20(a5),a0
[0003ee4c] c068 0082                 and.w      130(a0),d0
[0003ee50] 6706                      beq.s      Aed_find_4
[0003ee52] 006b 0004 0294            ori.w      #$0004,660(a3)
Aed_find_4:
[0003ee58] 7001                      moveq.l    #1,d0
[0003ee5a] 206d 0014                 movea.l    20(a5),a0
[0003ee5e] c068 00b2                 and.w      178(a0),d0
[0003ee62] 6706                      beq.s      Aed_find_5
[0003ee64] 006b 0001 0294            ori.w      #$0001,660(a3)
Aed_find_5:
[0003ee6a] 396b 0294 0632            move.w     660(a3),1586(a4)
[0003ee70] 204a                      movea.l    a2,a0
[0003ee72] 6100 fdf6                 bsr        find_next
Aed_find_2:
[0003ee76] 204d                      movea.l    a5,a0
[0003ee78] 4eb9 0005 85f2            jsr        Awi_delete
Aed_find_1:
[0003ee7e] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003ee82] 4e75                      rts

Aed_findnext:
[0003ee84] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003ee8a] 2068 0258                 movea.l    600(a0),a0
[0003ee8e] 6100 fdda                 bsr        find_next
[0003ee92] 4e75                      rts

Aed_findsel:
[0003ee94] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003ee98] 4fef ffe4                 lea.l      -28(a7),a7
[0003ee9c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003eea2] 2468 0258                 movea.l    600(a0),a2
[0003eea6] 266a 0014                 movea.l    20(a2),a3
[0003eeaa] 2852                      movea.l    (a2),a4
[0003eeac] 43d7                      lea.l      (a7),a1
[0003eeae] 303c 00e3                 move.w     #$00E3,d0
[0003eeb2] 204b                      movea.l    a3,a0
[0003eeb4] 4eb9 0003 a772            jsr        Auo_editor
[0003eeba] 2017                      move.l     (a7),d0
[0003eebc] 6a2c                      bpl.s      Aed_findsel_1
[0003eebe] 93c9                      suba.l     a1,a1
[0003eec0] 204b                      movea.l    a3,a0
[0003eec2] 303c 00d5                 move.w     #$00D5,d0
[0003eec6] 4eb9 0003 a772            jsr        Auo_editor
[0003eecc] 93c9                      suba.l     a1,a1
[0003eece] 303c 00fc                 move.w     #$00FC,d0
[0003eed2] 204b                      movea.l    a3,a0
[0003eed4] 4eb9 0003 a772            jsr        Auo_editor
[0003eeda] 93c9                      suba.l     a1,a1
[0003eedc] 303c 00d6                 move.w     #$00D6,d0
[0003eee0] 204b                      movea.l    a3,a0
[0003eee2] 4eb9 0003 a772            jsr        Auo_editor
[0003eee8] 6044                      bra.s      Aed_findsel_2
Aed_findsel_1:
[0003eeea] 4bef 0010                 lea.l      16(a7),a5
[0003eeee] 2a97                      move.l     (a7),(a5)
[0003eef0] 224d                      movea.l    a5,a1
[0003eef2] 303c 00ca                 move.w     #$00CA,d0
[0003eef6] 204b                      movea.l    a3,a0
[0003eef8] 4eb9 0003 a772            jsr        Auo_editor
[0003eefe] 263c 0000 00ff            move.l     #$000000FF,d3
[0003ef04] 202d 0004                 move.l     4(a5),d0
[0003ef08] 6f24                      ble.s      Aed_findsel_2
[0003ef0a] b680                      cmp.l      d0,d3
[0003ef0c] 6f02                      ble.s      Aed_findsel_3
[0003ef0e] 2600                      move.l     d0,d3
Aed_findsel_3:
[0003ef10] 2003                      move.l     d3,d0
[0003ef12] 226d 0008                 movea.l    8(a5),a1
[0003ef16] 41ec 0296                 lea.l      662(a4),a0
[0003ef1a] 4eb9 0008 2fd6            jsr        strncpy
[0003ef20] 41f4 3800                 lea.l      0(a4,d3.l),a0
[0003ef24] 4228 0296                 clr.b      662(a0)
[0003ef28] 204a                      movea.l    a2,a0
[0003ef2a] 6100 fd3e                 bsr        find_next
Aed_findsel_2:
[0003ef2e] 4fef 001c                 lea.l      28(a7),a7
[0003ef32] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003ef36] 4e75                      rts

Aed_font:
[0003ef38] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0003ef3c] 4fef fff4                 lea.l      -12(a7),a7
[0003ef40] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003ef46] 2468 0258                 movea.l    600(a0),a2
[0003ef4a] 2652                      movea.l    (a2),a3
[0003ef4c] 4243                      clr.w      d3
[0003ef4e] 49ef 0006                 lea.l      6(a7),a4
[0003ef52] 2f39 000e 692a            move.l     _globl,-(a7)
[0003ef58] 486f 0008                 pea.l      8(a7)
[0003ef5c] 4854                      pea.l      (a4)
[0003ef5e] 224c                      movea.l    a4,a1
[0003ef60] 204c                      movea.l    a4,a0
[0003ef62] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0003ef68] 4fef 000c                 lea.l      12(a7),a7
[0003ef6c] 7003                      moveq.l    #3,d0
[0003ef6e] c06f 0004                 and.w      4(a7),d0
[0003ef72] 6600 0084                 bne        Aed_font_1
[0003ef76] 41ef 0008                 lea.l      8(a7),a0
[0003ef7a] 203c 7846 534c            move.l     #$7846534C,d0
[0003ef80] 4eb9 0008 0ec4            jsr        Ash_getc
[0003ef86] 4a40                      tst.w      d0
[0003ef88] 676e                      beq.s      Aed_font_1
[0003ef8a] 3f6b 017c 0002            move.w     380(a3),2(a7)
[0003ef90] 3eab 017e                 move.w     382(a3),(a7)
[0003ef94] 4857                      pea.l      (a7)
[0003ef96] 486f 0006                 pea.l      6(a7)
[0003ef9a] 4879 000d 4a13            pea.l      $000D4A13
[0003efa0] 3f3c 00fb                 move.w     #$00FB,-(a7)
[0003efa4] 4267                      clr.w      -(a7)
[0003efa6] 206f 0018                 movea.l    24(a7),a0
[0003efaa] 2068 000c                 movea.l    12(a0),a0
[0003efae] 4e90                      jsr        (a0)
[0003efb0] 4fef 0010                 lea.l      16(a7),a7
[0003efb4] 3800                      move.w     d0,d4
[0003efb6] 4a40                      tst.w      d0
[0003efb8] 6b3c                      bmi.s      Aed_font_2
[0003efba] 7601                      moveq.l    #1,d3
[0003efbc] 376f 0002 017c            move.w     2(a7),380(a3)
[0003efc2] 322f 0002                 move.w     2(a7),d1
[0003efc6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003efcc] 3028 0010                 move.w     16(a0),d0
[0003efd0] 4eb9 0007 34e6            jsr        vst_font
[0003efd6] 4854                      pea.l      (a4)
[0003efd8] 4854                      pea.l      (a4)
[0003efda] 43eb 017e                 lea.l      382(a3),a1
[0003efde] 204c                      movea.l    a4,a0
[0003efe0] 322f 0008                 move.w     8(a7),d1
[0003efe4] 2a79 0010 ee4e            movea.l    ACSblk,a5
[0003efea] 302d 0010                 move.w     16(a5),d0
[0003efee] 4eb9 0007 3402            jsr        vst_point
[0003eff4] 504f                      addq.w     #8,a7
Aed_font_2:
[0003eff6] 5344                      subq.w     #1,d4
Aed_font_1:
[0003eff8] 4a43                      tst.w      d3
[0003effa] 6612                      bne.s      Aed_font_3
[0003effc] 4240                      clr.w      d0
[0003effe] 43eb 017e                 lea.l      382(a3),a1
[0003f002] 41eb 017c                 lea.l      380(a3),a0
[0003f006] 4eb9 0004 10c8            jsr        A_fontsel
[0003f00c] 3800                      move.w     d0,d4
Aed_font_3:
[0003f00e] 4a44                      tst.w      d4
[0003f010] 6600 008e                 bne        Aed_font_4
[0003f014] 33eb 017c 000d 3a90       move.w     380(a3),$000D3A90
[0003f01c] 33eb 017e 000d 3a92       move.w     382(a3),$000D3A92
[0003f024] 286a 0014                 movea.l    20(a2),a4
[0003f028] 93c9                      suba.l     a1,a1
[0003f02a] 303c 00d5                 move.w     #$00D5,d0
[0003f02e] 204c                      movea.l    a4,a0
[0003f030] 4eb9 0003 a772            jsr        Auo_editor
[0003f036] 93c9                      suba.l     a1,a1
[0003f038] 303c 00db                 move.w     #$00DB,d0
[0003f03c] 204c                      movea.l    a4,a0
[0003f03e] 4eb9 0003 a772            jsr        Auo_editor
[0003f044] 43eb 017c                 lea.l      380(a3),a1
[0003f048] 303c 00cf                 move.w     #$00CF,d0
[0003f04c] 204c                      movea.l    a4,a0
[0003f04e] 4eb9 0003 a772            jsr        Auo_editor
[0003f054] 43eb 017e                 lea.l      382(a3),a1
[0003f058] 303c 00d0                 move.w     #$00D0,d0
[0003f05c] 204c                      movea.l    a4,a0
[0003f05e] 4eb9 0003 a772            jsr        Auo_editor
[0003f064] 93c9                      suba.l     a1,a1
[0003f066] 303c 00ee                 move.w     #$00EE,d0
[0003f06a] 204c                      movea.l    a4,a0
[0003f06c] 4eb9 0003 a772            jsr        Auo_editor
[0003f072] 93c9                      suba.l     a1,a1
[0003f074] 303c 00fd                 move.w     #$00FD,d0
[0003f078] 204c                      movea.l    a4,a0
[0003f07a] 4eb9 0003 a772            jsr        Auo_editor
[0003f080] 93c9                      suba.l     a1,a1
[0003f082] 303c 00d6                 move.w     #$00D6,d0
[0003f086] 204c                      movea.l    a4,a0
[0003f088] 4eb9 0003 a772            jsr        Auo_editor
[0003f08e] 006a 0010 0056            ori.w      #$0010,86(a2)
[0003f094] 43ea 0024                 lea.l      36(a2),a1
[0003f098] 204a                      movea.l    a2,a0
[0003f09a] 4eb9 0005 8bb0            jsr        Awi_sized
Aed_font_4:
[0003f0a0] 4fef 000c                 lea.l      12(a7),a7
[0003f0a4] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0003f0a8] 4e75                      rts

Aed_gotoline:
[0003f0aa] 2f0a                      move.l     a2,-(a7)
[0003f0ac] 2f0b                      move.l     a3,-(a7)
[0003f0ae] 594f                      subq.w     #4,a7
[0003f0b0] 41f9 000d 3618            lea.l      WIED_GOTOLINE,a0
[0003f0b6] 2279 000d 3620            movea.l    $000D3620,a1
[0003f0bc] 4e91                      jsr        (a1)
[0003f0be] 2448                      movea.l    a0,a2
[0003f0c0] 200a                      move.l     a2,d0
[0003f0c2] 6700 00b8                 beq        Aed_gotoline_1
[0003f0c6] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003f0cc] 2069 0258                 movea.l    600(a1),a0
[0003f0d0] 2668 0014                 movea.l    20(a0),a3
[0003f0d4] 43d7                      lea.l      (a7),a1
[0003f0d6] 303c 00d8                 move.w     #$00D8,d0
[0003f0da] 204b                      movea.l    a3,a0
[0003f0dc] 4eb9 0003 a772            jsr        Auo_editor
[0003f0e2] 7001                      moveq.l    #1,d0
[0003f0e4] d097                      add.l      (a7),d0
[0003f0e6] 2f00                      move.l     d0,-(a7)
[0003f0e8] 43f9 000d 4a1b            lea.l      $000D4A1B,a1
[0003f0ee] 206a 0014                 movea.l    20(a2),a0
[0003f0f2] 7004                      moveq.l    #4,d0
[0003f0f4] 4eb9 0005 0f94            jsr        Aob_printf
[0003f0fa] 584f                      addq.w     #4,a7
[0003f0fc] 204a                      movea.l    a2,a0
[0003f0fe] 4eb9 0005 9df4            jsr        Awi_dialog
[0003f104] 5b40                      subq.w     #5,d0
[0003f106] 666c                      bne.s      Aed_gotoline_2
[0003f108] 4857                      pea.l      (a7)
[0003f10a] 43f9 000d 4a1b            lea.l      $000D4A1B,a1
[0003f110] 7004                      moveq.l    #4,d0
[0003f112] 206a 0014                 movea.l    20(a2),a0
[0003f116] 4eb9 0005 10fe            jsr        Aob_scanf
[0003f11c] 584f                      addq.w     #4,a7
[0003f11e] 2017                      move.l     (a7),d0
[0003f120] 6f02                      ble.s      Aed_gotoline_3
[0003f122] 5397                      subq.l     #1,(a7)
Aed_gotoline_3:
[0003f124] 93c9                      suba.l     a1,a1
[0003f126] 303c 00d5                 move.w     #$00D5,d0
[0003f12a] 204b                      movea.l    a3,a0
[0003f12c] 4eb9 0003 a772            jsr        Auo_editor
[0003f132] 93c9                      suba.l     a1,a1
[0003f134] 303c 00e2                 move.w     #$00E2,d0
[0003f138] 204b                      movea.l    a3,a0
[0003f13a] 4eb9 0003 a772            jsr        Auo_editor
[0003f140] 43d7                      lea.l      (a7),a1
[0003f142] 7011                      moveq.l    #17,d0
[0003f144] 204b                      movea.l    a3,a0
[0003f146] 4eb9 0003 a772            jsr        Auo_editor
[0003f14c] 93c9                      suba.l     a1,a1
[0003f14e] 303c 00db                 move.w     #$00DB,d0
[0003f152] 204b                      movea.l    a3,a0
[0003f154] 4eb9 0003 a772            jsr        Auo_editor
[0003f15a] 93c9                      suba.l     a1,a1
[0003f15c] 7005                      moveq.l    #5,d0
[0003f15e] 204b                      movea.l    a3,a0
[0003f160] 4eb9 0003 a772            jsr        Auo_editor
[0003f166] 93c9                      suba.l     a1,a1
[0003f168] 303c 00d6                 move.w     #$00D6,d0
[0003f16c] 204b                      movea.l    a3,a0
[0003f16e] 4eb9 0003 a772            jsr        Auo_editor
Aed_gotoline_2:
[0003f174] 204a                      movea.l    a2,a0
[0003f176] 4eb9 0005 85f2            jsr        Awi_delete
Aed_gotoline_1:
[0003f17c] 584f                      addq.w     #4,a7
[0003f17e] 265f                      movea.l    (a7)+,a3
[0003f180] 245f                      movea.l    (a7)+,a2
[0003f182] 4e75                      rts

Aed_info:
[0003f184] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0003f188] 4fef ffdc                 lea.l      -36(a7),a7
[0003f18c] 41f9 000d 36ba            lea.l      WIED_INFO,a0
[0003f192] 2279 000d 36c2            movea.l    $000D36C2,a1
[0003f198] 4e91                      jsr        (a1)
[0003f19a] 2448                      movea.l    a0,a2
[0003f19c] 200a                      move.l     a2,d0
[0003f19e] 6700 00c0                 beq        Aed_info_1
[0003f1a2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003f1a8] 2069 0258                 movea.l    600(a1),a0
[0003f1ac] 2668 0014                 movea.l    20(a0),a3
[0003f1b0] 43ef 0014                 lea.l      20(a7),a1
[0003f1b4] 303c 00e3                 move.w     #$00E3,d0
[0003f1b8] 204b                      movea.l    a3,a0
[0003f1ba] 4eb9 0003 a772            jsr        Auo_editor
[0003f1c0] 49ef 0004                 lea.l      4(a7),a4
[0003f1c4] 202f 0014                 move.l     20(a7),d0
[0003f1c8] 6a1e                      bpl.s      Aed_info_2
[0003f1ca] 43d7                      lea.l      (a7),a1
[0003f1cc] 204b                      movea.l    a3,a0
[0003f1ce] 303c 00e9                 move.w     #$00E9,d0
[0003f1d2] 4eb9 0003 a772            jsr        Auo_editor
[0003f1d8] 224c                      movea.l    a4,a1
[0003f1da] 303c 00fb                 move.w     #$00FB,d0
[0003f1de] 204b                      movea.l    a3,a0
[0003f1e0] 4eb9 0003 a772            jsr        Auo_editor
[0003f1e6] 603c                      bra.s      Aed_info_3
Aed_info_2:
[0003f1e8] 202f 0014                 move.l     20(a7),d0
[0003f1ec] 262f 001c                 move.l     28(a7),d3
[0003f1f0] 2203                      move.l     d3,d1
[0003f1f2] 9280                      sub.l      d0,d1
[0003f1f4] 5281                      addq.l     #1,d1
[0003f1f6] 2e81                      move.l     d1,(a7)
[0003f1f8] 28bc ffff fffe            move.l     #$FFFFFFFE,(a4)
[0003f1fe] 2800                      move.l     d0,d4
[0003f200] 4bef 0008                 lea.l      8(a7),a5
[0003f204] 601a                      bra.s      Aed_info_4
[0003f206] 2a84                      move.l     d4,(a5)
Aed_info_5:
[0003f208] 224d                      movea.l    a5,a1
[0003f20a] 303c 00ca                 move.w     #$00CA,d0
[0003f20e] 204b                      movea.l    a3,a0
[0003f210] 4eb9 0003 a772            jsr        Auo_editor
[0003f216] 7002                      moveq.l    #2,d0
[0003f218] d0ad 0004                 add.l      4(a5),d0
[0003f21c] d194                      add.l      d0,(a4)
[0003f21e] 5284                      addq.l     #1,d4
Aed_info_4:
[0003f220] b684                      cmp.l      d4,d3
[0003f222] 6ce2                      bge.s      Aed_info_5
Aed_info_3:
[0003f224] 2f17                      move.l     (a7),-(a7)
[0003f226] 43f9 000d 4a1b            lea.l      $000D4A1B,a1
[0003f22c] 7004                      moveq.l    #4,d0
[0003f22e] 206a 0014                 movea.l    20(a2),a0
[0003f232] 4eb9 0005 0f94            jsr        Aob_printf
[0003f238] 584f                      addq.w     #4,a7
[0003f23a] 2f14                      move.l     (a4),-(a7)
[0003f23c] 43f9 000d 4a1b            lea.l      $000D4A1B,a1
[0003f242] 7006                      moveq.l    #6,d0
[0003f244] 206a 0014                 movea.l    20(a2),a0
[0003f248] 4eb9 0005 0f94            jsr        Aob_printf
[0003f24e] 584f                      addq.w     #4,a7
[0003f250] 204a                      movea.l    a2,a0
[0003f252] 4eb9 0005 9df4            jsr        Awi_dialog
[0003f258] 204a                      movea.l    a2,a0
[0003f25a] 4eb9 0005 85f2            jsr        Awi_delete
Aed_info_1:
[0003f260] 4fef 0024                 lea.l      36(a7),a7
[0003f264] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[0003f268] 4e75                      rts

put_block:
[0003f26a] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[0003f26e] 4fef ffdc                 lea.l      -36(a7),a7
[0003f272] 2448                      movea.l    a0,a2
[0003f274] 2f49 0020                 move.l     a1,32(a7)
[0003f278] 2600                      move.l     d0,d3
[0003f27a] 4a80                      tst.l      d0
[0003f27c] 6f00 00aa                 ble        put_block_1
[0003f280] 4231 0800                 clr.b      0(a1,d0.l)
[0003f284] e588                      lsl.l      #2,d0
[0003f286] 4eb9 0004 c608            jsr        Ax_malloc
[0003f28c] 2648                      movea.l    a0,a3
[0003f28e] 200b                      move.l     a3,d0
[0003f290] 6700 0096                 beq        put_block_1
[0003f294] 49ef 0008                 lea.l      8(a7),a4
[0003f298] 294b 0014                 move.l     a3,20(a4)
[0003f29c] 7801                      moveq.l    #1,d4
[0003f29e] 206f 0020                 movea.l    32(a7),a0
[0003f2a2] 224b                      movea.l    a3,a1
[0003f2a4] 22c8                      move.l     a0,(a1)+
[0003f2a6] 6030                      bra.s      put_block_2
[0003f2a8] 0c10 000d                 cmpi.b     #$0D,(a0)
put_block_6:
[0003f2ac] 6612                      bne.s      put_block_3
[0003f2ae] 4210                      clr.b      (a0)
[0003f2b0] 7001                      moveq.l    #1,d0
[0003f2b2] b083                      cmp.l      d3,d0
[0003f2b4] 6c1a                      bge.s      put_block_4
[0003f2b6] 0c28 000a 0001            cmpi.b     #$0A,1(a0)
[0003f2bc] 6712                      beq.s      put_block_4
[0003f2be] 6006                      bra.s      put_block_5
put_block_3:
[0003f2c0] 0c10 000a                 cmpi.b     #$0A,(a0)
[0003f2c4] 660a                      bne.s      put_block_4
put_block_5:
[0003f2c6] 4218                      clr.b      (a0)+
[0003f2c8] 5284                      addq.l     #1,d4
[0003f2ca] 22c8                      move.l     a0,(a1)+
[0003f2cc] 5383                      subq.l     #1,d3
[0003f2ce] 6008                      bra.s      put_block_2
put_block_4:
[0003f2d0] 5248                      addq.w     #1,a0
[0003f2d2] 5383                      subq.l     #1,d3
[0003f2d4] 4a83                      tst.l      d3
[0003f2d6] 6ed0                      bgt.s      put_block_6
put_block_2:
[0003f2d8] 4a83                      tst.l      d3
[0003f2da] 6ecc                      bgt.s      put_block_6
[0003f2dc] 43d7                      lea.l      (a7),a1
[0003f2de] 303c 00e7                 move.w     #$00E7,d0
[0003f2e2] 204a                      movea.l    a2,a0
[0003f2e4] 4eb9 0003 a772            jsr        Auo_editor
[0003f2ea] 43ef 0004                 lea.l      4(a7),a1
[0003f2ee] 303c 00d8                 move.w     #$00D8,d0
[0003f2f2] 204a                      movea.l    a2,a0
[0003f2f4] 4eb9 0003 a772            jsr        Auo_editor
[0003f2fa] 202f 0004                 move.l     4(a7),d0
[0003f2fe] 2940 0008                 move.l     d0,8(a4)
[0003f302] 2880                      move.l     d0,(a4)
[0003f304] 2217                      move.l     (a7),d1
[0003f306] 2941 000c                 move.l     d1,12(a4)
[0003f30a] 2941 0004                 move.l     d1,4(a4)
[0003f30e] 2944 0010                 move.l     d4,16(a4)
[0003f312] 224c                      movea.l    a4,a1
[0003f314] 303c 00ea                 move.w     #$00EA,d0
[0003f318] 204a                      movea.l    a2,a0
[0003f31a] 4eb9 0003 a772            jsr        Auo_editor
[0003f320] 204b                      movea.l    a3,a0
[0003f322] 4eb9 0004 c6c8            jsr        Ax_ifree
put_block_1:
[0003f328] 4fef 0024                 lea.l      36(a7),a7
[0003f32c] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0003f330] 4e75                      rts

merge:
[0003f332] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[0003f336] 2448                      movea.l    a0,a2
[0003f338] 3600                      move.w     d0,d3
[0003f33a] 93c9                      suba.l     a1,a1
[0003f33c] 303c 00e0                 move.w     #$00E0,d0
[0003f340] 4eb9 0003 a772            jsr        Auo_editor
[0003f346] 47f9 0010 ce40            lea.l      buffer,a3
merge_2:
[0003f34c] 204b                      movea.l    a3,a0
[0003f34e] 223c 0000 2000            move.l     #$00002000,d1
[0003f354] 3003                      move.w     d3,d0
[0003f356] 4eb9 0008 0cd2            jsr        Fread
[0003f35c] 2800                      move.l     d0,d4
[0003f35e] 4a80                      tst.l      d0
[0003f360] 6f0a                      ble.s      merge_1
[0003f362] 224b                      movea.l    a3,a1
[0003f364] 204a                      movea.l    a2,a0
[0003f366] 6100 ff02                 bsr        put_block
[0003f36a] 60da                      bra.s      merge_2
merge_1:
[0003f36c] 3003                      move.w     d3,d0
[0003f36e] 4eb9 0008 0c7e            jsr        Fclose
[0003f374] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[0003f378] 4e75                      rts

open_file:
[0003f37a] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003f37e] 2448                      movea.l    a0,a2
[0003f380] 2a49                      movea.l    a1,a5
[0003f382] 2650                      movea.l    (a0),a3
[0003f384] 286a 0014                 movea.l    20(a2),a4
[0003f388] 4240                      clr.w      d0
[0003f38a] 2049                      movea.l    a1,a0
[0003f38c] 4eb9 0008 0cc0            jsr        Fopen
[0003f392] 2600                      move.l     d0,d3
[0003f394] 93c9                      suba.l     a1,a1
[0003f396] 204c                      movea.l    a4,a0
[0003f398] 303c 00d5                 move.w     #$00D5,d0
[0003f39c] 4eb9 0003 a772            jsr        Auo_editor
[0003f3a2] 93c9                      suba.l     a1,a1
[0003f3a4] 303c 00ce                 move.w     #$00CE,d0
[0003f3a8] 204c                      movea.l    a4,a0
[0003f3aa] 4eb9 0003 a772            jsr        Auo_editor
[0003f3b0] 4a83                      tst.l      d3
[0003f3b2] 6f0a                      ble.s      open_file_1
[0003f3b4] 2003                      move.l     d3,d0
[0003f3b6] 204c                      movea.l    a4,a0
[0003f3b8] 6100 ff78                 bsr        merge
[0003f3bc] 600e                      bra.s      open_file_2
open_file_1:
[0003f3be] 43f9 000d 4a1f            lea.l      $000D4A1F,a1
[0003f3c4] 204a                      movea.l    a2,a0
[0003f3c6] 4eb9 0004 0696            jsr        info_string
open_file_2:
[0003f3cc] 93c9                      suba.l     a1,a1
[0003f3ce] 7006                      moveq.l    #6,d0
[0003f3d0] 204c                      movea.l    a4,a0
[0003f3d2] 4eb9 0003 a772            jsr        Auo_editor
[0003f3d8] 93c9                      suba.l     a1,a1
[0003f3da] 303c 00d6                 move.w     #$00D6,d0
[0003f3de] 204c                      movea.l    a4,a0
[0003f3e0] 4eb9 0003 a772            jsr        Auo_editor
[0003f3e6] 204c                      movea.l    a4,a0
[0003f3e8] 6100 d91c                 bsr        home
[0003f3ec] 224d                      movea.l    a5,a1
[0003f3ee] 41eb 0192                 lea.l      402(a3),a0
[0003f3f2] 4eb9 0008 2f0c            jsr        strcpy
[0003f3f8] 204a                      movea.l    a2,a0
[0003f3fa] 6100 d87a                 bsr        set_icon
[0003f3fe] 204a                      movea.l    a2,a0
[0003f400] 6100 d974                 bsr        undirty
[0003f404] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003f408] 4e75                      rts

Aed_open:
[0003f40a] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003f40e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003f414] 2468 0258                 movea.l    600(a0),a2
[0003f418] 2652                      movea.l    (a2),a3
[0003f41a] 303c 0080                 move.w     #$0080,d0
[0003f41e] c06b 0294                 and.w      660(a3),d0
[0003f422] 672e                      beq.s      Aed_open_1
[0003f424] 43eb 00b8                 lea.l      184(a3),a1
[0003f428] 41f9 000d 0530            lea.l      WARN_2SAVED,a0
[0003f42e] 4eb9 0006 b80c            jsr        alert_str
[0003f434] 5340                      subq.w     #1,d0
[0003f436] 6706                      beq.s      Aed_open_2
[0003f438] 5540                      subq.w     #2,d0
[0003f43a] 6738                      beq.s      Aed_open_3
[0003f43c] 6014                      bra.s      Aed_open_1
Aed_open_2:
[0003f43e] 006b 0100 0294            ori.w      #$0100,660(a3)
[0003f444] 204a                      movea.l    a2,a0
[0003f446] 4eb9 0003 fac2            jsr        ed_save
[0003f44c] 026b feff 0294            andi.w     #$FEFF,660(a3)
Aed_open_1:
[0003f452] 486b 0182                 pea.l      386(a3)
[0003f456] 43eb 0192                 lea.l      402(a3),a1
[0003f45a] 41eb 0008                 lea.l      8(a3),a0
[0003f45e] 4eb9 0006 cefe            jsr        Af_select
[0003f464] 584f                      addq.w     #4,a7
[0003f466] 2848                      movea.l    a0,a4
[0003f468] 200c                      move.l     a4,d0
[0003f46a] 6708                      beq.s      Aed_open_3
[0003f46c] 224c                      movea.l    a4,a1
[0003f46e] 204a                      movea.l    a2,a0
[0003f470] 6100 ff08                 bsr        open_file
Aed_open_3:
[0003f474] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003f478] 4e75                      rts

merge_it:
[0003f47a] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0003f47e] 4fef fff0                 lea.l      -16(a7),a7
[0003f482] 2448                      movea.l    a0,a2
[0003f484] 2649                      movea.l    a1,a3
[0003f486] 4240                      clr.w      d0
[0003f488] 2049                      movea.l    a1,a0
[0003f48a] 4eb9 0008 0cc0            jsr        Fopen
[0003f490] 2600                      move.l     d0,d3
[0003f492] 6b00 00a4                 bmi        merge_it_1
[0003f496] 266a 0014                 movea.l    20(a2),a3
[0003f49a] 93c9                      suba.l     a1,a1
[0003f49c] 204b                      movea.l    a3,a0
[0003f49e] 303c 00d5                 move.w     #$00D5,d0
[0003f4a2] 4eb9 0003 a772            jsr        Auo_editor
[0003f4a8] 93c9                      suba.l     a1,a1
[0003f4aa] 303c 00e2                 move.w     #$00E2,d0
[0003f4ae] 204b                      movea.l    a3,a0
[0003f4b0] 4eb9 0003 a772            jsr        Auo_editor
[0003f4b6] 43d7                      lea.l      (a7),a1
[0003f4b8] 303c 00d8                 move.w     #$00D8,d0
[0003f4bc] 204b                      movea.l    a3,a0
[0003f4be] 4eb9 0003 a772            jsr        Auo_editor
[0003f4c4] 43ef 0004                 lea.l      4(a7),a1
[0003f4c8] 303c 00e7                 move.w     #$00E7,d0
[0003f4cc] 204b                      movea.l    a3,a0
[0003f4ce] 4eb9 0003 a772            jsr        Auo_editor
[0003f4d4] 2003                      move.l     d3,d0
[0003f4d6] 204b                      movea.l    a3,a0
[0003f4d8] 6100 fe58                 bsr        merge
[0003f4dc] 93c9                      suba.l     a1,a1
[0003f4de] 303c 00db                 move.w     #$00DB,d0
[0003f4e2] 204b                      movea.l    a3,a0
[0003f4e4] 4eb9 0003 a772            jsr        Auo_editor
[0003f4ea] 93c9                      suba.l     a1,a1
[0003f4ec] 7005                      moveq.l    #5,d0
[0003f4ee] 204b                      movea.l    a3,a0
[0003f4f0] 4eb9 0003 a772            jsr        Auo_editor
[0003f4f6] 43ef 0008                 lea.l      8(a7),a1
[0003f4fa] 303c 00d8                 move.w     #$00D8,d0
[0003f4fe] 204b                      movea.l    a3,a0
[0003f500] 4eb9 0003 a772            jsr        Auo_editor
[0003f506] 43ef 000c                 lea.l      12(a7),a1
[0003f50a] 303c 00e7                 move.w     #$00E7,d0
[0003f50e] 204b                      movea.l    a3,a0
[0003f510] 4eb9 0003 a772            jsr        Auo_editor
[0003f516] 43d7                      lea.l      (a7),a1
[0003f518] 303c 00e4                 move.w     #$00E4,d0
[0003f51c] 204b                      movea.l    a3,a0
[0003f51e] 4eb9 0003 a772            jsr        Auo_editor
[0003f524] 93c9                      suba.l     a1,a1
[0003f526] 303c 00d6                 move.w     #$00D6,d0
[0003f52a] 204b                      movea.l    a3,a0
[0003f52c] 4eb9 0003 a772            jsr        Auo_editor
[0003f532] 204a                      movea.l    a2,a0
[0003f534] 6100 d886                 bsr        dirty
merge_it_1:
[0003f538] 4fef 0010                 lea.l      16(a7),a7
[0003f53c] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[0003f540] 4e75                      rts

Aed_merge:
[0003f542] 48e7 0038                 movem.l    a2-a4,-(a7)
[0003f546] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003f54c] 2468 0258                 movea.l    600(a0),a2
[0003f550] 2652                      movea.l    (a2),a3
[0003f552] 486b 0182                 pea.l      386(a3)
[0003f556] 43eb 0192                 lea.l      402(a3),a1
[0003f55a] 41eb 0008                 lea.l      8(a3),a0
[0003f55e] 4eb9 0006 cefe            jsr        Af_select
[0003f564] 584f                      addq.w     #4,a7
[0003f566] 2848                      movea.l    a0,a4
[0003f568] 200c                      move.l     a4,d0
[0003f56a] 6708                      beq.s      Aed_merge_1
[0003f56c] 224c                      movea.l    a4,a1
[0003f56e] 204a                      movea.l    a2,a0
[0003f570] 6100 ff08                 bsr        merge_it
Aed_merge_1:
[0003f574] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0003f578] 4e75                      rts

Aed_paste:
[0003f57a] 323c 8476                 move.w     #$8476,d1
[0003f57e] 4240                      clr.w      d0
[0003f580] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003f586] 2068 0258                 movea.l    600(a0),a0
[0003f58a] 6100 d888                 bsr        edit_key
[0003f58e] 4e75                      rts

Aed_quit:
[0003f590] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003f596] 2068 0258                 movea.l    600(a0),a0
[0003f59a] 6100 f17c                 bsr        term
[0003f59e] 4e75                      rts

replace_next:
[0003f5a0] 48e7 003a                 movem.l    a2-a4/a6,-(a7)
[0003f5a4] 4fef ffbc                 lea.l      -68(a7),a7
[0003f5a8] 2f48 0040                 move.l     a0,64(a7)
[0003f5ac] 2668 0014                 movea.l    20(a0),a3
[0003f5b0] 2850                      movea.l    (a0),a4
[0003f5b2] 43ec 0396                 lea.l      918(a4),a1
[0003f5b6] 2f49 003c                 move.l     a1,60(a7)
[0003f5ba] 1011                      move.b     (a1),d0
[0003f5bc] 6700 01da                 beq        replace_next_1
[0003f5c0] 7240                      moveq.l    #64,d1
[0003f5c2] c26c 0294                 and.w      660(a4),d1
[0003f5c6] 6710                      beq.s      replace_next_2
[0003f5c8] 204b                      movea.l    a3,a0
[0003f5ca] 303c 00f3                 move.w     #$00F3,d0
[0003f5ce] 93c9                      suba.l     a1,a1
[0003f5d0] 4eb9 0003 a772            jsr        Auo_editor
[0003f5d6] 600e                      bra.s      replace_next_3
replace_next_2:
[0003f5d8] 93c9                      suba.l     a1,a1
[0003f5da] 303c 00f4                 move.w     #$00F4,d0
[0003f5de] 204b                      movea.l    a3,a0
[0003f5e0] 4eb9 0003 a772            jsr        Auo_editor
replace_next_3:
[0003f5e6] 7010                      moveq.l    #16,d0
[0003f5e8] c06c 0294                 and.w      660(a4),d0
[0003f5ec] 6710                      beq.s      replace_next_4
[0003f5ee] 93c9                      suba.l     a1,a1
[0003f5f0] 204b                      movea.l    a3,a0
[0003f5f2] 303c 00f6                 move.w     #$00F6,d0
[0003f5f6] 4eb9 0003 a772            jsr        Auo_editor
[0003f5fc] 600e                      bra.s      replace_next_5
replace_next_4:
[0003f5fe] 93c9                      suba.l     a1,a1
[0003f600] 303c 00f5                 move.w     #$00F5,d0
[0003f604] 204b                      movea.l    a3,a0
[0003f606] 4eb9 0003 a772            jsr        Auo_editor
replace_next_5:
[0003f60c] 7020                      moveq.l    #32,d0
[0003f60e] c06c 0294                 and.w      660(a4),d0
[0003f612] 6710                      beq.s      replace_next_6
[0003f614] 93c9                      suba.l     a1,a1
[0003f616] 204b                      movea.l    a3,a0
[0003f618] 303c 00f7                 move.w     #$00F7,d0
[0003f61c] 4eb9 0003 a772            jsr        Auo_editor
[0003f622] 600e                      bra.s      replace_next_7
replace_next_6:
[0003f624] 93c9                      suba.l     a1,a1
[0003f626] 303c 00f8                 move.w     #$00F8,d0
[0003f62a] 204b                      movea.l    a3,a0
[0003f62c] 4eb9 0003 a772            jsr        Auo_editor
replace_next_7:
[0003f632] 93c9                      suba.l     a1,a1
[0003f634] 303c 00d5                 move.w     #$00D5,d0
[0003f638] 204b                      movea.l    a3,a0
[0003f63a] 4eb9 0003 a772            jsr        Auo_editor
[0003f640] 4def 0028                 lea.l      40(a7),a6
[0003f644] 224e                      movea.l    a6,a1
[0003f646] 303c 00e3                 move.w     #$00E3,d0
[0003f64a] 204b                      movea.l    a3,a0
[0003f64c] 4eb9 0003 a772            jsr        Auo_editor
[0003f652] 45ef 0018                 lea.l      24(a7),a2
replace_next_12:
[0003f656] 2016                      move.l     (a6),d0
[0003f658] 6b32                      bmi.s      replace_next_8
[0003f65a] 7240                      moveq.l    #64,d1
[0003f65c] c26c 0294                 and.w      660(a4),d1
[0003f660] 672a                      beq.s      replace_next_8
[0003f662] 93c9                      suba.l     a1,a1
[0003f664] 204b                      movea.l    a3,a0
[0003f666] 303c 00e2                 move.w     #$00E2,d0
[0003f66a] 4eb9 0003 a772            jsr        Auo_editor
[0003f670] 224e                      movea.l    a6,a1
[0003f672] 7011                      moveq.l    #17,d0
[0003f674] 204b                      movea.l    a3,a0
[0003f676] 4eb9 0003 a772            jsr        Auo_editor
[0003f67c] 43ee 0004                 lea.l      4(a6),a1
[0003f680] 303c 00d7                 move.w     #$00D7,d0
[0003f684] 204b                      movea.l    a3,a0
[0003f686] 4eb9 0003 a772            jsr        Auo_editor
replace_next_8:
[0003f68c] 226f 003c                 movea.l    60(a7),a1
[0003f690] 303c 00f2                 move.w     #$00F2,d0
[0003f694] 204b                      movea.l    a3,a0
[0003f696] 4eb9 0003 a772            jsr        Auo_editor
[0003f69c] 224a                      movea.l    a2,a1
[0003f69e] 303c 00e3                 move.w     #$00E3,d0
[0003f6a2] 204b                      movea.l    a3,a0
[0003f6a4] 4eb9 0003 a772            jsr        Auo_editor
[0003f6aa] 2012                      move.l     (a2),d0
[0003f6ac] 6b24                      bmi.s      replace_next_9
[0003f6ae] 2216                      move.l     (a6),d1
[0003f6b0] b280                      cmp.l      d0,d1
[0003f6b2] 6626                      bne.s      replace_next_10
[0003f6b4] 242e 0004                 move.l     4(a6),d2
[0003f6b8] b4aa 0004                 cmp.l      4(a2),d2
[0003f6bc] 661c                      bne.s      replace_next_10
[0003f6be] 206e 0008                 movea.l    8(a6),a0
[0003f6c2] b1ea 0008                 cmpa.l     8(a2),a0
[0003f6c6] 6612                      bne.s      replace_next_10
[0003f6c8] 226e 000c                 movea.l    12(a6),a1
[0003f6cc] b3ea 000c                 cmpa.l     12(a2),a1
[0003f6d0] 6608                      bne.s      replace_next_10
replace_next_9:
[0003f6d2] 0a6c 0040 0294            eori.w     #$0040,660(a4)
[0003f6d8] 607c                      bra.s      replace_next_11
replace_next_10:
[0003f6da] 2e92                      move.l     (a2),(a7)
[0003f6dc] 2f6a 0004 0004            move.l     4(a2),4(a7)
[0003f6e2] 2f6a 0008 0008            move.l     8(a2),8(a7)
[0003f6e8] 2f6a 000c 000c            move.l     12(a2),12(a7)
[0003f6ee] 2f7c 0000 0001 0010       move.l     #$00000001,16(a7)
[0003f6f6] 41ec 0496                 lea.l      1174(a4),a0
[0003f6fa] 2f48 0038                 move.l     a0,56(a7)
[0003f6fe] 43ef 0038                 lea.l      56(a7),a1
[0003f702] 2f49 0014                 move.l     a1,20(a7)
[0003f706] 43d7                      lea.l      (a7),a1
[0003f708] 303c 00ea                 move.w     #$00EA,d0
[0003f70c] 204b                      movea.l    a3,a0
[0003f70e] 4eb9 0003 a772            jsr        Auo_editor
[0003f714] 43ea 0008                 lea.l      8(a2),a1
[0003f718] 303c 00d8                 move.w     #$00D8,d0
[0003f71c] 204b                      movea.l    a3,a0
[0003f71e] 4eb9 0003 a772            jsr        Auo_editor
[0003f724] 43ea 000c                 lea.l      12(a2),a1
[0003f728] 303c 00e7                 move.w     #$00E7,d0
[0003f72c] 204b                      movea.l    a3,a0
[0003f72e] 4eb9 0003 a772            jsr        Auo_editor
[0003f734] 93c9                      suba.l     a1,a1
[0003f736] 7005                      moveq.l    #5,d0
[0003f738] 204b                      movea.l    a3,a0
[0003f73a] 4eb9 0003 a772            jsr        Auo_editor
[0003f740] 7010                      moveq.l    #16,d0
[0003f742] 224a                      movea.l    a2,a1
[0003f744] 204e                      movea.l    a6,a0
[0003f746] 4eb9 0008 3500            jsr        memcpy
[0003f74c] 7008                      moveq.l    #8,d0
[0003f74e] c06c 0294                 and.w      660(a4),d0
[0003f752] 6600 fefe                 bne        replace_next_12
replace_next_11:
[0003f756] 93c9                      suba.l     a1,a1
[0003f758] 303c 00db                 move.w     #$00DB,d0
[0003f75c] 204b                      movea.l    a3,a0
[0003f75e] 4eb9 0003 a772            jsr        Auo_editor
[0003f764] 93c9                      suba.l     a1,a1
[0003f766] 7005                      moveq.l    #5,d0
[0003f768] 204b                      movea.l    a3,a0
[0003f76a] 4eb9 0003 a772            jsr        Auo_editor
[0003f770] 2016                      move.l     (a6),d0
[0003f772] 6b0e                      bmi.s      replace_next_13
[0003f774] 224e                      movea.l    a6,a1
[0003f776] 204b                      movea.l    a3,a0
[0003f778] 303c 00e4                 move.w     #$00E4,d0
[0003f77c] 4eb9 0003 a772            jsr        Auo_editor
replace_next_13:
[0003f782] 93c9                      suba.l     a1,a1
[0003f784] 303c 00d6                 move.w     #$00D6,d0
[0003f788] 204b                      movea.l    a3,a0
[0003f78a] 4eb9 0003 a772            jsr        Auo_editor
[0003f790] 206f 0040                 movea.l    64(a7),a0
[0003f794] 6100 d626                 bsr        dirty
replace_next_1:
[0003f798] 4fef 0044                 lea.l      68(a7),a7
[0003f79c] 4cdf 5c00                 movem.l    (a7)+,a2-a4/a6
[0003f7a0] 4e75                      rts

Aed_replace:
[0003f7a2] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003f7a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003f7ac] 2468 0258                 movea.l    600(a0),a2
[0003f7b0] 2652                      movea.l    (a2),a3
[0003f7b2] 4bf9 000d 3a86            lea.l      protocnf,a5
[0003f7b8] 41ed febc                 lea.l      -324(a5),a0
[0003f7bc] 226d fec4                 movea.l    -316(a5),a1
[0003f7c0] 4e91                      jsr        (a1)
[0003f7c2] 2848                      movea.l    a0,a4
[0003f7c4] 200c                      move.l     a4,d0
[0003f7c6] 6700 0118                 beq        Aed_replace_1
[0003f7ca] 43eb 0396                 lea.l      918(a3),a1
[0003f7ce] 7005                      moveq.l    #5,d0
[0003f7d0] 206c 0014                 movea.l    20(a4),a0
[0003f7d4] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003f7da] 43eb 0496                 lea.l      1174(a3),a1
[0003f7de] 7006                      moveq.l    #6,d0
[0003f7e0] 206c 0014                 movea.l    20(a4),a0
[0003f7e4] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003f7ea] 7020                      moveq.l    #32,d0
[0003f7ec] c06b 0294                 and.w      660(a3),d0
[0003f7f0] 206c 0014                 movea.l    20(a4),a0
[0003f7f4] 41e8 0138                 lea.l      312(a0),a0
[0003f7f8] 6100 d568                 bsr        set_select
[0003f7fc] 7040                      moveq.l    #64,d0
[0003f7fe] c06b 0294                 and.w      660(a3),d0
[0003f802] 206c 0014                 movea.l    20(a4),a0
[0003f806] 41e8 00d8                 lea.l      216(a0),a0
[0003f80a] 6100 d556                 bsr        set_select
[0003f80e] 7010                      moveq.l    #16,d0
[0003f810] c06b 0294                 and.w      660(a3),d0
[0003f814] 206c 0014                 movea.l    20(a4),a0
[0003f818] 41e8 0168                 lea.l      360(a0),a0
[0003f81c] 6100 d544                 bsr        set_select
[0003f820] 7008                      moveq.l    #8,d0
[0003f822] c06b 0294                 and.w      660(a3),d0
[0003f826] 206c 0014                 movea.l    20(a4),a0
[0003f82a] 41e8 0108                 lea.l      264(a0),a0
[0003f82e] 6100 d532                 bsr        set_select
[0003f832] 204c                      movea.l    a4,a0
[0003f834] 4eb9 0005 9df4            jsr        Awi_dialog
[0003f83a] b07c 0011                 cmp.w      #$0011,d0
[0003f83e] 6600 0098                 bne        Aed_replace_2
[0003f842] 43eb 0396                 lea.l      918(a3),a1
[0003f846] 7005                      moveq.l    #5,d0
[0003f848] 206c 0014                 movea.l    20(a4),a0
[0003f84c] 4eb9 0005 11da            jsr        Aob_gettext
[0003f852] 43eb 0496                 lea.l      1174(a3),a1
[0003f856] 7006                      moveq.l    #6,d0
[0003f858] 206c 0014                 movea.l    20(a4),a0
[0003f85c] 4eb9 0005 11da            jsr        Aob_gettext
[0003f862] 43eb 0396                 lea.l      918(a3),a1
[0003f866] 41ed 0224                 lea.l      548(a5),a0
[0003f86a] 4eb9 0008 2f0c            jsr        strcpy
[0003f870] 43eb 0496                 lea.l      1174(a3),a1
[0003f874] 41ed 0324                 lea.l      804(a5),a0
[0003f878] 4eb9 0008 2f0c            jsr        strcpy
[0003f87e] 026b ff87 0294            andi.w     #$FF87,660(a3)
[0003f884] 7001                      moveq.l    #1,d0
[0003f886] 206c 0014                 movea.l    20(a4),a0
[0003f88a] c068 0142                 and.w      322(a0),d0
[0003f88e] 6706                      beq.s      Aed_replace_3
[0003f890] 006b 0020 0294            ori.w      #$0020,660(a3)
Aed_replace_3:
[0003f896] 7001                      moveq.l    #1,d0
[0003f898] 206c 0014                 movea.l    20(a4),a0
[0003f89c] c068 00e2                 and.w      226(a0),d0
[0003f8a0] 6706                      beq.s      Aed_replace_4
[0003f8a2] 006b 0040 0294            ori.w      #$0040,660(a3)
Aed_replace_4:
[0003f8a8] 7001                      moveq.l    #1,d0
[0003f8aa] 206c 0014                 movea.l    20(a4),a0
[0003f8ae] c068 0172                 and.w      370(a0),d0
[0003f8b2] 6706                      beq.s      Aed_replace_5
[0003f8b4] 006b 0010 0294            ori.w      #$0010,660(a3)
Aed_replace_5:
[0003f8ba] 7001                      moveq.l    #1,d0
[0003f8bc] 206c 0014                 movea.l    20(a4),a0
[0003f8c0] c068 0112                 and.w      274(a0),d0
[0003f8c4] 6706                      beq.s      Aed_replace_6
[0003f8c6] 006b 0008 0294            ori.w      #$0008,660(a3)
Aed_replace_6:
[0003f8cc] 3b6b 0294 0122            move.w     660(a3),290(a5)
[0003f8d2] 204a                      movea.l    a2,a0
[0003f8d4] 6100 fcca                 bsr        replace_next
Aed_replace_2:
[0003f8d8] 204c                      movea.l    a4,a0
[0003f8da] 4eb9 0005 85f2            jsr        Awi_delete
Aed_replace_1:
[0003f8e0] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003f8e4] 4e75                      rts

Aed_replacenext:
[0003f8e6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003f8ec] 2068 0258                 movea.l    600(a0),a0
[0003f8f0] 6100 fcae                 bsr        replace_next
[0003f8f4] 4e75                      rts

save_text:
[0003f8f6] 48e7 1e34                 movem.l    d3-d6/a2-a3/a5,-(a7)
[0003f8fa] 4fef ffdc                 lea.l      -36(a7),a7
[0003f8fe] 2f48 0020                 move.l     a0,32(a7)
[0003f902] 3a00                      move.w     d0,d5
[0003f904] 45f9 0010 ce40            lea.l      buffer,a2
[0003f90a] 264a                      movea.l    a2,a3
[0003f90c] 7600                      moveq.l    #0,d3
[0003f90e] 43ef 0010                 lea.l      16(a7),a1
[0003f912] 303c 00e3                 move.w     #$00E3,d0
[0003f916] 206f 0020                 movea.l    32(a7),a0
[0003f91a] 4eb9 0003 a772            jsr        Auo_editor
[0003f920] 4bef 000c                 lea.l      12(a7),a5
[0003f924] 202f 0010                 move.l     16(a7),d0
[0003f928] 6f08                      ble.s      save_text_1
[0003f92a] 2800                      move.l     d0,d4
[0003f92c] 2aaf 0018                 move.l     24(a7),(a5)
[0003f930] 6014                      bra.s      save_text_2
save_text_1:
[0003f932] 224d                      movea.l    a5,a1
[0003f934] 303c 00e9                 move.w     #$00E9,d0
[0003f938] 206f 0020                 movea.l    32(a7),a0
[0003f93c] 4eb9 0003 a772            jsr        Auo_editor
[0003f942] 5395                      subq.l     #1,(a5)
[0003f944] 7800                      moveq.l    #0,d4
save_text_2:
[0003f946] 2e84                      move.l     d4,(a7)
[0003f948] 6000 0076                 bra.w      save_text_3
[0003f94c] 43d7                      lea.l      (a7),a1
save_text_10:
[0003f94e] 303c 00ca                 move.w     #$00CA,d0
[0003f952] 206f 0020                 movea.l    32(a7),a0
[0003f956] 4eb9 0003 a772            jsr        Auo_editor
[0003f95c] 2017                      move.l     (a7),d0
[0003f95e] b095                      cmp.l      (a5),d0
[0003f960] 6606                      bne.s      save_text_4
[0003f962] 282f 0004                 move.l     4(a7),d4
[0003f966] 6006                      bra.s      save_text_5
save_text_4:
[0003f968] 7802                      moveq.l    #2,d4
[0003f96a] d8af 0004                 add.l      4(a7),d4
save_text_5:
[0003f96e] 2003                      move.l     d3,d0
[0003f970] d084                      add.l      d4,d0
[0003f972] b0bc 0000 2000            cmp.l      #$00002000,d0
[0003f978] 6d16                      blt.s      save_text_6
[0003f97a] 204a                      movea.l    a2,a0
[0003f97c] 2203                      move.l     d3,d1
[0003f97e] 3005                      move.w     d5,d0
[0003f980] 4eb9 0008 0d5e            jsr        Fwrite
[0003f986] 2c00                      move.l     d0,d6
[0003f988] b680                      cmp.l      d0,d3
[0003f98a] 6652                      bne.s      save_text_7
[0003f98c] 264a                      movea.l    a2,a3
[0003f98e] 7600                      moveq.l    #0,d3
save_text_6:
[0003f990] d684                      add.l      d4,d3
[0003f992] 202f 0004                 move.l     4(a7),d0
[0003f996] 6f0c                      ble.s      save_text_8
[0003f998] 226f 0008                 movea.l    8(a7),a1
[0003f99c] 204b                      movea.l    a3,a0
[0003f99e] 4eb9 0008 2fd6            jsr        strncpy
save_text_8:
[0003f9a4] 47f2 3000                 lea.l      0(a2,d3.w),a3
[0003f9a8] 2017                      move.l     (a7),d0
[0003f9aa] b095                      cmp.l      (a5),d0
[0003f9ac] 6710                      beq.s      save_text_9
[0003f9ae] 43f9 000d 4a2c            lea.l      $000D4A2C,a1
[0003f9b4] 41eb fffe                 lea.l      -2(a3),a0
[0003f9b8] 4eb9 0008 2f0c            jsr        strcpy
save_text_9:
[0003f9be] 5297                      addq.l     #1,(a7)
save_text_3:
[0003f9c0] 2017                      move.l     (a7),d0
[0003f9c2] b095                      cmp.l      (a5),d0
[0003f9c4] 6f00 ff86                 ble.w      save_text_10
[0003f9c8] 4a83                      tst.l      d3
[0003f9ca] 6f2e                      ble.s      save_text_11
[0003f9cc] 204a                      movea.l    a2,a0
[0003f9ce] 2203                      move.l     d3,d1
[0003f9d0] 3005                      move.w     d5,d0
[0003f9d2] 4eb9 0008 0d5e            jsr        Fwrite
[0003f9d8] 2c00                      move.l     d0,d6
[0003f9da] b680                      cmp.l      d0,d3
[0003f9dc] 671c                      beq.s      save_text_11
save_text_7:
[0003f9de] 91c8                      suba.l     a0,a0
[0003f9e0] 700a                      moveq.l    #10,d0
[0003f9e2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003f9e8] 2269 03d6                 movea.l    982(a1),a1
[0003f9ec] 4e91                      jsr        (a1)
[0003f9ee] 3005                      move.w     d5,d0
[0003f9f0] 4eb9 0008 0c7e            jsr        Fclose
[0003f9f6] 70ff                      moveq.l    #-1,d0
[0003f9f8] 600a                      bra.s      save_text_12
save_text_11:
[0003f9fa] 3005                      move.w     d5,d0
[0003f9fc] 4eb9 0008 0c7e            jsr        Fclose
[0003fa02] 4240                      clr.w      d0
save_text_12:
[0003fa04] 4fef 0024                 lea.l      36(a7),a7
[0003fa08] 4cdf 2c78                 movem.l    (a7)+,d3-d6/a2-a3/a5
[0003fa0c] 4e75                      rts

save_it:
[0003fa0e] 48e7 182c                 movem.l    d3-d4/a2/a4-a5,-(a7)
[0003fa12] 4fef ff00                 lea.l      -256(a7),a7
[0003fa16] 2a48                      movea.l    a0,a5
[0003fa18] 2449                      movea.l    a1,a2
[0003fa1a] 41d7                      lea.l      (a7),a0
[0003fa1c] 4eb9 0008 2f0c            jsr        strcpy
[0003fa22] 702e                      moveq.l    #46,d0
[0003fa24] 41d7                      lea.l      (a7),a0
[0003fa26] 4eb9 0008 2e9e            jsr        strrchr
[0003fa2c] 2848                      movea.l    a0,a4
[0003fa2e] 200c                      move.l     a4,d0
[0003fa30] 6610                      bne.s      save_it_1
[0003fa32] 43f9 000d 4a2f            lea.l      $000D4A2F,a1
[0003fa38] 41d7                      lea.l      (a7),a0
[0003fa3a] 4eb9 0008 2e42            jsr        strcat
[0003fa40] 600e                      bra.s      save_it_2
save_it_1:
[0003fa42] 43f9 000d 4a2f            lea.l      $000D4A2F,a1
[0003fa48] 204c                      movea.l    a4,a0
[0003fa4a] 4eb9 0008 2f0c            jsr        strcpy
save_it_2:
[0003fa50] 43d7                      lea.l      (a7),a1
[0003fa52] 204a                      movea.l    a2,a0
[0003fa54] 4240                      clr.w      d0
[0003fa56] 4eb9 0008 0ce8            jsr        Frename
[0003fa5c] 2600                      move.l     d0,d3
[0003fa5e] 204a                      movea.l    a2,a0
[0003fa60] 4240                      clr.w      d0
[0003fa62] 4eb9 0008 0c8e            jsr        Fcreate
[0003fa68] 2800                      move.l     d0,d4
[0003fa6a] 4a80                      tst.l      d0
[0003fa6c] 6b3e                      bmi.s      save_it_3
[0003fa6e] 204d                      movea.l    a5,a0
[0003fa70] 6100 fe84                 bsr        save_text
[0003fa74] 4a40                      tst.w      d0
[0003fa76] 6716                      beq.s      save_it_4
[0003fa78] 204a                      movea.l    a2,a0
[0003fa7a] 4eb9 0008 0ca0            jsr        Fdelete
[0003fa80] 224a                      movea.l    a2,a1
[0003fa82] 41d7                      lea.l      (a7),a0
[0003fa84] 4240                      clr.w      d0
[0003fa86] 4eb9 0008 0ce8            jsr        Frename
[0003fa8c] 600c                      bra.s      save_it_5
save_it_4:
[0003fa8e] 4a83                      tst.l      d3
[0003fa90] 6608                      bne.s      save_it_5
[0003fa92] 41d7                      lea.l      (a7),a0
[0003fa94] 4eb9 0008 0ca0            jsr        Fdelete
save_it_5:
[0003fa9a] 204a                      movea.l    a2,a0
[0003fa9c] 4eb9 0006 1fe0            jsr        Aev_OlgaUpdate
[0003faa2] 204a                      movea.l    a2,a0
[0003faa4] 4eb9 0006 056e            jsr        Aev_DhstSaved
[0003faaa] 600c                      bra.s      save_it_6
save_it_3:
[0003faac] 224a                      movea.l    a2,a1
[0003faae] 41d7                      lea.l      (a7),a0
[0003fab0] 4240                      clr.w      d0
[0003fab2] 4eb9 0008 0ce8            jsr        Frename
save_it_6:
[0003fab8] 4fef 0100                 lea.l      256(a7),a7
[0003fabc] 4cdf 3418                 movem.l    (a7)+,d3-d4/a2/a4-a5
[0003fac0] 4e75                      rts

ed_save:
[0003fac2] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003fac6] 2448                      movea.l    a0,a2
[0003fac8] 2850                      movea.l    (a0),a4
[0003faca] 2654                      movea.l    (a4),a3
[0003facc] 200b                      move.l     a3,d0
[0003face] 671c                      beq.s      ed_save_1
[0003fad0] 322c 0294                 move.w     660(a4),d1
[0003fad4] c27c 0100                 and.w      #$0100,d1
[0003fad8] 6612                      bne.s      ed_save_1
[0003fada] 2248                      movea.l    a0,a1
[0003fadc] 2a6b 0004                 movea.l    4(a3),a5
[0003fae0] 204b                      movea.l    a3,a0
[0003fae2] 303c 00d2                 move.w     #$00D2,d0
[0003fae6] 4e95                      jsr        (a5)
[0003fae8] 5340                      subq.w     #1,d0
[0003faea] 674e                      beq.s      ed_save_2
ed_save_1:
[0003faec] 47ec 0192                 lea.l      402(a4),a3
[0003faf0] 1013                      move.b     (a3),d0
[0003faf2] 660a                      bne.s      ed_save_3
[0003faf4] 204a                      movea.l    a2,a0
[0003faf6] 4eb9 0003 fb50            jsr        ed_saveas
[0003fafc] 603c                      bra.s      ed_save_2
ed_save_3:
[0003fafe] 286a 0014                 movea.l    20(a2),a4
[0003fb02] 93c9                      suba.l     a1,a1
[0003fb04] 303c 00d5                 move.w     #$00D5,d0
[0003fb08] 204c                      movea.l    a4,a0
[0003fb0a] 4eb9 0003 a772            jsr        Auo_editor
[0003fb10] 93c9                      suba.l     a1,a1
[0003fb12] 303c 00e2                 move.w     #$00E2,d0
[0003fb16] 204c                      movea.l    a4,a0
[0003fb18] 4eb9 0003 a772            jsr        Auo_editor
[0003fb1e] 93c9                      suba.l     a1,a1
[0003fb20] 303c 00d6                 move.w     #$00D6,d0
[0003fb24] 204c                      movea.l    a4,a0
[0003fb26] 4eb9 0003 a772            jsr        Auo_editor
[0003fb2c] 224b                      movea.l    a3,a1
[0003fb2e] 204c                      movea.l    a4,a0
[0003fb30] 6100 fedc                 bsr        save_it
[0003fb34] 204a                      movea.l    a2,a0
[0003fb36] 6100 d23e                 bsr        undirty
ed_save_2:
[0003fb3a] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[0003fb3e] 4e75                      rts

Aed_save:
[0003fb40] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003fb46] 2068 0258                 movea.l    600(a0),a0
[0003fb4a] 6100 ff76                 bsr        ed_save
[0003fb4e] 4e75                      rts

ed_saveas:
[0003fb50] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003fb54] 4fef fff0                 lea.l      -16(a7),a7
[0003fb58] 2448                      movea.l    a0,a2
[0003fb5a] 266a 0014                 movea.l    20(a2),a3
[0003fb5e] 43d7                      lea.l      (a7),a1
[0003fb60] 303c 00e3                 move.w     #$00E3,d0
[0003fb64] 204b                      movea.l    a3,a0
[0003fb66] 4eb9 0003 a772            jsr        Auo_editor
[0003fb6c] 4243                      clr.w      d3
[0003fb6e] 2017                      move.l     (a7),d0
[0003fb70] 6b40                      bmi.s      ed_saveas_1
[0003fb72] 41f9 000d 048a            lea.l      ASK_SELECT,a0
[0003fb78] 7001                      moveq.l    #1,d0
[0003fb7a] 4eb9 0005 a600            jsr        Awi_alert
[0003fb80] 5540                      subq.w     #2,d0
[0003fb82] 662c                      bne.s      ed_saveas_2
[0003fb84] 93c9                      suba.l     a1,a1
[0003fb86] 303c 00d5                 move.w     #$00D5,d0
[0003fb8a] 204b                      movea.l    a3,a0
[0003fb8c] 4eb9 0003 a772            jsr        Auo_editor
[0003fb92] 93c9                      suba.l     a1,a1
[0003fb94] 303c 00e2                 move.w     #$00E2,d0
[0003fb98] 204b                      movea.l    a3,a0
[0003fb9a] 4eb9 0003 a772            jsr        Auo_editor
[0003fba0] 93c9                      suba.l     a1,a1
[0003fba2] 303c 00d6                 move.w     #$00D6,d0
[0003fba6] 204b                      movea.l    a3,a0
[0003fba8] 4eb9 0003 a772            jsr        Auo_editor
[0003fbae] 6002                      bra.s      ed_saveas_1
ed_saveas_2:
[0003fbb0] 7601                      moveq.l    #1,d3
ed_saveas_1:
[0003fbb2] 2852                      movea.l    (a2),a4
[0003fbb4] 43ec 0192                 lea.l      402(a4),a1
[0003fbb8] 41f9 000d 3aa6            lea.l      $000D3AA6,a0
[0003fbbe] 4eb9 0008 2f0c            jsr        strcpy
[0003fbc4] 486c 0182                 pea.l      386(a4)
[0003fbc8] 43ec 0192                 lea.l      402(a4),a1
[0003fbcc] 41ec 0048                 lea.l      72(a4),a0
[0003fbd0] 4eb9 0006 cefe            jsr        Af_select
[0003fbd6] 584f                      addq.w     #4,a7
[0003fbd8] 2a48                      movea.l    a0,a5
[0003fbda] 200d                      move.l     a5,d0
[0003fbdc] 6724                      beq.s      ed_saveas_3
[0003fbde] 224d                      movea.l    a5,a1
[0003fbe0] 204b                      movea.l    a3,a0
[0003fbe2] 6100 fe2a                 bsr        save_it
[0003fbe6] 4a43                      tst.w      d3
[0003fbe8] 6618                      bne.s      ed_saveas_3
[0003fbea] 224d                      movea.l    a5,a1
[0003fbec] 41ec 0192                 lea.l      402(a4),a0
[0003fbf0] 4eb9 0008 2f0c            jsr        strcpy
[0003fbf6] 204a                      movea.l    a2,a0
[0003fbf8] 6100 d07c                 bsr        set_icon
[0003fbfc] 204a                      movea.l    a2,a0
[0003fbfe] 6100 d176                 bsr        undirty
ed_saveas_3:
[0003fc02] 4fef 0010                 lea.l      16(a7),a7
[0003fc06] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003fc0a] 4e75                      rts

Aed_saveas:
[0003fc0c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003fc12] 2068 0258                 movea.l    600(a0),a0
[0003fc16] 6100 ff38                 bsr        ed_saveas
[0003fc1a] 4e75                      rts

Aed_selall:
[0003fc1c] 2f0a                      move.l     a2,-(a7)
[0003fc1e] 2f0c                      move.l     a4,-(a7)
[0003fc20] 4fef ffe0                 lea.l      -32(a7),a7
[0003fc24] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003fc2a] 2268 0258                 movea.l    600(a0),a1
[0003fc2e] 2469 0014                 movea.l    20(a1),a2
[0003fc32] 43ef 001c                 lea.l      28(a7),a1
[0003fc36] 303c 00e9                 move.w     #$00E9,d0
[0003fc3a] 204a                      movea.l    a2,a0
[0003fc3c] 4eb9 0003 a772            jsr        Auo_editor
[0003fc42] 70ff                      moveq.l    #-1,d0
[0003fc44] d0af 001c                 add.l      28(a7),d0
[0003fc48] 2e80                      move.l     d0,(a7)
[0003fc4a] 43d7                      lea.l      (a7),a1
[0003fc4c] 204a                      movea.l    a2,a0
[0003fc4e] 303c 00ca                 move.w     #$00CA,d0
[0003fc52] 4eb9 0003 a772            jsr        Auo_editor
[0003fc58] 49ef 000c                 lea.l      12(a7),a4
[0003fc5c] 224c                      movea.l    a4,a1
[0003fc5e] 303c 00e3                 move.w     #$00E3,d0
[0003fc62] 204a                      movea.l    a2,a0
[0003fc64] 4eb9 0003 a772            jsr        Auo_editor
[0003fc6a] 2014                      move.l     (a4),d0
[0003fc6c] 664c                      bne.s      Aed_selall_1
[0003fc6e] 222c 0004                 move.l     4(a4),d1
[0003fc72] 6646                      bne.s      Aed_selall_1
[0003fc74] 242c 0008                 move.l     8(a4),d2
[0003fc78] 9480                      sub.l      d0,d2
[0003fc7a] 5282                      addq.l     #1,d2
[0003fc7c] 206f 001c                 movea.l    28(a7),a0
[0003fc80] b1c2                      cmpa.l     d2,a0
[0003fc82] 6636                      bne.s      Aed_selall_1
[0003fc84] 226c 000c                 movea.l    12(a4),a1
[0003fc88] b3ef 0004                 cmpa.l     4(a7),a1
[0003fc8c] 662c                      bne.s      Aed_selall_1
[0003fc8e] 204a                      movea.l    a2,a0
[0003fc90] 303c 00e2                 move.w     #$00E2,d0
[0003fc94] 93c9                      suba.l     a1,a1
[0003fc96] 4eb9 0003 a772            jsr        Auo_editor
[0003fc9c] 93c9                      suba.l     a1,a1
[0003fc9e] 303c 00db                 move.w     #$00DB,d0
[0003fca2] 204a                      movea.l    a2,a0
[0003fca4] 4eb9 0003 a772            jsr        Auo_editor
[0003fcaa] 93c9                      suba.l     a1,a1
[0003fcac] 303c 00d6                 move.w     #$00D6,d0
[0003fcb0] 204a                      movea.l    a2,a0
[0003fcb2] 4eb9 0003 a772            jsr        Auo_editor
[0003fcb8] 6056                      bra.s      Aed_selall_2
Aed_selall_1:
[0003fcba] 2014                      move.l     (a4),d0
[0003fcbc] 6b0e                      bmi.s      Aed_selall_3
[0003fcbe] 93c9                      suba.l     a1,a1
[0003fcc0] 204a                      movea.l    a2,a0
[0003fcc2] 303c 00e2                 move.w     #$00E2,d0
[0003fcc6] 4eb9 0003 a772            jsr        Auo_editor
Aed_selall_3:
[0003fccc] 70ff                      moveq.l    #-1,d0
[0003fcce] d0af 001c                 add.l      28(a7),d0
[0003fcd2] 2e80                      move.l     d0,(a7)
[0003fcd4] 2940 0008                 move.l     d0,8(a4)
[0003fcd8] 43d7                      lea.l      (a7),a1
[0003fcda] 204a                      movea.l    a2,a0
[0003fcdc] 303c 00ca                 move.w     #$00CA,d0
[0003fce0] 4eb9 0003 a772            jsr        Auo_editor
[0003fce6] 7000                      moveq.l    #0,d0
[0003fce8] 2940 0004                 move.l     d0,4(a4)
[0003fcec] 2880                      move.l     d0,(a4)
[0003fcee] 296f 0004 000c            move.l     4(a7),12(a4)
[0003fcf4] 93c9                      suba.l     a1,a1
[0003fcf6] 303c 00d5                 move.w     #$00D5,d0
[0003fcfa] 204a                      movea.l    a2,a0
[0003fcfc] 4eb9 0003 a772            jsr        Auo_editor
[0003fd02] 224c                      movea.l    a4,a1
[0003fd04] 303c 00e4                 move.w     #$00E4,d0
[0003fd08] 204a                      movea.l    a2,a0
[0003fd0a] 4eb9 0003 a772            jsr        Auo_editor
Aed_selall_2:
[0003fd10] 4fef 0020                 lea.l      32(a7),a7
[0003fd14] 285f                      movea.l    (a7)+,a4
[0003fd16] 245f                      movea.l    (a7)+,a2
[0003fd18] 4e75                      rts

Aed_swap:
[0003fd1a] 48e7 003a                 movem.l    a2-a4/a6,-(a7)
[0003fd1e] 4fef ffec                 lea.l      -20(a7),a7
[0003fd22] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003fd28] 2268 0258                 movea.l    600(a0),a1
[0003fd2c] 2469 0014                 movea.l    20(a1),a2
[0003fd30] 303c 00e2                 move.w     #$00E2,d0
[0003fd34] 204a                      movea.l    a2,a0
[0003fd36] 93c9                      suba.l     a1,a1
[0003fd38] 4eb9 0003 a772            jsr        Auo_editor
[0003fd3e] 93c9                      suba.l     a1,a1
[0003fd40] 303c 00db                 move.w     #$00DB,d0
[0003fd44] 204a                      movea.l    a2,a0
[0003fd46] 4eb9 0003 a772            jsr        Auo_editor
[0003fd4c] 47ef 0010                 lea.l      16(a7),a3
[0003fd50] 224b                      movea.l    a3,a1
[0003fd52] 303c 00d8                 move.w     #$00D8,d0
[0003fd56] 204a                      movea.l    a2,a0
[0003fd58] 4eb9 0003 a772            jsr        Auo_editor
[0003fd5e] 49ef 000c                 lea.l      12(a7),a4
[0003fd62] 224c                      movea.l    a4,a1
[0003fd64] 303c 00e7                 move.w     #$00E7,d0
[0003fd68] 204a                      movea.l    a2,a0
[0003fd6a] 4eb9 0003 a772            jsr        Auo_editor
[0003fd70] 2e93                      move.l     (a3),(a7)
[0003fd72] 43d7                      lea.l      (a7),a1
[0003fd74] 303c 00ca                 move.w     #$00CA,d0
[0003fd78] 204a                      movea.l    a2,a0
[0003fd7a] 4eb9 0003 a772            jsr        Auo_editor
[0003fd80] 2014                      move.l     (a4),d0
[0003fd82] 6f78                      ble.s      Aed_swap_1
[0003fd84] b0af 0004                 cmp.l      4(a7),d0
[0003fd88] 6c72                      bge.s      Aed_swap_1
[0003fd8a] 4df9 000d 47cc            lea.l      subswap,a6
[0003fd90] 2014                      move.l     (a4),d0
[0003fd92] 206f 0008                 movea.l    8(a7),a0
[0003fd96] 1d70 0800 fff8            move.b     0(a0,d0.l),-8(a6)
[0003fd9c] 1d70 08ff fff9            move.b     -1(a0,d0.l),-7(a6)
[0003fda2] 2213                      move.l     (a3),d1
[0003fda4] 2d41 0008                 move.l     d1,8(a6)
[0003fda8] 2c81                      move.l     d1,(a6)
[0003fdaa] 74ff                      moveq.l    #-1,d2
[0003fdac] d480                      add.l      d0,d2
[0003fdae] 2d42 0004                 move.l     d2,4(a6)
[0003fdb2] 7201                      moveq.l    #1,d1
[0003fdb4] d280                      add.l      d0,d1
[0003fdb6] 2d41 000c                 move.l     d1,12(a6)
[0003fdba] 224e                      movea.l    a6,a1
[0003fdbc] 204a                      movea.l    a2,a0
[0003fdbe] 303c 00ea                 move.w     #$00EA,d0
[0003fdc2] 4eb9 0003 a772            jsr        Auo_editor
[0003fdc8] 224b                      movea.l    a3,a1
[0003fdca] 7011                      moveq.l    #17,d0
[0003fdcc] 204a                      movea.l    a2,a0
[0003fdce] 4eb9 0003 a772            jsr        Auo_editor
[0003fdd4] 224c                      movea.l    a4,a1
[0003fdd6] 303c 00d7                 move.w     #$00D7,d0
[0003fdda] 204a                      movea.l    a2,a0
[0003fddc] 4eb9 0003 a772            jsr        Auo_editor
[0003fde2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003fde8] 2068 0258                 movea.l    600(a0),a0
[0003fdec] 6100 cfce                 bsr        dirty
[0003fdf0] 93c9                      suba.l     a1,a1
[0003fdf2] 7005                      moveq.l    #5,d0
[0003fdf4] 204a                      movea.l    a2,a0
[0003fdf6] 4eb9 0003 a772            jsr        Auo_editor
Aed_swap_1:
[0003fdfc] 4fef 0014                 lea.l      20(a7),a7
[0003fe00] 4cdf 5c00                 movem.l    (a7)+,a2-a4/a6
[0003fe04] 4e75                      rts

Aed_undo:
[0003fe06] 323c 800f                 move.w     #$800F,d1
[0003fe0a] 4240                      clr.w      d0
[0003fe0c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0003fe12] 2068 0258                 movea.l    600(a0),a0
[0003fe16] 6100 cffc                 bsr        edit_key
[0003fe1a] 4e75                      rts

Aed_option:
[0003fe1c] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003fe20] 4fef fff0                 lea.l      -16(a7),a7
[0003fe24] 41f9 000d 38a0            lea.l      WIED_OPTION,a0
[0003fe2a] 2279 000d 38a8            movea.l    $000D38A8,a1
[0003fe30] 4e91                      jsr        (a1)
[0003fe32] 2448                      movea.l    a0,a2
[0003fe34] 200a                      move.l     a2,d0
[0003fe36] 6700 0226                 beq        Aed_option_1
[0003fe3a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003fe40] 2069 0258                 movea.l    600(a1),a0
[0003fe44] 2668 0014                 movea.l    20(a0),a3
[0003fe48] 2850                      movea.l    (a0),a4
[0003fe4a] 206a 0014                 movea.l    20(a2),a0
[0003fe4e] 41e8 0078                 lea.l      120(a0),a0
[0003fe52] 2f48 0008                 move.l     a0,8(a7)
[0003fe56] 2f68 000c 000c            move.l     12(a0),12(a7)
[0003fe5c] 43ec 0180                 lea.l      384(a4),a1
[0003fe60] 303c 0191                 move.w     #$0191,d0
[0003fe64] 206f 000c                 movea.l    12(a7),a0
[0003fe68] 2a68 0008                 movea.l    8(a0),a5
[0003fe6c] 206f 0008                 movea.l    8(a7),a0
[0003fe70] 4e95                      jsr        (a5)
[0003fe72] 43ef 0004                 lea.l      4(a7),a1
[0003fe76] 303c 00f1                 move.w     #$00F1,d0
[0003fe7a] 204b                      movea.l    a3,a0
[0003fe7c] 4eb9 0003 a772            jsr        Auo_editor
[0003fe82] 302f 0004                 move.w     4(a7),d0
[0003fe86] 6716                      beq.s      Aed_option_2
[0003fe88] 206a 0014                 movea.l    20(a2),a0
[0003fe8c] 0068 0001 012a            ori.w      #$0001,298(a0)
[0003fe92] 206a 0014                 movea.l    20(a2),a0
[0003fe96] 0268 fffe 00fa            andi.w     #$FFFE,250(a0)
[0003fe9c] 6014                      bra.s      Aed_option_3
Aed_option_2:
[0003fe9e] 206a 0014                 movea.l    20(a2),a0
[0003fea2] 0068 0001 00fa            ori.w      #$0001,250(a0)
[0003fea8] 206a 0014                 movea.l    20(a2),a0
[0003feac] 0268 fffe 012a            andi.w     #$FFFE,298(a0)
Aed_option_3:
[0003feb2] 43ef 0006                 lea.l      6(a7),a1
[0003feb6] 303c 00f0                 move.w     #$00F0,d0
[0003feba] 204b                      movea.l    a3,a0
[0003febc] 4eb9 0003 a772            jsr        Auo_editor
[0003fec2] 3f2f 0006                 move.w     6(a7),-(a7)
[0003fec6] 43f9 000d 4a34            lea.l      $000D4A34,a1
[0003fecc] 7008                      moveq.l    #8,d0
[0003fece] 206a 0014                 movea.l    20(a2),a0
[0003fed2] 4eb9 0005 0f94            jsr        Aob_printf
[0003fed8] 544f                      addq.w     #2,a7
[0003feda] 43ec 0182                 lea.l      386(a4),a1
[0003fede] 7012                      moveq.l    #18,d0
[0003fee0] 206a 0014                 movea.l    20(a2),a0
[0003fee4] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003feea] 43ec 0697                 lea.l      1687(a4),a1
[0003feee] 7011                      moveq.l    #17,d0
[0003fef0] 206a 0014                 movea.l    20(a2),a0
[0003fef4] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003fefa] 43d7                      lea.l      (a7),a1
[0003fefc] 303c 0107                 move.w     #$0107,d0
[0003ff00] 204b                      movea.l    a3,a0
[0003ff02] 4eb9 0003 a772            jsr        Auo_editor
[0003ff08] 2257                      movea.l    (a7),a1
[0003ff0a] 7010                      moveq.l    #16,d0
[0003ff0c] 206a 0014                 movea.l    20(a2),a0
[0003ff10] 4eb9 0005 0fd8            jsr        Aob_puttext
[0003ff16] 204a                      movea.l    a2,a0
[0003ff18] 4eb9 0005 9df4            jsr        Awi_dialog
[0003ff1e] b07c 0014                 cmp.w      #$0014,d0
[0003ff22] 6600 0132                 bne        Aed_option_4
[0003ff26] 43d7                      lea.l      (a7),a1
[0003ff28] 7003                      moveq.l    #3,d0
[0003ff2a] 206a 0014                 movea.l    20(a2),a0
[0003ff2e] 41e8 0180                 lea.l      384(a0),a0
[0003ff32] 4eb9 0006 a068            jsr        Auo_boxed
[0003ff38] 2257                      movea.l    (a7),a1
[0003ff3a] 303c 0106                 move.w     #$0106,d0
[0003ff3e] 204b                      movea.l    a3,a0
[0003ff40] 4eb9 0003 a772            jsr        Auo_editor
[0003ff46] 486f 0006                 pea.l      6(a7)
[0003ff4a] 43f9 000d 4a37            lea.l      $000D4A37,a1
[0003ff50] 7008                      moveq.l    #8,d0
[0003ff52] 206a 0014                 movea.l    20(a2),a0
[0003ff56] 4eb9 0005 10fe            jsr        Aob_scanf
[0003ff5c] 584f                      addq.w     #4,a7
[0003ff5e] 43ec 0182                 lea.l      386(a4),a1
[0003ff62] 7012                      moveq.l    #18,d0
[0003ff64] 206a 0014                 movea.l    20(a2),a0
[0003ff68] 4eb9 0005 11da            jsr        Aob_gettext
[0003ff6e] 43ec 0697                 lea.l      1687(a4),a1
[0003ff72] 7011                      moveq.l    #17,d0
[0003ff74] 206a 0014                 movea.l    20(a2),a0
[0003ff78] 4eb9 0005 11da            jsr        Aob_gettext
[0003ff7e] 102c 0697                 move.b     1687(a4),d0
[0003ff82] 6728                      beq.s      Aed_option_5
[0003ff84] 41ec 0697                 lea.l      1687(a4),a0
[0003ff88] 4eb9 0008 3180            jsr        strupr
[0003ff8e] 4eb9 0008 2f6c            jsr        strlen
[0003ff94] 600c                      bra.s      Aed_option_6
[0003ff96] 41f4 0000                 lea.l      0(a4,d0.w),a0
Aed_option_7:
[0003ff9a] 117c 0020 0697            move.b     #$20,1687(a0)
[0003ffa0] 5240                      addq.w     #1,d0
Aed_option_6:
[0003ffa2] b07c 0008                 cmp.w      #$0008,d0
[0003ffa6] 6dee                      blt.s      Aed_option_7
[0003ffa8] 422c 069f                 clr.b      1695(a4)
Aed_option_5:
[0003ffac] 43ec 0180                 lea.l      384(a4),a1
[0003ffb0] 303c 0192                 move.w     #$0192,d0
[0003ffb4] 206f 0008                 movea.l    8(a7),a0
[0003ffb8] 2a6f 000c                 movea.l    12(a7),a5
[0003ffbc] 2a6d 0008                 movea.l    8(a5),a5
[0003ffc0] 4e95                      jsr        (a5)
[0003ffc2] 33ec 0180 000d 3a94       move.w     384(a4),$000D3A94
[0003ffca] 33ef 0006 000d 3a8a       move.w     6(a7),$000D3A8A
[0003ffd2] 43ec 0182                 lea.l      386(a4),a1
[0003ffd6] 41f9 000d 3a96            lea.l      $000D3A96,a0
[0003ffdc] 4eb9 0008 2f0c            jsr        strcpy
[0003ffe2] 93c9                      suba.l     a1,a1
[0003ffe4] 303c 00d5                 move.w     #$00D5,d0
[0003ffe8] 204b                      movea.l    a3,a0
[0003ffea] 4eb9 0003 a772            jsr        Auo_editor
[0003fff0] 43f9 000d 3a94            lea.l      $000D3A94,a1
[0003fff6] 303c 00fe                 move.w     #$00FE,d0
[0003fffa] 204b                      movea.l    a3,a0
[0003fffc] 4eb9 0003 a772            jsr        Auo_editor
[00040002] 43ef 0006                 lea.l      6(a7),a1
[00040006] 303c 00ec                 move.w     #$00EC,d0
[0004000a] 204b                      movea.l    a3,a0
[0004000c] 4eb9 0003 a772            jsr        Auo_editor
[00040012] 7001                      moveq.l    #1,d0
[00040014] 206a 0014                 movea.l    20(a2),a0
[00040018] c068 00fa                 and.w      250(a0),d0
[0004001c] 6710                      beq.s      Aed_option_8
[0004001e] 93c9                      suba.l     a1,a1
[00040020] 204b                      movea.l    a3,a0
[00040022] 303c 00e0                 move.w     #$00E0,d0
[00040026] 4eb9 0003 a772            jsr        Auo_editor
[0004002c] 600e                      bra.s      Aed_option_9
Aed_option_8:
[0004002e] 93c9                      suba.l     a1,a1
[00040030] 303c 00e1                 move.w     #$00E1,d0
[00040034] 204b                      movea.l    a3,a0
[00040036] 4eb9 0003 a772            jsr        Auo_editor
Aed_option_9:
[0004003c] 93c9                      suba.l     a1,a1
[0004003e] 7006                      moveq.l    #6,d0
[00040040] 204b                      movea.l    a3,a0
[00040042] 4eb9 0003 a772            jsr        Auo_editor
[00040048] 93c9                      suba.l     a1,a1
[0004004a] 303c 00d6                 move.w     #$00D6,d0
[0004004e] 204b                      movea.l    a3,a0
[00040050] 4eb9 0003 a772            jsr        Auo_editor
Aed_option_4:
[00040056] 204a                      movea.l    a2,a0
[00040058] 4eb9 0005 85f2            jsr        Awi_delete
Aed_option_1:
[0004005e] 4fef 0010                 lea.l      16(a7),a7
[00040062] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00040066] 4e75                      rts

Aed_wrap:
[00040068] 48e7 183c                 movem.l    d3-d4/a2-a5,-(a7)
[0004006c] 4fef ffd6                 lea.l      -42(a7),a7
[00040070] 45f9 000d 47ec            lea.l      subs,a2
[00040076] 41ea f1f8                 lea.l      -3592(a2),a0
[0004007a] 226a f200                 movea.l    -3584(a2),a1
[0004007e] 4e91                      jsr        (a1)
[00040080] 2f48 0026                 move.l     a0,38(a7)
[00040084] 6700 018a                 beq        Aed_wrap_1
[00040088] 3f2a f3ba                 move.w     -3142(a2),-(a7)
[0004008c] 43f9 000d 4a34            lea.l      $000D4A34,a1
[00040092] 7003                      moveq.l    #3,d0
[00040094] 2068 0014                 movea.l    20(a0),a0
[00040098] 4eb9 0005 0f94            jsr        Aob_printf
[0004009e] 544f                      addq.w     #2,a7
[000400a0] 206f 0026                 movea.l    38(a7),a0
[000400a4] 4eb9 0005 9df4            jsr        Awi_dialog
[000400aa] 5b40                      subq.w     #5,d0
[000400ac] 6600 0158                 bne        Aed_wrap_2
[000400b0] 47ef 0024                 lea.l      36(a7),a3
[000400b4] 4853                      pea.l      (a3)
[000400b6] 43f9 000d 4a34            lea.l      $000D4A34,a1
[000400bc] 7003                      moveq.l    #3,d0
[000400be] 206f 002a                 movea.l    42(a7),a0
[000400c2] 2068 0014                 movea.l    20(a0),a0
[000400c6] 4eb9 0005 10fe            jsr        Aob_scanf
[000400cc] 584f                      addq.w     #4,a7
[000400ce] 3013                      move.w     (a3),d0
[000400d0] 6f00 0134                 ble        Aed_wrap_2
[000400d4] 3540 f3ba                 move.w     d0,-3142(a2)
[000400d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000400de] 2268 0258                 movea.l    600(a0),a1
[000400e2] 2869 0014                 movea.l    20(a1),a4
[000400e6] 43ef 0010                 lea.l      16(a7),a1
[000400ea] 204c                      movea.l    a4,a0
[000400ec] 303c 00e3                 move.w     #$00E3,d0
[000400f0] 4eb9 0003 a772            jsr        Auo_editor
[000400f6] 202f 0010                 move.l     16(a7),d0
[000400fa] 6b18                      bmi.s      Aed_wrap_3
[000400fc] 2600                      move.l     d0,d3
[000400fe] 2f6f 0018 000c            move.l     24(a7),12(a7)
[00040104] 93c9                      suba.l     a1,a1
[00040106] 204c                      movea.l    a4,a0
[00040108] 303c 00e2                 move.w     #$00E2,d0
[0004010c] 4eb9 0003 a772            jsr        Auo_editor
[00040112] 6016                      bra.s      Aed_wrap_4
Aed_wrap_3:
[00040114] 7600                      moveq.l    #0,d3
[00040116] 43ef 000c                 lea.l      12(a7),a1
[0004011a] 303c 00e9                 move.w     #$00E9,d0
[0004011e] 204c                      movea.l    a4,a0
[00040120] 4eb9 0003 a772            jsr        Auo_editor
[00040126] 53af 000c                 subq.l     #1,12(a7)
Aed_wrap_4:
[0004012a] 93c9                      suba.l     a1,a1
[0004012c] 303c 00d5                 move.w     #$00D5,d0
[00040130] 204c                      movea.l    a4,a0
[00040132] 4eb9 0003 a772            jsr        Auo_editor
[00040138] 43ef 0020                 lea.l      32(a7),a1
[0004013c] 303c 0107                 move.w     #$0107,d0
[00040140] 204c                      movea.l    a4,a0
[00040142] 4eb9 0003 a772            jsr        Auo_editor
[00040148] 2e83                      move.l     d3,(a7)
Aed_wrap_9:
[0004014a] 43d7                      lea.l      (a7),a1
[0004014c] 303c 00ca                 move.w     #$00CA,d0
[00040150] 204c                      movea.l    a4,a0
[00040152] 4eb9 0003 a772            jsr        Auo_editor
[00040158] 382f 0006                 move.w     6(a7),d4
[0004015c] b853                      cmp.w      (a3),d4
[0004015e] 6f4e                      ble.s      Aed_wrap_5
[00040160] 3813                      move.w     (a3),d4
[00040162] 2a6f 0008                 movea.l    8(a7),a5
[00040166] dac4                      adda.w     d4,a5
[00040168] b87c 0001                 cmp.w      #$0001,d4
Aed_wrap_8:
[0004016c] 6c04                      bge.s      Aed_wrap_6
[0004016e] 3813                      move.w     (a3),d4
[00040170] 6018                      bra.s      Aed_wrap_7
Aed_wrap_6:
[00040172] 534d                      subq.w     #1,a5
[00040174] 1015                      move.b     (a5),d0
[00040176] 4880                      ext.w      d0
[00040178] 206f 0020                 movea.l    32(a7),a0
[0004017c] 4eb9 0008 2e8a            jsr        strchr
[00040182] 2008                      move.l     a0,d0
[00040184] 6604                      bne.s      Aed_wrap_7
[00040186] 5344                      subq.w     #1,d4
[00040188] 60de                      bra.s      Aed_wrap_8
Aed_wrap_7:
[0004018a] 2543 0008                 move.l     d3,8(a2)
[0004018e] 2483                      move.l     d3,(a2)
[00040190] 3004                      move.w     d4,d0
[00040192] 48c0                      ext.l      d0
[00040194] 2540 000c                 move.l     d0,12(a2)
[00040198] 2540 0004                 move.l     d0,4(a2)
[0004019c] 224a                      movea.l    a2,a1
[0004019e] 204c                      movea.l    a4,a0
[000401a0] 303c 00ea                 move.w     #$00EA,d0
[000401a4] 4eb9 0003 a772            jsr        Auo_editor
[000401aa] 52af 000c                 addq.l     #1,12(a7)
Aed_wrap_5:
[000401ae] 5283                      addq.l     #1,d3
[000401b0] b6af 000c                 cmp.l      12(a7),d3
[000401b4] 6f92                      ble.s      Aed_wrap_9
[000401b6] 93c9                      suba.l     a1,a1
[000401b8] 303c 00ed                 move.w     #$00ED,d0
[000401bc] 204c                      movea.l    a4,a0
[000401be] 4eb9 0003 a772            jsr        Auo_editor
[000401c4] 93c9                      suba.l     a1,a1
[000401c6] 303c 00db                 move.w     #$00DB,d0
[000401ca] 204c                      movea.l    a4,a0
[000401cc] 4eb9 0003 a772            jsr        Auo_editor
[000401d2] 93c9                      suba.l     a1,a1
[000401d4] 7005                      moveq.l    #5,d0
[000401d6] 204c                      movea.l    a4,a0
[000401d8] 4eb9 0003 a772            jsr        Auo_editor
[000401de] 93c9                      suba.l     a1,a1
[000401e0] 303c 00d6                 move.w     #$00D6,d0
[000401e4] 204c                      movea.l    a4,a0
[000401e6] 4eb9 0003 a772            jsr        Auo_editor
[000401ec] 93c9                      suba.l     a1,a1
[000401ee] 7005                      moveq.l    #5,d0
[000401f0] 204c                      movea.l    a4,a0
[000401f2] 4eb9 0003 a772            jsr        Auo_editor
[000401f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000401fe] 2068 0258                 movea.l    600(a0),a0
[00040202] 6100 cbb8                 bsr        dirty
Aed_wrap_2:
[00040206] 206f 0026                 movea.l    38(a7),a0
[0004020a] 4eb9 0005 85f2            jsr        Awi_delete
Aed_wrap_1:
[00040210] 4fef 002a                 lea.l      42(a7),a7
[00040214] 4cdf 3c18                 movem.l    (a7)+,d3-d4/a2-a5
[00040218] 4e75                      rts

Aed_toclip:
[0004021a] 4fef ff80                 lea.l      -128(a7),a7
[0004021e] 43f9 000d 4a3b            lea.l      $000D4A3B,a1
[00040224] 2f09                      move.l     a1,-(a7)
[00040226] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004022c] 43e9 0356                 lea.l      854(a1),a1
[00040230] 41ef 0004                 lea.l      4(a7),a0
[00040234] 4eb9 0008 2f0c            jsr        strcpy
[0004023a] 225f                      movea.l    (a7)+,a1
[0004023c] 4eb9 0008 2e42            jsr        strcat
[00040242] 43d7                      lea.l      (a7),a1
[00040244] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004024a] 2068 0258                 movea.l    600(a0),a0
[0004024e] 2068 0014                 movea.l    20(a0),a0
[00040252] 6100 f7ba                 bsr        save_it
[00040256] 4fef 0080                 lea.l      128(a7),a7
[0004025a] 4e75                      rts

Aed_fromclip:
[0004025c] 4fef ff80                 lea.l      -128(a7),a7
[00040260] 43f9 000d 4a3b            lea.l      $000D4A3B,a1
[00040266] 2f09                      move.l     a1,-(a7)
[00040268] 2279 0010 ee4e            movea.l    ACSblk,a1
[0004026e] 43e9 0356                 lea.l      854(a1),a1
[00040272] 41ef 0004                 lea.l      4(a7),a0
[00040276] 4eb9 0008 2f0c            jsr        strcpy
[0004027c] 225f                      movea.l    (a7)+,a1
[0004027e] 4eb9 0008 2e42            jsr        strcat
[00040284] 43d7                      lea.l      (a7),a1
[00040286] 2079 0010 ee4e            movea.l    ACSblk,a0
[0004028c] 2068 0258                 movea.l    600(a0),a0
[00040290] 6100 f1e8                 bsr        merge_it
[00040294] 4fef 0080                 lea.l      128(a7),a7
[00040298] 4e75                      rts

Aed_saveoptions:
[0004029a] 48e7 1838                 movem.l    d3-d4/a2-a4,-(a7)
[0004029e] 5d4f                      subq.w     #6,a7
[000402a0] 49f9 0010 ee4e            lea.l      ACSblk,a4
[000402a6] 2054                      movea.l    (a4),a0
[000402a8] 2268 0258                 movea.l    600(a0),a1
[000402ac] 2451                      movea.l    (a1),a2
[000402ae] 47f9 000d 3a86            lea.l      protocnf,a3
[000402b4] 203c 0000 052e            move.l     #$0000052E,d0
[000402ba] 43ea 0172                 lea.l      370(a2),a1
[000402be] 204b                      movea.l    a3,a0
[000402c0] 4eb9 0008 3500            jsr        memcpy
[000402c6] 26bc 4145 4431            move.l     #$41454431,(a3)
[000402cc] 026b ff7f 0122            andi.w     #$FF7F,290(a3)
[000402d2] 2054                      movea.l    (a4),a0
[000402d4] 2268 0258                 movea.l    600(a0),a1
[000402d8] 2069 0014                 movea.l    20(a1),a0
[000402dc] 3768 0014 0006            move.w     20(a0),6(a3)
[000402e2] 3768 0016 0008            move.w     22(a0),8(a3)
[000402e8] 2848                      movea.l    a0,a4
[000402ea] 43ef 0002                 lea.l      2(a7),a1
[000402ee] 303c 0107                 move.w     #$0107,d0
[000402f2] 4eb9 0003 a772            jsr        Auo_editor
[000402f8] 226f 0002                 movea.l    2(a7),a1
[000402fc] 41eb 0424                 lea.l      1060(a3),a0
[00040300] 4eb9 0008 2f0c            jsr        strcpy
[00040306] 41f9 000d 4a0c            lea.l      $000D4A0C,a0
[0004030c] 4eb9 0004 b496            jsr        Af_cfgfile
[00040312] 4240                      clr.w      d0
[00040314] 4eb9 0008 0c8e            jsr        Fcreate
[0004031a] 2600                      move.l     d0,d3
[0004031c] 6f00 0076                 ble.w      Aed_saveoptions_1
[00040320] 41ea 0172                 lea.l      370(a2),a0
[00040324] 223c 0000 052e            move.l     #$0000052E,d1
[0004032a] 3003                      move.w     d3,d0
[0004032c] 4eb9 0008 0d5e            jsr        Fwrite
[00040332] 4244                      clr.w      d4
[00040334] 3e84                      move.w     d4,(a7)
[00040336] 6014                      bra.s      Aed_saveoptions_2
[00040338] 3004                      move.w     d4,d0
Aed_saveoptions_4:
[0004033a] 48c0                      ext.l      d0
[0004033c] e588                      lsl.l      #2,d0
[0004033e] 41f2 0800                 lea.l      0(a2,d0.l),a0
[00040342] 2228 00d2                 move.l     210(a0),d1
[00040346] 6702                      beq.s      Aed_saveoptions_3
[00040348] 5257                      addq.w     #1,(a7)
Aed_saveoptions_3:
[0004034a] 5244                      addq.w     #1,d4
Aed_saveoptions_2:
[0004034c] b87c 0028                 cmp.w      #$0028,d4
[00040350] 6de6                      blt.s      Aed_saveoptions_4
[00040352] 41d7                      lea.l      (a7),a0
[00040354] 7204                      moveq.l    #4,d1
[00040356] 3003                      move.w     d3,d0
[00040358] 4eb9 0008 0d5e            jsr        Fwrite
[0004035e] 4244                      clr.w      d4
[00040360] 3e84                      move.w     d4,(a7)
[00040362] 6022                      bra.s      Aed_saveoptions_5
[00040364] 3004                      move.w     d4,d0
Aed_saveoptions_7:
[00040366] 48c0                      ext.l      d0
[00040368] e588                      lsl.l      #2,d0
[0004036a] 41f2 0800                 lea.l      0(a2,d0.l),a0
[0004036e] 2228 00d2                 move.l     210(a0),d1
[00040372] 6710                      beq.s      Aed_saveoptions_6
[00040374] 2041                      movea.l    d1,a0
[00040376] 3003                      move.w     d3,d0
[00040378] 223c 0000 0102            move.l     #$00000102,d1
[0004037e] 4eb9 0008 0d5e            jsr        Fwrite
Aed_saveoptions_6:
[00040384] 5244                      addq.w     #1,d4
Aed_saveoptions_5:
[00040386] b87c 0028                 cmp.w      #$0028,d4
[0004038a] 6dd8                      blt.s      Aed_saveoptions_7
[0004038c] 3003                      move.w     d3,d0
[0004038e] 4eb9 0008 0c7e            jsr        Fclose
Aed_saveoptions_1:
[00040394] 5c4f                      addq.w     #6,a7
[00040396] 4cdf 1c18                 movem.l    (a7)+,d3-d4/a2-a4
[0004039a] 4e75                      rts

sel_edit:
[0004039c] 48e7 183e                 movem.l    d3-d4/a2-a6,-(a7)
[000403a0] 4fef ffe0                 lea.l      -32(a7),a7
[000403a4] 7600                      moveq.l    #0,d3
[000403a6] 45ef 000c                 lea.l      12(a7),a2
[000403aa] 47f9 0010 ee4e            lea.l      ACSblk,a3
[000403b0] 224a                      movea.l    a2,a1
[000403b2] 303c 00e3                 move.w     #$00E3,d0
[000403b6] 2053                      movea.l    (a3),a0
[000403b8] 2068 0258                 movea.l    600(a0),a0
[000403bc] 2868 0014                 movea.l    20(a0),a4
[000403c0] 204c                      movea.l    a4,a0
[000403c2] 4eb9 0003 a772            jsr        Auo_editor
[000403c8] 2012                      move.l     (a2),d0
[000403ca] 6b00 0156                 bmi        sel_edit_1
[000403ce] 2053                      movea.l    (a3),a0
[000403d0] 0c68 0002 02ca            cmpi.w     #$0002,714(a0)
[000403d6] 6600 014a                 bne        sel_edit_1
[000403da] 2800                      move.l     d0,d4
[000403dc] 601a                      bra.s      sel_edit_2
[000403de] 2e84                      move.l     d4,(a7)
sel_edit_3:
[000403e0] 43d7                      lea.l      (a7),a1
[000403e2] 303c 00ca                 move.w     #$00CA,d0
[000403e6] 204c                      movea.l    a4,a0
[000403e8] 4eb9 0003 a772            jsr        Auo_editor
[000403ee] 7001                      moveq.l    #1,d0
[000403f0] d0af 0004                 add.l      4(a7),d0
[000403f4] d680                      add.l      d0,d3
[000403f6] 5284                      addq.l     #1,d4
sel_edit_2:
[000403f8] b8aa 0008                 cmp.l      8(a2),d4
[000403fc] 6fe0                      ble.s      sel_edit_3
[000403fe] 7002                      moveq.l    #2,d0
[00040400] d083                      add.l      d3,d0
[00040402] 4eb9 0004 c608            jsr        Ax_malloc
[00040408] 2a48                      movea.l    a0,a5
[0004040a] 200d                      move.l     a5,d0
[0004040c] 6700 0114                 beq        sel_edit_1
[00040410] 4210                      clr.b      (a0)
[00040412] 7600                      moveq.l    #0,d3
[00040414] 2812                      move.l     (a2),d4
[00040416] 6030                      bra.s      sel_edit_4
[00040418] 2e84                      move.l     d4,(a7)
sel_edit_5:
[0004041a] 43d7                      lea.l      (a7),a1
[0004041c] 303c 00ca                 move.w     #$00CA,d0
[00040420] 204c                      movea.l    a4,a0
[00040422] 4eb9 0003 a772            jsr        Auo_editor
[00040428] 202f 0004                 move.l     4(a7),d0
[0004042c] 226f 0008                 movea.l    8(a7),a1
[00040430] 41f5 3800                 lea.l      0(a5,d3.l),a0
[00040434] 4eb9 0008 3500            jsr        memcpy
[0004043a] d6af 0004                 add.l      4(a7),d3
[0004043e] 1bbc 000a 3800            move.b     #$0A,0(a5,d3.l)
[00040444] 5283                      addq.l     #1,d3
[00040446] 5284                      addq.l     #1,d4
sel_edit_4:
[00040448] b8aa 0008                 cmp.l      8(a2),d4
[0004044c] 6fca                      ble.s      sel_edit_5
[0004044e] 4235 38ff                 clr.b      -1(a5,d3.l)
[00040452] 2053                      movea.l    (a3),a0
[00040454] 2268 0258                 movea.l    600(a0),a1
[00040458] 2869 0014                 movea.l    20(a1),a4
[0004045c] 49ec 0030                 lea.l      48(a4),a4
[00040460] 4dec 0018                 lea.l      24(a4),a6
[00040464] 2d4d 000c                 move.l     a5,12(a6)
[00040468] 3d7c 001f 0016            move.w     #$001F,22(a6)
[0004046e] 2053                      movea.l    (a3),a0
[00040470] 3028 0012                 move.w     18(a0),d0
[00040474] d040                      add.w      d0,d0
[00040476] 3940 0014                 move.w     d0,20(a4)
[0004047a] 2053                      movea.l    (a3),a0
[0004047c] 3968 0014 0016            move.w     20(a0),22(a4)
[00040482] 2053                      movea.l    (a3),a0
[00040484] 3028 0262                 move.w     610(a0),d0
[00040488] 2268 0258                 movea.l    600(a0),a1
[0004048c] 9069 0034                 sub.w      52(a1),d0
[00040490] 9068 0012                 sub.w      18(a0),d0
[00040494] 3940 0010                 move.w     d0,16(a4)
[00040498] 2053                      movea.l    (a3),a0
[0004049a] 3228 0264                 move.w     612(a0),d1
[0004049e] 2268 0258                 movea.l    600(a0),a1
[000404a2] 9269 0036                 sub.w      54(a1),d1
[000404a6] 3428 0014                 move.w     20(a0),d2
[000404aa] e242                      asr.w      #1,d2
[000404ac] 9242                      sub.w      d2,d1
[000404ae] 3941 0012                 move.w     d1,18(a4)
[000404b2] 026c ff7f 0008            andi.w     #$FF7F,8(a4)
[000404b8] 7002                      moveq.l    #2,d0
[000404ba] 2053                      movea.l    (a3),a0
[000404bc] 2068 0258                 movea.l    600(a0),a0
[000404c0] 4eb9 0004 7e6a            jsr        Adr_add
[000404c6] 2053                      movea.l    (a3),a0
[000404c8] 3228 0264                 move.w     612(a0),d1
[000404cc] 3028 0262                 move.w     610(a0),d0
[000404d0] 4eb9 0004 9140            jsr        Adr_drag
[000404d6] 7002                      moveq.l    #2,d0
[000404d8] 2053                      movea.l    (a3),a0
[000404da] 2068 0258                 movea.l    600(a0),a0
[000404de] 4eb9 0004 7f76            jsr        Adr_del
[000404e4] 4240                      clr.w      d0
[000404e6] 3940 0016                 move.w     d0,22(a4)
[000404ea] 3940 0014                 move.w     d0,20(a4)
[000404ee] 3940 0012                 move.w     d0,18(a4)
[000404f2] 3940 0010                 move.w     d0,16(a4)
[000404f6] 006c 0080 0008            ori.w      #$0080,8(a4)
[000404fc] 204d                      movea.l    a5,a0
[000404fe] 4eb9 0004 c7c8            jsr        Ax_free
[00040504] 42ae 000c                 clr.l      12(a6)
[00040508] 426e 0016                 clr.w      22(a6)
[0004050c] 93c9                      suba.l     a1,a1
[0004050e] 303c 00e2                 move.w     #$00E2,d0
[00040512] 2053                      movea.l    (a3),a0
[00040514] 2468 0258                 movea.l    600(a0),a2
[00040518] 206a 0014                 movea.l    20(a2),a0
[0004051c] 4eb9 0003 a772            jsr        Auo_editor
sel_edit_1:
[00040522] 4eb9 0003 b3b6            jsr        Aus_editor
[00040528] 2053                      movea.l    (a3),a0
[0004052a] 2268 0258                 movea.l    600(a0),a1
[0004052e] 2f51 001c                 move.l     (a1),28(a7)
[00040532] 246f 001c                 movea.l    28(a7),a2
[00040536] 426a 00c8                 clr.w      200(a2)
[0004053a] 4fef 0020                 lea.l      32(a7),a7
[0004053e] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[00040542] 4e75                      rts

ins_string:
[00040544] 48e7 103e                 movem.l    d3/a2-a6,-(a7)
[00040548] 4fef fff0                 lea.l      -16(a7),a7
[0004054c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040552] 2468 0240                 movea.l    576(a0),a2
[00040556] 2668 0258                 movea.l    600(a0),a3
[0004055a] b7ca                      cmpa.l     a2,a3
[0004055c] 6700 012e                 beq        ins_string_1
[00040560] 4eb9 0004 7e1e            jsr        Adr_start
[00040566] 4eb9 0004 7e2a            jsr        Adr_next
[0004056c] 3600                      move.w     d0,d3
[0004056e] 4a40                      tst.w      d0
[00040570] 6b00 011a                 bmi        ins_string_1
[00040574] 48c0                      ext.l      d0
[00040576] 2200                      move.l     d0,d1
[00040578] d281                      add.l      d1,d1
[0004057a] d280                      add.l      d0,d1
[0004057c] e789                      lsl.l      #3,d1
[0004057e] 286a 0014                 movea.l    20(a2),a4
[00040582] 49f4 1818                 lea.l      24(a4,d1.l),a4
[00040586] 342c 0016                 move.w     22(a4),d2
[0004058a] 947c 000b                 sub.w      #$000B,d2
[0004058e] 6712                      beq.s      ins_string_2
[00040590] 947c 0009                 sub.w      #$0009,d2
[00040594] 6700 00b6                 beq        ins_string_3
[00040598] 947c 000b                 sub.w      #$000B,d2
[0004059c] 6704                      beq.s      ins_string_2
[0004059e] 6000 00ec                 bra        ins_string_1
ins_string_2:
[000405a2] 3003                      move.w     d3,d0
[000405a4] 204a                      movea.l    a2,a0
[000405a6] 4eb9 0004 7f76            jsr        Adr_del
[000405ac] 2a6b 0014                 movea.l    20(a3),a5
[000405b0] 93c9                      suba.l     a1,a1
[000405b2] 303c 00d5                 move.w     #$00D5,d0
[000405b6] 204d                      movea.l    a5,a0
[000405b8] 4eb9 0003 a772            jsr        Auo_editor
[000405be] 93c9                      suba.l     a1,a1
[000405c0] 303c 00e2                 move.w     #$00E2,d0
[000405c4] 204d                      movea.l    a5,a0
[000405c6] 4eb9 0003 a772            jsr        Auo_editor
[000405cc] 43d7                      lea.l      (a7),a1
[000405ce] 303c 00d8                 move.w     #$00D8,d0
[000405d2] 204d                      movea.l    a5,a0
[000405d4] 4eb9 0003 a772            jsr        Auo_editor
[000405da] 43ef 0004                 lea.l      4(a7),a1
[000405de] 303c 00e7                 move.w     #$00E7,d0
[000405e2] 204d                      movea.l    a5,a0
[000405e4] 4eb9 0003 a772            jsr        Auo_editor
[000405ea] 226c 000c                 movea.l    12(a4),a1
[000405ee] 204b                      movea.l    a3,a0
[000405f0] 6100 e2a2                 bsr        put_string
[000405f4] 43ef 0008                 lea.l      8(a7),a1
[000405f8] 303c 00d8                 move.w     #$00D8,d0
[000405fc] 204d                      movea.l    a5,a0
[000405fe] 4eb9 0003 a772            jsr        Auo_editor
[00040604] 43ef 000c                 lea.l      12(a7),a1
[00040608] 303c 00e7                 move.w     #$00E7,d0
[0004060c] 204d                      movea.l    a5,a0
[0004060e] 4eb9 0003 a772            jsr        Auo_editor
[00040614] 43d7                      lea.l      (a7),a1
[00040616] 303c 00e4                 move.w     #$00E4,d0
[0004061a] 204d                      movea.l    a5,a0
[0004061c] 4eb9 0003 a772            jsr        Auo_editor
[00040622] 93c9                      suba.l     a1,a1
[00040624] 303c 00db                 move.w     #$00DB,d0
[00040628] 204d                      movea.l    a5,a0
[0004062a] 4eb9 0003 a772            jsr        Auo_editor
[00040630] 93c9                      suba.l     a1,a1
[00040632] 7005                      moveq.l    #5,d0
[00040634] 204d                      movea.l    a5,a0
[00040636] 4eb9 0003 a772            jsr        Auo_editor
[0004063c] 93c9                      suba.l     a1,a1
[0004063e] 303c 00d6                 move.w     #$00D6,d0
[00040642] 204d                      movea.l    a5,a0
[00040644] 4eb9 0003 a772            jsr        Auo_editor
[0004064a] 6040                      bra.s      ins_string_1
ins_string_3:
[0004064c] 2c53                      movea.l    (a3),a6
[0004064e] 303c 0080                 move.w     #$0080,d0
[00040652] c06e 0294                 and.w      660(a6),d0
[00040656] 6720                      beq.s      ins_string_4
[00040658] 43ee 00b8                 lea.l      184(a6),a1
[0004065c] 41f9 000d 0530            lea.l      WARN_2SAVED,a0
[00040662] 4eb9 0006 b80c            jsr        alert_str
[00040668] 5340                      subq.w     #1,d0
[0004066a] 6706                      beq.s      ins_string_5
[0004066c] 5540                      subq.w     #2,d0
[0004066e] 671c                      beq.s      ins_string_1
[00040670] 6006                      bra.s      ins_string_4
ins_string_5:
[00040672] 204b                      movea.l    a3,a0
[00040674] 6100 f44c                 bsr        ed_save
ins_string_4:
[00040678] 3003                      move.w     d3,d0
[0004067a] 204a                      movea.l    a2,a0
[0004067c] 4eb9 0004 7f76            jsr        Adr_del
[00040682] 226c 000c                 movea.l    12(a4),a1
[00040686] 204b                      movea.l    a3,a0
[00040688] 6100 ecf0                 bsr        open_file
ins_string_1:
[0004068c] 4fef 0010                 lea.l      16(a7),a7
[00040690] 4cdf 7c08                 movem.l    (a7)+,d3/a2-a6
[00040694] 4e75                      rts

info_string:
[00040696] 2f0a                      move.l     a2,-(a7)
[00040698] 2f0b                      move.l     a3,-(a7)
[0004069a] 2448                      movea.l    a0,a2
[0004069c] 2650                      movea.l    (a0),a3
[0004069e] 302b 0294                 move.w     660(a3),d0
[000406a2] c07c 0200                 and.w      #$0200,d0
[000406a6] 6620                      bne.s      info_string_1
[000406a8] 206a 0018                 movea.l    24(a2),a0
[000406ac] 700d                      moveq.l    #13,d0
[000406ae] 4eb9 0005 0fd8            jsr        Aob_puttext
[000406b4] 72ff                      moveq.l    #-1,d1
[000406b6] 303c 100d                 move.w     #$100D,d0
[000406ba] 204a                      movea.l    a2,a0
[000406bc] 226a 0066                 movea.l    102(a2),a1
[000406c0] 4e91                      jsr        (a1)
[000406c2] 377c 0005 00c8            move.w     #$0005,200(a3)
info_string_1:
[000406c8] 265f                      movea.l    (a7)+,a3
[000406ca] 245f                      movea.l    (a7)+,a2
[000406cc] 4e75                      rts

acc_fkey:
[000406ce] 48e7 003c                 movem.l    a2-a5,-(a7)
[000406d2] 4fef fefe                 lea.l      -258(a7),a7
[000406d6] 2a48                      movea.l    a0,a5
[000406d8] 2649                      movea.l    a1,a3
[000406da] 43f9 000d 4804            lea.l      $000D4804,a1
[000406e0] 41d7                      lea.l      (a7),a0
[000406e2] 703f                      moveq.l    #63,d0
[000406e4] 20d9                      move.l     (a1)+,(a0)+
acc_fkey_1:
[000406e6] 51c8 fffc                 dbf        d0,acc_fkey_1
[000406ea] 30d9                      move.w     (a1)+,(a0)+
[000406ec] 2853                      movea.l    (a3),a4
[000406ee] 302d 0016                 move.w     22(a5),d0
[000406f2] 907c 000b                 sub.w      #$000B,d0
[000406f6] 6712                      beq.s      acc_fkey_2
[000406f8] 907c 0009                 sub.w      #$0009,d0
[000406fc] 670c                      beq.s      acc_fkey_2
[000406fe] 907c 000a                 sub.w      #$000A,d0
[00040702] 6706                      beq.s      acc_fkey_2
[00040704] 5340                      subq.w     #1,d0
[00040706] 6702                      beq.s      acc_fkey_2
[00040708] 6038                      bra.s      acc_fkey_3
acc_fkey_2:
[0004070a] 203c 0000 00ff            move.l     #$000000FF,d0
[00040710] 226d 000c                 movea.l    12(a5),a1
[00040714] 41ef 0002                 lea.l      2(a7),a0
[00040718] 4eb9 0008 2f96            jsr        strncat
[0004071e] 224b                      movea.l    a3,a1
[00040720] 41d7                      lea.l      (a7),a0
[00040722] 4eb9 0004 07d4            jsr        edit_fkey
[00040728] 5340                      subq.w     #1,d0
[0004072a] 661a                      bne.s      acc_fkey_4
[0004072c] 43d7                      lea.l      (a7),a1
[0004072e] 303c 0192                 move.w     #$0192,d0
[00040732] 206c 0004                 movea.l    4(a4),a0
[00040736] 266c 0004                 movea.l    4(a4),a3
[0004073a] 246b 0004                 movea.l    4(a3),a2
[0004073e] 4e92                      jsr        (a2)
[00040740] 6004                      bra.s      acc_fkey_4
acc_fkey_3:
[00040742] 4240                      clr.w      d0
[00040744] 6002                      bra.s      acc_fkey_5
acc_fkey_4:
[00040746] 7001                      moveq.l    #1,d0
acc_fkey_5:
[00040748] 4fef 0102                 lea.l      258(a7),a7
[0004074c] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00040750] 4e75                      rts

comp_fkey:
[00040752] 1028 0001                 move.b     1(a0),d0
[00040756] 4880                      ext.w      d0
[00040758] d07c fff0                 add.w      #$FFF0,d0
[0004075c] 3210                      move.w     (a0),d1
[0004075e] c27c 0400                 and.w      #$0400,d1
[00040762] 6704                      beq.s      comp_fkey_1
[00040764] d07c 0014                 add.w      #$0014,d0
comp_fkey_1:
[00040768] 3210                      move.w     (a0),d1
[0004076a] c27c 0300                 and.w      #$0300,d1
[0004076e] 6704                      beq.s      comp_fkey_2
[00040770] d07c 000a                 add.w      #$000A,d0
comp_fkey_2:
[00040774] 1229 0001                 move.b     1(a1),d1
[00040778] 4881                      ext.w      d1
[0004077a] d27c fff0                 add.w      #$FFF0,d1
[0004077e] 3411                      move.w     (a1),d2
[00040780] c47c 0400                 and.w      #$0400,d2
[00040784] 6704                      beq.s      comp_fkey_3
[00040786] d27c 0014                 add.w      #$0014,d1
comp_fkey_3:
[0004078a] 3411                      move.w     (a1),d2
[0004078c] c47c 0300                 and.w      #$0300,d2
[00040790] 6704                      beq.s      comp_fkey_4
[00040792] d27c 000a                 add.w      #$000A,d1
comp_fkey_4:
[00040796] b240                      cmp.w      d0,d1
[00040798] 6f04                      ble.s      comp_fkey_5
[0004079a] 70ff                      moveq.l    #-1,d0
[0004079c] 4e75                      rts
comp_fkey_5:

[0004079e] b240                      cmp.w      d0,d1
[000407a0] 6c04                      bge.s      x4079e_1
[000407a2] 7001                      moveq.l    #1,d0
[000407a4] 4e75                      rts
x4079e_1:

[000407a6] 4240                      clr.w      d0
[000407a8] 4e75                      rts

drag_fkey:
[000407aa] 2f0a                      move.l     a2,-(a7)
[000407ac] 2f0b                      move.l     a3,-(a7)
[000407ae] 2648                      movea.l    a0,a3
[000407b0] 2449                      movea.l    a1,a2
[000407b2] 41ea 0002                 lea.l      2(a2),a0
[000407b6] 4eb9 0004 643c            jsr        Ast_create
[000407bc] 2748 000c                 move.l     a0,12(a3)
[000407c0] 6604                      bne.s      drag_fkey_1
[000407c2] 4240                      clr.w      d0
[000407c4] 6008                      bra.s      drag_fkey_2
drag_fkey_1:
[000407c6] 377c 000b 0016            move.w     #$000B,22(a3)
[000407cc] 7001                      moveq.l    #1,d0
drag_fkey_2:
[000407ce] 265f                      movea.l    (a7)+,a3
[000407d0] 245f                      movea.l    (a7)+,a2
[000407d2] 4e75                      rts

edit_fkey:
[000407d4] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000407d8] 554f                      subq.w     #2,a7
[000407da] 2648                      movea.l    a0,a3
[000407dc] 2849                      movea.l    a1,a4
[000407de] 4243                      clr.w      d3
[000407e0] 41f9 000d 37fe            lea.l      WIED_NEWFKEY,a0
[000407e6] 2279 000d 3806            movea.l    $000D3806,a1
[000407ec] 4e91                      jsr        (a1)
[000407ee] 2448                      movea.l    a0,a2
[000407f0] 200a                      move.l     a2,d0
[000407f2] 6606                      bne.s      edit_fkey_1
[000407f4] 4240                      clr.w      d0
[000407f6] 6000 00cc                 bra        edit_fkey_2
edit_fkey_1:
[000407fa] 248c                      move.l     a4,(a2)
[000407fc] 43eb 0002                 lea.l      2(a3),a1
[00040800] 7009                      moveq.l    #9,d0
[00040802] 206a 0014                 movea.l    20(a2),a0
[00040806] 4eb9 0005 0fd8            jsr        Aob_puttext
[0004080c] 0c53 0010                 cmpi.w     #$0010,(a3)
[00040810] 6c04                      bge.s      edit_fkey_3
[00040812] 36bc 0010                 move.w     #$0010,(a3)
edit_fkey_3:
[00040816] 3013                      move.w     (a3),d0
[00040818] c07c 0300                 and.w      #$0300,d0
[0004081c] 670a                      beq.s      edit_fkey_4
[0004081e] 206a 0014                 movea.l    20(a2),a0
[00040822] 0068 0001 003a            ori.w      #$0001,58(a0)
edit_fkey_4:
[00040828] 3013                      move.w     (a3),d0
[0004082a] c07c 0400                 and.w      #$0400,d0
[0004082e] 670a                      beq.s      edit_fkey_5
[00040830] 206a 0014                 movea.l    20(a2),a0
[00040834] 0068 0001 006a            ori.w      #$0001,106(a0)
edit_fkey_5:
[0004083a] 102b 0001                 move.b     1(a3),d0
[0004083e] 4880                      ext.w      d0
[00040840] d07c fff0                 add.w      #$FFF0,d0
[00040844] 3e80                      move.w     d0,(a7)
[00040846] 43d7                      lea.l      (a7),a1
[00040848] 206a 0014                 movea.l    20(a2),a0
[0004084c] 41e8 0090                 lea.l      144(a0),a0
[00040850] 303c 0191                 move.w     #$0191,d0
[00040854] 4eb9 0006 7456            jsr        Auo_cycle
[0004085a] 204a                      movea.l    a2,a0
[0004085c] 4eb9 0005 9df4            jsr        Awi_dialog
[00040862] b07c 000a                 cmp.w      #$000A,d0
[00040866] 6652                      bne.s      edit_fkey_6
[00040868] 43eb 0002                 lea.l      2(a3),a1
[0004086c] 7009                      moveq.l    #9,d0
[0004086e] 206a 0014                 movea.l    20(a2),a0
[00040872] 4eb9 0005 11da            jsr        Aob_gettext
[00040878] 43d7                      lea.l      (a7),a1
[0004087a] 303c 0192                 move.w     #$0192,d0
[0004087e] 206a 0014                 movea.l    20(a2),a0
[00040882] 41e8 0090                 lea.l      144(a0),a0
[00040886] 4eb9 0006 7456            jsr        Auo_cycle
[0004088c] 7010                      moveq.l    #16,d0
[0004088e] d057                      add.w      (a7),d0
[00040890] 3680                      move.w     d0,(a3)
[00040892] 7201                      moveq.l    #1,d1
[00040894] 206a 0014                 movea.l    20(a2),a0
[00040898] c268 003a                 and.w      58(a0),d1
[0004089c] 6704                      beq.s      edit_fkey_7
[0004089e] 0053 0300                 ori.w      #$0300,(a3)
edit_fkey_7:
[000408a2] 7001                      moveq.l    #1,d0
[000408a4] 206a 0014                 movea.l    20(a2),a0
[000408a8] c068 006a                 and.w      106(a0),d0
[000408ac] 6704                      beq.s      edit_fkey_8
[000408ae] 0053 0400                 ori.w      #$0400,(a3)
edit_fkey_8:
[000408b2] 102b 0002                 move.b     2(a3),d0
[000408b6] 6702                      beq.s      edit_fkey_6
[000408b8] 7601                      moveq.l    #1,d3
edit_fkey_6:
[000408ba] 204a                      movea.l    a2,a0
[000408bc] 4eb9 0005 85f2            jsr        Awi_delete
[000408c2] 3003                      move.w     d3,d0
edit_fkey_2:
[000408c4] 544f                      addq.w     #2,a7
[000408c6] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[000408ca] 4e75                      rts

key_fkey:
[000408cc] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000408d0] 4fef fef2                 lea.l      -270(a7),a7
[000408d4] 3600                      move.w     d0,d3
[000408d6] 2450                      movea.l    (a0),a2
[000408d8] 47ef 0004                 lea.l      4(a7),a3
[000408dc] 41ef 000c                 lea.l      12(a7),a0
[000408e0] 2748 0004                 move.l     a0,4(a3)
[000408e4] 43d7                      lea.l      (a7),a1
[000408e6] 303c 0191                 move.w     #$0191,d0
[000408ea] 206a 0004                 movea.l    4(a2),a0
[000408ee] 286a 0004                 movea.l    4(a2),a4
[000408f2] 286c 0004                 movea.l    4(a4),a4
[000408f6] 4e94                      jsr        (a4)
[000408f8] 4293                      clr.l      (a3)
[000408fa] 602c                      bra.s      key_fkey_1
[000408fc] 224b                      movea.l    a3,a1
key_fkey_4:
[000408fe] 303c 0194                 move.w     #$0194,d0
[00040902] 206a 0004                 movea.l    4(a2),a0
[00040906] 286a 0004                 movea.l    4(a2),a4
[0004090a] 286c 0004                 movea.l    4(a4),a4
[0004090e] 4e94                      jsr        (a4)
[00040910] 4a40                      tst.w      d0
[00040912] 6712                      beq.s      key_fkey_2
[00040914] 3003                      move.w     d3,d0
[00040916] c07c 07ff                 and.w      #$07FF,d0
[0004091a] 322f 000c                 move.w     12(a7),d1
[0004091e] b240                      cmp.w      d0,d1
[00040920] 6604                      bne.s      key_fkey_2
[00040922] 2013                      move.l     (a3),d0
[00040924] 600a                      bra.s      key_fkey_3
key_fkey_2:
[00040926] 5293                      addq.l     #1,(a3)
key_fkey_1:
[00040928] 2013                      move.l     (a3),d0
[0004092a] b097                      cmp.l      (a7),d0
[0004092c] 6dce                      blt.s      key_fkey_4
[0004092e] 70ff                      moveq.l    #-1,d0
key_fkey_3:
[00040930] 4fef 010e                 lea.l      270(a7),a7
[00040934] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00040938] 4e75                      rts

mess_fkey:
[0004093a] 2f0a                      move.l     a2,-(a7)
[0004093c] 2f0b                      move.l     a3,-(a7)
[0004093e] 2448                      movea.l    a0,a2
[00040940] 3200                      move.w     d0,d1
[00040942] 5741                      subq.w     #3,d1
[00040944] 6706                      beq.s      mess_fkey_1
[00040946] 5341                      subq.w     #1,d1
[00040948] 6718                      beq.s      mess_fkey_2
[0004094a] 6022                      bra.s      mess_fkey_3
mess_fkey_1:
[0004094c] 41f9 000d 04cb            lea.l      A_FKEYDBL,a0
[00040952] 7001                      moveq.l    #1,d0
[00040954] 4eb9 0005 a600            jsr        Awi_alert
[0004095a] 5540                      subq.w     #2,d0
[0004095c] 6610                      bne.s      mess_fkey_3
[0004095e] 4240                      clr.w      d0
[00040960] 600e                      bra.s      mess_fkey_4
mess_fkey_2:
[00040962] 93c9                      suba.l     a1,a1
[00040964] 700f                      moveq.l    #15,d0
[00040966] 204a                      movea.l    a2,a0
[00040968] 266a 0004                 movea.l    4(a2),a3
[0004096c] 4e93                      jsr        (a3)
mess_fkey_3:
[0004096e] 7001                      moveq.l    #1,d0
mess_fkey_4:
[00040970] 265f                      movea.l    (a7)+,a3
[00040972] 245f                      movea.l    (a7)+,a2
[00040974] 4e75                      rts

print_fkey:
[00040976] 2f0a                      move.l     a2,-(a7)
[00040978] 2f0b                      move.l     a3,-(a7)
[0004097a] 4fef ffd8                 lea.l      -40(a7),a7
[0004097e] 2448                      movea.l    a0,a2
[00040980] 2649                      movea.l    a1,a3
[00040982] 43f9 000d 4906            lea.l      $000D4906,a1
[00040988] 41d7                      lea.l      (a7),a0
[0004098a] 7027                      moveq.l    #39,d0
[0004098c] 10d9                      move.b     (a1)+,(a0)+
print_fkey_1:
[0004098e] 51c8 fffc                 dbf        d0,print_fkey_1
[00040992] 43f9 000d 4a6d            lea.l      $000D4A6D,a1
[00040998] 204a                      movea.l    a2,a0
[0004099a] 4eb9 0008 2f0c            jsr        strcpy
[000409a0] 3013                      move.w     (a3),d0
[000409a2] c07c 0300                 and.w      #$0300,d0
[000409a6] 6704                      beq.s      print_fkey_2
[000409a8] 14bc 0001                 move.b     #$01,(a2)
print_fkey_2:
[000409ac] 3013                      move.w     (a3),d0
[000409ae] c07c 0400                 and.w      #$0400,d0
[000409b2] 6706                      beq.s      print_fkey_3
[000409b4] 157c 005e 0001            move.b     #$5E,1(a2)
print_fkey_3:
[000409ba] 486b 0002                 pea.l      2(a3)
[000409be] 3f3c 00f9                 move.w     #$00F9,-(a7)
[000409c2] 102b 0001                 move.b     1(a3),d0
[000409c6] 4880                      ext.w      d0
[000409c8] e548                      lsl.w      #2,d0
[000409ca] 2f37 00c6                 move.l     -58(a7,d0.w),-(a7)
[000409ce] 43f9 000d 4a70            lea.l      $000D4A70,a1
[000409d4] 41ea 0002                 lea.l      2(a2),a0
[000409d8] 4eb9 0008 15ac            jsr        sprintf
[000409de] 4fef 000a                 lea.l      10(a7),a7
[000409e2] 7001                      moveq.l    #1,d0
[000409e4] 4fef 0028                 lea.l      40(a7),a7
[000409e8] 265f                      movea.l    (a7)+,a3
[000409ea] 245f                      movea.l    (a7)+,a2
[000409ec] 4e75                      rts

term_fkey:
[000409ee] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[000409f2] 4fef fef2                 lea.l      -270(a7),a7
[000409f6] 2450                      movea.l    (a0),a2
[000409f8] 47ef 000c                 lea.l      12(a7),a3
[000409fc] 49ef 0004                 lea.l      4(a7),a4
[00040a00] 294b 0004                 move.l     a3,4(a4)
[00040a04] 43d7                      lea.l      (a7),a1
[00040a06] 303c 0191                 move.w     #$0191,d0
[00040a0a] 206a 0004                 movea.l    4(a2),a0
[00040a0e] 2a6a 0004                 movea.l    4(a2),a5
[00040a12] 2a6d 0004                 movea.l    4(a5),a5
[00040a16] 4e95                      jsr        (a5)
[00040a18] 7600                      moveq.l    #0,d3
[00040a1a] 6024                      bra.s      term_fkey_1
[00040a1c] 2003                      move.l     d3,d0
term_fkey_3:
[00040a1e] e588                      lsl.l      #2,d0
[00040a20] 41f2 0800                 lea.l      0(a2,d0.l),a0
[00040a24] 2228 00d2                 move.l     210(a0),d1
[00040a28] 6714                      beq.s      term_fkey_2
[00040a2a] 2041                      movea.l    d1,a0
[00040a2c] 4eb9 0004 c7c8            jsr        Ax_free
[00040a32] 2003                      move.l     d3,d0
[00040a34] e588                      lsl.l      #2,d0
[00040a36] 41f2 0800                 lea.l      0(a2,d0.l),a0
[00040a3a] 42a8 00d2                 clr.l      210(a0)
term_fkey_2:
[00040a3e] 5283                      addq.l     #1,d3
term_fkey_1:
[00040a40] 7028                      moveq.l    #40,d0
[00040a42] b083                      cmp.l      d3,d0
[00040a44] 6ed6                      bgt.s      term_fkey_3
[00040a46] 4294                      clr.l      (a4)
[00040a48] 6066                      bra.s      term_fkey_4
[00040a4a] 224c                      movea.l    a4,a1
term_fkey_8:
[00040a4c] 303c 0194                 move.w     #$0194,d0
[00040a50] 206a 0004                 movea.l    4(a2),a0
[00040a54] 2a6a 0004                 movea.l    4(a2),a5
[00040a58] 2a6d 0004                 movea.l    4(a5),a5
[00040a5c] 4e95                      jsr        (a5)
[00040a5e] 4a40                      tst.w      d0
[00040a60] 674c                      beq.s      term_fkey_5
[00040a62] 162b 0001                 move.b     1(a3),d3
[00040a66] 4883                      ext.w      d3
[00040a68] d67c fff0                 add.w      #$FFF0,d3
[00040a6c] 3013                      move.w     (a3),d0
[00040a6e] c07c 0400                 and.w      #$0400,d0
[00040a72] 6704                      beq.s      term_fkey_6
[00040a74] d67c 0014                 add.w      #$0014,d3
term_fkey_6:
[00040a78] 3013                      move.w     (a3),d0
[00040a7a] c07c 0300                 and.w      #$0300,d0
[00040a7e] 6704                      beq.s      term_fkey_7
[00040a80] d67c 000a                 add.w      #$000A,d3
term_fkey_7:
[00040a84] 203c 0000 0102            move.l     #$00000102,d0
[00040a8a] 4eb9 0004 c608            jsr        Ax_malloc
[00040a90] 3003                      move.w     d3,d0
[00040a92] 48c0                      ext.l      d0
[00040a94] e588                      lsl.l      #2,d0
[00040a96] 43f2 0800                 lea.l      0(a2,d0.l),a1
[00040a9a] 2348 00d2                 move.l     a0,210(a1)
[00040a9e] 670e                      beq.s      term_fkey_5
[00040aa0] 224b                      movea.l    a3,a1
[00040aa2] 203c 0000 0102            move.l     #$00000102,d0
[00040aa8] 4eb9 0008 3500            jsr        memcpy
term_fkey_5:
[00040aae] 5294                      addq.l     #1,(a4)
term_fkey_4:
[00040ab0] 2014                      move.l     (a4),d0
[00040ab2] b097                      cmp.l      (a7),d0
[00040ab4] 6d94                      blt.s      term_fkey_8
[00040ab6] 42aa 0004                 clr.l      4(a2)
[00040aba] 7001                      moveq.l    #1,d0
[00040abc] 4fef 010e                 lea.l      270(a7),a7
[00040ac0] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[00040ac4] 4e75                      rts

Aed_fkey:
[00040ac6] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[00040aca] 4fef ff4c                 lea.l      -180(a7),a7
[00040ace] 41f9 000d 492e            lea.l      $000D492E,a0
[00040ad4] 43d7                      lea.l      (a7),a1
[00040ad6] 702c                      moveq.l    #44,d0
[00040ad8] 22d8                      move.l     (a0)+,(a1)+
Aed_fkey_1:
[00040ada] 51c8 fffc                 dbf        d0,Aed_fkey_1
[00040ade] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040ae4] 2ea8 0258                 move.l     600(a0),(a7)
[00040ae8] 43f9 000d 05c2            lea.l      FK_TITLE,a1
[00040aee] 41ef 0004                 lea.l      4(a7),a0
[00040af2] 4eb9 0008 2f0c            jsr        strcpy
[00040af8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040afe] 2268 0258                 movea.l    600(a0),a1
[00040b02] 2651                      movea.l    (a1),a3
[00040b04] 202b 0004                 move.l     4(a3),d0
[00040b08] 6654                      bne.s      Aed_fkey_2
[00040b0a] 41d7                      lea.l      (a7),a0
[00040b0c] 2279 000d 59c2            movea.l    $000D59C2,a1
[00040b12] 4e91                      jsr        (a1)
[00040b14] 2748 0004                 move.l     a0,4(a3)
[00040b18] 674e                      beq.s      Aed_fkey_3
[00040b1a] 4243                      clr.w      d3
[00040b1c] 6026                      bra.s      Aed_fkey_4
[00040b1e] 3003                      move.w     d3,d0
Aed_fkey_6:
[00040b20] 48c0                      ext.l      d0
[00040b22] e588                      lsl.l      #2,d0
[00040b24] 41f3 0800                 lea.l      0(a3,d0.l),a0
[00040b28] 2228 00d2                 move.l     210(a0),d1
[00040b2c] 6714                      beq.s      Aed_fkey_5
[00040b2e] 2241                      movea.l    d1,a1
[00040b30] 206b 0004                 movea.l    4(a3),a0
[00040b34] 246b 0004                 movea.l    4(a3),a2
[00040b38] 246a 0004                 movea.l    4(a2),a2
[00040b3c] 303c 0192                 move.w     #$0192,d0
[00040b40] 4e92                      jsr        (a2)
Aed_fkey_5:
[00040b42] 5243                      addq.w     #1,d3
Aed_fkey_4:
[00040b44] b67c 0028                 cmp.w      #$0028,d3
[00040b48] 6dd4                      blt.s      Aed_fkey_6
[00040b4a] 93c9                      suba.l     a1,a1
[00040b4c] 303c 0190                 move.w     #$0190,d0
[00040b50] 206b 0004                 movea.l    4(a3),a0
[00040b54] 246b 0004                 movea.l    4(a3),a2
[00040b58] 246a 0004                 movea.l    4(a2),a2
[00040b5c] 4e92                      jsr        (a2)
Aed_fkey_2:
[00040b5e] 206b 0004                 movea.l    4(a3),a0
[00040b62] 4eb9 0005 6bea            jsr        Awi_show
Aed_fkey_3:
[00040b68] 4fef 00b4                 lea.l      180(a7),a7
[00040b6c] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00040b70] 4e75                      rts

	.data

ASK_SELECT:
[000d048a]                           dc.b '[2][ | Nur den selektierten | Block speichern?| ][Ja|   Nein   ]',0
A_FKEYDBL:
[000d04cb]                           dc.b '[2][ Diese Funktionstaste ist| bereits belegt. Soll der| neue Text bernommen werden? ][Ja|  Nein  ]',0
WARN_2SAVED:
[000d0530]                           dc.b '[2][ Soll der modifizierte Text | '%s'| gesichert werden?][JA|Nein| Abbruch ]',0
WARN_SAVED:
[000d057e]                           dc.b '[2][ Soll der modifizierte Text | '%s'| gesichert werden?][JA|Nein]',0
FK_TITLE:
[000d05c2]                           dc.b ' Funktionstasten ',0
TEXT_002:
[000d05d4]                           dc.w $002d
[000d05d6]                           dc.b '-------------------',0
TEXT_006:
[000d05ea]                           dc.b ' Datei',0
TEXT_01:
[000d05f1]                           dc.b 'Rckw„rts',0
TEXT_013:
[000d05fb]                           dc.b $4f
[000d05fc]                           dc.w $4b00
TEXT_018:
[000d05fe]                           dc.b ' Suchen ',0
TEXT_02:
[000d0607]                           dc.b 'Alles',0
TEXT_026:
[000d060d]                           dc.b 'Abbruch',0
TEXT_03:
[000d0615]                           dc.b 'Tabulatorweite:',0
TEXT_032:
[000d0625]                           dc.b ' Optionen',0
TEXT_04:
[000d062f]                           dc.b ' F 1 | F 2 | F 3 | F 4 | F 5 | F 6 | F 7 | F 8 | F 9 | F10 ',0
TEXT_05:
[000d066b]                           dc.b 'Zeilen:',0
TEXT_06:
[000d0673]                           dc.b 'Text:',0
TEXT_07:
[000d0679]                           dc.b 'Bytes:',0
TEXT_08:
[000d0680]                           dc.b '  Gehe zu...      ^L',0
TEXT_09:
[000d0695]                           dc.b '1234567',0
TEXT_10:
[000d069d]                           dc.b ' Ersatz:',0
TEXT_11:
[000d06a6]                           dc.b ' Optionen ',0
TEXT_12:
[000d06b1]                           dc.b ' Zeile Finden ',0
TEXT_13:
[000d06c0]                           dc.b 'Shift',0
TEXT_14:
[000d06c6]                           dc.b 'Darstellung:',0
TEXT_15:
[000d06d3]                           dc.b '  ...sichern',0
TEXT_16:
[000d06e0]                           dc.b '  Sichern als...  ^M',0
TEXT_17:
[000d06f5]                           dc.b '  Hinzufgen...',0
TEXT_18:
[000d0705]                           dc.b '  Information...  ^I',0
TEXT_19:
[000d071a]                           dc.b '  Sichern         ^S',0
TEXT_20:
[000d072f]                           dc.b '  Zum Klemmbrett   '
[000d0742]                           dc.w $015e
[000d0744]                           dc.w $4300
TEXT_21:
[000d0746]                           dc.b '  Ersetzen...     ^R',0
TEXT_22:
[000d075b]                           dc.b 'kontinuierlich',0
TEXT_23:
[000d076a]                           dc.b 'EDITOR',0
TEXT_24:
[000d0771]                           dc.b 'Dies ist der vorbereitete Editor, der im ACSpro-Entwicklerpaket mitgeliefert wird.',0
TEXT_25:
[000d07c4]                           dc.b '  Kopieren          ^C',0
TEXT_26:
[000d07db]                           dc.b '  Zeile aussch.     ^Y',0
TEXT_27:
[000d07f2]                           dc.b '  Vom Klemmbrett   '
[000d0805]                           dc.b $01
[000d0806]                           dc.w $5e56
[000d0808]                           dc.w $0020
[000d080a]                           dc.b ' ™ffnen...       ^O',0
TEXT_29:
[000d081e]                           dc.b '  Ausschneiden      ^X',0
TEXT_30:
[000d0835]                           dc.b '  šber mich...',0
TEXT_31:
[000d0844]                           dc.b 'Modus:',0
TEXT_32:
[000d084b]                           dc.b 'Zeile:',0
TEXT_33:
[000d0852]                           dc.b '  N„chster        ^T',0
TEXT_34:
[000d0867]                           dc.b '  Finden...       ^F',0
TEXT_35:
[000d087c]                           dc.b '  N„chster        ^G',0
TEXT_36:
[000d0891]                           dc.b '  Einstellungen...   '
[000d08a6]                           dc.w $074f
[000d08a8]                           dc.w $0020
[000d08aa]                           dc.b ' Zeichen tauschen  '
[000d08bd]                           dc.b $07
[000d08be]                           dc.w $5400
TEXT_38:
[000d08c0]                           dc.b '  Einfgen          ^V',0
TEXT_39:
[000d08d7]                           dc.b 'Cursor:',0
TEXT_40:
[000d08df]                           dc.b '  Schrift...         '
[000d08f4]                           dc.w $0753
[000d08f6]                           dc.w $0043
[000d08f8]                           dc.b 'ontrol',0
TEXT_42:
[000d08ff]                           dc.b 'Text:',0
TEXT_43:
[000d0905]                           dc.b 'Umbruch:',0
TEXT_44:
[000d090e]                           dc.b '  Block suchen  '
[000d091e]                           dc.w $0754
[000d0920]                           dc.w $4142
[000d0922]                           dc.w $0042
[000d0924]                           dc.b 'alken|Strich|Block|Rahmen',0
TEXT_46:
[000d093e]                           dc.b '  Umbrechen...       '
[000d0953]                           dc.b $07
[000d0954]                           dc.w $5500
TEXT_47:
[000d0956]                           dc.b ' Funktionstaste ',0
TEXT_48:
[000d0967]                           dc.b '  Funktionstasten... '
[000d097c]                           dc.w $0746
[000d097e]                           dc.w $0054
[000d0980]                           dc.b 'aste:',0
TEXT_50:
[000d0986]                           dc.b 'ABC=abc',0
TEXT_51:
[000d098e]                           dc.b 'Abbruch',0
TEXT_52:
[000d0996]                           dc.w $4f4b
[000d0998]                           dc.w $0020
[000d099a]                           dc.b 'Bearbeiten ',0
TEXT_54:
[000d09a6]                           dc.b ' Finden ',0
TEXT_55:
[000d09af]                           dc.b ' Information ',0
TEXT_56:
[000d09bd]                           dc.b 'Wortweise',0
TEXT_57:
[000d09c7]                           dc.b ' Zeilenumbruch ',0
TEXT_58:
[000d09d7]                           dc.b 'Online-Hilfe:',0
TEXT_59:
[000d09e5]                           dc.b ' Ersetzen ',0
TEXT_60:
[000d09f0]                           dc.b 'Dateityp:',0
TEXT_61:
[000d09fa]                           dc.b 'Blockselektion:',0
TEXT_62:
[000d0a0a]                           dc.b 'Worttrenner:',0
TEXT_63:
[000d0a17]                           dc.b '  L”schen         ^D',0
TEXT_64:
[000d0a2c]                           dc.b 'Spaltenblock',0
TEXT_66:
[000d0a39]                           dc.b '  Rckg„ngig      UNDO',0
TEXT_67:
[000d0a50]                           dc.b '  Alles ausw„hlen   ^A',0
[000d0a67]                           dc.b $00
DATAS_01:
[000d0a68]                           dc.w $0000
[000d0a6a]                           dc.w $0000
[000d0a6c]                           dc.w $0208
[000d0a6e]                           dc.w $ffff
[000d0a70]                           dc.w $fffe
[000d0a72]                           dc.w $8000
[000d0a74]                           dc.w $0002
[000d0a76]                           dc.w $9ce3
[000d0a78]                           dc.w $8002
[000d0a7a]                           dc.w $9ce3
[000d0a7c]                           dc.w $8003
[000d0a7e]                           dc.w $ffff
[000d0a80]                           dc.w $ffff
[000d0a82]                           dc.w $bfff
[000d0a84]                           dc.w $fffb
[000d0a86]                           dc.w $bfff
[000d0a88]                           dc.w $fffb
[000d0a8a]                           dc.w $bfff
[000d0a8c]                           dc.w $fffb
[000d0a8e]                           dc.w $bfff
[000d0a90]                           dc.w $fffb
[000d0a92]                           dc.w $bfff
[000d0a94]                           dc.w $fffb
[000d0a96]                           dc.w $ffff
[000d0a98]                           dc.w $fffb
[000d0a9a]                           dc.w $ffff
[000d0a9c]                           dc.w $fffb
[000d0a9e]                           dc.w $ffff
[000d0aa0]                           dc.w $fffb
[000d0aa2]                           dc.w $ffff
[000d0aa4]                           dc.w $fffb
[000d0aa6]                           dc.w $ffff
[000d0aa8]                           dc.w $fffb
[000d0aaa]                           dc.w $ffff
[000d0aac]                           dc.w $fffb
[000d0aae]                           dc.w $ffff
[000d0ab0]                           dc.w $fffb
[000d0ab2]                           dc.w $ffff
[000d0ab4]                           dc.w $fffb
[000d0ab6]                           dc.w $ffff
[000d0ab8]                           dc.w $fffb
[000d0aba]                           dc.w $bfff
[000d0abc]                           dc.w $fffb
[000d0abe]                           dc.w $bfff
[000d0ac0]                           dc.w $fffb
[000d0ac2]                           dc.w $bfff
[000d0ac4]                           dc.w $fffb
[000d0ac6]                           dc.w $bfff
[000d0ac8]                           dc.w $fffb
[000d0aca]                           dc.w $b840
[000d0acc]                           dc.w $5ffb
[000d0ace]                           dc.w $bfff
[000d0ad0]                           dc.w $fffb
[000d0ad2]                           dc.w $bfff
[000d0ad4]                           dc.w $fffb
[000d0ad6]                           dc.w $bfff
[000d0ad8]                           dc.w $fffb
[000d0ada]                           dc.w $bfff
[000d0adc]                           dc.w $fffb
[000d0ade]                           dc.w $bfff
[000d0ae0]                           dc.w $fffb
[000d0ae2]                           dc.w $bfff
[000d0ae4]                           dc.w $fffb
[000d0ae6]                           dc.w $ffff
[000d0ae8]                           dc.w $ffff
[000d0aea]                           dc.w $0fff
[000d0aec]                           dc.w $ffff
[000d0aee]                           dc.w $ffff
[000d0af0]                           dc.w $fffe
[000d0af2]                           dc.w $8000
[000d0af4]                           dc.w $0002
[000d0af6]                           dc.w $9ce3
[000d0af8]                           dc.w $8002
[000d0afa]                           dc.w $9ce3
[000d0afc]                           dc.w $8003
[000d0afe]                           dc.w $ffff
[000d0b00]                           dc.w $ffff
[000d0b02]                           dc.w $bfff
[000d0b04]                           dc.w $fffb
[000d0b06]                           dc.w $bfff
[000d0b08]                           dc.w $fffb
[000d0b0a]                           dc.w $bfff
[000d0b0c]                           dc.w $fffb
[000d0b0e]                           dc.w $bfff
[000d0b10]                           dc.w $fffb
[000d0b12]                           dc.w $bfff
[000d0b14]                           dc.w $fffb
[000d0b16]                           dc.w $bfff
[000d0b18]                           dc.w $fffb
[000d0b1a]                           dc.w $bfff
[000d0b1c]                           dc.w $fffb
[000d0b1e]                           dc.w $bfff
[000d0b20]                           dc.w $fffb
[000d0b22]                           dc.w $bfff
[000d0b24]                           dc.w $fffb
[000d0b26]                           dc.w $bfff
[000d0b28]                           dc.w $fffb
[000d0b2a]                           dc.w $bfff
[000d0b2c]                           dc.w $fffb
[000d0b2e]                           dc.w $bfff
[000d0b30]                           dc.w $fffb
[000d0b32]                           dc.w $bfff
[000d0b34]                           dc.w $fffb
[000d0b36]                           dc.w $bfff
[000d0b38]                           dc.w $fffb
[000d0b3a]                           dc.w $bfff
[000d0b3c]                           dc.w $fffb
[000d0b3e]                           dc.w $bfff
[000d0b40]                           dc.w $fffb
[000d0b42]                           dc.w $bfff
[000d0b44]                           dc.w $fffb
[000d0b46]                           dc.w $b000
[000d0b48]                           dc.w $0ffb
[000d0b4a]                           dc.w $b000
[000d0b4c]                           dc.w $0ffb
[000d0b4e]                           dc.w $b000
[000d0b50]                           dc.w $0ffb
[000d0b52]                           dc.w $bfff
[000d0b54]                           dc.w $fffb
[000d0b56]                           dc.w $bfff
[000d0b58]                           dc.w $fffb
[000d0b5a]                           dc.w $bfff
[000d0b5c]                           dc.w $fffb
[000d0b5e]                           dc.w $bfff
[000d0b60]                           dc.w $fffb
[000d0b62]                           dc.w $bfff
[000d0b64]                           dc.w $fffb
[000d0b66]                           dc.w $ffff
[000d0b68]                           dc.w $ffff
[000d0b6a]                           dc.w $0fff
[000d0b6c]                           dc.w $ffff
[000d0b6e]                           dc.w $ffff
[000d0b70]                           dc.w $fffe
[000d0b72]                           dc.w $8000
[000d0b74]                           dc.w $0002
[000d0b76]                           dc.w $9ce3
[000d0b78]                           dc.w $8002
[000d0b7a]                           dc.w $9ce3
[000d0b7c]                           dc.w $8003
[000d0b7e]                           dc.w $ffff
[000d0b80]                           dc.w $ffff
[000d0b82]                           dc.w $bfff
[000d0b84]                           dc.w $fffb
[000d0b86]                           dc.w $bfff
[000d0b88]                           dc.w $fffb
[000d0b8a]                           dc.w $bfff
[000d0b8c]                           dc.w $fffb
[000d0b8e]                           dc.w $bfff
[000d0b90]                           dc.w $fffb
[000d0b92]                           dc.w $bfff
[000d0b94]                           dc.w $fffb
[000d0b96]                           dc.w $bfff
[000d0b98]                           dc.w $fffb
[000d0b9a]                           dc.w $bfff
[000d0b9c]                           dc.w $fffb
[000d0b9e]                           dc.w $bfff
[000d0ba0]                           dc.w $fffb
[000d0ba2]                           dc.w $bfff
[000d0ba4]                           dc.w $fffb
[000d0ba6]                           dc.w $bfff
[000d0ba8]                           dc.w $fffb
[000d0baa]                           dc.w $bfff
[000d0bac]                           dc.w $fffb
[000d0bae]                           dc.w $bfff
[000d0bb0]                           dc.w $fffb
[000d0bb2]                           dc.w $bfff
[000d0bb4]                           dc.w $fffb
[000d0bb6]                           dc.w $bfff
[000d0bb8]                           dc.w $fffb
[000d0bba]                           dc.w $bfff
[000d0bbc]                           dc.w $fffb
[000d0bbe]                           dc.w $bfff
[000d0bc0]                           dc.w $fffb
[000d0bc2]                           dc.w $bfff
[000d0bc4]                           dc.w $fffb
[000d0bc6]                           dc.w $b000
[000d0bc8]                           dc.w $0ffb
[000d0bca]                           dc.w $b000
[000d0bcc]                           dc.w $0ffb
[000d0bce]                           dc.w $b000
[000d0bd0]                           dc.w $0ffb
[000d0bd2]                           dc.w $bfff
[000d0bd4]                           dc.w $fffb
[000d0bd6]                           dc.w $bfff
[000d0bd8]                           dc.w $fffb
[000d0bda]                           dc.w $bfff
[000d0bdc]                           dc.w $fffb
[000d0bde]                           dc.w $bfff
[000d0be0]                           dc.w $fffb
[000d0be2]                           dc.w $bfff
[000d0be4]                           dc.w $fffb
[000d0be6]                           dc.w $ffff
[000d0be8]                           dc.w $ffff
[000d0bea]                           dc.w $0fff
[000d0bec]                           dc.w $ffff
[000d0bee]                           dc.w $ffff
[000d0bf0]                           dc.w $fffe
[000d0bf2]                           dc.w $8000
[000d0bf4]                           dc.w $0002
[000d0bf6]                           dc.w $9ce3
[000d0bf8]                           dc.w $8002
[000d0bfa]                           dc.w $8000
[000d0bfc]                           dc.w $0002
[000d0bfe]                           dc.w $ffff
[000d0c00]                           dc.w $fffe
[000d0c02]                           dc.w $a000
[000d0c04]                           dc.w $000a
[000d0c06]                           dc.w $a000
[000d0c08]                           dc.w $000a
[000d0c0a]                           dc.w $a000
[000d0c0c]                           dc.w $000a
[000d0c0e]                           dc.w $af3b
[000d0c10]                           dc.w $cf6a
[000d0c12]                           dc.w $a000
[000d0c14]                           dc.w $000a
[000d0c16]                           dc.w $a000
[000d0c18]                           dc.w $000a
[000d0c1a]                           dc.w $aff3
[000d0c1c]                           dc.w $faea
[000d0c1e]                           dc.w $a000
[000d0c20]                           dc.w $000a
[000d0c22]                           dc.w $a000
[000d0c24]                           dc.w $000a
[000d0c26]                           dc.w $addb
[000d0c28]                           dc.w $776a
[000d0c2a]                           dc.w $a000
[000d0c2c]                           dc.w $000a
[000d0c2e]                           dc.w $a000
[000d0c30]                           dc.w $000a
[000d0c32]                           dc.w $afbb
[000d0c34]                           dc.w $eeea
[000d0c36]                           dc.w $a000
[000d0c38]                           dc.w $000a
[000d0c3a]                           dc.w $a000
[000d0c3c]                           dc.w $000a
[000d0c3e]                           dc.w $aff7
[000d0c40]                           dc.w $e7ea
[000d0c42]                           dc.w $a000
[000d0c44]                           dc.w $000a
[000d0c46]                           dc.w $a000
[000d0c48]                           dc.w $000a
[000d0c4a]                           dc.w $a000
[000d0c4c]                           dc.w $0dea
[000d0c4e]                           dc.w $a000
[000d0c50]                           dc.w $000a
[000d0c52]                           dc.w $a000
[000d0c54]                           dc.w $000a
[000d0c56]                           dc.w $aff7
[000d0c58]                           dc.w $f7ea
[000d0c5a]                           dc.w $a000
[000d0c5c]                           dc.w $000a
[000d0c5e]                           dc.w $a000
[000d0c60]                           dc.w $000a
[000d0c62]                           dc.w $a000
[000d0c64]                           dc.w $000a
[000d0c66]                           dc.w $ffff
[000d0c68]                           dc.w $fffe
[000d0c6a]                           dc.w $0000
[000d0c6c]                           dc.w $0000
DATAS_02:
[000d0c6e]                           dc.w $ffff
[000d0c70]                           dc.w $fffe
[000d0c72]                           dc.w $ffff
[000d0c74]                           dc.w $fffe
[000d0c76]                           dc.w $ffff
[000d0c78]                           dc.w $fffe
[000d0c7a]                           dc.w $ffff
[000d0c7c]                           dc.w $ffff
[000d0c7e]                           dc.w $ffff
[000d0c80]                           dc.w $ffff
[000d0c82]                           dc.w $ffff
[000d0c84]                           dc.w $ffff
[000d0c86]                           dc.w $ffff
[000d0c88]                           dc.w $ffff
[000d0c8a]                           dc.w $ffff
[000d0c8c]                           dc.w $ffff
[000d0c8e]                           dc.w $ffff
[000d0c90]                           dc.w $ffff
[000d0c92]                           dc.w $ffff
[000d0c94]                           dc.w $ffff
[000d0c96]                           dc.w $ffff
[000d0c98]                           dc.w $ffff
[000d0c9a]                           dc.w $ffff
[000d0c9c]                           dc.w $ffff
[000d0c9e]                           dc.w $ffff
[000d0ca0]                           dc.w $ffff
[000d0ca2]                           dc.w $ffff
[000d0ca4]                           dc.w $ffff
[000d0ca6]                           dc.w $ffff
[000d0ca8]                           dc.w $ffff
[000d0caa]                           dc.w $ffff
[000d0cac]                           dc.w $ffff
[000d0cae]                           dc.w $ffff
[000d0cb0]                           dc.w $ffff
[000d0cb2]                           dc.w $ffff
[000d0cb4]                           dc.w $ffff
[000d0cb6]                           dc.w $ffff
[000d0cb8]                           dc.w $ffff
[000d0cba]                           dc.w $ffff
[000d0cbc]                           dc.w $ffff
[000d0cbe]                           dc.w $ffff
[000d0cc0]                           dc.w $ffff
[000d0cc2]                           dc.w $ffff
[000d0cc4]                           dc.w $ffff
[000d0cc6]                           dc.w $ffff
[000d0cc8]                           dc.w $ffff
[000d0cca]                           dc.w $ffff
[000d0ccc]                           dc.w $ffff
[000d0cce]                           dc.w $ffff
[000d0cd0]                           dc.w $ffff
[000d0cd2]                           dc.w $ffff
[000d0cd4]                           dc.w $ffff
[000d0cd6]                           dc.w $ffff
[000d0cd8]                           dc.w $ffff
[000d0cda]                           dc.w $ffff
[000d0cdc]                           dc.w $ffff
[000d0cde]                           dc.w $ffff
[000d0ce0]                           dc.w $ffff
[000d0ce2]                           dc.w $ffff
[000d0ce4]                           dc.w $ffff
[000d0ce6]                           dc.w $ffff
[000d0ce8]                           dc.w $ffff
[000d0cea]                           dc.w $0fff
[000d0cec]                           dc.w $ffff
DATAS_03:
[000d0cee]                           dc.w $0000
[000d0cf0]                           dc.w $0000
[000d0cf2]                           dc.w $0208
[000d0cf4]                           dc.w $ffff
[000d0cf6]                           dc.w $fffe
[000d0cf8]                           dc.w $8007
[000d0cfa]                           dc.w $c002
[000d0cfc]                           dc.w $9ce4
[000d0cfe]                           dc.w $4002
[000d0d00]                           dc.w $9ce7
[000d0d02]                           dc.w $c003
[000d0d04]                           dc.w $ffff
[000d0d06]                           dc.w $ffff
[000d0d08]                           dc.w $bfff
[000d0d0a]                           dc.w $fffb
[000d0d0c]                           dc.w $bfff
[000d0d0e]                           dc.w $fffb
[000d0d10]                           dc.w $bfff
[000d0d12]                           dc.w $fffb
[000d0d14]                           dc.w $bfff
[000d0d16]                           dc.w $fffb
[000d0d18]                           dc.w $bfff
[000d0d1a]                           dc.w $fffb
[000d0d1c]                           dc.w $ffff
[000d0d1e]                           dc.w $fffb
[000d0d20]                           dc.w $ffff
[000d0d22]                           dc.w $fffb
[000d0d24]                           dc.w $ffff
[000d0d26]                           dc.w $06fb
[000d0d28]                           dc.w $ffff
[000d0d2a]                           dc.w $fffb
[000d0d2c]                           dc.w $ffff
[000d0d2e]                           dc.w $fffb
[000d0d30]                           dc.w $ffff
[000d0d32]                           dc.w $fffb
[000d0d34]                           dc.w $ffff
[000d0d36]                           dc.w $fffb
[000d0d38]                           dc.w $ffff
[000d0d3a]                           dc.w $fffb
[000d0d3c]                           dc.w $ffff
[000d0d3e]                           dc.w $fffb
[000d0d40]                           dc.w $bfff
[000d0d42]                           dc.w $fffb
[000d0d44]                           dc.w $bfff
[000d0d46]                           dc.w $fffb
[000d0d48]                           dc.w $bfff
[000d0d4a]                           dc.w $fffb
[000d0d4c]                           dc.w $bfff
[000d0d4e]                           dc.w $fffb
[000d0d50]                           dc.w $b840
[000d0d52]                           dc.w $5ffb
[000d0d54]                           dc.w $bfff
[000d0d56]                           dc.w $fffb
[000d0d58]                           dc.w $bfff
[000d0d5a]                           dc.w $fffb
[000d0d5c]                           dc.w $bfff
[000d0d5e]                           dc.w $fffb
[000d0d60]                           dc.w $bfff
[000d0d62]                           dc.w $fffb
[000d0d64]                           dc.w $bfff
[000d0d66]                           dc.w $fffb
[000d0d68]                           dc.w $bfff
[000d0d6a]                           dc.w $fffb
[000d0d6c]                           dc.w $ffff
[000d0d6e]                           dc.w $ffff
[000d0d70]                           dc.w $0fff
[000d0d72]                           dc.w $ffff
[000d0d74]                           dc.w $ffff
[000d0d76]                           dc.w $fffe
[000d0d78]                           dc.w $8007
[000d0d7a]                           dc.w $c002
[000d0d7c]                           dc.w $9ce4
[000d0d7e]                           dc.w $4002
[000d0d80]                           dc.w $9ce7
[000d0d82]                           dc.w $c003
[000d0d84]                           dc.w $ffff
[000d0d86]                           dc.w $ffff
[000d0d88]                           dc.w $bfff
[000d0d8a]                           dc.w $fffb
[000d0d8c]                           dc.w $bfff
[000d0d8e]                           dc.w $fffb
[000d0d90]                           dc.w $bfff
[000d0d92]                           dc.w $fffb
[000d0d94]                           dc.w $bfff
[000d0d96]                           dc.w $fffb
[000d0d98]                           dc.w $bfff
[000d0d9a]                           dc.w $fffb
[000d0d9c]                           dc.w $bfff
[000d0d9e]                           dc.w $fffb
[000d0da0]                           dc.w $bfff
[000d0da2]                           dc.w $fffb
[000d0da4]                           dc.w $bffc
[000d0da6]                           dc.w $007b
[000d0da8]                           dc.w $bfff
[000d0daa]                           dc.w $fffb
[000d0dac]                           dc.w $bfff
[000d0dae]                           dc.w $fffb
[000d0db0]                           dc.w $bfff
[000d0db2]                           dc.w $fffb
[000d0db4]                           dc.w $bfff
[000d0db6]                           dc.w $fffb
[000d0db8]                           dc.w $bfff
[000d0dba]                           dc.w $fffb
[000d0dbc]                           dc.w $bfff
[000d0dbe]                           dc.w $fffb
[000d0dc0]                           dc.w $bfff
[000d0dc2]                           dc.w $fffb
[000d0dc4]                           dc.w $bfff
[000d0dc6]                           dc.w $fffb
[000d0dc8]                           dc.w $bfff
[000d0dca]                           dc.w $fffb
[000d0dcc]                           dc.w $b000
[000d0dce]                           dc.w $0ffb
[000d0dd0]                           dc.w $b000
[000d0dd2]                           dc.w $0ffb
[000d0dd4]                           dc.w $b000
[000d0dd6]                           dc.w $0ffb
[000d0dd8]                           dc.w $bfff
[000d0dda]                           dc.w $fffb
[000d0ddc]                           dc.w $bfff
[000d0dde]                           dc.w $fffb
[000d0de0]                           dc.w $bfff
[000d0de2]                           dc.w $fffb
[000d0de4]                           dc.w $bfff
[000d0de6]                           dc.w $fffb
[000d0de8]                           dc.w $bfff
[000d0dea]                           dc.w $fffb
[000d0dec]                           dc.w $ffff
[000d0dee]                           dc.w $ffff
[000d0df0]                           dc.w $0fff
[000d0df2]                           dc.w $ffff
[000d0df4]                           dc.w $ffff
[000d0df6]                           dc.w $fffe
[000d0df8]                           dc.w $8007
[000d0dfa]                           dc.w $c002
[000d0dfc]                           dc.w $9ce4
[000d0dfe]                           dc.w $4002
[000d0e00]                           dc.w $9ce7
[000d0e02]                           dc.w $c003
[000d0e04]                           dc.w $ffff
[000d0e06]                           dc.w $ffff
[000d0e08]                           dc.w $bfff
[000d0e0a]                           dc.w $fffb
[000d0e0c]                           dc.w $bfff
[000d0e0e]                           dc.w $fffb
[000d0e10]                           dc.w $bfff
[000d0e12]                           dc.w $fffb
[000d0e14]                           dc.w $bfff
[000d0e16]                           dc.w $fffb
[000d0e18]                           dc.w $bfff
[000d0e1a]                           dc.w $fffb
[000d0e1c]                           dc.w $bfff
[000d0e1e]                           dc.w $fffb
[000d0e20]                           dc.w $bfff
[000d0e22]                           dc.w $fffb
[000d0e24]                           dc.w $bffc
[000d0e26]                           dc.w $007b
[000d0e28]                           dc.w $bfff
[000d0e2a]                           dc.w $fffb
[000d0e2c]                           dc.w $bfff
[000d0e2e]                           dc.w $fffb
[000d0e30]                           dc.w $bfff
[000d0e32]                           dc.w $fffb
[000d0e34]                           dc.w $bfff
[000d0e36]                           dc.w $fffb
[000d0e38]                           dc.w $bfff
[000d0e3a]                           dc.w $fffb
[000d0e3c]                           dc.w $bfff
[000d0e3e]                           dc.w $fffb
[000d0e40]                           dc.w $bfff
[000d0e42]                           dc.w $fffb
[000d0e44]                           dc.w $bfff
[000d0e46]                           dc.w $fffb
[000d0e48]                           dc.w $bfff
[000d0e4a]                           dc.w $fffb
[000d0e4c]                           dc.w $b000
[000d0e4e]                           dc.w $0ffb
[000d0e50]                           dc.w $b000
[000d0e52]                           dc.w $0ffb
[000d0e54]                           dc.w $b000
[000d0e56]                           dc.w $0ffb
[000d0e58]                           dc.w $bfff
[000d0e5a]                           dc.w $fffb
[000d0e5c]                           dc.w $bfff
[000d0e5e]                           dc.w $fffb
[000d0e60]                           dc.w $bfff
[000d0e62]                           dc.w $fffb
[000d0e64]                           dc.w $bfff
[000d0e66]                           dc.w $fffb
[000d0e68]                           dc.w $bfff
[000d0e6a]                           dc.w $fffb
[000d0e6c]                           dc.w $ffff
[000d0e6e]                           dc.w $ffff
[000d0e70]                           dc.w $0fff
[000d0e72]                           dc.w $ffff
[000d0e74]                           dc.w $ffff
[000d0e76]                           dc.w $fffe
[000d0e78]                           dc.w $8007
[000d0e7a]                           dc.w $c002
[000d0e7c]                           dc.w $9ce4
[000d0e7e]                           dc.w $4002
[000d0e80]                           dc.w $8007
[000d0e82]                           dc.w $c002
[000d0e84]                           dc.w $ffff
[000d0e86]                           dc.w $fffe
[000d0e88]                           dc.w $a004
[000d0e8a]                           dc.w $004a
[000d0e8c]                           dc.w $a005
[000d0e8e]                           dc.w $fd4a
[000d0e90]                           dc.w $a004
[000d0e92]                           dc.w $004a
[000d0e94]                           dc.w $af3d
[000d0e96]                           dc.w $fd6a
[000d0e98]                           dc.w $a004
[000d0e9a]                           dc.w $004a
[000d0e9c]                           dc.w $a005
[000d0e9e]                           dc.w $fd4a
[000d0ea0]                           dc.w $affc
[000d0ea2]                           dc.w $006a
[000d0ea4]                           dc.w $a004
[000d0ea6]                           dc.w $004a
[000d0ea8]                           dc.w $a004
[000d0eaa]                           dc.w $004a
[000d0eac]                           dc.w $addd
[000d0eae]                           dc.w $fd6a
[000d0eb0]                           dc.w $a004
[000d0eb2]                           dc.w $004a
[000d0eb4]                           dc.w $a005
[000d0eb6]                           dc.w $fd4a
[000d0eb8]                           dc.w $afbc
[000d0eba]                           dc.w $006a
[000d0ebc]                           dc.w $a007
[000d0ebe]                           dc.w $ffca
[000d0ec0]                           dc.w $a000
[000d0ec2]                           dc.w $000a
[000d0ec4]                           dc.w $aff7
[000d0ec6]                           dc.w $e7ea
[000d0ec8]                           dc.w $a000
[000d0eca]                           dc.w $000a
[000d0ecc]                           dc.w $a000
[000d0ece]                           dc.w $000a
[000d0ed0]                           dc.w $a000
[000d0ed2]                           dc.w $0dea
[000d0ed4]                           dc.w $a000
[000d0ed6]                           dc.w $000a
[000d0ed8]                           dc.w $a000
[000d0eda]                           dc.w $000a
[000d0edc]                           dc.w $aff7
[000d0ede]                           dc.w $f7ea
[000d0ee0]                           dc.w $a000
[000d0ee2]                           dc.w $000a
[000d0ee4]                           dc.w $a000
[000d0ee6]                           dc.w $000a
[000d0ee8]                           dc.w $a000
[000d0eea]                           dc.w $000a
[000d0eec]                           dc.w $ffff
[000d0eee]                           dc.w $fffe
[000d0ef0]                           dc.w $0000
[000d0ef2]                           dc.w $0000
DATAS_04:
[000d0ef4]                           dc.w $ffff
[000d0ef6]                           dc.w $fffe
[000d0ef8]                           dc.w $ffff
[000d0efa]                           dc.w $fffe
[000d0efc]                           dc.w $ffff
[000d0efe]                           dc.w $fffe
[000d0f00]                           dc.w $ffff
[000d0f02]                           dc.w $ffff
[000d0f04]                           dc.w $ffff
[000d0f06]                           dc.w $ffff
[000d0f08]                           dc.w $ffff
[000d0f0a]                           dc.w $ffff
[000d0f0c]                           dc.w $ffff
[000d0f0e]                           dc.w $ffff
[000d0f10]                           dc.w $ffff
[000d0f12]                           dc.w $ffff
[000d0f14]                           dc.w $ffff
[000d0f16]                           dc.w $ffff
[000d0f18]                           dc.w $ffff
[000d0f1a]                           dc.w $ffff
[000d0f1c]                           dc.w $ffff
[000d0f1e]                           dc.w $ffff
[000d0f20]                           dc.w $ffff
[000d0f22]                           dc.w $ffff
[000d0f24]                           dc.w $ffff
[000d0f26]                           dc.w $ffff
[000d0f28]                           dc.w $ffff
[000d0f2a]                           dc.w $ffff
[000d0f2c]                           dc.w $ffff
[000d0f2e]                           dc.w $ffff
[000d0f30]                           dc.w $ffff
[000d0f32]                           dc.w $ffff
[000d0f34]                           dc.w $ffff
[000d0f36]                           dc.w $ffff
[000d0f38]                           dc.w $ffff
[000d0f3a]                           dc.w $ffff
[000d0f3c]                           dc.w $ffff
[000d0f3e]                           dc.w $ffff
[000d0f40]                           dc.w $ffff
[000d0f42]                           dc.w $ffff
[000d0f44]                           dc.w $ffff
[000d0f46]                           dc.w $ffff
[000d0f48]                           dc.w $ffff
[000d0f4a]                           dc.w $ffff
[000d0f4c]                           dc.w $ffff
[000d0f4e]                           dc.w $ffff
[000d0f50]                           dc.w $ffff
[000d0f52]                           dc.w $ffff
[000d0f54]                           dc.w $ffff
[000d0f56]                           dc.w $ffff
[000d0f58]                           dc.w $ffff
[000d0f5a]                           dc.w $ffff
[000d0f5c]                           dc.w $ffff
[000d0f5e]                           dc.w $ffff
[000d0f60]                           dc.w $ffff
[000d0f62]                           dc.w $ffff
[000d0f64]                           dc.w $ffff
[000d0f66]                           dc.w $ffff
[000d0f68]                           dc.w $ffff
[000d0f6a]                           dc.w $ffff
[000d0f6c]                           dc.w $ffff
[000d0f6e]                           dc.w $ffff
[000d0f70]                           dc.w $0fff
[000d0f72]                           dc.w $ffff
DATAS_05:
[000d0f74]                           dc.w $0000
[000d0f76]                           dc.w $0000
[000d0f78]                           dc.w $0088
[000d0f7a]                           dc.w $0000
[000d0f7c]                           dc.w $7ffe
[000d0f7e]                           dc.w $63fe
[000d0f80]                           dc.w $62fe
[000d0f82]                           dc.w $63fe
[000d0f84]                           dc.w $60fe
[000d0f86]                           dc.w $61fe
[000d0f88]                           dc.w $611e
[000d0f8a]                           dc.w $6116
[000d0f8c]                           dc.w $7f1e
[000d0f8e]                           dc.w $7f06
[000d0f90]                           dc.w $7f06
[000d0f92]                           dc.w $7f06
[000d0f94]                           dc.w $7f06
[000d0f96]                           dc.w $7ffe
[000d0f98]                           dc.w $0000
[000d0f9a]                           dc.w $0000
[000d0f9c]                           dc.w $7ffe
[000d0f9e]                           dc.w $63fe
[000d0fa0]                           dc.w $62fe
[000d0fa2]                           dc.w $63fe
[000d0fa4]                           dc.w $60fe
[000d0fa6]                           dc.w $61fe
[000d0fa8]                           dc.w $611e
[000d0faa]                           dc.w $6116
[000d0fac]                           dc.w $7f1e
[000d0fae]                           dc.w $7f06
[000d0fb0]                           dc.w $7f06
[000d0fb2]                           dc.w $7f06
[000d0fb4]                           dc.w $7f06
[000d0fb6]                           dc.w $7ffe
[000d0fb8]                           dc.w $0000
[000d0fba]                           dc.w $0000
[000d0fbc]                           dc.w $7ffe
[000d0fbe]                           dc.w $63fe
[000d0fc0]                           dc.w $62fe
[000d0fc2]                           dc.w $63fe
[000d0fc4]                           dc.w $60fe
[000d0fc6]                           dc.w $61fe
[000d0fc8]                           dc.w $611e
[000d0fca]                           dc.w $6116
[000d0fcc]                           dc.w $7f1e
[000d0fce]                           dc.w $7f06
[000d0fd0]                           dc.w $7f06
[000d0fd2]                           dc.w $7f06
[000d0fd4]                           dc.w $7f06
[000d0fd6]                           dc.w $7ffe
[000d0fd8]                           dc.w $0000
[000d0fda]                           dc.w $0001
[000d0fdc]                           dc.w $3e01
[000d0fde]                           dc.w $2301
[000d0fe0]                           dc.b '"# !'
[000d0fe7]                           dc.b $f1
[000d0fe8]                           dc.w $2119
[000d0fea]                           dc.w $2115
[000d0fec]                           dc.w $3f1d
[000d0fee]                           dc.w $0105
[000d0ff0]                           dc.w $0105
[000d0ff2]                           dc.w $0105
[000d0ff4]                           dc.w $0105
[000d0ff6]                           dc.w $01fd
[000d0ff8]                           dc.w $ffff
DATAS_06:
[000d0ffa]                           dc.w $ffff
[000d0ffc]                           dc.w $ffff
[000d0ffe]                           dc.w $ffff
[000d1000]                           dc.w $ffff
[000d1002]                           dc.w $ffff
[000d1004]                           dc.w $ffff
[000d1006]                           dc.w $ffff
[000d1008]                           dc.w $ffff
[000d100a]                           dc.w $ffff
[000d100c]                           dc.w $ffff
[000d100e]                           dc.w $ffff
[000d1010]                           dc.w $ffff
[000d1012]                           dc.w $ffff
[000d1014]                           dc.w $ffff
[000d1016]                           dc.w $ffff
[000d1018]                           dc.w $ffff
DATAS_07:
[000d101a]                           dc.w $0000
[000d101c]                           dc.w $0000
[000d101e]                           dc.w $0088
[000d1020]                           dc.w $0000
[000d1022]                           dc.w $7ffe
[000d1024]                           dc.w $63fe
[000d1026]                           dc.w $62fe
[000d1028]                           dc.w $63fe
[000d102a]                           dc.w $60fe
[000d102c]                           dc.w $61fe
[000d102e]                           dc.w $611e
[000d1030]                           dc.w $6116
[000d1032]                           dc.w $7f1e
[000d1034]                           dc.w $7f06
[000d1036]                           dc.w $7f06
[000d1038]                           dc.w $7f06
[000d103a]                           dc.w $7f06
[000d103c]                           dc.w $7ffe
[000d103e]                           dc.w $0000
[000d1040]                           dc.w $0000
[000d1042]                           dc.w $7ffe
[000d1044]                           dc.w $63fe
[000d1046]                           dc.w $62fe
[000d1048]                           dc.w $63fe
[000d104a]                           dc.w $60fe
[000d104c]                           dc.w $61fe
[000d104e]                           dc.w $611e
[000d1050]                           dc.w $6116
[000d1052]                           dc.w $7f1e
[000d1054]                           dc.w $7f06
[000d1056]                           dc.w $7f06
[000d1058]                           dc.w $7f06
[000d105a]                           dc.w $7f06
[000d105c]                           dc.w $7ffe
[000d105e]                           dc.w $0000
[000d1060]                           dc.w $0000
[000d1062]                           dc.w $7ffe
[000d1064]                           dc.w $63fe
[000d1066]                           dc.w $62fe
[000d1068]                           dc.w $63fe
[000d106a]                           dc.w $60fe
[000d106c]                           dc.w $61fe
[000d106e]                           dc.w $611e
[000d1070]                           dc.w $6116
[000d1072]                           dc.w $7f1e
[000d1074]                           dc.w $7f06
[000d1076]                           dc.w $7f06
[000d1078]                           dc.w $7f06
[000d107a]                           dc.w $7f06
[000d107c]                           dc.w $7ffe
[000d107e]                           dc.w $0000
[000d1080]                           dc.w $ffff
[000d1082]                           dc.w $be00
[000d1084]                           dc.w $a300
[000d1086]                           dc.w $a280
[000d1088]                           dc.w $a380
[000d108a]                           dc.w $a080
[000d108c]                           dc.w $a1f0
[000d108e]                           dc.w $a118
[000d1090]                           dc.w $a114
[000d1092]                           dc.w $bf1c
[000d1094]                           dc.w $8104
[000d1096]                           dc.w $8104
[000d1098]                           dc.w $8104
[000d109a]                           dc.w $8104
[000d109c]                           dc.w $81fc
[000d109e]                           dc.w $8000
DATAS_08:
[000d10a0]                           dc.w $ffff
[000d10a2]                           dc.w $ffff
[000d10a4]                           dc.w $ffff
[000d10a6]                           dc.w $ffff
[000d10a8]                           dc.w $ffff
[000d10aa]                           dc.w $ffff
[000d10ac]                           dc.w $ffff
[000d10ae]                           dc.w $ffff
[000d10b0]                           dc.w $ffff
[000d10b2]                           dc.w $ffff
[000d10b4]                           dc.w $ffff
[000d10b6]                           dc.w $ffff
[000d10b8]                           dc.w $ffff
[000d10ba]                           dc.w $ffff
[000d10bc]                           dc.w $ffff
[000d10be]                           dc.w $ffff
DATAS_09:
[000d10c0]                           dc.w $0000
[000d10c2]                           dc.w $0000
[000d10c4]                           dc.w $0088
[000d10c6]                           dc.w $0000
[000d10c8]                           dc.w $7dde
[000d10ca]                           dc.w $7dde
[000d10cc]                           dc.w $7dde
[000d10ce]                           dc.w $7c9e
[000d10d0]                           dc.w $7ebe
[000d10d2]                           dc.w $7e3e
[000d10d4]                           dc.w $7f7e
[000d10d6]                           dc.b '~>~Žx'
[000d10db]                           dc.b $b6
[000d10dc]                           dc.w $76b6
[000d10de]                           dc.w $76b6
[000d10e0]                           dc.w $76ce
[000d10e2]                           dc.w $79fe
[000d10e4]                           dc.w $0000
[000d10e6]                           dc.w $0000
[000d10e8]                           dc.w $7dde
[000d10ea]                           dc.w $7dde
[000d10ec]                           dc.w $7dde
[000d10ee]                           dc.w $7c9e
[000d10f0]                           dc.w $7ebe
[000d10f2]                           dc.w $7e3e
[000d10f4]                           dc.w $7f7e
[000d10f6]                           dc.b '~>~Žx'
[000d10fb]                           dc.b $b6
[000d10fc]                           dc.w $76b6
[000d10fe]                           dc.w $76b6
[000d1100]                           dc.w $76ce
[000d1102]                           dc.w $79fe
[000d1104]                           dc.w $0000
[000d1106]                           dc.w $0000
[000d1108]                           dc.w $7ffe
[000d110a]                           dc.w $7ffe
[000d110c]                           dc.w $7ffe
[000d110e]                           dc.w $7ffe
[000d1110]                           dc.w $7ffe
[000d1112]                           dc.w $7ffe
[000d1114]                           dc.w $7ffe
[000d1116]                           dc.w $7ffe
[000d1118]                           dc.w $7ffe
[000d111a]                           dc.w $7ffe
[000d111c]                           dc.w $7ffe
[000d111e]                           dc.w $7ffe
[000d1120]                           dc.w $7ffe
[000d1122]                           dc.w $7ffe
[000d1124]                           dc.w $0000
[000d1126]                           dc.w $0001
[000d1128]                           dc.w $0001
[000d112a]                           dc.w $0001
[000d112c]                           dc.w $0001
[000d112e]                           dc.w $0001
[000d1130]                           dc.w $0001
[000d1132]                           dc.w $0001
[000d1134]                           dc.w $0001
[000d1136]                           dc.w $0001
[000d1138]                           dc.w $0001
[000d113a]                           dc.w $0001
[000d113c]                           dc.w $0001
[000d113e]                           dc.w $0001
[000d1140]                           dc.w $0001
[000d1142]                           dc.w $0001
[000d1144]                           dc.w $ffff
DATAS_10:
[000d1146]                           dc.w $ffff
[000d1148]                           dc.w $ffff
[000d114a]                           dc.w $ffff
[000d114c]                           dc.w $ffff
[000d114e]                           dc.w $ffff
[000d1150]                           dc.w $ffff
[000d1152]                           dc.w $ffff
[000d1154]                           dc.w $ffff
[000d1156]                           dc.w $ffff
[000d1158]                           dc.w $ffff
[000d115a]                           dc.w $ffff
[000d115c]                           dc.w $ffff
[000d115e]                           dc.w $ffff
[000d1160]                           dc.w $ffff
[000d1162]                           dc.w $ffff
[000d1164]                           dc.w $ffff
DATAS_11:
[000d1166]                           dc.w $0000
[000d1168]                           dc.w $0000
[000d116a]                           dc.w $0088
[000d116c]                           dc.w $0000
[000d116e]                           dc.w $7dde
[000d1170]                           dc.w $7dde
[000d1172]                           dc.w $7dde
[000d1174]                           dc.w $7c9e
[000d1176]                           dc.w $7ebe
[000d1178]                           dc.w $7e3e
[000d117a]                           dc.w $7f7e
[000d117c]                           dc.b '~>~Žx'
[000d1181]                           dc.b $b6
[000d1182]                           dc.w $76b6
[000d1184]                           dc.w $76b6
[000d1186]                           dc.w $76ce
[000d1188]                           dc.w $79fe
[000d118a]                           dc.w $0000
[000d118c]                           dc.w $0000
[000d118e]                           dc.w $7dde
[000d1190]                           dc.w $7dde
[000d1192]                           dc.w $7dde
[000d1194]                           dc.w $7c9e
[000d1196]                           dc.w $7ebe
[000d1198]                           dc.w $7e3e
[000d119a]                           dc.w $7f7e
[000d119c]                           dc.b '~>~Žx'
[000d11a1]                           dc.b $b6
[000d11a2]                           dc.w $76b6
[000d11a4]                           dc.w $76b6
[000d11a6]                           dc.w $76ce
[000d11a8]                           dc.w $79fe
[000d11aa]                           dc.w $0000
[000d11ac]                           dc.w $0000
[000d11ae]                           dc.w $7ffe
[000d11b0]                           dc.w $7ffe
[000d11b2]                           dc.w $7ffe
[000d11b4]                           dc.w $7ffe
[000d11b6]                           dc.w $7ffe
[000d11b8]                           dc.w $7ffe
[000d11ba]                           dc.w $7ffe
[000d11bc]                           dc.w $7ffe
[000d11be]                           dc.w $7ffe
[000d11c0]                           dc.w $7ffe
[000d11c2]                           dc.w $7ffe
[000d11c4]                           dc.w $7ffe
[000d11c6]                           dc.w $7ffe
[000d11c8]                           dc.w $7ffe
[000d11ca]                           dc.w $0000
[000d11cc]                           dc.w $ffff
[000d11ce]                           dc.w $8000
[000d11d0]                           dc.w $8000
[000d11d2]                           dc.w $8000
[000d11d4]                           dc.w $8000
[000d11d6]                           dc.w $8000
[000d11d8]                           dc.w $8000
[000d11da]                           dc.w $8000
[000d11dc]                           dc.w $8000
[000d11de]                           dc.w $8000
[000d11e0]                           dc.w $8000
[000d11e2]                           dc.w $8000
[000d11e4]                           dc.w $8000
[000d11e6]                           dc.w $8000
[000d11e8]                           dc.w $8000
[000d11ea]                           dc.w $8000
DATAS_12:
[000d11ec]                           dc.w $ffff
[000d11ee]                           dc.w $ffff
[000d11f0]                           dc.w $ffff
[000d11f2]                           dc.w $ffff
[000d11f4]                           dc.w $ffff
[000d11f6]                           dc.w $ffff
[000d11f8]                           dc.w $ffff
[000d11fa]                           dc.w $ffff
[000d11fc]                           dc.w $ffff
[000d11fe]                           dc.w $ffff
[000d1200]                           dc.w $ffff
[000d1202]                           dc.w $ffff
[000d1204]                           dc.w $ffff
[000d1206]                           dc.w $ffff
[000d1208]                           dc.w $ffff
[000d120a]                           dc.w $ffff
DATAS_13:
[000d120c]                           dc.w $0000
[000d120e]                           dc.w $0000
[000d1210]                           dc.w $0088
[000d1212]                           dc.w $0000
[000d1214]                           dc.w $7ffc
[000d1216]                           dc.w $7ffc
[000d1218]                           dc.b '`|`\`|a'
[000d121f]                           dc.b $0c
[000d1220]                           dc.w $610c
[000d1222]                           dc.w $67cc
[000d1224]                           dc.w $610c
[000d1226]                           dc.w $610c
[000d1228]                           dc.w $600c
[000d122a]                           dc.w $600c
[000d122c]                           dc.w $7ffc
[000d122e]                           dc.w $7ffc
[000d1230]                           dc.w $0000
[000d1232]                           dc.w $0000
[000d1234]                           dc.w $7ffc
[000d1236]                           dc.w $7ffc
[000d1238]                           dc.b '`|`\`|a'
[000d123f]                           dc.b $0c
[000d1240]                           dc.w $610c
[000d1242]                           dc.w $67cc
[000d1244]                           dc.w $610c
[000d1246]                           dc.w $610c
[000d1248]                           dc.w $600c
[000d124a]                           dc.w $600c
[000d124c]                           dc.w $7ffc
[000d124e]                           dc.w $7ffc
[000d1250]                           dc.w $0000
[000d1252]                           dc.w $0000
[000d1254]                           dc.w $7ffc
[000d1256]                           dc.w $7ffc
[000d1258]                           dc.b '`|`\`|a'
[000d125f]                           dc.b $0c
[000d1260]                           dc.w $610c
[000d1262]                           dc.w $67cc
[000d1264]                           dc.w $610c
[000d1266]                           dc.w $610c
[000d1268]                           dc.w $600c
[000d126a]                           dc.w $600c
[000d126c]                           dc.w $7ffc
[000d126e]                           dc.w $7ffc
[000d1270]                           dc.w $0000
[000d1272]                           dc.w $0002
[000d1274]                           dc.w $0002
[000d1276]                           dc.w $3fc2
[000d1278]                           dc.b ' b R z!',$0a,'!',$0a,'''
[000d1283]                           dc.b $ca
[000d1284]                           dc.b '!',$0a,'!',$0a,' ',$0a,' ',$0a,'?'
[000d128d]                           dc.b $fa
[000d128e]                           dc.w $0002
[000d1290]                           dc.w $fffe
DATAS_14:
[000d1292]                           dc.w $fffe
[000d1294]                           dc.w $fffe
[000d1296]                           dc.w $fffe
[000d1298]                           dc.w $fffe
[000d129a]                           dc.w $fffe
[000d129c]                           dc.w $fffe
[000d129e]                           dc.w $fffe
[000d12a0]                           dc.w $fffe
[000d12a2]                           dc.w $fffe
[000d12a4]                           dc.w $fffe
[000d12a6]                           dc.w $fffe
[000d12a8]                           dc.w $fffe
[000d12aa]                           dc.w $fffe
[000d12ac]                           dc.w $fffe
[000d12ae]                           dc.w $fffe
[000d12b0]                           dc.w $fffe
DATAS_15:
[000d12b2]                           dc.w $0000
[000d12b4]                           dc.w $0000
[000d12b6]                           dc.w $0088
[000d12b8]                           dc.w $0000
[000d12ba]                           dc.w $7ffc
[000d12bc]                           dc.w $7ffc
[000d12be]                           dc.b '`|`\`|a'
[000d12c5]                           dc.b $0c
[000d12c6]                           dc.w $610c
[000d12c8]                           dc.w $67cc
[000d12ca]                           dc.w $610c
[000d12cc]                           dc.w $610c
[000d12ce]                           dc.w $600c
[000d12d0]                           dc.w $600c
[000d12d2]                           dc.w $7ffc
[000d12d4]                           dc.w $7ffc
[000d12d6]                           dc.w $0000
[000d12d8]                           dc.w $0000
[000d12da]                           dc.w $7ffc
[000d12dc]                           dc.w $7ffc
[000d12de]                           dc.b '`|`\`|a'
[000d12e5]                           dc.b $0c
[000d12e6]                           dc.w $610c
[000d12e8]                           dc.w $67cc
[000d12ea]                           dc.w $610c
[000d12ec]                           dc.w $610c
[000d12ee]                           dc.w $600c
[000d12f0]                           dc.w $600c
[000d12f2]                           dc.w $7ffc
[000d12f4]                           dc.w $7ffc
[000d12f6]                           dc.w $0000
[000d12f8]                           dc.w $0000
[000d12fa]                           dc.w $7ffc
[000d12fc]                           dc.w $7ffc
[000d12fe]                           dc.b '`|`\`|a'
[000d1305]                           dc.b $0c
[000d1306]                           dc.w $610c
[000d1308]                           dc.w $67cc
[000d130a]                           dc.w $610c
[000d130c]                           dc.w $610c
[000d130e]                           dc.w $600c
[000d1310]                           dc.w $600c
[000d1312]                           dc.w $7ffc
[000d1314]                           dc.w $7ffc
[000d1316]                           dc.w $0000
[000d1318]                           dc.w $fffe
[000d131a]                           dc.w $8000
[000d131c]                           dc.w $bfc0
[000d131e]                           dc.w $a060
[000d1320]                           dc.w $a050
[000d1322]                           dc.w $a078
[000d1324]                           dc.w $a108
[000d1326]                           dc.w $a108
[000d1328]                           dc.w $a7c8
[000d132a]                           dc.w $a108
[000d132c]                           dc.w $a108
[000d132e]                           dc.w $a008
[000d1330]                           dc.w $a008
[000d1332]                           dc.w $bff8
[000d1334]                           dc.w $8000
[000d1336]                           dc.w $8000
DATAS_16:
[000d1338]                           dc.w $fffe
[000d133a]                           dc.w $fffe
[000d133c]                           dc.w $fffe
[000d133e]                           dc.w $fffe
[000d1340]                           dc.w $fffe
[000d1342]                           dc.w $fffe
[000d1344]                           dc.w $fffe
[000d1346]                           dc.w $fffe
[000d1348]                           dc.w $fffe
[000d134a]                           dc.w $fffe
[000d134c]                           dc.w $fffe
[000d134e]                           dc.w $fffe
[000d1350]                           dc.w $fffe
[000d1352]                           dc.w $fffe
[000d1354]                           dc.w $fffe
[000d1356]                           dc.w $fffe
DATAS_17:
[000d1358]                           dc.w $0000
[000d135a]                           dc.w $0000
[000d135c]                           dc.w $0088
[000d135e]                           dc.w $0000
[000d1360]                           dc.w $7ffe
[000d1362]                           dc.w $7ffe
[000d1364]                           dc.w $7ffe
[000d1366]                           dc.w $7ffe
[000d1368]                           dc.w $7ffe
[000d136a]                           dc.w $7ffe
[000d136c]                           dc.w $77fe
[000d136e]                           dc.w $7ffe
[000d1370]                           dc.w $7ffe
[000d1372]                           dc.w $7ffe
[000d1374]                           dc.w $7ffe
[000d1376]                           dc.w $7ffe
[000d1378]                           dc.w $7ffe
[000d137a]                           dc.w $7ffe
[000d137c]                           dc.w $0000
[000d137e]                           dc.w $0000
[000d1380]                           dc.w $7ffe
[000d1382]                           dc.w $7ffe
[000d1384]                           dc.w $7ffe
[000d1386]                           dc.w $7ffe
[000d1388]                           dc.w $7ffe
[000d138a]                           dc.w $7ffe
[000d138c]                           dc.w $7ffe
[000d138e]                           dc.w $7ffe
[000d1390]                           dc.w $7ffe
[000d1392]                           dc.w $7ffe
[000d1394]                           dc.w $7ffe
[000d1396]                           dc.w $7ffe
[000d1398]                           dc.w $7ffe
[000d139a]                           dc.w $7ffe
[000d139c]                           dc.w $0000
[000d139e]                           dc.w $0000
[000d13a0]                           dc.w $7ffe
[000d13a2]                           dc.w $7ffe
[000d13a4]                           dc.w $7ffe
[000d13a6]                           dc.w $77fe
[000d13a8]                           dc.w $6abe
[000d13aa]                           dc.w $757e
[000d13ac]                           dc.w $6bfe
[000d13ae]                           dc.w $7602
[000d13b0]                           dc.w $6c06
[000d13b2]                           dc.w $780e
[000d13b4]                           dc.w $701e
[000d13b6]                           dc.w $7ffe
[000d13b8]                           dc.w $7ffe
[000d13ba]                           dc.w $7ffe
[000d13bc]                           dc.w $0000
[000d13be]                           dc.w $0001
[000d13c0]                           dc.w $0001
[000d13c2]                           dc.w $0071
[000d13c4]                           dc.w $1c8b
[000d13c6]                           dc.w $23e7
[000d13c8]                           dc.b ' / !!'
[000d13cd]                           dc.b $ff
[000d13ce]                           dc.w $2203
[000d13d0]                           dc.w $2405
[000d13d2]                           dc.w $2809
[000d13d4]                           dc.w $3011
[000d13d6]                           dc.w $3fe1
[000d13d8]                           dc.w $0001
[000d13da]                           dc.w $0001
[000d13dc]                           dc.w $ffff
DATAS_18:
[000d13de]                           dc.w $ffff
[000d13e0]                           dc.w $ffff
[000d13e2]                           dc.w $ffff
[000d13e4]                           dc.w $ffff
[000d13e6]                           dc.w $ffff
[000d13e8]                           dc.w $ffff
[000d13ea]                           dc.w $ffff
[000d13ec]                           dc.w $ffff
[000d13ee]                           dc.w $ffff
[000d13f0]                           dc.w $ffff
[000d13f2]                           dc.w $ffff
[000d13f4]                           dc.w $ffff
[000d13f6]                           dc.w $ffff
[000d13f8]                           dc.w $ffff
[000d13fa]                           dc.w $ffff
[000d13fc]                           dc.w $ffff
DATAS_19:
[000d13fe]                           dc.w $0000
[000d1400]                           dc.w $0000
[000d1402]                           dc.w $0090
[000d1404]                           dc.w $0000
[000d1406]                           dc.w $7ffe
[000d1408]                           dc.w $7ffe
[000d140a]                           dc.w $7ffe
[000d140c]                           dc.w $7ffe
[000d140e]                           dc.w $7ffe
[000d1410]                           dc.w $7ffe
[000d1412]                           dc.w $7ffe
[000d1414]                           dc.w $7ffe
[000d1416]                           dc.w $7ffe
[000d1418]                           dc.w $7ffe
[000d141a]                           dc.w $7ffe
[000d141c]                           dc.w $7ffe
[000d141e]                           dc.w $7ffe
[000d1420]                           dc.w $7ffe
[000d1422]                           dc.w $0000
[000d1424]                           dc.w $0000
[000d1426]                           dc.w $7ffe
[000d1428]                           dc.w $7ffe
[000d142a]                           dc.w $7ffe
[000d142c]                           dc.w $7ffe
[000d142e]                           dc.w $7ffe
[000d1430]                           dc.w $7ffe
[000d1432]                           dc.w $7ffe
[000d1434]                           dc.w $7ffe
[000d1436]                           dc.w $7ffe
[000d1438]                           dc.w $7ffe
[000d143a]                           dc.w $7ffe
[000d143c]                           dc.w $7ffe
[000d143e]                           dc.w $7ffe
[000d1440]                           dc.w $7ffe
[000d1442]                           dc.w $0000
[000d1444]                           dc.w $0000
[000d1446]                           dc.w $7ffe
[000d1448]                           dc.w $7ffe
[000d144a]                           dc.w $7ffe
[000d144c]                           dc.w $77fe
[000d144e]                           dc.w $6abe
[000d1450]                           dc.w $757e
[000d1452]                           dc.w $6bfe
[000d1454]                           dc.w $7602
[000d1456]                           dc.w $6c06
[000d1458]                           dc.w $780e
[000d145a]                           dc.w $701e
[000d145c]                           dc.w $7ffe
[000d145e]                           dc.w $7ffe
[000d1460]                           dc.w $7ffe
[000d1462]                           dc.w $0000
[000d1464]                           dc.w $ffff
[000d1466]                           dc.w $8000
[000d1468]                           dc.w $8070
[000d146a]                           dc.w $9c8a
[000d146c]                           dc.w $a3e6
[000d146e]                           dc.w $a02e
[000d1470]                           dc.w $a020
[000d1472]                           dc.w $a1fe
[000d1474]                           dc.w $a202
[000d1476]                           dc.w $a404
[000d1478]                           dc.w $a808
[000d147a]                           dc.w $b010
[000d147c]                           dc.w $bfe0
[000d147e]                           dc.w $8000
[000d1480]                           dc.w $8000
[000d1482]                           dc.w $8000
DATAS_20:
[000d1484]                           dc.w $ffff
[000d1486]                           dc.w $ffff
[000d1488]                           dc.w $ffff
[000d148a]                           dc.w $ffff
[000d148c]                           dc.w $ffff
[000d148e]                           dc.w $ffff
[000d1490]                           dc.w $ffff
[000d1492]                           dc.w $ffff
[000d1494]                           dc.w $ffff
[000d1496]                           dc.w $ffff
[000d1498]                           dc.w $ffff
[000d149a]                           dc.w $ffff
[000d149c]                           dc.w $ffff
[000d149e]                           dc.w $ffff
[000d14a0]                           dc.w $ffff
[000d14a2]                           dc.w $ffff
DATAS_21:
[000d14a4]                           dc.w $0000
[000d14a6]                           dc.w $0000
[000d14a8]                           dc.w $008e
[000d14aa]                           dc.w $0000
[000d14ac]                           dc.w $7ffe
[000d14ae]                           dc.w $7ffe
[000d14b0]                           dc.w $7ffe
[000d14b2]                           dc.w $7ffe
[000d14b4]                           dc.w $7ffe
[000d14b6]                           dc.w $7ffe
[000d14b8]                           dc.w $7ffe
[000d14ba]                           dc.w $7f1e
[000d14bc]                           dc.w $7f16
[000d14be]                           dc.w $7f1e
[000d14c0]                           dc.w $7f06
[000d14c2]                           dc.w $7f06
[000d14c4]                           dc.w $7f06
[000d14c6]                           dc.w $7ffe
[000d14c8]                           dc.w $0000
[000d14ca]                           dc.w $0000
[000d14cc]                           dc.w $7ffe
[000d14ce]                           dc.w $7ffe
[000d14d0]                           dc.w $7ffe
[000d14d2]                           dc.w $781e
[000d14d4]                           dc.w $7ffe
[000d14d6]                           dc.w $7ffe
[000d14d8]                           dc.w $7ffe
[000d14da]                           dc.w $7f1e
[000d14dc]                           dc.w $7f16
[000d14de]                           dc.w $7f1e
[000d14e0]                           dc.w $7f06
[000d14e2]                           dc.w $7f06
[000d14e4]                           dc.w $7f06
[000d14e6]                           dc.w $7ffe
[000d14e8]                           dc.w $0000
[000d14ea]                           dc.w $0000
[000d14ec]                           dc.w $7ffe
[000d14ee]                           dc.w $7ffe
[000d14f0]                           dc.w $57f6
[000d14f2]                           dc.w $681a
[000d14f4]                           dc.w $5ff6
[000d14f6]                           dc.w $6aaa
[000d14f8]                           dc.w $55f6
[000d14fa]                           dc.w $6b1a
[000d14fc]                           dc.w $5516
[000d14fe]                           dc.w $6b1e
[000d1500]                           dc.w $5506
[000d1502]                           dc.w $6b06
[000d1504]                           dc.w $7f06
[000d1506]                           dc.w $7ffe
[000d1508]                           dc.w $0000
[000d150a]                           dc.w $0001
[000d150c]                           dc.w $03c1
[000d150e]                           dc.w $7e7d
[000d1510]                           dc.w $45a3
[000d1512]                           dc.w $4813
[000d1514]                           dc.w $4ff3
[000d1516]                           dc.w $4003
[000d1518]                           dc.w $41f3
[000d151a]                           dc.w $411b
[000d151c]                           dc.w $4117
[000d151e]                           dc.w $411f
[000d1520]                           dc.w $4107
[000d1522]                           dc.w $4107
[000d1524]                           dc.w $3f05
[000d1526]                           dc.w $01fd
[000d1528]                           dc.w $ffff
DATAS_22:
[000d152a]                           dc.w $ffff
[000d152c]                           dc.w $ffff
[000d152e]                           dc.w $ffff
[000d1530]                           dc.w $ffff
[000d1532]                           dc.w $ffff
[000d1534]                           dc.w $ffff
[000d1536]                           dc.w $ffff
[000d1538]                           dc.w $ffff
[000d153a]                           dc.w $ffff
[000d153c]                           dc.w $ffff
[000d153e]                           dc.w $ffff
[000d1540]                           dc.w $ffff
[000d1542]                           dc.w $ffff
[000d1544]                           dc.w $ffff
[000d1546]                           dc.w $ffff
[000d1548]                           dc.w $ffff
DATAS_23:
[000d154a]                           dc.w $0000
[000d154c]                           dc.w $0000
[000d154e]                           dc.w $0088
[000d1550]                           dc.w $0000
[000d1552]                           dc.w $7ffe
[000d1554]                           dc.w $7ffe
[000d1556]                           dc.w $7ffe
[000d1558]                           dc.w $7ffe
[000d155a]                           dc.w $7ffe
[000d155c]                           dc.w $7ffe
[000d155e]                           dc.w $7ffe
[000d1560]                           dc.w $7f1e
[000d1562]                           dc.w $7f16
[000d1564]                           dc.w $7f1e
[000d1566]                           dc.w $7f06
[000d1568]                           dc.w $7f06
[000d156a]                           dc.w $7f06
[000d156c]                           dc.w $7ffe
[000d156e]                           dc.w $0000
[000d1570]                           dc.w $0000
[000d1572]                           dc.w $7ffe
[000d1574]                           dc.w $7ffe
[000d1576]                           dc.w $7ffe
[000d1578]                           dc.w $781e
[000d157a]                           dc.w $7ffe
[000d157c]                           dc.w $7ffe
[000d157e]                           dc.w $7ffe
[000d1580]                           dc.w $7f1e
[000d1582]                           dc.w $7f16
[000d1584]                           dc.w $7f1e
[000d1586]                           dc.w $7f06
[000d1588]                           dc.w $7f06
[000d158a]                           dc.w $7f06
[000d158c]                           dc.w $7ffe
[000d158e]                           dc.w $0000
[000d1590]                           dc.w $0000
[000d1592]                           dc.w $7ffe
[000d1594]                           dc.w $7ffe
[000d1596]                           dc.w $57f6
[000d1598]                           dc.w $681a
[000d159a]                           dc.w $5ff6
[000d159c]                           dc.w $6aaa
[000d159e]                           dc.w $55f6
[000d15a0]                           dc.w $6b1a
[000d15a2]                           dc.w $5516
[000d15a4]                           dc.w $6b1e
[000d15a6]                           dc.w $5506
[000d15a8]                           dc.w $6b06
[000d15aa]                           dc.w $7f06
[000d15ac]                           dc.w $7ffe
[000d15ae]                           dc.w $0000
[000d15b0]                           dc.w $ffff
[000d15b2]                           dc.w $83c0
[000d15b4]                           dc.w $be7c
[000d15b6]                           dc.w $c5a2
[000d15b8]                           dc.w $c812
[000d15ba]                           dc.w $cff2
[000d15bc]                           dc.w $c002
[000d15be]                           dc.w $c1f2
[000d15c0]                           dc.w $c11a
[000d15c2]                           dc.w $c116
[000d15c4]                           dc.w $c11e
[000d15c6]                           dc.w $c106
[000d15c8]                           dc.w $c106
[000d15ca]                           dc.w $bf06
[000d15cc]                           dc.w $81fc
[000d15ce]                           dc.w $8000
DATAS_24:
[000d15d0]                           dc.w $ffff
[000d15d2]                           dc.w $ffff
[000d15d4]                           dc.w $ffff
[000d15d6]                           dc.w $ffff
[000d15d8]                           dc.w $ffff
[000d15da]                           dc.w $ffff
[000d15dc]                           dc.w $ffff
[000d15de]                           dc.w $ffff
[000d15e0]                           dc.w $ffff
[000d15e2]                           dc.w $ffff
[000d15e4]                           dc.w $ffff
[000d15e6]                           dc.w $ffff
[000d15e8]                           dc.w $ffff
[000d15ea]                           dc.w $ffff
[000d15ec]                           dc.w $ffff
[000d15ee]                           dc.w $ffff
DATAS_25:
[000d15f0]                           dc.w $0000
[000d15f2]                           dc.w $0000
[000d15f4]                           dc.w $0096
[000d15f6]                           dc.w $0000
[000d15f8]                           dc.w $7ffe
[000d15fa]                           dc.w $7ffe
[000d15fc]                           dc.w $6816
[000d15fe]                           dc.w $6bd6
[000d1600]                           dc.w $6816
[000d1602]                           dc.w $6816
[000d1604]                           dc.w $6816
[000d1606]                           dc.w $67e6
[000d1608]                           dc.w $6006
[000d160a]                           dc.w $67f6
[000d160c]                           dc.w $6796
[000d160e]                           dc.w $6796
[000d1610]                           dc.w $7ffe
[000d1612]                           dc.w $7ffe
[000d1614]                           dc.w $0000
[000d1616]                           dc.w $0000
[000d1618]                           dc.w $7ffe
[000d161a]                           dc.w $7ffe
[000d161c]                           dc.w $6816
[000d161e]                           dc.w $6bd6
[000d1620]                           dc.w $6816
[000d1622]                           dc.w $6816
[000d1624]                           dc.w $6816
[000d1626]                           dc.w $67e6
[000d1628]                           dc.w $6006
[000d162a]                           dc.w $67f6
[000d162c]                           dc.w $6796
[000d162e]                           dc.w $6796
[000d1630]                           dc.w $7ffe
[000d1632]                           dc.w $7ffe
[000d1634]                           dc.w $0000
[000d1636]                           dc.w $0000
[000d1638]                           dc.w $7ffe
[000d163a]                           dc.w $7ffe
[000d163c]                           dc.w $781e
[000d163e]                           dc.w $7bde
[000d1640]                           dc.w $781e
[000d1642]                           dc.w $781e
[000d1644]                           dc.w $781e
[000d1646]                           dc.w $7ffe
[000d1648]                           dc.w $7ffe
[000d164a]                           dc.w $7ffe
[000d164c]                           dc.w $7f9e
[000d164e]                           dc.w $7f9e
[000d1650]                           dc.w $7ffe
[000d1652]                           dc.w $7ffe
[000d1654]                           dc.w $0000
[000d1656]                           dc.w $0001
[000d1658]                           dc.w $0001
[000d165a]                           dc.w $3ffd
[000d165c]                           dc.w $2815
[000d165e]                           dc.w $2815
[000d1660]                           dc.w $2815
[000d1662]                           dc.w $2815
[000d1664]                           dc.w $2815
[000d1666]                           dc.w $27e5
[000d1668]                           dc.w $2005
[000d166a]                           dc.w $27f5
[000d166c]                           dc.w $27f5
[000d166e]                           dc.w $27f5
[000d1670]                           dc.w $1ffd
[000d1672]                           dc.w $0001
[000d1674]                           dc.w $ffff
DATAS_26:
[000d1676]                           dc.w $ffff
[000d1678]                           dc.w $ffff
[000d167a]                           dc.w $ffff
[000d167c]                           dc.w $ffff
[000d167e]                           dc.w $ffff
[000d1680]                           dc.w $ffff
[000d1682]                           dc.w $ffff
[000d1684]                           dc.w $ffff
[000d1686]                           dc.w $ffff
[000d1688]                           dc.w $ffff
[000d168a]                           dc.w $ffff
[000d168c]                           dc.w $ffff
[000d168e]                           dc.w $ffff
[000d1690]                           dc.w $ffff
[000d1692]                           dc.w $ffff
[000d1694]                           dc.w $ffff
DATAS_27:
[000d1696]                           dc.w $0000
[000d1698]                           dc.w $0000
[000d169a]                           dc.w $0088
[000d169c]                           dc.w $0000
[000d169e]                           dc.w $7ffe
[000d16a0]                           dc.w $7ffe
[000d16a2]                           dc.w $6816
[000d16a4]                           dc.w $6bd6
[000d16a6]                           dc.w $6816
[000d16a8]                           dc.w $6816
[000d16aa]                           dc.w $6816
[000d16ac]                           dc.w $67e6
[000d16ae]                           dc.w $6006
[000d16b0]                           dc.w $67f6
[000d16b2]                           dc.w $6796
[000d16b4]                           dc.w $6796
[000d16b6]                           dc.w $7ffe
[000d16b8]                           dc.w $7ffe
[000d16ba]                           dc.w $0000
[000d16bc]                           dc.w $0000
[000d16be]                           dc.w $7ffe
[000d16c0]                           dc.w $7ffe
[000d16c2]                           dc.w $6816
[000d16c4]                           dc.w $6bd6
[000d16c6]                           dc.w $6816
[000d16c8]                           dc.w $6816
[000d16ca]                           dc.w $6816
[000d16cc]                           dc.w $67e6
[000d16ce]                           dc.w $6006
[000d16d0]                           dc.w $67f6
[000d16d2]                           dc.w $6796
[000d16d4]                           dc.w $6796
[000d16d6]                           dc.w $7ffe
[000d16d8]                           dc.w $7ffe
[000d16da]                           dc.w $0000
[000d16dc]                           dc.w $0000
[000d16de]                           dc.w $7ffe
[000d16e0]                           dc.w $7ffe
[000d16e2]                           dc.w $781e
[000d16e4]                           dc.w $7bde
[000d16e6]                           dc.w $781e
[000d16e8]                           dc.w $781e
[000d16ea]                           dc.w $781e
[000d16ec]                           dc.w $7ffe
[000d16ee]                           dc.w $7ffe
[000d16f0]                           dc.w $7ffe
[000d16f2]                           dc.w $7f9e
[000d16f4]                           dc.w $7f9e
[000d16f6]                           dc.w $7ffe
[000d16f8]                           dc.w $7ffe
[000d16fa]                           dc.w $0000
[000d16fc]                           dc.w $ffff
[000d16fe]                           dc.w $8000
[000d1700]                           dc.w $bffc
[000d1702]                           dc.w $a814
[000d1704]                           dc.w $a814
[000d1706]                           dc.w $a814
[000d1708]                           dc.w $a814
[000d170a]                           dc.w $a814
[000d170c]                           dc.w $a7e4
[000d170e]                           dc.w $a004
[000d1710]                           dc.w $a7f4
[000d1712]                           dc.w $a7f4
[000d1714]                           dc.w $a7f4
[000d1716]                           dc.w $9ffc
[000d1718]                           dc.w $8000
[000d171a]                           dc.w $8000
DATAS_28:
[000d171c]                           dc.w $ffff
[000d171e]                           dc.w $ffff
[000d1720]                           dc.w $ffff
[000d1722]                           dc.w $ffff
[000d1724]                           dc.w $ffff
[000d1726]                           dc.w $ffff
[000d1728]                           dc.w $ffff
[000d172a]                           dc.w $ffff
[000d172c]                           dc.w $ffff
[000d172e]                           dc.w $ffff
[000d1730]                           dc.w $ffff
[000d1732]                           dc.w $ffff
[000d1734]                           dc.w $ffff
[000d1736]                           dc.w $ffff
[000d1738]                           dc.w $ffff
[000d173a]                           dc.w $ffff
DATAS_33:
[000d173c]                           dc.w $0000
[000d173e]                           dc.w $0000
[000d1740]                           dc.w $0088
[000d1742]                           dc.w $0000
[000d1744]                           dc.w $7ffe
[000d1746]                           dc.w $7ffe
[000d1748]                           dc.w $7ffe
[000d174a]                           dc.w $7ffe
[000d174c]                           dc.w $7ffe
[000d174e]                           dc.w $7ffe
[000d1750]                           dc.w $7ffe
[000d1752]                           dc.w $7ffe
[000d1754]                           dc.w $7ffe
[000d1756]                           dc.w $7ffe
[000d1758]                           dc.w $7ffe
[000d175a]                           dc.w $7ffe
[000d175c]                           dc.w $7ffe
[000d175e]                           dc.w $7ffe
[000d1760]                           dc.w $0000
[000d1762]                           dc.w $0000
[000d1764]                           dc.w $7ffe
[000d1766]                           dc.w $7ffe
[000d1768]                           dc.w $7ffe
[000d176a]                           dc.w $7ffe
[000d176c]                           dc.w $7ffe
[000d176e]                           dc.w $7ffe
[000d1770]                           dc.w $7ffe
[000d1772]                           dc.w $7ffe
[000d1774]                           dc.w $7ffe
[000d1776]                           dc.w $7ffe
[000d1778]                           dc.w $7ffe
[000d177a]                           dc.w $7ffe
[000d177c]                           dc.w $7ffe
[000d177e]                           dc.w $7ffe
[000d1780]                           dc.w $0000
[000d1782]                           dc.w $0000
[000d1784]                           dc.w $7ffe
[000d1786]                           dc.w $7ffe
[000d1788]                           dc.w $7ffe
[000d178a]                           dc.w $7ffe
[000d178c]                           dc.w $7ffe
[000d178e]                           dc.w $7ffe
[000d1790]                           dc.w $7ffe
[000d1792]                           dc.w $7ffe
[000d1794]                           dc.w $7ffe
[000d1796]                           dc.w $7ffe
[000d1798]                           dc.w $7ffe
[000d179a]                           dc.w $7ffe
[000d179c]                           dc.w $7ffe
[000d179e]                           dc.w $7ffe
[000d17a0]                           dc.w $0000
[000d17a2]                           dc.w $0001
[000d17a4]                           dc.w $0001
[000d17a6]                           dc.w $0001
[000d17a8]                           dc.w $0201
[000d17aa]                           dc.w $0601
[000d17ac]                           dc.w $0fe1
[000d17ae]                           dc.w $0611
[000d17b0]                           dc.w $0209
[000d17b2]                           dc.w $0009
[000d17b4]                           dc.w $0009
[000d17b6]                           dc.w $0011
[000d17b8]                           dc.w $01e1
[000d17ba]                           dc.w $0001
[000d17bc]                           dc.w $0001
[000d17be]                           dc.w $0001
[000d17c0]                           dc.w $ffff
DATAS_34:
[000d17c2]                           dc.w $ffff
[000d17c4]                           dc.w $ffff
[000d17c6]                           dc.w $ffff
[000d17c8]                           dc.w $ffff
[000d17ca]                           dc.w $ffff
[000d17cc]                           dc.w $ffff
[000d17ce]                           dc.w $ffff
[000d17d0]                           dc.w $ffff
[000d17d2]                           dc.w $ffff
[000d17d4]                           dc.w $ffff
[000d17d6]                           dc.w $ffff
[000d17d8]                           dc.w $ffff
[000d17da]                           dc.w $ffff
[000d17dc]                           dc.w $ffff
[000d17de]                           dc.w $ffff
[000d17e0]                           dc.w $ffff
DATAS_35:
[000d17e2]                           dc.w $0000
[000d17e4]                           dc.w $0000
[000d17e6]                           dc.w $0088
[000d17e8]                           dc.w $0000
[000d17ea]                           dc.w $7ffe
[000d17ec]                           dc.w $7ffe
[000d17ee]                           dc.w $7ffe
[000d17f0]                           dc.w $7ffe
[000d17f2]                           dc.w $7ffe
[000d17f4]                           dc.w $7ffe
[000d17f6]                           dc.w $7ffe
[000d17f8]                           dc.w $7ffe
[000d17fa]                           dc.w $7ffe
[000d17fc]                           dc.w $7ffe
[000d17fe]                           dc.w $7ffe
[000d1800]                           dc.w $7ffe
[000d1802]                           dc.w $7ffe
[000d1804]                           dc.w $7ffe
[000d1806]                           dc.w $0000
[000d1808]                           dc.w $0000
[000d180a]                           dc.w $7ffe
[000d180c]                           dc.w $7ffe
[000d180e]                           dc.w $7ffe
[000d1810]                           dc.w $7ffe
[000d1812]                           dc.w $7ffe
[000d1814]                           dc.w $7ffe
[000d1816]                           dc.w $7ffe
[000d1818]                           dc.w $7ffe
[000d181a]                           dc.w $7ffe
[000d181c]                           dc.w $7ffe
[000d181e]                           dc.w $7ffe
[000d1820]                           dc.w $7ffe
[000d1822]                           dc.w $7ffe
[000d1824]                           dc.w $7ffe
[000d1826]                           dc.w $0000
[000d1828]                           dc.w $0000
[000d182a]                           dc.w $7ffe
[000d182c]                           dc.w $7ffe
[000d182e]                           dc.w $7ffe
[000d1830]                           dc.w $7ffe
[000d1832]                           dc.w $7ffe
[000d1834]                           dc.w $7ffe
[000d1836]                           dc.w $7ffe
[000d1838]                           dc.w $7ffe
[000d183a]                           dc.w $7ffe
[000d183c]                           dc.w $7ffe
[000d183e]                           dc.w $7ffe
[000d1840]                           dc.w $7ffe
[000d1842]                           dc.w $7ffe
[000d1844]                           dc.w $7ffe
[000d1846]                           dc.w $0000
[000d1848]                           dc.w $ffff
[000d184a]                           dc.w $8000
[000d184c]                           dc.w $8000
[000d184e]                           dc.w $8200
[000d1850]                           dc.w $8600
[000d1852]                           dc.w $8fe0
[000d1854]                           dc.w $8610
[000d1856]                           dc.w $8208
[000d1858]                           dc.w $8008
[000d185a]                           dc.w $8008
[000d185c]                           dc.w $8010
[000d185e]                           dc.w $81e0
[000d1860]                           dc.w $8000
[000d1862]                           dc.w $8000
[000d1864]                           dc.w $8000
[000d1866]                           dc.w $8000
DATAS_36:
[000d1868]                           dc.w $ffff
[000d186a]                           dc.w $ffff
[000d186c]                           dc.w $ffff
[000d186e]                           dc.w $ffff
[000d1870]                           dc.w $ffff
[000d1872]                           dc.w $ffff
[000d1874]                           dc.w $ffff
[000d1876]                           dc.w $ffff
[000d1878]                           dc.w $ffff
[000d187a]                           dc.w $ffff
[000d187c]                           dc.w $ffff
[000d187e]                           dc.w $ffff
[000d1880]                           dc.w $ffff
[000d1882]                           dc.w $ffff
[000d1884]                           dc.w $ffff
[000d1886]                           dc.w $ffff
TEDINFO_05:
[000d1888] 000d0695                  dc.l TEXT_09
[000d188c] 000d05d4                  dc.l TEXT_002
[000d1890] 000d05d4                  dc.l TEXT_002
[000d1894]                           dc.w $0003
[000d1896]                           dc.w $0006
[000d1898]                           dc.w $0001
[000d189a]                           dc.w $1180
[000d189c]                           dc.w $0000
[000d189e]                           dc.w $0000
[000d18a0]                           dc.w $0008
[000d18a2]                           dc.w $0001
A_3DBUTTON01:
[000d18a4] 00064a22                  dc.l A_3Dbutton
[000d18a8]                           dc.w $29f1
[000d18aa]                           dc.w $01f8
[000d18ac] 000630f2                  dc.l Auo_string
[000d18b0]                           dc.w $0000
[000d18b2]                           dc.w $0000
[000d18b4]                           dc.w $0000
[000d18b6]                           dc.w $0000
[000d18b8]                           dc.w $0000
[000d18ba]                           dc.w $0000
[000d18bc]                           dc.w $0000
[000d18be]                           dc.w $0000
[000d18c0]                           dc.w $0000
[000d18c2]                           dc.w $0000
A_3DBUTTON02:
[000d18c4] 00064a22                  dc.l A_3Dbutton
[000d18c8]                           dc.w $29c1
[000d18ca]                           dc.w $0178
[000d18cc] 000630f2                  dc.l Auo_string
[000d18d0] 000d098e                  dc.l TEXT_51
[000d18d4]                           dc.w $0000
[000d18d6]                           dc.w $0000
[000d18d8]                           dc.w $0000
[000d18da]                           dc.w $0000
[000d18dc]                           dc.w $0000
[000d18de]                           dc.w $0000
[000d18e0]                           dc.w $0000
[000d18e2]                           dc.w $0000
A_3DBUTTON03:
[000d18e4] 00064a22                  dc.l A_3Dbutton
[000d18e8]                           dc.w $2021
[000d18ea]                           dc.w $9178
[000d18ec] 000630f2                  dc.l Auo_string
[000d18f0]                           dc.w $0000
[000d18f2]                           dc.w $0000
[000d18f4]                           dc.w $0000
[000d18f6]                           dc.w $0000
[000d18f8]                           dc.w $0000
[000d18fa]                           dc.w $0000
[000d18fc]                           dc.w $0000
[000d18fe]                           dc.w $0000
[000d1900]                           dc.w $0000
[000d1902]                           dc.w $0000
A_3DBUTTON04:
[000d1904] 00064a22                  dc.l A_3Dbutton
[000d1908]                           dc.w $2011
[000d190a]                           dc.w $9178
[000d190c] 000630f2                  dc.l Auo_string
[000d1910]                           dc.w $0000
[000d1912]                           dc.w $0000
[000d1914]                           dc.w $0000
[000d1916]                           dc.w $0000
[000d1918]                           dc.w $0000
[000d191a]                           dc.w $0000
[000d191c]                           dc.w $0000
[000d191e]                           dc.w $0000
[000d1920]                           dc.w $0000
[000d1922]                           dc.w $0000
A_3DBUTTON05:
[000d1924] 00064a22                  dc.l A_3Dbutton
[000d1928]                           dc.w $29c1
[000d192a]                           dc.w $0178
[000d192c] 000630f2                  dc.l Auo_string
[000d1930] 000d05fb                  dc.l TEXT_013
[000d1934]                           dc.w $0000
[000d1936]                           dc.w $0000
[000d1938]                           dc.w $0000
[000d193a]                           dc.w $0000
[000d193c]                           dc.w $0000
[000d193e]                           dc.w $0000
[000d1940]                           dc.w $0000
[000d1942]                           dc.w $0000
A_3DBUTTON06:
[000d1944] 00064a22                  dc.l A_3Dbutton
[000d1948]                           dc.w $29f1
[000d194a]                           dc.w $9178
[000d194c] 000630f2                  dc.l Auo_string
[000d1950]                           dc.w $0000
[000d1952]                           dc.w $0000
[000d1954]                           dc.w $0000
[000d1956]                           dc.w $0000
[000d1958]                           dc.w $0000
[000d195a]                           dc.w $0000
[000d195c]                           dc.w $0000
[000d195e]                           dc.w $0000
[000d1960]                           dc.w $0000
[000d1962]                           dc.w $0000
A_3DBUTTON07:
[000d1964] 00064a22                  dc.l A_3Dbutton
[000d1968]                           dc.w $29c1
[000d196a]                           dc.w $0178
[000d196c] 000630f2                  dc.l Auo_string
[000d1970] 000d060d                  dc.l TEXT_026
[000d1974]                           dc.w $0000
[000d1976]                           dc.w $0000
[000d1978]                           dc.w $0000
[000d197a]                           dc.w $0000
[000d197c]                           dc.w $0000
[000d197e]                           dc.w $0000
[000d1980]                           dc.w $0000
[000d1982]                           dc.w $0000
A_3DBUTTON08:
[000d1984] 00064a22                  dc.l A_3Dbutton
[000d1988]                           dc.w $0001
[000d198a]                           dc.w $9170
[000d198c] 000630f2                  dc.l Auo_string
[000d1990]                           dc.w $0000
[000d1992]                           dc.w $0000
[000d1994]                           dc.w $0000
[000d1996]                           dc.w $0000
[000d1998]                           dc.w $0000
[000d199a]                           dc.w $0000
[000d199c]                           dc.w $0000
[000d199e]                           dc.w $0000
[000d19a0]                           dc.w $0000
[000d19a2]                           dc.w $0000
A_3DBUTTON12:
[000d19a4] 00064a22                  dc.l A_3Dbutton
[000d19a8]                           dc.w $29f1
[000d19aa]                           dc.w $0178
[000d19ac] 000630f2                  dc.l Auo_string
[000d19b0]                           dc.w $0000
[000d19b2]                           dc.w $0000
[000d19b4]                           dc.w $0000
[000d19b6]                           dc.w $0000
[000d19b8]                           dc.w $0000
[000d19ba]                           dc.w $0000
[000d19bc]                           dc.w $0000
[000d19be]                           dc.w $0000
[000d19c0]                           dc.w $0000
[000d19c2]                           dc.w $0000
A_3DBUTTON20:
[000d19c4] 00064a22                  dc.l A_3Dbutton
[000d19c8]                           dc.w $29f1
[000d19ca]                           dc.w $0178
[000d19cc] 000630f2                  dc.l Auo_string
[000d19d0]                           dc.w $0000
[000d19d2]                           dc.w $0000
[000d19d4]                           dc.w $0000
[000d19d6]                           dc.w $0000
[000d19d8]                           dc.w $0000
[000d19da]                           dc.w $0000
[000d19dc]                           dc.w $0000
[000d19de]                           dc.w $0000
[000d19e0]                           dc.w $0000
[000d19e2]                           dc.w $0000
A_3DBUTTON21:
[000d19e4] 00064a22                  dc.l A_3Dbutton
[000d19e8]                           dc.w $29c1
[000d19ea]                           dc.w $0178
[000d19ec] 000630f2                  dc.l Auo_string
[000d19f0] 000d0996                  dc.l TEXT_52
[000d19f4]                           dc.w $0000
[000d19f6]                           dc.w $0000
[000d19f8]                           dc.w $0000
[000d19fa]                           dc.w $0000
[000d19fc]                           dc.w $0000
[000d19fe]                           dc.w $0000
[000d1a00]                           dc.w $0000
[000d1a02]                           dc.w $0000
A_3DBUTTON22:
[000d1a04] 00064a22                  dc.l A_3Dbutton
[000d1a08]                           dc.w $2011
[000d1a0a]                           dc.w $9170
[000d1a0c] 000630f2                  dc.l Auo_string
[000d1a10]                           dc.w $0000
[000d1a12]                           dc.w $0000
[000d1a14]                           dc.w $0000
[000d1a16]                           dc.w $0000
[000d1a18]                           dc.w $0000
[000d1a1a]                           dc.w $0000
[000d1a1c]                           dc.w $0000
[000d1a1e]                           dc.w $0000
[000d1a20]                           dc.w $0000
[000d1a22]                           dc.w $0000
A_ARROWS02:
[000d1a24] 00065c72                  dc.l A_arrows
[000d1a28]                           dc.w $1301
[000d1a2a]                           dc.w $0001
[000d1a2c]                           dc.w $0000
[000d1a2e]                           dc.w $0000
[000d1a30]                           dc.w $0000
[000d1a32]                           dc.w $0000
[000d1a34]                           dc.w $0000
[000d1a36]                           dc.w $0000
[000d1a38]                           dc.w $0000
[000d1a3a]                           dc.w $0000
[000d1a3c]                           dc.w $0000
[000d1a3e]                           dc.w $0000
[000d1a40]                           dc.w $0000
[000d1a42]                           dc.w $0000
A_ARROWS03:
[000d1a44] 00065c72                  dc.l A_arrows
[000d1a48]                           dc.w $2209
[000d1a4a]                           dc.w $0001
[000d1a4c]                           dc.w $0000
[000d1a4e]                           dc.w $0000
[000d1a50]                           dc.w $0000
[000d1a52]                           dc.w $0000
[000d1a54]                           dc.w $0000
[000d1a56]                           dc.w $0000
[000d1a58]                           dc.w $0000
[000d1a5a]                           dc.w $0000
[000d1a5c]                           dc.w $0000
[000d1a5e]                           dc.w $0000
[000d1a60]                           dc.w $0000
[000d1a62]                           dc.w $0000
A_BOXED01:
[000d1a64] 0006afea                  dc.l A_boxed
[000d1a68]                           dc.w $9000
[000d1a6a]                           dc.w $ff12
[000d1a6c] 0006a068                  dc.l Auo_boxed
[000d1a70]                           dc.w $0000
[000d1a72]                           dc.w $0000
[000d1a74]                           dc.w $0000
[000d1a76]                           dc.w $0000
[000d1a78]                           dc.w $0000
[000d1a7a]                           dc.w $0000
[000d1a7c]                           dc.w $0000
[000d1a7e]                           dc.w $0000
[000d1a80]                           dc.w $0000
[000d1a82]                           dc.w $0000
A_BOXED02:
[000d1a84] 0006afea                  dc.l A_boxed
[000d1a88]                           dc.w $9038
[000d1a8a]                           dc.w $ff12
[000d1a8c] 0006a068                  dc.l Auo_boxed
[000d1a90]                           dc.w $0000
[000d1a92]                           dc.w $0000
[000d1a94]                           dc.w $0000
[000d1a96]                           dc.w $0000
[000d1a98]                           dc.w $0000
[000d1a9a]                           dc.w $0000
[000d1a9c]                           dc.w $0000
[000d1a9e]                           dc.w $0000
[000d1aa0]                           dc.w $0000
[000d1aa2]                           dc.w $0000
A_BOXED03:
[000d1aa4] 0006afea                  dc.l A_boxed
[000d1aa8]                           dc.w $9070
[000d1aaa]                           dc.w $0512
[000d1aac] 0006a068                  dc.l Auo_boxed
[000d1ab0]                           dc.w $0000
[000d1ab2]                           dc.w $0000
[000d1ab4]                           dc.w $0000
[000d1ab6]                           dc.w $0000
[000d1ab8]                           dc.w $0000
[000d1aba]                           dc.w $0000
[000d1abc]                           dc.w $0000
[000d1abe]                           dc.w $0000
[000d1ac0]                           dc.w $0000
[000d1ac2]                           dc.w $0000
A_BOXED06:
[000d1ac4] 0006afea                  dc.l A_boxed
[000d1ac8]                           dc.w $9000
[000d1aca]                           dc.w $ff12
[000d1acc] 0006a068                  dc.l Auo_boxed
[000d1ad0]                           dc.w $0000
[000d1ad2]                           dc.w $0000
[000d1ad4]                           dc.w $0000
[000d1ad6]                           dc.w $0000
[000d1ad8]                           dc.w $0000
[000d1ada]                           dc.w $0000
[000d1adc]                           dc.w $0000
[000d1ade]                           dc.w $0000
[000d1ae0]                           dc.w $0000
[000d1ae2]                           dc.w $0000
A_BOXED07:
[000d1ae4] 0006afea                  dc.l A_boxed
[000d1ae8]                           dc.w $9038
[000d1aea]                           dc.w $0b12
[000d1aec] 0006a068                  dc.l Auo_boxed
[000d1af0]                           dc.w $0000
[000d1af2]                           dc.w $0000
[000d1af4]                           dc.w $0000
[000d1af6]                           dc.w $0000
[000d1af8]                           dc.w $0000
[000d1afa]                           dc.w $0000
[000d1afc]                           dc.w $0000
[000d1afe]                           dc.w $0000
[000d1b00]                           dc.w $0000
[000d1b02]                           dc.w $0000
A_BOXED08:
[000d1b04] 0006afea                  dc.l A_boxed
[000d1b08]                           dc.w $9070
[000d1b0a]                           dc.w $0212
[000d1b0c] 0006a068                  dc.l Auo_boxed
[000d1b10]                           dc.w $0000
[000d1b12]                           dc.w $0000
[000d1b14]                           dc.w $0000
[000d1b16]                           dc.w $0000
[000d1b18]                           dc.w $0000
[000d1b1a]                           dc.w $0000
[000d1b1c]                           dc.w $0000
[000d1b1e]                           dc.w $0000
[000d1b20]                           dc.w $0000
[000d1b22]                           dc.w $0000
A_BOXED09:
[000d1b24] 0006afea                  dc.l A_boxed
[000d1b28]                           dc.w $9018
[000d1b2a]                           dc.w $0812
[000d1b2c] 0006a068                  dc.l Auo_boxed
[000d1b30]                           dc.w $0000
[000d1b32]                           dc.w $0000
[000d1b34]                           dc.w $0000
[000d1b36]                           dc.w $0000
[000d1b38]                           dc.w $0000
[000d1b3a]                           dc.w $0000
[000d1b3c]                           dc.w $0000
[000d1b3e]                           dc.w $0000
[000d1b40]                           dc.w $0000
[000d1b42]                           dc.w $0000
A_CHECKBOX01:
[000d1b44] 0006323e                  dc.l A_checkbox
[000d1b48]                           dc.w $0000
[000d1b4a]                           dc.w $0001
[000d1b4c] 000630f2                  dc.l Auo_string
[000d1b50] 000d06c0                  dc.l TEXT_13
[000d1b54]                           dc.w $0000
[000d1b56]                           dc.w $0000
[000d1b58]                           dc.w $0000
[000d1b5a]                           dc.w $0000
[000d1b5c]                           dc.w $0000
[000d1b5e]                           dc.w $0000
[000d1b60]                           dc.w $0000
[000d1b62]                           dc.w $0000
A_CHECKBOX02:
[000d1b64] 0006323e                  dc.l A_checkbox
[000d1b68]                           dc.w $0000
[000d1b6a]                           dc.w $0001
[000d1b6c] 000630f2                  dc.l Auo_string
[000d1b70] 000d0607                  dc.l TEXT_02
[000d1b74]                           dc.w $0000
[000d1b76]                           dc.w $0000
[000d1b78]                           dc.w $0000
[000d1b7a]                           dc.w $0000
[000d1b7c]                           dc.w $0000
[000d1b7e]                           dc.w $0000
[000d1b80]                           dc.w $0000
[000d1b82]                           dc.w $0000
A_CHECKBOX03:
[000d1b84] 0006323e                  dc.l A_checkbox
[000d1b88]                           dc.w $0000
[000d1b8a]                           dc.w $0001
[000d1b8c] 000630f2                  dc.l Auo_string
[000d1b90] 000d0986                  dc.l TEXT_50
[000d1b94]                           dc.w $0000
[000d1b96]                           dc.w $0000
[000d1b98]                           dc.w $0000
[000d1b9a]                           dc.w $0000
[000d1b9c]                           dc.w $0000
[000d1b9e]                           dc.w $0000
[000d1ba0]                           dc.w $0000
[000d1ba2]                           dc.w $0000
A_CHECKBOX04:
[000d1ba4] 0006323e                  dc.l A_checkbox
[000d1ba8]                           dc.w $0000
[000d1baa]                           dc.w $0001
[000d1bac] 000630f2                  dc.l Auo_string
[000d1bb0] 000d0a2c                  dc.l TEXT_64
[000d1bb4]                           dc.w $0000
[000d1bb6]                           dc.w $0000
[000d1bb8]                           dc.w $0000
[000d1bba]                           dc.w $0000
[000d1bbc]                           dc.w $0000
[000d1bbe]                           dc.w $0000
[000d1bc0]                           dc.w $0000
[000d1bc2]                           dc.w $0000
A_CHECKBOX05:
[000d1bc4] 0006323e                  dc.l A_checkbox
[000d1bc8]                           dc.w $0000
[000d1bca]                           dc.w $0001
[000d1bcc] 000630f2                  dc.l Auo_string
[000d1bd0] 000d05f1                  dc.l TEXT_01
[000d1bd4]                           dc.w $0000
[000d1bd6]                           dc.w $0000
[000d1bd8]                           dc.w $0000
[000d1bda]                           dc.w $0000
[000d1bdc]                           dc.w $0000
[000d1bde]                           dc.w $0000
[000d1be0]                           dc.w $0000
[000d1be2]                           dc.w $0000
A_CHECKBOX06:
[000d1be4] 0006323e                  dc.l A_checkbox
[000d1be8]                           dc.w $0000
[000d1bea]                           dc.w $0001
[000d1bec] 000630f2                  dc.l Auo_string
[000d1bf0] 000d09bd                  dc.l TEXT_56
[000d1bf4]                           dc.w $0000
[000d1bf6]                           dc.w $0000
[000d1bf8]                           dc.w $0000
[000d1bfa]                           dc.w $0000
[000d1bfc]                           dc.w $0000
[000d1bfe]                           dc.w $0000
[000d1c00]                           dc.w $0000
[000d1c02]                           dc.w $0000
A_CHECKBOX07:
[000d1c04] 0006323e                  dc.l A_checkbox
[000d1c08]                           dc.w $0000
[000d1c0a]                           dc.w $0001
[000d1c0c] 000630f2                  dc.l Auo_string
[000d1c10] 000d075b                  dc.l TEXT_22
[000d1c14]                           dc.w $0000
[000d1c16]                           dc.w $0000
[000d1c18]                           dc.w $0000
[000d1c1a]                           dc.w $0000
[000d1c1c]                           dc.w $0000
[000d1c1e]                           dc.w $0000
[000d1c20]                           dc.w $0000
[000d1c22]                           dc.w $0000
A_CHECKBOX08:
[000d1c24] 0006323e                  dc.l A_checkbox
[000d1c28]                           dc.w $0000
[000d1c2a]                           dc.w $0001
[000d1c2c] 000630f2                  dc.l Auo_string
[000d1c30] 000d08f7                  dc.l TEXT_41
[000d1c34]                           dc.w $0000
[000d1c36]                           dc.w $0000
[000d1c38]                           dc.w $0000
[000d1c3a]                           dc.w $0000
[000d1c3c]                           dc.w $0000
[000d1c3e]                           dc.w $0000
[000d1c40]                           dc.w $0000
[000d1c42]                           dc.w $0000
A_CYCLE01:
[000d1c44] 00066c46                  dc.l A_cycle
[000d1c48]                           dc.w $0001
[000d1c4a]                           dc.w $0290
[000d1c4c] 00067456                  dc.l Auo_cycle
[000d1c50] 000d062f                  dc.l TEXT_04
[000d1c54]                           dc.w $0000
[000d1c56]                           dc.w $0000
[000d1c58]                           dc.w $0000
[000d1c5a]                           dc.w $0000
[000d1c5c]                           dc.w $0000
[000d1c5e]                           dc.w $0000
[000d1c60]                           dc.w $0000
[000d1c62]                           dc.w $0000
A_CYCLE02:
[000d1c64] 00066c46                  dc.l A_cycle
[000d1c68]                           dc.w $0001
[000d1c6a]                           dc.w $0290
[000d1c6c] 00067456                  dc.l Auo_cycle
[000d1c70] 000d0923                  dc.l TEXT_45
[000d1c74]                           dc.w $0000
[000d1c76]                           dc.w $0000
[000d1c78]                           dc.w $0000
[000d1c7a]                           dc.w $0000
[000d1c7c]                           dc.w $0000
[000d1c7e]                           dc.w $0000
[000d1c80]                           dc.w $0000
[000d1c82]                           dc.w $0000
A_FTEXT02:
[000d1c84] 0006639a                  dc.l A_ftext
[000d1c88]                           dc.w $0001
[000d1c8a]                           dc.w $000d
[000d1c8c] 00066924                  dc.l Auo_ftext
[000d1c90] 000d0771                  dc.l TEXT_24
[000d1c94]                           dc.w $0000
[000d1c96]                           dc.w $0000
[000d1c98]                           dc.w $0000
[000d1c9a]                           dc.w $0000
[000d1c9c]                           dc.w $0000
[000d1c9e]                           dc.w $0000
[000d1ca0]                           dc.w $0000
[000d1ca2]                           dc.w $0000
A_INNERFRAME02:
[000d1ca4] 00064256                  dc.l A_innerframe
[000d1ca8]                           dc.w $1000
[000d1caa]                           dc.w $8f19
[000d1cac] 000630f2                  dc.l Auo_string
[000d1cb0] 000d0673                  dc.l TEXT_06
[000d1cb4]                           dc.w $0000
[000d1cb6]                           dc.w $0000
[000d1cb8]                           dc.w $0000
[000d1cba]                           dc.w $0000
[000d1cbc]                           dc.w $0000
[000d1cbe]                           dc.w $0000
[000d1cc0]                           dc.w $0000
[000d1cc2]                           dc.w $0000
A_INNERFRAME03:
[000d1cc4] 00064256                  dc.l A_innerframe
[000d1cc8]                           dc.w $1000
[000d1cca]                           dc.w $8f19
[000d1ccc] 000630f2                  dc.l Auo_string
[000d1cd0] 000d0844                  dc.l TEXT_31
[000d1cd4]                           dc.w $0000
[000d1cd6]                           dc.w $0000
[000d1cd8]                           dc.w $0000
[000d1cda]                           dc.w $0000
[000d1cdc]                           dc.w $0000
[000d1cde]                           dc.w $0000
[000d1ce0]                           dc.w $0000
[000d1ce2]                           dc.w $0000
A_INNERFRAME04:
[000d1ce4] 00064256                  dc.l A_innerframe
[000d1ce8]                           dc.w $1000
[000d1cea]                           dc.w $8f19
[000d1cec] 000630f2                  dc.l Auo_string
[000d1cf0]                           dc.w $0000
[000d1cf2]                           dc.w $0000
[000d1cf4]                           dc.w $0000
[000d1cf6]                           dc.w $0000
[000d1cf8]                           dc.w $0000
[000d1cfa]                           dc.w $0000
[000d1cfc]                           dc.w $0000
[000d1cfe]                           dc.w $0000
[000d1d00]                           dc.w $0000
[000d1d02]                           dc.w $0000
A_INNERFRAME06:
[000d1d04] 00064256                  dc.l A_innerframe
[000d1d08]                           dc.w $1000
[000d1d0a]                           dc.w $8f19
[000d1d0c] 000630f2                  dc.l Auo_string
[000d1d10] 000d08ff                  dc.l TEXT_42
[000d1d14]                           dc.w $0000
[000d1d16]                           dc.w $0000
[000d1d18]                           dc.w $0000
[000d1d1a]                           dc.w $0000
[000d1d1c]                           dc.w $0000
[000d1d1e]                           dc.w $0000
[000d1d20]                           dc.w $0000
[000d1d22]                           dc.w $0000
A_INNERFRAME08:
[000d1d24] 00064256                  dc.l A_innerframe
[000d1d28]                           dc.w $1000
[000d1d2a]                           dc.w $8f19
[000d1d2c] 000630f2                  dc.l Auo_string
[000d1d30] 000d06c6                  dc.l TEXT_14
[000d1d34]                           dc.w $0000
[000d1d36]                           dc.w $0000
[000d1d38]                           dc.w $0000
[000d1d3a]                           dc.w $0000
[000d1d3c]                           dc.w $0000
[000d1d3e]                           dc.w $0000
[000d1d40]                           dc.w $0000
[000d1d42]                           dc.w $0000
_C4_IC_COPY:
[000d1d44]                           dc.w $0004
[000d1d46] 000d0f7a                  dc.l $000d0f7a
[000d1d4a] 000d0ffa                  dc.l DATAS_06
[000d1d4e] 000d1020                  dc.l $000d1020
[000d1d52] 000d10a0                  dc.l DATAS_08
[000d1d56]                           dc.w $0000
[000d1d58]                           dc.w $0000
_MSK_IC_COPY:
[000d1d5a]                           dc.w $0000
[000d1d5c]                           dc.w $7e00
[000d1d5e]                           dc.w $7f00
[000d1d60]                           dc.w $7f80
[000d1d62]                           dc.w $7f80
[000d1d64]                           dc.w $7f80
[000d1d66]                           dc.w $7ff8
[000d1d68]                           dc.w $7ffc
[000d1d6a]                           dc.w $7ffe
[000d1d6c]                           dc.w $7ffe
[000d1d6e]                           dc.w $01fe
[000d1d70]                           dc.w $01fe
[000d1d72]                           dc.w $01fe
[000d1d74]                           dc.w $01fe
[000d1d76]                           dc.w $01fe
[000d1d78]                           dc.w $0000
_DAT_IC_COPY:
[000d1d7a]                           dc.w $0000
[000d1d7c]                           dc.w $7e00
[000d1d7e]                           dc.w $4300
[000d1d80]                           dc.w $4280
[000d1d82]                           dc.w $4380
[000d1d84]                           dc.w $4080
[000d1d86]                           dc.w $41f8
[000d1d88]                           dc.w $410c
[000d1d8a]                           dc.w $410a
[000d1d8c]                           dc.w $7f0e
[000d1d8e]                           dc.w $0102
[000d1d90]                           dc.w $0102
[000d1d92]                           dc.w $0102
[000d1d94]                           dc.w $0102
[000d1d96]                           dc.w $01fe
[000d1d98]                           dc.w $0000
IC_COPY:
[000d1d9a] 000d1d5a                  dc.l _MSK_IC_COPY
[000d1d9e] 000d1d7a                  dc.l _DAT_IC_COPY
[000d1da2] 000d05d4                  dc.l TEXT_002
[000d1da6]                           dc.w $1000
[000d1da8]                           dc.w $000a
[000d1daa]                           dc.w $0006
[000d1dac]                           dc.w $0000
[000d1dae]                           dc.w $0000
[000d1db0]                           dc.w $0010
[000d1db2]                           dc.w $0010
[000d1db4]                           dc.w $0000
[000d1db6]                           dc.w $0000
[000d1db8]                           dc.w $0000
[000d1dba]                           dc.w $0000
[000d1dbc] 000d1d44                  dc.l _C4_IC_COPY
_C4_IC_CUT:
[000d1dc0]                           dc.w $0004
[000d1dc2] 000d10c6                  dc.l $000d10c6
[000d1dc6] 000d1146                  dc.l DATAS_10
[000d1dca] 000d116c                  dc.l $000d116c
[000d1dce] 000d11ec                  dc.l DATAS_12
[000d1dd2]                           dc.w $0000
[000d1dd4]                           dc.w $0000
_MSK_IC_CUT:
[000d1dd6]                           dc.w $3ffe
[000d1dd8]                           dc.w $3ffe
[000d1dda]                           dc.w $3ffe
[000d1ddc]                           dc.w $3ffe
[000d1dde]                           dc.w $3ffe
[000d1de0]                           dc.w $3ffe
[000d1de2]                           dc.w $3ffe
[000d1de4]                           dc.w $3ffe
[000d1de6]                           dc.w $3ffe
[000d1de8]                           dc.w $3ffe
[000d1dea]                           dc.w $3ffe
[000d1dec]                           dc.w $3ffe
[000d1dee]                           dc.w $3ffe
[000d1df0]                           dc.w $3ffe
[000d1df2]                           dc.w $3ffe
[000d1df4]                           dc.w $3ffe
_DAT_IC_CUT:
[000d1df6]                           dc.w $3ffe
[000d1df8]                           dc.b '""""""#b!B!'
[000d1e03]                           dc.b $c2
[000d1e04]                           dc.w $2082
[000d1e06]                           dc.w $21c2
[000d1e08]                           dc.b ''r)J)J)J)2&'
[000d1e13]                           dc.b $02
[000d1e14]                           dc.w $3ffe
IC_CUT:
[000d1e16] 000d1dd6                  dc.l _MSK_IC_CUT
[000d1e1a] 000d1df6                  dc.l _DAT_IC_CUT
[000d1e1e] 000d05d4                  dc.l TEXT_002
[000d1e22]                           dc.w $1000
[000d1e24]                           dc.w $000a
[000d1e26]                           dc.w $0006
[000d1e28]                           dc.w $0000
[000d1e2a]                           dc.w $0000
[000d1e2c]                           dc.w $0010
[000d1e2e]                           dc.w $0010
[000d1e30]                           dc.w $0000
[000d1e32]                           dc.w $0000
[000d1e34]                           dc.w $0000
[000d1e36]                           dc.w $0000
[000d1e38] 000d1dc0                  dc.l _C4_IC_CUT
_C4_IC_NEW:
[000d1e3c]                           dc.w $0004
[000d1e3e] 000d1212                  dc.l $000d1212
[000d1e42] 000d1292                  dc.l DATAS_14
[000d1e46] 000d12b8                  dc.l $000d12b8
[000d1e4a] 000d1338                  dc.l DATAS_16
[000d1e4e]                           dc.w $0000
[000d1e50]                           dc.w $0000
_MSK_IC_NEW:
[000d1e52]                           dc.w $0000
[000d1e54]                           dc.w $7ff8
[000d1e56]                           dc.w $7ffc
[000d1e58]                           dc.w $7ffe
[000d1e5a]                           dc.w $7ffe
[000d1e5c]                           dc.w $7ffe
[000d1e5e]                           dc.w $7ffe
[000d1e60]                           dc.w $7ffe
[000d1e62]                           dc.w $7ffe
[000d1e64]                           dc.w $7ffe
[000d1e66]                           dc.w $7ffe
[000d1e68]                           dc.w $7ffe
[000d1e6a]                           dc.w $7ffe
[000d1e6c]                           dc.w $7ffe
[000d1e6e]                           dc.w $7ffe
[000d1e70]                           dc.w $0000
_DAT_IC_NEW:
[000d1e72]                           dc.w $0000
[000d1e74]                           dc.w $7ff8
[000d1e76]                           dc.w $4014
[000d1e78]                           dc.w $4012
[000d1e7a]                           dc.w $401e
[000d1e7c]                           dc.w $4002
[000d1e7e]                           dc.w $4002
[000d1e80]                           dc.w $4002
[000d1e82]                           dc.w $4002
[000d1e84]                           dc.w $4002
[000d1e86]                           dc.w $4002
[000d1e88]                           dc.w $4002
[000d1e8a]                           dc.w $4002
[000d1e8c]                           dc.w $4002
[000d1e8e]                           dc.w $7ffe
[000d1e90]                           dc.w $0000
IC_NEW:
[000d1e92] 000d1e52                  dc.l _MSK_IC_NEW
[000d1e96] 000d1e72                  dc.l _DAT_IC_NEW
[000d1e9a] 000d05d4                  dc.l TEXT_002
[000d1e9e]                           dc.w $1000
[000d1ea0]                           dc.w $000a
[000d1ea2]                           dc.w $0006
[000d1ea4]                           dc.w $0000
[000d1ea6]                           dc.w $0000
[000d1ea8]                           dc.w $0010
[000d1eaa]                           dc.w $0010
[000d1eac]                           dc.w $0000
[000d1eae]                           dc.w $0000
[000d1eb0]                           dc.w $0000
[000d1eb2]                           dc.w $0000
[000d1eb4] 000d1e3c                  dc.l _C4_IC_NEW
_C4_IC_OPEN:
[000d1eb8]                           dc.w $0004
[000d1eba] 000d135e                  dc.l $000d135e
[000d1ebe] 000d13de                  dc.l DATAS_18
[000d1ec2] 000d1404                  dc.l $000d1404
[000d1ec6] 000d1484                  dc.l DATAS_20
[000d1eca]                           dc.w $0000
[000d1ecc]                           dc.w $0000
_MSK_IC_OPEN:
[000d1ece]                           dc.w $0000
[000d1ed0]                           dc.w $01f0
[000d1ed2]                           dc.w $03f8
[000d1ed4]                           dc.w $03ff
[000d1ed6]                           dc.w $3fff
[000d1ed8]                           dc.w $7fff
[000d1eda]                           dc.w $7fff
[000d1edc]                           dc.w $7fff
[000d1ede]                           dc.w $7ffe
[000d1ee0]                           dc.w $7ffe
[000d1ee2]                           dc.w $7ffe
[000d1ee4]                           dc.w $7ffc
[000d1ee6]                           dc.w $7ff8
[000d1ee8]                           dc.w $7ff0
[000d1eea]                           dc.w $7fe0
[000d1eec]                           dc.w $0000
_DAT_IC_OPEN:
[000d1eee]                           dc.w $0000
[000d1ef0]                           dc.w $0000
[000d1ef2]                           dc.w $00e0
[000d1ef4]                           dc.w $0110
[000d1ef6]                           dc.w $3c0a
[000d1ef8]                           dc.w $4206
[000d1efa]                           dc.w $41ce
[000d1efc]                           dc.b '@ @ C'
[000d1f01]                           dc.b $fc
[000d1f02]                           dc.w $4402
[000d1f04]                           dc.w $4804
[000d1f06]                           dc.w $5008
[000d1f08]                           dc.w $6010
[000d1f0a]                           dc.w $7fe0
[000d1f0c]                           dc.w $0000
IC_OPEN:
[000d1f0e] 000d1ece                  dc.l _MSK_IC_OPEN
[000d1f12] 000d1eee                  dc.l _DAT_IC_OPEN
[000d1f16] 000d05d4                  dc.l TEXT_002
[000d1f1a]                           dc.w $1000
[000d1f1c]                           dc.w $000a
[000d1f1e]                           dc.w $0006
[000d1f20]                           dc.w $0000
[000d1f22]                           dc.w $0000
[000d1f24]                           dc.w $0010
[000d1f26]                           dc.w $0010
[000d1f28]                           dc.w $0000
[000d1f2a]                           dc.w $0000
[000d1f2c]                           dc.w $0000
[000d1f2e]                           dc.w $0000
[000d1f30] 000d1eb8                  dc.l _C4_IC_OPEN
_C4_IC_PASTE:
[000d1f34]                           dc.w $0004
[000d1f36] 000d14aa                  dc.l $000d14aa
[000d1f3a] 000d152a                  dc.l DATAS_22
[000d1f3e] 000d1550                  dc.l $000d1550
[000d1f42] 000d15d0                  dc.l DATAS_24
[000d1f46]                           dc.w $0000
[000d1f48]                           dc.w $0000
_MSK_IC_PASTE:
[000d1f4a]                           dc.w $03c0
[000d1f4c]                           dc.w $3ffc
[000d1f4e]                           dc.w $7ffe
[000d1f50]                           dc.w $7ffe
[000d1f52]                           dc.w $7ffe
[000d1f54]                           dc.w $7ffe
[000d1f56]                           dc.w $7ffe
[000d1f58]                           dc.w $7ffe
[000d1f5a]                           dc.w $7ffe
[000d1f5c]                           dc.w $7ffe
[000d1f5e]                           dc.w $7ffe
[000d1f60]                           dc.w $7ffe
[000d1f62]                           dc.w $7ffe
[000d1f64]                           dc.w $3ffe
[000d1f66]                           dc.w $00fe
[000d1f68]                           dc.w $0000
_DAT_IC_PASTE:
[000d1f6a]                           dc.w $03c0
[000d1f6c]                           dc.w $3e7c
[000d1f6e]                           dc.w $45a2
[000d1f70]                           dc.w $47e2
[000d1f72]                           dc.w $4002
[000d1f74]                           dc.w $4002
[000d1f76]                           dc.w $4002
[000d1f78]                           dc.w $4002
[000d1f7a]                           dc.w $40fa
[000d1f7c]                           dc.w $408e
[000d1f7e]                           dc.w $408a
[000d1f80]                           dc.w $408e
[000d1f82]                           dc.w $4082
[000d1f84]                           dc.w $3f82
[000d1f86]                           dc.w $00fe
[000d1f88]                           dc.w $0000
IC_PASTE:
[000d1f8a] 000d1f4a                  dc.l _MSK_IC_PASTE
[000d1f8e] 000d1f6a                  dc.l _DAT_IC_PASTE
[000d1f92] 000d05d4                  dc.l TEXT_002
[000d1f96]                           dc.w $1000
[000d1f98]                           dc.w $000a
[000d1f9a]                           dc.w $0006
[000d1f9c]                           dc.w $0000
[000d1f9e]                           dc.w $0000
[000d1fa0]                           dc.w $0010
[000d1fa2]                           dc.w $0010
[000d1fa4]                           dc.w $0000
[000d1fa6]                           dc.w $0000
[000d1fa8]                           dc.w $0000
[000d1faa]                           dc.w $0000
[000d1fac] 000d1f34                  dc.l _C4_IC_PASTE
_C4_IC_SAVE:
[000d1fb0]                           dc.w $0004
[000d1fb2] 000d15f6                  dc.l $000d15f6
[000d1fb6] 000d1676                  dc.l DATAS_26
[000d1fba] 000d169c                  dc.l $000d169c
[000d1fbe] 000d171c                  dc.l DATAS_28
[000d1fc2]                           dc.w $0000
[000d1fc4]                           dc.w $0000
_MSK_IC_SAVE:
[000d1fc6]                           dc.w $0000
[000d1fc8]                           dc.w $7ffe
[000d1fca]                           dc.w $7ffe
[000d1fcc]                           dc.w $7ffe
[000d1fce]                           dc.w $7ffe
[000d1fd0]                           dc.w $7ffe
[000d1fd2]                           dc.w $7ffe
[000d1fd4]                           dc.w $7ffe
[000d1fd6]                           dc.w $7ffe
[000d1fd8]                           dc.w $7ffe
[000d1fda]                           dc.w $7ffe
[000d1fdc]                           dc.w $7ffe
[000d1fde]                           dc.w $7ffe
[000d1fe0]                           dc.w $3ffe
[000d1fe2]                           dc.w $1ffe
[000d1fe4]                           dc.w $0000
_DAT_IC_SAVE:
[000d1fe6]                           dc.w $0000
[000d1fe8]                           dc.w $7ffe
[000d1fea]                           dc.w $500a
[000d1fec]                           dc.w $53ca
[000d1fee]                           dc.b 'P',$0a,'S',$0a,'P',$0a,'_'
[000d1ff5]                           dc.b $fa
[000d1ff6]                           dc.w $4002
[000d1ff8]                           dc.w $4002
[000d1ffa]                           dc.w $47f2
[000d1ffc]                           dc.b 'DrDr$r'
[000d2002]                           dc.w $1ffe
[000d2004]                           dc.w $0000
IC_SAVE:
[000d2006] 000d1fc6                  dc.l _MSK_IC_SAVE
[000d200a] 000d1fe6                  dc.l _DAT_IC_SAVE
[000d200e] 000d05d4                  dc.l TEXT_002
[000d2012]                           dc.w $1000
[000d2014]                           dc.w $000a
[000d2016]                           dc.w $0006
[000d2018]                           dc.w $0000
[000d201a]                           dc.w $0000
[000d201c]                           dc.w $0010
[000d201e]                           dc.w $0010
[000d2020]                           dc.w $0000
[000d2022]                           dc.w $0000
[000d2024]                           dc.w $0000
[000d2026]                           dc.w $0000
[000d2028] 000d1fb0                  dc.l _C4_IC_SAVE
_C4_IC_UNDO:
[000d202c]                           dc.w $0004
[000d202e] 000d1742                  dc.l $000d1742
[000d2032] 000d17c2                  dc.l DATAS_34
[000d2036] 000d17e8                  dc.l $000d17e8
[000d203a] 000d1868                  dc.l DATAS_36
[000d203e]                           dc.w $0000
[000d2040]                           dc.w $0000
_MSK_IC_UNDO:
[000d2042]                           dc.w $0000
[000d2044]                           dc.w $7ffe
[000d2046]                           dc.w $7ffe
[000d2048]                           dc.w $7ffe
[000d204a]                           dc.w $7ffe
[000d204c]                           dc.w $7ffe
[000d204e]                           dc.w $7ffe
[000d2050]                           dc.w $7ffe
[000d2052]                           dc.w $7ffe
[000d2054]                           dc.w $7ffe
[000d2056]                           dc.w $7ffe
[000d2058]                           dc.w $7ffe
[000d205a]                           dc.w $7ffe
[000d205c]                           dc.w $7ffe
[000d205e]                           dc.w $7ffe
[000d2060]                           dc.w $0000
_DAT_IC_UNDO:
[000d2062]                           dc.w $0000
[000d2064]                           dc.w $7ffe
[000d2066]                           dc.w $4002
[000d2068]                           dc.w $4202
[000d206a]                           dc.w $4602
[000d206c]                           dc.w $4fe2
[000d206e]                           dc.w $4612
[000d2070]                           dc.b 'B',$0a,'@',$0a,'@',$0a,'@',$0a,'@'
[000d2079]                           dc.b $12
[000d207a]                           dc.w $41e2
[000d207c]                           dc.w $4002
[000d207e]                           dc.w $7ffe
[000d2080]                           dc.w $0000
IC_UNDO:
[000d2082] 000d2042                  dc.l _MSK_IC_UNDO
[000d2086] 000d2062                  dc.l _DAT_IC_UNDO
[000d208a] 000d05d4                  dc.l TEXT_002
[000d208e]                           dc.w $1000
[000d2090]                           dc.w $000a
[000d2092]                           dc.w $0006
[000d2094]                           dc.w $0000
[000d2096]                           dc.w $0000
[000d2098]                           dc.w $0010
[000d209a]                           dc.w $0010
[000d209c]                           dc.w $0000
[000d209e]                           dc.w $0000
[000d20a0]                           dc.w $0000
[000d20a2]                           dc.w $0000
[000d20a4] 000d202c                  dc.l _C4_IC_UNDO
_C4__ED_ICON:
[000d20a8]                           dc.w $0004
[000d20aa] 000d0a6e                  dc.l $000d0a6e
[000d20ae] 000d0c6e                  dc.l DATAS_02
[000d20b2] 000d0cf4                  dc.l $000d0cf4
[000d20b6] 000d0ef4                  dc.l DATAS_04
[000d20ba]                           dc.w $0000
[000d20bc]                           dc.w $0000
_MSK__ED_ICON:
[000d20be]                           dc.w $003f
[000d20c0]                           dc.w $ffff
[000d20c2]                           dc.w $007f
[000d20c4]                           dc.w $ffff
[000d20c6]                           dc.w $007f
[000d20c8]                           dc.w $ffff
[000d20ca]                           dc.w $007f
[000d20cc]                           dc.w $ffff
[000d20ce]                           dc.w $007f
[000d20d0]                           dc.w $ffff
[000d20d2]                           dc.w $003f
[000d20d4]                           dc.w $ffff
[000d20d6]                           dc.w $003f
[000d20d8]                           dc.w $ffff
[000d20da]                           dc.w $003f
[000d20dc]                           dc.w $ffff
[000d20de]                           dc.w $003f
[000d20e0]                           dc.w $fffe
[000d20e2]                           dc.w $003f
[000d20e4]                           dc.w $fffc
[000d20e6]                           dc.w $003f
[000d20e8]                           dc.w $ff70
[000d20ea]                           dc.w $003f
[000d20ec]                           dc.w $fe00
[000d20ee]                           dc.w $003f
[000d20f0]                           dc.w $7000
[000d20f2]                           dc.w $003f
[000d20f4]                           dc.w $0000
[000d20f6]                           dc.w $003f
[000d20f8]                           dc.w $0000
[000d20fa]                           dc.w $003f
[000d20fc]                           dc.w $0000
[000d20fe]                           dc.w $003f
[000d2100]                           dc.w $0000
[000d2102]                           dc.w $003f
[000d2104]                           dc.w $0000
[000d2106]                           dc.w $003f
[000d2108]                           dc.w $0000
[000d210a]                           dc.w $003f
[000d210c]                           dc.w $0000
[000d210e]                           dc.w $003f
[000d2110]                           dc.w $0000
[000d2112]                           dc.w $ffff
[000d2114]                           dc.w $ffff
[000d2116]                           dc.w $ffff
[000d2118]                           dc.w $ffff
[000d211a]                           dc.w $ffff
[000d211c]                           dc.w $ffff
[000d211e]                           dc.w $ffff
[000d2120]                           dc.w $ffff
[000d2122]                           dc.w $ffff
[000d2124]                           dc.w $ffff
[000d2126]                           dc.w $ffff
[000d2128]                           dc.w $ffff
[000d212a]                           dc.w $ffff
[000d212c]                           dc.w $ffff
[000d212e]                           dc.w $ffff
[000d2130]                           dc.w $ffff
[000d2132]                           dc.w $ffff
[000d2134]                           dc.w $ffff
[000d2136]                           dc.w $ffff
[000d2138]                           dc.w $ffff
[000d213a]                           dc.w $ffff
[000d213c]                           dc.w $ffff
_DAT__ED_ICON:
[000d213e]                           dc.w $0020
[000d2140]                           dc.w $0000
[000d2142]                           dc.w $0040
[000d2144]                           dc.w $0198
[000d2146]                           dc.w $0040
[000d2148]                           dc.w $3354
[000d214a]                           dc.w $0050
[000d214c]                           dc.w $6ad4
[000d214e]                           dc.w $0040
[000d2150]                           dc.w $5c22
[000d2152]                           dc.w $0028
[000d2154]                           dc.w $4421
[000d2156]                           dc.w $0028
[000d2158]                           dc.w $2211
[000d215a]                           dc.w $0024
[000d215c]                           dc.w $1113
[000d215e]                           dc.w $0023
[000d2160]                           dc.w $090e
[000d2162]                           dc.w $0022
[000d2164]                           dc.w $84fc
[000d2166]                           dc.w $0021
[000d2168]                           dc.w $4770
[000d216a]                           dc.w $0021
[000d216c]                           dc.w $ae00
[000d216e]                           dc.w $0021
[000d2170]                           dc.w $7000
[000d2172]                           dc.w $002d
[000d2174]                           dc.w $0000
[000d2176]                           dc.w $0021
[000d2178]                           dc.w $0000
[000d217a]                           dc.w $0021
[000d217c]                           dc.w $0000
[000d217e]                           dc.w $0021
[000d2180]                           dc.w $0000
[000d2182]                           dc.w $002d
[000d2184]                           dc.w $0000
[000d2186]                           dc.w $0021
[000d2188]                           dc.w $0000
[000d218a]                           dc.w $0021
[000d218c]                           dc.w $0000
[000d218e]                           dc.w $0021
[000d2190]                           dc.w $0000
[000d2192]                           dc.b '~s~~'
[000d2196]                           dc.w $859e
[000d2198]                           dc.w $8486
[000d219a]                           dc.w $f9f9
[000d219c]                           dc.w $f9f9
[000d219e]                           dc.b $09,$09,$09,$09
[000d21a2]                           dc.w $9f9f
[000d21a4]                           dc.w $9f9f
[000d21a6]                           dc.w $e161
[000d21a8]                           dc.b 'aa~~~~BBBB'
[000d21b2]                           dc.w $8282
[000d21b4]                           dc.w $8282
[000d21b6]                           dc.w $8282
[000d21b8]                           dc.w $8282
[000d21ba]                           dc.w $0000
[000d21bc]                           dc.w $0000
_ED_ICON:
[000d21be] 000d20be                  dc.l _MSK__ED_ICON
[000d21c2] 000d213e                  dc.l _DAT__ED_ICON
[000d21c6] 000d076a                  dc.l TEXT_23
[000d21ca]                           dc.w $1000
[000d21cc]                           dc.w $0000
[000d21ce]                           dc.w $0000
[000d21d0]                           dc.w $0014
[000d21d2]                           dc.w $0000
[000d21d4]                           dc.w $0020
[000d21d6]                           dc.w $0020
[000d21d8]                           dc.w $0000
[000d21da]                           dc.w $0020
[000d21dc]                           dc.w $0048
[000d21de]                           dc.w $0008
[000d21e0] 000d20a8                  dc.l _C4__ED_ICON
_ED_MENU:
[000d21e4]                           dc.w $ffff
[000d21e6]                           dc.w $0001
[000d21e8]                           dc.w $0008
[000d21ea]                           dc.w $0019
[000d21ec]                           dc.w $0000
[000d21ee]                           dc.w $0000
[000d21f0]                           dc.w $0000
[000d21f2]                           dc.w $0000
[000d21f4]                           dc.w $0000
[000d21f6]                           dc.w $0000
[000d21f8]                           dc.w $005a
[000d21fa]                           dc.w $0019
_01__ED_MENU:
[000d21fc]                           dc.w $0008
[000d21fe]                           dc.w $0002
[000d2200]                           dc.w $0002
[000d2202]                           dc.w $0014
[000d2204]                           dc.w $0000
[000d2206]                           dc.w $0000
[000d2208]                           dc.w $0000
[000d220a]                           dc.w $1100
[000d220c]                           dc.w $0000
[000d220e]                           dc.w $0000
[000d2210]                           dc.w $005a
[000d2212]                           dc.w $0201
_02__ED_MENU:
[000d2214]                           dc.w $0001
[000d2216]                           dc.w $0003
[000d2218]                           dc.w $0007
[000d221a]                           dc.w $0019
[000d221c]                           dc.w $0000
[000d221e]                           dc.w $0000
[000d2220]                           dc.w $0000
[000d2222]                           dc.w $0000
[000d2224]                           dc.w $0002
[000d2226]                           dc.w $0000
[000d2228]                           dc.w $002b
[000d222a]                           dc.w $0301
_03__ED_MENU:
[000d222c]                           dc.w $0004
[000d222e]                           dc.w $ffff
[000d2230]                           dc.w $ffff
[000d2232]                           dc.w $0020
[000d2234]                           dc.w $0000
[000d2236]                           dc.w $0000
[000d2238] 000d05d4                  dc.l TEXT_002
[000d223c]                           dc.w $0000
[000d223e]                           dc.w $0000
[000d2240]                           dc.w $0006
[000d2242]                           dc.w $0301
_04__ED_MENU:
[000d2244]                           dc.w $0005
[000d2246]                           dc.w $ffff
[000d2248]                           dc.w $ffff
[000d224a]                           dc.w $0020
[000d224c]                           dc.w $0000
[000d224e]                           dc.w $0000
[000d2250] 000d05ea                  dc.l TEXT_006
[000d2254]                           dc.w $0006
[000d2256]                           dc.w $0000
[000d2258]                           dc.w $0007
[000d225a]                           dc.w $0301
_05__ED_MENU:
[000d225c]                           dc.w $0006
[000d225e]                           dc.w $ffff
[000d2260]                           dc.w $ffff
[000d2262]                           dc.w $0020
[000d2264]                           dc.w $0000
[000d2266]                           dc.w $0000
[000d2268] 000d0999                  dc.l TEXT_53
[000d226c]                           dc.w $000d
[000d226e]                           dc.w $0000
[000d2270]                           dc.w $000c
[000d2272]                           dc.w $0301
_06__ED_MENU:
[000d2274]                           dc.w $0007
[000d2276]                           dc.w $ffff
[000d2278]                           dc.w $ffff
[000d227a]                           dc.w $0020
[000d227c]                           dc.w $0000
[000d227e]                           dc.w $0000
[000d2280] 000d05fe                  dc.l TEXT_018
[000d2284]                           dc.w $0019
[000d2286]                           dc.w $0000
[000d2288]                           dc.w $0008
[000d228a]                           dc.w $0301
_07__ED_MENU:
[000d228c]                           dc.w $0002
[000d228e]                           dc.w $ffff
[000d2290]                           dc.w $ffff
[000d2292]                           dc.w $0020
[000d2294]                           dc.w $0000
[000d2296]                           dc.w $0000
[000d2298] 000d0625                  dc.l TEXT_032
[000d229c]                           dc.w $0021
[000d229e]                           dc.w $0000
[000d22a0]                           dc.w $000a
[000d22a2]                           dc.w $0301
_08__ED_MENU:
[000d22a4]                           dc.w $0000
[000d22a6]                           dc.w $0009
[000d22a8]                           dc.w $0047
[000d22aa]                           dc.w $0019
[000d22ac]                           dc.w $0000
[000d22ae]                           dc.w $0000
[000d22b0]                           dc.w $0000
[000d22b2]                           dc.w $0000
[000d22b4]                           dc.w $0000
[000d22b6]                           dc.w $0301
[000d22b8]                           dc.w $0050
[000d22ba]                           dc.w $0013
_09__ED_MENU:
[000d22bc]                           dc.w $0012
[000d22be]                           dc.w $000a
[000d22c0]                           dc.w $0011
[000d22c2]                           dc.w $0014
[000d22c4]                           dc.w $0000
[000d22c6]                           dc.w $0000
[000d22c8]                           dc.w $00ff
[000d22ca]                           dc.w $1100
[000d22cc]                           dc.w $0002
[000d22ce]                           dc.w $0000
[000d22d0]                           dc.w $0014
[000d22d2]                           dc.w $0008
_10__ED_MENU:
[000d22d4]                           dc.w $000b
[000d22d6]                           dc.w $ffff
[000d22d8]                           dc.w $ffff
[000d22da]                           dc.w $001c
[000d22dc]                           dc.w $0000
[000d22de]                           dc.w $2000
[000d22e0] 000d0835                  dc.l TEXT_30
[000d22e4]                           dc.w $0000
[000d22e6]                           dc.w $0000
[000d22e8]                           dc.w $0014
[000d22ea]                           dc.w $0001
_11__ED_MENU:
[000d22ec]                           dc.w $000c
[000d22ee]                           dc.w $ffff
[000d22f0]                           dc.w $ffff
[000d22f2]                           dc.w $001c
[000d22f4]                           dc.w $0000
[000d22f6]                           dc.w $2008
[000d22f8] 000d05d5                  dc.l TEXT_004
[000d22fc]                           dc.w $0000
[000d22fe]                           dc.w $0001
[000d2300]                           dc.w $0014
[000d2302]                           dc.w $0001
_12__ED_MENU:
[000d2304]                           dc.w $000d
[000d2306]                           dc.w $ffff
[000d2308]                           dc.w $ffff
[000d230a]                           dc.w $001c
[000d230c]                           dc.w $0000
[000d230e]                           dc.w $2000
[000d2310] 000d05d4                  dc.l TEXT_002
[000d2314]                           dc.w $0000
[000d2316]                           dc.w $0002
[000d2318]                           dc.w $0014
[000d231a]                           dc.w $0001
_13__ED_MENU:
[000d231c]                           dc.w $000e
[000d231e]                           dc.w $ffff
[000d2320]                           dc.w $ffff
[000d2322]                           dc.w $001c
[000d2324]                           dc.w $0000
[000d2326]                           dc.w $2000
[000d2328] 000d05d4                  dc.l TEXT_002
[000d232c]                           dc.w $0000
[000d232e]                           dc.w $0003
[000d2330]                           dc.w $0014
[000d2332]                           dc.w $0001
_14__ED_MENU:
[000d2334]                           dc.w $000f
[000d2336]                           dc.w $ffff
[000d2338]                           dc.w $ffff
[000d233a]                           dc.w $001c
[000d233c]                           dc.w $0000
[000d233e]                           dc.w $2000
[000d2340] 000d05d4                  dc.l TEXT_002
[000d2344]                           dc.w $0000
[000d2346]                           dc.w $0004
[000d2348]                           dc.w $0014
[000d234a]                           dc.w $0001
_15__ED_MENU:
[000d234c]                           dc.w $0010
[000d234e]                           dc.w $ffff
[000d2350]                           dc.w $ffff
[000d2352]                           dc.w $001c
[000d2354]                           dc.w $0000
[000d2356]                           dc.w $2000
[000d2358] 000d05d4                  dc.l TEXT_002
[000d235c]                           dc.w $0000
[000d235e]                           dc.w $0005
[000d2360]                           dc.w $0014
[000d2362]                           dc.w $0001
_16__ED_MENU:
[000d2364]                           dc.w $0011
[000d2366]                           dc.w $ffff
[000d2368]                           dc.w $ffff
[000d236a]                           dc.w $001c
[000d236c]                           dc.w $0000
[000d236e]                           dc.w $2000
[000d2370] 000d05d4                  dc.l TEXT_002
[000d2374]                           dc.w $0000
[000d2376]                           dc.w $0006
[000d2378]                           dc.w $0014
[000d237a]                           dc.w $0001
_17__ED_MENU:
[000d237c]                           dc.w $0009
[000d237e]                           dc.w $ffff
[000d2380]                           dc.w $ffff
[000d2382]                           dc.w $001c
[000d2384]                           dc.w $0000
[000d2386]                           dc.w $2000
[000d2388] 000d05d4                  dc.l TEXT_002
[000d238c]                           dc.w $0000
[000d238e]                           dc.w $0007
[000d2390]                           dc.w $0014
[000d2392]                           dc.w $0001
_18__ED_MENU:
[000d2394]                           dc.w $0022
[000d2396]                           dc.w $0013
[000d2398]                           dc.w $0020
[000d239a]                           dc.w $0014
[000d239c]                           dc.w $0000
[000d239e]                           dc.w $0000
[000d23a0]                           dc.w $00ff
[000d23a2]                           dc.w $1101
[000d23a4]                           dc.w $0008
[000d23a6]                           dc.w $0000
[000d23a8]                           dc.w $0015
[000d23aa]                           dc.w $0009
_19__ED_MENU:
[000d23ac]                           dc.w $0015
[000d23ae]                           dc.w $ffff
[000d23b0]                           dc.w $ffff
[000d23b2]                           dc.w $001c
[000d23b4]                           dc.w $0000
[000d23b6]                           dc.w $0100
[000d23b8] 000d0809                  dc.l TEXT_28
[000d23bc]                           dc.w $0000
[000d23be]                           dc.w $0000
[000d23c0]                           dc.w $0015
[000d23c2]                           dc.w $0001
_19a_ED_MENU:
[000d23c4] 0003f40a                  dc.l Aed_open
[000d23c8]                           dc.w $0000
[000d23ca]                           dc.w $0000
[000d23cc]                           dc.w $8000
[000d23ce]                           dc.w $844f
[000d23d0]                           dc.w $0000
[000d23d2]                           dc.w $0000
[000d23d4]                           dc.w $0000
[000d23d6]                           dc.w $0000
[000d23d8]                           dc.w $0000
[000d23da]                           dc.w $0000
_21__ED_MENU:
[000d23dc]                           dc.w $0017
[000d23de]                           dc.w $ffff
[000d23e0]                           dc.w $ffff
[000d23e2]                           dc.w $001c
[000d23e4]                           dc.w $0000
[000d23e6]                           dc.w $0100
[000d23e8] 000d06f5                  dc.l TEXT_17
[000d23ec]                           dc.w $0000
[000d23ee]                           dc.w $0001
[000d23f0]                           dc.w $0015
[000d23f2]                           dc.w $0001
_21a_ED_MENU:
[000d23f4] 0003f542                  dc.l Aed_merge
[000d23f8]                           dc.w $0000
[000d23fa]                           dc.w $0000
[000d23fc]                           dc.w $8000
[000d23fe]                           dc.w $0000
[000d2400]                           dc.w $0000
[000d2402]                           dc.w $0000
[000d2404]                           dc.w $0000
[000d2406]                           dc.w $0000
[000d2408]                           dc.w $0000
[000d240a]                           dc.w $0000
_23__ED_MENU:
[000d240c]                           dc.w $0018
[000d240e]                           dc.w $ffff
[000d2410]                           dc.w $ffff
[000d2412]                           dc.w $0018
[000d2414]                           dc.w $0000
[000d2416]                           dc.w $0008
[000d2418] 000d1a44                  dc.l A_ARROWS03
[000d241c]                           dc.w $0000
[000d241e]                           dc.w $0002
[000d2420]                           dc.w $0015
[000d2422]                           dc.w $0001
_24__ED_MENU:
[000d2424]                           dc.w $001a
[000d2426]                           dc.w $ffff
[000d2428]                           dc.w $ffff
[000d242a]                           dc.w $001c
[000d242c]                           dc.w $0000
[000d242e]                           dc.w $0100
[000d2430] 000d071a                  dc.l TEXT_19
[000d2434]                           dc.w $0000
[000d2436]                           dc.w $0003
[000d2438]                           dc.w $0015
[000d243a]                           dc.w $0001
_24a_ED_MENU:
[000d243c] 0003fb40                  dc.l Aed_save
[000d2440]                           dc.w $0000
[000d2442]                           dc.w $0000
[000d2444]                           dc.w $8000
[000d2446]                           dc.w $8453
[000d2448]                           dc.w $0000
[000d244a]                           dc.w $0000
[000d244c]                           dc.w $0000
[000d244e]                           dc.w $0000
[000d2450]                           dc.w $0000
[000d2452]                           dc.w $0000
_26__ED_MENU:
[000d2454]                           dc.w $001c
[000d2456]                           dc.w $ffff
[000d2458]                           dc.w $ffff
[000d245a]                           dc.w $001c
[000d245c]                           dc.w $0000
[000d245e]                           dc.w $0100
[000d2460] 000d06e0                  dc.l TEXT_16
[000d2464]                           dc.w $0000
[000d2466]                           dc.w $0004
[000d2468]                           dc.w $0015
[000d246a]                           dc.w $0001
_26a_ED_MENU:
[000d246c] 0003fc0c                  dc.l Aed_saveas
[000d2470]                           dc.w $0000
[000d2472]                           dc.w $0000
[000d2474]                           dc.w $8000
[000d2476]                           dc.w $844d
[000d2478]                           dc.w $0000
[000d247a]                           dc.w $0000
[000d247c]                           dc.w $0000
[000d247e]                           dc.w $0000
[000d2480]                           dc.w $0000
[000d2482]                           dc.w $0000
_28__ED_MENU:
[000d2484]                           dc.w $001d
[000d2486]                           dc.w $ffff
[000d2488]                           dc.w $ffff
[000d248a]                           dc.w $0018
[000d248c]                           dc.w $0000
[000d248e]                           dc.w $0008
[000d2490] 000d1a44                  dc.l A_ARROWS03
[000d2494]                           dc.w $0000
[000d2496]                           dc.w $0005
[000d2498]                           dc.w $0015
[000d249a]                           dc.w $0001
_29__ED_MENU:
[000d249c]                           dc.w $001f
[000d249e]                           dc.w $ffff
[000d24a0]                           dc.w $ffff
[000d24a2]                           dc.w $001c
[000d24a4]                           dc.w $0000
[000d24a6]                           dc.w $0100
[000d24a8] 000d0705                  dc.l TEXT_18
[000d24ac]                           dc.w $0000
[000d24ae]                           dc.w $0006
[000d24b0]                           dc.w $0015
[000d24b2]                           dc.w $0001
_29a_ED_MENU:
[000d24b4] 0003f184                  dc.l Aed_info
[000d24b8]                           dc.w $0000
[000d24ba]                           dc.w $0000
[000d24bc]                           dc.w $8000
[000d24be]                           dc.w $8449
[000d24c0]                           dc.w $0000
[000d24c2]                           dc.w $0000
[000d24c4]                           dc.w $0000
[000d24c6]                           dc.w $0000
[000d24c8]                           dc.w $0000
[000d24ca]                           dc.w $0000
_31__ED_MENU:
[000d24cc]                           dc.w $0020
[000d24ce]                           dc.w $ffff
[000d24d0]                           dc.w $ffff
[000d24d2]                           dc.w $0018
[000d24d4]                           dc.w $0000
[000d24d6]                           dc.w $0008
[000d24d8] 000d1a44                  dc.l A_ARROWS03
[000d24dc]                           dc.w $0000
[000d24de]                           dc.w $0007
[000d24e0]                           dc.w $0015
[000d24e2]                           dc.w $0001
_32__ED_MENU:
[000d24e4]                           dc.w $0012
[000d24e6]                           dc.w $ffff
[000d24e8]                           dc.w $ffff
[000d24ea]                           dc.w $001c
[000d24ec]                           dc.w $0000
[000d24ee]                           dc.w $0100
[000d24f0] 000d0a17                  dc.l TEXT_63
[000d24f4]                           dc.w $0000
[000d24f6]                           dc.w $0008
[000d24f8]                           dc.w $0015
[000d24fa]                           dc.w $0001
_32a_ED_MENU:
[000d24fc] 0003f590                  dc.l Aed_quit
[000d2500]                           dc.w $0000
[000d2502]                           dc.w $0000
[000d2504]                           dc.w $8000
[000d2506]                           dc.w $8444
[000d2508]                           dc.w $0000
[000d250a]                           dc.w $0000
[000d250c]                           dc.w $0000
[000d250e]                           dc.w $0000
[000d2510]                           dc.w $0000
[000d2512]                           dc.w $0000
_34__ED_MENU:
[000d2514]                           dc.w $0038
[000d2516]                           dc.w $0023
[000d2518]                           dc.w $0036
[000d251a]                           dc.w $0014
[000d251c]                           dc.w $0000
[000d251e]                           dc.w $0000
[000d2520]                           dc.w $00ff
[000d2522]                           dc.w $1101
[000d2524]                           dc.w $000f
[000d2526]                           dc.w $0000
[000d2528]                           dc.w $0017
[000d252a]                           dc.w $000c
_35__ED_MENU:
[000d252c]                           dc.w $0025
[000d252e]                           dc.w $ffff
[000d2530]                           dc.w $ffff
[000d2532]                           dc.w $001c
[000d2534]                           dc.w $0000
[000d2536]                           dc.w $0100
[000d2538] 000d0a39                  dc.l TEXT_66
[000d253c]                           dc.w $0000
[000d253e]                           dc.w $0000
[000d2540]                           dc.w $0017
[000d2542]                           dc.w $0001
_35a_ED_MENU:
[000d2544] 0003fe06                  dc.l Aed_undo
[000d2548]                           dc.w $0000
[000d254a]                           dc.w $0000
[000d254c]                           dc.w $8000
[000d254e]                           dc.w $800f
[000d2550]                           dc.w $0000
[000d2552]                           dc.w $0000
[000d2554]                           dc.w $0000
[000d2556]                           dc.w $0000
[000d2558]                           dc.w $0000
[000d255a]                           dc.w $0000
_37__ED_MENU:
[000d255c]                           dc.w $0026
[000d255e]                           dc.w $ffff
[000d2560]                           dc.w $ffff
[000d2562]                           dc.w $0018
[000d2564]                           dc.w $0000
[000d2566]                           dc.w $0008
[000d2568] 000d1a44                  dc.l A_ARROWS03
[000d256c]                           dc.w $0000
[000d256e]                           dc.w $0001
[000d2570]                           dc.w $0017
[000d2572]                           dc.w $0001
_38__ED_MENU:
[000d2574]                           dc.w $0028
[000d2576]                           dc.w $ffff
[000d2578]                           dc.w $ffff
[000d257a]                           dc.w $001c
[000d257c]                           dc.w $0000
[000d257e]                           dc.w $0100
[000d2580] 000d081e                  dc.l TEXT_29
[000d2584]                           dc.w $0000
[000d2586]                           dc.w $0002
[000d2588]                           dc.w $0017
[000d258a]                           dc.w $0001
_38a_ED_MENU:
[000d258c] 0003ec3e                  dc.l Aed_cut
[000d2590]                           dc.w $0000
[000d2592]                           dc.w $0000
[000d2594]                           dc.w $8000
[000d2596]                           dc.w $8458
[000d2598]                           dc.w $0000
[000d259a]                           dc.w $0000
[000d259c]                           dc.w $0000
[000d259e]                           dc.w $0000
[000d25a0]                           dc.w $0000
[000d25a2]                           dc.w $0000
_40__ED_MENU:
[000d25a4]                           dc.w $002a
[000d25a6]                           dc.w $ffff
[000d25a8]                           dc.w $ffff
[000d25aa]                           dc.w $001c
[000d25ac]                           dc.w $0000
[000d25ae]                           dc.w $0100
[000d25b0] 000d07c4                  dc.l TEXT_25
[000d25b4]                           dc.w $0000
[000d25b6]                           dc.w $0003
[000d25b8]                           dc.w $0017
[000d25ba]                           dc.w $0001
_40a_ED_MENU:
[000d25bc] 0003ec28                  dc.l Aed_copy
[000d25c0]                           dc.w $0000
[000d25c2]                           dc.w $0000
[000d25c4]                           dc.w $8000
[000d25c6]                           dc.w $8443
[000d25c8]                           dc.w $0000
[000d25ca]                           dc.w $0000
[000d25cc]                           dc.w $0000
[000d25ce]                           dc.w $0000
[000d25d0]                           dc.w $0000
[000d25d2]                           dc.w $0000
_42__ED_MENU:
[000d25d4]                           dc.w $002c
[000d25d6]                           dc.w $ffff
[000d25d8]                           dc.w $ffff
[000d25da]                           dc.w $001c
[000d25dc]                           dc.w $0000
[000d25de]                           dc.w $0100
[000d25e0] 000d08c0                  dc.l TEXT_38
[000d25e4]                           dc.w $0000
[000d25e6]                           dc.w $0004
[000d25e8]                           dc.w $0017
[000d25ea]                           dc.w $0001
_42a_ED_MENU:
[000d25ec] 0003f57a                  dc.l Aed_paste
[000d25f0]                           dc.w $0000
[000d25f2]                           dc.w $0000
[000d25f4]                           dc.w $8000
[000d25f6]                           dc.w $8456
[000d25f8]                           dc.w $0000
[000d25fa]                           dc.w $0000
[000d25fc]                           dc.w $0000
[000d25fe]                           dc.w $0000
[000d2600]                           dc.w $0000
[000d2602]                           dc.w $0000
_44__ED_MENU:
[000d2604]                           dc.w $002e
[000d2606]                           dc.w $ffff
[000d2608]                           dc.w $ffff
[000d260a]                           dc.w $001c
[000d260c]                           dc.w $0000
[000d260e]                           dc.w $0100
[000d2610] 000d07db                  dc.l TEXT_26
[000d2614]                           dc.w $0000
[000d2616]                           dc.w $0005
[000d2618]                           dc.w $0017
[000d261a]                           dc.w $0001
_44a_ED_MENU:
[000d261c] 0003ec54                  dc.l Aed_cutline
[000d2620]                           dc.w $0000
[000d2622]                           dc.w $0000
[000d2624]                           dc.w $8000
[000d2626]                           dc.w $8459
[000d2628]                           dc.w $0000
[000d262a]                           dc.w $0000
[000d262c]                           dc.w $0000
[000d262e]                           dc.w $0000
[000d2630]                           dc.w $0000
[000d2632]                           dc.w $0000
_46__ED_MENU:
[000d2634]                           dc.w $002f
[000d2636]                           dc.w $ffff
[000d2638]                           dc.w $ffff
[000d263a]                           dc.w $0018
[000d263c]                           dc.w $0000
[000d263e]                           dc.w $0008
[000d2640] 000d1a44                  dc.l A_ARROWS03
[000d2644]                           dc.w $0000
[000d2646]                           dc.w $0006
[000d2648]                           dc.w $0017
[000d264a]                           dc.w $0001
_47__ED_MENU:
[000d264c]                           dc.w $0031
[000d264e]                           dc.w $ffff
[000d2650]                           dc.w $ffff
[000d2652]                           dc.w $001c
[000d2654]                           dc.w $0000
[000d2656]                           dc.w $0100
[000d2658] 000d072f                  dc.l TEXT_20
[000d265c]                           dc.w $0000
[000d265e]                           dc.w $0007
[000d2660]                           dc.w $0017
[000d2662]                           dc.w $0001
_47a_ED_MENU:
[000d2664] 0004021a                  dc.l Aed_toclip
[000d2668]                           dc.w $0000
[000d266a]                           dc.w $0000
[000d266c]                           dc.w $8000
[000d266e]                           dc.w $8743
[000d2670]                           dc.w $0000
[000d2672]                           dc.w $0000
[000d2674]                           dc.w $0000
[000d2676]                           dc.w $0000
[000d2678]                           dc.w $0000
[000d267a]                           dc.w $0000
_49__ED_MENU:
[000d267c]                           dc.w $0033
[000d267e]                           dc.w $ffff
[000d2680]                           dc.w $ffff
[000d2682]                           dc.w $001c
[000d2684]                           dc.w $0000
[000d2686]                           dc.w $0100
[000d2688] 000d07f2                  dc.l TEXT_27
[000d268c]                           dc.w $0000
[000d268e]                           dc.w $0008
[000d2690]                           dc.w $0017
[000d2692]                           dc.w $0001
_49a_ED_MENU:
[000d2694] 0004025c                  dc.l Aed_fromclip
[000d2698]                           dc.w $0000
[000d269a]                           dc.w $0000
[000d269c]                           dc.w $8000
[000d269e]                           dc.w $8756
[000d26a0]                           dc.w $0000
[000d26a2]                           dc.w $0000
[000d26a4]                           dc.w $0000
[000d26a6]                           dc.w $0000
[000d26a8]                           dc.w $0000
[000d26aa]                           dc.w $0000
_51__ED_MENU:
[000d26ac]                           dc.w $0034
[000d26ae]                           dc.w $ffff
[000d26b0]                           dc.w $ffff
[000d26b2]                           dc.w $0018
[000d26b4]                           dc.w $0000
[000d26b6]                           dc.w $0008
[000d26b8] 000d1a44                  dc.l A_ARROWS03
[000d26bc]                           dc.w $0000
[000d26be]                           dc.w $0009
[000d26c0]                           dc.w $0017
[000d26c2]                           dc.w $0001
_52__ED_MENU:
[000d26c4]                           dc.w $0036
[000d26c6]                           dc.w $ffff
[000d26c8]                           dc.w $ffff
[000d26ca]                           dc.w $001c
[000d26cc]                           dc.w $0000
[000d26ce]                           dc.w $0100
[000d26d0] 000d08a9                  dc.l TEXT_37
[000d26d4]                           dc.w $0000
[000d26d6]                           dc.w $000a
[000d26d8]                           dc.w $0017
[000d26da]                           dc.w $0001
_52a_ED_MENU:
[000d26dc] 0003fd1a                  dc.l Aed_swap
[000d26e0]                           dc.w $0000
[000d26e2]                           dc.w $0000
[000d26e4]                           dc.w $8000
[000d26e6]                           dc.w $8854
[000d26e8]                           dc.w $0000
[000d26ea]                           dc.w $0000
[000d26ec]                           dc.w $0000
[000d26ee]                           dc.w $0000
[000d26f0]                           dc.w $0000
[000d26f2]                           dc.w $0000
_54__ED_MENU:
[000d26f4]                           dc.w $0022
[000d26f6]                           dc.w $ffff
[000d26f8]                           dc.w $ffff
[000d26fa]                           dc.w $001c
[000d26fc]                           dc.w $0000
[000d26fe]                           dc.w $0100
[000d2700] 000d0a50                  dc.l TEXT_67
[000d2704]                           dc.w $0000
[000d2706]                           dc.w $000b
[000d2708]                           dc.w $0017
[000d270a]                           dc.w $0001
_54a_ED_MENU:
[000d270c] 0003fc1c                  dc.l Aed_selall
[000d2710]                           dc.w $0000
[000d2712]                           dc.w $0000
[000d2714]                           dc.w $8000
[000d2716]                           dc.w $8441
[000d2718]                           dc.w $0000
[000d271a]                           dc.w $0000
[000d271c]                           dc.w $0000
[000d271e]                           dc.w $0000
[000d2720]                           dc.w $0000
[000d2722]                           dc.w $0000
_56__ED_MENU:
[000d2724]                           dc.w $0047
[000d2726]                           dc.w $0039
[000d2728]                           dc.w $0045
[000d272a]                           dc.w $0014
[000d272c]                           dc.w $0000
[000d272e]                           dc.w $0000
[000d2730]                           dc.w $00ff
[000d2732]                           dc.w $1101
[000d2734]                           dc.w $001b
[000d2736]                           dc.w $0000
[000d2738]                           dc.w $0015
[000d273a]                           dc.w $0008
_57__ED_MENU:
[000d273c]                           dc.w $003b
[000d273e]                           dc.w $ffff
[000d2740]                           dc.w $ffff
[000d2742]                           dc.w $001c
[000d2744]                           dc.w $0000
[000d2746]                           dc.w $0100
[000d2748] 000d0867                  dc.l TEXT_34
[000d274c]                           dc.w $0000
[000d274e]                           dc.w $0000
[000d2750]                           dc.w $0015
[000d2752]                           dc.w $0001
_57a_ED_MENU:
[000d2754] 0003ed92                  dc.l Aed_find
[000d2758]                           dc.w $0000
[000d275a]                           dc.w $0000
[000d275c]                           dc.w $8000
[000d275e]                           dc.w $8446
[000d2760]                           dc.w $0000
[000d2762]                           dc.w $0000
[000d2764]                           dc.w $0000
[000d2766]                           dc.w $0000
[000d2768]                           dc.w $0000
[000d276a]                           dc.w $0000
_59__ED_MENU:
[000d276c]                           dc.w $003d
[000d276e]                           dc.w $ffff
[000d2770]                           dc.w $ffff
[000d2772]                           dc.w $001c
[000d2774]                           dc.w $0000
[000d2776]                           dc.w $0100
[000d2778] 000d087c                  dc.l TEXT_35
[000d277c]                           dc.w $0000
[000d277e]                           dc.w $0001
[000d2780]                           dc.w $0015
[000d2782]                           dc.w $0001
_59a_ED_MENU:
[000d2784] 0003ee84                  dc.l Aed_findnext
[000d2788]                           dc.w $0000
[000d278a]                           dc.w $0000
[000d278c]                           dc.w $8000
[000d278e]                           dc.w $8447
[000d2790]                           dc.w $0000
[000d2792]                           dc.w $0000
[000d2794]                           dc.w $0000
[000d2796]                           dc.w $0000
[000d2798]                           dc.w $0000
[000d279a]                           dc.w $0000
_61__ED_MENU:
[000d279c]                           dc.w $003f
[000d279e]                           dc.w $ffff
[000d27a0]                           dc.w $ffff
[000d27a2]                           dc.w $001c
[000d27a4]                           dc.w $0000
[000d27a6]                           dc.w $0100
[000d27a8] 000d090e                  dc.l TEXT_44
[000d27ac]                           dc.w $0000
[000d27ae]                           dc.w $0002
[000d27b0]                           dc.w $0015
[000d27b2]                           dc.w $0001
_61a_ED_MENU:
[000d27b4] 0003ee94                  dc.l Aed_findsel
[000d27b8]                           dc.w $0000
[000d27ba]                           dc.w $0000
[000d27bc]                           dc.w $8000
[000d27be]                           dc.w $8809
[000d27c0]                           dc.w $0000
[000d27c2]                           dc.w $0000
[000d27c4]                           dc.w $0000
[000d27c6]                           dc.w $0000
[000d27c8]                           dc.w $0000
[000d27ca]                           dc.w $0000
_63__ED_MENU:
[000d27cc]                           dc.w $0040
[000d27ce]                           dc.w $ffff
[000d27d0]                           dc.w $ffff
[000d27d2]                           dc.w $0018
[000d27d4]                           dc.w $0000
[000d27d6]                           dc.w $0008
[000d27d8] 000d1a44                  dc.l A_ARROWS03
[000d27dc]                           dc.w $0000
[000d27de]                           dc.w $0003
[000d27e0]                           dc.w $0015
[000d27e2]                           dc.w $0001
_64__ED_MENU:
[000d27e4]                           dc.w $0042
[000d27e6]                           dc.w $ffff
[000d27e8]                           dc.w $ffff
[000d27ea]                           dc.w $001c
[000d27ec]                           dc.w $0000
[000d27ee]                           dc.w $0100
[000d27f0] 000d0746                  dc.l TEXT_21
[000d27f4]                           dc.w $0000
[000d27f6]                           dc.w $0004
[000d27f8]                           dc.w $0015
[000d27fa]                           dc.w $0001
_64a_ED_MENU:
[000d27fc] 0003f7a2                  dc.l Aed_replace
[000d2800]                           dc.w $0000
[000d2802]                           dc.w $0000
[000d2804]                           dc.w $8000
[000d2806]                           dc.w $8452
[000d2808]                           dc.w $0000
[000d280a]                           dc.w $0000
[000d280c]                           dc.w $0000
[000d280e]                           dc.w $0000
[000d2810]                           dc.w $0000
[000d2812]                           dc.w $0000
_66__ED_MENU:
[000d2814]                           dc.w $0044
[000d2816]                           dc.w $ffff
[000d2818]                           dc.w $ffff
[000d281a]                           dc.w $001c
[000d281c]                           dc.w $0000
[000d281e]                           dc.w $0100
[000d2820] 000d0852                  dc.l TEXT_33
[000d2824]                           dc.w $0000
[000d2826]                           dc.w $0005
[000d2828]                           dc.w $0015
[000d282a]                           dc.w $0001
_66a_ED_MENU:
[000d282c] 0003f8e6                  dc.l Aed_replacenext
[000d2830]                           dc.w $0000
[000d2832]                           dc.w $0000
[000d2834]                           dc.w $8000
[000d2836]                           dc.w $8454
[000d2838]                           dc.w $0000
[000d283a]                           dc.w $0000
[000d283c]                           dc.w $0000
[000d283e]                           dc.w $0000
[000d2840]                           dc.w $0000
[000d2842]                           dc.w $0000
_68__ED_MENU:
[000d2844]                           dc.w $0045
[000d2846]                           dc.w $ffff
[000d2848]                           dc.w $ffff
[000d284a]                           dc.w $0018
[000d284c]                           dc.w $0000
[000d284e]                           dc.w $0008
[000d2850] 000d1a44                  dc.l A_ARROWS03
[000d2854]                           dc.w $0000
[000d2856]                           dc.w $0006
[000d2858]                           dc.w $0015
[000d285a]                           dc.w $0001
_69__ED_MENU:
[000d285c]                           dc.w $0038
[000d285e]                           dc.w $ffff
[000d2860]                           dc.w $ffff
[000d2862]                           dc.w $001c
[000d2864]                           dc.w $0000
[000d2866]                           dc.w $0100
[000d2868] 000d0680                  dc.l TEXT_08
[000d286c]                           dc.w $0000
[000d286e]                           dc.w $0007
[000d2870]                           dc.w $0015
[000d2872]                           dc.w $0001
_69a_ED_MENU:
[000d2874] 0003f0aa                  dc.l Aed_gotoline
[000d2878]                           dc.w $0000
[000d287a]                           dc.w $0000
[000d287c]                           dc.w $8000
[000d287e]                           dc.w $844c
[000d2880]                           dc.w $0000
[000d2882]                           dc.w $0000
[000d2884]                           dc.w $0000
[000d2886]                           dc.w $0000
[000d2888]                           dc.w $0000
[000d288a]                           dc.w $0000
_71__ED_MENU:
[000d288c]                           dc.w $0008
[000d288e]                           dc.w $0048
[000d2890]                           dc.w $0051
[000d2892]                           dc.w $0014
[000d2894]                           dc.w $0000
[000d2896]                           dc.w $0000
[000d2898]                           dc.w $00ff
[000d289a]                           dc.w $1101
[000d289c]                           dc.w $0023
[000d289e]                           dc.w $0000
[000d28a0]                           dc.w $0018
[000d28a2]                           dc.w $0006
_72__ED_MENU:
[000d28a4]                           dc.w $004a
[000d28a6]                           dc.w $ffff
[000d28a8]                           dc.w $ffff
[000d28aa]                           dc.w $001c
[000d28ac]                           dc.w $0000
[000d28ae]                           dc.w $0100
[000d28b0] 000d093e                  dc.l TEXT_46
[000d28b4]                           dc.w $0000
[000d28b6]                           dc.w $0000
[000d28b8]                           dc.w $0018
[000d28ba]                           dc.w $0001
_72a_ED_MENU:
[000d28bc] 00040068                  dc.l Aed_wrap
[000d28c0]                           dc.w $0000
[000d28c2]                           dc.w $0000
[000d28c4]                           dc.w $8000
[000d28c6]                           dc.w $8855
[000d28c8]                           dc.w $0000
[000d28ca]                           dc.w $0000
[000d28cc]                           dc.w $0000
[000d28ce]                           dc.w $0000
[000d28d0]                           dc.w $0000
[000d28d2]                           dc.w $0000
_74__ED_MENU:
[000d28d4]                           dc.w $004c
[000d28d6]                           dc.w $ffff
[000d28d8]                           dc.w $ffff
[000d28da]                           dc.w $001c
[000d28dc]                           dc.w $0000
[000d28de]                           dc.w $0100
[000d28e0] 000d0967                  dc.l TEXT_48
[000d28e4]                           dc.w $0000
[000d28e6]                           dc.w $0001
[000d28e8]                           dc.w $0018
[000d28ea]                           dc.w $0001
_74a_ED_MENU:
[000d28ec] 00040ac6                  dc.l Aed_fkey
[000d28f0]                           dc.w $0000
[000d28f2]                           dc.w $0000
[000d28f4]                           dc.w $8000
[000d28f6]                           dc.w $8846
[000d28f8]                           dc.w $0000
[000d28fa]                           dc.w $0000
[000d28fc]                           dc.w $0000
[000d28fe]                           dc.w $0000
[000d2900]                           dc.w $0000
[000d2902]                           dc.w $0000
_76__ED_MENU:
[000d2904]                           dc.w $004e
[000d2906]                           dc.w $ffff
[000d2908]                           dc.w $ffff
[000d290a]                           dc.w $001c
[000d290c]                           dc.w $0000
[000d290e]                           dc.w $0100
[000d2910] 000d08df                  dc.l TEXT_40
[000d2914]                           dc.w $0000
[000d2916]                           dc.w $0002
[000d2918]                           dc.w $0018
[000d291a]                           dc.w $0001
_76a_ED_MENU:
[000d291c] 0003ef38                  dc.l Aed_font
[000d2920]                           dc.w $0000
[000d2922]                           dc.w $0000
[000d2924]                           dc.w $8000
[000d2926]                           dc.w $8853
[000d2928]                           dc.w $0000
[000d292a]                           dc.w $0000
[000d292c]                           dc.w $0000
[000d292e]                           dc.w $0000
[000d2930]                           dc.w $0000
[000d2932]                           dc.w $0000
_78__ED_MENU:
[000d2934]                           dc.w $0050
[000d2936]                           dc.w $ffff
[000d2938]                           dc.w $ffff
[000d293a]                           dc.w $001c
[000d293c]                           dc.w $0000
[000d293e]                           dc.w $0100
[000d2940] 000d0891                  dc.l TEXT_36
[000d2944]                           dc.w $0000
[000d2946]                           dc.w $0003
[000d2948]                           dc.w $0018
[000d294a]                           dc.w $0001
_78a_ED_MENU:
[000d294c] 0003fe1c                  dc.l Aed_option
[000d2950]                           dc.w $0000
[000d2952]                           dc.w $0000
[000d2954]                           dc.w $8000
[000d2956]                           dc.w $884f
[000d2958]                           dc.w $0000
[000d295a]                           dc.w $0000
[000d295c]                           dc.w $0000
[000d295e]                           dc.w $0000
[000d2960]                           dc.w $0000
[000d2962]                           dc.w $0000
_80__ED_MENU:
[000d2964]                           dc.w $0051
[000d2966]                           dc.w $ffff
[000d2968]                           dc.w $ffff
[000d296a]                           dc.w $0018
[000d296c]                           dc.w $0000
[000d296e]                           dc.w $0108
[000d2970] 000d1a44                  dc.l A_ARROWS03
[000d2974]                           dc.w $0000
[000d2976]                           dc.w $0004
[000d2978]                           dc.w $0018
[000d297a]                           dc.w $0001
_81__ED_MENU:
[000d297c]                           dc.w $0047
[000d297e]                           dc.w $ffff
[000d2980]                           dc.w $ffff
[000d2982]                           dc.w $001c
[000d2984]                           dc.w $0000
[000d2986]                           dc.w $0000
[000d2988] 000d06d3                  dc.l TEXT_15
[000d298c]                           dc.w $0000
[000d298e]                           dc.w $0005
[000d2990]                           dc.w $0018
[000d2992]                           dc.w $0001
_81a_ED_MENU:
[000d2994] 0004029a                  dc.l Aed_saveoptions
[000d2998]                           dc.w $0000
[000d299a]                           dc.w $0000
[000d299c]                           dc.w $8020
[000d299e]                           dc.w $0000
[000d29a0]                           dc.w $0000
[000d29a2]                           dc.w $0000
[000d29a4]                           dc.w $0000
[000d29a6]                           dc.w $0000
[000d29a8]                           dc.w $0000
[000d29aa]                           dc.w $0000
INFOBOX:
[000d29ac]                           dc.w $ffff
[000d29ae]                           dc.w $0001
[000d29b0]                           dc.w $0001
[000d29b2]                           dc.w $0019
[000d29b4]                           dc.w $0000
[000d29b6]                           dc.w $0000
[000d29b8]                           dc.w $00ff
[000d29ba]                           dc.w $1141
[000d29bc]                           dc.w $0000
[000d29be]                           dc.w $0000
[000d29c0]                           dc.w $001c
[000d29c2]                           dc.w $0007
_01_INFOBOX:
[000d29c4]                           dc.w $0000
[000d29c6]                           dc.w $0002
[000d29c8]                           dc.w $0002
[000d29ca]                           dc.w $0018
[000d29cc]                           dc.w $0040
[000d29ce]                           dc.w $0010
[000d29d0] 000d18a4                  dc.l A_3DBUTTON01
[000d29d4]                           dc.w $0000
[000d29d6]                           dc.w $0000
[000d29d8]                           dc.w $001c
[000d29da]                           dc.w $0007
_02_INFOBOX:
[000d29dc]                           dc.w $0001
[000d29de]                           dc.w $0003
[000d29e0]                           dc.w $0003
[000d29e2]                           dc.w $0018
[000d29e4]                           dc.w $0040
[000d29e6]                           dc.w $0000
[000d29e8] 000d18e4                  dc.l A_3DBUTTON03
[000d29ec]                           dc.w $0002
[000d29ee]                           dc.w $0001
[000d29f0]                           dc.w $0018
[000d29f2]                           dc.w $0005
_03_INFOBOX:
[000d29f4]                           dc.w $0002
[000d29f6]                           dc.w $0004
[000d29f8]                           dc.w $0004
[000d29fa]                           dc.w $0014
[000d29fc]                           dc.w $0040
[000d29fe]                           dc.w $0000
[000d2a00]                           dc.w $0000
[000d2a02]                           dc.w $0101
[000d2a04]                           dc.w $0000
[000d2a06]                           dc.w $0000
[000d2a08]                           dc.w $0018
[000d2a0a]                           dc.w $0005
_04_INFOBOX:
[000d2a0c]                           dc.w $0003
[000d2a0e]                           dc.w $ffff
[000d2a10]                           dc.w $ffff
[000d2a12]                           dc.w $0018
[000d2a14]                           dc.w $0060
[000d2a16]                           dc.w $0000
[000d2a18] 000d1c84                  dc.l A_FTEXT02
[000d2a1c]                           dc.w $0001
[000d2a1e]                           dc.w $0000
[000d2a20]                           dc.w $0016
[000d2a22]                           dc.w $0005
_ED_FIND:
[000d2a24]                           dc.w $ffff
[000d2a26]                           dc.w $0001
[000d2a28]                           dc.w $0001
[000d2a2a]                           dc.w $0019
[000d2a2c]                           dc.w $0000
[000d2a2e]                           dc.w $0000
[000d2a30]                           dc.w $00ff
[000d2a32]                           dc.w $1141
[000d2a34]                           dc.w $0000
[000d2a36]                           dc.w $0000
[000d2a38]                           dc.w $002c
[000d2a3a]                           dc.w $000a
_01__ED_FIND:
[000d2a3c]                           dc.w $0000
[000d2a3e]                           dc.w $0002
[000d2a40]                           dc.w $000d
[000d2a42]                           dc.w $0018
[000d2a44]                           dc.w $0040
[000d2a46]                           dc.w $0010
[000d2a48] 000d18a4                  dc.l A_3DBUTTON01
[000d2a4c]                           dc.w $0000
[000d2a4e]                           dc.w $0000
[000d2a50]                           dc.w $002c
[000d2a52]                           dc.w $000a
_02__ED_FIND:
[000d2a54]                           dc.w $0004
[000d2a56]                           dc.w $0003
[000d2a58]                           dc.w $0003
[000d2a5a]                           dc.w $0018
[000d2a5c]                           dc.w $0040
[000d2a5e]                           dc.w $0000
[000d2a60] 000d1ca4                  dc.l A_INNERFRAME02
[000d2a64]                           dc.w $0001
[000d2a66]                           dc.w $0001
[000d2a68]                           dc.w $002a
[000d2a6a]                           dc.w $0003
_03__ED_FIND:
[000d2a6c]                           dc.w $0002
[000d2a6e]                           dc.w $ffff
[000d2a70]                           dc.w $ffff
[000d2a72]                           dc.w $0018
[000d2a74]                           dc.w $0008
[000d2a76]                           dc.w $0010
[000d2a78] 000d1a84                  dc.l A_BOXED02
[000d2a7c]                           dc.w $0001
[000d2a7e]                           dc.w $0001
[000d2a80]                           dc.w $0028
[000d2a82]                           dc.w $0001
_04__ED_FIND:
[000d2a84]                           dc.w $000b
[000d2a86]                           dc.w $0005
[000d2a88]                           dc.w $0009
[000d2a8a]                           dc.w $0018
[000d2a8c]                           dc.w $0040
[000d2a8e]                           dc.w $0000
[000d2a90] 000d1cc4                  dc.l A_INNERFRAME03
[000d2a94]                           dc.w $0001
[000d2a96]                           dc.w $0004
[000d2a98]                           dc.w $002a
[000d2a9a]                           dc.w $0003
_05__ED_FIND:
[000d2a9c]                           dc.w $0007
[000d2a9e]                           dc.w $ffff
[000d2aa0]                           dc.w $ffff
[000d2aa2]                           dc.w $0018
[000d2aa4]                           dc.w $0001
[000d2aa6]                           dc.w $0001
[000d2aa8] 000d1bc4                  dc.l A_CHECKBOX05
[000d2aac]                           dc.w $0001
[000d2aae]                           dc.w $0001
[000d2ab0]                           dc.w $000c
[000d2ab2]                           dc.w $0001
_05a_ED_FIND:
[000d2ab4]                           dc.w $0000
[000d2ab6]                           dc.w $0000
[000d2ab8]                           dc.w $0000
[000d2aba]                           dc.w $0000
[000d2abc]                           dc.w $8000
[000d2abe]                           dc.w $8852
[000d2ac0]                           dc.w $0000
[000d2ac2]                           dc.w $0000
[000d2ac4]                           dc.w $0000
[000d2ac6]                           dc.w $0000
[000d2ac8]                           dc.w $0000
[000d2aca]                           dc.w $0000
_07__ED_FIND:
[000d2acc]                           dc.w $0009
[000d2ace]                           dc.w $ffff
[000d2ad0]                           dc.w $ffff
[000d2ad2]                           dc.w $0018
[000d2ad4]                           dc.w $0001
[000d2ad6]                           dc.w $0001
[000d2ad8] 000d1b84                  dc.l A_CHECKBOX03
[000d2adc]                           dc.w $0010
[000d2ade]                           dc.w $0001
[000d2ae0]                           dc.w $000a
[000d2ae2]                           dc.w $0001
_07a_ED_FIND:
[000d2ae4]                           dc.w $0000
[000d2ae6]                           dc.w $0000
[000d2ae8]                           dc.w $0000
[000d2aea]                           dc.w $0000
[000d2aec]                           dc.w $8000
[000d2aee]                           dc.w $8842
[000d2af0]                           dc.w $0000
[000d2af2]                           dc.w $0000
[000d2af4]                           dc.w $0000
[000d2af6]                           dc.w $0000
[000d2af8]                           dc.w $0000
[000d2afa]                           dc.w $0000
_09__ED_FIND:
[000d2afc]                           dc.w $0004
[000d2afe]                           dc.w $ffff
[000d2b00]                           dc.w $ffff
[000d2b02]                           dc.w $0018
[000d2b04]                           dc.w $0001
[000d2b06]                           dc.w $0001
[000d2b08] 000d1be4                  dc.l A_CHECKBOX06
[000d2b0c]                           dc.w $001d
[000d2b0e]                           dc.w $0001
[000d2b10]                           dc.w $000c
[000d2b12]                           dc.w $0001
_09a_ED_FIND:
[000d2b14]                           dc.w $0000
[000d2b16]                           dc.w $0000
[000d2b18]                           dc.w $0000
[000d2b1a]                           dc.w $0000
[000d2b1c]                           dc.w $8000
[000d2b1e]                           dc.w $8857
[000d2b20]                           dc.w $0000
[000d2b22]                           dc.w $0000
[000d2b24]                           dc.w $0000
[000d2b26]                           dc.w $0000
[000d2b28]                           dc.w $0000
[000d2b2a]                           dc.w $0000
_11__ED_FIND:
[000d2b2c]                           dc.w $000d
[000d2b2e]                           dc.w $ffff
[000d2b30]                           dc.w $ffff
[000d2b32]                           dc.w $0018
[000d2b34]                           dc.w $4007
[000d2b36]                           dc.w $0010
[000d2b38] 000d1924                  dc.l A_3DBUTTON05
[000d2b3c]                           dc.w $0009
[000d2b3e]                           dc.w $0007
[000d2b40]                           dc.w $000c
[000d2b42]                           dc.w $0002
_11a_ED_FIND:
[000d2b44]                           dc.w $0000
[000d2b46]                           dc.w $0000
[000d2b48]                           dc.w $0000
[000d2b4a]                           dc.w $0000
[000d2b4c]                           dc.w $8000
[000d2b4e]                           dc.w $884f
[000d2b50]                           dc.w $0000
[000d2b52]                           dc.w $0000
[000d2b54]                           dc.w $0000
[000d2b56]                           dc.w $0000
[000d2b58]                           dc.w $0000
[000d2b5a]                           dc.w $0000
_13__ED_FIND:
[000d2b5c]                           dc.w $0001
[000d2b5e]                           dc.w $ffff
[000d2b60]                           dc.w $ffff
[000d2b62]                           dc.w $0018
[000d2b64]                           dc.w $4005
[000d2b66]                           dc.w $0010
[000d2b68] 000d1964                  dc.l A_3DBUTTON07
[000d2b6c]                           dc.w $0017
[000d2b6e]                           dc.w $0007
[000d2b70]                           dc.w $000c
[000d2b72]                           dc.w $0002
_13a_ED_FIND:
[000d2b74]                           dc.w $0000
[000d2b76]                           dc.w $0000
[000d2b78]                           dc.w $0000
[000d2b7a]                           dc.w $0000
[000d2b7c]                           dc.w $8020
[000d2b7e]                           dc.w $8841
[000d2b80]                           dc.w $0000
[000d2b82]                           dc.w $0000
[000d2b84]                           dc.w $0000
[000d2b86]                           dc.w $0000
[000d2b88]                           dc.w $0000
[000d2b8a]                           dc.w $0000
_ED_GOTOLINE:
[000d2b8c]                           dc.w $ffff
[000d2b8e]                           dc.w $0001
[000d2b90]                           dc.w $0001
[000d2b92]                           dc.w $0019
[000d2b94]                           dc.w $0000
[000d2b96]                           dc.w $0000
[000d2b98]                           dc.w $00ff
[000d2b9a]                           dc.w $1141
[000d2b9c]                           dc.w $0000
[000d2b9e]                           dc.w $0000
[000d2ba0]                           dc.w $0018
[000d2ba2]                           dc.w $0006
_01__ED_GOTOLINE:
[000d2ba4]                           dc.w $0000
[000d2ba6]                           dc.w $0002
[000d2ba8]                           dc.w $0007
[000d2baa]                           dc.w $0018
[000d2bac]                           dc.w $0040
[000d2bae]                           dc.w $0010
[000d2bb0] 000d19a4                  dc.l A_3DBUTTON12
[000d2bb4]                           dc.w $0000
[000d2bb6]                           dc.w $0000
[000d2bb8]                           dc.w $0018
[000d2bba]                           dc.w $0006
_02__ED_GOTOLINE:
[000d2bbc]                           dc.w $0005
[000d2bbe]                           dc.w $0003
[000d2bc0]                           dc.w $0004
[000d2bc2]                           dc.w $0018
[000d2bc4]                           dc.w $0040
[000d2bc6]                           dc.w $0000
[000d2bc8] 000d1ce4                  dc.l A_INNERFRAME04
[000d2bcc]                           dc.w $0001
[000d2bce]                           dc.w $0000
[000d2bd0]                           dc.w $0016
[000d2bd2]                           dc.w $0003
_03__ED_GOTOLINE:
[000d2bd4]                           dc.w $0004
[000d2bd6]                           dc.w $ffff
[000d2bd8]                           dc.w $ffff
[000d2bda]                           dc.w $001c
[000d2bdc]                           dc.w $0000
[000d2bde]                           dc.w $0000
[000d2be0] 000d084b                  dc.l TEXT_32
[000d2be4]                           dc.w $0005
[000d2be6]                           dc.w $0001
[000d2be8]                           dc.w $0006
[000d2bea]                           dc.w $0001
_04__ED_GOTOLINE:
[000d2bec]                           dc.w $0002
[000d2bee]                           dc.w $ffff
[000d2bf0]                           dc.w $ffff
[000d2bf2]                           dc.w $0018
[000d2bf4]                           dc.w $0008
[000d2bf6]                           dc.w $0010
[000d2bf8] 000d1aa4                  dc.l A_BOXED03
[000d2bfc]                           dc.w $000c
[000d2bfe]                           dc.w $0001
[000d2c00]                           dc.w $0005
[000d2c02]                           dc.w $0001
_05__ED_GOTOLINE:
[000d2c04]                           dc.w $0007
[000d2c06]                           dc.w $ffff
[000d2c08]                           dc.w $ffff
[000d2c0a]                           dc.w $0018
[000d2c0c]                           dc.w $4007
[000d2c0e]                           dc.w $0010
[000d2c10] 000d1924                  dc.l A_3DBUTTON05
[000d2c14]                           dc.w $0001
[000d2c16]                           dc.w $0003
[000d2c18]                           dc.w $000a
[000d2c1a]                           dc.w $0002
_05a_ED_GOTOLINE:
[000d2c1c]                           dc.w $0000
[000d2c1e]                           dc.w $0000
[000d2c20]                           dc.w $0000
[000d2c22]                           dc.w $0000
[000d2c24]                           dc.w $8000
[000d2c26]                           dc.w $884f
[000d2c28]                           dc.w $0000
[000d2c2a]                           dc.w $0000
[000d2c2c]                           dc.w $0000
[000d2c2e]                           dc.w $0000
[000d2c30]                           dc.w $0000
[000d2c32]                           dc.w $0000
_07__ED_GOTOLINE:
[000d2c34]                           dc.w $0001
[000d2c36]                           dc.w $ffff
[000d2c38]                           dc.w $ffff
[000d2c3a]                           dc.w $0018
[000d2c3c]                           dc.w $4005
[000d2c3e]                           dc.w $0010
[000d2c40] 000d1964                  dc.l A_3DBUTTON07
[000d2c44]                           dc.w $000d
[000d2c46]                           dc.w $0003
[000d2c48]                           dc.w $000a
[000d2c4a]                           dc.w $0002
_07a_ED_GOTOLINE:
[000d2c4c]                           dc.w $0000
[000d2c4e]                           dc.w $0000
[000d2c50]                           dc.w $0000
[000d2c52]                           dc.w $0000
[000d2c54]                           dc.w $8020
[000d2c56]                           dc.w $8841
[000d2c58]                           dc.w $0000
[000d2c5a]                           dc.w $0000
[000d2c5c]                           dc.w $0000
[000d2c5e]                           dc.w $0000
[000d2c60]                           dc.w $0000
[000d2c62]                           dc.w $0000
_ED_INFO:
[000d2c64]                           dc.w $ffff
[000d2c66]                           dc.w $0001
[000d2c68]                           dc.w $0001
[000d2c6a]                           dc.w $0019
[000d2c6c]                           dc.w $0000
[000d2c6e]                           dc.w $0000
[000d2c70]                           dc.w $00ff
[000d2c72]                           dc.w $1141
[000d2c74]                           dc.w $0000
[000d2c76]                           dc.w $0000
[000d2c78]                           dc.w $0012
[000d2c7a]                           dc.w $0004
_01__ED_INFO:
[000d2c7c]                           dc.w $0000
[000d2c7e]                           dc.w $0002
[000d2c80]                           dc.w $0002
[000d2c82]                           dc.w $0018
[000d2c84]                           dc.w $0000
[000d2c86]                           dc.w $0010
[000d2c88] 000d18a4                  dc.l A_3DBUTTON01
[000d2c8c]                           dc.w $0000
[000d2c8e]                           dc.w $0000
[000d2c90]                           dc.w $0012
[000d2c92]                           dc.w $0004
_02__ED_INFO:
[000d2c94]                           dc.w $0001
[000d2c96]                           dc.w $0003
[000d2c98]                           dc.w $0006
[000d2c9a]                           dc.w $0018
[000d2c9c]                           dc.w $0040
[000d2c9e]                           dc.w $0000
[000d2ca0] 000d1ce4                  dc.l A_INNERFRAME04
[000d2ca4]                           dc.w $0001
[000d2ca6]                           dc.w $0000
[000d2ca8]                           dc.w $0010
[000d2caa]                           dc.w $0004
_03__ED_INFO:
[000d2cac]                           dc.w $0004
[000d2cae]                           dc.w $ffff
[000d2cb0]                           dc.w $ffff
[000d2cb2]                           dc.w $001c
[000d2cb4]                           dc.w $0000
[000d2cb6]                           dc.w $0000
[000d2cb8] 000d066b                  dc.l TEXT_05
[000d2cbc]                           dc.w $0001
[000d2cbe]                           dc.w $0001
[000d2cc0]                           dc.w $0006
[000d2cc2]                           dc.w $0001
_04__ED_INFO:
[000d2cc4]                           dc.w $0005
[000d2cc6]                           dc.w $ffff
[000d2cc8]                           dc.w $ffff
[000d2cca]                           dc.w $0016
[000d2ccc]                           dc.w $0000
[000d2cce]                           dc.w $0000
[000d2cd0] 000d1888                  dc.l TEDINFO_05
[000d2cd4]                           dc.w $0008
[000d2cd6]                           dc.w $0001
[000d2cd8]                           dc.w $0007
[000d2cda]                           dc.w $0001
_05__ED_INFO:
[000d2cdc]                           dc.w $0006
[000d2cde]                           dc.w $ffff
[000d2ce0]                           dc.w $ffff
[000d2ce2]                           dc.w $001c
[000d2ce4]                           dc.w $0000
[000d2ce6]                           dc.w $0000
[000d2ce8] 000d0679                  dc.l TEXT_07
[000d2cec]                           dc.w $0001
[000d2cee]                           dc.w $0002
[000d2cf0]                           dc.w $0006
[000d2cf2]                           dc.w $0001
_06__ED_INFO:
[000d2cf4]                           dc.w $0002
[000d2cf6]                           dc.w $ffff
[000d2cf8]                           dc.w $ffff
[000d2cfa]                           dc.w $0016
[000d2cfc]                           dc.w $0020
[000d2cfe]                           dc.w $0000
[000d2d00] 000d1888                  dc.l TEDINFO_05
[000d2d04]                           dc.w $0008
[000d2d06]                           dc.w $0002
[000d2d08]                           dc.w $0007
[000d2d0a]                           dc.w $0001
_ED_NEWFKEY:
[000d2d0c]                           dc.w $ffff
[000d2d0e]                           dc.w $0001
[000d2d10]                           dc.w $000c
[000d2d12]                           dc.w $0018
[000d2d14]                           dc.w $0040
[000d2d16]                           dc.w $0000
[000d2d18] 000d19c4                  dc.l A_3DBUTTON20
[000d2d1c]                           dc.w $0000
[000d2d1e]                           dc.w $0000
[000d2d20]                           dc.w $0025
[000d2d22]                           dc.w $0008
_01__ED_NEWFKEY:
[000d2d24]                           dc.w $0002
[000d2d26]                           dc.w $ffff
[000d2d28]                           dc.w $ffff
[000d2d2a]                           dc.w $001c
[000d2d2c]                           dc.w $0040
[000d2d2e]                           dc.w $0000
[000d2d30] 000d097f                  dc.l TEXT_49
[000d2d34]                           dc.w $0001
[000d2d36]                           dc.w $0800
[000d2d38]                           dc.w $0006
[000d2d3a]                           dc.w $0001
_02__ED_NEWFKEY:
[000d2d3c]                           dc.w $0004
[000d2d3e]                           dc.w $ffff
[000d2d40]                           dc.w $ffff
[000d2d42]                           dc.w $0018
[000d2d44]                           dc.w $0001
[000d2d46]                           dc.w $0000
[000d2d48] 000d1b44                  dc.l A_CHECKBOX01
[000d2d4c]                           dc.w $0008
[000d2d4e]                           dc.w $0800
[000d2d50]                           dc.w $0008
[000d2d52]                           dc.w $0001
_02a_ED_NEWFKEY:
[000d2d54]                           dc.w $0000
[000d2d56]                           dc.w $0000
[000d2d58]                           dc.w $0000
[000d2d5a]                           dc.w $0000
[000d2d5c]                           dc.w $8000
[000d2d5e]                           dc.w $8853
[000d2d60]                           dc.w $0000
[000d2d62]                           dc.w $0000
[000d2d64]                           dc.w $0000
[000d2d66]                           dc.w $0000
[000d2d68]                           dc.w $0000
[000d2d6a]                           dc.w $0000
_04__ED_NEWFKEY:
[000d2d6c]                           dc.w $0006
[000d2d6e]                           dc.w $ffff
[000d2d70]                           dc.w $ffff
[000d2d72]                           dc.w $0018
[000d2d74]                           dc.w $0001
[000d2d76]                           dc.w $0000
[000d2d78] 000d1c24                  dc.l A_CHECKBOX08
[000d2d7c]                           dc.w $0011
[000d2d7e]                           dc.w $0800
[000d2d80]                           dc.w $000a
[000d2d82]                           dc.w $0001
_04a_ED_NEWFKEY:
[000d2d84]                           dc.w $0000
[000d2d86]                           dc.w $0000
[000d2d88]                           dc.w $0000
[000d2d8a]                           dc.w $0000
[000d2d8c]                           dc.w $8000
[000d2d8e]                           dc.w $8843
[000d2d90]                           dc.w $0000
[000d2d92]                           dc.w $0000
[000d2d94]                           dc.w $0000
[000d2d96]                           dc.w $0000
[000d2d98]                           dc.w $0000
[000d2d9a]                           dc.w $0000
_06__ED_NEWFKEY:
[000d2d9c]                           dc.w $0008
[000d2d9e]                           dc.w $ffff
[000d2da0]                           dc.w $ffff
[000d2da2]                           dc.w $0018
[000d2da4]                           dc.w $0040
[000d2da6]                           dc.w $0030
[000d2da8] 000d1c44                  dc.l A_CYCLE01
[000d2dac]                           dc.w $001c
[000d2dae]                           dc.w $0800
[000d2db0]                           dc.w $0008
[000d2db2]                           dc.w $0001
_06a_ED_NEWFKEY:
[000d2db4] 00067ca4                  dc.l Aus_cycle
[000d2db8]                           dc.w $0000
[000d2dba]                           dc.w $0000
[000d2dbc]                           dc.w $8000
[000d2dbe]                           dc.w $8845
[000d2dc0]                           dc.w $0000
[000d2dc2]                           dc.w $0000
[000d2dc4]                           dc.w $0000
[000d2dc6]                           dc.w $0000
[000d2dc8]                           dc.w $0000
[000d2dca]                           dc.w $0000
_08__ED_NEWFKEY:
[000d2dcc]                           dc.w $000a
[000d2dce]                           dc.w $0009
[000d2dd0]                           dc.w $0009
[000d2dd2]                           dc.w $0018
[000d2dd4]                           dc.w $0040
[000d2dd6]                           dc.w $0000
[000d2dd8] 000d1d04                  dc.l A_INNERFRAME06
[000d2ddc]                           dc.w $0001
[000d2dde]                           dc.w $0002
[000d2de0]                           dc.w $0023
[000d2de2]                           dc.w $0003
_09__ED_NEWFKEY:
[000d2de4]                           dc.w $0008
[000d2de6]                           dc.w $ffff
[000d2de8]                           dc.w $ffff
[000d2dea]                           dc.w $0018
[000d2dec]                           dc.w $0008
[000d2dee]                           dc.w $0010
[000d2df0] 000d1a64                  dc.l A_BOXED01
[000d2df4]                           dc.w $0001
[000d2df6]                           dc.w $0001
[000d2df8]                           dc.w $0021
[000d2dfa]                           dc.w $0001
_10__ED_NEWFKEY:
[000d2dfc]                           dc.w $000c
[000d2dfe]                           dc.w $ffff
[000d2e00]                           dc.w $ffff
[000d2e02]                           dc.w $0018
[000d2e04]                           dc.w $4007
[000d2e06]                           dc.w $0000
[000d2e08] 000d19e4                  dc.l A_3DBUTTON21
[000d2e0c]                           dc.w $0006
[000d2e0e]                           dc.w $0005
[000d2e10]                           dc.w $000c
[000d2e12]                           dc.w $0002
_10a_ED_NEWFKEY:
[000d2e14]                           dc.w $0000
[000d2e16]                           dc.w $0000
[000d2e18]                           dc.w $0000
[000d2e1a]                           dc.w $0000
[000d2e1c]                           dc.w $8000
[000d2e1e]                           dc.w $884f
[000d2e20]                           dc.w $0000
[000d2e22]                           dc.w $0000
[000d2e24]                           dc.w $0000
[000d2e26]                           dc.w $0000
[000d2e28]                           dc.w $0000
[000d2e2a]                           dc.w $0000
_12__ED_NEWFKEY:
[000d2e2c]                           dc.w $0000
[000d2e2e]                           dc.w $ffff
[000d2e30]                           dc.w $ffff
[000d2e32]                           dc.w $0018
[000d2e34]                           dc.w $4005
[000d2e36]                           dc.w $0000
[000d2e38] 000d18c4                  dc.l A_3DBUTTON02
[000d2e3c]                           dc.w $0014
[000d2e3e]                           dc.w $0005
[000d2e40]                           dc.w $000c
[000d2e42]                           dc.w $0002
_12a_ED_NEWFKEY:
[000d2e44]                           dc.w $0000
[000d2e46]                           dc.w $0000
[000d2e48]                           dc.w $0000
[000d2e4a]                           dc.w $0000
[000d2e4c]                           dc.w $8020
[000d2e4e]                           dc.w $8841
[000d2e50]                           dc.w $0000
[000d2e52]                           dc.w $0000
[000d2e54]                           dc.w $0000
[000d2e56]                           dc.w $0000
[000d2e58]                           dc.w $0000
[000d2e5a]                           dc.w $0000
_ED_OPTION:
[000d2e5c]                           dc.w $ffff
[000d2e5e]                           dc.w $0001
[000d2e60]                           dc.w $0001
[000d2e62]                           dc.w $0019
[000d2e64]                           dc.w $0000
[000d2e66]                           dc.w $0000
[000d2e68]                           dc.w $00ff
[000d2e6a]                           dc.w $1141
[000d2e6c]                           dc.w $0000
[000d2e6e]                           dc.w $0000
[000d2e70]                           dc.w $0025
[000d2e72]                           dc.w $000f
_01__ED_OPTION:
[000d2e74]                           dc.w $0000
[000d2e76]                           dc.w $0002
[000d2e78]                           dc.w $0018
[000d2e7a]                           dc.w $0018
[000d2e7c]                           dc.w $0040
[000d2e7e]                           dc.w $0010
[000d2e80] 000d18a4                  dc.l A_3DBUTTON01
[000d2e84]                           dc.w $0000
[000d2e86]                           dc.w $0000
[000d2e88]                           dc.w $0025
[000d2e8a]                           dc.w $000f
_02__ED_OPTION:
[000d2e8c]                           dc.w $000e
[000d2e8e]                           dc.w $0003
[000d2e90]                           dc.w $000c
[000d2e92]                           dc.w $0018
[000d2e94]                           dc.w $0040
[000d2e96]                           dc.w $0000
[000d2e98] 000d1d24                  dc.l A_INNERFRAME08
[000d2e9c]                           dc.w $0001
[000d2e9e]                           dc.w $0800
[000d2ea0]                           dc.w $0023
[000d2ea2]                           dc.w $0007
_03__ED_OPTION:
[000d2ea4]                           dc.w $0005
[000d2ea6]                           dc.w $0004
[000d2ea8]                           dc.w $0004
[000d2eaa]                           dc.w $001c
[000d2eac]                           dc.w $0040
[000d2eae]                           dc.w $0000
[000d2eb0] 000d08d7                  dc.l TEXT_39
[000d2eb4]                           dc.w $0009
[000d2eb6]                           dc.w $0001
[000d2eb8]                           dc.w $0007
[000d2eba]                           dc.w $0001
_04__ED_OPTION:
[000d2ebc]                           dc.w $0003
[000d2ebe]                           dc.w $ffff
[000d2ec0]                           dc.w $ffff
[000d2ec2]                           dc.w $0018
[000d2ec4]                           dc.w $0040
[000d2ec6]                           dc.w $0000
[000d2ec8] 000d1a24                  dc.l A_ARROWS02
[000d2ecc]                           dc.w $0000
[000d2ece]                           dc.w $0000
[000d2ed0]                           dc.w $0001
[000d2ed2]                           dc.w $0001
_05__ED_OPTION:
[000d2ed4]                           dc.w $0007
[000d2ed6]                           dc.w $ffff
[000d2ed8]                           dc.w $ffff
[000d2eda]                           dc.w $0018
[000d2edc]                           dc.w $0040
[000d2ede]                           dc.w $0030
[000d2ee0] 000d1c64                  dc.l A_CYCLE02
[000d2ee4]                           dc.w $0011
[000d2ee6]                           dc.w $0001
[000d2ee8]                           dc.w $000a
[000d2eea]                           dc.w $0001
_05a_ED_OPTION:
[000d2eec] 00067ca4                  dc.l Aus_cycle
[000d2ef0]                           dc.w $0000
[000d2ef2]                           dc.w $0000
[000d2ef4]                           dc.w $8000
[000d2ef6]                           dc.w $8843
[000d2ef8]                           dc.w $0000
[000d2efa]                           dc.w $0000
[000d2efc]                           dc.w $0000
[000d2efe]                           dc.w $0000
[000d2f00]                           dc.w $0000
[000d2f02]                           dc.w $0000
_07__ED_OPTION:
[000d2f04]                           dc.w $0008
[000d2f06]                           dc.w $ffff
[000d2f08]                           dc.w $ffff
[000d2f0a]                           dc.w $001c
[000d2f0c]                           dc.w $0040
[000d2f0e]                           dc.w $0000
[000d2f10] 000d0615                  dc.l TEXT_03
[000d2f14]                           dc.w $0001
[000d2f16]                           dc.w $0005
[000d2f18]                           dc.w $000f
[000d2f1a]                           dc.w $0001
_08__ED_OPTION:
[000d2f1c]                           dc.w $0009
[000d2f1e]                           dc.w $ffff
[000d2f20]                           dc.w $ffff
[000d2f22]                           dc.w $0018
[000d2f24]                           dc.w $0008
[000d2f26]                           dc.w $0010
[000d2f28] 000d1b04                  dc.l A_BOXED08
[000d2f2c]                           dc.w $0011
[000d2f2e]                           dc.w $0005
[000d2f30]                           dc.w $0002
[000d2f32]                           dc.w $0001
_09__ED_OPTION:
[000d2f34]                           dc.w $000a
[000d2f36]                           dc.w $ffff
[000d2f38]                           dc.w $ffff
[000d2f3a]                           dc.w $001c
[000d2f3c]                           dc.w $0040
[000d2f3e]                           dc.w $0000
[000d2f40] 000d09fa                  dc.l TEXT_61
[000d2f44]                           dc.w $0001
[000d2f46]                           dc.w $0802
[000d2f48]                           dc.w $000f
[000d2f4a]                           dc.w $0001
_10__ED_OPTION:
[000d2f4c]                           dc.w $000c
[000d2f4e]                           dc.w $ffff
[000d2f50]                           dc.w $ffff
[000d2f52]                           dc.w $0018
[000d2f54]                           dc.w $0011
[000d2f56]                           dc.w $0001
[000d2f58] 000d1c04                  dc.l A_CHECKBOX07
[000d2f5c]                           dc.w $0011
[000d2f5e]                           dc.w $0802
[000d2f60]                           dc.w $0011
[000d2f62]                           dc.w $0001
_10a_ED_OPTION:
[000d2f64]                           dc.w $0000
[000d2f66]                           dc.w $0000
[000d2f68]                           dc.w $0000
[000d2f6a]                           dc.w $0000
[000d2f6c]                           dc.w $8000
[000d2f6e]                           dc.w $884b
[000d2f70]                           dc.w $0000
[000d2f72]                           dc.w $0000
[000d2f74]                           dc.w $0000
[000d2f76]                           dc.w $0000
[000d2f78]                           dc.w $0000
[000d2f7a]                           dc.w $0000
_12__ED_OPTION:
[000d2f7c]                           dc.w $0002
[000d2f7e]                           dc.w $ffff
[000d2f80]                           dc.w $ffff
[000d2f82]                           dc.w $0018
[000d2f84]                           dc.w $0011
[000d2f86]                           dc.w $0000
[000d2f88] 000d1ba4                  dc.l A_CHECKBOX04
[000d2f8c]                           dc.w $0011
[000d2f8e]                           dc.w $0803
[000d2f90]                           dc.w $000f
[000d2f92]                           dc.w $0001
_12a_ED_OPTION:
[000d2f94]                           dc.w $0000
[000d2f96]                           dc.w $0000
[000d2f98]                           dc.w $0000
[000d2f9a]                           dc.w $0000
[000d2f9c]                           dc.w $8000
[000d2f9e]                           dc.w $8853
[000d2fa0]                           dc.w $0000
[000d2fa2]                           dc.w $0000
[000d2fa4]                           dc.w $0000
[000d2fa6]                           dc.w $0000
[000d2fa8]                           dc.w $0000
[000d2faa]                           dc.w $0000
_14__ED_OPTION:
[000d2fac]                           dc.w $000f
[000d2fae]                           dc.w $ffff
[000d2fb0]                           dc.w $ffff
[000d2fb2]                           dc.w $001c
[000d2fb4]                           dc.w $0040
[000d2fb6]                           dc.w $0000
[000d2fb8] 000d0a0a                  dc.l TEXT_62
[000d2fbc]                           dc.w $0002
[000d2fbe]                           dc.w $0008
[000d2fc0]                           dc.w $000c
[000d2fc2]                           dc.w $0001
_15__ED_OPTION:
[000d2fc4]                           dc.w $0013
[000d2fc6]                           dc.w $0010
[000d2fc8]                           dc.w $0012
[000d2fca]                           dc.w $0018
[000d2fcc]                           dc.w $0040
[000d2fce]                           dc.w $0000
[000d2fd0] 000d1a04                  dc.l A_3DBUTTON22
[000d2fd4]                           dc.w $000f
[000d2fd6]                           dc.w $0008
[000d2fd8]                           dc.w $0014
[000d2fda]                           dc.w $0003
_16__ED_OPTION:
[000d2fdc]                           dc.w $0011
[000d2fde]                           dc.w $ffff
[000d2fe0]                           dc.w $ffff
[000d2fe2]                           dc.w $0018
[000d2fe4]                           dc.w $0008
[000d2fe6]                           dc.w $0000
[000d2fe8] 000d1ac4                  dc.l A_BOXED06
[000d2fec]                           dc.w $0000
[000d2fee]                           dc.w $0000
[000d2ff0]                           dc.w $0014
[000d2ff2]                           dc.w $0001
_17__ED_OPTION:
[000d2ff4]                           dc.w $0012
[000d2ff6]                           dc.w $ffff
[000d2ff8]                           dc.w $ffff
[000d2ffa]                           dc.w $0018
[000d2ffc]                           dc.w $0008
[000d2ffe]                           dc.w $0000
[000d3000] 000d1b24                  dc.l A_BOXED09
[000d3004]                           dc.w $0000
[000d3006]                           dc.w $0001
[000d3008]                           dc.w $0008
[000d300a]                           dc.w $0001
_18__ED_OPTION:
[000d300c]                           dc.w $000f
[000d300e]                           dc.w $ffff
[000d3010]                           dc.w $ffff
[000d3012]                           dc.w $0018
[000d3014]                           dc.w $0008
[000d3016]                           dc.w $0000
[000d3018] 000d1ae4                  dc.l A_BOXED07
[000d301c]                           dc.w $0000
[000d301e]                           dc.w $0002
[000d3020]                           dc.w $000b
[000d3022]                           dc.w $0001
_19__ED_OPTION:
[000d3024]                           dc.w $0014
[000d3026]                           dc.w $ffff
[000d3028]                           dc.w $ffff
[000d302a]                           dc.w $001c
[000d302c]                           dc.w $0040
[000d302e]                           dc.w $0000
[000d3030] 000d09d7                  dc.l TEXT_58
[000d3034]                           dc.w $0001
[000d3036]                           dc.w $0009
[000d3038]                           dc.w $000d
[000d303a]                           dc.w $0001
_20__ED_OPTION:
[000d303c]                           dc.w $0016
[000d303e]                           dc.w $ffff
[000d3040]                           dc.w $ffff
[000d3042]                           dc.w $0018
[000d3044]                           dc.w $4007
[000d3046]                           dc.w $0010
[000d3048] 000d1924                  dc.l A_3DBUTTON05
[000d304c]                           dc.w $0006
[000d304e]                           dc.w $000c
[000d3050]                           dc.w $000c
[000d3052]                           dc.w $0002
_20a_ED_OPTION:
[000d3054]                           dc.w $0000
[000d3056]                           dc.w $0000
[000d3058]                           dc.w $0000
[000d305a]                           dc.w $0000
[000d305c]                           dc.w $8000
[000d305e]                           dc.w $884f
[000d3060]                           dc.w $0000
[000d3062]                           dc.w $0000
[000d3064]                           dc.w $0000
[000d3066]                           dc.w $0000
[000d3068]                           dc.w $0000
[000d306a]                           dc.w $0000
_22__ED_OPTION:
[000d306c]                           dc.w $0018
[000d306e]                           dc.w $ffff
[000d3070]                           dc.w $ffff
[000d3072]                           dc.w $0018
[000d3074]                           dc.w $4005
[000d3076]                           dc.w $0010
[000d3078] 000d1964                  dc.l A_3DBUTTON07
[000d307c]                           dc.w $0014
[000d307e]                           dc.w $000c
[000d3080]                           dc.w $000c
[000d3082]                           dc.w $0002
_22a_ED_OPTION:
[000d3084]                           dc.w $0000
[000d3086]                           dc.w $0000
[000d3088]                           dc.w $0000
[000d308a]                           dc.w $0000
[000d308c]                           dc.w $8000
[000d308e]                           dc.w $8841
[000d3090]                           dc.w $0000
[000d3092]                           dc.w $0000
[000d3094]                           dc.w $0000
[000d3096]                           dc.w $0000
[000d3098]                           dc.w $0000
[000d309a]                           dc.w $0000
_24__ED_OPTION:
[000d309c]                           dc.w $0001
[000d309e]                           dc.w $ffff
[000d30a0]                           dc.w $ffff
[000d30a2]                           dc.w $001c
[000d30a4]                           dc.w $0060
[000d30a6]                           dc.w $0000
[000d30a8] 000d09f0                  dc.l TEXT_60
[000d30ac]                           dc.w $0005
[000d30ae]                           dc.w $000a
[000d30b0]                           dc.w $0009
[000d30b2]                           dc.w $0001
_ED_REPLACE:
[000d30b4]                           dc.w $ffff
[000d30b6]                           dc.w $0001
[000d30b8]                           dc.w $0001
[000d30ba]                           dc.w $0019
[000d30bc]                           dc.w $0000
[000d30be]                           dc.w $0000
[000d30c0]                           dc.w $00ff
[000d30c2]                           dc.w $1141
[000d30c4]                           dc.w $0000
[000d30c6]                           dc.w $0000
[000d30c8]                           dc.w $0036
[000d30ca]                           dc.w $000a
_01__ED_REPLACE:
[000d30cc]                           dc.w $0000
[000d30ce]                           dc.w $0002
[000d30d0]                           dc.w $0013
[000d30d2]                           dc.w $0018
[000d30d4]                           dc.w $0040
[000d30d6]                           dc.w $0010
[000d30d8] 000d18a4                  dc.l A_3DBUTTON01
[000d30dc]                           dc.w $0000
[000d30de]                           dc.w $0000
[000d30e0]                           dc.w $0036
[000d30e2]                           dc.w $000a
_02__ED_REPLACE:
[000d30e4]                           dc.w $0008
[000d30e6]                           dc.w $0003
[000d30e8]                           dc.w $0007
[000d30ea]                           dc.w $0018
[000d30ec]                           dc.w $0040
[000d30ee]                           dc.w $0000
[000d30f0] 000d1ce4                  dc.l A_INNERFRAME04
[000d30f4]                           dc.w $0001
[000d30f6]                           dc.w $0000
[000d30f8]                           dc.w $0034
[000d30fa]                           dc.w $0004
_03__ED_REPLACE:
[000d30fc]                           dc.w $0004
[000d30fe]                           dc.w $ffff
[000d3100]                           dc.w $ffff
[000d3102]                           dc.w $001c
[000d3104]                           dc.w $0040
[000d3106]                           dc.w $0000
[000d3108] 000d0673                  dc.l TEXT_06
[000d310c]                           dc.w $0004
[000d310e]                           dc.w $0001
[000d3110]                           dc.w $0005
[000d3112]                           dc.w $0001
_04__ED_REPLACE:
[000d3114]                           dc.w $0007
[000d3116]                           dc.w $0005
[000d3118]                           dc.w $0006
[000d311a]                           dc.w $0018
[000d311c]                           dc.w $0040
[000d311e]                           dc.w $0000
[000d3120] 000d1904                  dc.l A_3DBUTTON04
[000d3124]                           dc.w $000a
[000d3126]                           dc.w $0001
[000d3128]                           dc.w $0028
[000d312a]                           dc.w $0002
_05__ED_REPLACE:
[000d312c]                           dc.w $0006
[000d312e]                           dc.w $ffff
[000d3130]                           dc.w $ffff
[000d3132]                           dc.w $0018
[000d3134]                           dc.w $0008
[000d3136]                           dc.w $0000
[000d3138] 000d1a84                  dc.l A_BOXED02
[000d313c]                           dc.w $0000
[000d313e]                           dc.w $0000
[000d3140]                           dc.w $0028
[000d3142]                           dc.w $0001
_06__ED_REPLACE:
[000d3144]                           dc.w $0004
[000d3146]                           dc.w $ffff
[000d3148]                           dc.w $ffff
[000d314a]                           dc.w $0018
[000d314c]                           dc.w $0008
[000d314e]                           dc.w $0000
[000d3150] 000d1a84                  dc.l A_BOXED02
[000d3154]                           dc.w $0000
[000d3156]                           dc.w $0001
[000d3158]                           dc.w $0028
[000d315a]                           dc.w $0001
_07__ED_REPLACE:
[000d315c]                           dc.w $0002
[000d315e]                           dc.w $ffff
[000d3160]                           dc.w $ffff
[000d3162]                           dc.w $001c
[000d3164]                           dc.w $0040
[000d3166]                           dc.w $0000
[000d3168] 000d069d                  dc.l TEXT_10
[000d316c]                           dc.w $0001
[000d316e]                           dc.w $0002
[000d3170]                           dc.w $0008
[000d3172]                           dc.w $0001
_08__ED_REPLACE:
[000d3174]                           dc.w $0011
[000d3176]                           dc.w $0009
[000d3178]                           dc.w $000f
[000d317a]                           dc.w $0018
[000d317c]                           dc.w $0040
[000d317e]                           dc.w $0000
[000d3180] 000d1cc4                  dc.l A_INNERFRAME03
[000d3184]                           dc.w $0001
[000d3186]                           dc.w $0004
[000d3188]                           dc.w $0034
[000d318a]                           dc.w $0003
_09__ED_REPLACE:
[000d318c]                           dc.w $000b
[000d318e]                           dc.w $ffff
[000d3190]                           dc.w $ffff
[000d3192]                           dc.w $0018
[000d3194]                           dc.w $0001
[000d3196]                           dc.w $0001
[000d3198] 000d1bc4                  dc.l A_CHECKBOX05
[000d319c]                           dc.w $0001
[000d319e]                           dc.w $0001
[000d31a0]                           dc.w $000c
[000d31a2]                           dc.w $0001
_09a_ED_REPLACE:
[000d31a4]                           dc.w $0000
[000d31a6]                           dc.w $0000
[000d31a8]                           dc.w $0000
[000d31aa]                           dc.w $0000
[000d31ac]                           dc.w $8000
[000d31ae]                           dc.w $8852
[000d31b0]                           dc.w $0000
[000d31b2]                           dc.w $0000
[000d31b4]                           dc.w $0000
[000d31b6]                           dc.w $0000
[000d31b8]                           dc.w $0000
[000d31ba]                           dc.w $0000
_11__ED_REPLACE:
[000d31bc]                           dc.w $000d
[000d31be]                           dc.w $ffff
[000d31c0]                           dc.w $ffff
[000d31c2]                           dc.w $0018
[000d31c4]                           dc.w $0001
[000d31c6]                           dc.w $0001
[000d31c8] 000d1b64                  dc.l A_CHECKBOX02
[000d31cc]                           dc.w $001d
[000d31ce]                           dc.w $0001
[000d31d0]                           dc.w $0008
[000d31d2]                           dc.w $0001
_11a_ED_REPLACE:
[000d31d4]                           dc.w $0000
[000d31d6]                           dc.w $0000
[000d31d8]                           dc.w $0000
[000d31da]                           dc.w $0000
[000d31dc]                           dc.w $8000
[000d31de]                           dc.w $884c
[000d31e0]                           dc.w $0000
[000d31e2]                           dc.w $0000
[000d31e4]                           dc.w $0000
[000d31e6]                           dc.w $0000
[000d31e8]                           dc.w $0000
[000d31ea]                           dc.w $0000
_13__ED_REPLACE:
[000d31ec]                           dc.w $000f
[000d31ee]                           dc.w $ffff
[000d31f0]                           dc.w $ffff
[000d31f2]                           dc.w $0018
[000d31f4]                           dc.w $0001
[000d31f6]                           dc.w $0001
[000d31f8] 000d1be4                  dc.l A_CHECKBOX06
[000d31fc]                           dc.w $0027
[000d31fe]                           dc.w $0001
[000d3200]                           dc.w $000c
[000d3202]                           dc.w $0001
_13a_ED_REPLACE:
[000d3204]                           dc.w $0000
[000d3206]                           dc.w $0000
[000d3208]                           dc.w $0000
[000d320a]                           dc.w $0000
[000d320c]                           dc.w $8000
[000d320e]                           dc.w $8857
[000d3210]                           dc.w $0000
[000d3212]                           dc.w $0000
[000d3214]                           dc.w $0000
[000d3216]                           dc.w $0000
[000d3218]                           dc.w $0000
[000d321a]                           dc.w $0000
_15__ED_REPLACE:
[000d321c]                           dc.w $0008
[000d321e]                           dc.w $ffff
[000d3220]                           dc.w $ffff
[000d3222]                           dc.w $0018
[000d3224]                           dc.w $0001
[000d3226]                           dc.w $0001
[000d3228] 000d1b84                  dc.l A_CHECKBOX03
[000d322c]                           dc.w $0010
[000d322e]                           dc.w $0001
[000d3230]                           dc.w $000a
[000d3232]                           dc.w $0001
_15a_ED_REPLACE:
[000d3234]                           dc.w $0000
[000d3236]                           dc.w $0000
[000d3238]                           dc.w $0000
[000d323a]                           dc.w $0000
[000d323c]                           dc.w $8000
[000d323e]                           dc.w $8842
[000d3240]                           dc.w $0000
[000d3242]                           dc.w $0000
[000d3244]                           dc.w $0000
[000d3246]                           dc.w $0000
[000d3248]                           dc.w $0000
[000d324a]                           dc.w $0000
_17__ED_REPLACE:
[000d324c]                           dc.w $0013
[000d324e]                           dc.w $ffff
[000d3250]                           dc.w $ffff
[000d3252]                           dc.w $0018
[000d3254]                           dc.w $4007
[000d3256]                           dc.w $0010
[000d3258] 000d1924                  dc.l A_3DBUTTON05
[000d325c]                           dc.w $000e
[000d325e]                           dc.w $0007
[000d3260]                           dc.w $000c
[000d3262]                           dc.w $0002
_17a_ED_REPLACE:
[000d3264]                           dc.w $0000
[000d3266]                           dc.w $0000
[000d3268]                           dc.w $0000
[000d326a]                           dc.w $0000
[000d326c]                           dc.w $8000
[000d326e]                           dc.w $884f
[000d3270]                           dc.w $0000
[000d3272]                           dc.w $0000
[000d3274]                           dc.w $0000
[000d3276]                           dc.w $0000
[000d3278]                           dc.w $0000
[000d327a]                           dc.w $0000
_19__ED_REPLACE:
[000d327c]                           dc.w $0001
[000d327e]                           dc.w $ffff
[000d3280]                           dc.w $ffff
[000d3282]                           dc.w $0018
[000d3284]                           dc.w $4005
[000d3286]                           dc.w $0010
[000d3288] 000d1964                  dc.l A_3DBUTTON07
[000d328c]                           dc.w $001c
[000d328e]                           dc.w $0007
[000d3290]                           dc.w $000c
[000d3292]                           dc.w $0002
_19a_ED_REPLACE:
[000d3294]                           dc.w $0000
[000d3296]                           dc.w $0000
[000d3298]                           dc.w $0000
[000d329a]                           dc.w $0000
[000d329c]                           dc.w $8020
[000d329e]                           dc.w $8841
[000d32a0]                           dc.w $0000
[000d32a2]                           dc.w $0000
[000d32a4]                           dc.w $0000
[000d32a6]                           dc.w $0000
[000d32a8]                           dc.w $0000
[000d32aa]                           dc.w $0000
_ED_TOOL:
[000d32ac]                           dc.w $ffff
[000d32ae]                           dc.w $0001
[000d32b0]                           dc.w $000d
[000d32b2]                           dc.w $0018
[000d32b4]                           dc.w $0040
[000d32b6]                           dc.w $0000
[000d32b8] 000d1944                  dc.l A_3DBUTTON06
[000d32bc]                           dc.w $0000
[000d32be]                           dc.w $0000
[000d32c0]                           dc.w $003c
[000d32c2]                           dc.w $1600
_01__ED_TOOL:
[000d32c4]                           dc.w $0003
[000d32c6]                           dc.w $ffff
[000d32c8]                           dc.w $ffff
[000d32ca]                           dc.w $001f
[000d32cc]                           dc.w $0005
[000d32ce]                           dc.w $0000
[000d32d0] 000d1f0e                  dc.l IC_OPEN
[000d32d4]                           dc.w $0300
[000d32d6]                           dc.w $0300
[000d32d8]                           dc.w $1000
[000d32da]                           dc.w $1000
_01a_ED_TOOL:
[000d32dc] 0003f40a                  dc.l Aed_open
[000d32e0]                           dc.w $0000
[000d32e2]                           dc.w $0000
[000d32e4]                           dc.w $8000
[000d32e6]                           dc.w $0000
[000d32e8]                           dc.w $0000
[000d32ea]                           dc.w $0000
[000d32ec]                           dc.w $0000
[000d32ee]                           dc.w $0000
[000d32f0]                           dc.w $0000
[000d32f2]                           dc.w $0000
_03__ED_TOOL:
[000d32f4]                           dc.w $0005
[000d32f6]                           dc.w $ffff
[000d32f8]                           dc.w $ffff
[000d32fa]                           dc.w $001f
[000d32fc]                           dc.w $0005
[000d32fe]                           dc.w $0000
[000d3300] 000d2006                  dc.l IC_SAVE
[000d3304]                           dc.w $0302
[000d3306]                           dc.w $0300
[000d3308]                           dc.w $1000
[000d330a]                           dc.w $1000
_03a_ED_TOOL:
[000d330c] 0003fb40                  dc.l Aed_save
[000d3310]                           dc.w $0000
[000d3312]                           dc.w $0000
[000d3314]                           dc.w $8000
[000d3316]                           dc.w $0000
[000d3318]                           dc.w $0000
[000d331a]                           dc.w $0000
[000d331c]                           dc.w $0000
[000d331e]                           dc.w $0000
[000d3320]                           dc.w $0000
[000d3322]                           dc.w $0000
_05__ED_TOOL:
[000d3324]                           dc.w $0007
[000d3326]                           dc.w $ffff
[000d3328]                           dc.w $ffff
[000d332a]                           dc.w $001f
[000d332c]                           dc.w $0005
[000d332e]                           dc.w $0000
[000d3330] 000d2082                  dc.l IC_UNDO
[000d3334]                           dc.w $0007
[000d3336]                           dc.w $0300
[000d3338]                           dc.w $1000
[000d333a]                           dc.w $1000
_05a_ED_TOOL:
[000d333c] 0003fe06                  dc.l Aed_undo
[000d3340]                           dc.w $0000
[000d3342]                           dc.w $0000
[000d3344]                           dc.w $8000
[000d3346]                           dc.w $0000
[000d3348]                           dc.w $0000
[000d334a]                           dc.w $0000
[000d334c]                           dc.w $0000
[000d334e]                           dc.w $0000
[000d3350]                           dc.w $0000
[000d3352]                           dc.w $0000
_07__ED_TOOL:
[000d3354]                           dc.w $0009
[000d3356]                           dc.w $ffff
[000d3358]                           dc.w $ffff
[000d335a]                           dc.w $001f
[000d335c]                           dc.w $0005
[000d335e]                           dc.w $0000
[000d3360] 000d1e16                  dc.l IC_CUT
[000d3364]                           dc.w $0009
[000d3366]                           dc.w $0300
[000d3368]                           dc.w $1000
[000d336a]                           dc.w $1000
_07a_ED_TOOL:
[000d336c] 0003ec3e                  dc.l Aed_cut
[000d3370]                           dc.w $0000
[000d3372]                           dc.w $0000
[000d3374]                           dc.w $8000
[000d3376]                           dc.w $0000
[000d3378]                           dc.w $0000
[000d337a]                           dc.w $0000
[000d337c]                           dc.w $0000
[000d337e]                           dc.w $0000
[000d3380]                           dc.w $0000
[000d3382]                           dc.w $0000
_09__ED_TOOL:
[000d3384]                           dc.w $000b
[000d3386]                           dc.w $ffff
[000d3388]                           dc.w $ffff
[000d338a]                           dc.w $001f
[000d338c]                           dc.w $0005
[000d338e]                           dc.w $0000
[000d3390] 000d1d9a                  dc.l IC_COPY
[000d3394]                           dc.w $000b
[000d3396]                           dc.w $0300
[000d3398]                           dc.w $1000
[000d339a]                           dc.w $1000
_09a_ED_TOOL:
[000d339c] 0003ec28                  dc.l Aed_copy
[000d33a0]                           dc.w $0000
[000d33a2]                           dc.w $0000
[000d33a4]                           dc.w $8000
[000d33a6]                           dc.w $0000
[000d33a8]                           dc.w $0000
[000d33aa]                           dc.w $0000
[000d33ac]                           dc.w $0000
[000d33ae]                           dc.w $0000
[000d33b0]                           dc.w $0000
[000d33b2]                           dc.w $0000
_11__ED_TOOL:
[000d33b4]                           dc.w $000d
[000d33b6]                           dc.w $ffff
[000d33b8]                           dc.w $ffff
[000d33ba]                           dc.w $001f
[000d33bc]                           dc.w $0005
[000d33be]                           dc.w $0000
[000d33c0] 000d1f8a                  dc.l IC_PASTE
[000d33c4]                           dc.w $000d
[000d33c6]                           dc.w $0300
[000d33c8]                           dc.w $1000
[000d33ca]                           dc.w $1000
_11a_ED_TOOL:
[000d33cc] 0003f57a                  dc.l Aed_paste
[000d33d0]                           dc.w $0000
[000d33d2]                           dc.w $0000
[000d33d4]                           dc.w $8000
[000d33d6]                           dc.w $0000
[000d33d8]                           dc.w $0000
[000d33da]                           dc.w $0000
[000d33dc]                           dc.w $0000
[000d33de]                           dc.w $0000
[000d33e0]                           dc.w $0000
[000d33e2]                           dc.w $0000
_13__ED_TOOL:
[000d33e4]                           dc.w $0000
[000d33e6]                           dc.w $ffff
[000d33e8]                           dc.w $ffff
[000d33ea]                           dc.w $0018
[000d33ec]                           dc.w $0060
[000d33ee]                           dc.w $0000
[000d33f0] 000d1984                  dc.l A_3DBUTTON08
[000d33f4]                           dc.w $0012
[000d33f6]                           dc.w $0300
[000d33f8]                           dc.w $001e
[000d33fa]                           dc.w $1000
_ED_WRAP:
[000d33fc]                           dc.w $ffff
[000d33fe]                           dc.w $0001
[000d3400]                           dc.w $0001
[000d3402]                           dc.w $0019
[000d3404]                           dc.w $0000
[000d3406]                           dc.w $0000
[000d3408]                           dc.w $00ff
[000d340a]                           dc.w $1141
[000d340c]                           dc.w $0000
[000d340e]                           dc.w $0000
[000d3410]                           dc.w $0018
[000d3412]                           dc.w $0006
_01__ED_WRAP:
[000d3414]                           dc.w $0000
[000d3416]                           dc.w $0002
[000d3418]                           dc.w $0007
[000d341a]                           dc.w $0018
[000d341c]                           dc.w $0040
[000d341e]                           dc.w $0010
[000d3420] 000d19a4                  dc.l A_3DBUTTON12
[000d3424]                           dc.w $0000
[000d3426]                           dc.w $0000
[000d3428]                           dc.w $0018
[000d342a]                           dc.w $0006
_02__ED_WRAP:
[000d342c]                           dc.w $0005
[000d342e]                           dc.w $0003
[000d3430]                           dc.w $0004
[000d3432]                           dc.w $0018
[000d3434]                           dc.w $0040
[000d3436]                           dc.w $0000
[000d3438] 000d1ce4                  dc.l A_INNERFRAME04
[000d343c]                           dc.w $0001
[000d343e]                           dc.w $0000
[000d3440]                           dc.w $0016
[000d3442]                           dc.w $0003
_03__ED_WRAP:
[000d3444]                           dc.w $0004
[000d3446]                           dc.w $ffff
[000d3448]                           dc.w $ffff
[000d344a]                           dc.w $0018
[000d344c]                           dc.w $0008
[000d344e]                           dc.w $0010
[000d3450] 000d1aa4                  dc.l A_BOXED03
[000d3454]                           dc.w $000c
[000d3456]                           dc.w $0001
[000d3458]                           dc.w $0005
[000d345a]                           dc.w $0001
_04__ED_WRAP:
[000d345c]                           dc.w $0002
[000d345e]                           dc.w $ffff
[000d3460]                           dc.w $ffff
[000d3462]                           dc.w $001c
[000d3464]                           dc.w $0040
[000d3466]                           dc.w $0000
[000d3468] 000d0905                  dc.l TEXT_43
[000d346c]                           dc.w $0003
[000d346e]                           dc.w $0001
[000d3470]                           dc.w $0008
[000d3472]                           dc.w $0001
_05__ED_WRAP:
[000d3474]                           dc.w $0007
[000d3476]                           dc.w $ffff
[000d3478]                           dc.w $ffff
[000d347a]                           dc.w $0018
[000d347c]                           dc.w $4007
[000d347e]                           dc.w $0010
[000d3480] 000d1924                  dc.l A_3DBUTTON05
[000d3484]                           dc.w $0001
[000d3486]                           dc.w $0003
[000d3488]                           dc.w $000a
[000d348a]                           dc.w $0002
_05a_ED_WRAP:
[000d348c]                           dc.w $0000
[000d348e]                           dc.w $0000
[000d3490]                           dc.w $0000
[000d3492]                           dc.w $0000
[000d3494]                           dc.w $8000
[000d3496]                           dc.w $884f
[000d3498]                           dc.w $0000
[000d349a]                           dc.w $0000
[000d349c]                           dc.w $0000
[000d349e]                           dc.w $0000
[000d34a0]                           dc.w $0000
[000d34a2]                           dc.w $0000
_07__ED_WRAP:
[000d34a4]                           dc.w $0001
[000d34a6]                           dc.w $ffff
[000d34a8]                           dc.w $ffff
[000d34aa]                           dc.w $0018
[000d34ac]                           dc.w $4005
[000d34ae]                           dc.w $0010
[000d34b0] 000d1964                  dc.l A_3DBUTTON07
[000d34b4]                           dc.w $000d
[000d34b6]                           dc.w $0003
[000d34b8]                           dc.w $000a
[000d34ba]                           dc.w $0002
_07a_ED_WRAP:
[000d34bc]                           dc.w $0000
[000d34be]                           dc.w $0000
[000d34c0]                           dc.w $0000
[000d34c2]                           dc.w $0000
[000d34c4]                           dc.w $8020
[000d34c6]                           dc.w $8841
[000d34c8]                           dc.w $0000
[000d34ca]                           dc.w $0000
[000d34cc]                           dc.w $0000
[000d34ce]                           dc.w $0000
[000d34d0]                           dc.w $0000
[000d34d2]                           dc.w $0000
EDITOR:
[000d34d4]                           dc.w $0000
[000d34d6]                           dc.w $0000
[000d34d8] 0003e902                  dc.l edit_service
[000d34dc] 0003e328                  dc.l edit_make
[000d34e0] 00057428                  dc.l Awi_open
[000d34e4] 0003e21c                  dc.l edit_init
[000d34e8]                           dc.w $0000
[000d34ea]                           dc.w $0000
[000d34ec] 000d32ac                  dc.l _ED_TOOL
[000d34f0]                           dc.w $0000
[000d34f2]                           dc.w $0000
[000d34f4]                           dc.w $ffff
[000d34f6]                           dc.w $4fef
[000d34f8]                           dc.w $0002
[000d34fa]                           dc.w $0004
[000d34fc]                           dc.w $0063
[000d34fe]                           dc.w $0063
[000d3500]                           dc.w $0000
[000d3502]                           dc.w $0000
[000d3504]                           dc.w $0000
[000d3506]                           dc.w $0000
[000d3508]                           dc.w $0000
[000d350a]                           dc.w $0000
[000d350c]                           dc.w $0000
[000d350e]                           dc.w $0000
[000d3510]                           dc.w $ffff
[000d3512]                           dc.w $ffff
[000d3514]                           dc.w $ffff
[000d3516]                           dc.w $ffff
[000d3518]                           dc.w $0000
[000d351a]                           dc.w $0000
[000d351c]                           dc.w $fefe
[000d351e] 000d05d4                  dc.l TEXT_002
[000d3522] 000d05d4                  dc.l TEXT_002
[000d3526]                           dc.w $2710
[000d3528]                           dc.w $0103
[000d352a]                           dc.w $0000
[000d352c]                           dc.w $ffff
[000d352e] 000d21be                  dc.l _ED_ICON
[000d3532] 000d21e4                  dc.l _ED_MENU
[000d3536] 0003ce14                  dc.l edit_key
[000d353a] 00051852                  dc.l Awi_obchange
[000d353e] 00051c46                  dc.l Awi_redraw
[000d3542] 000587a4                  dc.l Awi_topped
[000d3546] 00058362                  dc.l Awi_closed
[000d354a] 0003dfc0                  dc.l edit_fulled
[000d354e] 0003e04c                  dc.l edit_arrowed
[000d3552] 0003e1dc                  dc.l edit_hslid
[000d3556] 0003ebe8                  dc.l edit_vslid
[000d355a] 0003eb3e                  dc.l edit_sized
[000d355e] 0003eae6                  dc.l edit_moved
[000d3562] 0005998a                  dc.l Awi_iconify
[000d3566] 00059c6c                  dc.l Awi_uniconify
[000d356a] 0005b5b6                  dc.l Awi_gemscript
[000d356e]                           dc.w $0000
[000d3570]                           dc.w $0000
[000d3572]                           dc.w $0000
[000d3574]                           dc.w $0000
WIED_FIND:
[000d3576]                           dc.w $0000
[000d3578]                           dc.w $0000
[000d357a] 00059dd0                  dc.l Awi_service
[000d357e] 00056c16                  dc.l Awi_selfcreate
[000d3582] 00057428                  dc.l Awi_open
[000d3586] 00055e94                  dc.l Awi_init
[000d358a] 000d2a24                  dc.l _ED_FIND
[000d358e]                           dc.w $0000
[000d3590]                           dc.w $0000
[000d3592]                           dc.w $0000
[000d3594]                           dc.w $0000
[000d3596]                           dc.w $ffff
[000d3598]                           dc.w $000b
[000d359a]                           dc.w $0000
[000d359c]                           dc.w $0000
[000d359e]                           dc.w $0078
[000d35a0]                           dc.w $0032
[000d35a2]                           dc.w $0000
[000d35a4]                           dc.w $0000
[000d35a6]                           dc.w $0000
[000d35a8]                           dc.w $0000
[000d35aa]                           dc.w $0000
[000d35ac]                           dc.w $0000
[000d35ae]                           dc.w $0000
[000d35b0]                           dc.w $0000
[000d35b2]                           dc.w $ffff
[000d35b4]                           dc.w $ffff
[000d35b6]                           dc.w $ffff
[000d35b8]                           dc.w $ffff
[000d35ba]                           dc.w $0000
[000d35bc]                           dc.w $0000
[000d35be]                           dc.w $f8f8
[000d35c0] 000d09a6                  dc.l TEXT_54
[000d35c4] 000d05d4                  dc.l TEXT_002
[000d35c8]                           dc.w $2710
[000d35ca]                           dc.w $0000
[000d35cc]                           dc.w $0000
[000d35ce]                           dc.w $ffff
[000d35d0]                           dc.w $0000
[000d35d2]                           dc.w $0000
[000d35d4]                           dc.w $0000
[000d35d6]                           dc.w $0000
[000d35d8] 0006b744                  dc.l Awi_keys
[000d35dc] 00051852                  dc.l Awi_obchange
[000d35e0] 00051c46                  dc.l Awi_redraw
[000d35e4] 000587a4                  dc.l Awi_topped
[000d35e8] 00058362                  dc.l Awi_closed
[000d35ec] 000587ec                  dc.l Awi_fulled
[000d35f0] 0005217c                  dc.l Awi_arrowed
[000d35f4] 000524b4                  dc.l Awi_hslid
[000d35f8] 0005255e                  dc.l Awi_vslid
[000d35fc] 00058bb0                  dc.l Awi_sized
[000d3600] 00058d50                  dc.l Awi_moved
[000d3604] 0005998a                  dc.l Awi_iconify
[000d3608] 00059c6c                  dc.l Awi_uniconify
[000d360c] 0005b5b6                  dc.l Awi_gemscript
[000d3610]                           dc.w $0000
[000d3612]                           dc.w $0000
[000d3614]                           dc.w $0000
[000d3616]                           dc.w $0000
WIED_GOTOLINE:
[000d3618]                           dc.w $0000
[000d361a]                           dc.w $0000
[000d361c] 00059dd0                  dc.l Awi_service
[000d3620] 00056c16                  dc.l Awi_selfcreate
[000d3624] 00057428                  dc.l Awi_open
[000d3628] 00055e94                  dc.l Awi_init
[000d362c] 000d2b8c                  dc.l _ED_GOTOLINE
[000d3630]                           dc.w $0000
[000d3632]                           dc.w $0000
[000d3634]                           dc.w $0000
[000d3636]                           dc.w $0000
[000d3638]                           dc.w $ffff
[000d363a]                           dc.w $000b
[000d363c]                           dc.w $0000
[000d363e]                           dc.w $0000
[000d3640]                           dc.w $0078
[000d3642]                           dc.w $0032
[000d3644]                           dc.w $0000
[000d3646]                           dc.w $0000
[000d3648]                           dc.w $0000
[000d364a]                           dc.w $0000
[000d364c]                           dc.w $0000
[000d364e]                           dc.w $0000
[000d3650]                           dc.w $0000
[000d3652]                           dc.w $0000
[000d3654]                           dc.w $ffff
[000d3656]                           dc.w $ffff
[000d3658]                           dc.w $ffff
[000d365a]                           dc.w $ffff
[000d365c]                           dc.w $0000
[000d365e]                           dc.w $0000
[000d3660]                           dc.w $f8f8
[000d3662] 000d06b1                  dc.l TEXT_12
[000d3666] 000d05d4                  dc.l TEXT_002
[000d366a]                           dc.w $2710
[000d366c]                           dc.w $0000
[000d366e]                           dc.w $0000
[000d3670]                           dc.w $ffff
[000d3672]                           dc.w $0000
[000d3674]                           dc.w $0000
[000d3676]                           dc.w $0000
[000d3678]                           dc.w $0000
[000d367a] 0006b744                  dc.l Awi_keys
[000d367e] 00051852                  dc.l Awi_obchange
[000d3682] 00051c46                  dc.l Awi_redraw
[000d3686] 000587a4                  dc.l Awi_topped
[000d368a] 00058362                  dc.l Awi_closed
[000d368e] 000587ec                  dc.l Awi_fulled
[000d3692] 0005217c                  dc.l Awi_arrowed
[000d3696] 000524b4                  dc.l Awi_hslid
[000d369a] 0005255e                  dc.l Awi_vslid
[000d369e] 00058bb0                  dc.l Awi_sized
[000d36a2] 00058d50                  dc.l Awi_moved
[000d36a6] 0005998a                  dc.l Awi_iconify
[000d36aa] 00059c6c                  dc.l Awi_uniconify
[000d36ae] 0005b5b6                  dc.l Awi_gemscript
[000d36b2]                           dc.w $0000
[000d36b4]                           dc.w $0000
[000d36b6]                           dc.w $0000
[000d36b8]                           dc.w $0000
WIED_INFO:
[000d36ba]                           dc.w $0000
[000d36bc]                           dc.w $0000
[000d36be] 00059dd0                  dc.l Awi_service
[000d36c2] 00056c16                  dc.l Awi_selfcreate
[000d36c6] 00057428                  dc.l Awi_open
[000d36ca] 00055e94                  dc.l Awi_init
[000d36ce] 000d2c64                  dc.l _ED_INFO
[000d36d2]                           dc.w $0000
[000d36d4]                           dc.w $0000
[000d36d6]                           dc.w $0000
[000d36d8]                           dc.w $0000
[000d36da]                           dc.w $ffff
[000d36dc]                           dc.w $000b
[000d36de]                           dc.w $0000
[000d36e0]                           dc.w $0000
[000d36e2]                           dc.w $0078
[000d36e4]                           dc.w $0032
[000d36e6]                           dc.w $0000
[000d36e8]                           dc.w $0000
[000d36ea]                           dc.w $0000
[000d36ec]                           dc.w $0000
[000d36ee]                           dc.w $0000
[000d36f0]                           dc.w $0000
[000d36f2]                           dc.w $0000
[000d36f4]                           dc.w $0000
[000d36f6]                           dc.w $ffff
[000d36f8]                           dc.w $ffff
[000d36fa]                           dc.w $ffff
[000d36fc]                           dc.w $ffff
[000d36fe]                           dc.w $0000
[000d3700]                           dc.w $0000
[000d3702]                           dc.w $f8f8
[000d3704] 000d09af                  dc.l TEXT_55
[000d3708] 000d05d4                  dc.l TEXT_002
[000d370c]                           dc.w $2710
[000d370e]                           dc.w $0000
[000d3710]                           dc.w $0000
[000d3712]                           dc.w $ffff
[000d3714]                           dc.w $0000
[000d3716]                           dc.w $0000
[000d3718]                           dc.w $0000
[000d371a]                           dc.w $0000
[000d371c] 0006b744                  dc.l Awi_keys
[000d3720] 00051852                  dc.l Awi_obchange
[000d3724] 00051c46                  dc.l Awi_redraw
[000d3728] 000587a4                  dc.l Awi_topped
[000d372c] 00058362                  dc.l Awi_closed
[000d3730] 000587ec                  dc.l Awi_fulled
[000d3734] 0005217c                  dc.l Awi_arrowed
[000d3738] 000524b4                  dc.l Awi_hslid
[000d373c] 0005255e                  dc.l Awi_vslid
[000d3740] 00058bb0                  dc.l Awi_sized
[000d3744] 00058d50                  dc.l Awi_moved
[000d3748] 0005998a                  dc.l Awi_iconify
[000d374c] 00059c6c                  dc.l Awi_uniconify
[000d3750] 0005b5b6                  dc.l Awi_gemscript
[000d3754]                           dc.w $0000
[000d3756]                           dc.w $0000
[000d3758]                           dc.w $0000
[000d375a]                           dc.w $0000
WIED_INFOBOX:
[000d375c]                           dc.w $0000
[000d375e]                           dc.w $0000
[000d3760] 00059dd0                  dc.l Awi_service
[000d3764] 00056c16                  dc.l Awi_selfcreate
[000d3768] 00057428                  dc.l Awi_open
[000d376c] 00055e94                  dc.l Awi_init
[000d3770] 000d29ac                  dc.l INFOBOX
[000d3774]                           dc.w $0000
[000d3776]                           dc.w $0000
[000d3778]                           dc.w $0000
[000d377a]                           dc.w $0000
[000d377c]                           dc.w $ffff
[000d377e]                           dc.w $000b
[000d3780]                           dc.w $0000
[000d3782]                           dc.w $0000
[000d3784]                           dc.w $0078
[000d3786]                           dc.w $0032
[000d3788]                           dc.w $0000
[000d378a]                           dc.w $0000
[000d378c]                           dc.w $0000
[000d378e]                           dc.w $0000
[000d3790]                           dc.w $0000
[000d3792]                           dc.w $0000
[000d3794]                           dc.w $0000
[000d3796]                           dc.w $0000
[000d3798]                           dc.w $ffff
[000d379a]                           dc.w $ffff
[000d379c]                           dc.w $ffff
[000d379e]                           dc.w $ffff
[000d37a0]                           dc.w $0000
[000d37a2]                           dc.w $0000
[000d37a4]                           dc.w $f8f8
[000d37a6] 000d09af                  dc.l TEXT_55
[000d37aa] 000d05d4                  dc.l TEXT_002
[000d37ae]                           dc.w $2710
[000d37b0]                           dc.w $0000
[000d37b2]                           dc.w $0000
[000d37b4]                           dc.w $ffff
[000d37b6]                           dc.w $0000
[000d37b8]                           dc.w $0000
[000d37ba]                           dc.w $0000
[000d37bc]                           dc.w $0000
[000d37be] 0006b744                  dc.l Awi_keys
[000d37c2] 00051852                  dc.l Awi_obchange
[000d37c6] 00051c46                  dc.l Awi_redraw
[000d37ca] 000587a4                  dc.l Awi_topped
[000d37ce] 00058362                  dc.l Awi_closed
[000d37d2] 000587ec                  dc.l Awi_fulled
[000d37d6] 0005217c                  dc.l Awi_arrowed
[000d37da] 000524b4                  dc.l Awi_hslid
[000d37de] 0005255e                  dc.l Awi_vslid
[000d37e2] 00058bb0                  dc.l Awi_sized
[000d37e6] 00058d50                  dc.l Awi_moved
[000d37ea] 0005998a                  dc.l Awi_iconify
[000d37ee] 00059c6c                  dc.l Awi_uniconify
[000d37f2] 0005b5b6                  dc.l Awi_gemscript
[000d37f6]                           dc.w $0000
[000d37f8]                           dc.w $0000
[000d37fa]                           dc.w $0000
[000d37fc]                           dc.w $0000
WIED_NEWFKEY:
[000d37fe]                           dc.w $0000
[000d3800]                           dc.w $0000
[000d3802] 00059dd0                  dc.l Awi_service
[000d3806] 00056c16                  dc.l Awi_selfcreate
[000d380a] 00057428                  dc.l Awi_open
[000d380e] 00055e94                  dc.l Awi_init
[000d3812] 000d2d0c                  dc.l _ED_NEWFKEY
[000d3816]                           dc.w $0000
[000d3818]                           dc.w $0000
[000d381a]                           dc.w $0000
[000d381c]                           dc.w $0000
[000d381e]                           dc.w $ffff
[000d3820]                           dc.w $000b
[000d3822]                           dc.w $0000
[000d3824]                           dc.w $0000
[000d3826]                           dc.w $0078
[000d3828]                           dc.w $0032
[000d382a]                           dc.w $0000
[000d382c]                           dc.w $0000
[000d382e]                           dc.w $0000
[000d3830]                           dc.w $0000
[000d3832]                           dc.w $0000
[000d3834]                           dc.w $0000
[000d3836]                           dc.w $0000
[000d3838]                           dc.w $0000
[000d383a]                           dc.w $ffff
[000d383c]                           dc.w $ffff
[000d383e]                           dc.w $ffff
[000d3840]                           dc.w $ffff
[000d3842]                           dc.w $0000
[000d3844]                           dc.w $0000
[000d3846]                           dc.w $f8f8
[000d3848] 000d0956                  dc.l TEXT_47
[000d384c] 000d05d4                  dc.l TEXT_002
[000d3850]                           dc.w $0000
[000d3852]                           dc.w $0100
[000d3854]                           dc.w $0000
[000d3856]                           dc.w $ffff
[000d3858]                           dc.w $0000
[000d385a]                           dc.w $0000
[000d385c]                           dc.w $0000
[000d385e]                           dc.w $0000
[000d3860] 0006b744                  dc.l Awi_keys
[000d3864] 00051852                  dc.l Awi_obchange
[000d3868] 00051c46                  dc.l Awi_redraw
[000d386c] 000587a4                  dc.l Awi_topped
[000d3870] 00058362                  dc.l Awi_closed
[000d3874] 000587ec                  dc.l Awi_fulled
[000d3878] 0005217c                  dc.l Awi_arrowed
[000d387c] 000524b4                  dc.l Awi_hslid
[000d3880] 0005255e                  dc.l Awi_vslid
[000d3884] 00058bb0                  dc.l Awi_sized
[000d3888] 00058d50                  dc.l Awi_moved
[000d388c] 0005998a                  dc.l Awi_iconify
[000d3890] 00059c6c                  dc.l Awi_uniconify
[000d3894] 0005b5b6                  dc.l Awi_gemscript
[000d3898]                           dc.w $0000
[000d389a]                           dc.w $0000
[000d389c]                           dc.w $0000
[000d389e]                           dc.w $0000
WIED_OPTION:
[000d38a0]                           dc.w $0000
[000d38a2]                           dc.w $0000
[000d38a4] 00059dd0                  dc.l Awi_service
[000d38a8] 00056c16                  dc.l Awi_selfcreate
[000d38ac] 00057428                  dc.l Awi_open
[000d38b0] 00055e94                  dc.l Awi_init
[000d38b4] 000d2e5c                  dc.l _ED_OPTION
[000d38b8]                           dc.w $0000
[000d38ba]                           dc.w $0000
[000d38bc]                           dc.w $0000
[000d38be]                           dc.w $0000
[000d38c0]                           dc.w $ffff
[000d38c2]                           dc.w $000b
[000d38c4]                           dc.w $0000
[000d38c6]                           dc.w $0000
[000d38c8]                           dc.w $0078
[000d38ca]                           dc.w $0032
[000d38cc]                           dc.w $0000
[000d38ce]                           dc.w $0000
[000d38d0]                           dc.w $0000
[000d38d2]                           dc.w $0000
[000d38d4]                           dc.w $0000
[000d38d6]                           dc.w $0000
[000d38d8]                           dc.w $0000
[000d38da]                           dc.w $0000
[000d38dc]                           dc.w $ffff
[000d38de]                           dc.w $ffff
[000d38e0]                           dc.w $ffff
[000d38e2]                           dc.w $ffff
[000d38e4]                           dc.w $0000
[000d38e6]                           dc.w $0000
[000d38e8]                           dc.w $f8f8
[000d38ea] 000d06a6                  dc.l TEXT_11
[000d38ee] 000d05d4                  dc.l TEXT_002
[000d38f2]                           dc.w $2710
[000d38f4]                           dc.w $0000
[000d38f6]                           dc.w $0000
[000d38f8]                           dc.w $ffff
[000d38fa]                           dc.w $0000
[000d38fc]                           dc.w $0000
[000d38fe]                           dc.w $0000
[000d3900]                           dc.w $0000
[000d3902] 0006b744                  dc.l Awi_keys
[000d3906] 00051852                  dc.l Awi_obchange
[000d390a] 00051c46                  dc.l Awi_redraw
[000d390e] 000587a4                  dc.l Awi_topped
[000d3912] 00058362                  dc.l Awi_closed
[000d3916] 000587ec                  dc.l Awi_fulled
[000d391a] 0005217c                  dc.l Awi_arrowed
[000d391e] 000524b4                  dc.l Awi_hslid
[000d3922] 0005255e                  dc.l Awi_vslid
[000d3926] 00058bb0                  dc.l Awi_sized
[000d392a] 00058d50                  dc.l Awi_moved
[000d392e] 0005998a                  dc.l Awi_iconify
[000d3932] 00059c6c                  dc.l Awi_uniconify
[000d3936] 0005b5b6                  dc.l Awi_gemscript
[000d393a]                           dc.w $0000
[000d393c]                           dc.w $0000
[000d393e]                           dc.w $0000
[000d3940]                           dc.w $0000
WIED_REPLACE:
[000d3942]                           dc.w $0000
[000d3944]                           dc.w $0000
[000d3946] 00059dd0                  dc.l Awi_service
[000d394a] 00056c16                  dc.l Awi_selfcreate
[000d394e] 00057428                  dc.l Awi_open
[000d3952] 00055e94                  dc.l Awi_init
[000d3956] 000d30b4                  dc.l _ED_REPLACE
[000d395a]                           dc.w $0000
[000d395c]                           dc.w $0000
[000d395e]                           dc.w $0000
[000d3960]                           dc.w $0000
[000d3962]                           dc.w $ffff
[000d3964]                           dc.w $000b
[000d3966]                           dc.w $0000
[000d3968]                           dc.w $0000
[000d396a]                           dc.w $0078
[000d396c]                           dc.w $0032
[000d396e]                           dc.w $0000
[000d3970]                           dc.w $0000
[000d3972]                           dc.w $0000
[000d3974]                           dc.w $0000
[000d3976]                           dc.w $0000
[000d3978]                           dc.w $0000
[000d397a]                           dc.w $0000
[000d397c]                           dc.w $0000
[000d397e]                           dc.w $ffff
[000d3980]                           dc.w $ffff
[000d3982]                           dc.w $ffff
[000d3984]                           dc.w $ffff
[000d3986]                           dc.w $0000
[000d3988]                           dc.w $0000
[000d398a]                           dc.w $f8f8
[000d398c] 000d09e5                  dc.l TEXT_59
[000d3990] 000d05d4                  dc.l TEXT_002
[000d3994]                           dc.w $2710
[000d3996]                           dc.w $0000
[000d3998]                           dc.w $0000
[000d399a]                           dc.w $ffff
[000d399c]                           dc.w $0000
[000d399e]                           dc.w $0000
[000d39a0]                           dc.w $0000
[000d39a2]                           dc.w $0000
[000d39a4] 0006b744                  dc.l Awi_keys
[000d39a8] 00051852                  dc.l Awi_obchange
[000d39ac] 00051c46                  dc.l Awi_redraw
[000d39b0] 000587a4                  dc.l Awi_topped
[000d39b4] 00058362                  dc.l Awi_closed
[000d39b8] 000587ec                  dc.l Awi_fulled
[000d39bc] 0005217c                  dc.l Awi_arrowed
[000d39c0] 000524b4                  dc.l Awi_hslid
[000d39c4] 0005255e                  dc.l Awi_vslid
[000d39c8] 00058bb0                  dc.l Awi_sized
[000d39cc] 00058d50                  dc.l Awi_moved
[000d39d0] 0005998a                  dc.l Awi_iconify
[000d39d4] 00059c6c                  dc.l Awi_uniconify
[000d39d8] 0005b5b6                  dc.l Awi_gemscript
[000d39dc]                           dc.w $0000
[000d39de]                           dc.w $0000
[000d39e0]                           dc.w $0000
[000d39e2]                           dc.w $0000
WIED_WRAP:
[000d39e4]                           dc.w $0000
[000d39e6]                           dc.w $0000
[000d39e8] 00059dd0                  dc.l Awi_service
[000d39ec] 00056c16                  dc.l Awi_selfcreate
[000d39f0] 00057428                  dc.l Awi_open
[000d39f4] 00055e94                  dc.l Awi_init
[000d39f8] 000d33fc                  dc.l _ED_WRAP
[000d39fc]                           dc.w $0000
[000d39fe]                           dc.w $0000
[000d3a00]                           dc.w $0000
[000d3a02]                           dc.w $0000
[000d3a04]                           dc.w $ffff
[000d3a06]                           dc.w $000b
[000d3a08]                           dc.w $0000
[000d3a0a]                           dc.w $0000
[000d3a0c]                           dc.w $0078
[000d3a0e]                           dc.w $0032
[000d3a10]                           dc.w $0000
[000d3a12]                           dc.w $0000
[000d3a14]                           dc.w $0000
[000d3a16]                           dc.w $0000
[000d3a18]                           dc.w $0000
[000d3a1a]                           dc.w $0000
[000d3a1c]                           dc.w $0000
[000d3a1e]                           dc.w $0000
[000d3a20]                           dc.w $ffff
[000d3a22]                           dc.w $ffff
[000d3a24]                           dc.w $ffff
[000d3a26]                           dc.w $ffff
[000d3a28]                           dc.w $0000
[000d3a2a]                           dc.w $0000
[000d3a2c]                           dc.w $f8f8
[000d3a2e] 000d09c7                  dc.l TEXT_57
[000d3a32] 000d05d4                  dc.l TEXT_002
[000d3a36]                           dc.w $2710
[000d3a38]                           dc.w $0000
[000d3a3a]                           dc.w $0000
[000d3a3c]                           dc.w $ffff
[000d3a3e]                           dc.w $0000
[000d3a40]                           dc.w $0000
[000d3a42]                           dc.w $0000
[000d3a44]                           dc.w $0000
[000d3a46] 0006b744                  dc.l Awi_keys
[000d3a4a] 00051852                  dc.l Awi_obchange
[000d3a4e] 00051c46                  dc.l Awi_redraw
[000d3a52] 000587a4                  dc.l Awi_topped
[000d3a56] 00058362                  dc.l Awi_closed
[000d3a5a] 000587ec                  dc.l Awi_fulled
[000d3a5e] 0005217c                  dc.l Awi_arrowed
[000d3a62] 000524b4                  dc.l Awi_hslid
[000d3a66] 0005255e                  dc.l Awi_vslid
[000d3a6a] 00058bb0                  dc.l Awi_sized
[000d3a6e] 00058d50                  dc.l Awi_moved
[000d3a72] 0005998a                  dc.l Awi_iconify
[000d3a76] 00059c6c                  dc.l Awi_uniconify
[000d3a7a] 0005b5b6                  dc.l Awi_gemscript
[000d3a7e]                           dc.w $0000
[000d3a80]                           dc.w $0000
[000d3a82]                           dc.w $0000
[000d3a84]                           dc.w $0000
protocnf:
[000d3a86]                           dc.b 'AED1',0
[000d3a8b]                           dc.b $02
[000d3a8c]                           dc.w $0000
[000d3a8e]                           dc.w $0000
[000d3a90]                           dc.w $0001
[000d3a92]                           dc.w $000d
[000d3a94]                           dc.w $0000
[000d3a96]                           dc.b 'txt',0
[000d3a9a]                           dc.w $0000
[000d3a9c]                           dc.w $0000
[000d3a9e]                           dc.w $0000
[000d3aa0]                           dc.w $0000
[000d3aa2]                           dc.w $0000
[000d3aa4]                           dc.w $0000
[000d3aa6]                           dc.b 'namenlos.txt',0
[000d3ab3]                           dc.b $00
[000d3ab4]                           dc.w $0000
[000d3ab6]                           dc.w $0000
[000d3ab8]                           dc.w $0000
[000d3aba]                           dc.w $0000
[000d3abc]                           dc.w $0000
[000d3abe]                           dc.w $0000
[000d3ac0]                           dc.w $0000
[000d3ac2]                           dc.w $0000
[000d3ac4]                           dc.w $0000
[000d3ac6]                           dc.w $0000
[000d3ac8]                           dc.w $0000
[000d3aca]                           dc.w $0000
[000d3acc]                           dc.w $0000
[000d3ace]                           dc.w $0000
[000d3ad0]                           dc.w $0000
[000d3ad2]                           dc.w $0000
[000d3ad4]                           dc.w $0000
[000d3ad6]                           dc.w $0000
[000d3ad8]                           dc.w $0000
[000d3ada]                           dc.w $0000
[000d3adc]                           dc.w $0000
[000d3ade]                           dc.w $0000
[000d3ae0]                           dc.w $0000
[000d3ae2]                           dc.w $0000
[000d3ae4]                           dc.w $0000
[000d3ae6]                           dc.w $0000
[000d3ae8]                           dc.w $0000
[000d3aea]                           dc.w $0000
[000d3aec]                           dc.w $0000
[000d3aee]                           dc.w $0000
[000d3af0]                           dc.w $0000
[000d3af2]                           dc.w $0000
[000d3af4]                           dc.w $0000
[000d3af6]                           dc.w $0000
[000d3af8]                           dc.w $0000
[000d3afa]                           dc.w $0000
[000d3afc]                           dc.w $0000
[000d3afe]                           dc.w $0000
[000d3b00]                           dc.w $0000
[000d3b02]                           dc.w $0000
[000d3b04]                           dc.w $0000
[000d3b06]                           dc.w $0000
[000d3b08]                           dc.w $0000
[000d3b0a]                           dc.w $0000
[000d3b0c]                           dc.w $0000
[000d3b0e]                           dc.w $0000
[000d3b10]                           dc.w $0000
[000d3b12]                           dc.w $0000
[000d3b14]                           dc.w $0000
[000d3b16]                           dc.w $0000
[000d3b18]                           dc.w $0000
[000d3b1a]                           dc.w $0000
[000d3b1c]                           dc.w $0000
[000d3b1e]                           dc.w $0000
[000d3b20]                           dc.w $0000
[000d3b22]                           dc.w $0000
[000d3b24]                           dc.w $0000
[000d3b26]                           dc.w $0000
[000d3b28]                           dc.w $0000
[000d3b2a]                           dc.w $0000
[000d3b2c]                           dc.w $0000
[000d3b2e]                           dc.w $0000
[000d3b30]                           dc.w $0000
[000d3b32]                           dc.w $0000
[000d3b34]                           dc.w $0000
[000d3b36]                           dc.w $0000
[000d3b38]                           dc.w $0000
[000d3b3a]                           dc.w $0000
[000d3b3c]                           dc.w $0000
[000d3b3e]                           dc.w $0000
[000d3b40]                           dc.w $0000
[000d3b42]                           dc.w $0000
[000d3b44]                           dc.w $0000
[000d3b46]                           dc.w $0000
[000d3b48]                           dc.w $0000
[000d3b4a]                           dc.w $0000
[000d3b4c]                           dc.w $0000
[000d3b4e]                           dc.w $0000
[000d3b50]                           dc.w $0000
[000d3b52]                           dc.w $0000
[000d3b54]                           dc.w $0000
[000d3b56]                           dc.w $0000
[000d3b58]                           dc.w $0000
[000d3b5a]                           dc.w $0000
[000d3b5c]                           dc.w $0000
[000d3b5e]                           dc.w $0000
[000d3b60]                           dc.w $0000
[000d3b62]                           dc.w $0000
[000d3b64]                           dc.w $0000
[000d3b66]                           dc.w $0000
[000d3b68]                           dc.w $0000
[000d3b6a]                           dc.w $0000
[000d3b6c]                           dc.w $0000
[000d3b6e]                           dc.w $0000
[000d3b70]                           dc.w $0000
[000d3b72]                           dc.w $0000
[000d3b74]                           dc.w $0000
[000d3b76]                           dc.w $0000
[000d3b78]                           dc.w $0000
[000d3b7a]                           dc.w $0000
[000d3b7c]                           dc.w $0000
[000d3b7e]                           dc.w $0000
[000d3b80]                           dc.w $0000
[000d3b82]                           dc.w $0000
[000d3b84]                           dc.w $0000
[000d3b86]                           dc.w $0000
[000d3b88]                           dc.w $0000
[000d3b8a]                           dc.w $0000
[000d3b8c]                           dc.w $0000
[000d3b8e]                           dc.w $0000
[000d3b90]                           dc.w $0000
[000d3b92]                           dc.w $0000
[000d3b94]                           dc.w $0000
[000d3b96]                           dc.w $0000
[000d3b98]                           dc.w $0000
[000d3b9a]                           dc.w $0000
[000d3b9c]                           dc.w $0000
[000d3b9e]                           dc.w $0000
[000d3ba0]                           dc.w $0000
[000d3ba2]                           dc.w $0000
[000d3ba4]                           dc.w $0000
[000d3ba6]                           dc.w $0048
[000d3ba8]                           dc.w $0000
[000d3baa]                           dc.w $0000
[000d3bac]                           dc.w $0000
[000d3bae]                           dc.w $0000
[000d3bb0]                           dc.w $0000
[000d3bb2]                           dc.w $0000
[000d3bb4]                           dc.w $0000
[000d3bb6]                           dc.w $0000
[000d3bb8]                           dc.w $0000
[000d3bba]                           dc.w $0000
[000d3bbc]                           dc.w $0000
[000d3bbe]                           dc.w $0000
[000d3bc0]                           dc.w $0000
[000d3bc2]                           dc.w $0000
[000d3bc4]                           dc.w $0000
[000d3bc6]                           dc.w $0000
[000d3bc8]                           dc.w $0000
[000d3bca]                           dc.w $0000
[000d3bcc]                           dc.w $0000
[000d3bce]                           dc.w $0000
[000d3bd0]                           dc.w $0000
[000d3bd2]                           dc.w $0000
[000d3bd4]                           dc.w $0000
[000d3bd6]                           dc.w $0000
[000d3bd8]                           dc.w $0000
[000d3bda]                           dc.w $0000
[000d3bdc]                           dc.w $0000
[000d3bde]                           dc.w $0000
[000d3be0]                           dc.w $0000
[000d3be2]                           dc.w $0000
[000d3be4]                           dc.w $0000
[000d3be6]                           dc.w $0000
[000d3be8]                           dc.w $0000
[000d3bea]                           dc.w $0000
[000d3bec]                           dc.w $0000
[000d3bee]                           dc.w $0000
[000d3bf0]                           dc.w $0000
[000d3bf2]                           dc.w $0000
[000d3bf4]                           dc.w $0000
[000d3bf6]                           dc.w $0000
[000d3bf8]                           dc.w $0000
[000d3bfa]                           dc.w $0000
[000d3bfc]                           dc.w $0000
[000d3bfe]                           dc.w $0000
[000d3c00]                           dc.w $0000
[000d3c02]                           dc.w $0000
[000d3c04]                           dc.w $0000
[000d3c06]                           dc.w $0000
[000d3c08]                           dc.w $0000
[000d3c0a]                           dc.w $0000
[000d3c0c]                           dc.w $0000
[000d3c0e]                           dc.w $0000
[000d3c10]                           dc.w $0000
[000d3c12]                           dc.w $0000
[000d3c14]                           dc.w $0000
[000d3c16]                           dc.w $0000
[000d3c18]                           dc.w $0000
[000d3c1a]                           dc.w $0000
[000d3c1c]                           dc.w $0000
[000d3c1e]                           dc.w $0000
[000d3c20]                           dc.w $0000
[000d3c22]                           dc.w $0000
[000d3c24]                           dc.w $0000
[000d3c26]                           dc.w $0000
[000d3c28]                           dc.w $0000
[000d3c2a]                           dc.w $0000
[000d3c2c]                           dc.w $0000
[000d3c2e]                           dc.w $0000
[000d3c30]                           dc.w $0000
[000d3c32]                           dc.w $0000
[000d3c34]                           dc.w $0000
[000d3c36]                           dc.w $0000
[000d3c38]                           dc.w $0000
[000d3c3a]                           dc.w $0000
[000d3c3c]                           dc.w $0000
[000d3c3e]                           dc.w $0000
[000d3c40]                           dc.w $0000
[000d3c42]                           dc.w $0000
[000d3c44]                           dc.w $0000
[000d3c46]                           dc.w $0000
[000d3c48]                           dc.w $0000
[000d3c4a]                           dc.w $0000
[000d3c4c]                           dc.w $0000
[000d3c4e]                           dc.w $0000
[000d3c50]                           dc.w $0000
[000d3c52]                           dc.w $0000
[000d3c54]                           dc.w $0000
[000d3c56]                           dc.w $0000
[000d3c58]                           dc.w $0000
[000d3c5a]                           dc.w $0000
[000d3c5c]                           dc.w $0000
[000d3c5e]                           dc.w $0000
[000d3c60]                           dc.w $0000
[000d3c62]                           dc.w $0000
[000d3c64]                           dc.w $0000
[000d3c66]                           dc.w $0000
[000d3c68]                           dc.w $0000
[000d3c6a]                           dc.w $0000
[000d3c6c]                           dc.w $0000
[000d3c6e]                           dc.w $0000
[000d3c70]                           dc.w $0000
[000d3c72]                           dc.w $0000
[000d3c74]                           dc.w $0000
[000d3c76]                           dc.w $0000
[000d3c78]                           dc.w $0000
[000d3c7a]                           dc.w $0000
[000d3c7c]                           dc.w $0000
[000d3c7e]                           dc.w $0000
[000d3c80]                           dc.w $0000
[000d3c82]                           dc.w $0000
[000d3c84]                           dc.w $0000
[000d3c86]                           dc.w $0000
[000d3c88]                           dc.w $0000
[000d3c8a]                           dc.w $0000
[000d3c8c]                           dc.w $0000
[000d3c8e]                           dc.w $0000
[000d3c90]                           dc.w $0000
[000d3c92]                           dc.w $0000
[000d3c94]                           dc.w $0000
[000d3c96]                           dc.w $0000
[000d3c98]                           dc.w $0000
[000d3c9a]                           dc.w $0000
[000d3c9c]                           dc.w $0000
[000d3c9e]                           dc.w $0000
[000d3ca0]                           dc.w $0000
[000d3ca2]                           dc.w $0000
[000d3ca4]                           dc.w $0000
[000d3ca6]                           dc.w $0000
[000d3ca8]                           dc.w $0000
[000d3caa]                           dc.w $0000
[000d3cac]                           dc.w $0000
[000d3cae]                           dc.w $0000
[000d3cb0]                           dc.w $0000
[000d3cb2]                           dc.w $0000
[000d3cb4]                           dc.w $0000
[000d3cb6]                           dc.w $0000
[000d3cb8]                           dc.w $0000
[000d3cba]                           dc.w $0000
[000d3cbc]                           dc.w $0000
[000d3cbe]                           dc.w $0000
[000d3cc0]                           dc.w $0000
[000d3cc2]                           dc.w $0000
[000d3cc4]                           dc.w $0000
[000d3cc6]                           dc.w $0000
[000d3cc8]                           dc.w $0000
[000d3cca]                           dc.w $0000
[000d3ccc]                           dc.w $0000
[000d3cce]                           dc.w $0000
[000d3cd0]                           dc.w $0000
[000d3cd2]                           dc.w $0000
[000d3cd4]                           dc.w $0000
[000d3cd6]                           dc.w $0000
[000d3cd8]                           dc.w $0000
[000d3cda]                           dc.w $0000
[000d3cdc]                           dc.w $0000
[000d3cde]                           dc.w $0000
[000d3ce0]                           dc.w $0000
[000d3ce2]                           dc.w $0000
[000d3ce4]                           dc.w $0000
[000d3ce6]                           dc.w $0000
[000d3ce8]                           dc.w $0000
[000d3cea]                           dc.w $0000
[000d3cec]                           dc.w $0000
[000d3cee]                           dc.w $0000
[000d3cf0]                           dc.w $0000
[000d3cf2]                           dc.w $0000
[000d3cf4]                           dc.w $0000
[000d3cf6]                           dc.w $0000
[000d3cf8]                           dc.w $0000
[000d3cfa]                           dc.w $0000
[000d3cfc]                           dc.w $0000
[000d3cfe]                           dc.w $0000
[000d3d00]                           dc.w $0000
[000d3d02]                           dc.w $0000
[000d3d04]                           dc.w $0000
[000d3d06]                           dc.w $0000
[000d3d08]                           dc.w $0000
[000d3d0a]                           dc.w $0000
[000d3d0c]                           dc.w $0000
[000d3d0e]                           dc.w $0000
[000d3d10]                           dc.w $0000
[000d3d12]                           dc.w $0000
[000d3d14]                           dc.w $0000
[000d3d16]                           dc.w $0000
[000d3d18]                           dc.w $0000
[000d3d1a]                           dc.w $0000
[000d3d1c]                           dc.w $0000
[000d3d1e]                           dc.w $0000
[000d3d20]                           dc.w $0000
[000d3d22]                           dc.w $0000
[000d3d24]                           dc.w $0000
[000d3d26]                           dc.w $0000
[000d3d28]                           dc.w $0000
[000d3d2a]                           dc.w $0000
[000d3d2c]                           dc.w $0000
[000d3d2e]                           dc.w $0000
[000d3d30]                           dc.w $0000
[000d3d32]                           dc.w $0000
[000d3d34]                           dc.w $0000
[000d3d36]                           dc.w $0000
[000d3d38]                           dc.w $0000
[000d3d3a]                           dc.w $0000
[000d3d3c]                           dc.w $0000
[000d3d3e]                           dc.w $0000
[000d3d40]                           dc.w $0000
[000d3d42]                           dc.w $0000
[000d3d44]                           dc.w $0000
[000d3d46]                           dc.w $0000
[000d3d48]                           dc.w $0000
[000d3d4a]                           dc.w $0000
[000d3d4c]                           dc.w $0000
[000d3d4e]                           dc.w $0000
[000d3d50]                           dc.w $0000
[000d3d52]                           dc.w $0000
[000d3d54]                           dc.w $0000
[000d3d56]                           dc.w $0000
[000d3d58]                           dc.w $0000
[000d3d5a]                           dc.w $0000
[000d3d5c]                           dc.w $0000
[000d3d5e]                           dc.w $0000
[000d3d60]                           dc.w $0000
[000d3d62]                           dc.w $0000
[000d3d64]                           dc.w $0000
[000d3d66]                           dc.w $0000
[000d3d68]                           dc.w $0000
[000d3d6a]                           dc.w $0000
[000d3d6c]                           dc.w $0000
[000d3d6e]                           dc.w $0000
[000d3d70]                           dc.w $0000
[000d3d72]                           dc.w $0000
[000d3d74]                           dc.w $0000
[000d3d76]                           dc.w $0000
[000d3d78]                           dc.w $0000
[000d3d7a]                           dc.w $0000
[000d3d7c]                           dc.w $0000
[000d3d7e]                           dc.w $0000
[000d3d80]                           dc.w $0000
[000d3d82]                           dc.w $0000
[000d3d84]                           dc.w $0000
[000d3d86]                           dc.w $0000
[000d3d88]                           dc.w $0000
[000d3d8a]                           dc.w $0000
[000d3d8c]                           dc.w $0000
[000d3d8e]                           dc.w $0000
[000d3d90]                           dc.w $0000
[000d3d92]                           dc.w $0000
[000d3d94]                           dc.w $0000
[000d3d96]                           dc.w $0000
[000d3d98]                           dc.w $0000
[000d3d9a]                           dc.w $0000
[000d3d9c]                           dc.w $0000
[000d3d9e]                           dc.w $0000
[000d3da0]                           dc.w $0000
[000d3da2]                           dc.w $0000
[000d3da4]                           dc.w $0000
[000d3da6]                           dc.w $0000
[000d3da8]                           dc.w $0000
[000d3daa]                           dc.w $0000
[000d3dac]                           dc.w $0000
[000d3dae]                           dc.w $0000
[000d3db0]                           dc.w $0000
[000d3db2]                           dc.w $0000
[000d3db4]                           dc.w $0000
[000d3db6]                           dc.w $0000
[000d3db8]                           dc.w $0000
[000d3dba]                           dc.w $0000
[000d3dbc]                           dc.w $0000
[000d3dbe]                           dc.w $0000
[000d3dc0]                           dc.w $0000
[000d3dc2]                           dc.w $0000
[000d3dc4]                           dc.w $0000
[000d3dc6]                           dc.w $0000
[000d3dc8]                           dc.w $0000
[000d3dca]                           dc.w $0000
[000d3dcc]                           dc.w $0000
[000d3dce]                           dc.w $0000
[000d3dd0]                           dc.w $0000
[000d3dd2]                           dc.w $0000
[000d3dd4]                           dc.w $0000
[000d3dd6]                           dc.w $0000
[000d3dd8]                           dc.w $0000
[000d3dda]                           dc.w $0000
[000d3ddc]                           dc.w $0000
[000d3dde]                           dc.w $0000
[000d3de0]                           dc.w $0000
[000d3de2]                           dc.w $0000
[000d3de4]                           dc.w $0000
[000d3de6]                           dc.w $0000
[000d3de8]                           dc.w $0000
[000d3dea]                           dc.w $0000
[000d3dec]                           dc.w $0000
[000d3dee]                           dc.w $0000
[000d3df0]                           dc.w $0000
[000d3df2]                           dc.w $0000
[000d3df4]                           dc.w $0000
[000d3df6]                           dc.w $0000
[000d3df8]                           dc.w $0000
[000d3dfa]                           dc.w $0000
[000d3dfc]                           dc.w $0000
[000d3dfe]                           dc.w $0000
[000d3e00]                           dc.w $0000
[000d3e02]                           dc.w $0000
[000d3e04]                           dc.w $0000
[000d3e06]                           dc.w $0000
[000d3e08]                           dc.w $0000
[000d3e0a]                           dc.w $0000
[000d3e0c]                           dc.w $0000
[000d3e0e]                           dc.w $0000
[000d3e10]                           dc.w $0000
[000d3e12]                           dc.w $0000
[000d3e14]                           dc.w $0000
[000d3e16]                           dc.w $0000
[000d3e18]                           dc.w $0000
[000d3e1a]                           dc.w $0000
[000d3e1c]                           dc.w $0000
[000d3e1e]                           dc.w $0000
[000d3e20]                           dc.w $0000
[000d3e22]                           dc.w $0000
[000d3e24]                           dc.w $0000
[000d3e26]                           dc.w $0000
[000d3e28]                           dc.w $0000
[000d3e2a]                           dc.w $0000
[000d3e2c]                           dc.w $0000
[000d3e2e]                           dc.w $0000
[000d3e30]                           dc.w $0000
[000d3e32]                           dc.w $0000
[000d3e34]                           dc.w $0000
[000d3e36]                           dc.w $0000
[000d3e38]                           dc.w $0000
[000d3e3a]                           dc.w $0000
[000d3e3c]                           dc.w $0000
[000d3e3e]                           dc.w $0000
[000d3e40]                           dc.w $0000
[000d3e42]                           dc.w $0000
[000d3e44]                           dc.w $0000
[000d3e46]                           dc.w $0000
[000d3e48]                           dc.w $0000
[000d3e4a]                           dc.w $0000
[000d3e4c]                           dc.w $0000
[000d3e4e]                           dc.w $0000
[000d3e50]                           dc.w $0000
[000d3e52]                           dc.w $0000
[000d3e54]                           dc.w $0000
[000d3e56]                           dc.w $0000
[000d3e58]                           dc.w $0000
[000d3e5a]                           dc.w $0000
[000d3e5c]                           dc.w $0000
[000d3e5e]                           dc.w $0000
[000d3e60]                           dc.w $0000
[000d3e62]                           dc.w $0000
[000d3e64]                           dc.w $0000
[000d3e66]                           dc.w $0000
[000d3e68]                           dc.w $0000
[000d3e6a]                           dc.w $0000
[000d3e6c]                           dc.w $0000
[000d3e6e]                           dc.w $0000
[000d3e70]                           dc.w $0000
[000d3e72]                           dc.w $0000
[000d3e74]                           dc.w $0000
[000d3e76]                           dc.w $0000
[000d3e78]                           dc.w $0000
[000d3e7a]                           dc.w $0000
[000d3e7c]                           dc.w $0000
[000d3e7e]                           dc.w $0000
[000d3e80]                           dc.w $0000
[000d3e82]                           dc.w $0000
[000d3e84]                           dc.w $0000
[000d3e86]                           dc.w $0000
[000d3e88]                           dc.w $0000
[000d3e8a]                           dc.w $0000
[000d3e8c]                           dc.w $0000
[000d3e8e]                           dc.w $0000
[000d3e90]                           dc.w $0000
[000d3e92]                           dc.w $0000
[000d3e94]                           dc.w $0000
[000d3e96]                           dc.w $0000
[000d3e98]                           dc.w $0000
[000d3e9a]                           dc.w $0000
[000d3e9c]                           dc.w $0000
[000d3e9e]                           dc.w $0000
[000d3ea0]                           dc.w $0000
[000d3ea2]                           dc.w $0000
[000d3ea4]                           dc.w $0000
[000d3ea6]                           dc.w $0000
[000d3ea8]                           dc.w $0000
[000d3eaa]                           dc.w $0000
[000d3eac]                           dc.w $0000
[000d3eae]                           dc.w $0000
[000d3eb0]                           dc.w $0000
[000d3eb2]                           dc.w $0000
[000d3eb4]                           dc.w $0000
[000d3eb6]                           dc.w $0000
[000d3eb8]                           dc.w $0000
[000d3eba]                           dc.w $0000
[000d3ebc]                           dc.w $0000
[000d3ebe]                           dc.w $0000
[000d3ec0]                           dc.w $0000
[000d3ec2]                           dc.w $0000
[000d3ec4]                           dc.w $0000
[000d3ec6]                           dc.w $0000
[000d3ec8]                           dc.w $0000
[000d3eca]                           dc.w $0000
[000d3ecc]                           dc.w $0000
[000d3ece]                           dc.w $0000
[000d3ed0]                           dc.w $0000
[000d3ed2]                           dc.w $0000
[000d3ed4]                           dc.w $0000
[000d3ed6]                           dc.w $0000
[000d3ed8]                           dc.w $0000
[000d3eda]                           dc.w $0000
[000d3edc]                           dc.w $0000
[000d3ede]                           dc.w $0000
[000d3ee0]                           dc.w $0000
[000d3ee2]                           dc.w $0000
[000d3ee4]                           dc.w $0000
[000d3ee6]                           dc.w $0000
[000d3ee8]                           dc.w $0000
[000d3eea]                           dc.w $0000
[000d3eec]                           dc.w $0000
[000d3eee]                           dc.w $0000
[000d3ef0]                           dc.w $0000
[000d3ef2]                           dc.w $0000
[000d3ef4]                           dc.w $0000
[000d3ef6]                           dc.w $0000
[000d3ef8]                           dc.w $0000
[000d3efa]                           dc.w $0000
[000d3efc]                           dc.w $0000
[000d3efe]                           dc.w $0000
[000d3f00]                           dc.w $0000
[000d3f02]                           dc.w $0000
[000d3f04]                           dc.w $0000
[000d3f06]                           dc.w $0000
[000d3f08]                           dc.w $0000
[000d3f0a]                           dc.w $0000
[000d3f0c]                           dc.w $0000
[000d3f0e]                           dc.w $0000
[000d3f10]                           dc.w $0000
[000d3f12]                           dc.w $0000
[000d3f14]                           dc.w $0000
[000d3f16]                           dc.w $0000
[000d3f18]                           dc.w $0000
[000d3f1a]                           dc.w $0000
[000d3f1c]                           dc.w $0000
[000d3f1e]                           dc.w $0000
[000d3f20]                           dc.w $0000
[000d3f22]                           dc.w $0000
[000d3f24]                           dc.w $0000
[000d3f26]                           dc.w $0000
[000d3f28]                           dc.w $0000
[000d3f2a]                           dc.w $0000
[000d3f2c]                           dc.w $0000
[000d3f2e]                           dc.w $0000
[000d3f30]                           dc.w $0000
[000d3f32]                           dc.w $0000
[000d3f34]                           dc.w $0000
[000d3f36]                           dc.w $0000
[000d3f38]                           dc.w $0000
[000d3f3a]                           dc.w $0000
[000d3f3c]                           dc.w $0000
[000d3f3e]                           dc.w $0000
[000d3f40]                           dc.w $0000
[000d3f42]                           dc.w $0000
[000d3f44]                           dc.w $0000
[000d3f46]                           dc.w $0000
[000d3f48]                           dc.w $0000
[000d3f4a]                           dc.w $0000
[000d3f4c]                           dc.w $0000
[000d3f4e]                           dc.w $0000
[000d3f50]                           dc.w $0000
[000d3f52]                           dc.w $0000
[000d3f54]                           dc.w $0000
[000d3f56]                           dc.w $0000
[000d3f58]                           dc.w $0000
[000d3f5a]                           dc.w $0000
[000d3f5c]                           dc.w $0000
[000d3f5e]                           dc.w $0000
[000d3f60]                           dc.w $0000
[000d3f62]                           dc.w $0000
[000d3f64]                           dc.w $0000
[000d3f66]                           dc.w $0000
[000d3f68]                           dc.w $0000
[000d3f6a]                           dc.w $0000
[000d3f6c]                           dc.w $0000
[000d3f6e]                           dc.w $0000
[000d3f70]                           dc.w $0000
[000d3f72]                           dc.w $0000
[000d3f74]                           dc.w $0000
[000d3f76]                           dc.w $0000
[000d3f78]                           dc.w $0000
[000d3f7a]                           dc.w $0000
[000d3f7c]                           dc.w $0000
[000d3f7e]                           dc.w $0000
[000d3f80]                           dc.w $0000
[000d3f82]                           dc.w $0000
[000d3f84]                           dc.w $0000
[000d3f86]                           dc.w $0000
[000d3f88]                           dc.w $0000
[000d3f8a]                           dc.w $0000
[000d3f8c]                           dc.w $0000
[000d3f8e]                           dc.w $0000
[000d3f90]                           dc.w $0000
[000d3f92]                           dc.w $0000
[000d3f94]                           dc.w $0000
[000d3f96]                           dc.w $0000
[000d3f98]                           dc.w $0000
[000d3f9a]                           dc.w $0000
[000d3f9c]                           dc.w $0000
[000d3f9e]                           dc.w $0000
[000d3fa0]                           dc.w $0000
[000d3fa2]                           dc.w $0000
[000d3fa4]                           dc.w $0000
[000d3fa6]                           dc.w $0000
[000d3fa8]                           dc.w $0000
[000d3faa]                           dc.w $0053
[000d3fac]                           dc.b 'T-GUIDE',0
proto:
[000d3fb4]                           dc.w $0000
[000d3fb6]                           dc.w $0000
[000d3fb8]                           dc.w $0000
[000d3fba]                           dc.w $0000
[000d3fbc]                           dc.b 'Datei ”ffnen',0
[000d3fc9]                           dc.b $00
[000d3fca]                           dc.w $0000
[000d3fcc]                           dc.w $0000
[000d3fce]                           dc.w $0000
[000d3fd0]                           dc.w $0000
[000d3fd2]                           dc.w $0000
[000d3fd4]                           dc.w $0000
[000d3fd6]                           dc.w $0000
[000d3fd8]                           dc.w $0000
[000d3fda]                           dc.w $0000
[000d3fdc]                           dc.b 'Datei hinzufgen',0
[000d3fed]                           dc.b $00
[000d3fee]                           dc.w $0000
[000d3ff0]                           dc.w $0000
[000d3ff2]                           dc.w $0000
[000d3ff4]                           dc.w $0000
[000d3ff6]                           dc.w $0000
[000d3ff8]                           dc.w $0000
[000d3ffa]                           dc.w $0000
[000d3ffc]                           dc.b 'Datei sichern',0
[000d400a]                           dc.w $0000
[000d400c]                           dc.w $0000
[000d400e]                           dc.w $0000
[000d4010]                           dc.w $0000
[000d4012]                           dc.w $0000
[000d4014]                           dc.w $0000
[000d4016]                           dc.w $0000
[000d4018]                           dc.w $0000
[000d401a]                           dc.w $0000
[000d401c]                           dc.b ' %s (EDITOR) ',0
[000d402a]                           dc.w $0000
[000d402c]                           dc.w $0000
[000d402e]                           dc.w $0000
[000d4030]                           dc.w $0000
[000d4032]                           dc.w $0000
[000d4034]                           dc.w $0000
[000d4036]                           dc.w $0000
[000d4038]                           dc.w $0000
[000d403a]                           dc.w $0000
[000d403c]                           dc.b ' * %s (EDITOR) ',0
[000d404c]                           dc.w $0000
[000d404e]                           dc.w $0000
[000d4050]                           dc.w $0000
[000d4052]                           dc.w $0000
[000d4054]                           dc.w $0000
[000d4056]                           dc.w $0000
[000d4058]                           dc.w $0000
[000d405a]                           dc.w $0000
[000d405c]                           dc.w $0000
[000d405e]                           dc.w $0000
[000d4060]                           dc.w $0000
[000d4062]                           dc.w $0000
[000d4064]                           dc.w $0000
[000d4066]                           dc.w $0000
[000d4068]                           dc.w $0000
[000d406a]                           dc.w $0000
[000d406c]                           dc.w $0000
[000d406e]                           dc.w $0000
[000d4070]                           dc.w $0000
[000d4072]                           dc.w $0000
[000d4074]                           dc.w $0000
[000d4076]                           dc.w $0000
[000d4078]                           dc.w $0000
[000d407a]                           dc.w $0000
[000d407c]                           dc.w $0000
[000d407e]                           dc.w $ffff
[000d4080]                           dc.w $ffff
[000d4082]                           dc.w $ffff
[000d4084]                           dc.w $ffff
[000d4086]                           dc.w $0000
[000d4088]                           dc.w $0000
[000d408a]                           dc.w $0000
[000d408c]                           dc.w $0000
[000d408e]                           dc.w $0000
[000d4090]                           dc.w $0000
[000d4092]                           dc.w $0000
[000d4094]                           dc.w $0000
[000d4096]                           dc.w $0000
[000d4098]                           dc.w $0000
[000d409a]                           dc.w $0000
[000d409c]                           dc.w $0000
[000d409e]                           dc.w $0000
[000d40a0]                           dc.w $0000
[000d40a2]                           dc.w $0000
[000d40a4]                           dc.w $0000
[000d40a6]                           dc.w $0000
[000d40a8]                           dc.w $0000
[000d40aa]                           dc.w $0000
[000d40ac]                           dc.w $0000
[000d40ae]                           dc.w $0000
[000d40b0]                           dc.w $0000
[000d40b2]                           dc.w $0000
[000d40b4]                           dc.w $0000
[000d40b6]                           dc.w $0000
[000d40b8]                           dc.w $0000
[000d40ba]                           dc.w $0000
[000d40bc]                           dc.w $0000
[000d40be]                           dc.w $0000
[000d40c0]                           dc.w $0000
[000d40c2]                           dc.w $0000
[000d40c4]                           dc.w $0000
[000d40c6]                           dc.w $0000
[000d40c8]                           dc.w $0000
[000d40ca]                           dc.w $0000
[000d40cc]                           dc.w $0000
[000d40ce]                           dc.w $0000
[000d40d0]                           dc.w $0000
[000d40d2]                           dc.w $0000
[000d40d4]                           dc.w $0000
[000d40d6]                           dc.w $0000
[000d40d8]                           dc.w $0000
[000d40da]                           dc.w $0000
[000d40dc]                           dc.w $0000
[000d40de]                           dc.w $0000
[000d40e0]                           dc.w $0000
[000d40e2]                           dc.w $0000
[000d40e4]                           dc.w $0000
[000d40e6]                           dc.w $0000
[000d40e8]                           dc.w $0000
[000d40ea]                           dc.w $0000
[000d40ec]                           dc.w $0000
[000d40ee]                           dc.w $0000
[000d40f0]                           dc.w $0000
[000d40f2]                           dc.w $0000
[000d40f4]                           dc.w $0000
[000d40f6]                           dc.w $0000
[000d40f8]                           dc.w $0000
[000d40fa]                           dc.w $0000
[000d40fc]                           dc.w $0000
[000d40fe]                           dc.w $0000
[000d4100]                           dc.w $0000
[000d4102]                           dc.w $0000
[000d4104]                           dc.w $0000
[000d4106]                           dc.w $0000
[000d4108]                           dc.w $0000
[000d410a]                           dc.w $0000
[000d410c]                           dc.w $0000
[000d410e]                           dc.w $0000
[000d4110]                           dc.w $0000
[000d4112]                           dc.w $0000
[000d4114]                           dc.w $0000
[000d4116]                           dc.w $0000
[000d4118]                           dc.w $0000
[000d411a]                           dc.w $0000
[000d411c]                           dc.w $0000
[000d411e]                           dc.w $0000
[000d4120]                           dc.w $0000
[000d4122]                           dc.w $0000
[000d4124]                           dc.w $0000
[000d4126]                           dc.w $0000
[000d4128]                           dc.w $0000
[000d412a]                           dc.w $0000
[000d412c]                           dc.w $0000
[000d412e]                           dc.w $0000
[000d4130]                           dc.w $0000
[000d4132]                           dc.w $0000
[000d4134]                           dc.w $0000
[000d4136]                           dc.w $0000
[000d4138]                           dc.w $0000
[000d413a]                           dc.w $0000
[000d413c]                           dc.w $0000
[000d413e]                           dc.w $0000
[000d4140]                           dc.w $0000
[000d4142]                           dc.w $0000
[000d4144]                           dc.w $0000
[000d4146]                           dc.w $0000
[000d4148]                           dc.w $0000
[000d414a]                           dc.w $0000
[000d414c]                           dc.w $0000
[000d414e]                           dc.w $0000
[000d4150]                           dc.w $0000
[000d4152]                           dc.w $0000
[000d4154]                           dc.w $0000
[000d4156]                           dc.w $0000
[000d4158]                           dc.w $0000
[000d415a]                           dc.w $0000
[000d415c]                           dc.w $0000
[000d415e]                           dc.w $0000
[000d4160]                           dc.w $0000
[000d4162]                           dc.w $0000
[000d4164]                           dc.w $0000
[000d4166]                           dc.w $0000
[000d4168]                           dc.w $0000
[000d416a]                           dc.w $0000
[000d416c]                           dc.w $0000
[000d416e]                           dc.w $0000
[000d4170]                           dc.w $0000
[000d4172]                           dc.w $0000
[000d4174]                           dc.w $0000
[000d4176]                           dc.w $0000
[000d4178]                           dc.w $0000
[000d417a]                           dc.w $0000
[000d417c]                           dc.w $0000
[000d417e]                           dc.w $0000
[000d4180]                           dc.w $0000
[000d4182]                           dc.w $0000
[000d4184]                           dc.w $0000
[000d4186]                           dc.w $0000
[000d4188]                           dc.w $0000
[000d418a]                           dc.w $0000
[000d418c]                           dc.w $0000
[000d418e]                           dc.w $0000
[000d4190]                           dc.w $0000
[000d4192]                           dc.w $0000
[000d4194]                           dc.w $0000
[000d4196]                           dc.w $0000
[000d4198]                           dc.w $0000
[000d419a]                           dc.w $0000
[000d419c]                           dc.w $0000
[000d419e]                           dc.w $0000
[000d41a0]                           dc.w $0000
[000d41a2]                           dc.w $0000
[000d41a4]                           dc.w $0000
[000d41a6]                           dc.w $0000
[000d41a8]                           dc.w $0000
[000d41aa]                           dc.w $0000
[000d41ac]                           dc.w $0000
[000d41ae]                           dc.w $0000
[000d41b0]                           dc.w $0000
[000d41b2]                           dc.w $0000
[000d41b4]                           dc.w $0000
[000d41b6]                           dc.w $0000
[000d41b8]                           dc.w $0000
[000d41ba]                           dc.w $0000
[000d41bc]                           dc.w $0000
[000d41be]                           dc.w $0000
[000d41c0]                           dc.w $0000
[000d41c2]                           dc.w $0000
[000d41c4]                           dc.w $0000
[000d41c6]                           dc.w $0000
[000d41c8]                           dc.w $0000
[000d41ca]                           dc.w $0000
[000d41cc]                           dc.w $0000
[000d41ce]                           dc.w $0000
[000d41d0]                           dc.w $0000
[000d41d2]                           dc.w $0000
[000d41d4]                           dc.w $0000
[000d41d6]                           dc.w $0000
[000d41d8]                           dc.w $0000
[000d41da]                           dc.w $0000
[000d41dc]                           dc.w $0000
[000d41de]                           dc.w $0000
[000d41e0]                           dc.w $0000
[000d41e2]                           dc.w $0000
[000d41e4]                           dc.w $0000
[000d41e6]                           dc.w $0000
[000d41e8]                           dc.w $0000
[000d41ea]                           dc.w $0000
[000d41ec]                           dc.w $0000
[000d41ee]                           dc.w $0000
[000d41f0]                           dc.w $0000
[000d41f2]                           dc.w $0000
[000d41f4]                           dc.w $0000
[000d41f6]                           dc.w $0000
[000d41f8]                           dc.w $0000
[000d41fa]                           dc.w $0000
[000d41fc]                           dc.w $0000
[000d41fe]                           dc.w $0000
[000d4200]                           dc.w $0000
[000d4202]                           dc.w $0000
[000d4204]                           dc.w $0000
[000d4206]                           dc.w $0000
[000d4208]                           dc.w $0000
[000d420a]                           dc.w $0000
[000d420c]                           dc.w $0000
[000d420e]                           dc.w $0000
[000d4210]                           dc.w $0000
[000d4212]                           dc.w $0000
[000d4214]                           dc.w $0000
[000d4216]                           dc.w $0000
[000d4218]                           dc.w $0000
[000d421a]                           dc.w $0000
[000d421c]                           dc.w $0000
[000d421e]                           dc.w $0000
[000d4220]                           dc.w $0000
[000d4222]                           dc.w $0000
[000d4224]                           dc.w $0000
[000d4226]                           dc.w $0000
[000d4228]                           dc.w $0000
[000d422a]                           dc.w $0000
[000d422c]                           dc.w $0000
[000d422e]                           dc.w $0000
[000d4230]                           dc.w $0000
[000d4232]                           dc.w $0000
[000d4234]                           dc.w $0000
[000d4236]                           dc.w $0000
[000d4238]                           dc.w $0000
[000d423a]                           dc.w $0000
[000d423c]                           dc.w $0000
[000d423e]                           dc.w $0000
[000d4240]                           dc.w $0000
[000d4242]                           dc.w $0000
[000d4244]                           dc.w $0000
[000d4246]                           dc.w $0000
[000d4248]                           dc.w $0000
[000d424a]                           dc.w $0000
[000d424c]                           dc.w $0000
[000d424e]                           dc.w $0000
[000d4250]                           dc.w $0000
[000d4252]                           dc.w $0000
[000d4254]                           dc.w $0000
[000d4256]                           dc.w $0000
[000d4258]                           dc.w $0000
[000d425a]                           dc.w $0000
[000d425c]                           dc.w $0000
[000d425e]                           dc.w $0000
[000d4260]                           dc.w $0000
[000d4262]                           dc.w $0000
[000d4264]                           dc.w $0000
[000d4266]                           dc.w $0000
[000d4268]                           dc.w $0000
[000d426a]                           dc.w $0000
[000d426c]                           dc.w $0000
[000d426e]                           dc.w $0000
[000d4270]                           dc.w $0000
[000d4272]                           dc.w $0000
[000d4274]                           dc.w $0000
[000d4276]                           dc.w $0000
[000d4278]                           dc.w $0000
[000d427a]                           dc.w $0000
[000d427c]                           dc.w $0000
[000d427e]                           dc.w $0000
[000d4280]                           dc.w $0000
[000d4282]                           dc.w $0000
[000d4284]                           dc.w $0000
[000d4286]                           dc.w $0000
[000d4288]                           dc.w $0000
[000d428a]                           dc.w $0000
[000d428c]                           dc.w $0000
[000d428e]                           dc.w $0000
[000d4290]                           dc.w $0000
[000d4292]                           dc.w $0000
[000d4294]                           dc.w $0000
[000d4296]                           dc.w $0000
[000d4298]                           dc.w $0000
[000d429a]                           dc.w $0000
[000d429c]                           dc.w $0000
[000d429e]                           dc.w $0000
[000d42a0]                           dc.w $0000
[000d42a2]                           dc.w $0000
[000d42a4]                           dc.w $0000
[000d42a6]                           dc.w $0000
[000d42a8]                           dc.w $0000
[000d42aa]                           dc.w $0000
[000d42ac]                           dc.w $0000
[000d42ae]                           dc.w $0000
[000d42b0]                           dc.w $0000
[000d42b2]                           dc.w $0000
[000d42b4]                           dc.w $0000
[000d42b6]                           dc.w $0000
[000d42b8]                           dc.w $0000
[000d42ba]                           dc.w $0000
[000d42bc]                           dc.w $0000
[000d42be]                           dc.w $0000
[000d42c0]                           dc.w $0000
[000d42c2]                           dc.w $0000
[000d42c4]                           dc.w $0000
[000d42c6]                           dc.w $0000
[000d42c8]                           dc.w $0000
[000d42ca]                           dc.w $0000
[000d42cc]                           dc.w $0000
[000d42ce]                           dc.w $0000
[000d42d0]                           dc.w $0000
[000d42d2]                           dc.w $0000
[000d42d4]                           dc.w $0000
[000d42d6]                           dc.w $0000
[000d42d8]                           dc.w $0000
[000d42da]                           dc.w $0000
[000d42dc]                           dc.w $0000
[000d42de]                           dc.w $0000
[000d42e0]                           dc.w $0000
[000d42e2]                           dc.w $0000
[000d42e4]                           dc.w $0000
[000d42e6]                           dc.w $0000
[000d42e8]                           dc.w $0000
[000d42ea]                           dc.w $0000
[000d42ec]                           dc.w $0000
[000d42ee]                           dc.w $0000
[000d42f0]                           dc.w $0000
[000d42f2]                           dc.w $0000
[000d42f4]                           dc.w $0000
[000d42f6]                           dc.w $0000
[000d42f8]                           dc.w $0000
[000d42fa]                           dc.w $0000
[000d42fc]                           dc.w $0000
[000d42fe]                           dc.w $0000
[000d4300]                           dc.w $0000
[000d4302]                           dc.w $0000
[000d4304]                           dc.w $0000
[000d4306]                           dc.w $0000
[000d4308]                           dc.w $0000
[000d430a]                           dc.w $0000
[000d430c]                           dc.w $0000
[000d430e]                           dc.w $0000
[000d4310]                           dc.w $0000
[000d4312]                           dc.w $0000
[000d4314]                           dc.w $0000
[000d4316]                           dc.w $0000
[000d4318]                           dc.w $0000
[000d431a]                           dc.w $0000
[000d431c]                           dc.w $0000
[000d431e]                           dc.w $0000
[000d4320]                           dc.w $0000
[000d4322]                           dc.w $0000
[000d4324]                           dc.w $0000
[000d4326]                           dc.w $0000
[000d4328]                           dc.w $0000
[000d432a]                           dc.w $0000
[000d432c]                           dc.w $0000
[000d432e]                           dc.w $0000
[000d4330]                           dc.w $0000
[000d4332]                           dc.w $0000
[000d4334]                           dc.w $0000
[000d4336]                           dc.w $0000
[000d4338]                           dc.w $0000
[000d433a]                           dc.w $0000
[000d433c]                           dc.w $0000
[000d433e]                           dc.w $0000
[000d4340]                           dc.w $0000
[000d4342]                           dc.w $0000
[000d4344]                           dc.w $0000
[000d4346]                           dc.w $0000
[000d4348]                           dc.w $0000
[000d434a]                           dc.w $0000
[000d434c]                           dc.w $0000
[000d434e]                           dc.w $0000
[000d4350]                           dc.w $0000
[000d4352]                           dc.w $0000
[000d4354]                           dc.w $0000
[000d4356]                           dc.w $0000
[000d4358]                           dc.w $0000
[000d435a]                           dc.w $0000
[000d435c]                           dc.w $0000
[000d435e]                           dc.w $0000
[000d4360]                           dc.w $0000
[000d4362]                           dc.w $0000
[000d4364]                           dc.w $0000
[000d4366]                           dc.w $0000
[000d4368]                           dc.w $0000
[000d436a]                           dc.w $0000
[000d436c]                           dc.w $0000
[000d436e]                           dc.w $0000
[000d4370]                           dc.w $0000
[000d4372]                           dc.w $0000
[000d4374]                           dc.w $0000
[000d4376]                           dc.w $0000
[000d4378]                           dc.w $0000
[000d437a]                           dc.w $0000
[000d437c]                           dc.w $0000
[000d437e]                           dc.w $0000
[000d4380]                           dc.w $0000
[000d4382]                           dc.w $0000
[000d4384]                           dc.w $0000
[000d4386]                           dc.w $0000
[000d4388]                           dc.w $0000
[000d438a]                           dc.w $0000
[000d438c]                           dc.w $0000
[000d438e]                           dc.w $0000
[000d4390]                           dc.w $0000
[000d4392]                           dc.w $0000
[000d4394]                           dc.w $0000
[000d4396]                           dc.w $0000
[000d4398]                           dc.w $0000
[000d439a]                           dc.w $0000
[000d439c]                           dc.w $0000
[000d439e]                           dc.w $0000
[000d43a0]                           dc.w $0000
[000d43a2]                           dc.w $0000
[000d43a4]                           dc.w $0000
[000d43a6]                           dc.w $0000
[000d43a8]                           dc.w $0000
[000d43aa]                           dc.w $0000
[000d43ac]                           dc.w $0000
[000d43ae]                           dc.w $0000
[000d43b0]                           dc.w $0000
[000d43b2]                           dc.w $0000
[000d43b4]                           dc.w $0000
[000d43b6]                           dc.w $0000
[000d43b8]                           dc.w $0000
[000d43ba]                           dc.w $0000
[000d43bc]                           dc.w $0000
[000d43be]                           dc.w $0000
[000d43c0]                           dc.w $0000
[000d43c2]                           dc.w $0000
[000d43c4]                           dc.w $0000
[000d43c6]                           dc.w $0000
[000d43c8]                           dc.w $0000
[000d43ca]                           dc.w $0000
[000d43cc]                           dc.w $0000
[000d43ce]                           dc.w $0000
[000d43d0]                           dc.w $0000
[000d43d2]                           dc.w $0000
[000d43d4]                           dc.w $0000
[000d43d6]                           dc.w $0000
[000d43d8]                           dc.w $0000
[000d43da]                           dc.w $0000
[000d43dc]                           dc.w $0000
[000d43de]                           dc.w $0000
[000d43e0]                           dc.w $0000
[000d43e2]                           dc.w $0000
[000d43e4]                           dc.w $0000
[000d43e6]                           dc.w $0000
[000d43e8]                           dc.w $0000
[000d43ea]                           dc.w $0000
[000d43ec]                           dc.w $0000
[000d43ee]                           dc.w $0000
[000d43f0]                           dc.w $0000
[000d43f2]                           dc.w $0000
[000d43f4]                           dc.w $0000
[000d43f6]                           dc.w $0000
[000d43f8]                           dc.w $0000
[000d43fa]                           dc.w $0000
[000d43fc]                           dc.w $0000
[000d43fe]                           dc.w $0000
[000d4400]                           dc.w $0000
[000d4402]                           dc.w $0000
[000d4404]                           dc.w $0000
[000d4406]                           dc.w $0000
[000d4408]                           dc.w $0000
[000d440a]                           dc.w $0000
[000d440c]                           dc.w $0000
[000d440e]                           dc.w $0000
[000d4410]                           dc.w $0000
[000d4412]                           dc.w $0000
[000d4414]                           dc.w $0000
[000d4416]                           dc.w $0000
[000d4418]                           dc.w $0000
[000d441a]                           dc.w $0000
[000d441c]                           dc.w $0000
[000d441e]                           dc.w $0000
[000d4420]                           dc.w $0000
[000d4422]                           dc.w $0000
[000d4424]                           dc.w $0000
[000d4426]                           dc.w $0000
[000d4428]                           dc.w $0000
[000d442a]                           dc.w $0000
[000d442c]                           dc.w $0000
[000d442e]                           dc.w $0000
[000d4430]                           dc.w $0000
[000d4432]                           dc.w $0000
[000d4434]                           dc.w $0000
[000d4436]                           dc.w $0000
[000d4438]                           dc.w $0000
[000d443a]                           dc.w $0000
[000d443c]                           dc.w $0000
[000d443e]                           dc.w $0000
[000d4440]                           dc.w $0000
[000d4442]                           dc.w $0000
[000d4444]                           dc.w $0000
[000d4446]                           dc.w $0000
[000d4448]                           dc.w $0000
[000d444a]                           dc.w $0000
[000d444c]                           dc.w $0000
[000d444e]                           dc.w $0000
[000d4450]                           dc.w $0000
[000d4452]                           dc.w $0000
[000d4454]                           dc.w $0000
[000d4456]                           dc.w $0000
[000d4458]                           dc.w $0000
[000d445a]                           dc.w $0000
[000d445c]                           dc.w $0000
[000d445e]                           dc.w $0000
[000d4460]                           dc.w $0000
[000d4462]                           dc.w $0000
[000d4464]                           dc.w $0000
[000d4466]                           dc.w $0000
[000d4468]                           dc.w $0000
[000d446a]                           dc.w $0000
[000d446c]                           dc.w $0000
[000d446e]                           dc.w $0000
[000d4470]                           dc.w $0000
[000d4472]                           dc.w $0000
[000d4474]                           dc.w $0000
[000d4476]                           dc.w $0000
[000d4478]                           dc.w $0000
[000d447a]                           dc.w $0000
[000d447c]                           dc.w $0000
[000d447e]                           dc.w $0000
[000d4480]                           dc.w $0000
[000d4482]                           dc.w $0000
[000d4484]                           dc.w $0000
[000d4486]                           dc.w $0000
[000d4488]                           dc.w $0000
[000d448a]                           dc.w $0000
[000d448c]                           dc.w $0000
[000d448e]                           dc.w $0000
[000d4490]                           dc.w $0000
[000d4492]                           dc.w $0000
[000d4494]                           dc.w $0000
[000d4496]                           dc.w $0000
[000d4498]                           dc.w $0000
[000d449a]                           dc.w $0000
[000d449c]                           dc.w $0000
[000d449e]                           dc.w $0000
[000d44a0]                           dc.w $0000
[000d44a2]                           dc.w $0000
[000d44a4]                           dc.w $0000
[000d44a6]                           dc.w $0000
[000d44a8]                           dc.w $0000
[000d44aa]                           dc.w $0000
[000d44ac]                           dc.w $0000
[000d44ae]                           dc.w $0000
[000d44b0]                           dc.w $0000
[000d44b2]                           dc.w $0000
[000d44b4]                           dc.w $0000
[000d44b6]                           dc.w $0000
[000d44b8]                           dc.w $0000
[000d44ba]                           dc.w $0000
[000d44bc]                           dc.w $0000
[000d44be]                           dc.w $0000
[000d44c0]                           dc.w $0000
[000d44c2]                           dc.w $0000
[000d44c4]                           dc.w $0000
[000d44c6]                           dc.w $0000
[000d44c8]                           dc.w $0000
[000d44ca]                           dc.w $0000
[000d44cc]                           dc.w $0000
[000d44ce]                           dc.w $0000
[000d44d0]                           dc.w $0000
[000d44d2]                           dc.w $0000
[000d44d4]                           dc.w $0000
[000d44d6]                           dc.w $0000
[000d44d8]                           dc.w $0000
[000d44da]                           dc.w $0000
[000d44dc]                           dc.w $0000
[000d44de]                           dc.w $0000
[000d44e0]                           dc.w $0000
[000d44e2]                           dc.w $0000
[000d44e4]                           dc.w $0000
[000d44e6]                           dc.w $0000
[000d44e8]                           dc.w $0000
[000d44ea]                           dc.w $0000
[000d44ec]                           dc.w $0000
[000d44ee]                           dc.w $0000
[000d44f0]                           dc.w $0000
[000d44f2]                           dc.w $0000
[000d44f4]                           dc.w $0000
[000d44f6]                           dc.w $0000
[000d44f8]                           dc.w $0000
[000d44fa]                           dc.w $0000
[000d44fc]                           dc.w $0000
[000d44fe]                           dc.w $0000
[000d4500]                           dc.w $0000
[000d4502]                           dc.w $0000
[000d4504]                           dc.w $0000
[000d4506]                           dc.w $0000
[000d4508]                           dc.w $0000
[000d450a]                           dc.w $0000
[000d450c]                           dc.w $0000
[000d450e]                           dc.w $0000
[000d4510]                           dc.w $0000
[000d4512]                           dc.w $0000
[000d4514]                           dc.w $0000
[000d4516]                           dc.w $0000
[000d4518]                           dc.w $0000
[000d451a]                           dc.w $0000
[000d451c]                           dc.w $0000
[000d451e]                           dc.w $0000
[000d4520]                           dc.w $0000
[000d4522]                           dc.w $0000
[000d4524]                           dc.w $0000
[000d4526]                           dc.w $0000
[000d4528]                           dc.w $0000
[000d452a]                           dc.w $0000
[000d452c]                           dc.w $0000
[000d452e]                           dc.w $0000
[000d4530]                           dc.w $0000
[000d4532]                           dc.w $0000
[000d4534]                           dc.w $0000
[000d4536]                           dc.w $0000
[000d4538]                           dc.w $0000
[000d453a]                           dc.w $0000
[000d453c]                           dc.w $0000
[000d453e]                           dc.w $0000
[000d4540]                           dc.w $0000
[000d4542]                           dc.w $0000
[000d4544]                           dc.w $0000
[000d4546]                           dc.w $0000
[000d4548]                           dc.w $0000
[000d454a]                           dc.w $0000
[000d454c]                           dc.w $0000
[000d454e]                           dc.w $0000
[000d4550]                           dc.w $0000
[000d4552]                           dc.w $0000
[000d4554]                           dc.w $0000
[000d4556]                           dc.w $0000
[000d4558]                           dc.w $0000
[000d455a]                           dc.w $0000
[000d455c]                           dc.w $0000
[000d455e]                           dc.w $0000
[000d4560]                           dc.w $0000
[000d4562]                           dc.w $0000
[000d4564]                           dc.w $0000
[000d4566]                           dc.w $0000
[000d4568]                           dc.w $0000
[000d456a]                           dc.w $0000
[000d456c]                           dc.w $0000
[000d456e]                           dc.w $0000
[000d4570]                           dc.w $0000
[000d4572]                           dc.w $0000
[000d4574]                           dc.w $0000
[000d4576]                           dc.w $0000
[000d4578]                           dc.w $0000
[000d457a]                           dc.w $0000
[000d457c]                           dc.w $0000
[000d457e]                           dc.w $0000
[000d4580]                           dc.w $0000
[000d4582]                           dc.w $0000
[000d4584]                           dc.w $0000
[000d4586]                           dc.w $0000
[000d4588]                           dc.w $0000
[000d458a]                           dc.w $0000
[000d458c]                           dc.w $0000
[000d458e]                           dc.w $0000
[000d4590]                           dc.w $0000
[000d4592]                           dc.w $0000
[000d4594]                           dc.w $0000
[000d4596]                           dc.w $0000
[000d4598]                           dc.w $0000
[000d459a]                           dc.w $0000
[000d459c]                           dc.w $0000
[000d459e]                           dc.w $0000
[000d45a0]                           dc.w $0000
[000d45a2]                           dc.w $0000
[000d45a4]                           dc.w $0000
[000d45a6]                           dc.w $0000
[000d45a8]                           dc.w $0000
[000d45aa]                           dc.w $0000
[000d45ac]                           dc.w $0000
[000d45ae]                           dc.w $0000
[000d45b0]                           dc.w $0000
[000d45b2]                           dc.w $0000
[000d45b4]                           dc.w $0000
[000d45b6]                           dc.w $0000
[000d45b8]                           dc.w $0000
[000d45ba]                           dc.w $0000
[000d45bc]                           dc.w $0000
[000d45be]                           dc.w $0000
[000d45c0]                           dc.w $0000
[000d45c2]                           dc.w $0000
[000d45c4]                           dc.w $0000
[000d45c6]                           dc.w $0000
[000d45c8]                           dc.w $0000
[000d45ca]                           dc.w $0000
[000d45cc]                           dc.w $0000
[000d45ce]                           dc.w $0000
[000d45d0]                           dc.w $0000
[000d45d2]                           dc.w $0000
[000d45d4]                           dc.w $0000
[000d45d6]                           dc.w $0000
[000d45d8]                           dc.w $0000
[000d45da]                           dc.w $0000
[000d45dc]                           dc.w $0000
[000d45de]                           dc.w $0000
[000d45e0]                           dc.w $0000
[000d45e2]                           dc.w $0000
[000d45e4]                           dc.w $0000
[000d45e6]                           dc.w $0000
[000d45e8]                           dc.w $0000
[000d45ea]                           dc.w $0000
[000d45ec]                           dc.w $0000
[000d45ee]                           dc.w $0000
[000d45f0]                           dc.w $0000
[000d45f2]                           dc.w $0000
[000d45f4]                           dc.w $0000
[000d45f6]                           dc.w $0000
[000d45f8]                           dc.w $0000
[000d45fa]                           dc.w $0000
[000d45fc]                           dc.w $0000
[000d45fe]                           dc.w $0000
[000d4600]                           dc.w $0000
[000d4602]                           dc.w $0000
[000d4604]                           dc.w $0000
[000d4606]                           dc.w $0000
[000d4608]                           dc.w $0000
[000d460a]                           dc.w $0000
[000d460c]                           dc.w $0000
[000d460e]                           dc.w $0000
[000d4610]                           dc.w $0000
[000d4612]                           dc.w $0000
[000d4614]                           dc.w $0000
[000d4616]                           dc.w $0000
[000d4618]                           dc.w $0000
[000d461a]                           dc.w $0000
[000d461c]                           dc.w $0000
[000d461e]                           dc.w $0000
[000d4620]                           dc.w $0000
[000d4622]                           dc.w $0000
[000d4624]                           dc.w $0000
[000d4626]                           dc.w $0000
[000d4628]                           dc.w $0000
[000d462a]                           dc.w $0000
[000d462c]                           dc.w $0000
[000d462e]                           dc.w $0000
[000d4630]                           dc.w $0000
[000d4632]                           dc.w $0000
[000d4634]                           dc.w $0000
[000d4636]                           dc.w $0000
[000d4638]                           dc.w $0000
[000d463a]                           dc.w $0000
[000d463c]                           dc.w $0000
[000d463e]                           dc.w $0000
[000d4640]                           dc.w $0000
[000d4642]                           dc.w $0000
[000d4644]                           dc.w $0000
[000d4646]                           dc.w $0000
[000d4648]                           dc.w $0000
[000d464a]                           dc.w $0000
[000d464c]                           dc.w $0000
[000d464e]                           dc.w $0000
[000d4650]                           dc.w $0000
[000d4652]                           dc.w $0000
ins:
[000d4654]                           dc.w $6100
text1:
[000d4656] 000d4654                  dc.l ins
text2:
[000d465a] 000d49e2                  dc.l $000d49e2
[000d465e] 000d49e2                  dc.l $000d49e2
subins:
[000d4662]                           dc.w $0000
[000d4664]                           dc.w $0000
[000d4666]                           dc.w $0000
[000d4668]                           dc.w $0000
[000d466a]                           dc.w $0000
[000d466c]                           dc.w $0000
[000d466e]                           dc.w $0000
[000d4670]                           dc.w $0000
[000d4672]                           dc.w $0000
[000d4674]                           dc.w $0001
[000d4676] 000d4656                  dc.l text1
subcr:
[000d467a]                           dc.w $0000
[000d467c]                           dc.w $0000
[000d467e]                           dc.w $0000
[000d4680]                           dc.w $0000
[000d4682]                           dc.w $0000
[000d4684]                           dc.w $0000
[000d4686]                           dc.w $0000
[000d4688]                           dc.w $0000
[000d468a]                           dc.w $0000
[000d468c]                           dc.w $0002
[000d468e] 000d465a                  dc.l text2
subdel:
[000d4692]                           dc.w $0000
[000d4694]                           dc.w $0000
[000d4696]                           dc.w $0000
[000d4698]                           dc.w $0000
[000d469a]                           dc.w $0000
[000d469c]                           dc.w $0000
[000d469e]                           dc.w $0000
[000d46a0]                           dc.w $0000
[000d46a2]                           dc.w $0000
[000d46a4]                           dc.w $0001
[000d46a6] 000d465a                  dc.l text2
Apaste_rows:
[000d46aa]                           dc.w $0000
[000d46ac]                           dc.w $0000
Apaste_text:
[000d46ae]                           dc.w $0000
[000d46b0]                           dc.w $0000
editors:
[000d46b2]                           dc.w $0000
euser:
[000d46b4] 00037bfa                  dc.l A_editor
[000d46b8]                           dc.w $0000
[000d46ba]                           dc.w $0000
[000d46bc] 0003a772                  dc.l Auo_editor
[000d46c0]                           dc.w $0000
[000d46c2]                           dc.w $0000
[000d46c4]                           dc.w $0000
[000d46c6]                           dc.w $0000
[000d46c8]                           dc.w $0000
[000d46ca]                           dc.w $0000
[000d46cc]                           dc.w $0000
[000d46ce]                           dc.w $0000
[000d46d0]                           dc.w $0000
[000d46d2]                           dc.w $0000
vslider:
[000d46d4] 00037828                  dc.l A_wislider
[000d46d8]                           dc.w $0000
[000d46da]                           dc.w $0001
[000d46dc] 00037834                  dc.l Auo_wislider
[000d46e0]                           dc.w $0000
[000d46e2]                           dc.w $0000
[000d46e4]                           dc.w $0000
[000d46e6]                           dc.w $0000
[000d46e8]                           dc.w $0000
[000d46ea]                           dc.w $0000
[000d46ec]                           dc.w $0000
[000d46ee]                           dc.w $0000
[000d46f0]                           dc.w $0000
[000d46f2]                           dc.w $0000
hslider:
[000d46f4] 00037828                  dc.l A_wislider
[000d46f8]                           dc.w $0000
[000d46fa]                           dc.w $0000
[000d46fc] 00037834                  dc.l Auo_wislider
[000d4700]                           dc.w $0000
[000d4702]                           dc.w $0000
[000d4704]                           dc.w $0000
[000d4706]                           dc.w $0000
[000d4708]                           dc.w $0000
[000d470a]                           dc.w $0000
[000d470c]                           dc.w $0000
[000d470e]                           dc.w $0000
[000d4710]                           dc.w $0000
[000d4712]                           dc.w $0000
eselect:
[000d4714] 000661d6                  dc.l A_select
[000d4718]                           dc.w $0000
[000d471a]                           dc.w $0000
[000d471c]                           dc.w $0000
[000d471e]                           dc.w $0000
[000d4720]                           dc.w $0000
[000d4722]                           dc.w $0000
[000d4724]                           dc.w $0000
[000d4726]                           dc.w $0000
[000d4728]                           dc.w $0000
[000d472a]                           dc.w $0000
[000d472c]                           dc.w $0000
[000d472e]                           dc.w $0000
[000d4730]                           dc.w $0000
[000d4732]                           dc.w $0000
edit:
[000d4734]                           dc.w $ffff
[000d4736]                           dc.w $0002
[000d4738]                           dc.w $0002
[000d473a]                           dc.w $0018
[000d473c]                           dc.w $1840
[000d473e]                           dc.w $0000
[000d4740] 000d46b4                  dc.l euser
[000d4744]                           dc.w $0000
[000d4746]                           dc.w $0000
[000d4748]                           dc.w $0028
[000d474a]                           dc.w $000a
edit0:
[000d474c] 0004039c                  dc.l sel_edit
[000d4750] 00040544                  dc.l ins_string
[000d4754]                           dc.w $8000
[000d4756]                           dc.w $0000
[000d4758]                           dc.w $0000
[000d475a]                           dc.w $0000
[000d475c]                           dc.w $0000
[000d475e]                           dc.w $0000
[000d4760]                           dc.w $0000
[000d4762]                           dc.w $0000
drag:
[000d4764]                           dc.w $0000
[000d4766]                           dc.w $ffff
[000d4768]                           dc.w $ffff
[000d476a]                           dc.w $0018
[000d476c]                           dc.w $20c0
[000d476e]                           dc.w $0000
[000d4770] 000d4714                  dc.l eselect
[000d4774]                           dc.w $0000
[000d4776]                           dc.w $0000
[000d4778]                           dc.w $0000
[000d477a]                           dc.w $0000
drag0:
[000d477c]                           dc.w $0000
[000d477e]                           dc.w $0000
[000d4780]                           dc.w $0000
[000d4782]                           dc.w $0000
[000d4784]                           dc.w $8000
[000d4786]                           dc.w $0000
[000d4788]                           dc.w $0000
[000d478a]                           dc.w $0000
[000d478c]                           dc.w $0000
[000d478e]                           dc.w $0000
[000d4790]                           dc.w $0000
[000d4792]                           dc.w $0000
hor:
[000d4794]                           dc.w $ffff
[000d4796]                           dc.w $ffff
[000d4798]                           dc.w $ffff
[000d479a]                           dc.w $0018
[000d479c]                           dc.w $0000
[000d479e]                           dc.w $0000
[000d47a0] 000d46f4                  dc.l hslider
[000d47a4]                           dc.w $0000
[000d47a6]                           dc.w $0000
[000d47a8]                           dc.w $0000
[000d47aa]                           dc.w $0000
ver:
[000d47ac]                           dc.w $ffff
[000d47ae]                           dc.w $ffff
[000d47b0]                           dc.w $ffff
[000d47b2]                           dc.w $0018
[000d47b4]                           dc.w $0020
[000d47b6]                           dc.w $0000
[000d47b8] 000d46d4                  dc.l vslider
[000d47bc]                           dc.w $0000
[000d47be]                           dc.w $0000
[000d47c0]                           dc.w $0000
[000d47c2]                           dc.w $0000
c_swap:
[000d47c4]                           dc.w $6162
[000d47c6]                           dc.w $0000
tsw:
[000d47c8] 000d47c4                  dc.l c_swap
subswap:
[000d47cc]                           dc.w $0000
[000d47ce]                           dc.w $0000
[000d47d0]                           dc.w $0000
[000d47d2]                           dc.w $0000
[000d47d4]                           dc.w $0000
[000d47d6]                           dc.w $0000
[000d47d8]                           dc.w $0000
[000d47da]                           dc.w $0000
[000d47dc]                           dc.w $0000
[000d47de]                           dc.w $0001
[000d47e0] 000d47c8                  dc.l tsw
t:
[000d47e4] 000d49e2                  dc.l $000d49e2
[000d47e8] 000d49e2                  dc.l $000d49e2
subs:
[000d47ec]                           dc.w $0000
[000d47ee]                           dc.w $0000
[000d47f0]                           dc.w $0000
[000d47f2]                           dc.w $0000
[000d47f4]                           dc.w $0000
[000d47f6]                           dc.w $0000
[000d47f8]                           dc.w $0000
[000d47fa]                           dc.w $0000
[000d47fc]                           dc.w $0000
[000d47fe]                           dc.w $0002
[000d4800] 000d47e4                  dc.l t
[000d4804]                           dc.w $0000
[000d4806]                           dc.w $0000
[000d4808]                           dc.w $0000
[000d480a]                           dc.w $0000
[000d480c]                           dc.w $0000
[000d480e]                           dc.w $0000
[000d4810]                           dc.w $0000
[000d4812]                           dc.w $0000
[000d4814]                           dc.w $0000
[000d4816]                           dc.w $0000
[000d4818]                           dc.w $0000
[000d481a]                           dc.w $0000
[000d481c]                           dc.w $0000
[000d481e]                           dc.w $0000
[000d4820]                           dc.w $0000
[000d4822]                           dc.w $0000
[000d4824]                           dc.w $0000
[000d4826]                           dc.w $0000
[000d4828]                           dc.w $0000
[000d482a]                           dc.w $0000
[000d482c]                           dc.w $0000
[000d482e]                           dc.w $0000
[000d4830]                           dc.w $0000
[000d4832]                           dc.w $0000
[000d4834]                           dc.w $0000
[000d4836]                           dc.w $0000
[000d4838]                           dc.w $0000
[000d483a]                           dc.w $0000
[000d483c]                           dc.w $0000
[000d483e]                           dc.w $0000
[000d4840]                           dc.w $0000
[000d4842]                           dc.w $0000
[000d4844]                           dc.w $0000
[000d4846]                           dc.w $0000
[000d4848]                           dc.w $0000
[000d484a]                           dc.w $0000
[000d484c]                           dc.w $0000
[000d484e]                           dc.w $0000
[000d4850]                           dc.w $0000
[000d4852]                           dc.w $0000
[000d4854]                           dc.w $0000
[000d4856]                           dc.w $0000
[000d4858]                           dc.w $0000
[000d485a]                           dc.w $0000
[000d485c]                           dc.w $0000
[000d485e]                           dc.w $0000
[000d4860]                           dc.w $0000
[000d4862]                           dc.w $0000
[000d4864]                           dc.w $0000
[000d4866]                           dc.w $0000
[000d4868]                           dc.w $0000
[000d486a]                           dc.w $0000
[000d486c]                           dc.w $0000
[000d486e]                           dc.w $0000
[000d4870]                           dc.w $0000
[000d4872]                           dc.w $0000
[000d4874]                           dc.w $0000
[000d4876]                           dc.w $0000
[000d4878]                           dc.w $0000
[000d487a]                           dc.w $0000
[000d487c]                           dc.w $0000
[000d487e]                           dc.w $0000
[000d4880]                           dc.w $0000
[000d4882]                           dc.w $0000
[000d4884]                           dc.w $0000
[000d4886]                           dc.w $0000
[000d4888]                           dc.w $0000
[000d488a]                           dc.w $0000
[000d488c]                           dc.w $0000
[000d488e]                           dc.w $0000
[000d4890]                           dc.w $0000
[000d4892]                           dc.w $0000
[000d4894]                           dc.w $0000
[000d4896]                           dc.w $0000
[000d4898]                           dc.w $0000
[000d489a]                           dc.w $0000
[000d489c]                           dc.w $0000
[000d489e]                           dc.w $0000
[000d48a0]                           dc.w $0000
[000d48a2]                           dc.w $0000
[000d48a4]                           dc.w $0000
[000d48a6]                           dc.w $0000
[000d48a8]                           dc.w $0000
[000d48aa]                           dc.w $0000
[000d48ac]                           dc.w $0000
[000d48ae]                           dc.w $0000
[000d48b0]                           dc.w $0000
[000d48b2]                           dc.w $0000
[000d48b4]                           dc.w $0000
[000d48b6]                           dc.w $0000
[000d48b8]                           dc.w $0000
[000d48ba]                           dc.w $0000
[000d48bc]                           dc.w $0000
[000d48be]                           dc.w $0000
[000d48c0]                           dc.w $0000
[000d48c2]                           dc.w $0000
[000d48c4]                           dc.w $0000
[000d48c6]                           dc.w $0000
[000d48c8]                           dc.w $0000
[000d48ca]                           dc.w $0000
[000d48cc]                           dc.w $0000
[000d48ce]                           dc.w $0000
[000d48d0]                           dc.w $0000
[000d48d2]                           dc.w $0000
[000d48d4]                           dc.w $0000
[000d48d6]                           dc.w $0000
[000d48d8]                           dc.w $0000
[000d48da]                           dc.w $0000
[000d48dc]                           dc.w $0000
[000d48de]                           dc.w $0000
[000d48e0]                           dc.w $0000
[000d48e2]                           dc.w $0000
[000d48e4]                           dc.w $0000
[000d48e6]                           dc.w $0000
[000d48e8]                           dc.w $0000
[000d48ea]                           dc.w $0000
[000d48ec]                           dc.w $0000
[000d48ee]                           dc.w $0000
[000d48f0]                           dc.w $0000
[000d48f2]                           dc.w $0000
[000d48f4]                           dc.w $0000
[000d48f6]                           dc.w $0000
[000d48f8]                           dc.w $0000
[000d48fa]                           dc.w $0000
[000d48fc]                           dc.w $0000
[000d48fe]                           dc.w $0000
[000d4900]                           dc.w $0000
[000d4902]                           dc.w $0000
[000d4904]                           dc.w $0000
[000d4906] 000d4a45                  dc.l $000d4a45
[000d490a] 000d4a49                  dc.l $000d4a49
[000d490e] 000d4a4d                  dc.l $000d4a4d
[000d4912] 000d4a51                  dc.l $000d4a51
[000d4916] 000d4a55                  dc.l $000d4a55
[000d491a] 000d4a59                  dc.l $000d4a59
[000d491e] 000d4a5d                  dc.l $000d4a5d
[000d4922] 000d4a61                  dc.l $000d4a61
[000d4926] 000d4a65                  dc.l $000d4a65
[000d492a] 000d4a69                  dc.l $000d4a69
[000d492e]                           dc.w $0000
[000d4930]                           dc.w $0000
[000d4932]                           dc.w $0000
[000d4934]                           dc.w $0000
[000d4936]                           dc.w $0000
[000d4938]                           dc.w $0000
[000d493a]                           dc.w $0000
[000d493c]                           dc.w $0000
[000d493e]                           dc.w $0000
[000d4940]                           dc.w $0000
[000d4942]                           dc.w $0000
[000d4944]                           dc.w $0000
[000d4946]                           dc.w $0000
[000d4948]                           dc.w $0000
[000d494a]                           dc.w $0000
[000d494c]                           dc.w $0000
[000d494e]                           dc.w $0000
[000d4950]                           dc.w $0000
[000d4952]                           dc.w $0000
[000d4954]                           dc.w $0000
[000d4956]                           dc.w $0000
[000d4958]                           dc.w $0000
[000d495a]                           dc.w $0000
[000d495c]                           dc.w $0000
[000d495e]                           dc.w $0000
[000d4960]                           dc.w $0000
[000d4962]                           dc.w $0000
[000d4964]                           dc.w $0000
[000d4966]                           dc.w $0000
[000d4968]                           dc.w $0000
[000d496a]                           dc.w $0000
[000d496c]                           dc.w $0000
[000d496e]                           dc.w $0000
[000d4970]                           dc.w $0000
[000d4972]                           dc.w $0000
[000d4974]                           dc.w $0000
[000d4976]                           dc.w $0000
[000d4978]                           dc.w $0000
[000d497a]                           dc.w $0000
[000d497c]                           dc.w $0000
[000d497e]                           dc.w $0000
[000d4980]                           dc.w $0000
[000d4982]                           dc.w $0000
[000d4984]                           dc.w $0000
[000d4986]                           dc.w $0000
[000d4988]                           dc.w $0000
[000d498a]                           dc.w $0000
[000d498c]                           dc.w $0000
[000d498e]                           dc.w $0000
[000d4990]                           dc.w $0000
[000d4992]                           dc.w $0000
[000d4994]                           dc.w $0000
[000d4996]                           dc.w $0000
[000d4998]                           dc.w $0000
[000d499a]                           dc.w $0000
[000d499c]                           dc.w $0000
[000d499e]                           dc.w $0000
[000d49a0]                           dc.w $0000
[000d49a2]                           dc.w $0000
[000d49a4]                           dc.w $0000
[000d49a6]                           dc.w $0000
[000d49a8]                           dc.w $0000
[000d49aa]                           dc.w $0000
[000d49ac]                           dc.w $0000
[000d49ae]                           dc.w $0000
[000d49b0]                           dc.w $0000
[000d49b2]                           dc.w $0000
[000d49b4]                           dc.w $0000
[000d49b6]                           dc.w $0000
[000d49b8]                           dc.w $0000
[000d49ba]                           dc.w $0000
[000d49bc]                           dc.w $0000
[000d49be]                           dc.w $0000
[000d49c0]                           dc.w $0102
[000d49c2] 000406ce                  dc.l acc_fkey
[000d49c6] 00040752                  dc.l comp_fkey
[000d49ca] 000407aa                  dc.l drag_fkey
[000d49ce] 000407d4                  dc.l edit_fkey
[000d49d2] 000408cc                  dc.l key_fkey
[000d49d6] 0004093a                  dc.l mess_fkey
[000d49da] 00040976                  dc.l print_fkey
[000d49de] 000409ee                  dc.l term_fkey
[000d49e2]                           dc.w $0009
[000d49e4]                           dc.w $0020
[000d49e6]                           dc.b 'Keine Klammer.',0
[000d49f5]                           dc.b ' %2ld,%2ld / %2ld,%2ld',0
[000d4a0c]                           dc.b 'EDITOR',0
[000d4a13]                           dc.b 'Schrift',0
[000d4a1b]                           dc.b '%ld',0
[000d4a1f]                           dc.b ' Neue Datei.',0
[000d4a2c]                           dc.w $0d0a
[000d4a2e]                           dc.w $002e
[000d4a30]                           dc.b '$$$',0
[000d4a34]                           dc.w $2564
[000d4a36]                           dc.w $0025
[000d4a38]                           dc.w $3264
[000d4a3a]                           dc.w $0073
[000d4a3c]                           dc.b 'crap.txt',0
[000d4a45]                           dc.b 'F 1',0
[000d4a49]                           dc.b 'F 2',0
[000d4a4d]                           dc.b 'F 3',0
[000d4a51]                           dc.b 'F 4',0
[000d4a55]                           dc.b 'F 5',0
[000d4a59]                           dc.b 'F 6',0
[000d4a5d]                           dc.b 'F 7',0
[000d4a61]                           dc.b 'F 8',0
[000d4a65]                           dc.b 'F 9',0
[000d4a69]                           dc.b 'F10',0
[000d4a6d]                           dc.b $20
[000d4a6e]                           dc.w $2000
[000d4a70]                           dc.b '%s:%-0.*s',0

