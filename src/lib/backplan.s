INbackplan:
[00054b02] 3039 000e 0cea            move.w     init,d0
[00054b08] 5279 000e 0cea            addq.w     #1,init
[00054b0e] 4a40                      tst.w      d0
[00054b10] 6702                      beq.s      INbackplan_1
[00054b12] 4e75                      rts
INbackplan_1:

[00054b14] 4eb9 0008 0b50            jsr        Logbase
[00054b1a] 23c8 0011 3ad0            move.l     a0,screen
[00054b20] 4eb9 0004 3e1a            jsr        ACSInitL
[00054b26] 2079 0010 f562            movea.l    Vdiesc,a0
[00054b2c] 33e8 038c 0011 3ad8       move.w     908(a0),bytes_lin
[00054b34] 2079 0010 f562            movea.l    Vdiesc,a0
[00054b3a] 33e8 00da 0011 3ad4       move.w     218(a0),max_x
[00054b42] 2079 0010 f562            movea.l    Vdiesc,a0
[00054b48] 33e8 00dc 0011 3ad6       move.w     220(a0),max_y
[00054b50] 2079 0010 f562            movea.l    Vdiesc,a0
[00054b56] 33e8 038a 0011 3ada       move.w     906(a0),v_rez_vt
[00054b5e] 2079 0010 f562            movea.l    Vdiesc,a0
[00054b64] 33e8 0382 0011 3adc       move.w     898(a0),v_rez_hz
[00054b6c] 4e75                      rts

Abp_create:
[00054b6e] 4fef fff2                 lea.l      -14(a7),a7
[00054b72] 3f40 000c                 move.w     d0,12(a7)
[00054b76] 3f41 000a                 move.w     d1,10(a7)
[00054b7a] 700f                      moveq.l    #15,d0
[00054b7c] d06f 000c                 add.w      12(a7),d0
[00054b80] e840                      asr.w      #4,d0
[00054b82] 3f40 0004                 move.w     d0,4(a7)
[00054b86] 302f 000a                 move.w     10(a7),d0
[00054b8a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00054b90] c1e8 001c                 muls.w     28(a0),d0
[00054b94] 48c0                      ext.l      d0
[00054b96] d080                      add.l      d0,d0
[00054b98] 322f 0004                 move.w     4(a7),d1
[00054b9c] 48c1                      ext.l      d1
[00054b9e] 4eb9 0008 3cac            jsr        _lmul
[00054ba4] d0bc 0000 0014            add.l      #$00000014,d0
[00054baa] 2f40 0006                 move.l     d0,6(a7)
[00054bae] 202f 0006                 move.l     6(a7),d0
[00054bb2] 4eb9 0004 c608            jsr        Ax_malloc
[00054bb8] 2e88                      move.l     a0,(a7)
[00054bba] 2017                      move.l     (a7),d0
[00054bbc] 673e                      beq.s      Abp_create_1
[00054bbe] 222f 0006                 move.l     6(a7),d1
[00054bc2] 4240                      clr.w      d0
[00054bc4] 2057                      movea.l    (a7),a0
[00054bc6] 4eb9 0008 36ea            jsr        memset
[00054bcc] 2057                      movea.l    (a7),a0
[00054bce] 41e8 0014                 lea.l      20(a0),a0
[00054bd2] 2257                      movea.l    (a7),a1
[00054bd4] 2288                      move.l     a0,(a1)
[00054bd6] 2057                      movea.l    (a7),a0
[00054bd8] 316f 000c 0004            move.w     12(a7),4(a0)
[00054bde] 2057                      movea.l    (a7),a0
[00054be0] 316f 000a 0006            move.w     10(a7),6(a0)
[00054be6] 2057                      movea.l    (a7),a0
[00054be8] 316f 0004 0008            move.w     4(a7),8(a0)
[00054bee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00054bf4] 2257                      movea.l    (a7),a1
[00054bf6] 3368 001c 000c            move.w     28(a0),12(a1)
Abp_create_1:
[00054bfc] 2057                      movea.l    (a7),a0
[00054bfe] 4fef 000e                 lea.l      14(a7),a7
[00054c02] 4e75                      rts

Abp_delete:
[00054c04] 594f                      subq.w     #4,a7
[00054c06] 2e88                      move.l     a0,(a7)
[00054c08] 7014                      moveq.l    #20,d0
[00054c0a] 2057                      movea.l    (a7),a0
[00054c0c] 4eb9 0004 cc28            jsr        Ax_recycle
[00054c12] 584f                      addq.w     #4,a7
[00054c14] 4e75                      rts

ret:
[00054c16] 4e75                      rts

Abp_start:
[00054c18] 594f                      subq.w     #4,a7
[00054c1a] 2e88                      move.l     a0,(a7)
[00054c1c] 3039 000e 0cea            move.w     init,d0
[00054c22] 6604                      bne.s      Abp_start_1
[00054c24] 6100 fedc                 bsr        INbackplan
Abp_start_1:
[00054c28] 4eb9 0004 ef40            jsr        Amo_hide
[00054c2e] 4eb9 0008 0b40            jsr        Kbdvbase
[00054c34] 23c8 0011 3ade            move.l     a0,vectors
[00054c3a] 2079 0011 3ade            movea.l    vectors,a0
[00054c40] 23e8 0010 0011 3ae2       move.l     16(a0),kb_mousevec
[00054c48] 2079 0011 3ade            movea.l    vectors,a0
[00054c4e] 217c 0005 4c16 0010       move.l     #ret,16(a0)
[00054c56] 70ff                      moveq.l    #-1,d0
[00054c58] 227c ffff ffff            movea.l    #$FFFFFFFF,a1
[00054c5e] 2057                      movea.l    (a7),a0
[00054c60] 2050                      movea.l    (a0),a0
[00054c62] 4eb9 0008 0b60            jsr        Setscree
[00054c68] 2057                      movea.l    (a7),a0
[00054c6a] 3028 0008                 move.w     8(a0),d0
[00054c6e] d040                      add.w      d0,d0
[00054c70] 2057                      movea.l    (a7),a0
[00054c72] c1e8 000c                 muls.w     12(a0),d0
[00054c76] 2079 0010 f562            movea.l    Vdiesc,a0
[00054c7c] 3140 038c                 move.w     d0,908(a0)
[00054c80] 2079 0010 f55e            movea.l    Linea,a0
[00054c86] 3140 0002                 move.w     d0,2(a0)
[00054c8a] 2057                      movea.l    (a7),a0
[00054c8c] 2279 0010 f562            movea.l    Vdiesc,a1
[00054c92] 3368 0006 038a            move.w     6(a0),906(a1)
[00054c98] 2057                      movea.l    (a7),a0
[00054c9a] 2279 0010 f562            movea.l    Vdiesc,a1
[00054ca0] 3368 0004 0382            move.w     4(a0),898(a1)
[00054ca6] 70ff                      moveq.l    #-1,d0
[00054ca8] 2057                      movea.l    (a7),a0
[00054caa] d068 0004                 add.w      4(a0),d0
[00054cae] 2079 0010 f562            movea.l    Vdiesc,a0
[00054cb4] 3140 00da                 move.w     d0,218(a0)
[00054cb8] 33c0 000e 0cf0            move.w     d0,$000E0CF0
[00054cbe] 70ff                      moveq.l    #-1,d0
[00054cc0] 2057                      movea.l    (a7),a0
[00054cc2] d068 0006                 add.w      6(a0),d0
[00054cc6] 2079 0010 f562            movea.l    Vdiesc,a0
[00054ccc] 3140 00dc                 move.w     d0,220(a0)
[00054cd0] 33c0 000e 0cf2            move.w     d0,$000E0CF2
[00054cd6] 41f9 000e 0cec            lea.l      pxy,a0
[00054cdc] 7201                      moveq.l    #1,d1
[00054cde] 2279 0010 ee4e            movea.l    ACSblk,a1
[00054ce4] 3029 0010                 move.w     16(a1),d0
[00054ce8] 4eb9 0007 2230            jsr        vs_clip
[00054cee] 584f                      addq.w     #4,a7
[00054cf0] 4e75                      rts

