	.globl Ash_error
Ash_error:
[0005bb0c] 4fef ff74                 lea.l      -140(a7),a7
[0005bb10] 3f40 008a                 move.w     d0,138(a7)
[0005bb14] 2f48 0086                 move.l     a0,134(a7)
[0005bb18] 3f7c fffe 0084            move.w     #$FFFE,132(a7)
[0005bb1e] 4297                      clr.l      (a7)
[0005bb20] 302f 008a                 move.w     138(a7),d0
[0005bb24] b07c 0014                 cmp.w      #$0014,d0
[0005bb28] 6200 0266                 bhi        Ash_error_1
[0005bb2c] d040                      add.w      d0,d0
[0005bb2e] 303b 0006                 move.w     $0005BB36(pc,d0.w),d0
[0005bb32] 4efb 0002                 jmp        $0005BB36(pc,d0.w)
J46:
[0005bb36] 025a                      dc.w $025a   ; Ash_error_1-J46
[0005bb38] 025a                      dc.w $025a   ; Ash_error_1-J46
[0005bb3a] 002a                      dc.w $002a   ; Ash_error_2-J46
[0005bb3c] 0040                      dc.w $0040   ; Ash_error_3-J46
[0005bb3e] 0056                      dc.w $0056   ; Ash_error_4-J46
[0005bb40] 006c                      dc.w $006c   ; Ash_error_5-J46
[0005bb42] 0082                      dc.w $0082   ; Ash_error_6-J46
[0005bb44] 0098                      dc.w $0098   ; Ash_error_7-J46
[0005bb46] 00ae                      dc.w $00ae   ; Ash_error_8-J46
[0005bb48] 00d6                      dc.w $00d6   ; Ash_error_9-J46
[0005bb4a] 00fe                      dc.w $00fe   ; Ash_error_10-J46
[0005bb4c] 0126                      dc.w $0126   ; Ash_error_11-J46
[0005bb4e] 014e                      dc.w $014e   ; Ash_error_12-J46
[0005bb50] 014e                      dc.w $014e   ; Ash_error_12-J46
[0005bb52] 014e                      dc.w $014e   ; Ash_error_12-J46
[0005bb54] 014e                      dc.w $014e   ; Ash_error_12-J46
[0005bb56] 0232                      dc.w $0232   ; Ash_error_13-J46
[0005bb58] 0246                      dc.w $0246   ; Ash_error_14-J46
[0005bb5a] 0246                      dc.w $0246   ; Ash_error_14-J46
[0005bb5c] 025a                      dc.w $025a   ; Ash_error_1-J46
[0005bb5e] 025a                      dc.w $025a   ; Ash_error_1-J46
Ash_error_2:
[0005bb60] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bb66] 2068 023c                 movea.l    572(a0),a0
[0005bb6a] 2ea8 0124                 move.l     292(a0),(a7)
[0005bb6e] 42af 0086                 clr.l      134(a7)
[0005bb72] 6000 0240                 bra        Ash_error_15
Ash_error_3:
[0005bb76] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bb7c] 2068 023c                 movea.l    572(a0),a0
[0005bb80] 2ea8 014c                 move.l     332(a0),(a7)
[0005bb84] 42af 0086                 clr.l      134(a7)
[0005bb88] 6000 022a                 bra        Ash_error_15
Ash_error_4:
[0005bb8c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bb92] 2068 023c                 movea.l    572(a0),a0
[0005bb96] 2ea8 010c                 move.l     268(a0),(a7)
[0005bb9a] 42af 0086                 clr.l      134(a7)
[0005bb9e] 6000 0214                 bra        Ash_error_15
Ash_error_5:
[0005bba2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bba8] 2068 023c                 movea.l    572(a0),a0
[0005bbac] 2ea8 0154                 move.l     340(a0),(a7)
[0005bbb0] 42af 0086                 clr.l      134(a7)
[0005bbb4] 6000 01fe                 bra        Ash_error_15
Ash_error_6:
[0005bbb8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bbbe] 2068 023c                 movea.l    572(a0),a0
[0005bbc2] 2ea8 0140                 move.l     320(a0),(a7)
[0005bbc6] 42af 0086                 clr.l      134(a7)
[0005bbca] 6000 01e8                 bra        Ash_error_15
Ash_error_7:
[0005bbce] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bbd4] 2068 023c                 movea.l    572(a0),a0
[0005bbd8] 2ea8 0120                 move.l     288(a0),(a7)
[0005bbdc] 42af 0086                 clr.l      134(a7)
[0005bbe0] 6000 01d2                 bra        Ash_error_15
Ash_error_8:
[0005bbe4] 202f 0086                 move.l     134(a7),d0
[0005bbe8] 6710                      beq.s      Ash_error_16
[0005bbea] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bbf0] 2068 023c                 movea.l    572(a0),a0
[0005bbf4] 2ea8 0148                 move.l     328(a0),(a7)
[0005bbf8] 600e                      bra.s      Ash_error_17
Ash_error_16:
[0005bbfa] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bc00] 2068 023c                 movea.l    572(a0),a0
[0005bc04] 2ea8 0144                 move.l     324(a0),(a7)
Ash_error_17:
[0005bc08] 6000 01aa                 bra        Ash_error_15
Ash_error_9:
[0005bc0c] 202f 0086                 move.l     134(a7),d0
[0005bc10] 6710                      beq.s      Ash_error_18
[0005bc12] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bc18] 2068 023c                 movea.l    572(a0),a0
[0005bc1c] 2ea8 0108                 move.l     264(a0),(a7)
[0005bc20] 600e                      bra.s      Ash_error_19
Ash_error_18:
[0005bc22] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bc28] 2068 023c                 movea.l    572(a0),a0
[0005bc2c] 2ea8 0104                 move.l     260(a0),(a7)
Ash_error_19:
[0005bc30] 6000 0182                 bra        Ash_error_15
Ash_error_10:
[0005bc34] 202f 0086                 move.l     134(a7),d0
[0005bc38] 6710                      beq.s      Ash_error_20
[0005bc3a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bc40] 2068 023c                 movea.l    572(a0),a0
[0005bc44] 2ea8 016c                 move.l     364(a0),(a7)
[0005bc48] 600e                      bra.s      Ash_error_21
Ash_error_20:
[0005bc4a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bc50] 2068 023c                 movea.l    572(a0),a0
[0005bc54] 2ea8 0168                 move.l     360(a0),(a7)
Ash_error_21:
[0005bc58] 6000 015a                 bra        Ash_error_15
Ash_error_11:
[0005bc5c] 202f 0086                 move.l     134(a7),d0
[0005bc60] 6710                      beq.s      Ash_error_22
[0005bc62] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bc68] 2068 023c                 movea.l    572(a0),a0
[0005bc6c] 2ea8 015c                 move.l     348(a0),(a7)
[0005bc70] 600e                      bra.s      Ash_error_23
Ash_error_22:
[0005bc72] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bc78] 2068 023c                 movea.l    572(a0),a0
[0005bc7c] 2ea8 0158                 move.l     344(a0),(a7)
Ash_error_23:
[0005bc80] 6000 0132                 bra        Ash_error_15
Ash_error_12:
[0005bc84] 202f 0086                 move.l     134(a7),d0
[0005bc88] 6700 0080                 beq        Ash_error_24
[0005bc8c] 206f 0086                 movea.l    134(a7),a0
[0005bc90] 1010                      move.b     (a0),d0
[0005bc92] 6700 0076                 beq.w      Ash_error_24
[0005bc96] 226f 0086                 movea.l    134(a7),a1
[0005bc9a] 41ef 0004                 lea.l      4(a7),a0
[0005bc9e] 4eb9 0004 b66e            jsr        Af_2name
[0005bca4] 1010                      move.b     (a0),d0
[0005bca6] 6762                      beq.s      Ash_error_24
[0005bca8] 302f 008a                 move.w     138(a7),d0
[0005bcac] 907c 000c                 sub.w      #$000C,d0
[0005bcb0] 670e                      beq.s      Ash_error_25
[0005bcb2] 5340                      subq.w     #1,d0
[0005bcb4] 671a                      beq.s      Ash_error_26
[0005bcb6] 5340                      subq.w     #1,d0
[0005bcb8] 6726                      beq.s      Ash_error_27
[0005bcba] 5340                      subq.w     #1,d0
[0005bcbc] 6732                      beq.s      Ash_error_28
[0005bcbe] 6040                      bra.s      Ash_error_29
Ash_error_25:
[0005bcc0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bcc6] 2068 023c                 movea.l    572(a0),a0
[0005bcca] 2ea8 012c                 move.l     300(a0),(a7)
[0005bcce] 6030                      bra.s      Ash_error_29
Ash_error_26:
[0005bcd0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bcd6] 2068 023c                 movea.l    572(a0),a0
[0005bcda] 2ea8 0134                 move.l     308(a0),(a7)
[0005bcde] 6020                      bra.s      Ash_error_29
Ash_error_27:
[0005bce0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bce6] 2068 023c                 movea.l    572(a0),a0
[0005bcea] 2ea8 0164                 move.l     356(a0),(a7)
[0005bcee] 6010                      bra.s      Ash_error_29
Ash_error_28:
[0005bcf0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bcf6] 2068 023c                 movea.l    572(a0),a0
[0005bcfa] 2ea8 013c                 move.l     316(a0),(a7)
[0005bcfe] 4e71                      nop
Ash_error_29:
[0005bd00] 41ef 0004                 lea.l      4(a7),a0
[0005bd04] 2f48 0086                 move.l     a0,134(a7)
[0005bd08] 605c                      bra.s      Ash_error_30
Ash_error_24:
[0005bd0a] 42af 0086                 clr.l      134(a7)
[0005bd0e] 302f 008a                 move.w     138(a7),d0
[0005bd12] 907c 000c                 sub.w      #$000C,d0
[0005bd16] 670e                      beq.s      Ash_error_31
[0005bd18] 5340                      subq.w     #1,d0
[0005bd1a] 671a                      beq.s      Ash_error_32
[0005bd1c] 5340                      subq.w     #1,d0
[0005bd1e] 6726                      beq.s      Ash_error_33
[0005bd20] 5340                      subq.w     #1,d0
[0005bd22] 6732                      beq.s      Ash_error_34
[0005bd24] 6040                      bra.s      Ash_error_30
Ash_error_31:
[0005bd26] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bd2c] 2068 023c                 movea.l    572(a0),a0
[0005bd30] 2ea8 0128                 move.l     296(a0),(a7)
[0005bd34] 6030                      bra.s      Ash_error_30
Ash_error_32:
[0005bd36] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bd3c] 2068 023c                 movea.l    572(a0),a0
[0005bd40] 2ea8 0130                 move.l     304(a0),(a7)
[0005bd44] 6020                      bra.s      Ash_error_30
Ash_error_33:
[0005bd46] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bd4c] 2068 023c                 movea.l    572(a0),a0
[0005bd50] 2ea8 0160                 move.l     352(a0),(a7)
[0005bd54] 6010                      bra.s      Ash_error_30
Ash_error_34:
[0005bd56] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bd5c] 2068 023c                 movea.l    572(a0),a0
[0005bd60] 2ea8 0138                 move.l     312(a0),(a7)
[0005bd64] 4e71                      nop
Ash_error_30:
[0005bd66] 604c                      bra.s      Ash_error_15
Ash_error_13:
[0005bd68] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bd6e] 2068 023c                 movea.l    572(a0),a0
[0005bd72] 2ea8 0150                 move.l     336(a0),(a7)
[0005bd76] 42af 0086                 clr.l      134(a7)
[0005bd7a] 6038                      bra.s      Ash_error_15
Ash_error_14:
[0005bd7c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bd82] 2068 023c                 movea.l    572(a0),a0
[0005bd86] 2ea8 0100                 move.l     256(a0),(a7)
[0005bd8a] 42af 0086                 clr.l      134(a7)
[0005bd8e] 6024                      bra.s      Ash_error_15
Ash_error_1:
[0005bd90] 202f 0086                 move.l     134(a7),d0
[0005bd94] 6710                      beq.s      Ash_error_35
[0005bd96] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bd9c] 2068 023c                 movea.l    572(a0),a0
[0005bda0] 2ea8 00fc                 move.l     252(a0),(a7)
[0005bda4] 600e                      bra.s      Ash_error_15
Ash_error_35:
[0005bda6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005bdac] 2068 023c                 movea.l    572(a0),a0
[0005bdb0] 2ea8 00f8                 move.l     248(a0),(a7)
Ash_error_15:
[0005bdb4] 2017                      move.l     (a7),d0
[0005bdb6] 6726                      beq.s      Ash_error_36
[0005bdb8] 202f 0086                 move.l     134(a7),d0
[0005bdbc] 6712                      beq.s      Ash_error_37
[0005bdbe] 226f 0086                 movea.l    134(a7),a1
[0005bdc2] 2057                      movea.l    (a7),a0
[0005bdc4] 4eb9 0006 b80c            jsr        alert_str
[0005bdca] 3f40 0084                 move.w     d0,132(a7)
[0005bdce] 600e                      bra.s      Ash_error_36
Ash_error_37:
[0005bdd0] 2057                      movea.l    (a7),a0
[0005bdd2] 7001                      moveq.l    #1,d0
[0005bdd4] 4eb9 0005 a600            jsr        Awi_alert
[0005bdda] 3f40 0084                 move.w     d0,132(a7)
Ash_error_36:
[0005bdde] 0c6f ffff 0084            cmpi.w     #$FFFF,132(a7)
[0005bde4] 6c14                      bge.s      Ash_error_38
[0005bde6] 2279 000e 692a            movea.l    _globl,a1
[0005bdec] 41f9 000e 0fda            lea.l      $000E0FDA,a0
[0005bdf2] 7001                      moveq.l    #1,d0
[0005bdf4] 4eb9 0007 a146            jsr        mt_form_alert
Ash_error_38:
[0005bdfa] 4fef 008c                 lea.l      140(a7),a7
[0005bdfe] 4e75                      rts

	.globl Ash_getenv
