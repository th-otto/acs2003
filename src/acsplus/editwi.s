set_icon:
[0003cc76] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003cc7a] 594f                      subq.w     #4,a7
[0003cc7c] 2e88                      move.l     a0,(a7)
[0003cc7e] 2668 005a                 movea.l    90(a0),a3
[0003cc82] 200b                      move.l     a3,d0
[0003cc84] 6700 0078                 beq.w      $0003CCFE
[0003cc88] 2850                      movea.l    (a0),a4
[0003cc8a] 102c 00a8                 move.b     168(a4),d0
[0003cc8e] 6706                      beq.s      $0003CC96
[0003cc90] 4bec 00a8                 lea.l      168(a4),a5
[0003cc94] 601a                      bra.s      $0003CCB0
[0003cc96] 45ec 0192                 lea.l      402(a4),a2
[0003cc9a] 705c                      moveq.l    #92,d0
[0003cc9c] 204a                      movea.l    a2,a0
[0003cc9e] 4eb9 0008 2e9e            jsr        strrchr
[0003cca4] 2a48                      movea.l    a0,a5
[0003cca6] 200d                      move.l     a5,d0
[0003cca8] 6704                      beq.s      $0003CCAE
[0003ccaa] 524d                      addq.w     #1,a5
[0003ccac] 6002                      bra.s      $0003CCB0
[0003ccae] 2a4a                      movea.l    a2,a5
[0003ccb0] 43ec 00b8                 lea.l      184(a4),a1
[0003ccb4] 204d                      movea.l    a5,a0
[0003ccb6] 4eb9 0008 2eba            jsr        strcmp
[0003ccbc] 4a40                      tst.w      d0
[0003ccbe] 673e                      beq.s      $0003CCFE
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
[0003cd64] 6708                      beq.s      $0003CD6E
[0003cd66] 0068 0001 000a            ori.w      #$0001,10(a0)
[0003cd6c] 4e75                      rts
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
[0003cdce] 663c                      bne.s      $0003CE0C
[0003cdd0] 43d7                      lea.l      (a7),a1
[0003cdd2] 206a 0014                 movea.l    20(a2),a0
[0003cdd6] 303c 00fa                 move.w     #$00FA,d0
[0003cdda] 4eb9 0003 a772            jsr        Auo_editor
[0003cde0] 3017                      move.w     (a7),d0
[0003cde2] 6728                      beq.s      $0003CE0C
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
[0003ce54] 6000 0d98                 bra        $0003DBEE
[0003ce58] 302f 024c                 move.w     588(a7),d0
[0003ce5c] 6a00 0b82                 bpl        $0003D9E0
[0003ce60] 122f 024d                 move.b     589(a7),d1
[0003ce64] 4881                      ext.w      d1
[0003ce66] b27c 0079                 cmp.w      #$0079,d1
[0003ce6a] 6200 0b6e                 bhi        $0003D9DA
[0003ce6e] d241                      add.w      d1,d1
[0003ce70] 323b 1006                 move.w     $0003CE78(pc,d1.w),d1
[0003ce74] 4efb 1002                 jmp        $0003CE78(pc,d1.w)
J30:
[0003ce78] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ce7a] 0276                      dc.w $0276   ; $0003d0ee-$0003ce78
[0003ce7c] 02aa                      dc.w $02aa   ; $0003d122-$0003ce78
[0003ce7e] 0446                      dc.w $0446   ; $0003d2be-$0003ce78
[0003ce80] 02e0                      dc.w $02e0   ; $0003d158-$0003ce78
[0003ce82] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ce84] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ce86] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ce88] 07a6                      dc.w $07a6   ; $0003d61e-$0003ce78
[0003ce8a] 0a0e                      dc.w $0a0e   ; $0003d886-$0003ce78
[0003ce8c] 0906                      dc.w $0906   ; $0003d77e-$0003ce78
[0003ce8e] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ce90] 05fa                      dc.w $05fa   ; $0003d472-$0003ce78
[0003ce92] 0906                      dc.w $0906   ; $0003d77e-$0003ce78
[0003ce94] 010a                      dc.w $010a   ; $0003cf82-$0003ce78
[0003ce96] 00f4                      dc.w $00f4   ; $0003cf6c-$0003ce78
[0003ce98] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003ce9a] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003ce9c] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003ce9e] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003cea0] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003cea2] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003cea4] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003cea6] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003cea8] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003ceaa] 0aee                      dc.w $0aee   ; $0003d966-$0003ce78
[0003ceac] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceae] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceb0] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceb2] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceb4] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceb6] 0626                      dc.w $0626   ; $0003d49e-$0003ce78
[0003ceb8] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceba] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cebc] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cebe] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cec0] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cec2] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cec4] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cec6] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cec8] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceca] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cecc] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cece] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ced0] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ced2] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ced4] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ced6] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ced8] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceda] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cedc] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cede] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cee0] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cee2] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cee4] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cee6] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cee8] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceea] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceec] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003ceee] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cef0] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cef2] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cef4] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cef6] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cef8] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cefa] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cefc] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cefe] 0ac2                      dc.w $0ac2   ; $0003d93a-$0003ce78
[0003cf00] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf02] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf04] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf06] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf08] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf0a] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf0c] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf0e] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf10] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf12] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf14] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf16] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf18] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf1a] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf1c] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf1e] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf20] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf22] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf24] 0ad8                      dc.w $0ad8   ; $0003d950-$0003ce78
[0003cf26] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf28] 0aac                      dc.w $0aac   ; $0003d924-$0003ce78
[0003cf2a] 0a96                      dc.w $0a96   ; $0003d90e-$0003ce78
[0003cf2c] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf2e] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf30] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf32] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf34] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf36] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf38] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf3a] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf3c] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf3e] 0ac2                      dc.w $0ac2   ; $0003d93a-$0003ce78
[0003cf40] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf42] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf44] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf46] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf48] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf4a] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf4c] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf4e] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf50] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf52] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf54] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf56] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf58] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf5a] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf5c] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf5e] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf60] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf62] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf64] 0ad8                      dc.w $0ad8   ; $0003d950-$0003ce78
[0003cf66] 0b62                      dc.w $0b62   ; $0003d9da-$0003ce78
[0003cf68] 0aac                      dc.w $0aac   ; $0003d924-$0003ce78
[0003cf6a] 0a96                      dc.w $0a96   ; $0003d90e-$0003ce78
[0003cf6c] 93c9                      suba.l     a1,a1
[0003cf6e] 303c 00eb                 move.w     #$00EB,d0
[0003cf72] 204b                      movea.l    a3,a0
[0003cf74] 4e95                      jsr        (a5)
[0003cf76] 93c9                      suba.l     a1,a1
[0003cf78] 7005                      moveq.l    #5,d0
[0003cf7a] 204b                      movea.l    a3,a0
[0003cf7c] 4e95                      jsr        (a5)
[0003cf7e] 6000 0c58                 bra        $0003DBD8
[0003cf82] 43ef 021c                 lea.l      540(a7),a1
[0003cf86] 303c 00e3                 move.w     #$00E3,d0
[0003cf8a] 204b                      movea.l    a3,a0
[0003cf8c] 4e95                      jsr        (a5)
[0003cf8e] 202f 021c                 move.l     540(a7),d0
[0003cf92] 6a00 009c                 bpl        $0003D030
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
[0003cfd6] 601c                      bra.s      $0003CFF4
[0003cfd8] 2212                      move.l     (a2),d1
[0003cfda] 206f 0008                 movea.l    8(a7),a0
[0003cfde] 1030 1800                 move.b     0(a0,d1.l),d0
[0003cfe2] 4880                      ext.w      d0
[0003cfe4] 206f 0010                 movea.l    16(a7),a0
[0003cfe8] 4eb9 0008 2e8a            jsr        strchr
[0003cfee] 2008                      move.l     a0,d0
[0003cff0] 6606                      bne.s      $0003CFF8
[0003cff2] 5392                      subq.l     #1,(a2)
[0003cff4] 2012                      move.l     (a2),d0
[0003cff6] 6ae0                      bpl.s      $0003CFD8
[0003cff8] 7001                      moveq.l    #1,d0
[0003cffa] d092                      add.l      (a2),d0
[0003cffc] 2f40 0220                 move.l     d0,544(a7)
[0003d000] 24af 0234                 move.l     564(a7),(a2)
[0003d004] 601c                      bra.s      $0003D022
[0003d006] 2212                      move.l     (a2),d1
[0003d008] 206f 0008                 movea.l    8(a7),a0
[0003d00c] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d010] 4880                      ext.w      d0
[0003d012] 206f 0010                 movea.l    16(a7),a0
[0003d016] 4eb9 0008 2e8a            jsr        strchr
[0003d01c] 2008                      move.l     a0,d0
[0003d01e] 660a                      bne.s      $0003D02A
[0003d020] 5292                      addq.l     #1,(a2)
[0003d022] 2012                      move.l     (a2),d0
[0003d024] b0af 0004                 cmp.l      4(a7),d0
[0003d028] 6ddc                      blt.s      $0003D006
[0003d02a] 2f52 0228                 move.l     (a2),552(a7)
[0003d02e] 602c                      bra.s      $0003D05C
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
[0003d050] 670a                      beq.s      $0003D05C
[0003d052] 2f40 0224                 move.l     d0,548(a7)
[0003d056] 2f6f 0004 0228            move.l     4(a7),552(a7)
[0003d05c] 202f 0228                 move.l     552(a7),d0
[0003d060] b0af 0220                 cmp.l      544(a7),d0
[0003d064] 6f00 0974                 ble        $0003D9DA
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
[0003d0b6] 6716                      beq.s      $0003D0CE
[0003d0b8] 43ef 0014                 lea.l      20(a7),a1
[0003d0bc] 2040                      movea.l    d0,a0
[0003d0be] 2840                      movea.l    d0,a4
[0003d0c0] 286c 0004                 movea.l    4(a4),a4
[0003d0c4] 303c 03e9                 move.w     #$03E9,d0
[0003d0c8] 4e94                      jsr        (a4)
[0003d0ca] 6000 0b0c                 bra        $0003DBD8
[0003d0ce] 42a7                      clr.l      -(a7)
[0003d0d0] 43ef 0019                 lea.l      25(a7),a1
[0003d0d4] 206f 0244                 movea.l    580(a7),a0
[0003d0d8] 41e8 0697                 lea.l      1687(a0),a0
[0003d0dc] 4eb9 0006 24f6            jsr        Aev_AcHelp
[0003d0e2] 584f                      addq.w     #4,a7
[0003d0e4] 5340                      subq.w     #1,d0
[0003d0e6] 6700 0af0                 beq        $0003DBD8
[0003d0ea] 6000 08ee                 bra        $0003D9DA
[0003d0ee] 43ef 021c                 lea.l      540(a7),a1
[0003d0f2] 303c 00e3                 move.w     #$00E3,d0
[0003d0f6] 204b                      movea.l    a3,a0
[0003d0f8] 4e95                      jsr        (a5)
[0003d0fa] 202f 021c                 move.l     540(a7),d0
[0003d0fe] 6a6a                      bpl.s      $0003D16A
[0003d100] 322f 024c                 move.w     588(a7),d1
[0003d104] c27c 0300                 and.w      #$0300,d1
[0003d108] 670c                      beq.s      $0003D116
[0003d10a] 93c9                      suba.l     a1,a1
[0003d10c] 204b                      movea.l    a3,a0
[0003d10e] 700d                      moveq.l    #13,d0
[0003d110] 4e95                      jsr        (a5)
[0003d112] 6000 0ac4                 bra        $0003DBD8
[0003d116] 93c9                      suba.l     a1,a1
[0003d118] 700b                      moveq.l    #11,d0
[0003d11a] 204b                      movea.l    a3,a0
[0003d11c] 4e95                      jsr        (a5)
[0003d11e] 6000 0ab8                 bra        $0003DBD8
[0003d122] 43ef 021c                 lea.l      540(a7),a1
[0003d126] 303c 00e3                 move.w     #$00E3,d0
[0003d12a] 204b                      movea.l    a3,a0
[0003d12c] 4e95                      jsr        (a5)
[0003d12e] 202f 021c                 move.l     540(a7),d0
[0003d132] 6a00 019c                 bpl        $0003D2D0
[0003d136] 322f 024c                 move.w     588(a7),d1
[0003d13a] c27c 0300                 and.w      #$0300,d1
[0003d13e] 670c                      beq.s      $0003D14C
[0003d140] 93c9                      suba.l     a1,a1
[0003d142] 204b                      movea.l    a3,a0
[0003d144] 700c                      moveq.l    #12,d0
[0003d146] 4e95                      jsr        (a5)
[0003d148] 6000 0a8e                 bra        $0003DBD8
[0003d14c] 93c9                      suba.l     a1,a1
[0003d14e] 700a                      moveq.l    #10,d0
[0003d150] 204b                      movea.l    a3,a0
[0003d152] 4e95                      jsr        (a5)
[0003d154] 6000 0a82                 bra        $0003DBD8
[0003d158] 43ef 021c                 lea.l      540(a7),a1
[0003d15c] 303c 00e3                 move.w     #$00E3,d0
[0003d160] 204b                      movea.l    a3,a0
[0003d162] 4e95                      jsr        (a5)
[0003d164] 202f 021c                 move.l     540(a7),d0
[0003d168] 6b24                      bmi.s      $0003D18E
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
[0003d18a] 6000 0a4c                 bra        $0003DBD8
[0003d18e] 302f 024c                 move.w     588(a7),d0
[0003d192] c07c 0400                 and.w      #$0400,d0
[0003d196] 6700 00c6                 beq        $0003D25E
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
[0003d1c0] 6626                      bne.s      $0003D1E8
[0003d1c2] 222f 0238                 move.l     568(a7),d1
[0003d1c6] 6700 0a10                 beq        $0003DBD8
[0003d1ca] 53af 0238                 subq.l     #1,568(a7)
[0003d1ce] 43ef 0238                 lea.l      568(a7),a1
[0003d1d2] 204b                      movea.l    a3,a0
[0003d1d4] 7011                      moveq.l    #17,d0
[0003d1d6] 4e95                      jsr        (a5)
[0003d1d8] 43ef 0234                 lea.l      564(a7),a1
[0003d1dc] 303c 00e8                 move.w     #$00E8,d0
[0003d1e0] 204b                      movea.l    a3,a0
[0003d1e2] 4e95                      jsr        (a5)
[0003d1e4] 6000 024a                 bra        $0003D430
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
[0003d20a] 6040                      bra.s      $0003D24C
[0003d20c] 2212                      move.l     (a2),d1
[0003d20e] 206f 0008                 movea.l    8(a7),a0
[0003d212] 1030 18ff                 move.b     -1(a0,d1.l),d0
[0003d216] 4880                      ext.w      d0
[0003d218] 206f 0010                 movea.l    16(a7),a0
[0003d21c] 4eb9 0008 2e8a            jsr        strchr
[0003d222] 2008                      move.l     a0,d0
[0003d224] 6624                      bne.s      $0003D24A
[0003d226] 601c                      bra.s      $0003D244
[0003d228] 2212                      move.l     (a2),d1
[0003d22a] 206f 0008                 movea.l    8(a7),a0
[0003d22e] 1030 18ff                 move.b     -1(a0,d1.l),d0
[0003d232] 4880                      ext.w      d0
[0003d234] 206f 0010                 movea.l    16(a7),a0
[0003d238] 4eb9 0008 2e8a            jsr        strchr
[0003d23e] 2008                      move.l     a0,d0
[0003d240] 660e                      bne.s      $0003D250
[0003d242] 5392                      subq.l     #1,(a2)
[0003d244] 2012                      move.l     (a2),d0
[0003d246] 6ee0                      bgt.s      $0003D228
[0003d248] 6006                      bra.s      $0003D250
[0003d24a] 5392                      subq.l     #1,(a2)
[0003d24c] 2012                      move.l     (a2),d0
[0003d24e] 6ebc                      bgt.s      $0003D20C
[0003d250] 224a                      movea.l    a2,a1
[0003d252] 303c 00d7                 move.w     #$00D7,d0
[0003d256] 204b                      movea.l    a3,a0
[0003d258] 4e95                      jsr        (a5)
[0003d25a] 6000 097c                 bra        $0003DBD8
[0003d25e] 302f 024c                 move.w     588(a7),d0
[0003d262] c07c 0300                 and.w      #$0300,d0
[0003d266] 6710                      beq.s      $0003D278
[0003d268] 43ef 022c                 lea.l      556(a7),a1
[0003d26c] 303c 00d7                 move.w     #$00D7,d0
[0003d270] 204b                      movea.l    a3,a0
[0003d272] 4e95                      jsr        (a5)
[0003d274] 6000 0962                 bra        $0003DBD8
[0003d278] 43ef 0234                 lea.l      564(a7),a1
[0003d27c] 303c 00e7                 move.w     #$00E7,d0
[0003d280] 204b                      movea.l    a3,a0
[0003d282] 4e95                      jsr        (a5)
[0003d284] 202f 0234                 move.l     564(a7),d0
[0003d288] 6708                      beq.s      $0003D292
[0003d28a] 53af 0234                 subq.l     #1,564(a7)
[0003d28e] 6000 01a0                 bra        $0003D430
[0003d292] 43ef 0238                 lea.l      568(a7),a1
[0003d296] 303c 00d8                 move.w     #$00D8,d0
[0003d29a] 204b                      movea.l    a3,a0
[0003d29c] 4e95                      jsr        (a5)
[0003d29e] 202f 0238                 move.l     568(a7),d0
[0003d2a2] 6f00 0934                 ble        $0003DBD8
[0003d2a6] 93c9                      suba.l     a1,a1
[0003d2a8] 204b                      movea.l    a3,a0
[0003d2aa] 700b                      moveq.l    #11,d0
[0003d2ac] 4e95                      jsr        (a5)
[0003d2ae] 43ef 0230                 lea.l      560(a7),a1
[0003d2b2] 303c 00e8                 move.w     #$00E8,d0
[0003d2b6] 204b                      movea.l    a3,a0
[0003d2b8] 4e95                      jsr        (a5)
[0003d2ba] 6000 014a                 bra        $0003D406
[0003d2be] 43ef 021c                 lea.l      540(a7),a1
[0003d2c2] 303c 00e3                 move.w     #$00E3,d0
[0003d2c6] 204b                      movea.l    a3,a0
[0003d2c8] 4e95                      jsr        (a5)
[0003d2ca] 202f 021c                 move.l     540(a7),d0
[0003d2ce] 6b24                      bmi.s      $0003D2F4
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
[0003d2f0] 6000 08e6                 bra        $0003DBD8
[0003d2f4] 302f 024c                 move.w     588(a7),d0
[0003d2f8] c07c 0400                 and.w      #$0400,d0
[0003d2fc] 6700 00e8                 beq        $0003D3E6
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
[0003d342] 662e                      bne.s      $0003D372
[0003d344] 72ff                      moveq.l    #-1,d1
[0003d346] d2af 023c                 add.l      572(a7),d1
[0003d34a] 242f 0238                 move.l     568(a7),d2
[0003d34e] b481                      cmp.l      d1,d2
[0003d350] 6700 0886                 beq        $0003DBD8
[0003d354] 43ef 022c                 lea.l      556(a7),a1
[0003d358] 204b                      movea.l    a3,a0
[0003d35a] 303c 00d7                 move.w     #$00D7,d0
[0003d35e] 4e95                      jsr        (a5)
[0003d360] 52af 0238                 addq.l     #1,568(a7)
[0003d364] 43ef 0238                 lea.l      568(a7),a1
[0003d368] 7011                      moveq.l    #17,d0
[0003d36a] 204b                      movea.l    a3,a0
[0003d36c] 4e95                      jsr        (a5)
[0003d36e] 6000 0868                 bra        $0003DBD8
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
[0003d390] 6048                      bra.s      $0003D3DA
[0003d392] 2212                      move.l     (a2),d1
[0003d394] 206f 0008                 movea.l    8(a7),a0
[0003d398] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d39c] 4880                      ext.w      d0
[0003d39e] 206f 0010                 movea.l    16(a7),a0
[0003d3a2] 4eb9 0008 2e8a            jsr        strchr
[0003d3a8] 2008                      move.l     a0,d0
[0003d3aa] 672c                      beq.s      $0003D3D8
[0003d3ac] 601e                      bra.s      $0003D3CC
[0003d3ae] 2212                      move.l     (a2),d1
[0003d3b0] 206f 0008                 movea.l    8(a7),a0
[0003d3b4] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d3b8] 4880                      ext.w      d0
[0003d3ba] 206f 0010                 movea.l    16(a7),a0
[0003d3be] 4eb9 0008 2e8a            jsr        strchr
[0003d3c4] 2008                      move.l     a0,d0
[0003d3c6] 6700 fe88                 beq        $0003D250
[0003d3ca] 5292                      addq.l     #1,(a2)
[0003d3cc] 2012                      move.l     (a2),d0
[0003d3ce] b0af 0230                 cmp.l      560(a7),d0
[0003d3d2] 6dda                      blt.s      $0003D3AE
[0003d3d4] 6000 fe7a                 bra        $0003D250
[0003d3d8] 5292                      addq.l     #1,(a2)
[0003d3da] 2012                      move.l     (a2),d0
[0003d3dc] b0af 0230                 cmp.l      560(a7),d0
[0003d3e0] 6db0                      blt.s      $0003D392
[0003d3e2] 6000 fe6c                 bra        $0003D250
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
[0003d404] 6710                      beq.s      $0003D416
[0003d406] 43ef 0230                 lea.l      560(a7),a1
[0003d40a] 303c 00d7                 move.w     #$00D7,d0
[0003d40e] 204b                      movea.l    a3,a0
[0003d410] 4e95                      jsr        (a5)
[0003d412] 6000 07c4                 bra        $0003DBD8
[0003d416] 43ef 0234                 lea.l      564(a7),a1
[0003d41a] 303c 00e7                 move.w     #$00E7,d0
[0003d41e] 204b                      movea.l    a3,a0
[0003d420] 4e95                      jsr        (a5)
[0003d422] 202f 0234                 move.l     564(a7),d0
[0003d426] b0af 0230                 cmp.l      560(a7),d0
[0003d42a] 6c14                      bge.s      $0003D440
[0003d42c] 52af 0234                 addq.l     #1,564(a7)
[0003d430] 43ef 0234                 lea.l      564(a7),a1
[0003d434] 303c 00d7                 move.w     #$00D7,d0
[0003d438] 204b                      movea.l    a3,a0
[0003d43a] 4e95                      jsr        (a5)
[0003d43c] 6000 079a                 bra        $0003DBD8
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
[0003d462] 6c00 0774                 bge        $0003DBD8
[0003d466] 93c9                      suba.l     a1,a1
[0003d468] 204b                      movea.l    a3,a0
[0003d46a] 700a                      moveq.l    #10,d0
[0003d46c] 4e95                      jsr        (a5)
[0003d46e] 6000 fdf8                 bra        $0003D268
[0003d472] 93c9                      suba.l     a1,a1
[0003d474] 303c 00e2                 move.w     #$00E2,d0
[0003d478] 204b                      movea.l    a3,a0
[0003d47a] 4e95                      jsr        (a5)
[0003d47c] 302f 024c                 move.w     588(a7),d0
[0003d480] c07c 0300                 and.w      #$0300,d0
[0003d484] 670c                      beq.s      $0003D492
[0003d486] 93c9                      suba.l     a1,a1
[0003d488] 204b                      movea.l    a3,a0
[0003d48a] 700f                      moveq.l    #15,d0
[0003d48c] 4e95                      jsr        (a5)
[0003d48e] 6000 fe1e                 bra        $0003D2AE
[0003d492] 93c9                      suba.l     a1,a1
[0003d494] 700e                      moveq.l    #14,d0
[0003d496] 204b                      movea.l    a3,a0
[0003d498] 4e95                      jsr        (a5)
[0003d49a] 6000 fdcc                 bra        $0003D268
[0003d49e] 43ef 021c                 lea.l      540(a7),a1
[0003d4a2] 303c 00e3                 move.w     #$00E3,d0
[0003d4a6] 204b                      movea.l    a3,a0
[0003d4a8] 4e95                      jsr        (a5)
[0003d4aa] 202f 021c                 move.l     540(a7),d0
[0003d4ae] 6b24                      bmi.s      $0003D4D4
[0003d4b0] 23ef 021c 000d 4692       move.l     540(a7),subdel
[0003d4b8] 23ef 0220 000d 4696       move.l     544(a7),$000D4696
[0003d4c0] 23ef 0224 000d 469a       move.l     548(a7),$000D469A
[0003d4c8] 23ef 0228 000d 469e       move.l     552(a7),$000D469E
[0003d4d0] 6000 029a                 bra        $0003D76C
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
[0003d500] 6c00 00e2                 bge        $0003D5E4
[0003d504] 222f 0238                 move.l     568(a7),d1
[0003d508] 23c1 000d 469a            move.l     d1,$000D469A
[0003d50e] 23c1 000d 4692            move.l     d1,subdel
[0003d514] 23c0 000d 4696            move.l     d0,$000D4696
[0003d51a] 322f 024c                 move.w     588(a7),d1
[0003d51e] c27c 0300                 and.w      #$0300,d1
[0003d522] 670c                      beq.s      $0003D530
[0003d524] 23ef 0230 000d 469e       move.l     560(a7),$000D469E
[0003d52c] 6000 023e                 bra        $0003D76C
[0003d530] 302f 024c                 move.w     588(a7),d0
[0003d534] c07c 0400                 and.w      #$0400,d0
[0003d538] 6700 009a                 beq        $0003D5D4
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
[0003d574] 6002                      bra.s      $0003D578
[0003d576] 5292                      addq.l     #1,(a2)
[0003d578] 2012                      move.l     (a2),d0
[0003d57a] b0af 0004                 cmp.l      4(a7),d0
[0003d57e] 6c4a                      bge.s      $0003D5CA
[0003d580] 222f 000c                 move.l     12(a7),d1
[0003d584] 6720                      beq.s      $0003D5A6
[0003d586] 206f 0008                 movea.l    8(a7),a0
[0003d58a] 1030 0800                 move.b     0(a0,d0.l),d0
[0003d58e] 4880                      ext.w      d0
[0003d590] 206f 0010                 movea.l    16(a7),a0
[0003d594] 4eb9 0008 2e8a            jsr        strchr
[0003d59a] 2008                      move.l     a0,d0
[0003d59c] 6704                      beq.s      $0003D5A2
[0003d59e] 7001                      moveq.l    #1,d0
[0003d5a0] 6002                      bra.s      $0003D5A4
[0003d5a2] 4240                      clr.w      d0
[0003d5a4] 6020                      bra.s      $0003D5C6
[0003d5a6] 2212                      move.l     (a2),d1
[0003d5a8] 206f 0008                 movea.l    8(a7),a0
[0003d5ac] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d5b0] 4880                      ext.w      d0
[0003d5b2] 206f 0010                 movea.l    16(a7),a0
[0003d5b6] 4eb9 0008 2e8a            jsr        strchr
[0003d5bc] 2008                      move.l     a0,d0
[0003d5be] 6604                      bne.s      $0003D5C4
[0003d5c0] 7001                      moveq.l    #1,d0
[0003d5c2] 6002                      bra.s      $0003D5C6
[0003d5c4] 4240                      clr.w      d0
[0003d5c6] 4a40                      tst.w      d0
[0003d5c8] 66ac                      bne.s      $0003D576
[0003d5ca] 23d2 000d 469e            move.l     (a2),$000D469E
[0003d5d0] 6000 019a                 bra        $0003D76C
[0003d5d4] 7001                      moveq.l    #1,d0
[0003d5d6] d0af 0234                 add.l      564(a7),d0
[0003d5da] 23c0 000d 469e            move.l     d0,$000D469E
[0003d5e0] 6000 018a                 bra        $0003D76C
[0003d5e4] 43ef 023c                 lea.l      572(a7),a1
[0003d5e8] 303c 00e9                 move.w     #$00E9,d0
[0003d5ec] 204b                      movea.l    a3,a0
[0003d5ee] 4e95                      jsr        (a5)
[0003d5f0] 7001                      moveq.l    #1,d0
[0003d5f2] d0af 0238                 add.l      568(a7),d0
[0003d5f6] b0af 023c                 cmp.l      572(a7),d0
[0003d5fa] 6c00 05dc                 bge        $0003DBD8
[0003d5fe] 23ef 0238 000d 4692       move.l     568(a7),subdel
[0003d606] 23c0 000d 469a            move.l     d0,$000D469A
[0003d60c] 23ef 0230 000d 4696       move.l     560(a7),$000D4696
[0003d614] 42b9 000d 469e            clr.l      $000D469E
[0003d61a] 6000 0150                 bra        $0003D76C
[0003d61e] 43ef 021c                 lea.l      540(a7),a1
[0003d622] 303c 00e3                 move.w     #$00E3,d0
[0003d626] 204b                      movea.l    a3,a0
[0003d628] 4e95                      jsr        (a5)
[0003d62a] 202f 021c                 move.l     540(a7),d0
[0003d62e] 6a00 fe80                 bpl        $0003D4B0
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
[0003d65a] 6f00 00dc                 ble        $0003D738
[0003d65e] 222f 0238                 move.l     568(a7),d1
[0003d662] 23c1 000d 469a            move.l     d1,$000D469A
[0003d668] 23c1 000d 4692            move.l     d1,subdel
[0003d66e] 23c0 000d 469e            move.l     d0,$000D469E
[0003d674] 322f 024c                 move.w     588(a7),d1
[0003d678] c27c 0300                 and.w      #$0300,d1
[0003d67c] 670a                      beq.s      $0003D688
[0003d67e] 42b9 000d 4696            clr.l      $000D4696
[0003d684] 6000 00e6                 bra        $0003D76C
[0003d688] 302f 024c                 move.w     588(a7),d0
[0003d68c] c07c 0400                 and.w      #$0400,d0
[0003d690] 6700 0098                 beq        $0003D72A
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
[0003d6ce] 6002                      bra.s      $0003D6D2
[0003d6d0] 5392                      subq.l     #1,(a2)
[0003d6d2] 2012                      move.l     (a2),d0
[0003d6d4] 6b4a                      bmi.s      $0003D720
[0003d6d6] 222f 000c                 move.l     12(a7),d1
[0003d6da] 6720                      beq.s      $0003D6FC
[0003d6dc] 206f 0008                 movea.l    8(a7),a0
[0003d6e0] 1030 0800                 move.b     0(a0,d0.l),d0
[0003d6e4] 4880                      ext.w      d0
[0003d6e6] 206f 0010                 movea.l    16(a7),a0
[0003d6ea] 4eb9 0008 2e8a            jsr        strchr
[0003d6f0] 2008                      move.l     a0,d0
[0003d6f2] 6704                      beq.s      $0003D6F8
[0003d6f4] 7001                      moveq.l    #1,d0
[0003d6f6] 6002                      bra.s      $0003D6FA
[0003d6f8] 4240                      clr.w      d0
[0003d6fa] 6020                      bra.s      $0003D71C
[0003d6fc] 2212                      move.l     (a2),d1
[0003d6fe] 206f 0008                 movea.l    8(a7),a0
[0003d702] 1030 1800                 move.b     0(a0,d1.l),d0
[0003d706] 4880                      ext.w      d0
[0003d708] 206f 0010                 movea.l    16(a7),a0
[0003d70c] 4eb9 0008 2e8a            jsr        strchr
[0003d712] 2008                      move.l     a0,d0
[0003d714] 6604                      bne.s      $0003D71A
[0003d716] 7001                      moveq.l    #1,d0
[0003d718] 6002                      bra.s      $0003D71C
[0003d71a] 4240                      clr.w      d0
[0003d71c] 4a40                      tst.w      d0
[0003d71e] 66b0                      bne.s      $0003D6D0
[0003d720] 5292                      addq.l     #1,(a2)
[0003d722] 23d2 000d 4696            move.l     (a2),$000D4696
[0003d728] 6042                      bra.s      $0003D76C
[0003d72a] 70ff                      moveq.l    #-1,d0
[0003d72c] d0af 0234                 add.l      564(a7),d0
[0003d730] 23c0 000d 4696            move.l     d0,$000D4696
[0003d736] 6034                      bra.s      $0003D76C
[0003d738] 202f 0238                 move.l     568(a7),d0
[0003d73c] 6f00 049a                 ble        $0003DBD8
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
[0003d768] 6000 fea2                 bra        $0003D60C
[0003d76c] 43f9 000d 4692            lea.l      subdel,a1
[0003d772] 303c 00ea                 move.w     #$00EA,d0
[0003d776] 204b                      movea.l    a3,a0
[0003d778] 4e95                      jsr        (a5)
[0003d77a] 6000 045c                 bra        $0003DBD8
[0003d77e] 43ef 021c                 lea.l      540(a7),a1
[0003d782] 303c 00e3                 move.w     #$00E3,d0
[0003d786] 204b                      movea.l    a3,a0
[0003d788] 4e95                      jsr        (a5)
[0003d78a] 202f 021c                 move.l     540(a7),d0
[0003d78e] 6b30                      bmi.s      $0003D7C0
[0003d790] 23c0 000d 467a            move.l     d0,subcr
[0003d796] 23ef 0220 000d 467e       move.l     544(a7),$000D467E
[0003d79e] 23ef 0224 000d 4682       move.l     548(a7),$000D4682
[0003d7a6] 23ef 0228 000d 4686       move.l     552(a7),$000D4686
[0003d7ae] 43f9 000d 467a            lea.l      subcr,a1
[0003d7b4] 204b                      movea.l    a3,a0
[0003d7b6] 303c 00ea                 move.w     #$00EA,d0
[0003d7ba] 4e95                      jsr        (a5)
[0003d7bc] 6000 041a                 bra        $0003DBD8
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
[0003d816] 6010                      bra.s      $0003D828
[0003d818] 2012                      move.l     (a2),d0
[0003d81a] 206f 0008                 movea.l    8(a7),a0
[0003d81e] 0c30 0009 0800            cmpi.b     #$09,0(a0,d0.l)
[0003d824] 660a                      bne.s      $0003D830
[0003d826] 5292                      addq.l     #1,(a2)
[0003d828] 2012                      move.l     (a2),d0
[0003d82a] b0af 0004                 cmp.l      4(a7),d0
[0003d82e] 6de8                      blt.s      $0003D818
[0003d830] 2012                      move.l     (a2),d0
[0003d832] 6f00 03a4                 ble        $0003DBD8
[0003d836] b0af 0004                 cmp.l      4(a7),d0
[0003d83a] 6e00 039c                 bgt        $0003DBD8
[0003d83e] 2079 000d 4676            movea.l    $000D4676,a0
[0003d844] 2250                      movea.l    (a0),a1
[0003d846] 12bc 0009                 move.b     #$09,(a1)
[0003d84a] 7001                      moveq.l    #1,d0
[0003d84c] d0af 0238                 add.l      568(a7),d0
[0003d850] 23c0 000d 466a            move.l     d0,$000D466A
[0003d856] 23c0 000d 4662            move.l     d0,subins
[0003d85c] 7a00                      moveq.l    #0,d5
[0003d85e] 601e                      bra.s      $0003D87E
[0003d860] 23c5 000d 466e            move.l     d5,$000D466E
[0003d866] 23c5 000d 4666            move.l     d5,$000D4666
[0003d86c] 43f9 000d 4662            lea.l      subins,a1
[0003d872] 303c 00ea                 move.w     #$00EA,d0
[0003d876] 204b                      movea.l    a3,a0
[0003d878] 4e95                      jsr        (a5)
[0003d87a] 5285                      addq.l     #1,d5
[0003d87c] 5392                      subq.l     #1,(a2)
[0003d87e] 2012                      move.l     (a2),d0
[0003d880] 6ede                      bgt.s      $0003D860
[0003d882] 6000 0354                 bra        $0003DBD8
[0003d886] 43ef 021c                 lea.l      540(a7),a1
[0003d88a] 303c 00e3                 move.w     #$00E3,d0
[0003d88e] 204b                      movea.l    a3,a0
[0003d890] 4e95                      jsr        (a5)
[0003d892] 2079 000d 4676            movea.l    $000D4676,a0
[0003d898] 2250                      movea.l    (a0),a1
[0003d89a] 12af 024d                 move.b     589(a7),(a1)
[0003d89e] 202f 021c                 move.l     540(a7),d0
[0003d8a2] 6b20                      bmi.s      $0003D8C4
[0003d8a4] 23c0 000d 4662            move.l     d0,subins
[0003d8aa] 23ef 0220 000d 4666       move.l     544(a7),$000D4666
[0003d8b2] 23ef 0224 000d 466a       move.l     548(a7),$000D466A
[0003d8ba] 23ef 0228 000d 466e       move.l     552(a7),$000D466E
[0003d8c2] 6038                      bra.s      $0003D8FC
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
[0003d8fc] 43f9 000d 4662            lea.l      subins,a1
[0003d902] 303c 00ea                 move.w     #$00EA,d0
[0003d906] 204b                      movea.l    a3,a0
[0003d908] 4e95                      jsr        (a5)
[0003d90a] 6000 02cc                 bra        $0003DBD8
[0003d90e] 302f 024c                 move.w     588(a7),d0
[0003d912] c07c 0400                 and.w      #$0400,d0
[0003d916] 670c                      beq.s      $0003D924
[0003d918] 204b                      movea.l    a3,a0
[0003d91a] 4eb9 0003 de9c            jsr        cutline
[0003d920] 6000 02b6                 bra        $0003DBD8
[0003d924] 302f 024c                 move.w     588(a7),d0
[0003d928] c07c 0400                 and.w      #$0400,d0
[0003d92c] 670c                      beq.s      $0003D93A
[0003d92e] 204b                      movea.l    a3,a0
[0003d930] 4eb9 0003 de3c            jsr        cut
[0003d936] 6000 02a0                 bra        $0003DBD8
[0003d93a] 302f 024c                 move.w     588(a7),d0
[0003d93e] c07c 0400                 and.w      #$0400,d0
[0003d942] 670c                      beq.s      $0003D950
[0003d944] 204b                      movea.l    a3,a0
[0003d946] 4eb9 0003 dcd8            jsr        copy
[0003d94c] 6000 028a                 bra        $0003DBD8
[0003d950] 302f 024c                 move.w     588(a7),d0
[0003d954] c07c 0400                 and.w      #$0400,d0
[0003d958] 670c                      beq.s      $0003D966
[0003d95a] 204b                      movea.l    a3,a0
[0003d95c] 4eb9 0003 dda8            jsr        paste
[0003d962] 6000 0274                 bra        $0003DBD8
[0003d966] 1c2f 024d                 move.b     589(a7),d6
[0003d96a] 4886                      ext.w      d6
[0003d96c] dc7c fff0                 add.w      #$FFF0,d6
[0003d970] 302f 024c                 move.w     588(a7),d0
[0003d974] c07c 0400                 and.w      #$0400,d0
[0003d978] 6704                      beq.s      $0003D97E
[0003d97a] dc7c 0014                 add.w      #$0014,d6
[0003d97e] 302f 024c                 move.w     588(a7),d0
[0003d982] c07c 0300                 and.w      #$0300,d0
[0003d986] 6704                      beq.s      $0003D98C
[0003d988] dc7c 000a                 add.w      #$000A,d6
[0003d98c] 3006                      move.w     d6,d0
[0003d98e] 48c0                      ext.l      d0
[0003d990] e588                      lsl.l      #2,d0
[0003d992] 206f 0240                 movea.l    576(a7),a0
[0003d996] d1c0                      adda.l     d0,a0
[0003d998] 2228 00d2                 move.l     210(a0),d1
[0003d99c] 673c                      beq.s      $0003D9DA
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
[0003d9d6] 6000 0200                 bra        $0003DBD8
[0003d9da] 76fe                      moveq.l    #-2,d3
[0003d9dc] 6000 01fa                 bra        $0003DBD8
[0003d9e0] 0c2f 0020 024d            cmpi.b     #$20,589(a7)
[0003d9e6] 6500 01f0                 bcs        $0003DBD8
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
[0003da0e] 6b20                      bmi.s      $0003DA30
[0003da10] 23c1 000d 4662            move.l     d1,subins
[0003da16] 23ef 0220 000d 4666       move.l     544(a7),$000D4666
[0003da1e] 23ef 0224 000d 466a       move.l     548(a7),$000D466A
[0003da26] 23ef 0228 000d 466e       move.l     552(a7),$000D466E
[0003da2e] 6038                      bra.s      $0003DA68
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
[0003da68] 43f9 000d 4662            lea.l      subins,a1
[0003da6e] 303c 00ea                 move.w     #$00EA,d0
[0003da72] 204b                      movea.l    a3,a0
[0003da74] 4e95                      jsr        (a5)
[0003da76] bc7c 005d                 cmp.w      #$005D,d6
[0003da7a] 670e                      beq.s      $0003DA8A
[0003da7c] bc7c 007d                 cmp.w      #$007D,d6
[0003da80] 6708                      beq.s      $0003DA8A
[0003da82] bc7c 0029                 cmp.w      #$0029,d6
[0003da86] 6600 0150                 bne        $0003DBD8
[0003da8a] 7e01                      moveq.l    #1,d7
[0003da8c] 4244                      clr.w      d4
[0003da8e] 7aff                      moveq.l    #-1,d5
[0003da90] daaf 0234                 add.l      564(a7),d5
[0003da94] 2eaf 0238                 move.l     568(a7),(a7)
[0003da98] 6000 00bc                 bra        $0003DB56
[0003da9c] 43d7                      lea.l      (a7),a1
[0003da9e] 303c 00ca                 move.w     #$00CA,d0
[0003daa2] 204b                      movea.l    a3,a0
[0003daa4] 4e95                      jsr        (a5)
[0003daa6] 202f 0004                 move.l     4(a7),d0
[0003daaa] 206f 0008                 movea.l    8(a7),a0
[0003daae] 4230 0800                 clr.b      0(a0,d0.l)
[0003dab2] baaf 0004                 cmp.l      4(a7),d5
[0003dab6] 6c04                      bge.s      $0003DABC
[0003dab8] 2005                      move.l     d5,d0
[0003daba] 6004                      bra.s      $0003DAC0
[0003dabc] 202f 0004                 move.l     4(a7),d0
[0003dac0] 2480                      move.l     d0,(a2)
[0003dac2] 6000 007c                 bra.w      $0003DB40
[0003dac6] 2012                      move.l     (a2),d0
[0003dac8] 206f 0008                 movea.l    8(a7),a0
[0003dacc] 1230 0800                 move.b     0(a0,d0.l),d1
[0003dad0] 4881                      ext.w      d1
[0003dad2] b27c 005d                 cmp.w      #$005D,d1
[0003dad6] 672e                      beq.s      $0003DB06
[0003dad8] 6e12                      bgt.s      $0003DAEC
[0003dada] 927c 0028                 sub.w      #$0028,d1
[0003dade] 6744                      beq.s      $0003DB24
[0003dae0] 5341                      subq.w     #1,d1
[0003dae2] 6748                      beq.s      $0003DB2C
[0003dae4] 927c 0032                 sub.w      #$0032,d1
[0003dae8] 670e                      beq.s      $0003DAF8
[0003daea] 604a                      bra.s      $0003DB36
[0003daec] 927c 007b                 sub.w      #$007B,d1
[0003daf0] 6722                      beq.s      $0003DB14
[0003daf2] 5541                      subq.w     #2,d1
[0003daf4] 6726                      beq.s      $0003DB1C
[0003daf6] 603e                      bra.s      $0003DB36
[0003daf8] bc7c 005d                 cmp.w      #$005D,d6
[0003dafc] 6638                      bne.s      $0003DB36
[0003dafe] 4a44                      tst.w      d4
[0003db00] 6634                      bne.s      $0003DB36
[0003db02] 5347                      subq.w     #1,d7
[0003db04] 6030                      bra.s      $0003DB36
[0003db06] bc7c 005d                 cmp.w      #$005D,d6
[0003db0a] 662a                      bne.s      $0003DB36
[0003db0c] 4a44                      tst.w      d4
[0003db0e] 6626                      bne.s      $0003DB36
[0003db10] 5247                      addq.w     #1,d7
[0003db12] 6022                      bra.s      $0003DB36
[0003db14] bc7c 007d                 cmp.w      #$007D,d6
[0003db18] 661c                      bne.s      $0003DB36
[0003db1a] 60e2                      bra.s      $0003DAFE
[0003db1c] bc7c 007d                 cmp.w      #$007D,d6
[0003db20] 6614                      bne.s      $0003DB36
[0003db22] 60e8                      bra.s      $0003DB0C
[0003db24] bc7c 0029                 cmp.w      #$0029,d6
[0003db28] 660c                      bne.s      $0003DB36
[0003db2a] 60d2                      bra.s      $0003DAFE
[0003db2c] bc7c 0029                 cmp.w      #$0029,d6
[0003db30] 6604                      bne.s      $0003DB36
[0003db32] 4a44                      tst.w      d4
[0003db34] 67da                      beq.s      $0003DB10
[0003db36] 4a47                      tst.w      d7
[0003db38] 6604                      bne.s      $0003DB3E
[0003db3a] 4a44                      tst.w      d4
[0003db3c] 6708                      beq.s      $0003DB46
[0003db3e] 5392                      subq.l     #1,(a2)
[0003db40] 2012                      move.l     (a2),d0
[0003db42] 6a00 ff82                 bpl.w      $0003DAC6
[0003db46] 2a3c 0000 03e8            move.l     #$000003E8,d5
[0003db4c] 4a47                      tst.w      d7
[0003db4e] 6604                      bne.s      $0003DB54
[0003db50] 4a44                      tst.w      d4
[0003db52] 6708                      beq.s      $0003DB5C
[0003db54] 5397                      subq.l     #1,(a7)
[0003db56] 2017                      move.l     (a7),d0
[0003db58] 6a00 ff42                 bpl        $0003DA9C
[0003db5c] 4a47                      tst.w      d7
[0003db5e] 6668                      bne.s      $0003DBC8
[0003db60] 4a44                      tst.w      d4
[0003db62] 6664                      bne.s      $0003DBC8
[0003db64] 202f 0238                 move.l     568(a7),d0
[0003db68] b097                      cmp.l      (a7),d0
[0003db6a] 6612                      bne.s      $0003DB7E
[0003db6c] 222f 0234                 move.l     564(a7),d1
[0003db70] 206f 0008                 movea.l    8(a7),a0
[0003db74] 1f70 1801 0214            move.b     1(a0,d1.l),532(a7)
[0003db7a] 4230 1801                 clr.b      1(a0,d1.l)
[0003db7e] 701e                      moveq.l    #30,d0
[0003db80] 2f00                      move.l     d0,-(a7)
[0003db82] 2212                      move.l     (a2),d1
[0003db84] 6a04                      bpl.s      $0003DB8A
[0003db86] 7400                      moveq.l    #0,d2
[0003db88] 6002                      bra.s      $0003DB8C
[0003db8a] 2412                      move.l     (a2),d2
[0003db8c] 226f 000c                 movea.l    12(a7),a1
[0003db90] d3c2                      adda.l     d2,a1
[0003db92] 41ef 0018                 lea.l      24(a7),a0
[0003db96] 201f                      move.l     (a7)+,d0
[0003db98] 4eb9 0008 2fd6            jsr        strncpy
[0003db9e] 422f 0032                 clr.b      50(a7)
[0003dba2] 202f 0238                 move.l     568(a7),d0
[0003dba6] b097                      cmp.l      (a7),d0
[0003dba8] 660e                      bne.s      $0003DBB8
[0003dbaa] 222f 0234                 move.l     564(a7),d1
[0003dbae] 206f 0008                 movea.l    8(a7),a0
[0003dbb2] 11af 0214 1801            move.b     532(a7),1(a0,d1.l)
[0003dbb8] 43ef 0014                 lea.l      20(a7),a1
[0003dbbc] 206f 024e                 movea.l    590(a7),a0
[0003dbc0] 4eb9 0004 0696            jsr        info_string
[0003dbc6] 6010                      bra.s      $0003DBD8
[0003dbc8] 43f9 000d 49e5            lea.l      $000D49E5,a1
[0003dbce] 206f 024e                 movea.l    590(a7),a0
[0003dbd2] 4eb9 0004 0696            jsr        info_string
[0003dbd8] b67c ffff                 cmp.w      #$FFFF,d3
[0003dbdc] 6d18                      blt.s      $0003DBF6
[0003dbde] 536f 0216                 subq.w     #1,534(a7)
[0003dbe2] 6712                      beq.s      $0003DBF6
[0003dbe4] 41ef 024c                 lea.l      588(a7),a0
[0003dbe8] 4eb9 0003 dc38            jsr        next_key
[0003dbee] 102f 024d                 move.b     589(a7),d0
[0003dbf2] 6600 f264                 bne        $0003CE58
[0003dbf6] 43ef 021c                 lea.l      540(a7),a1
[0003dbfa] 303c 00e3                 move.w     #$00E3,d0
[0003dbfe] 204b                      movea.l    a3,a0
[0003dc00] 4e95                      jsr        (a5)
[0003dc02] 202f 021c                 move.l     540(a7),d0
[0003dc06] 6a0a                      bpl.s      $0003DC12
[0003dc08] 93c9                      suba.l     a1,a1
[0003dc0a] 204b                      movea.l    a3,a0
[0003dc0c] 303c 00db                 move.w     #$00DB,d0
[0003dc10] 4e95                      jsr        (a5)
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
[0003dc78] 7021                      moveq.l    #33,d0 MU_TIMER | MU_KEYBD
[0003dc7a] 4eb9 0007 9240            jsr        mt_evnt_multi
[0003dc80] 4fef 0032                 lea.l      50(a7),a7
[0003dc84] c07c 0001                 and.w      #$0001,d0
[0003dc88] 670e                      beq.s      $0003DC98
[0003dc8a] 3217                      move.w     (a7),d1
[0003dc8c] 3013                      move.w     (a3),d0
[0003dc8e] 4eb9 0004 4284            jsr        nkc_gemks2n
[0003dc94] 3680                      move.w     d0,(a3)
[0003dc96] 6002                      bra.s      $0003DC9A
[0003dc98] 4253                      clr.w      (a3)
[0003dc9a] 584f                      addq.w     #4,a7
[0003dc9c] 265f                      movea.l    (a7)+,a3
[0003dc9e] 245f                      movea.l    (a7)+,a2
[0003dca0] 4e75                      rts
paste_free:
[0003dca2] 48e7 1030                 movem.l    d3/a2-a3,-(a7)
[0003dca6] 45f9 000d 46ae            lea.l      Apaste_text,a2
[0003dcac] 262a fffc                 move.l     -4(a2),d3
[0003dcb0] 2652                      movea.l    (a2),a3
[0003dcb2] 6008                      bra.s      $0003DCBC
[0003dcb4] 205b                      movea.l    (a3)+,a0
[0003dcb6] 4eb9 0004 c6c8            jsr        Ax_ifree
[0003dcbc] 2003                      move.l     d3,d0
[0003dcbe] 5383                      subq.l     #1,d3
[0003dcc0] 4a80                      tst.l      d0
[0003dcc2] 66f0                      bne.s      $0003DCB4
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
[0003dcfa] 6b00 00a0                 bmi        $0003DD9C
[0003dcfe] 6100 ffa2                 bsr.w      paste_free
[0003dd02] 262f 0008                 move.l     8(a7),d3
[0003dd06] 9697                      sub.l      (a7),d3
[0003dd08] 5283                      addq.l     #1,d3
[0003dd0a] 2003                      move.l     d3,d0
[0003dd0c] e588                      lsl.l      #2,d0
[0003dd0e] 4eb9 0004 c608            jsr        Ax_malloc
[0003dd14] 2848                      movea.l    a0,a4
[0003dd16] 200c                      move.l     a4,d0
[0003dd18] 6700 0082                 beq        $0003DD9C
[0003dd1c] 23c3 000d 46aa            move.l     d3,Apaste_rows
[0003dd22] 23c0 000d 46ae            move.l     d0,Apaste_text
[0003dd28] 2203                      move.l     d3,d1
[0003dd2a] e589                      lsl.l      #2,d1
[0003dd2c] 4240                      clr.w      d0
[0003dd2e] 4eb9 0008 36ea            jsr        memset
[0003dd34] 2617                      move.l     (a7),d3
[0003dd36] 45ef 0010                 lea.l      16(a7),a2
[0003dd3a] 6052                      bra.s      $0003DD8E
[0003dd3c] 2483                      move.l     d3,(a2)
[0003dd3e] 224a                      movea.l    a2,a1
[0003dd40] 303c 00ca                 move.w     #$00CA,d0
[0003dd44] 206f 001c                 movea.l    28(a7),a0
[0003dd48] 4e93                      jsr        (a3)
[0003dd4a] 202a 0004                 move.l     4(a2),d0
[0003dd4e] 6f2c                      ble.s      $0003DD7C
[0003dd50] 7001                      moveq.l    #1,d0
[0003dd52] d0aa 0004                 add.l      4(a2),d0
[0003dd56] 4eb9 0004 c608            jsr        Ax_malloc
[0003dd5c] 2888                      move.l     a0,(a4)
[0003dd5e] 2008                      move.l     a0,d0
[0003dd60] 6736                      beq.s      $0003DD98
[0003dd62] 226a 0008                 movea.l    8(a2),a1
[0003dd66] 202a 0004                 move.l     4(a2),d0
[0003dd6a] 4eb9 0008 2fd6            jsr        strncpy
[0003dd70] 202a 0004                 move.l     4(a2),d0
[0003dd74] 2054                      movea.l    (a4),a0
[0003dd76] 4230 0800                 clr.b      0(a0,d0.l)
[0003dd7a] 600e                      bra.s      $0003DD8A
[0003dd7c] 41f9 000d 49e2            lea.l      $000D49E2,a0
[0003dd82] 4eb9 0004 643c            jsr        Ast_create
[0003dd88] 2888                      move.l     a0,(a4)
[0003dd8a] 584c                      addq.w     #4,a4
[0003dd8c] 5283                      addq.l     #1,d3
[0003dd8e] b6af 0008                 cmp.l      8(a7),d3
[0003dd92] 6fa8                      ble.s      $0003DD3C
[0003dd94] 4240                      clr.w      d0
[0003dd96] 6006                      bra.s      $0003DD9E
[0003dd98] 6100 ff08                 bsr        paste_free
[0003dd9c] 70ff                      moveq.l    #-1,d0
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
[0003ddc0] 6f70                      ble.s      $0003DE32
[0003ddc2] 49ef 0018                 lea.l      24(a7),a4
[0003ddc6] 2979 000d 46aa 0010       move.l     Apaste_rows,16(a4)
[0003ddce] 2979 000d 46ae 0014       move.l     Apaste_text,20(a4)
[0003ddd6] 43d7                      lea.l      (a7),a1
[0003ddd8] 303c 00e3                 move.w     #$00E3,d0
[0003dddc] 204a                      movea.l    a2,a0
[0003ddde] 4e93                      jsr        (a3)
[0003dde0] 2017                      move.l     (a7),d0
[0003dde2] 6b16                      bmi.s      $0003DDFA
[0003dde4] 2880                      move.l     d0,(a4)
[0003dde6] 296f 0004 0004            move.l     4(a7),4(a4)
[0003ddec] 296f 0008 0008            move.l     8(a7),8(a4)
[0003ddf2] 296f 000c 000c            move.l     12(a7),12(a4)
[0003ddf8] 602e                      bra.s      $0003DE28
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
[0003de28] 224c                      movea.l    a4,a1
[0003de2a] 303c 00ea                 move.w     #$00EA,d0
[0003de2e] 204a                      movea.l    a2,a0
[0003de30] 4e93                      jsr        (a3)
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
[0003de5a] 6b36                      bmi.s      $0003DE92
[0003de5c] 204a                      movea.l    a2,a0
[0003de5e] 6100 fe78                 bsr        copy
[0003de62] 4a40                      tst.w      d0
[0003de64] 662c                      bne.s      $0003DE92
[0003de66] 23d7 000d 4692            move.l     (a7),subdel
[0003de6c] 23ef 0004 000d 4696       move.l     4(a7),$000D4696
[0003de74] 23ef 0008 000d 469a       move.l     8(a7),$000D469A
[0003de7c] 23ef 000c 000d 469e       move.l     12(a7),$000D469E
[0003de84] 43f9 000d 4692            lea.l      subdel,a1
[0003de8a] 303c 00ea                 move.w     #$00EA,d0
[0003de8e] 204a                      movea.l    a2,a0
[0003de90] 4e93                      jsr        (a3)
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
[0003dede] 6c04                      bge.s      $0003DEE4
[0003dee0] 7602                      moveq.l    #2,d3
[0003dee2] 6002                      bra.s      $0003DEE6
[0003dee4] 7601                      moveq.l    #1,d3
[0003dee6] 2003                      move.l     d3,d0
[0003dee8] e588                      lsl.l      #2,d0
[0003deea] 4eb9 0004 c608            jsr        Ax_malloc
[0003def0] 2848                      movea.l    a0,a4
[0003def2] 200c                      move.l     a4,d0
[0003def4] 6700 00c0                 beq        $0003DFB6
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
[0003df22] 6f28                      ble.s      $0003DF4C
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
[0003df4a] 600e                      bra.s      $0003DF5A
[0003df4c] 41f9 000d 49e2            lea.l      $000D49E2,a0
[0003df52] 4eb9 0004 643c            jsr        Ast_create
[0003df58] 2888                      move.l     a0,(a4)
[0003df5a] 23ef 000c 000d 4692       move.l     12(a7),subdel
[0003df62] 42b9 000d 4696            clr.l      $000D4696
[0003df68] 7001                      moveq.l    #1,d0
[0003df6a] d0af 000c                 add.l      12(a7),d0
[0003df6e] b0af 0010                 cmp.l      16(a7),d0
[0003df72] 6c24                      bge.s      $0003DF98
[0003df74] 584c                      addq.w     #4,a4
[0003df76] 41f9 000d 49e2            lea.l      $000D49E2,a0
[0003df7c] 4eb9 0004 643c            jsr        Ast_create
[0003df82] 2888                      move.l     a0,(a4)
[0003df84] 7001                      moveq.l    #1,d0
[0003df86] d0af 000c                 add.l      12(a7),d0
[0003df8a] 23c0 000d 469a            move.l     d0,$000D469A
[0003df90] 42b9 000d 469e            clr.l      $000D469E
[0003df96] 6010                      bra.s      $0003DFA8
[0003df98] 23ef 000c 000d 469a       move.l     12(a7),$000D469A
[0003dfa0] 23ef 0004 000d 469e       move.l     4(a7),$000D469E
[0003dfa8] 43f9 000d 4692            lea.l      subdel,a1
[0003dfae] 303c 00ea                 move.w     #$00EA,d0
[0003dfb2] 204a                      movea.l    a2,a0
[0003dfb4] 4e93                      jsr        (a3)
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
[0003dfd4] 6724                      beq.s      $0003DFFA
[0003dfd6] 3694                      move.w     (a4),(a3)
[0003dfd8] 376c 0002 0002            move.w     2(a4),2(a3)
[0003dfde] 376c 0004 0004            move.w     4(a4),4(a3)
[0003dfe4] 376c 0006 0006            move.w     6(a4),6(a3)
[0003dfea] 224c                      movea.l    a4,a1
[0003dfec] 4eb9 0003 eb3e            jsr        edit_sized
[0003dff2] 026a fffe 0056            andi.w     #$FFFE,86(a2)
[0003dff8] 602a                      bra.s      $0003E024
[0003dffa] 3893                      move.w     (a3),(a4)
[0003dffc] 396b 0002 0002            move.w     2(a3),2(a4)
[0003e002] 396b 0004 0004            move.w     4(a3),4(a4)
[0003e008] 396b 0006 0006            move.w     6(a3),6(a4)
[0003e00e] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003e014] 5049                      addq.w     #8,a1
[0003e016] 204a                      movea.l    a2,a0
[0003e018] 4eb9 0003 eb3e            jsr        edit_sized
[0003e01e] 006a 0001 0056            ori.w      #$0001,86(a2)
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
[0003e078] b07c 0007                 cmp.w      #$0007,d0
[0003e07c] 6200 00b2                 bhi        $0003E130
[0003e080] d040                      add.w      d0,d0
[0003e082] 303b 0006                 move.w     $0003E08A(pc,d0.w),d0
[0003e086] 4efb 0002                 jmp        $0003E08A(pc,d0.w)
J31:
[0003e08a] 0038                      dc.w $0038   ; $0003e0c2-$0003e08a
[0003e08c] 004c                      dc.w $004c   ; $0003e0d6-$0003e08a
[0003e08e] 0010                      dc.w $0010   ; $0003e09a-$0003e08a
[0003e090] 0024                      dc.w $0024   ; $0003e0ae-$0003e08a
[0003e092] 0064                      dc.w $0064   ; $0003e0ee-$0003e08a
[0003e094] 0074                      dc.w $0074   ; $0003e0fe-$0003e08a
[0003e096] 0086                      dc.w $0086   ; $0003e110-$0003e08a
[0003e098] 0096                      dc.w $0096   ; $0003e120-$0003e08a
[0003e09a] 43ef 0008                 lea.l      8(a7),a1
[0003e09e] 700b                      moveq.l    #11,d0
[0003e0a0] 204c                      movea.l    a4,a0
[0003e0a2] 2a6f 0004                 movea.l    4(a7),a5
[0003e0a6] 2a6d 0008                 movea.l    8(a5),a5
[0003e0aa] 4e95                      jsr        (a5)
[0003e0ac] 603c                      bra.s      $0003E0EA
[0003e0ae] 43ef 0008                 lea.l      8(a7),a1
[0003e0b2] 700a                      moveq.l    #10,d0
[0003e0b4] 204c                      movea.l    a4,a0
[0003e0b6] 2a6f 0004                 movea.l    4(a7),a5
[0003e0ba] 2a6d 0008                 movea.l    8(a5),a5
[0003e0be] 4e95                      jsr        (a5)
[0003e0c0] 6028                      bra.s      $0003E0EA
[0003e0c2] 43ef 0008                 lea.l      8(a7),a1
[0003e0c6] 700d                      moveq.l    #13,d0
[0003e0c8] 204c                      movea.l    a4,a0
[0003e0ca] 2a6f 0004                 movea.l    4(a7),a5
[0003e0ce] 2a6d 0008                 movea.l    8(a5),a5
[0003e0d2] 4e95                      jsr        (a5)
[0003e0d4] 6012                      bra.s      $0003E0E8
[0003e0d6] 43ef 0008                 lea.l      8(a7),a1
[0003e0da] 700c                      moveq.l    #12,d0
[0003e0dc] 204c                      movea.l    a4,a0
[0003e0de] 2a6f 0004                 movea.l    4(a7),a5
[0003e0e2] 2a6d 0008                 movea.l    8(a5),a5
[0003e0e6] 4e95                      jsr        (a5)
[0003e0e8] 4243                      clr.w      d3
[0003e0ea] 7a01                      moveq.l    #1,d5
[0003e0ec] 6042                      bra.s      $0003E130
[0003e0ee] 43ef 0008                 lea.l      8(a7),a1
[0003e0f2] 700d                      moveq.l    #13,d0
[0003e0f4] 204a                      movea.l    a2,a0
[0003e0f6] 2a6b 0008                 movea.l    8(a3),a5
[0003e0fa] 4e95                      jsr        (a5)
[0003e0fc] 600e                      bra.s      $0003E10C
[0003e0fe] 43ef 0008                 lea.l      8(a7),a1
[0003e102] 700c                      moveq.l    #12,d0
[0003e104] 204a                      movea.l    a2,a0
[0003e106] 2a6b 0008                 movea.l    8(a3),a5
[0003e10a] 4e95                      jsr        (a5)
[0003e10c] 4243                      clr.w      d3
[0003e10e] 601e                      bra.s      $0003E12E
[0003e110] 43ef 0008                 lea.l      8(a7),a1
[0003e114] 700b                      moveq.l    #11,d0
[0003e116] 204a                      movea.l    a2,a0
[0003e118] 2a6b 0008                 movea.l    8(a3),a5
[0003e11c] 4e95                      jsr        (a5)
[0003e11e] 600e                      bra.s      $0003E12E
[0003e120] 43ef 0008                 lea.l      8(a7),a1
[0003e124] 700a                      moveq.l    #10,d0
[0003e126] 204a                      movea.l    a2,a0
[0003e128] 2a6b 0008                 movea.l    8(a3),a5
[0003e12c] 4e95                      jsr        (a5)
[0003e12e] 4245                      clr.w      d5
[0003e130] 4a45                      tst.w      d5
[0003e132] 672c                      beq.s      $0003E160
[0003e134] 3003                      move.w     d3,d0
[0003e136] 5343                      subq.w     #1,d3
[0003e138] 4a40                      tst.w      d0
[0003e13a] 6612                      bne.s      $0003E14E
[0003e13c] 93c9                      suba.l     a1,a1
[0003e13e] 7005                      moveq.l    #5,d0
[0003e140] 204c                      movea.l    a4,a0
[0003e142] 2a6f 0004                 movea.l    4(a7),a5
[0003e146] 2a6d 0008                 movea.l    8(a5),a5
[0003e14a] 4e95                      jsr        (a5)
[0003e14c] 7604                      moveq.l    #4,d3
[0003e14e] 93c9                      suba.l     a1,a1
[0003e150] 7069                      moveq.l    #105,d0
[0003e152] 204c                      movea.l    a4,a0
[0003e154] 2a6f 0004                 movea.l    4(a7),a5
[0003e158] 2a6d 0008                 movea.l    8(a5),a5
[0003e15c] 4e95                      jsr        (a5)
[0003e15e] 6022                      bra.s      $0003E182
[0003e160] 3003                      move.w     d3,d0
[0003e162] 5343                      subq.w     #1,d3
[0003e164] 4a40                      tst.w      d0
[0003e166] 660e                      bne.s      $0003E176
[0003e168] 93c9                      suba.l     a1,a1
[0003e16a] 7005                      moveq.l    #5,d0
[0003e16c] 204a                      movea.l    a2,a0
[0003e16e] 2a6b 0008                 movea.l    8(a3),a5
[0003e172] 4e95                      jsr        (a5)
[0003e174] 7604                      moveq.l    #4,d3
[0003e176] 93c9                      suba.l     a1,a1
[0003e178] 7069                      moveq.l    #105,d0
[0003e17a] 204a                      movea.l    a2,a0
[0003e17c] 2a6b 0008                 movea.l    8(a3),a5
[0003e180] 4e95                      jsr        (a5)
[0003e182] 2f39 000e 692a            move.l     _globl,-(a7)
[0003e188] 486f 0006                 pea.l      6(a7)
[0003e18c] 486f 0008                 pea.l      8(a7)
[0003e190] 43ef 000e                 lea.l      14(a7),a1
[0003e194] 41ef 000e                 lea.l      14(a7),a0
[0003e198] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0003e19e] 4fef 000c                 lea.l      12(a7),a7
[0003e1a2] 7001                      moveq.l    #1,d0
[0003e1a4] c057                      and.w      (a7),d0
[0003e1a6] 6600 fece                 bne        $0003E076
[0003e1aa] b67c 0004                 cmp.w      #$0004,d3
[0003e1ae] 6722                      beq.s      $0003E1D2
[0003e1b0] 4a45                      tst.w      d5
[0003e1b2] 6712                      beq.s      $0003E1C6
[0003e1b4] 93c9                      suba.l     a1,a1
[0003e1b6] 204c                      movea.l    a4,a0
[0003e1b8] 246f 0004                 movea.l    4(a7),a2
[0003e1bc] 246a 0008                 movea.l    8(a2),a2
[0003e1c0] 7005                      moveq.l    #5,d0
[0003e1c2] 4e92                      jsr        (a2)
[0003e1c4] 600c                      bra.s      $0003E1D2
[0003e1c6] 93c9                      suba.l     a1,a1
[0003e1c8] 7005                      moveq.l    #5,d0
[0003e1ca] 204c                      movea.l    a4,a0
[0003e1cc] 246b 0008                 movea.l    8(a3),a2
[0003e1d0] 4e92                      jsr        (a2)
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
[0003e230] 6600 00ea                 bne        $0003E31C
[0003e234] 006a 0020 0056            ori.w      #$0020,86(a2)
[0003e23a] 302a 0056                 move.w     86(a2),d0
[0003e23e] c07c 0800                 and.w      #$0800,d0
[0003e242] 6600 00d8                 bne        $0003E31C
[0003e246] 536b 00c8                 subq.w     #1,200(a3)
[0003e24a] 302b 00c8                 move.w     200(a3),d0
[0003e24e] 6e00 00cc                 bgt        $0003E31C
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
[0003e28a] 6b46                      bmi.s      $0003E2D2
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
[0003e2d0] 604a                      bra.s      $0003E31C
[0003e2d2] 202b 00ca                 move.l     202(a3),d0
[0003e2d6] b0af 0010                 cmp.l      16(a7),d0
[0003e2da] 660a                      bne.s      $0003E2E6
[0003e2dc] 222b 00ce                 move.l     206(a3),d1
[0003e2e0] b2af 0014                 cmp.l      20(a7),d1
[0003e2e4] 6736                      beq.s      $0003E31C
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
[0003e356] 673c                      beq.s      $0003E394
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
[0003e38a] 660e                      bne.s      $0003E39A
[0003e38c] 204a                      movea.l    a2,a0
[0003e38e] 4eb9 0004 c7c8            jsr        Ax_free
[0003e394] 91c8                      suba.l     a0,a0
[0003e396] 6000 0376                 bra        $0003E70E
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
[0003e3ea] 6600 0142                 bne        $0003E52E
[0003e3ee] 41f9 000d 4a0c            lea.l      $000D4A0C,a0
[0003e3f4] 4eb9 0004 b496            jsr        Af_cfgfile
[0003e3fa] 4240                      clr.w      d0
[0003e3fc] 4eb9 0008 0cc0            jsr        Fopen
[0003e402] 2600                      move.l     d0,d3
[0003e404] 6f00 0110                 ble        $0003E516
[0003e408] 41ef 0016                 lea.l      22(a7),a0
[0003e40c] 7204                      moveq.l    #4,d1
[0003e40e] 3003                      move.w     d3,d0
[0003e410] 4eb9 0008 0cd2            jsr        Fread
[0003e416] 7204                      moveq.l    #4,d1
[0003e418] b280                      cmp.l      d0,d1
[0003e41a] 6600 00f2                 bne        $0003E50E
[0003e41e] 0caf 4145 4431 0016       cmpi.l     #$41454431,22(a7)
[0003e426] 6600 00e6                 bne        $0003E50E
[0003e42a] 4242                      clr.w      d2
[0003e42c] 7000                      moveq.l    #0,d0
[0003e42e] 3203                      move.w     d3,d1
[0003e430] 4eb9 0008 0cfe            jsr        Fseek
[0003e436] 4a80                      tst.l      d0
[0003e438] 6600 00d4                 bne        $0003E50E
[0003e43c] 41ef 011c                 lea.l      284(a7),a0
[0003e440] 223c 0000 052e            move.l     #$0000052E,d1
[0003e446] 3003                      move.w     d3,d0
[0003e448] 4eb9 0008 0cd2            jsr        Fread
[0003e44e] b0bc 0000 052e            cmp.l      #$0000052E,d0
[0003e454] 6600 00b8                 bne        $0003E50E
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
[0003e47e] 6600 008e                 bne        $0003E50E
[0003e482] 7800                      moveq.l    #0,d4
[0003e484] 6000 0080                 bra        $0003E506
[0003e488] 204e                      movea.l    a6,a0
[0003e48a] 223c 0000 0102            move.l     #$00000102,d1
[0003e490] 3003                      move.w     d3,d0
[0003e492] 4eb9 0008 0cd2            jsr        Fread
[0003e498] b0bc 0000 0102            cmp.l      #$00000102,d0
[0003e49e] 666e                      bne.s      $0003E50E
[0003e4a0] 182e 0001                 move.b     1(a6),d4
[0003e4a4] 4884                      ext.w      d4
[0003e4a6] d87c fff0                 add.w      #$FFF0,d4
[0003e4aa] 48c4                      ext.l      d4
[0003e4ac] 3016                      move.w     (a6),d0
[0003e4ae] c07c 0400                 and.w      #$0400,d0
[0003e4b2] 6706                      beq.s      $0003E4BA
[0003e4b4] d8bc 0000 0014            add.l      #$00000014,d4
[0003e4ba] 3016                      move.w     (a6),d0
[0003e4bc] c07c 0300                 and.w      #$0300,d0
[0003e4c0] 6706                      beq.s      $0003E4C8
[0003e4c2] d8bc 0000 000a            add.l      #$0000000A,d4
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
[0003e4ec] 6720                      beq.s      $0003E50E
[0003e4ee] 224e                      movea.l    a6,a1
[0003e4f0] 41f2 0800                 lea.l      0(a2,d0.l),a0
[0003e4f4] 2068 00d2                 movea.l    210(a0),a0
[0003e4f8] 203c 0000 0102            move.l     #$00000102,d0
[0003e4fe] 4eb9 0008 3500            jsr        memcpy
[0003e504] 5284                      addq.l     #1,d4
[0003e506] b8af 0016                 cmp.l      22(a7),d4
[0003e50a] 6d00 ff7c                 blt        $0003E488
[0003e50e] 3003                      move.w     d3,d0
[0003e510] 4eb9 0008 0c7e            jsr        Fclose
[0003e516] 102b fef6                 move.b     -266(a3),d0
[0003e51a] 6654                      bne.s      $0003E570
[0003e51c] 2255                      movea.l    (a5),a1
[0003e51e] 43e9 03e6                 lea.l      998(a1),a1
[0003e522] 41eb fef6                 lea.l      -266(a3),a0
[0003e526] 4eb9 0008 2f0c            jsr        strcpy
[0003e52c] 6042                      bra.s      $0003E570
[0003e52e] 7800                      moveq.l    #0,d4
[0003e530] 6038                      bra.s      $0003E56A
[0003e532] 3004                      move.w     d4,d0
[0003e534] e548                      lsl.w      #2,d0
[0003e536] 41eb 00d2                 lea.l      210(a3),a0
[0003e53a] 2230 0000                 move.l     0(a0,d0.w),d1
[0003e53e] 6728                      beq.s      $0003E568
[0003e540] 203c 0000 0102            move.l     #$00000102,d0
[0003e546] 4eb9 0004 c608            jsr        Ax_malloc
[0003e54c] 2004                      move.l     d4,d0
[0003e54e] e588                      lsl.l      #2,d0
[0003e550] 43f2 0800                 lea.l      0(a2,d0.l),a1
[0003e554] 2348 00d2                 move.l     a0,210(a1)
[0003e558] 6716                      beq.s      $0003E570
[0003e55a] 224e                      movea.l    a6,a1
[0003e55c] 203c 0000 0102            move.l     #$00000102,d0
[0003e562] 4eb9 0008 3500            jsr        memcpy
[0003e568] 5284                      addq.l     #1,d4
[0003e56a] 7028                      moveq.l    #40,d0
[0003e56c] b084                      cmp.l      d4,d0
[0003e56e] 6ec2                      bgt.s      $0003E532
[0003e570] 026b 007f fbf4            andi.w     #$007F,-1036(a3)
[0003e576] 203c 0000 052e            move.l     #$0000052E,d0
[0003e57c] 43eb fad2                 lea.l      -1326(a3),a1
[0003e580] 41ea 0172                 lea.l      370(a2),a0
[0003e584] 4eb9 0008 3500            jsr        memcpy
[0003e58a] 206b f538                 movea.l    -2760(a3),a0
[0003e58e] b1fc 000d 32ac            cmpa.l     #_ED_TOOL,a0
[0003e594] 6706                      beq.s      $0003E59C
[0003e596] 006a 0200 0294            ori.w      #$0200,660(a2)
[0003e59c] 006c 0060 0054            ori.w      #$0060,84(a4)
[0003e5a2] 4240                      clr.w      d0
[0003e5a4] 206c 0014                 movea.l    20(a4),a0
[0003e5a8] 3140 0046                 move.w     d0,70(a0)
[0003e5ac] 206c 0014                 movea.l    20(a4),a0
[0003e5b0] 3140 0044                 move.w     d0,68(a0)
[0003e5b4] 2c6c 0014                 movea.l    20(a4),a6
[0003e5b8] 322a 0178                 move.w     376(a2),d1
[0003e5bc] 6712                      beq.s      $0003E5D0
[0003e5be] 2055                      movea.l    (a5),a0
[0003e5c0] b268 000c                 cmp.w      12(a0),d1
[0003e5c4] 6e0a                      bgt.s      $0003E5D0
[0003e5c6] 342a 017a                 move.w     378(a2),d2
[0003e5ca] b468 000e                 cmp.w      14(a0),d2
[0003e5ce] 6f26                      ble.s      $0003E5F6
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
[0003e5f4] 600c                      bra.s      $0003E602
[0003e5f6] 3d6a 0178 0014            move.w     376(a2),20(a6)
[0003e5fc] 3d6a 017a 0016            move.w     378(a2),22(a6)
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
[0003e70e] 4fef 064a                 lea.l      1610(a7),a7
[0003e712] 4cdf 7c18                 movem.l    (a7)+,d3-d4/a2-a6
[0003e716] 4e75                      rts
term:
[0003e718] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003e71c] 2448                      movea.l    a0,a2
[0003e71e] 302a 0056                 move.w     86(a2),d0
[0003e722] c07c 0200                 and.w      #$0200,d0
[0003e726] 6600 008e                 bne        $0003E7B6
[0003e72a] 2650                      movea.l    (a0),a3
[0003e72c] 323c 0080                 move.w     #$0080,d1
[0003e730] c26b 0294                 and.w      660(a3),d1
[0003e734] 674a                      beq.s      $0003E780
[0003e736] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003e73c] 3429 023a                 move.w     570(a1),d2
[0003e740] 6716                      beq.s      $0003E758
[0003e742] 43eb 00b8                 lea.l      184(a3),a1
[0003e746] 41f9 000d 057e            lea.l      WARN_SAVED,a0
[0003e74c] 4eb9 0006 b80c            jsr        alert_str
[0003e752] 5340                      subq.w     #1,d0
[0003e754] 662a                      bne.s      $0003E780
[0003e756] 601a                      bra.s      $0003E772
[0003e758] 43eb 00b8                 lea.l      184(a3),a1
[0003e75c] 41f9 000d 0530            lea.l      WARN_2SAVED,a0
[0003e762] 4eb9 0006 b80c            jsr        alert_str
[0003e768] 5340                      subq.w     #1,d0
[0003e76a] 6706                      beq.s      $0003E772
[0003e76c] 5540                      subq.w     #2,d0
[0003e76e] 6746                      beq.s      $0003E7B6
[0003e770] 600e                      bra.s      $0003E780
[0003e772] 006a 0200 0056            ori.w      #$0200,86(a2)
[0003e778] 204a                      movea.l    a2,a0
[0003e77a] 4eb9 0003 fac2            jsr        ed_save
[0003e780] 006a 0200 0056            ori.w      #$0200,86(a2)
[0003e786] 202b 0004                 move.l     4(a3),d0
[0003e78a] 4e71                      nop
[0003e78c] 2853                      movea.l    (a3),a4
[0003e78e] 200c                      move.l     a4,d0
[0003e790] 670e                      beq.s      $0003E7A0
[0003e792] 224a                      movea.l    a2,a1
[0003e794] 303c 00d1                 move.w     #$00D1,d0
[0003e798] 204c                      movea.l    a4,a0
[0003e79a] 2a6c 0004                 movea.l    4(a4),a5
[0003e79e] 4e95                      jsr        (a5)
[0003e7a0] 5379 000d 46b2            subq.w     #1,editors
[0003e7a6] 204b                      movea.l    a3,a0
[0003e7a8] 4eb9 0004 c7c8            jsr        Ax_free
[0003e7ae] 204a                      movea.l    a2,a0
[0003e7b0] 4eb9 0005 85f2            jsr        Awi_delete
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
[0003e7d2] 6606                      bne.s      $0003E7DA
[0003e7d4] 254b 004a                 move.l     a3,74(a2)
[0003e7d8] 6020                      bra.s      $0003E7FA
[0003e7da] 204b                      movea.l    a3,a0
[0003e7dc] 4eb9 0004 649c            jsr        Ast_delete
[0003e7e2] 302a 0020                 move.w     32(a2),d0
[0003e7e6] 6f12                      ble.s      $0003E7FA
[0003e7e8] 4267                      clr.w      -(a7)
[0003e7ea] 4267                      clr.w      -(a7)
[0003e7ec] 2f2a 004a                 move.l     74(a2),-(a7)
[0003e7f0] 7202                      moveq.l    #2,d1
[0003e7f2] 4eb9 0007 f926            jsr        wind_set
[0003e7f8] 504f                      addq.w     #8,a7
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
[0003e848] 6038                      bra.s      $0003E882
[0003e84a] 224d                      movea.l    a5,a1
[0003e84c] 303c 00ca                 move.w     #$00CA,d0
[0003e850] 204a                      movea.l    a2,a0
[0003e852] 4eb9 0003 a772            jsr        Auo_editor
[0003e858] 202d 0004                 move.l     4(a5),d0
[0003e85c] 6f0c                      ble.s      $0003E86A
[0003e85e] 226d 0008                 movea.l    8(a5),a1
[0003e862] 204c                      movea.l    a4,a0
[0003e864] 4eb9 0008 2fd6            jsr        strncpy
[0003e86a] d9ed 0004                 adda.l     4(a5),a4
[0003e86e] 70ff                      moveq.l    #-1,d0
[0003e870] d097                      add.l      (a7),d0
[0003e872] 2215                      move.l     (a5),d1
[0003e874] b280                      cmp.l      d0,d1
[0003e876] 6708                      beq.s      $0003E880
[0003e878] 18fc 000d                 move.b     #$0D,(a4)+
[0003e87c] 18fc 000a                 move.b     #$0A,(a4)+
[0003e880] 5295                      addq.l     #1,(a5)
[0003e882] 2015                      move.l     (a5),d0
[0003e884] b097                      cmp.l      (a7),d0
[0003e886] 6dc2                      blt.s      $0003E84A
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
[0003e8ac] 602c                      bra.s      $0003E8DA
[0003e8ae] 203c 0000 2000            move.l     #$00002000,d0
[0003e8b4] 224a                      movea.l    a2,a1
[0003e8b6] 204b                      movea.l    a3,a0
[0003e8b8] 4eb9 0008 3500            jsr        memcpy
[0003e8be] 203c 0000 2000            move.l     #$00002000,d0
[0003e8c4] 224b                      movea.l    a3,a1
[0003e8c6] 206c 0014                 movea.l    20(a4),a0
[0003e8ca] 4eb9 0003 f26a            jsr        put_block
[0003e8d0] 96bc 0000 2000            sub.l      #$00002000,d3
[0003e8d6] 45ea 2000                 lea.l      8192(a2),a2
[0003e8da] b6bc 0000 2000            cmp.l      #$00002000,d3
[0003e8e0] 6ecc                      bgt.s      $0003E8AE
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
edit_service:
[0003e902] 48e7 103c                 movem.l    d3/a2-a5,-(a7)
[0003e906] 2448                      movea.l    a0,a2
[0003e908] 3600                      move.w     d0,d3
[0003e90a] 2849                      movea.l    a1,a4
[0003e90c] 2650                      movea.l    (a0),a3
[0003e90e] b07c 00cd                 cmp.w      #$00CD,d0
[0003e912] 6700 00ce                 beq        $0003E9E2
[0003e916] 6e40                      bgt.s      $0003E958
[0003e918] b07c 00c9                 cmp.w      #$00C9,d0
[0003e91c] 6700 013e                 beq        $0003EA5C
[0003e920] 6e1e                      bgt.s      $0003E940
[0003e922] 5540                      subq.w     #2,d0
[0003e924] 675c                      beq.s      $0003E982
[0003e926] 907c 000d                 sub.w      #$000D,d0
[0003e92a] 6700 0184                 beq        $0003EAB0
[0003e92e] 5540                      subq.w     #2,d0
[0003e930] 6700 01ac                 beq        $0003EADE
[0003e934] 907c 00b7                 sub.w      #$00B7,d0
[0003e938] 6700 007e                 beq.w      $0003E9B8
[0003e93c] 6000 0192                 bra        $0003EAD0
[0003e940] 907c 00ca                 sub.w      #$00CA,d0
[0003e944] 6700 012a                 beq        $0003EA70
[0003e948] 5340                      subq.w     #1,d0
[0003e94a] 6700 00b8                 beq        $0003EA04
[0003e94e] 5340                      subq.w     #1,d0
[0003e950] 6700 00de                 beq        $0003EA30
[0003e954] 6000 017a                 bra        $0003EAD0
[0003e958] 907c 00ce                 sub.w      #$00CE,d0
[0003e95c] b07c 0009                 cmp.w      #$0009,d0
[0003e960] 6200 016e                 bhi        $0003EAD0
[0003e964] d040                      add.w      d0,d0
[0003e966] 303b 0006                 move.w     $0003E96E(pc,d0.w),d0
[0003e96a] 4efb 0002                 jmp        $0003E96E(pc,d0.w)
J32:
[0003e96e] 0052                      dc.w $0052   ; $0003e9c0-$0003e96e
[0003e970] 0060                      dc.w $0060   ; $0003e9ce-$0003e96e
[0003e972] 0044                      dc.w $0044   ; $0003e9b2-$0003e96e
[0003e974] 0162                      dc.w $0162   ; $0003ead0-$0003e96e
[0003e976] 0162                      dc.w $0162   ; $0003ead0-$0003e96e
[0003e978] 008c                      dc.w $008c   ; $0003e9fa-$0003e96e
[0003e97a] 0080                      dc.w $0080   ; $0003e9ee-$0003e96e
[0003e97c] 001e                      dc.w $001e   ; $0003e98c-$0003e96e
[0003e97e] 0138                      dc.w $0138   ; $0003eaa6-$0003e96e
[0003e980] 0154                      dc.w $0154   ; $0003eac2-$0003e96e
[0003e982] 204a                      dc.w $204a   ; $000409b8-$0003e96e
[0003e984] 6100                      dc.w $6100   ; $00044a6e-$0003e96e
[0003e986] fd92                      dc.w $fd92   ; $0003e700-$0003e96e
[0003e988] 6000                      dc.w $6000   ; $0004496e-$0003e96e
[0003e98a] 0154                      dc.w $0154   ; $0003eac2-$0003e96e
[0003e98c] 200c                      move.l     a4,d0
[0003e98e] 6714                      beq.s      $0003E9A4
[0003e990] 422b 00a8                 clr.b      168(a3)
[0003e994] 224c                      movea.l    a4,a1
[0003e996] 41eb 00a8                 lea.l      168(a3),a0
[0003e99a] 700f                      moveq.l    #15,d0
[0003e99c] 4eb9 0008 2f96            jsr        strncat
[0003e9a2] 6004                      bra.s      $0003E9A8
[0003e9a4] 422b 00a8                 clr.b      168(a3)
[0003e9a8] 204a                      movea.l    a2,a0
[0003e9aa] 6100 e2ca                 bsr        set_icon
[0003e9ae] 6000 012e                 bra        $0003EADE
[0003e9b2] 268c                      move.l     a4,(a3)
[0003e9b4] 6000 0128                 bra        $0003EADE
[0003e9b8] 28aa 0014                 move.l     20(a2),(a4)
[0003e9bc] 6000 0120                 bra        $0003EADE
[0003e9c0] 224c                      movea.l    a4,a1
[0003e9c2] 206a 0014                 movea.l    20(a2),a0
[0003e9c6] 6100 fe38                 bsr        get_all
[0003e9ca] 6000 0112                 bra        $0003EADE
[0003e9ce] 224c                      movea.l    a4,a1
[0003e9d0] 303c 00fb                 move.w     #$00FB,d0
[0003e9d4] 206a 0014                 movea.l    20(a2),a0
[0003e9d8] 4eb9 0003 a772            jsr        Auo_editor
[0003e9de] 6000 00fe                 bra        $0003EADE
[0003e9e2] 224c                      movea.l    a4,a1
[0003e9e4] 204a                      movea.l    a2,a0
[0003e9e6] 6100 feac                 bsr        put_string
[0003e9ea] 6000 00f2                 bra        $0003EADE
[0003e9ee] 206a 0014                 movea.l    20(a2),a0
[0003e9f2] 6100 e312                 bsr        home
[0003e9f6] 6000 00e6                 bra        $0003EADE
[0003e9fa] 204a                      movea.l    a2,a0
[0003e9fc] 6100 e378                 bsr        undirty
[0003ea00] 6000 00dc                 bra        $0003EADE
[0003ea04] 7020                      moveq.l    #32,d0
[0003ea06] 224c                      movea.l    a4,a1
[0003ea08] 41eb 0068                 lea.l      104(a3),a0
[0003ea0c] 4eb9 0008 2fd6            jsr        strncpy
[0003ea12] 422b 0087                 clr.b      135(a3)
[0003ea16] 303c 0080                 move.w     #$0080,d0
[0003ea1a] c06b 0294                 and.w      660(a3),d0
[0003ea1e] 6600 00be                 bne        $0003EADE
[0003ea22] 43eb 0068                 lea.l      104(a3),a1
[0003ea26] 204a                      movea.l    a2,a0
[0003ea28] 6100 fd92                 bsr        set_title
[0003ea2c] 6000 00b0                 bra        $0003EADE
[0003ea30] 7020                      moveq.l    #32,d0
[0003ea32] 224c                      movea.l    a4,a1
[0003ea34] 41eb 0088                 lea.l      136(a3),a0
[0003ea38] 4eb9 0008 2fd6            jsr        strncpy
[0003ea3e] 422b 00a7                 clr.b      167(a3)
[0003ea42] 303c 0080                 move.w     #$0080,d0
[0003ea46] c06b 0294                 and.w      660(a3),d0
[0003ea4a] 6700 0092                 beq        $0003EADE
[0003ea4e] 43eb 0088                 lea.l      136(a3),a1
[0003ea52] 204a                      movea.l    a2,a0
[0003ea54] 6100 fd66                 bsr        set_title
[0003ea58] 6000 0084                 bra        $0003EADE
[0003ea5c] 7010                      moveq.l    #16,d0
[0003ea5e] 224c                      movea.l    a4,a1
[0003ea60] 41eb 0182                 lea.l      386(a3),a0
[0003ea64] 4eb9 0008 2fd6            jsr        strncpy
[0003ea6a] 422b 0191                 clr.b      401(a3)
[0003ea6e] 606e                      bra.s      $0003EADE
[0003ea70] 200c                      move.l     a4,d0
[0003ea72] 6626                      bne.s      $0003EA9A
[0003ea74] 486b 0182                 pea.l      386(a3)
[0003ea78] 43eb 0192                 lea.l      402(a3),a1
[0003ea7c] 41eb 0008                 lea.l      8(a3),a0
[0003ea80] 4eb9 0006 cefe            jsr        Af_select
[0003ea86] 584f                      addq.w     #4,a7
[0003ea88] 2a48                      movea.l    a0,a5
[0003ea8a] 200d                      move.l     a5,d0
[0003ea8c] 6750                      beq.s      $0003EADE
[0003ea8e] 224d                      movea.l    a5,a1
[0003ea90] 204a                      movea.l    a2,a0
[0003ea92] 4eb9 0003 f37a            jsr        open_file
[0003ea98] 6044                      bra.s      $0003EADE
[0003ea9a] 224c                      movea.l    a4,a1
[0003ea9c] 204a                      movea.l    a2,a0
[0003ea9e] 4eb9 0003 f37a            jsr        open_file
[0003eaa4] 6038                      bra.s      $0003EADE
[0003eaa6] 204a                      movea.l    a2,a0
[0003eaa8] 4eb9 0003 fac2            jsr        ed_save
[0003eaae] 602e                      bra.s      $0003EADE
[0003eab0] 4bf9 000d 375c            lea.l      WIED_INFOBOX,a5
[0003eab6] 224d                      movea.l    a5,a1
[0003eab8] 204d                      movea.l    a5,a0
[0003eaba] 4eb9 0005 a366            jsr        Awi_doform
[0003eac0] 601c                      bra.s      $0003EADE
[0003eac2] 43eb 0192                 lea.l      402(a3),a1
[0003eac6] 204c                      movea.l    a4,a0
[0003eac8] 4eb9 0008 2f0c            jsr        strcpy
[0003eace] 600e                      bra.s      $0003EADE
[0003ead0] 224c                      movea.l    a4,a1
[0003ead2] 3003                      move.w     d3,d0
[0003ead4] 204a                      movea.l    a2,a0
[0003ead6] 4eb9 0005 9dd0            jsr        Awi_service
[0003eadc] 6002                      bra.s      $0003EAE0
[0003eade] 7001                      moveq.l    #1,d0
[0003eae0] 4cdf 3c08                 movem.l    (a7)+,d3/a2-a5
[0003eae4] 4e75                      rts
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
[0003eb92] 6716                      beq.s      $0003EBAA
[0003eb94] 302c 0002                 move.w     2(a4),d0
[0003eb98] 48c0                      ext.l      d0
[0003eb9a] 2400                      move.l     d0,d2
[0003eb9c] d482                      add.l      d2,d2
[0003eb9e] d480                      add.l      d0,d2
[0003eba0] e78a                      lsl.l      #3,d2
[0003eba2] 3234 2816                 move.w     22(a4,d2.l),d1
[0003eba6] 936b 0016                 sub.w      d1,22(a3)
[0003ebaa] 202a 0018                 move.l     24(a2),d0
[0003ebae] 670a                      beq.s      $0003EBBA
[0003ebb0] 2040                      movea.l    d0,a0
[0003ebb2] 3228 0016                 move.w     22(a0),d1
[0003ebb6] 936b 0016                 sub.w      d1,22(a3)
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
[0003ec7e] 6700 0108                 beq        $0003ED88
[0003ec82] 7204                      moveq.l    #4,d1
[0003ec84] c26b 0294                 and.w      660(a3),d1
[0003ec88] 6710                      beq.s      $0003EC9A
[0003ec8a] 93c9                      suba.l     a1,a1
[0003ec8c] 204a                      movea.l    a2,a0
[0003ec8e] 303c 00f3                 move.w     #$00F3,d0
[0003ec92] 4eb9 0003 a772            jsr        Auo_editor
[0003ec98] 600e                      bra.s      $0003ECA8
[0003ec9a] 93c9                      suba.l     a1,a1
[0003ec9c] 303c 00f4                 move.w     #$00F4,d0
[0003eca0] 204a                      movea.l    a2,a0
[0003eca2] 4eb9 0003 a772            jsr        Auo_editor
[0003eca8] 7001                      moveq.l    #1,d0
[0003ecaa] c06b 0294                 and.w      660(a3),d0
[0003ecae] 6710                      beq.s      $0003ECC0
[0003ecb0] 93c9                      suba.l     a1,a1
[0003ecb2] 204a                      movea.l    a2,a0
[0003ecb4] 303c 00f6                 move.w     #$00F6,d0
[0003ecb8] 4eb9 0003 a772            jsr        Auo_editor
[0003ecbe] 600e                      bra.s      $0003ECCE
[0003ecc0] 93c9                      suba.l     a1,a1
[0003ecc2] 303c 00f5                 move.w     #$00F5,d0
[0003ecc6] 204a                      movea.l    a2,a0
[0003ecc8] 4eb9 0003 a772            jsr        Auo_editor
[0003ecce] 7002                      moveq.l    #2,d0
[0003ecd0] c06b 0294                 and.w      660(a3),d0
[0003ecd4] 6710                      beq.s      $0003ECE6
[0003ecd6] 93c9                      suba.l     a1,a1
[0003ecd8] 204a                      movea.l    a2,a0
[0003ecda] 303c 00f7                 move.w     #$00F7,d0
[0003ecde] 4eb9 0003 a772            jsr        Auo_editor
[0003ece4] 600e                      bra.s      $0003ECF4
[0003ece6] 93c9                      suba.l     a1,a1
[0003ece8] 303c 00f8                 move.w     #$00F8,d0
[0003ecec] 204a                      movea.l    a2,a0
[0003ecee] 4eb9 0003 a772            jsr        Auo_editor
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
[0003ed32] 6b24                      bmi.s      $0003ED58
[0003ed34] 2214                      move.l     (a4),d1
[0003ed36] b280                      cmp.l      d0,d1
[0003ed38] 6626                      bne.s      $0003ED60
[0003ed3a] 242c 0004                 move.l     4(a4),d2
[0003ed3e] b4af 0004                 cmp.l      4(a7),d2
[0003ed42] 661c                      bne.s      $0003ED60
[0003ed44] 206c 0008                 movea.l    8(a4),a0
[0003ed48] b1ef 0008                 cmpa.l     8(a7),a0
[0003ed4c] 6612                      bne.s      $0003ED60
[0003ed4e] 226c 000c                 movea.l    12(a4),a1
[0003ed52] b3ef 000c                 cmpa.l     12(a7),a1
[0003ed56] 6608                      bne.s      $0003ED60
[0003ed58] 0a6b 0004 0294            eori.w     #$0004,660(a3)
[0003ed5e] 601a                      bra.s      $0003ED7A
[0003ed60] 93c9                      suba.l     a1,a1
[0003ed62] 303c 00db                 move.w     #$00DB,d0
[0003ed66] 204a                      movea.l    a2,a0
[0003ed68] 4eb9 0003 a772            jsr        Auo_editor
[0003ed6e] 93c9                      suba.l     a1,a1
[0003ed70] 7005                      moveq.l    #5,d0
[0003ed72] 204a                      movea.l    a2,a0
[0003ed74] 4eb9 0003 a772            jsr        Auo_editor
[0003ed7a] 93c9                      suba.l     a1,a1
[0003ed7c] 303c 00d6                 move.w     #$00D6,d0
[0003ed80] 204a                      movea.l    a2,a0
[0003ed82] 4eb9 0003 a772            jsr        Auo_editor
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
[0003edb4] 6700 00c8                 beq        $0003EE7E
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
[0003ee0a] 666a                      bne.s      $0003EE76
[0003ee0c] 43eb 0296                 lea.l      662(a3),a1
[0003ee10] 7003                      moveq.l    #3,d0
[0003ee12] 206d 0014                 movea.l    20(a5),a0
[0003ee16] 4eb9 0005 11da            jsr        Aob_gettext
[0003ee1c] 4a40                      tst.w      d0
[0003ee1e] 6756                      beq.s      $0003EE76
[0003ee20] 43eb 0296                 lea.l      662(a3),a1
[0003ee24] 41ec 0634                 lea.l      1588(a4),a0
[0003ee28] 4eb9 0008 2f0c            jsr        strcpy
[0003ee2e] 026b fff8 0294            andi.w     #$FFF8,660(a3)
[0003ee34] 7001                      moveq.l    #1,d0
[0003ee36] 206d 0014                 movea.l    20(a5),a0
[0003ee3a] c068 00e2                 and.w      226(a0),d0
[0003ee3e] 6706                      beq.s      $0003EE46
[0003ee40] 006b 0002 0294            ori.w      #$0002,660(a3)
[0003ee46] 7001                      moveq.l    #1,d0
[0003ee48] 206d 0014                 movea.l    20(a5),a0
[0003ee4c] c068 0082                 and.w      130(a0),d0
[0003ee50] 6706                      beq.s      $0003EE58
[0003ee52] 006b 0004 0294            ori.w      #$0004,660(a3)
[0003ee58] 7001                      moveq.l    #1,d0
[0003ee5a] 206d 0014                 movea.l    20(a5),a0
[0003ee5e] c068 00b2                 and.w      178(a0),d0
[0003ee62] 6706                      beq.s      $0003EE6A
[0003ee64] 006b 0001 0294            ori.w      #$0001,660(a3)
[0003ee6a] 396b 0294 0632            move.w     660(a3),1586(a4)
[0003ee70] 204a                      movea.l    a2,a0
[0003ee72] 6100 fdf6                 bsr        find_next
[0003ee76] 204d                      movea.l    a5,a0
[0003ee78] 4eb9 0005 85f2            jsr        Awi_delete
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
[0003eebc] 6a2c                      bpl.s      $0003EEEA
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
[0003eee8] 6044                      bra.s      $0003EF2E
[0003eeea] 4bef 0010                 lea.l      16(a7),a5
[0003eeee] 2a97                      move.l     (a7),(a5)
[0003eef0] 224d                      movea.l    a5,a1
[0003eef2] 303c 00ca                 move.w     #$00CA,d0
[0003eef6] 204b                      movea.l    a3,a0
[0003eef8] 4eb9 0003 a772            jsr        Auo_editor
[0003eefe] 263c 0000 00ff            move.l     #$000000FF,d3
[0003ef04] 202d 0004                 move.l     4(a5),d0
[0003ef08] 6f24                      ble.s      $0003EF2E
[0003ef0a] b680                      cmp.l      d0,d3
[0003ef0c] 6f02                      ble.s      $0003EF10
[0003ef0e] 2600                      move.l     d0,d3
[0003ef10] 2003                      move.l     d3,d0
[0003ef12] 226d 0008                 movea.l    8(a5),a1
[0003ef16] 41ec 0296                 lea.l      662(a4),a0
[0003ef1a] 4eb9 0008 2fd6            jsr        strncpy
[0003ef20] 41f4 3800                 lea.l      0(a4,d3.l),a0
[0003ef24] 4228 0296                 clr.b      662(a0)
[0003ef28] 204a                      movea.l    a2,a0
[0003ef2a] 6100 fd3e                 bsr        find_next
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
[0003ef72] 6600 0084                 bne        $0003EFF8
[0003ef76] 41ef 0008                 lea.l      8(a7),a0
[0003ef7a] 203c 7846 534c            move.l     #$7846534C,d0
[0003ef80] 4eb9 0008 0ec4            jsr        Ash_getcookie
[0003ef86] 4a40                      tst.w      d0
[0003ef88] 676e                      beq.s      $0003EFF8
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
[0003efb8] 6b3c                      bmi.s      $0003EFF6
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
[0003eff6] 5344                      subq.w     #1,d4
[0003eff8] 4a43                      tst.w      d3
[0003effa] 6612                      bne.s      $0003F00E
[0003effc] 4240                      clr.w      d0
[0003effe] 43eb 017e                 lea.l      382(a3),a1
[0003f002] 41eb 017c                 lea.l      380(a3),a0
[0003f006] 4eb9 0004 10c8            jsr        A_fontsel
[0003f00c] 3800                      move.w     d0,d4
[0003f00e] 4a44                      tst.w      d4
[0003f010] 6600 008e                 bne        $0003F0A0
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
[0003f0c2] 6700 00b8                 beq        $0003F17C
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
[0003f106] 666c                      bne.s      $0003F174
[0003f108] 4857                      pea.l      (a7)
[0003f10a] 43f9 000d 4a1b            lea.l      $000D4A1B,a1
[0003f110] 7004                      moveq.l    #4,d0
[0003f112] 206a 0014                 movea.l    20(a2),a0
[0003f116] 4eb9 0005 10fe            jsr        Aob_scanf
[0003f11c] 584f                      addq.w     #4,a7
[0003f11e] 2017                      move.l     (a7),d0
[0003f120] 6f02                      ble.s      $0003F124
[0003f122] 5397                      subq.l     #1,(a7)
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
[0003f174] 204a                      movea.l    a2,a0
[0003f176] 4eb9 0005 85f2            jsr        Awi_delete
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
[0003f19e] 6700 00c0                 beq        $0003F260
[0003f1a2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003f1a8] 2069 0258                 movea.l    600(a1),a0
[0003f1ac] 2668 0014                 movea.l    20(a0),a3
[0003f1b0] 43ef 0014                 lea.l      20(a7),a1
[0003f1b4] 303c 00e3                 move.w     #$00E3,d0
[0003f1b8] 204b                      movea.l    a3,a0
[0003f1ba] 4eb9 0003 a772            jsr        Auo_editor
[0003f1c0] 49ef 0004                 lea.l      4(a7),a4
[0003f1c4] 202f 0014                 move.l     20(a7),d0
[0003f1c8] 6a1e                      bpl.s      $0003F1E8
[0003f1ca] 43d7                      lea.l      (a7),a1
[0003f1cc] 204b                      movea.l    a3,a0
[0003f1ce] 303c 00e9                 move.w     #$00E9,d0
[0003f1d2] 4eb9 0003 a772            jsr        Auo_editor
[0003f1d8] 224c                      movea.l    a4,a1
[0003f1da] 303c 00fb                 move.w     #$00FB,d0
[0003f1de] 204b                      movea.l    a3,a0
[0003f1e0] 4eb9 0003 a772            jsr        Auo_editor
[0003f1e6] 603c                      bra.s      $0003F224
[0003f1e8] 202f 0014                 move.l     20(a7),d0
[0003f1ec] 262f 001c                 move.l     28(a7),d3
[0003f1f0] 2203                      move.l     d3,d1
[0003f1f2] 9280                      sub.l      d0,d1
[0003f1f4] 5281                      addq.l     #1,d1
[0003f1f6] 2e81                      move.l     d1,(a7)
[0003f1f8] 28bc ffff fffe            move.l     #$FFFFFFFE,(a4)
[0003f1fe] 2800                      move.l     d0,d4
[0003f200] 4bef 0008                 lea.l      8(a7),a5
[0003f204] 601a                      bra.s      $0003F220
[0003f206] 2a84                      move.l     d4,(a5)
[0003f208] 224d                      movea.l    a5,a1
[0003f20a] 303c 00ca                 move.w     #$00CA,d0
[0003f20e] 204b                      movea.l    a3,a0
[0003f210] 4eb9 0003 a772            jsr        Auo_editor
[0003f216] 7002                      moveq.l    #2,d0
[0003f218] d0ad 0004                 add.l      4(a5),d0
[0003f21c] d194                      add.l      d0,(a4)
[0003f21e] 5284                      addq.l     #1,d4
[0003f220] b684                      cmp.l      d4,d3
[0003f222] 6ce2                      bge.s      $0003F206
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
[0003f27c] 6f00 00aa                 ble        $0003F328
[0003f280] 4231 0800                 clr.b      0(a1,d0.l)
[0003f284] e588                      lsl.l      #2,d0
[0003f286] 4eb9 0004 c608            jsr        Ax_malloc
[0003f28c] 2648                      movea.l    a0,a3
[0003f28e] 200b                      move.l     a3,d0
[0003f290] 6700 0096                 beq        $0003F328
[0003f294] 49ef 0008                 lea.l      8(a7),a4
[0003f298] 294b 0014                 move.l     a3,20(a4)
[0003f29c] 7801                      moveq.l    #1,d4
[0003f29e] 206f 0020                 movea.l    32(a7),a0
[0003f2a2] 224b                      movea.l    a3,a1
[0003f2a4] 22c8                      move.l     a0,(a1)+
[0003f2a6] 6030                      bra.s      $0003F2D8
[0003f2a8] 0c10 000d                 cmpi.b     #$0D,(a0)
[0003f2ac] 6612                      bne.s      $0003F2C0
[0003f2ae] 4210                      clr.b      (a0)
[0003f2b0] 7001                      moveq.l    #1,d0
[0003f2b2] b083                      cmp.l      d3,d0
[0003f2b4] 6c1a                      bge.s      $0003F2D0
[0003f2b6] 0c28 000a 0001            cmpi.b     #$0A,1(a0)
[0003f2bc] 6712                      beq.s      $0003F2D0
[0003f2be] 6006                      bra.s      $0003F2C6
[0003f2c0] 0c10 000a                 cmpi.b     #$0A,(a0)
[0003f2c4] 660a                      bne.s      $0003F2D0
[0003f2c6] 4218                      clr.b      (a0)+
[0003f2c8] 5284                      addq.l     #1,d4
[0003f2ca] 22c8                      move.l     a0,(a1)+
[0003f2cc] 5383                      subq.l     #1,d3
[0003f2ce] 6008                      bra.s      $0003F2D8
[0003f2d0] 5248                      addq.w     #1,a0
[0003f2d2] 5383                      subq.l     #1,d3
[0003f2d4] 4a83                      tst.l      d3
[0003f2d6] 6ed0                      bgt.s      $0003F2A8
[0003f2d8] 4a83                      tst.l      d3
[0003f2da] 6ecc                      bgt.s      $0003F2A8
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
[0003f34c] 204b                      movea.l    a3,a0
[0003f34e] 223c 0000 2000            move.l     #$00002000,d1
[0003f354] 3003                      move.w     d3,d0
[0003f356] 4eb9 0008 0cd2            jsr        Fread
[0003f35c] 2800                      move.l     d0,d4
[0003f35e] 4a80                      tst.l      d0
[0003f360] 6f0a                      ble.s      $0003F36C
[0003f362] 224b                      movea.l    a3,a1
[0003f364] 204a                      movea.l    a2,a0
[0003f366] 6100 ff02                 bsr        put_block
[0003f36a] 60da                      bra.s      $0003F346
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
[0003f3b2] 6f0a                      ble.s      $0003F3BE
[0003f3b4] 2003                      move.l     d3,d0
[0003f3b6] 204c                      movea.l    a4,a0
[0003f3b8] 6100 ff78                 bsr        merge
[0003f3bc] 600e                      bra.s      $0003F3CC
[0003f3be] 43f9 000d 4a1f            lea.l      $000D4A1F,a1
[0003f3c4] 204a                      movea.l    a2,a0
[0003f3c6] 4eb9 0004 0696            jsr        info_string
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
[0003f422] 672e                      beq.s      $0003F452
[0003f424] 43eb 00b8                 lea.l      184(a3),a1
[0003f428] 41f9 000d 0530            lea.l      WARN_2SAVED,a0
[0003f42e] 4eb9 0006 b80c            jsr        alert_str
[0003f434] 5340                      subq.w     #1,d0
[0003f436] 6706                      beq.s      $0003F43E
[0003f438] 5540                      subq.w     #2,d0
[0003f43a] 6738                      beq.s      $0003F474
[0003f43c] 6014                      bra.s      $0003F452
[0003f43e] 006b 0100 0294            ori.w      #$0100,660(a3)
[0003f444] 204a                      movea.l    a2,a0
[0003f446] 4eb9 0003 fac2            jsr        ed_save
[0003f44c] 026b feff 0294            andi.w     #$FEFF,660(a3)
[0003f452] 486b 0182                 pea.l      386(a3)
[0003f456] 43eb 0192                 lea.l      402(a3),a1
[0003f45a] 41eb 0008                 lea.l      8(a3),a0
[0003f45e] 4eb9 0006 cefe            jsr        Af_select
[0003f464] 584f                      addq.w     #4,a7
[0003f466] 2848                      movea.l    a0,a4
[0003f468] 200c                      move.l     a4,d0
[0003f46a] 6708                      beq.s      $0003F474
[0003f46c] 224c                      movea.l    a4,a1
[0003f46e] 204a                      movea.l    a2,a0
[0003f470] 6100 ff08                 bsr        open_file
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
[0003f492] 6b00 00a4                 bmi        $0003F538
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
[0003f56a] 6708                      beq.s      $0003F574
[0003f56c] 224c                      movea.l    a4,a1
[0003f56e] 204a                      movea.l    a2,a0
[0003f570] 6100 ff08                 bsr        merge_it
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
[0003f5bc] 6700 01da                 beq        $0003F798
[0003f5c0] 7240                      moveq.l    #64,d1
[0003f5c2] c26c 0294                 and.w      660(a4),d1
[0003f5c6] 6710                      beq.s      $0003F5D8
[0003f5c8] 204b                      movea.l    a3,a0
[0003f5ca] 303c 00f3                 move.w     #$00F3,d0
[0003f5ce] 93c9                      suba.l     a1,a1
[0003f5d0] 4eb9 0003 a772            jsr        Auo_editor
[0003f5d6] 600e                      bra.s      $0003F5E6
[0003f5d8] 93c9                      suba.l     a1,a1
[0003f5da] 303c 00f4                 move.w     #$00F4,d0
[0003f5de] 204b                      movea.l    a3,a0
[0003f5e0] 4eb9 0003 a772            jsr        Auo_editor
[0003f5e6] 7010                      moveq.l    #16,d0
[0003f5e8] c06c 0294                 and.w      660(a4),d0
[0003f5ec] 6710                      beq.s      $0003F5FE
[0003f5ee] 93c9                      suba.l     a1,a1
[0003f5f0] 204b                      movea.l    a3,a0
[0003f5f2] 303c 00f6                 move.w     #$00F6,d0
[0003f5f6] 4eb9 0003 a772            jsr        Auo_editor
[0003f5fc] 600e                      bra.s      $0003F60C
[0003f5fe] 93c9                      suba.l     a1,a1
[0003f600] 303c 00f5                 move.w     #$00F5,d0
[0003f604] 204b                      movea.l    a3,a0
[0003f606] 4eb9 0003 a772            jsr        Auo_editor
[0003f60c] 7020                      moveq.l    #32,d0
[0003f60e] c06c 0294                 and.w      660(a4),d0
[0003f612] 6710                      beq.s      $0003F624
[0003f614] 93c9                      suba.l     a1,a1
[0003f616] 204b                      movea.l    a3,a0
[0003f618] 303c 00f7                 move.w     #$00F7,d0
[0003f61c] 4eb9 0003 a772            jsr        Auo_editor
[0003f622] 600e                      bra.s      $0003F632
[0003f624] 93c9                      suba.l     a1,a1
[0003f626] 303c 00f8                 move.w     #$00F8,d0
[0003f62a] 204b                      movea.l    a3,a0
[0003f62c] 4eb9 0003 a772            jsr        Auo_editor
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
[0003f656] 2016                      move.l     (a6),d0
[0003f658] 6b32                      bmi.s      $0003F68C
[0003f65a] 7240                      moveq.l    #64,d1
[0003f65c] c26c 0294                 and.w      660(a4),d1
[0003f660] 672a                      beq.s      $0003F68C
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
[0003f68c] 226f 003c                 movea.l    60(a7),a1
[0003f690] 303c 00f2                 move.w     #$00F2,d0
[0003f694] 204b                      movea.l    a3,a0
[0003f696] 4eb9 0003 a772            jsr        Auo_editor
[0003f69c] 224a                      movea.l    a2,a1
[0003f69e] 303c 00e3                 move.w     #$00E3,d0
[0003f6a2] 204b                      movea.l    a3,a0
[0003f6a4] 4eb9 0003 a772            jsr        Auo_editor
[0003f6aa] 2012                      move.l     (a2),d0
[0003f6ac] 6b24                      bmi.s      $0003F6D2
[0003f6ae] 2216                      move.l     (a6),d1
[0003f6b0] b280                      cmp.l      d0,d1
[0003f6b2] 6626                      bne.s      $0003F6DA
[0003f6b4] 242e 0004                 move.l     4(a6),d2
[0003f6b8] b4aa 0004                 cmp.l      4(a2),d2
[0003f6bc] 661c                      bne.s      $0003F6DA
[0003f6be] 206e 0008                 movea.l    8(a6),a0
[0003f6c2] b1ea 0008                 cmpa.l     8(a2),a0
[0003f6c6] 6612                      bne.s      $0003F6DA
[0003f6c8] 226e 000c                 movea.l    12(a6),a1
[0003f6cc] b3ea 000c                 cmpa.l     12(a2),a1
[0003f6d0] 6608                      bne.s      $0003F6DA
[0003f6d2] 0a6c 0040 0294            eori.w     #$0040,660(a4)
[0003f6d8] 607c                      bra.s      $0003F756
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
[0003f752] 6600 fefe                 bne        $0003F652
[0003f756] 93c9                      suba.l     a1,a1
[0003f758] 303c 00db                 move.w     #$00DB,d0
[0003f75c] 204b                      movea.l    a3,a0
[0003f75e] 4eb9 0003 a772            jsr        Auo_editor
[0003f764] 93c9                      suba.l     a1,a1
[0003f766] 7005                      moveq.l    #5,d0
[0003f768] 204b                      movea.l    a3,a0
[0003f76a] 4eb9 0003 a772            jsr        Auo_editor
[0003f770] 2016                      move.l     (a6),d0
[0003f772] 6b0e                      bmi.s      $0003F782
[0003f774] 224e                      movea.l    a6,a1
[0003f776] 204b                      movea.l    a3,a0
[0003f778] 303c 00e4                 move.w     #$00E4,d0
[0003f77c] 4eb9 0003 a772            jsr        Auo_editor
[0003f782] 93c9                      suba.l     a1,a1
[0003f784] 303c 00d6                 move.w     #$00D6,d0
[0003f788] 204b                      movea.l    a3,a0
[0003f78a] 4eb9 0003 a772            jsr        Auo_editor
[0003f790] 206f 0040                 movea.l    64(a7),a0
[0003f794] 6100 d626                 bsr        dirty
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
[0003f7c6] 6700 0118                 beq        $0003F8E0
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
[0003f83e] 6600 0098                 bne        $0003F8D8
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
[0003f88e] 6706                      beq.s      $0003F896
[0003f890] 006b 0020 0294            ori.w      #$0020,660(a3)
[0003f896] 7001                      moveq.l    #1,d0
[0003f898] 206c 0014                 movea.l    20(a4),a0
[0003f89c] c068 00e2                 and.w      226(a0),d0
[0003f8a0] 6706                      beq.s      $0003F8A8
[0003f8a2] 006b 0040 0294            ori.w      #$0040,660(a3)
[0003f8a8] 7001                      moveq.l    #1,d0
[0003f8aa] 206c 0014                 movea.l    20(a4),a0
[0003f8ae] c068 0172                 and.w      370(a0),d0
[0003f8b2] 6706                      beq.s      $0003F8BA
[0003f8b4] 006b 0010 0294            ori.w      #$0010,660(a3)
[0003f8ba] 7001                      moveq.l    #1,d0
[0003f8bc] 206c 0014                 movea.l    20(a4),a0
[0003f8c0] c068 0112                 and.w      274(a0),d0
[0003f8c4] 6706                      beq.s      $0003F8CC
[0003f8c6] 006b 0008 0294            ori.w      #$0008,660(a3)
[0003f8cc] 3b6b 0294 0122            move.w     660(a3),290(a5)
[0003f8d2] 204a                      movea.l    a2,a0
[0003f8d4] 6100 fcca                 bsr        replace_next
[0003f8d8] 204c                      movea.l    a4,a0
[0003f8da] 4eb9 0005 85f2            jsr        Awi_delete
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
[0003f928] 6f08                      ble.s      $0003F932
[0003f92a] 2800                      move.l     d0,d4
[0003f92c] 2aaf 0018                 move.l     24(a7),(a5)
[0003f930] 6014                      bra.s      $0003F946
[0003f932] 224d                      movea.l    a5,a1
[0003f934] 303c 00e9                 move.w     #$00E9,d0
[0003f938] 206f 0020                 movea.l    32(a7),a0
[0003f93c] 4eb9 0003 a772            jsr        Auo_editor
[0003f942] 5395                      subq.l     #1,(a5)
[0003f944] 7800                      moveq.l    #0,d4
[0003f946] 2e84                      move.l     d4,(a7)
[0003f948] 6000 0076                 bra.w      $0003F9C0
[0003f94c] 43d7                      lea.l      (a7),a1
[0003f94e] 303c 00ca                 move.w     #$00CA,d0
[0003f952] 206f 0020                 movea.l    32(a7),a0
[0003f956] 4eb9 0003 a772            jsr        Auo_editor
[0003f95c] 2017                      move.l     (a7),d0
[0003f95e] b095                      cmp.l      (a5),d0
[0003f960] 6606                      bne.s      $0003F968
[0003f962] 282f 0004                 move.l     4(a7),d4
[0003f966] 6006                      bra.s      $0003F96E
[0003f968] 7802                      moveq.l    #2,d4
[0003f96a] d8af 0004                 add.l      4(a7),d4
[0003f96e] 2003                      move.l     d3,d0
[0003f970] d084                      add.l      d4,d0
[0003f972] b0bc 0000 2000            cmp.l      #$00002000,d0
[0003f978] 6d16                      blt.s      $0003F990
[0003f97a] 204a                      movea.l    a2,a0
[0003f97c] 2203                      move.l     d3,d1
[0003f97e] 3005                      move.w     d5,d0
[0003f980] 4eb9 0008 0d5e            jsr        Fwrite
[0003f986] 2c00                      move.l     d0,d6
[0003f988] b680                      cmp.l      d0,d3
[0003f98a] 6652                      bne.s      $0003F9DE
[0003f98c] 264a                      movea.l    a2,a3
[0003f98e] 7600                      moveq.l    #0,d3
[0003f990] d684                      add.l      d4,d3
[0003f992] 202f 0004                 move.l     4(a7),d0
[0003f996] 6f0c                      ble.s      $0003F9A4
[0003f998] 226f 0008                 movea.l    8(a7),a1
[0003f99c] 204b                      movea.l    a3,a0
[0003f99e] 4eb9 0008 2fd6            jsr        strncpy
[0003f9a4] 47f2 3000                 lea.l      0(a2,d3.w),a3
[0003f9a8] 2017                      move.l     (a7),d0
[0003f9aa] b095                      cmp.l      (a5),d0
[0003f9ac] 6710                      beq.s      $0003F9BE
[0003f9ae] 43f9 000d 4a2c            lea.l      $000D4A2C,a1
[0003f9b4] 41eb fffe                 lea.l      -2(a3),a0
[0003f9b8] 4eb9 0008 2f0c            jsr        strcpy
[0003f9be] 5297                      addq.l     #1,(a7)
[0003f9c0] 2017                      move.l     (a7),d0
[0003f9c2] b095                      cmp.l      (a5),d0
[0003f9c4] 6f00 ff86                 ble.w      $0003F94C
[0003f9c8] 4a83                      tst.l      d3
[0003f9ca] 6f2e                      ble.s      $0003F9FA
[0003f9cc] 204a                      movea.l    a2,a0
[0003f9ce] 2203                      move.l     d3,d1
[0003f9d0] 3005                      move.w     d5,d0
[0003f9d2] 4eb9 0008 0d5e            jsr        Fwrite
[0003f9d8] 2c00                      move.l     d0,d6
[0003f9da] b680                      cmp.l      d0,d3
[0003f9dc] 671c                      beq.s      $0003F9FA
[0003f9de] 91c8                      suba.l     a0,a0
[0003f9e0] 700a                      moveq.l    #10,d0
[0003f9e2] 2279 0010 ee4e            movea.l    ACSblk,a1
[0003f9e8] 2269 03d6                 movea.l    982(a1),a1
[0003f9ec] 4e91                      jsr        (a1)
[0003f9ee] 3005                      move.w     d5,d0
[0003f9f0] 4eb9 0008 0c7e            jsr        Fclose
[0003f9f6] 70ff                      moveq.l    #-1,d0
[0003f9f8] 600a                      bra.s      $0003FA04
[0003f9fa] 3005                      move.w     d5,d0
[0003f9fc] 4eb9 0008 0c7e            jsr        Fclose
[0003fa02] 4240                      clr.w      d0
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
[0003fa30] 6610                      bne.s      $0003FA42
[0003fa32] 43f9 000d 4a2f            lea.l      $000D4A2F,a1
[0003fa38] 41d7                      lea.l      (a7),a0
[0003fa3a] 4eb9 0008 2e42            jsr        strcat
[0003fa40] 600e                      bra.s      $0003FA50
[0003fa42] 43f9 000d 4a2f            lea.l      $000D4A2F,a1
[0003fa48] 204c                      movea.l    a4,a0
[0003fa4a] 4eb9 0008 2f0c            jsr        strcpy
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
[0003fa6c] 6b3e                      bmi.s      $0003FAAC
[0003fa6e] 204d                      movea.l    a5,a0
[0003fa70] 6100 fe84                 bsr        save_text
[0003fa74] 4a40                      tst.w      d0
[0003fa76] 6716                      beq.s      $0003FA8E
[0003fa78] 204a                      movea.l    a2,a0
[0003fa7a] 4eb9 0008 0ca0            jsr        Fdelete
[0003fa80] 224a                      movea.l    a2,a1
[0003fa82] 41d7                      lea.l      (a7),a0
[0003fa84] 4240                      clr.w      d0
[0003fa86] 4eb9 0008 0ce8            jsr        Frename
[0003fa8c] 600c                      bra.s      $0003FA9A
[0003fa8e] 4a83                      tst.l      d3
[0003fa90] 6608                      bne.s      $0003FA9A
[0003fa92] 41d7                      lea.l      (a7),a0
[0003fa94] 4eb9 0008 0ca0            jsr        Fdelete
[0003fa9a] 204a                      movea.l    a2,a0
[0003fa9c] 4eb9 0006 1fe0            jsr        Aev_OlgaUpdate
[0003faa2] 204a                      movea.l    a2,a0
[0003faa4] 4eb9 0006 056e            jsr        Aev_DhstSaved
[0003faaa] 600c                      bra.s      $0003FAB8
[0003faac] 224a                      movea.l    a2,a1
[0003faae] 41d7                      lea.l      (a7),a0
[0003fab0] 4240                      clr.w      d0
[0003fab2] 4eb9 0008 0ce8            jsr        Frename
[0003fab8] 4fef 0100                 lea.l      256(a7),a7
[0003fabc] 4cdf 3418                 movem.l    (a7)+,d3-d4/a2/a4-a5
[0003fac0] 4e75                      rts
ed_save:
[0003fac2] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003fac6] 2448                      movea.l    a0,a2
[0003fac8] 2850                      movea.l    (a0),a4
[0003faca] 2654                      movea.l    (a4),a3
[0003facc] 200b                      move.l     a3,d0
[0003face] 671c                      beq.s      $0003FAEC
[0003fad0] 322c 0294                 move.w     660(a4),d1
[0003fad4] c27c 0100                 and.w      #$0100,d1
[0003fad8] 6612                      bne.s      $0003FAEC
[0003fada] 2248                      movea.l    a0,a1
[0003fadc] 2a6b 0004                 movea.l    4(a3),a5
[0003fae0] 204b                      movea.l    a3,a0
[0003fae2] 303c 00d2                 move.w     #$00D2,d0
[0003fae6] 4e95                      jsr        (a5)
[0003fae8] 5340                      subq.w     #1,d0
[0003faea] 674e                      beq.s      $0003FB3A
[0003faec] 47ec 0192                 lea.l      402(a4),a3
[0003faf0] 1013                      move.b     (a3),d0
[0003faf2] 660a                      bne.s      $0003FAFE
[0003faf4] 204a                      movea.l    a2,a0
[0003faf6] 4eb9 0003 fb50            jsr        ed_saveas
[0003fafc] 603c                      bra.s      $0003FB3A
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
[0003fb70] 6b40                      bmi.s      $0003FBB2
[0003fb72] 41f9 000d 048a            lea.l      ASK_SELECT,a0
[0003fb78] 7001                      moveq.l    #1,d0
[0003fb7a] 4eb9 0005 a600            jsr        Awi_alert
[0003fb80] 5540                      subq.w     #2,d0
[0003fb82] 662c                      bne.s      $0003FBB0
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
[0003fbae] 6002                      bra.s      $0003FBB2
[0003fbb0] 7601                      moveq.l    #1,d3
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
[0003fbdc] 6724                      beq.s      $0003FC02
[0003fbde] 224d                      movea.l    a5,a1
[0003fbe0] 204b                      movea.l    a3,a0
[0003fbe2] 6100 fe2a                 bsr        save_it
[0003fbe6] 4a43                      tst.w      d3
[0003fbe8] 6618                      bne.s      $0003FC02
[0003fbea] 224d                      movea.l    a5,a1
[0003fbec] 41ec 0192                 lea.l      402(a4),a0
[0003fbf0] 4eb9 0008 2f0c            jsr        strcpy
[0003fbf6] 204a                      movea.l    a2,a0
[0003fbf8] 6100 d07c                 bsr        set_icon
[0003fbfc] 204a                      movea.l    a2,a0
[0003fbfe] 6100 d176                 bsr        undirty
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
[0003fc6c] 664c                      bne.s      $0003FCBA
[0003fc6e] 222c 0004                 move.l     4(a4),d1
[0003fc72] 6646                      bne.s      $0003FCBA
[0003fc74] 242c 0008                 move.l     8(a4),d2
[0003fc78] 9480                      sub.l      d0,d2
[0003fc7a] 5282                      addq.l     #1,d2
[0003fc7c] 206f 001c                 movea.l    28(a7),a0
[0003fc80] b1c2                      cmpa.l     d2,a0
[0003fc82] 6636                      bne.s      $0003FCBA
[0003fc84] 226c 000c                 movea.l    12(a4),a1
[0003fc88] b3ef 0004                 cmpa.l     4(a7),a1
[0003fc8c] 662c                      bne.s      $0003FCBA
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
[0003fcb8] 6056                      bra.s      $0003FD10
[0003fcba] 2014                      move.l     (a4),d0
[0003fcbc] 6b0e                      bmi.s      $0003FCCC
[0003fcbe] 93c9                      suba.l     a1,a1
[0003fcc0] 204a                      movea.l    a2,a0
[0003fcc2] 303c 00e2                 move.w     #$00E2,d0
[0003fcc6] 4eb9 0003 a772            jsr        Auo_editor
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
[0003fd82] 6f78                      ble.s      $0003FDFC
[0003fd84] b0af 0004                 cmp.l      4(a7),d0
[0003fd88] 6c72                      bge.s      $0003FDFC
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
[0003fe36] 6700 0226                 beq        $0004005E
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
[0003fe86] 6716                      beq.s      $0003FE9E
[0003fe88] 206a 0014                 movea.l    20(a2),a0
[0003fe8c] 0068 0001 012a            ori.w      #$0001,298(a0)
[0003fe92] 206a 0014                 movea.l    20(a2),a0
[0003fe96] 0268 fffe 00fa            andi.w     #$FFFE,250(a0)
[0003fe9c] 6014                      bra.s      $0003FEB2
[0003fe9e] 206a 0014                 movea.l    20(a2),a0
[0003fea2] 0068 0001 00fa            ori.w      #$0001,250(a0)
[0003fea8] 206a 0014                 movea.l    20(a2),a0
[0003feac] 0268 fffe 012a            andi.w     #$FFFE,298(a0)
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
[0003ff22] 6600 0132                 bne        $00040056
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
[0003ff82] 6728                      beq.s      $0003FFAC
[0003ff84] 41ec 0697                 lea.l      1687(a4),a0
[0003ff88] 4eb9 0008 3180            jsr        strupr
[0003ff8e] 4eb9 0008 2f6c            jsr        strlen
[0003ff94] 600c                      bra.s      $0003FFA2
[0003ff96] 41f4 0000                 lea.l      0(a4,d0.w),a0
[0003ff9a] 117c 0020 0697            move.b     #$20,1687(a0)
[0003ffa0] 5240                      addq.w     #1,d0
[0003ffa2] b07c 0008                 cmp.w      #$0008,d0
[0003ffa6] 6dee                      blt.s      $0003FF96
[0003ffa8] 422c 069f                 clr.b      1695(a4)
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
[0004001c] 6710                      beq.s      $0004002E
[0004001e] 93c9                      suba.l     a1,a1
[00040020] 204b                      movea.l    a3,a0
[00040022] 303c 00e0                 move.w     #$00E0,d0
[00040026] 4eb9 0003 a772            jsr        Auo_editor
[0004002c] 600e                      bra.s      $0004003C
[0004002e] 93c9                      suba.l     a1,a1
[00040030] 303c 00e1                 move.w     #$00E1,d0
[00040034] 204b                      movea.l    a3,a0
[00040036] 4eb9 0003 a772            jsr        Auo_editor
[0004003c] 93c9                      suba.l     a1,a1
[0004003e] 7006                      moveq.l    #6,d0
[00040040] 204b                      movea.l    a3,a0
[00040042] 4eb9 0003 a772            jsr        Auo_editor
[00040048] 93c9                      suba.l     a1,a1
[0004004a] 303c 00d6                 move.w     #$00D6,d0
[0004004e] 204b                      movea.l    a3,a0
[00040050] 4eb9 0003 a772            jsr        Auo_editor
[00040056] 204a                      movea.l    a2,a0
[00040058] 4eb9 0005 85f2            jsr        Awi_delete
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
[00040084] 6700 018a                 beq        $00040210
[00040088] 3f2a f3ba                 move.w     -3142(a2),-(a7)
[0004008c] 43f9 000d 4a34            lea.l      $000D4A34,a1
[00040092] 7003                      moveq.l    #3,d0
[00040094] 2068 0014                 movea.l    20(a0),a0
[00040098] 4eb9 0005 0f94            jsr        Aob_printf
[0004009e] 544f                      addq.w     #2,a7
[000400a0] 206f 0026                 movea.l    38(a7),a0
[000400a4] 4eb9 0005 9df4            jsr        Awi_dialog
[000400aa] 5b40                      subq.w     #5,d0
[000400ac] 6600 0158                 bne        $00040206
[000400b0] 47ef 0024                 lea.l      36(a7),a3
[000400b4] 4853                      pea.l      (a3)
[000400b6] 43f9 000d 4a34            lea.l      $000D4A34,a1
[000400bc] 7003                      moveq.l    #3,d0
[000400be] 206f 002a                 movea.l    42(a7),a0
[000400c2] 2068 0014                 movea.l    20(a0),a0
[000400c6] 4eb9 0005 10fe            jsr        Aob_scanf
[000400cc] 584f                      addq.w     #4,a7
[000400ce] 3013                      move.w     (a3),d0
[000400d0] 6f00 0134                 ble        $00040206
[000400d4] 3540 f3ba                 move.w     d0,-3142(a2)
[000400d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000400de] 2268 0258                 movea.l    600(a0),a1
[000400e2] 2869 0014                 movea.l    20(a1),a4
[000400e6] 43ef 0010                 lea.l      16(a7),a1
[000400ea] 204c                      movea.l    a4,a0
[000400ec] 303c 00e3                 move.w     #$00E3,d0
[000400f0] 4eb9 0003 a772            jsr        Auo_editor
[000400f6] 202f 0010                 move.l     16(a7),d0
[000400fa] 6b18                      bmi.s      $00040114
[000400fc] 2600                      move.l     d0,d3
[000400fe] 2f6f 0018 000c            move.l     24(a7),12(a7)
[00040104] 93c9                      suba.l     a1,a1
[00040106] 204c                      movea.l    a4,a0
[00040108] 303c 00e2                 move.w     #$00E2,d0
[0004010c] 4eb9 0003 a772            jsr        Auo_editor
[00040112] 6016                      bra.s      $0004012A
[00040114] 7600                      moveq.l    #0,d3
[00040116] 43ef 000c                 lea.l      12(a7),a1
[0004011a] 303c 00e9                 move.w     #$00E9,d0
[0004011e] 204c                      movea.l    a4,a0
[00040120] 4eb9 0003 a772            jsr        Auo_editor
[00040126] 53af 000c                 subq.l     #1,12(a7)
[0004012a] 93c9                      suba.l     a1,a1
[0004012c] 303c 00d5                 move.w     #$00D5,d0
[00040130] 204c                      movea.l    a4,a0
[00040132] 4eb9 0003 a772            jsr        Auo_editor
[00040138] 43ef 0020                 lea.l      32(a7),a1
[0004013c] 303c 0107                 move.w     #$0107,d0
[00040140] 204c                      movea.l    a4,a0
[00040142] 4eb9 0003 a772            jsr        Auo_editor
[00040148] 2e83                      move.l     d3,(a7)
[0004014a] 43d7                      lea.l      (a7),a1
[0004014c] 303c 00ca                 move.w     #$00CA,d0
[00040150] 204c                      movea.l    a4,a0
[00040152] 4eb9 0003 a772            jsr        Auo_editor
[00040158] 382f 0006                 move.w     6(a7),d4
[0004015c] b853                      cmp.w      (a3),d4
[0004015e] 6f4e                      ble.s      $000401AE
[00040160] 3813                      move.w     (a3),d4
[00040162] 2a6f 0008                 movea.l    8(a7),a5
[00040166] dac4                      adda.w     d4,a5
[00040168] b87c 0001                 cmp.w      #$0001,d4
[0004016c] 6c04                      bge.s      $00040172
[0004016e] 3813                      move.w     (a3),d4
[00040170] 6018                      bra.s      $0004018A
[00040172] 534d                      subq.w     #1,a5
[00040174] 1015                      move.b     (a5),d0
[00040176] 4880                      ext.w      d0
[00040178] 206f 0020                 movea.l    32(a7),a0
[0004017c] 4eb9 0008 2e8a            jsr        strchr
[00040182] 2008                      move.l     a0,d0
[00040184] 6604                      bne.s      $0004018A
[00040186] 5344                      subq.w     #1,d4
[00040188] 60de                      bra.s      $00040168
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
[000401ae] 5283                      addq.l     #1,d3
[000401b0] b6af 000c                 cmp.l      12(a7),d3
[000401b4] 6f92                      ble.s      $00040148
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
[00040206] 206f 0026                 movea.l    38(a7),a0
[0004020a] 4eb9 0005 85f2            jsr        Awi_delete
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
[0004031c] 6f00 0076                 ble.w      $00040394
[00040320] 41ea 0172                 lea.l      370(a2),a0
[00040324] 223c 0000 052e            move.l     #$0000052E,d1
[0004032a] 3003                      move.w     d3,d0
[0004032c] 4eb9 0008 0d5e            jsr        Fwrite
[00040332] 4244                      clr.w      d4
[00040334] 3e84                      move.w     d4,(a7)
[00040336] 6014                      bra.s      $0004034C
[00040338] 3004                      move.w     d4,d0
[0004033a] 48c0                      ext.l      d0
[0004033c] e588                      lsl.l      #2,d0
[0004033e] 41f2 0800                 lea.l      0(a2,d0.l),a0
[00040342] 2228 00d2                 move.l     210(a0),d1
[00040346] 6702                      beq.s      $0004034A
[00040348] 5257                      addq.w     #1,(a7)
[0004034a] 5244                      addq.w     #1,d4
[0004034c] b87c 0028                 cmp.w      #$0028,d4
[00040350] 6de6                      blt.s      $00040338
[00040352] 41d7                      lea.l      (a7),a0
[00040354] 7204                      moveq.l    #4,d1
[00040356] 3003                      move.w     d3,d0
[00040358] 4eb9 0008 0d5e            jsr        Fwrite
[0004035e] 4244                      clr.w      d4
[00040360] 3e84                      move.w     d4,(a7)
[00040362] 6022                      bra.s      $00040386
[00040364] 3004                      move.w     d4,d0
[00040366] 48c0                      ext.l      d0
[00040368] e588                      lsl.l      #2,d0
[0004036a] 41f2 0800                 lea.l      0(a2,d0.l),a0
[0004036e] 2228 00d2                 move.l     210(a0),d1
[00040372] 6710                      beq.s      $00040384
[00040374] 2041                      movea.l    d1,a0
[00040376] 3003                      move.w     d3,d0
[00040378] 223c 0000 0102            move.l     #$00000102,d1
[0004037e] 4eb9 0008 0d5e            jsr        Fwrite
[00040384] 5244                      addq.w     #1,d4
[00040386] b87c 0028                 cmp.w      #$0028,d4
[0004038a] 6dd8                      blt.s      $00040364
[0004038c] 3003                      move.w     d3,d0
[0004038e] 4eb9 0008 0c7e            jsr        Fclose
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
[000403ca] 6b00 0156                 bmi        $00040522
[000403ce] 2053                      movea.l    (a3),a0
[000403d0] 0c68 0002 02ca            cmpi.w     #$0002,714(a0)
[000403d6] 6600 014a                 bne        $00040522
[000403da] 2800                      move.l     d0,d4
[000403dc] 601a                      bra.s      $000403F8
[000403de] 2e84                      move.l     d4,(a7)
[000403e0] 43d7                      lea.l      (a7),a1
[000403e2] 303c 00ca                 move.w     #$00CA,d0
[000403e6] 204c                      movea.l    a4,a0
[000403e8] 4eb9 0003 a772            jsr        Auo_editor
[000403ee] 7001                      moveq.l    #1,d0
[000403f0] d0af 0004                 add.l      4(a7),d0
[000403f4] d680                      add.l      d0,d3
[000403f6] 5284                      addq.l     #1,d4
[000403f8] b8aa 0008                 cmp.l      8(a2),d4
[000403fc] 6fe0                      ble.s      $000403DE
[000403fe] 7002                      moveq.l    #2,d0
[00040400] d083                      add.l      d3,d0
[00040402] 4eb9 0004 c608            jsr        Ax_malloc
[00040408] 2a48                      movea.l    a0,a5
[0004040a] 200d                      move.l     a5,d0
[0004040c] 6700 0114                 beq        $00040522
[00040410] 4210                      clr.b      (a0)
[00040412] 7600                      moveq.l    #0,d3
[00040414] 2812                      move.l     (a2),d4
[00040416] 6030                      bra.s      $00040448
[00040418] 2e84                      move.l     d4,(a7)
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
[00040448] b8aa 0008                 cmp.l      8(a2),d4
[0004044c] 6fca                      ble.s      $00040418
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
[0004055c] 6700 012e                 beq        $0004068C
[00040560] 4eb9 0004 7e1e            jsr        Adr_start
[00040566] 4eb9 0004 7e2a            jsr        Adr_next
[0004056c] 3600                      move.w     d0,d3
[0004056e] 4a40                      tst.w      d0
[00040570] 6b00 011a                 bmi        $0004068C
[00040574] 48c0                      ext.l      d0
[00040576] 2200                      move.l     d0,d1
[00040578] d281                      add.l      d1,d1
[0004057a] d280                      add.l      d0,d1
[0004057c] e789                      lsl.l      #3,d1
[0004057e] 286a 0014                 movea.l    20(a2),a4
[00040582] 49f4 1818                 lea.l      24(a4,d1.l),a4
[00040586] 342c 0016                 move.w     22(a4),d2
[0004058a] 947c 000b                 sub.w      #$000B,d2
[0004058e] 6712                      beq.s      $000405A2
[00040590] 947c 0009                 sub.w      #$0009,d2
[00040594] 6700 00b6                 beq        $0004064C
[00040598] 947c 000b                 sub.w      #$000B,d2
[0004059c] 6704                      beq.s      $000405A2
[0004059e] 6000 00ec                 bra        $0004068C
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
[0004064a] 6040                      bra.s      $0004068C
[0004064c] 2c53                      movea.l    (a3),a6
[0004064e] 303c 0080                 move.w     #$0080,d0
[00040652] c06e 0294                 and.w      660(a6),d0
[00040656] 6720                      beq.s      $00040678
[00040658] 43ee 00b8                 lea.l      184(a6),a1
[0004065c] 41f9 000d 0530            lea.l      WARN_2SAVED,a0
[00040662] 4eb9 0006 b80c            jsr        alert_str
[00040668] 5340                      subq.w     #1,d0
[0004066a] 6706                      beq.s      $00040672
[0004066c] 5540                      subq.w     #2,d0
[0004066e] 671c                      beq.s      $0004068C
[00040670] 6006                      bra.s      $00040678
[00040672] 204b                      movea.l    a3,a0
[00040674] 6100 f44c                 bsr        ed_save
[00040678] 3003                      move.w     d3,d0
[0004067a] 204a                      movea.l    a2,a0
[0004067c] 4eb9 0004 7f76            jsr        Adr_del
[00040682] 226c 000c                 movea.l    12(a4),a1
[00040686] 204b                      movea.l    a3,a0
[00040688] 6100 ecf0                 bsr        open_file
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
[000406a6] 6620                      bne.s      $000406C8
[000406a8] 206a 0018                 movea.l    24(a2),a0
[000406ac] 700d                      moveq.l    #13,d0
[000406ae] 4eb9 0005 0fd8            jsr        Aob_puttext
[000406b4] 72ff                      moveq.l    #-1,d1
[000406b6] 303c 100d                 move.w     #$100D,d0
[000406ba] 204a                      movea.l    a2,a0
[000406bc] 226a 0066                 movea.l    102(a2),a1
[000406c0] 4e91                      jsr        (a1)
[000406c2] 377c 0005 00c8            move.w     #$0005,200(a3)
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
[000406e6] 51c8 fffc                 dbf        d0,$000406E4
[000406ea] 30d9                      move.w     (a1)+,(a0)+
[000406ec] 2853                      movea.l    (a3),a4
[000406ee] 302d 0016                 move.w     22(a5),d0
[000406f2] 907c 000b                 sub.w      #$000B,d0
[000406f6] 6712                      beq.s      $0004070A
[000406f8] 907c 0009                 sub.w      #$0009,d0
[000406fc] 670c                      beq.s      $0004070A
[000406fe] 907c 000a                 sub.w      #$000A,d0
[00040702] 6706                      beq.s      $0004070A
[00040704] 5340                      subq.w     #1,d0
[00040706] 6702                      beq.s      $0004070A
[00040708] 6038                      bra.s      $00040742
[0004070a] 203c 0000 00ff            move.l     #$000000FF,d0
[00040710] 226d 000c                 movea.l    12(a5),a1
[00040714] 41ef 0002                 lea.l      2(a7),a0
[00040718] 4eb9 0008 2f96            jsr        strncat
[0004071e] 224b                      movea.l    a3,a1
[00040720] 41d7                      lea.l      (a7),a0
[00040722] 4eb9 0004 07d4            jsr        edit_fkey
[00040728] 5340                      subq.w     #1,d0
[0004072a] 661a                      bne.s      $00040746
[0004072c] 43d7                      lea.l      (a7),a1
[0004072e] 303c 0192                 move.w     #$0192,d0
[00040732] 206c 0004                 movea.l    4(a4),a0
[00040736] 266c 0004                 movea.l    4(a4),a3
[0004073a] 246b 0004                 movea.l    4(a3),a2
[0004073e] 4e92                      jsr        (a2)
[00040740] 6004                      bra.s      $00040746
[00040742] 4240                      clr.w      d0
[00040744] 6002                      bra.s      $00040748
[00040746] 7001                      moveq.l    #1,d0
[00040748] 4fef 0102                 lea.l      258(a7),a7
[0004074c] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00040750] 4e75                      rts
comp_fkey:
[00040752] 1028 0001                 move.b     1(a0),d0
[00040756] 4880                      ext.w      d0
[00040758] d07c fff0                 add.w      #$FFF0,d0
[0004075c] 3210                      move.w     (a0),d1
[0004075e] c27c 0400                 and.w      #$0400,d1
[00040762] 6704                      beq.s      $00040768
[00040764] d07c 0014                 add.w      #$0014,d0
[00040768] 3210                      move.w     (a0),d1
[0004076a] c27c 0300                 and.w      #$0300,d1
[0004076e] 6704                      beq.s      $00040774
[00040770] d07c 000a                 add.w      #$000A,d0
[00040774] 1229 0001                 move.b     1(a1),d1
[00040778] 4881                      ext.w      d1
[0004077a] d27c fff0                 add.w      #$FFF0,d1
[0004077e] 3411                      move.w     (a1),d2
[00040780] c47c 0400                 and.w      #$0400,d2
[00040784] 6704                      beq.s      $0004078A
[00040786] d27c 0014                 add.w      #$0014,d1
[0004078a] 3411                      move.w     (a1),d2
[0004078c] c47c 0300                 and.w      #$0300,d2
[00040790] 6704                      beq.s      $00040796
[00040792] d27c 000a                 add.w      #$000A,d1
[00040796] b240                      cmp.w      d0,d1
[00040798] 6f04                      ble.s      $0004079E
[0004079a] 70ff                      moveq.l    #-1,d0
[0004079c] 4e75                      rts
[0004079e] b240                      cmp.w      d0,d1
[000407a0] 6c04                      bge.s      $000407A6
[000407a2] 7001                      moveq.l    #1,d0
[000407a4] 4e75                      rts
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
[000407c0] 6604                      bne.s      $000407C6
[000407c2] 4240                      clr.w      d0
[000407c4] 6008                      bra.s      $000407CE
[000407c6] 377c 000b 0016            move.w     #$000B,22(a3)
[000407cc] 7001                      moveq.l    #1,d0
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
[000407f2] 6606                      bne.s      $000407FA
[000407f4] 4240                      clr.w      d0
[000407f6] 6000 00cc                 bra        $000408C4
[000407fa] 248c                      move.l     a4,(a2)
[000407fc] 43eb 0002                 lea.l      2(a3),a1
[00040800] 7009                      moveq.l    #9,d0
[00040802] 206a 0014                 movea.l    20(a2),a0
[00040806] 4eb9 0005 0fd8            jsr        Aob_puttext
[0004080c] 0c53 0010                 cmpi.w     #$0010,(a3)
[00040810] 6c04                      bge.s      $00040816
[00040812] 36bc 0010                 move.w     #$0010,(a3)
[00040816] 3013                      move.w     (a3),d0
[00040818] c07c 0300                 and.w      #$0300,d0
[0004081c] 670a                      beq.s      $00040828
[0004081e] 206a 0014                 movea.l    20(a2),a0
[00040822] 0068 0001 003a            ori.w      #$0001,58(a0)
[00040828] 3013                      move.w     (a3),d0
[0004082a] c07c 0400                 and.w      #$0400,d0
[0004082e] 670a                      beq.s      $0004083A
[00040830] 206a 0014                 movea.l    20(a2),a0
[00040834] 0068 0001 006a            ori.w      #$0001,106(a0)
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
[00040866] 6652                      bne.s      $000408BA
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
[0004089c] 6704                      beq.s      $000408A2
[0004089e] 0053 0300                 ori.w      #$0300,(a3)
[000408a2] 7001                      moveq.l    #1,d0
[000408a4] 206a 0014                 movea.l    20(a2),a0
[000408a8] c068 006a                 and.w      106(a0),d0
[000408ac] 6704                      beq.s      $000408B2
[000408ae] 0053 0400                 ori.w      #$0400,(a3)
[000408b2] 102b 0002                 move.b     2(a3),d0
[000408b6] 6702                      beq.s      $000408BA
[000408b8] 7601                      moveq.l    #1,d3
[000408ba] 204a                      movea.l    a2,a0
[000408bc] 4eb9 0005 85f2            jsr        Awi_delete
[000408c2] 3003                      move.w     d3,d0
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
[000408fa] 602c                      bra.s      $00040928
[000408fc] 224b                      movea.l    a3,a1
[000408fe] 303c 0194                 move.w     #$0194,d0
[00040902] 206a 0004                 movea.l    4(a2),a0
[00040906] 286a 0004                 movea.l    4(a2),a4
[0004090a] 286c 0004                 movea.l    4(a4),a4
[0004090e] 4e94                      jsr        (a4)
[00040910] 4a40                      tst.w      d0
[00040912] 6712                      beq.s      $00040926
[00040914] 3003                      move.w     d3,d0
[00040916] c07c 07ff                 and.w      #$07FF,d0
[0004091a] 322f 000c                 move.w     12(a7),d1
[0004091e] b240                      cmp.w      d0,d1
[00040920] 6604                      bne.s      $00040926
[00040922] 2013                      move.l     (a3),d0
[00040924] 600a                      bra.s      $00040930
[00040926] 5293                      addq.l     #1,(a3)
[00040928] 2013                      move.l     (a3),d0
[0004092a] b097                      cmp.l      (a7),d0
[0004092c] 6dce                      blt.s      $000408FC
[0004092e] 70ff                      moveq.l    #-1,d0
[00040930] 4fef 010e                 lea.l      270(a7),a7
[00040934] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00040938] 4e75                      rts
mess_fkey:
[0004093a] 2f0a                      move.l     a2,-(a7)
[0004093c] 2f0b                      move.l     a3,-(a7)
[0004093e] 2448                      movea.l    a0,a2
[00040940] 3200                      move.w     d0,d1
[00040942] 5741                      subq.w     #3,d1
[00040944] 6706                      beq.s      $0004094C
[00040946] 5341                      subq.w     #1,d1
[00040948] 6718                      beq.s      $00040962
[0004094a] 6022                      bra.s      $0004096E
[0004094c] 41f9 000d 04cb            lea.l      A_FKEYDBL,a0
[00040952] 7001                      moveq.l    #1,d0
[00040954] 4eb9 0005 a600            jsr        Awi_alert
[0004095a] 5540                      subq.w     #2,d0
[0004095c] 6610                      bne.s      $0004096E
[0004095e] 4240                      clr.w      d0
[00040960] 600e                      bra.s      $00040970
[00040962] 93c9                      suba.l     a1,a1
[00040964] 700f                      moveq.l    #15,d0
[00040966] 204a                      movea.l    a2,a0
[00040968] 266a 0004                 movea.l    4(a2),a3
[0004096c] 4e93                      jsr        (a3)
[0004096e] 7001                      moveq.l    #1,d0
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
[0004098e] 51c8 fffc                 dbf        d0,$0004098C
[00040992] 43f9 000d 4a6d            lea.l      $000D4A6D,a1
[00040998] 204a                      movea.l    a2,a0
[0004099a] 4eb9 0008 2f0c            jsr        strcpy
[000409a0] 3013                      move.w     (a3),d0
[000409a2] c07c 0300                 and.w      #$0300,d0
[000409a6] 6704                      beq.s      $000409AC
[000409a8] 14bc 0001                 move.b     #$01,(a2)
[000409ac] 3013                      move.w     (a3),d0
[000409ae] c07c 0400                 and.w      #$0400,d0
[000409b2] 6706                      beq.s      $000409BA
[000409b4] 157c 005e 0001            move.b     #$5E,1(a2)
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
[00040a1a] 6024                      bra.s      $00040A40
[00040a1c] 2003                      move.l     d3,d0
[00040a1e] e588                      lsl.l      #2,d0
[00040a20] 41f2 0800                 lea.l      0(a2,d0.l),a0
[00040a24] 2228 00d2                 move.l     210(a0),d1
[00040a28] 6714                      beq.s      $00040A3E
[00040a2a] 2041                      movea.l    d1,a0
[00040a2c] 4eb9 0004 c7c8            jsr        Ax_free
[00040a32] 2003                      move.l     d3,d0
[00040a34] e588                      lsl.l      #2,d0
[00040a36] 41f2 0800                 lea.l      0(a2,d0.l),a0
[00040a3a] 42a8 00d2                 clr.l      210(a0)
[00040a3e] 5283                      addq.l     #1,d3
[00040a40] 7028                      moveq.l    #40,d0
[00040a42] b083                      cmp.l      d3,d0
[00040a44] 6ed6                      bgt.s      $00040A1C
[00040a46] 4294                      clr.l      (a4)
[00040a48] 6066                      bra.s      $00040AB0
[00040a4a] 224c                      movea.l    a4,a1
[00040a4c] 303c 0194                 move.w     #$0194,d0
[00040a50] 206a 0004                 movea.l    4(a2),a0
[00040a54] 2a6a 0004                 movea.l    4(a2),a5
[00040a58] 2a6d 0004                 movea.l    4(a5),a5
[00040a5c] 4e95                      jsr        (a5)
[00040a5e] 4a40                      tst.w      d0
[00040a60] 674c                      beq.s      $00040AAE
[00040a62] 162b 0001                 move.b     1(a3),d3
[00040a66] 4883                      ext.w      d3
[00040a68] d67c fff0                 add.w      #$FFF0,d3
[00040a6c] 3013                      move.w     (a3),d0
[00040a6e] c07c 0400                 and.w      #$0400,d0
[00040a72] 6704                      beq.s      $00040A78
[00040a74] d67c 0014                 add.w      #$0014,d3
[00040a78] 3013                      move.w     (a3),d0
[00040a7a] c07c 0300                 and.w      #$0300,d0
[00040a7e] 6704                      beq.s      $00040A84
[00040a80] d67c 000a                 add.w      #$000A,d3
[00040a84] 203c 0000 0102            move.l     #$00000102,d0
[00040a8a] 4eb9 0004 c608            jsr        Ax_malloc
[00040a90] 3003                      move.w     d3,d0
[00040a92] 48c0                      ext.l      d0
[00040a94] e588                      lsl.l      #2,d0
[00040a96] 43f2 0800                 lea.l      0(a2,d0.l),a1
[00040a9a] 2348 00d2                 move.l     a0,210(a1)
[00040a9e] 670e                      beq.s      $00040AAE
[00040aa0] 224b                      movea.l    a3,a1
[00040aa2] 203c 0000 0102            move.l     #$00000102,d0
[00040aa8] 4eb9 0008 3500            jsr        memcpy
[00040aae] 5294                      addq.l     #1,(a4)
[00040ab0] 2014                      move.l     (a4),d0
[00040ab2] b097                      cmp.l      (a7),d0
[00040ab4] 6d94                      blt.s      $00040A4A
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
[00040ada] 51c8 fffc                 dbf        d0,$00040AD8
[00040ade] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040ae4] 2ea8 0258                 move.l     600(a0),(a7)
[00040ae8] 43f9 000d 05c2            lea.l      FK_TITLE,a1
[00040aee] 41ef 0004                 lea.l      4(a7),a0
[00040af2] 4eb9 0008 2f0c            jsr        strcpy
[00040af8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00040afe] 2268 0258                 movea.l    600(a0),a1
[00040b02] 2651                      movea.l    (a1),a3
[00040b04] 202b 0004                 move.l     4(a3),d0
[00040b08] 6654                      bne.s      $00040B5E
[00040b0a] 41d7                      lea.l      (a7),a0
[00040b0c] 2279 000d 59c2            movea.l    $000D59C2,a1
[00040b12] 4e91                      jsr        (a1)
[00040b14] 2748 0004                 move.l     a0,4(a3)
[00040b18] 674e                      beq.s      $00040B68
[00040b1a] 4243                      clr.w      d3
[00040b1c] 6026                      bra.s      $00040B44
[00040b1e] 3003                      move.w     d3,d0
[00040b20] 48c0                      ext.l      d0
[00040b22] e588                      lsl.l      #2,d0
[00040b24] 41f3 0800                 lea.l      0(a3,d0.l),a0
[00040b28] 2228 00d2                 move.l     210(a0),d1
[00040b2c] 6714                      beq.s      $00040B42
[00040b2e] 2241                      movea.l    d1,a1
[00040b30] 206b 0004                 movea.l    4(a3),a0
[00040b34] 246b 0004                 movea.l    4(a3),a2
[00040b38] 246a 0004                 movea.l    4(a2),a2
[00040b3c] 303c 0192                 move.w     #$0192,d0
[00040b40] 4e92                      jsr        (a2)
[00040b42] 5243                      addq.w     #1,d3
[00040b44] b67c 0028                 cmp.w      #$0028,d3
[00040b48] 6dd4                      blt.s      $00040B1E
[00040b4a] 93c9                      suba.l     a1,a1
[00040b4c] 303c 0190                 move.w     #$0190,d0
[00040b50] 206b 0004                 movea.l    4(a3),a0
[00040b54] 246b 0004                 movea.l    4(a3),a2
[00040b58] 246a 0004                 movea.l    4(a2),a2
[00040b5c] 4e92                      jsr        (a2)
[00040b5e] 206b 0004                 movea.l    4(a3),a0
[00040b62] 4eb9 0005 6bea            jsr        Awi_show
[00040b68] 4fef 00b4                 lea.l      180(a7),a7
[00040b6c] 4cdf 0c08                 movem.l    (a7)+,d3/a2-a3
[00040b70] 4e75                      rts