Abp_end:
[00054cf2] 3039 0011 3ad8            move.w     bytes_lin,d0
[00054cf8] 2079 0010 f55e            movea.l    Linea,a0
[00054cfe] 3140 0002                 move.w     d0,2(a0)
[00054d02] 2079 0010 f562            movea.l    Vdiesc,a0
[00054d08] 3140 038c                 move.w     d0,908(a0)
[00054d0c] 2079 0010 f562            movea.l    Vdiesc,a0
[00054d12] 3179 0011 3ada 038a       move.w     v_rez_vt,906(a0)
[00054d1a] 2079 0010 f562            movea.l    Vdiesc,a0
[00054d20] 3179 0011 3adc 0382       move.w     v_rez_hz,898(a0)
[00054d28] 3039 0011 3ad4            move.w     max_x,d0
[00054d2e] 2079 0010 f562            movea.l    Vdiesc,a0
[00054d34] 3140 00da                 move.w     d0,218(a0)
[00054d38] 33c0 000e 0cf0            move.w     d0,$000E0CF0
[00054d3e] 3039 0011 3ad6            move.w     max_y,d0
[00054d44] 2079 0010 f562            movea.l    Vdiesc,a0
[00054d4a] 3140 00dc                 move.w     d0,220(a0)
[00054d4e] 33c0 000e 0cf2            move.w     d0,$000E0CF2
[00054d54] 70ff                      moveq.l    #-1,d0
[00054d56] 227c ffff ffff            movea.l    #$FFFFFFFF,a1
[00054d5c] 2079 0011 3ad0            movea.l    screen,a0
[00054d62] 4eb9 0008 0b60            jsr        Setscree
[00054d68] 2079 0011 3ade            movea.l    vectors,a0
[00054d6e] 2179 0011 3ae2 0010       move.l     kb_mousevec,16(a0)
[00054d76] 41f9 000e 0cec            lea.l      pxy,a0
[00054d7c] 7201                      moveq.l    #1,d1
[00054d7e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00054d84] 3029 0010                 move.w     16(a1),d0
[00054d88] 4eb9 0007 2230            jsr        vs_clip
[00054d8e] 4eb9 0004 ef66            jsr        Amo_show
[00054d94] 4e75                      rts

Abp_mfdb2img:
[00054d96] 2f0a                      move.l     a2,-(a7)
[00054d98] 4fef fff4                 lea.l      -12(a7),a7
[00054d9c] 2f48 0008                 move.l     a0,8(a7)
[00054da0] 2f49 0004                 move.l     a1,4(a7)
[00054da4] 206f 0008                 movea.l    8(a7),a0
[00054da8] 3228 0006                 move.w     6(a0),d1
[00054dac] 206f 0008                 movea.l    8(a7),a0
[00054db0] 3028 0004                 move.w     4(a0),d0
[00054db4] 6100 fdb8                 bsr        Abp_create
[00054db8] 2e88                      move.l     a0,(a7)
[00054dba] 2017                      move.l     (a7),d0
[00054dbc] 6606                      bne.s      Abp_mfdb2img_1
[00054dbe] 70ff                      moveq.l    #-1,d0
[00054dc0] 6000 0190                 bra        Abp_mfdb2img_2
Abp_mfdb2img_1:
[00054dc4] 2057                      movea.l    (a7),a0
[00054dc6] 317c 0001 000a            move.w     #$0001,10(a0)
[00054dcc] 206f 0008                 movea.l    8(a7),a0
[00054dd0] 3028 000a                 move.w     10(a0),d0
[00054dd4] 672a                      beq.s      Abp_mfdb2img_3
[00054dd6] 2057                      movea.l    (a7),a0
[00054dd8] 3028 0008                 move.w     8(a0),d0
[00054ddc] d040                      add.w      d0,d0
[00054dde] 2057                      movea.l    (a7),a0
[00054de0] c1e8 0006                 muls.w     6(a0),d0
[00054de4] 2057                      movea.l    (a7),a0
[00054de6] c1e8 000c                 muls.w     12(a0),d0
[00054dea] 48c0                      ext.l      d0
[00054dec] d0bc 0000 0014            add.l      #$00000014,d0
[00054df2] 226f 0008                 movea.l    8(a7),a1
[00054df6] 2057                      movea.l    (a7),a0
[00054df8] 4eb9 0008 3500            jsr        memcpy
[00054dfe] 6016                      bra.s      Abp_mfdb2img_4
Abp_mfdb2img_3:
[00054e00] 2257                      movea.l    (a7),a1
[00054e02] 206f 0008                 movea.l    8(a7),a0
[00054e06] 2479 0010 ee4e            movea.l    ACSblk,a2
[00054e0c] 302a 0010                 move.w     16(a2),d0
[00054e10] 4eb9 0007 4978            jsr        vr_trnfm
Abp_mfdb2img_4:
[00054e16] 93c9                      suba.l     a1,a1
[00054e18] 2057                      movea.l    (a7),a0
[00054e1a] 4eb9 0005 4f5a            jsr        compress_image
[00054e20] 206f 0014                 movea.l    20(a7),a0
[00054e24] 2080                      move.l     d0,(a0)
[00054e26] 2057                      movea.l    (a7),a0
[00054e28] 6100 fdda                 bsr        Abp_delete
[00054e2c] 202f 0004                 move.l     4(a7),d0
[00054e30] 6606                      bne.s      Abp_mfdb2img_5
[00054e32] 4240                      clr.w      d0
[00054e34] 6000 011c                 bra        Abp_mfdb2img_2
Abp_mfdb2img_5:
[00054e38] 7010                      moveq.l    #16,d0
[00054e3a] 206f 0014                 movea.l    20(a7),a0
[00054e3e] d090                      add.l      (a0),d0
[00054e40] 4eb9 0004 c608            jsr        Ax_malloc
[00054e46] 226f 0004                 movea.l    4(a7),a1
[00054e4a] 2288                      move.l     a0,(a1)
[00054e4c] 206f 0004                 movea.l    4(a7),a0
[00054e50] 2010                      move.l     (a0),d0
[00054e52] 6606                      bne.s      Abp_mfdb2img_6
[00054e54] 70ff                      moveq.l    #-1,d0
[00054e56] 6000 00fa                 bra        Abp_mfdb2img_2
Abp_mfdb2img_6:
[00054e5a] 206f 0008                 movea.l    8(a7),a0
[00054e5e] 3228 0006                 move.w     6(a0),d1
[00054e62] 206f 0008                 movea.l    8(a7),a0
[00054e66] 3028 0004                 move.w     4(a0),d0
[00054e6a] 6100 fd02                 bsr        Abp_create
[00054e6e] 2e88                      move.l     a0,(a7)
[00054e70] 2017                      move.l     (a7),d0
[00054e72] 6612                      bne.s      Abp_mfdb2img_7
[00054e74] 206f 0004                 movea.l    4(a7),a0
[00054e78] 2050                      movea.l    (a0),a0
[00054e7a] 4eb9 0004 c6c8            jsr        Ax_ifree
[00054e80] 70ff                      moveq.l    #-1,d0
[00054e82] 6000 00ce                 bra        Abp_mfdb2img_2
Abp_mfdb2img_7:
[00054e86] 2057                      movea.l    (a7),a0
[00054e88] 317c 0001 000a            move.w     #$0001,10(a0)
[00054e8e] 206f 0008                 movea.l    8(a7),a0
[00054e92] 3028 000a                 move.w     10(a0),d0
[00054e96] 672a                      beq.s      Abp_mfdb2img_8
[00054e98] 2057                      movea.l    (a7),a0
[00054e9a] 3028 0008                 move.w     8(a0),d0
[00054e9e] d040                      add.w      d0,d0
[00054ea0] 2057                      movea.l    (a7),a0
[00054ea2] c1e8 0006                 muls.w     6(a0),d0
[00054ea6] 2057                      movea.l    (a7),a0
[00054ea8] c1e8 000c                 muls.w     12(a0),d0
[00054eac] 48c0                      ext.l      d0
[00054eae] d0bc 0000 0014            add.l      #$00000014,d0
[00054eb4] 226f 0008                 movea.l    8(a7),a1
[00054eb8] 2057                      movea.l    (a7),a0
[00054eba] 4eb9 0008 3500            jsr        memcpy
[00054ec0] 6016                      bra.s      Abp_mfdb2img_9
Abp_mfdb2img_8:
[00054ec2] 2257                      movea.l    (a7),a1
[00054ec4] 206f 0008                 movea.l    8(a7),a0
[00054ec8] 2479 0010 ee4e            movea.l    ACSblk,a2
[00054ece] 302a 0010                 move.w     16(a2),d0
[00054ed2] 4eb9 0007 4978            jsr        vr_trnfm
Abp_mfdb2img_9:
[00054ed8] 206f 0004                 movea.l    4(a7),a0
[00054edc] 2250                      movea.l    (a0),a1
[00054ede] 2057                      movea.l    (a7),a0
[00054ee0] 4eb9 0005 4f5a            jsr        compress_image
[00054ee6] 206f 0004                 movea.l    4(a7),a0
[00054eea] 2050                      movea.l    (a0),a0
[00054eec] 30bc 0001                 move.w     #$0001,(a0)
[00054ef0] 206f 0004                 movea.l    4(a7),a0
[00054ef4] 2050                      movea.l    (a0),a0
[00054ef6] 317c 0008 0002            move.w     #$0008,2(a0)
[00054efc] 2057                      movea.l    (a7),a0
[00054efe] 226f 0004                 movea.l    4(a7),a1
[00054f02] 2251                      movea.l    (a1),a1
[00054f04] 3368 000c 0004            move.w     12(a0),4(a1)
[00054f0a] 206f 0004                 movea.l    4(a7),a0
[00054f0e] 2050                      movea.l    (a0),a0
[00054f10] 317c 0002 0006            move.w     #$0002,6(a0)
[00054f16] 303c 01f4                 move.w     #$01F4,d0
[00054f1a] 206f 0004                 movea.l    4(a7),a0
[00054f1e] 2050                      movea.l    (a0),a0
[00054f20] 3140 000a                 move.w     d0,10(a0)
[00054f24] 206f 0004                 movea.l    4(a7),a0
[00054f28] 2050                      movea.l    (a0),a0
[00054f2a] 3140 0008                 move.w     d0,8(a0)
[00054f2e] 2057                      movea.l    (a7),a0
[00054f30] 226f 0004                 movea.l    4(a7),a1
[00054f34] 2251                      movea.l    (a1),a1
[00054f36] 3368 0004 000c            move.w     4(a0),12(a1)
[00054f3c] 2057                      movea.l    (a7),a0
[00054f3e] 226f 0004                 movea.l    4(a7),a1
[00054f42] 2251                      movea.l    (a1),a1
[00054f44] 3368 0006 000e            move.w     6(a0),14(a1)
[00054f4a] 2057                      movea.l    (a7),a0
[00054f4c] 6100 fcb6                 bsr        Abp_delete
[00054f50] 4240                      clr.w      d0
Abp_mfdb2img_2:
[00054f52] 4fef 000c                 lea.l      12(a7),a7
[00054f56] 245f                      movea.l    (a7)+,a2
[00054f58] 4e75                      rts