Ash_getenv:
[0005be00] 4fef fff0                 lea.l      -16(a7),a7
[0005be04] 2f48 000c                 move.l     a0,12(a7)
[0005be08] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005be0e] 2f68 028c 0008            move.l     652(a0),8(a7)
[0005be14] 202f 0008                 move.l     8(a7),d0
[0005be18] 675e                      beq.s      Ash_getenv_1
[0005be1a] 206f 0008                 movea.l    8(a7),a0
[0005be1e] 2f50 0004                 move.l     (a0),4(a7)
[0005be22] 6046                      bra.s      Ash_getenv_2
Ash_getenv_7:
[0005be24] 2eaf 000c                 move.l     12(a7),(a7)
[0005be28] 601a                      bra.s      Ash_getenv_3
Ash_getenv_6:
[0005be2a] 206f 0004                 movea.l    4(a7),a0
[0005be2e] 0c10 003d                 cmpi.b     #$3D,(a0)
[0005be32] 6610                      bne.s      Ash_getenv_3
[0005be34] 2057                      movea.l    (a7),a0
[0005be36] 1010                      move.b     (a0),d0
[0005be38] 660a                      bne.s      Ash_getenv_3
[0005be3a] 52af 0004                 addq.l     #1,4(a7)
[0005be3e] 206f 0004                 movea.l    4(a7),a0
[0005be42] 6036                      bra.s      Ash_getenv_4
Ash_getenv_3:
[0005be44] 206f 0004                 movea.l    4(a7),a0
[0005be48] 1010                      move.b     (a0),d0
[0005be4a] 6712                      beq.s      Ash_getenv_5
[0005be4c] 206f 0004                 movea.l    4(a7),a0
[0005be50] 52af 0004                 addq.l     #1,4(a7)
[0005be54] 1010                      move.b     (a0),d0
[0005be56] 2057                      movea.l    (a7),a0
[0005be58] 5297                      addq.l     #1,(a7)
[0005be5a] b010                      cmp.b      (a0),d0
[0005be5c] 67cc                      beq.s      Ash_getenv_6
Ash_getenv_5:
[0005be5e] 58af 0008                 addq.l     #4,8(a7)
[0005be62] 206f 0008                 movea.l    8(a7),a0
[0005be66] 2f50 0004                 move.l     (a0),4(a7)
Ash_getenv_2:
[0005be6a] 202f 0004                 move.l     4(a7),d0
[0005be6e] 6708                      beq.s      Ash_getenv_1
[0005be70] 206f 0004                 movea.l    4(a7),a0
[0005be74] 1010                      move.b     (a0),d0
[0005be76] 66ac                      bne.s      Ash_getenv_7
Ash_getenv_1:
[0005be78] 91c8                      suba.l     a0,a0
Ash_getenv_4:
[0005be7a] 4fef 0010                 lea.l      16(a7),a7
[0005be7e] 4e75                      rts

	.data

[000e0fda]                           dc.b '[| Internal errors! | Take care! |][  OK  ]',0
[000e1006]                           dc.w $0000