compress_image:
[00054f5a] 4fef ff54                 lea.l      -172(a7),a7
[00054f5e] 2f48 00a8                 move.l     a0,168(a7)
[00054f62] 2f49 00a4                 move.l     a1,164(a7)
[00054f66] 202f 00a4                 move.l     164(a7),d0
[00054f6a] 6606                      bne.s      compress_image_1
[00054f6c] 42af 00a0                 clr.l      160(a7)
[00054f70] 600c                      bra.s      compress_image_2
compress_image_1:
[00054f72] 206f 00a4                 movea.l    164(a7),a0
[00054f76] 41e8 0010                 lea.l      16(a0),a0
[00054f7a] 2f48 00a0                 move.l     a0,160(a7)
compress_image_2:
[00054f7e] 7007                      moveq.l    #7,d0
[00054f80] 206f 00a8                 movea.l    168(a7),a0
[00054f84] d068 0004                 add.w      4(a0),d0
[00054f88] e640                      asr.w      #3,d0
[00054f8a] 3f40 0096                 move.w     d0,150(a7)
[00054f8e] 206f 00a8                 movea.l    168(a7),a0
[00054f92] 3f68 0008 0098            move.w     8(a0),152(a7)
[00054f98] 302f 0098                 move.w     152(a7),d0
[00054f9c] d040                      add.w      d0,d0
[00054f9e] 48c0                      ext.l      d0
[00054fa0] 206f 00a8                 movea.l    168(a7),a0
[00054fa4] 3228 0006                 move.w     6(a0),d1
[00054fa8] 48c1                      ext.l      d1
[00054faa] 4eb9 0008 3cac            jsr        _lmul
[00054fb0] 2f40 0004                 move.l     d0,4(a7)
[00054fb4] 206f 00a8                 movea.l    168(a7),a0
[00054fb8] 2f50 008c                 move.l     (a0),140(a7)
[00054fbc] 422f 0092                 clr.b      146(a7)
[00054fc0] 6028                      bra.s      compress_image_3
compress_image_4:
[00054fc2] 4240                      clr.w      d0
[00054fc4] 102f 0092                 move.b     146(a7),d0
[00054fc8] 48c0                      ext.l      d0
[00054fca] 222f 0004                 move.l     4(a7),d1
[00054fce] 4eb9 0008 3cac            jsr        _lmul
[00054fd4] 206f 008c                 movea.l    140(a7),a0
[00054fd8] d1c0                      adda.l     d0,a0
[00054fda] 4240                      clr.w      d0
[00054fdc] 102f 0092                 move.b     146(a7),d0
[00054fe0] e548                      lsl.w      #2,d0
[00054fe2] 2f88 0008                 move.l     a0,8(a7,d0.w)
[00054fe6] 522f 0092                 addq.b     #1,146(a7)
compress_image_3:
[00054fea] 4240                      clr.w      d0
[00054fec] 102f 0092                 move.b     146(a7),d0
[00054ff0] 206f 00a8                 movea.l    168(a7),a0
[00054ff4] b068 000c                 cmp.w      12(a0),d0
[00054ff8] 6dc8                      blt.s      compress_image_4
[00054ffa] 4297                      clr.l      (a7)
[00054ffc] 206f 00a8                 movea.l    168(a7),a0
[00055000] 3f68 0006 009c            move.w     6(a0),156(a7)
[00055006] 6000 0310                 bra        compress_image_5
compress_image_33:
[0005500a] 322f 0096                 move.w     150(a7),d1
[0005500e] 206f 00a8                 movea.l    168(a7),a0
[00055012] 3028 000c                 move.w     12(a0),d0
[00055016] 41ef 0008                 lea.l      8(a7),a0
[0005501a] 4eb9 0005 5328            jsr        vreplic
[00055020] 1f40 0094                 move.b     d0,148(a7)
[00055024] 0c2f 0001 0094            cmpi.b     #$01,148(a7)
[0005502a] 6346                      bls.s      compress_image_6
[0005502c] 4240                      clr.w      d0
[0005502e] 102f 0094                 move.b     148(a7),d0
[00055032] b06f 009c                 cmp.w      156(a7),d0
[00055036] 6f06                      ble.s      compress_image_7
[00055038] 1f6f 009d 0094            move.b     157(a7),148(a7)
compress_image_7:
[0005503e] 5897                      addq.l     #4,(a7)
[00055040] 202f 00a0                 move.l     160(a7),d0
[00055044] 672c                      beq.s      compress_image_6
[00055046] 206f 00a0                 movea.l    160(a7),a0
[0005504a] 52af 00a0                 addq.l     #1,160(a7)
[0005504e] 4210                      clr.b      (a0)
[00055050] 206f 00a0                 movea.l    160(a7),a0
[00055054] 52af 00a0                 addq.l     #1,160(a7)
[00055058] 4210                      clr.b      (a0)
[0005505a] 206f 00a0                 movea.l    160(a7),a0
[0005505e] 52af 00a0                 addq.l     #1,160(a7)
[00055062] 10bc ffff                 move.b     #$FF,(a0)
[00055066] 206f 00a0                 movea.l    160(a7),a0
[0005506a] 52af 00a0                 addq.l     #1,160(a7)
[0005506e] 10af 0094                 move.b     148(a7),(a0)
compress_image_6:
[00055072] 426f 009e                 clr.w      158(a7)
[00055076] 6000 0286                 bra        compress_image_8
compress_image_32:
[0005507a] 3f6f 0096 009a            move.w     150(a7),154(a7)
[00055080] 302f 009e                 move.w     158(a7),d0
[00055084] e548                      lsl.w      #2,d0
[00055086] 2f77 0008 008c            move.l     8(a7,d0.w),140(a7)
[0005508c] 6000 0246                 bra        compress_image_9
compress_image_31:
[00055090] 422f 0093                 clr.b      147(a7)
[00055094] 206f 008c                 movea.l    140(a7),a0
[00055098] 1010                      move.b     (a0),d0
[0005509a] 663a                      bne.s      compress_image_10
compress_image_12:
[0005509c] 536f 009a                 subq.w     #1,154(a7)
[000550a0] 522f 0093                 addq.b     #1,147(a7)
[000550a4] 52af 008c                 addq.l     #1,140(a7)
[000550a8] 206f 008c                 movea.l    140(a7),a0
[000550ac] 1010                      move.b     (a0),d0
[000550ae] 660e                      bne.s      compress_image_11
[000550b0] 0c2f 007f 0093            cmpi.b     #$7F,147(a7)
[000550b6] 6406                      bcc.s      compress_image_11
[000550b8] 302f 009a                 move.w     154(a7),d0
[000550bc] 6ede                      bgt.s      compress_image_12
compress_image_11:
[000550be] 5297                      addq.l     #1,(a7)
[000550c0] 202f 00a0                 move.l     160(a7),d0
[000550c4] 670c                      beq.s      compress_image_13
[000550c6] 206f 00a0                 movea.l    160(a7),a0
[000550ca] 52af 00a0                 addq.l     #1,160(a7)
[000550ce] 10af 0093                 move.b     147(a7),(a0)
compress_image_13:
[000550d2] 6000 0200                 bra        compress_image_9
compress_image_10:
[000550d6] 206f 008c                 movea.l    140(a7),a0
[000550da] 0c10 00ff                 cmpi.b     #$FF,(a0)
[000550de] 6640                      bne.s      compress_image_14
compress_image_16:
[000550e0] 536f 009a                 subq.w     #1,154(a7)
[000550e4] 522f 0093                 addq.b     #1,147(a7)
[000550e8] 52af 008c                 addq.l     #1,140(a7)
[000550ec] 206f 008c                 movea.l    140(a7),a0
[000550f0] 0c10 00ff                 cmpi.b     #$FF,(a0)
[000550f4] 660e                      bne.s      compress_image_15
[000550f6] 0c2f 007f 0093            cmpi.b     #$7F,147(a7)
[000550fc] 6406                      bcc.s      compress_image_15
[000550fe] 302f 009a                 move.w     154(a7),d0
[00055102] 6edc                      bgt.s      compress_image_16
compress_image_15:
[00055104] 5297                      addq.l     #1,(a7)
[00055106] 202f 00a0                 move.l     160(a7),d0
[0005510a] 6710                      beq.s      compress_image_17
[0005510c] 7080                      moveq.l    #-128,d0
[0005510e] 802f 0093                 or.b       147(a7),d0
[00055112] 206f 00a0                 movea.l    160(a7),a0
[00055116] 52af 00a0                 addq.l     #1,160(a7)
[0005511a] 1080                      move.b     d0,(a0)
compress_image_17:
[0005511c] 6000 01b6                 bra        compress_image_9
compress_image_14:
[00055120] 206f 008c                 movea.l    140(a7),a0
[00055124] 1f50 0091                 move.b     (a0),145(a7)
[00055128] 206f 008c                 movea.l    140(a7),a0
[0005512c] 1f68 0001 0090            move.b     1(a0),144(a7)
[00055132] 0c6f 0003 009a            cmpi.w     #$0003,154(a7)
[00055138] 6f00 00a0                 ble        compress_image_18
[0005513c] 206f 008c                 movea.l    140(a7),a0
[00055140] 102f 0091                 move.b     145(a7),d0
[00055144] b028 0002                 cmp.b      2(a0),d0
[00055148] 6600 0090                 bne        compress_image_18
[0005514c] 206f 008c                 movea.l    140(a7),a0
[00055150] 102f 0090                 move.b     144(a7),d0
[00055154] b028 0003                 cmp.b      3(a0),d0
[00055158] 6600 0080                 bne        compress_image_18
[0005515c] 1f7c 0001 0093            move.b     #$01,147(a7)
[00055162] 54af 008c                 addq.l     #2,140(a7)
[00055166] 556f 009a                 subq.w     #2,154(a7)
compress_image_20:
[0005516a] 556f 009a                 subq.w     #2,154(a7)
[0005516e] 522f 0093                 addq.b     #1,147(a7)
[00055172] 54af 008c                 addq.l     #2,140(a7)
[00055176] 206f 008c                 movea.l    140(a7),a0
[0005517a] 102f 0091                 move.b     145(a7),d0
[0005517e] b010                      cmp.b      (a0),d0
[00055180] 661e                      bne.s      compress_image_19
[00055182] 206f 008c                 movea.l    140(a7),a0
[00055186] 102f 0090                 move.b     144(a7),d0
[0005518a] b028 0001                 cmp.b      1(a0),d0
[0005518e] 6610                      bne.s      compress_image_19
[00055190] 0c2f 00fe 0093            cmpi.b     #$FE,147(a7)
[00055196] 6408                      bcc.s      compress_image_19
[00055198] 0c6f 0001 009a            cmpi.w     #$0001,154(a7)
[0005519e] 6eca                      bgt.s      compress_image_20
compress_image_19:
[000551a0] 5897                      addq.l     #4,(a7)
[000551a2] 202f 00a0                 move.l     160(a7),d0
[000551a6] 672e                      beq.s      compress_image_21
[000551a8] 206f 00a0                 movea.l    160(a7),a0
[000551ac] 52af 00a0                 addq.l     #1,160(a7)
[000551b0] 4210                      clr.b      (a0)
[000551b2] 206f 00a0                 movea.l    160(a7),a0
[000551b6] 52af 00a0                 addq.l     #1,160(a7)
[000551ba] 10af 0093                 move.b     147(a7),(a0)
[000551be] 206f 00a0                 movea.l    160(a7),a0
[000551c2] 52af 00a0                 addq.l     #1,160(a7)
[000551c6] 10af 0091                 move.b     145(a7),(a0)
[000551ca] 206f 00a0                 movea.l    160(a7),a0
[000551ce] 52af 00a0                 addq.l     #1,160(a7)
[000551d2] 10af 0090                 move.b     144(a7),(a0)
compress_image_21:
[000551d6] 6000 00fc                 bra        compress_image_9
compress_image_18:
[000551da] 2f6f 008c 0088            move.l     140(a7),136(a7)
[000551e0] 6000 00a4                 bra        compress_image_22
compress_image_28:
[000551e4] 536f 009a                 subq.w     #1,154(a7)
[000551e8] 522f 0093                 addq.b     #1,147(a7)
[000551ec] 52af 008c                 addq.l     #1,140(a7)
[000551f0] 302f 009a                 move.w     154(a7),d0
[000551f4] 6708                      beq.s      compress_image_23
[000551f6] 0c2f 00ff 0093            cmpi.b     #$FF,147(a7)
[000551fc] 6604                      bne.s      compress_image_24
compress_image_23:
[000551fe] 6000 008a                 bra        compress_image_25
compress_image_24:
[00055202] 0c6f 0002 009a            cmpi.w     #$0002,154(a7)
[00055208] 6f00 007c                 ble.w      compress_image_22
[0005520c] 206f 008c                 movea.l    140(a7),a0
[00055210] 1010                      move.b     (a0),d0
[00055212] 6616                      bne.s      compress_image_26
[00055214] 206f 008c                 movea.l    140(a7),a0
[00055218] 1028 0001                 move.b     1(a0),d0
[0005521c] 660c                      bne.s      compress_image_26
[0005521e] 206f 008c                 movea.l    140(a7),a0
[00055222] 1028 0002                 move.b     2(a0),d0
[00055226] 6602                      bne.s      compress_image_26
[00055228] 6060                      bra.s      compress_image_25
compress_image_26:
[0005522a] 206f 008c                 movea.l    140(a7),a0
[0005522e] 0c10 00ff                 cmpi.b     #$FF,(a0)
[00055232] 661a                      bne.s      compress_image_27
[00055234] 206f 008c                 movea.l    140(a7),a0
[00055238] 0c28 00ff 0001            cmpi.b     #$FF,1(a0)
[0005523e] 660e                      bne.s      compress_image_27
[00055240] 206f 008c                 movea.l    140(a7),a0
[00055244] 0c28 00ff 0002            cmpi.b     #$FF,2(a0)
[0005524a] 6602                      bne.s      compress_image_27
[0005524c] 603c                      bra.s      compress_image_25
compress_image_27:
[0005524e] 0c6f 0004 009a            cmpi.w     #$0004,154(a7)
[00055254] 6f30                      ble.s      compress_image_22
[00055256] 206f 008c                 movea.l    140(a7),a0
[0005525a] 1f50 0091                 move.b     (a0),145(a7)
[0005525e] 206f 008c                 movea.l    140(a7),a0
[00055262] 1f68 0001 0090            move.b     1(a0),144(a7)
[00055268] 206f 008c                 movea.l    140(a7),a0
[0005526c] 1028 0002                 move.b     2(a0),d0
[00055270] b02f 0091                 cmp.b      145(a7),d0
[00055274] 6610                      bne.s      compress_image_22
[00055276] 206f 008c                 movea.l    140(a7),a0
[0005527a] 1028 0003                 move.b     3(a0),d0
[0005527e] b02f 0090                 cmp.b      144(a7),d0
[00055282] 6602                      bne.s      compress_image_22
[00055284] 6004                      bra.s      compress_image_25
compress_image_22:
[00055286] 6000 ff5c                 bra        compress_image_28
compress_image_25:
[0005528a] 4240                      clr.w      d0
[0005528c] 102f 0093                 move.b     147(a7),d0
[00055290] 5440                      addq.w     #2,d0
[00055292] 48c0                      ext.l      d0
[00055294] d197                      add.l      d0,(a7)
[00055296] 202f 00a0                 move.l     160(a7),d0
[0005529a] 6738                      beq.s      compress_image_9
[0005529c] 206f 00a0                 movea.l    160(a7),a0
[000552a0] 52af 00a0                 addq.l     #1,160(a7)
[000552a4] 10bc ff80                 move.b     #$80,(a0)
[000552a8] 206f 00a0                 movea.l    160(a7),a0
[000552ac] 52af 00a0                 addq.l     #1,160(a7)
[000552b0] 10af 0093                 move.b     147(a7),(a0)
[000552b4] 6012                      bra.s      compress_image_29
compress_image_30:
[000552b6] 206f 0088                 movea.l    136(a7),a0
[000552ba] 52af 0088                 addq.l     #1,136(a7)
[000552be] 226f 00a0                 movea.l    160(a7),a1
[000552c2] 52af 00a0                 addq.l     #1,160(a7)
[000552c6] 1290                      move.b     (a0),(a1)
compress_image_29:
[000552c8] 102f 0093                 move.b     147(a7),d0
[000552cc] 532f 0093                 subq.b     #1,147(a7)
[000552d0] 4a00                      tst.b      d0
[000552d2] 66e2                      bne.s      compress_image_30
compress_image_9:
[000552d4] 302f 009a                 move.w     154(a7),d0
[000552d8] 6e00 fdb6                 bgt        compress_image_31
[000552dc] 7000                      moveq.l    #0,d0
[000552de] 102f 0094                 move.b     148(a7),d0
[000552e2] 322f 0098                 move.w     152(a7),d1
[000552e6] 48c1                      ext.l      d1
[000552e8] 4eb9 0008 3cac            jsr        _lmul
[000552ee] d080                      add.l      d0,d0
[000552f0] 322f 009e                 move.w     158(a7),d1
[000552f4] e549                      lsl.w      #2,d1
[000552f6] d1b7 1008                 add.l      d0,8(a7,d1.w)
[000552fa] 526f 009e                 addq.w     #1,158(a7)
compress_image_8:
[000552fe] 206f 00a8                 movea.l    168(a7),a0
[00055302] 302f 009e                 move.w     158(a7),d0
[00055306] b068 000c                 cmp.w      12(a0),d0
[0005530a] 6d00 fd6e                 blt        compress_image_32
[0005530e] 4240                      clr.w      d0
[00055310] 102f 0094                 move.b     148(a7),d0
[00055314] 916f 009c                 sub.w      d0,156(a7)
compress_image_5:
[00055318] 302f 009c                 move.w     156(a7),d0
[0005531c] 6e00 fcec                 bgt        compress_image_33
[00055320] 2017                      move.l     (a7),d0
[00055322] 4fef 00ac                 lea.l      172(a7),a7
[00055326] 4e75                      rts

vreplic:
[00055328] 4fef ff68                 lea.l      -152(a7),a7
[0005532c] 2f48 0094                 move.l     a0,148(a7)
[00055330] 3f40 0092                 move.w     d0,146(a7)
[00055334] 3f41 0090                 move.w     d1,144(a7)
[00055338] 3eaf 0090                 move.w     144(a7),(a7)
[0005533c] 7001                      moveq.l    #1,d0
[0005533e] c06f 0090                 and.w      144(a7),d0
[00055342] 6702                      beq.s      vreplic_1
[00055344] 5257                      addq.w     #1,(a7)
vreplic_1:
[00055346] 1f7c 0001 0002            move.b     #$01,2(a7)
[0005534c] 70ff                      moveq.l    #-1,d0
[0005534e] d06f 0092                 add.w      146(a7),d0
[00055352] 3f40 008e                 move.w     d0,142(a7)
[00055356] 6022                      bra.s      vreplic_2
vreplic_3:
[00055358] 3017                      move.w     (a7),d0
[0005535a] 322f 008e                 move.w     142(a7),d1
[0005535e] 48c1                      ext.l      d1
[00055360] e589                      lsl.l      #2,d1
[00055362] 206f 0094                 movea.l    148(a7),a0
[00055366] 2070 1800                 movea.l    0(a0,d1.l),a0
[0005536a] d0c0                      adda.w     d0,a0
[0005536c] 302f 008e                 move.w     142(a7),d0
[00055370] e548                      lsl.w      #2,d0
[00055372] 2f88 000c                 move.l     a0,12(a7,d0.w)
[00055376] 536f 008e                 subq.w     #1,142(a7)
vreplic_2:
[0005537a] 302f 008e                 move.w     142(a7),d0
[0005537e] 6ad8                      bpl.s      vreplic_3
[00055380] 6000 007a                 bra.w      vreplic_4
vreplic_11:
[00055384] 70ff                      moveq.l    #-1,d0
[00055386] d06f 0092                 add.w      146(a7),d0
[0005538a] 3f40 008e                 move.w     d0,142(a7)
[0005538e] 6062                      bra.s      vreplic_5
vreplic_10:
[00055390] 302f 008e                 move.w     142(a7),d0
[00055394] 48c0                      ext.l      d0
[00055396] e588                      lsl.l      #2,d0
[00055398] 206f 0094                 movea.l    148(a7),a0
[0005539c] 2f70 0800 0008            move.l     0(a0,d0.l),8(a7)
[000553a2] 302f 008e                 move.w     142(a7),d0
[000553a6] e548                      lsl.w      #2,d0
[000553a8] 2f77 000c 0004            move.l     12(a7,d0.w),4(a7)
[000553ae] 70ff                      moveq.l    #-1,d0
[000553b0] d06f 0090                 add.w      144(a7),d0
[000553b4] 3f40 008c                 move.w     d0,140(a7)
[000553b8] 6020                      bra.s      vreplic_6
vreplic_9:
[000553ba] 206f 0008                 movea.l    8(a7),a0
[000553be] 52af 0008                 addq.l     #1,8(a7)
[000553c2] 1010                      move.b     (a0),d0
[000553c4] 206f 0004                 movea.l    4(a7),a0
[000553c8] 52af 0004                 addq.l     #1,4(a7)
[000553cc] b010                      cmp.b      (a0),d0
[000553ce] 6706                      beq.s      vreplic_7
[000553d0] 102f 0002                 move.b     2(a7),d0
[000553d4] 6034                      bra.s      vreplic_8
vreplic_7:
[000553d6] 536f 008c                 subq.w     #1,140(a7)
vreplic_6:
[000553da] 302f 008c                 move.w     140(a7),d0
[000553de] 6ada                      bpl.s      vreplic_9
[000553e0] 3017                      move.w     (a7),d0
[000553e2] 48c0                      ext.l      d0
[000553e4] 322f 008e                 move.w     142(a7),d1
[000553e8] e549                      lsl.w      #2,d1
[000553ea] d1b7 100c                 add.l      d0,12(a7,d1.w)
[000553ee] 536f 008e                 subq.w     #1,142(a7)
vreplic_5:
[000553f2] 302f 008e                 move.w     142(a7),d0
[000553f6] 6a98                      bpl.s      vreplic_10
[000553f8] 522f 0002                 addq.b     #1,2(a7)
vreplic_4:
[000553fc] 0c2f 00ff 0002            cmpi.b     #$FF,2(a7)
[00055402] 6500 ff80                 bcs.w      vreplic_11
[00055406] 102f 0002                 move.b     2(a7),d0
vreplic_8:
[0005540a] 4fef 0098                 lea.l      152(a7),a7
[0005540e] 4e75                      rts

Abp_img2mfdb:
[00055410] 2f0a                      move.l     a2,-(a7)
[00055412] 4fef ffc2                 lea.l      -62(a7),a7
[00055416] 2f48 003a                 move.l     a0,58(a7)
[0005541a] 2f49 0036                 move.l     a1,54(a7)
[0005541e] 3f40 0034                 move.w     d0,52(a7)
[00055422] 206f 003a                 movea.l    58(a7),a0
[00055426] 3228 000e                 move.w     14(a0),d1
[0005542a] 206f 003a                 movea.l    58(a7),a0
[0005542e] 3028 000c                 move.w     12(a0),d0
[00055432] 6100 f73a                 bsr        Abp_create
[00055436] 226f 0036                 movea.l    54(a7),a1
[0005543a] 2288                      move.l     a0,(a1)
[0005543c] 6606                      bne.s      Abp_img2mfdb_1
[0005543e] 70ff                      moveq.l    #-1,d0
[00055440] 6000 0274                 bra        Abp_img2mfdb_2
Abp_img2mfdb_1:
[00055444] 206f 003a                 movea.l    58(a7),a0
[00055448] 3f68 000c 0024            move.w     12(a0),36(a7)
[0005544e] 206f 003a                 movea.l    58(a7),a0
[00055452] 3f68 000e 0026            move.w     14(a0),38(a7)
[00055458] 700f                      moveq.l    #15,d0
[0005545a] 206f 003a                 movea.l    58(a7),a0
[0005545e] d068 000c                 add.w      12(a0),d0
[00055462] c07c fff0                 and.w      #$FFF0,d0
[00055466] e848                      lsr.w      #4,d0
[00055468] 3f40 0028                 move.w     d0,40(a7)
[0005546c] 3f7c 0001 002a            move.w     #$0001,42(a7)
[00055472] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055478] 3f68 001c 002c            move.w     28(a0),44(a7)
[0005547e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055484] 3028 001c                 move.w     28(a0),d0
[00055488] 206f 003a                 movea.l    58(a7),a0
[0005548c] b068 0004                 cmp.w      4(a0),d0
[00055490] 6f0e                      ble.s      Abp_img2mfdb_3
[00055492] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055498] 3f68 001c 001a            move.w     28(a0),26(a7)
[0005549e] 600a                      bra.s      Abp_img2mfdb_4
Abp_img2mfdb_3:
[000554a0] 206f 003a                 movea.l    58(a7),a0
[000554a4] 3f68 0004 001a            move.w     4(a0),26(a7)
Abp_img2mfdb_4:
[000554aa] 4240                      clr.w      d0
[000554ac] 3f40 0032                 move.w     d0,50(a7)
[000554b0] 3f40 0030                 move.w     d0,48(a7)
[000554b4] 3f40 002e                 move.w     d0,46(a7)
[000554b8] 302f 0028                 move.w     40(a7),d0
[000554bc] 48c0                      ext.l      d0
[000554be] 322f 0026                 move.w     38(a7),d1
[000554c2] 48c1                      ext.l      d1
[000554c4] 4eb9 0008 3cac            jsr        _lmul
[000554ca] d080                      add.l      d0,d0
[000554cc] 2f40 001c                 move.l     d0,28(a7)
[000554d0] 202f 001c                 move.l     28(a7),d0
[000554d4] 322f 001a                 move.w     26(a7),d1
[000554d8] 48c1                      ext.l      d1
[000554da] 4eb9 0008 3cac            jsr        _lmul
[000554e0] 5280                      addq.l     #1,d0
[000554e2] 4eb9 0004 c608            jsr        Ax_malloc
[000554e8] 2f48 0004                 move.l     a0,4(a7)
[000554ec] 202f 0004                 move.l     4(a7),d0
[000554f0] 6610                      bne.s      Abp_img2mfdb_5
[000554f2] 206f 0036                 movea.l    54(a7),a0
[000554f6] 2050                      movea.l    (a0),a0
[000554f8] 6100 f70a                 bsr        Abp_delete
[000554fc] 70ff                      moveq.l    #-1,d0
[000554fe] 6000 01b6                 bra        Abp_img2mfdb_2
Abp_img2mfdb_5:
[00055502] 2f6f 0004 0020            move.l     4(a7),32(a7)
[00055508] 206f 003a                 movea.l    58(a7),a0
[0005550c] 3028 0002                 move.w     2(a0),d0
[00055510] 48c0                      ext.l      d0
[00055512] d080                      add.l      d0,d0
[00055514] 206f 003a                 movea.l    58(a7),a0
[00055518] d1c0                      adda.l     d0,a0
[0005551a] 2e88                      move.l     a0,(a7)
[0005551c] 202f 001c                 move.l     28(a7),d0
[00055520] 322f 001a                 move.w     26(a7),d1
[00055524] 48c1                      ext.l      d1
[00055526] 4eb9 0008 3cac            jsr        _lmul
[0005552c] 206f 0004                 movea.l    4(a7),a0
[00055530] 4870 0800                 pea.l      0(a0,d0.l)
[00055534] 2f2f 0008                 move.l     8(a7),-(a7)
[00055538] 226f 0008                 movea.l    8(a7),a1
[0005553c] 206f 0042                 movea.l    66(a7),a0
[00055540] 4eb9 0005 56be            jsr        uncompress_image
[00055546] 504f                      addq.w     #8,a7
[00055548] 302f 0034                 move.w     52(a7),d0
[0005554c] 6700 012e                 beq        Abp_img2mfdb_6
[00055550] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055556] 3028 001c                 move.w     28(a0),d0
[0005555a] 206f 003a                 movea.l    58(a7),a0
[0005555e] 9068 0004                 sub.w      4(a0),d0
[00055562] 3f40 0008                 move.w     d0,8(a7)
[00055566] 302f 0008                 move.w     8(a7),d0
[0005556a] 6f00 00ea                 ble        Abp_img2mfdb_7
[0005556e] 206f 003a                 movea.l    58(a7),a0
[00055572] 0c68 0001 0004            cmpi.w     #$0001,4(a0)
[00055578] 6600 0084                 bne        Abp_img2mfdb_8
[0005557c] 3f7c 0001 002c            move.w     #$0001,44(a7)
[00055582] 43ef 0020                 lea.l      32(a7),a1
[00055586] 41ef 0020                 lea.l      32(a7),a0
[0005558a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00055590] 302a 0010                 move.w     16(a2),d0
[00055594] 4eb9 0007 4978            jsr        vr_trnfm
[0005559a] 4240                      clr.w      d0
[0005559c] 3f40 0014                 move.w     d0,20(a7)
[000555a0] 3f40 0012                 move.w     d0,18(a7)
[000555a4] 3f40 000c                 move.w     d0,12(a7)
[000555a8] 3f40 000a                 move.w     d0,10(a7)
[000555ac] 70ff                      moveq.l    #-1,d0
[000555ae] 206f 0036                 movea.l    54(a7),a0
[000555b2] 2050                      movea.l    (a0),a0
[000555b4] d068 0004                 add.w      4(a0),d0
[000555b8] 3f40 0016                 move.w     d0,22(a7)
[000555bc] 3f40 000e                 move.w     d0,14(a7)
[000555c0] 70ff                      moveq.l    #-1,d0
[000555c2] 206f 0036                 movea.l    54(a7),a0
[000555c6] 2050                      movea.l    (a0),a0
[000555c8] d068 0006                 add.w      6(a0),d0
[000555cc] 3f40 0018                 move.w     d0,24(a7)
[000555d0] 3f40 0010                 move.w     d0,16(a7)
[000555d4] 4879 000e 0cf4            pea.l      color
[000555da] 206f 003a                 movea.l    58(a7),a0
[000555de] 2f10                      move.l     (a0),-(a7)
[000555e0] 43ef 0028                 lea.l      40(a7),a1
[000555e4] 41ef 0012                 lea.l      18(a7),a0
[000555e8] 7201                      moveq.l    #1,d1
[000555ea] 2479 0010 ee4e            movea.l    ACSblk,a2
[000555f0] 302a 0010                 move.w     16(a2),d0
[000555f4] 4eb9 0007 4902            jsr        vrt_cpyfm
[000555fa] 504f                      addq.w     #8,a7
[000555fc] 6056                      bra.s      Abp_img2mfdb_9
Abp_img2mfdb_8:
[000555fe] 302f 0008                 move.w     8(a7),d0
[00055602] 48c0                      ext.l      d0
[00055604] 222f 001c                 move.l     28(a7),d1
[00055608] 4eb9 0008 3cac            jsr        _lmul
[0005560e] 2200                      move.l     d0,d1
[00055610] 4240                      clr.w      d0
[00055612] 2f01                      move.l     d1,-(a7)
[00055614] 3f00                      move.w     d0,-(a7)
[00055616] 206f 0040                 movea.l    64(a7),a0
[0005561a] 3028 0004                 move.w     4(a0),d0
[0005561e] 48c0                      ext.l      d0
[00055620] 222f 0022                 move.l     34(a7),d1
[00055624] 4eb9 0008 3cac            jsr        _lmul
[0005562a] 206f 000a                 movea.l    10(a7),a0
[0005562e] d1c0                      adda.l     d0,a0
[00055630] 301f                      move.w     (a7)+,d0
[00055632] 221f                      move.l     (a7)+,d1
[00055634] 4eb9 0008 36ea            jsr        memset
[0005563a] 206f 0036                 movea.l    54(a7),a0
[0005563e] 2250                      movea.l    (a0),a1
[00055640] 41ef 0020                 lea.l      32(a7),a0
[00055644] 2479 0010 ee4e            movea.l    ACSblk,a2
[0005564a] 302a 0010                 move.w     16(a2),d0
[0005564e] 4eb9 0007 4978            jsr        vr_trnfm
Abp_img2mfdb_9:
[00055654] 601a                      bra.s      Abp_img2mfdb_10
Abp_img2mfdb_7:
[00055656] 206f 0036                 movea.l    54(a7),a0
[0005565a] 2250                      movea.l    (a0),a1
[0005565c] 41ef 0020                 lea.l      32(a7),a0
[00055660] 2479 0010 ee4e            movea.l    ACSblk,a2
[00055666] 302a 0010                 move.w     16(a2),d0
[0005566a] 4eb9 0007 4978            jsr        vr_trnfm
Abp_img2mfdb_10:
[00055670] 206f 0036                 movea.l    54(a7),a0
[00055674] 2050                      movea.l    (a0),a0
[00055676] 4268 000a                 clr.w      10(a0)
[0005567a] 602e                      bra.s      Abp_img2mfdb_11
Abp_img2mfdb_6:
[0005567c] 202f 001c                 move.l     28(a7),d0
[00055680] 322f 001a                 move.w     26(a7),d1
[00055684] 48c1                      ext.l      d1
[00055686] 4eb9 0008 3cac            jsr        _lmul
[0005568c] 226f 0004                 movea.l    4(a7),a1
[00055690] 206f 0036                 movea.l    54(a7),a0
[00055694] 2050                      movea.l    (a0),a0
[00055696] 2050                      movea.l    (a0),a0
[00055698] 4eb9 0008 3500            jsr        memcpy
[0005569e] 206f 0036                 movea.l    54(a7),a0
[000556a2] 2050                      movea.l    (a0),a0
[000556a4] 317c 0001 000a            move.w     #$0001,10(a0)
Abp_img2mfdb_11:
[000556aa] 206f 0004                 movea.l    4(a7),a0
[000556ae] 4eb9 0004 c6c8            jsr        Ax_ifree
[000556b4] 4240                      clr.w      d0
Abp_img2mfdb_2:
[000556b6] 4fef 003e                 lea.l      62(a7),a7
[000556ba] 245f                      movea.l    (a7)+,a2
[000556bc] 4e75                      rts

uncompress_image:
[000556be] 4fef ff5e                 lea.l      -162(a7),a7
[000556c2] 2f48 009e                 move.l     a0,158(a7)
[000556c6] 2f49 009a                 move.l     a1,154(a7)
[000556ca] 7007                      moveq.l    #7,d0
[000556cc] 206f 009e                 movea.l    158(a7),a0
[000556d0] d068 000c                 add.w      12(a0),d0
[000556d4] e640                      asr.w      #3,d0
[000556d6] 3f40 0092                 move.w     d0,146(a7)
[000556da] 7001                      moveq.l    #1,d0
[000556dc] d06f 0092                 add.w      146(a7),d0
[000556e0] c07c fffe                 and.w      #$FFFE,d0
[000556e4] 3f40 0090                 move.w     d0,144(a7)
[000556e8] 302f 0090                 move.w     144(a7),d0
[000556ec] 48c0                      ext.l      d0
[000556ee] 206f 009e                 movea.l    158(a7),a0
[000556f2] 3228 000e                 move.w     14(a0),d1
[000556f6] 48c1                      ext.l      d1
[000556f8] 4eb9 0008 3cac            jsr        _lmul
[000556fe] 2e80                      move.l     d0,(a7)
[00055700] 422f 008e                 clr.b      142(a7)
[00055704] 6026                      bra.s      uncompress_image_1
uncompress_image_2:
[00055706] 4240                      clr.w      d0
[00055708] 102f 008e                 move.b     142(a7),d0
[0005570c] 48c0                      ext.l      d0
[0005570e] 2217                      move.l     (a7),d1
[00055710] 4eb9 0008 3cac            jsr        _lmul
[00055716] 206f 00a6                 movea.l    166(a7),a0
[0005571a] d1c0                      adda.l     d0,a0
[0005571c] 4240                      clr.w      d0
[0005571e] 102f 008e                 move.b     142(a7),d0
[00055722] e548                      lsl.w      #2,d0
[00055724] 2f88 0004                 move.l     a0,4(a7,d0.w)
[00055728] 522f 008e                 addq.b     #1,142(a7)
uncompress_image_1:
[0005572c] 4240                      clr.w      d0
[0005572e] 102f 008e                 move.b     142(a7),d0
[00055732] 206f 009e                 movea.l    158(a7),a0
[00055736] b068 0004                 cmp.w      4(a0),d0
[0005573a] 6dca                      blt.s      uncompress_image_2
[0005573c] 206f 009e                 movea.l    158(a7),a0
[00055740] 3f68 000e 0096            move.w     14(a0),150(a7)
[00055746] 6000 01e8                 bra        uncompress_image_3
uncompress_image_30:
[0005574a] 422f 008f                 clr.b      143(a7)
[0005574e] 426f 0098                 clr.w      152(a7)
[00055752] 6000 01be                 bra        uncompress_image_4
uncompress_image_29:
[00055756] 3f6f 0092 0094            move.w     146(a7),148(a7)
[0005575c] 302f 0098                 move.w     152(a7),d0
[00055760] e548                      lsl.w      #2,d0
[00055762] 2077 0004                 movea.l    4(a7,d0.w),a0
[00055766] 2f48 0084                 move.l     a0,132(a7)
[0005576a] 2f48 0088                 move.l     a0,136(a7)
[0005576e] 206f 0084                 movea.l    132(a7),a0
[00055772] b1ef 00aa                 cmpa.l     170(a7),a0
[00055776] 6514                      bcs.s      uncompress_image_5
[00055778] 91c8                      suba.l     a0,a0
[0005577a] 7015                      moveq.l    #21,d0
[0005577c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00055782] 2269 03d6                 movea.l    982(a1),a1
[00055786] 4e91                      jsr        (a1)
[00055788] 6000 01ae                 bra        uncompress_image_6
uncompress_image_5:
[0005578c] 6000 0116                 bra        uncompress_image_7
uncompress_image_24:
[00055790] 206f 009a                 movea.l    154(a7),a0
[00055794] 52af 009a                 addq.l     #1,154(a7)
[00055798] 4240                      clr.w      d0
[0005579a] 1010                      move.b     (a0),d0
[0005579c] 4a40                      tst.w      d0
[0005579e] 670c                      beq.s      uncompress_image_8
[000557a0] 907c 0080                 sub.w      #$0080,d0
[000557a4] 6700 008c                 beq        uncompress_image_9
[000557a8] 6000 00b8                 bra        uncompress_image_10
uncompress_image_8:
[000557ac] 206f 009a                 movea.l    154(a7),a0
[000557b0] 52af 009a                 addq.l     #1,154(a7)
[000557b4] 1f50 008e                 move.b     (a0),142(a7)
[000557b8] 102f 008e                 move.b     142(a7),d0
[000557bc] 6622                      bne.s      uncompress_image_11
[000557be] 206f 009a                 movea.l    154(a7),a0
[000557c2] 0c10 00ff                 cmpi.b     #$FF,(a0)
[000557c6] 6604                      bne.s      uncompress_image_12
[000557c8] 52af 009a                 addq.l     #1,154(a7)
uncompress_image_12:
[000557cc] 206f 009a                 movea.l    154(a7),a0
[000557d0] 52af 009a                 addq.l     #1,154(a7)
[000557d4] 1010                      move.b     (a0),d0
[000557d6] d03c 00ff                 add.b      #$FF,d0
[000557da] 1f40 008f                 move.b     d0,143(a7)
[000557de] 604e                      bra.s      uncompress_image_13
uncompress_image_11:
[000557e0] 6038                      bra.s      uncompress_image_14
uncompress_image_17:
[000557e2] 422f 008d                 clr.b      141(a7)
[000557e6] 601e                      bra.s      uncompress_image_15
uncompress_image_16:
[000557e8] 7000                      moveq.l    #0,d0
[000557ea] 102f 008d                 move.b     141(a7),d0
[000557ee] 206f 009a                 movea.l    154(a7),a0
[000557f2] 226f 0084                 movea.l    132(a7),a1
[000557f6] 52af 0084                 addq.l     #1,132(a7)
[000557fa] 12b0 0800                 move.b     0(a0,d0.l),(a1)
[000557fe] 536f 0094                 subq.w     #1,148(a7)
[00055802] 522f 008d                 addq.b     #1,141(a7)
uncompress_image_15:
[00055806] 4240                      clr.w      d0
[00055808] 102f 008d                 move.b     141(a7),d0
[0005580c] 206f 009e                 movea.l    158(a7),a0
[00055810] b068 0006                 cmp.w      6(a0),d0
[00055814] 6dd2                      blt.s      uncompress_image_16
[00055816] 532f 008e                 subq.b     #1,142(a7)
uncompress_image_14:
[0005581a] 102f 008e                 move.b     142(a7),d0
[0005581e] 66c2                      bne.s      uncompress_image_17
[00055820] 206f 009e                 movea.l    158(a7),a0
[00055824] 3028 0006                 move.w     6(a0),d0
[00055828] 48c0                      ext.l      d0
[0005582a] d1af 009a                 add.l      d0,154(a7)
uncompress_image_13:
[0005582e] 6000 0074                 bra.w      uncompress_image_7
uncompress_image_9:
[00055832] 206f 009a                 movea.l    154(a7),a0
[00055836] 52af 009a                 addq.l     #1,154(a7)
[0005583a] 1f50 008e                 move.b     (a0),142(a7)
[0005583e] 601a                      bra.s      uncompress_image_18
uncompress_image_19:
[00055840] 206f 009a                 movea.l    154(a7),a0
[00055844] 52af 009a                 addq.l     #1,154(a7)
[00055848] 226f 0084                 movea.l    132(a7),a1
[0005584c] 52af 0084                 addq.l     #1,132(a7)
[00055850] 1290                      move.b     (a0),(a1)
[00055852] 536f 0094                 subq.w     #1,148(a7)
[00055856] 532f 008e                 subq.b     #1,142(a7)
uncompress_image_18:
[0005585a] 102f 008e                 move.b     142(a7),d0
[0005585e] 66e0                      bne.s      uncompress_image_19
[00055860] 6042                      bra.s      uncompress_image_7
uncompress_image_10:
[00055862] 206f 009a                 movea.l    154(a7),a0
[00055866] 1f68 ffff 008e            move.b     -1(a0),142(a7)
[0005586c] 103c 0080                 move.b     #$80,d0
[00055870] c02f 008e                 and.b      142(a7),d0
[00055874] 670e                      beq.s      uncompress_image_20
[00055876] 1f7c 00ff 008c            move.b     #$FF,140(a7)
[0005587c] 022f 007f 008e            andi.b     #$7F,142(a7)
[00055882] 6004                      bra.s      uncompress_image_21
uncompress_image_20:
[00055884] 422f 008c                 clr.b      140(a7)
uncompress_image_21:
[00055888] 6014                      bra.s      uncompress_image_22
uncompress_image_23:
[0005588a] 206f 0084                 movea.l    132(a7),a0
[0005588e] 52af 0084                 addq.l     #1,132(a7)
[00055892] 10af 008c                 move.b     140(a7),(a0)
[00055896] 536f 0094                 subq.w     #1,148(a7)
[0005589a] 532f 008e                 subq.b     #1,142(a7)
uncompress_image_22:
[0005589e] 102f 008e                 move.b     142(a7),d0
[000558a2] 66e6                      bne.s      uncompress_image_23
uncompress_image_7:
[000558a4] 302f 0094                 move.w     148(a7),d0
[000558a8] 6e00 fee6                 bgt        uncompress_image_24
[000558ac] 7001                      moveq.l    #1,d0
[000558ae] c06f 0092                 and.w      146(a7),d0
[000558b2] 670a                      beq.s      uncompress_image_25
[000558b4] 206f 0084                 movea.l    132(a7),a0
[000558b8] 52af 0084                 addq.l     #1,132(a7)
[000558bc] 4210                      clr.b      (a0)
uncompress_image_25:
[000558be] 422f 008e                 clr.b      142(a7)
[000558c2] 6034                      bra.s      uncompress_image_26
uncompress_image_28:
[000558c4] 302f 0092                 move.w     146(a7),d0
[000558c8] 48c0                      ext.l      d0
[000558ca] 226f 0088                 movea.l    136(a7),a1
[000558ce] 206f 0084                 movea.l    132(a7),a0
[000558d2] 4eb9 0008 3500            jsr        memcpy
[000558d8] 302f 0092                 move.w     146(a7),d0
[000558dc] 48c0                      ext.l      d0
[000558de] d1af 0084                 add.l      d0,132(a7)
[000558e2] 7001                      moveq.l    #1,d0
[000558e4] c06f 0092                 and.w      146(a7),d0
[000558e8] 670a                      beq.s      uncompress_image_27
[000558ea] 206f 0084                 movea.l    132(a7),a0
[000558ee] 52af 0084                 addq.l     #1,132(a7)
[000558f2] 4210                      clr.b      (a0)
uncompress_image_27:
[000558f4] 522f 008e                 addq.b     #1,142(a7)
uncompress_image_26:
[000558f8] 102f 008e                 move.b     142(a7),d0
[000558fc] b02f 008f                 cmp.b      143(a7),d0
[00055900] 65c2                      bcs.s      uncompress_image_28
[00055902] 302f 0098                 move.w     152(a7),d0
[00055906] e548                      lsl.w      #2,d0
[00055908] 2faf 0084 0004            move.l     132(a7),4(a7,d0.w)
[0005590e] 526f 0098                 addq.w     #1,152(a7)
uncompress_image_4:
[00055912] 206f 009e                 movea.l    158(a7),a0
[00055916] 302f 0098                 move.w     152(a7),d0
[0005591a] b068 0004                 cmp.w      4(a0),d0
[0005591e] 6d00 fe36                 blt        uncompress_image_29
[00055922] 4240                      clr.w      d0
[00055924] 102f 008f                 move.b     143(a7),d0
[00055928] 916f 0096                 sub.w      d0,150(a7)
[0005592c] 536f 0096                 subq.w     #1,150(a7)
uncompress_image_3:
[00055930] 302f 0096                 move.w     150(a7),d0
[00055934] 6e00 fe14                 bgt        uncompress_image_30
uncompress_image_6:
[00055938] 4fef 00a2                 lea.l      162(a7),a7
[0005593c] 4e75                      rts

	.data

init:
[000e0cea]                           dc.w $0000
pxy:
[000e0cec]                           dc.w $0000
[000e0cee]                           dc.w $0000
[000e0cf0]                           dc.w $0000
[000e0cf2]                           dc.w $0000
color:
[000e0cf4]                           dc.w $0001
[000e0cf6]                           dc.w $0000
