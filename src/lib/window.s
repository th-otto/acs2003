INwindow:
[0005593e] 594f                      subq.w     #4,a7
[00055940] 3039 000e 0cf8            move.w     init,d0
[00055946] 5279 000e 0cf8            addq.w     #1,init
[0005594c] 4a40                      tst.w      d0
[0005594e] 6706                      beq.s      $00055956
[00055950] 4240                      clr.w      d0
[00055952] 6000 0226                 bra        $00055B7A
[00055956] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005595c] 2068 023c                 movea.l    572(a0),a0
[00055960] 33e8 000a 0011 3f1e       move.w     10(a0),virt_desk
[00055968] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005596e] 3028 000a                 move.w     10(a0),d0
[00055972] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055978] 2068 023c                 movea.l    572(a0),a0
[0005597c] b068 000c                 cmp.w      12(a0),d0
[00055980] 6f0c                      ble.s      $0005598E
[00055982] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055988] 3028 000a                 move.w     10(a0),d0
[0005598c] 600e                      bra.s      $0005599C
[0005598e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055994] 2068 023c                 movea.l    572(a0),a0
[00055998] 3028 000c                 move.w     12(a0),d0
[0005599c] 33c0 0011 3f20            move.w     d0,$00113F20
[000559a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000559a8] 3028 000c                 move.w     12(a0),d0
[000559ac] 2079 0010 ee4e            movea.l    ACSblk,a0
[000559b2] 2068 023c                 movea.l    572(a0),a0
[000559b6] 3228 000a                 move.w     10(a0),d1
[000559ba] d241                      add.w      d1,d1
[000559bc] 9041                      sub.w      d1,d0
[000559be] 33c0 0011 3f22            move.w     d0,$00113F22
[000559c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000559ca] 3028 000a                 move.w     10(a0),d0
[000559ce] 2079 0010 ee4e            movea.l    ACSblk,a0
[000559d4] d068 000e                 add.w      14(a0),d0
[000559d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000559de] 2068 023c                 movea.l    572(a0),a0
[000559e2] 9068 000c                 sub.w      12(a0),d0
[000559e6] 9079 0011 3f20            sub.w      $00113F20,d0
[000559ec] 33c0 0011 3f24            move.w     d0,$00113F24
[000559f2] 2079 0010 ee4e            movea.l    ACSblk,a0
[000559f8] 3228 0004                 move.w     4(a0),d1
[000559fc] 3001                      move.w     d1,d0
[000559fe] e548                      lsl.w      #2,d0
[00055a00] d041                      add.w      d1,d0
[00055a02] 33c0 0011 3ae6            move.w     d0,wi_minw
[00055a08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055a0e] 3228 0006                 move.w     6(a0),d1
[00055a12] 3001                      move.w     d1,d0
[00055a14] d040                      add.w      d0,d0
[00055a16] d041                      add.w      d1,d0
[00055a18] d040                      add.w      d0,d0
[00055a1a] 33c0 0011 3ae8            move.w     d0,wi_minh
[00055a20] 41f9 000d f978            lea.l      _ICO,a0
[00055a26] 4eb9 0004 f064            jsr        Aob_create
[00055a2c] 23c8 0011 3f16            move.l     a0,_WWorkIcon
[00055a32] 2039 0011 3f16            move.l     _WWorkIcon,d0
[00055a38] 6730                      beq.s      $00055A6A
[00055a3a] 2079 0011 3f16            movea.l    _WWorkIcon,a0
[00055a40] 4eb9 0004 fbdc            jsr        Aob_fix
[00055a46] 2079 0011 3f16            movea.l    _WWorkIcon,a0
[00055a4c] 41e8 0018                 lea.l      24(a0),a0
[00055a50] 23c8 0011 3f1a            move.l     a0,_WIcon
[00055a56] 2079 0011 3f1a            movea.l    _WIcon,a0
[00055a5c] 2068 000c                 movea.l    12(a0),a0
[00055a60] 23e8 0008 0011 3f12       move.l     8(a0),_WIconText
[00055a68] 600e                      bra.s      $00055A78
[00055a6a] 7000                      moveq.l    #0,d0
[00055a6c] 23c0 0011 3f12            move.l     d0,_WIconText
[00055a72] 23c0 0011 3f1a            move.l     d0,_WIcon
[00055a78] 4279 0011 4528            clr.w      _ACSv_wmenu
[00055a7e] 4279 0011 4526            clr.w      _ACSv_wwork
[00055a84] 7220                      moveq.l    #32,d1
[00055a86] 4240                      clr.w      d0
[00055a88] 41f9 0011 3cf2            lea.l      modwins,a0
[00055a8e] 4eb9 0008 36ea            jsr        memset
[00055a94] 223c 0000 0400            move.l     #$00000400,d1
[00055a9a] 4240                      clr.w      d0
[00055a9c] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[00055aa2] 4eb9 0008 36ea            jsr        memset
[00055aa8] 223c 0000 0200            move.l     #$00000200,d1
[00055aae] 4240                      clr.w      d0
[00055ab0] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055ab6] 4eb9 0008 36ea            jsr        memset
[00055abc] 223c 0000 0200            move.l     #$00000200,d1
[00055ac2] 4240                      clr.w      d0
[00055ac4] 41f9 0011 3d12            lea.l      icnmap,a0
[00055aca] 4eb9 0008 36ea            jsr        memset
[00055ad0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055ad6] 3028 0236                 move.w     566(a0),d0
[00055ada] 670c                      beq.s      $00055AE8
[00055adc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055ae2] 3028 0238                 move.w     568(a0),d0
[00055ae6] 6720                      beq.s      $00055B08
[00055ae8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055aee] 2068 023c                 movea.l    572(a0),a0
[00055af2] 2028 0034                 move.l     52(a0),d0
[00055af6] 6710                      beq.s      $00055B08
[00055af8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055afe] 2068 023c                 movea.l    572(a0),a0
[00055b02] 2ea8 0034                 move.l     52(a0),(a7)
[00055b06] 600e                      bra.s      $00055B16
[00055b08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055b0e] 2068 023c                 movea.l    572(a0),a0
[00055b12] 2ea8 0030                 move.l     48(a0),(a7)
[00055b16] 91c8                      suba.l     a0,a0
[00055b18] 2257                      movea.l    (a7),a1
[00055b1a] 2269 0008                 movea.l    8(a1),a1
[00055b1e] 4e91                      jsr        (a1)
[00055b20] 23c8 000e 0d26            move.l     a0,Aroot_wi
[00055b26] 2039 000e 0d26            move.l     Aroot_wi,d0
[00055b2c] 6604                      bne.s      $00055B32
[00055b2e] 70ff                      moveq.l    #-1,d0
[00055b30] 6048                      bra.s      $00055B7A
[00055b32] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055b38] 3028 0236                 move.w     566(a0),d0
[00055b3c] 673a                      beq.s      $00055B78
[00055b3e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055b44] 3028 0238                 move.w     568(a0),d0
[00055b48] 6722                      beq.s      $00055B6C
[00055b4a] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00055b50] 2028 0014                 move.l     20(a0),d0
[00055b54] 6716                      beq.s      $00055B6C
[00055b56] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00055b5c] 4eb9 0005 7428            jsr        Awi_open
[00055b62] 5240                      addq.w     #1,d0
[00055b64] 6604                      bne.s      $00055B6A
[00055b66] 70ff                      moveq.l    #-1,d0
[00055b68] 6010                      bra.s      $00055B7A
[00055b6a] 600c                      bra.s      $00055B78
[00055b6c] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00055b72] 4eb9 0005 8174            jsr        Awi_ropen
[00055b78] 4240                      clr.w      d0
[00055b7a] 584f                      addq.w     #4,a7
[00055b7c] 4e75                      rts
TRwindow:
[00055b7e] 2f0a                      move.l     a2,-(a7)
[00055b80] 5d4f                      subq.w     #6,a7
[00055b82] 5379 000e 0cf8            subq.w     #1,init
[00055b88] 6704                      beq.s      $00055B8E
[00055b8a] 6000 00c8                 bra        $00055C54
[00055b8e] 7001                      moveq.l    #1,d0
[00055b90] 4eb9 0005 ae7e            jsr        Awi_update
[00055b96] 3f79 0011 452a 0004       move.w     _Wmax_wi,4(a7)
[00055b9e] 6030                      bra.s      $00055BD0
[00055ba0] 302f 0004                 move.w     4(a7),d0
[00055ba4] e548                      lsl.w      #2,d0
[00055ba6] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[00055bac] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00055bb0] 2017                      move.l     (a7),d0
[00055bb2] 6718                      beq.s      $00055BCC
[00055bb4] 2057                      movea.l    (a7),a0
[00055bb6] b1f9 000e 0d26            cmpa.l     Aroot_wi,a0
[00055bbc] 670e                      beq.s      $00055BCC
[00055bbe] 93c9                      suba.l     a1,a1
[00055bc0] 7002                      moveq.l    #2,d0
[00055bc2] 2057                      movea.l    (a7),a0
[00055bc4] 2457                      movea.l    (a7),a2
[00055bc6] 246a 0004                 movea.l    4(a2),a2
[00055bca] 4e92                      jsr        (a2)
[00055bcc] 536f 0004                 subq.w     #1,4(a7)
[00055bd0] 302f 0004                 move.w     4(a7),d0
[00055bd4] 6aca                      bpl.s      $00055BA0
[00055bd6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055bdc] 2068 0298                 movea.l    664(a0),a0
[00055be0] 4e90                      jsr        (a0)
[00055be2] 93c9                      suba.l     a1,a1
[00055be4] 7002                      moveq.l    #2,d0
[00055be6] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00055bec] 2479 000e 0d26            movea.l    Aroot_wi,a2
[00055bf2] 246a 0004                 movea.l    4(a2),a2
[00055bf6] 4e92                      jsr        (a2)
[00055bf8] 426f 0004                 clr.w      4(a7)
[00055bfc] 6048                      bra.s      $00055C46
[00055bfe] 302f 0004                 move.w     4(a7),d0
[00055c02] e548                      lsl.w      #2,d0
[00055c04] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055c0a] 2030 0000                 move.l     0(a0,d0.w),d0
[00055c0e] 6732                      beq.s      $00055C42
[00055c10] 302f 0004                 move.w     4(a7),d0
[00055c14] e548                      lsl.w      #2,d0
[00055c16] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055c1c] 2070 0000                 movea.l    0(a0,d0.w),a0
[00055c20] 2068 0024                 movea.l    36(a0),a0
[00055c24] 4eb9 0004 f99a            jsr        Aic_delete
[00055c2a] 7048                      moveq.l    #72,d0
[00055c2c] 322f 0004                 move.w     4(a7),d1
[00055c30] e549                      lsl.w      #2,d1
[00055c32] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055c38] 2070 1000                 movea.l    0(a0,d1.w),a0
[00055c3c] 4eb9 0004 cc28            jsr        Ax_recycle
[00055c42] 526f 0004                 addq.w     #1,4(a7)
[00055c46] 0c6f 0080 0004            cmpi.w     #$0080,4(a7)
[00055c4c] 6db0                      blt.s      $00055BFE
[00055c4e] 4eb9 0004 c8f6            jsr        Ax_release
[00055c54] 5c4f                      addq.w     #6,a7
[00055c56] 245f                      movea.l    (a7)+,a2
[00055c58] 4e75                      rts
Awi_ontop:
[00055c5a] 2039 000e 0d2a            move.l     top_window,d0
[00055c60] 6608                      bne.s      $00055C6A
[00055c62] 4eb9 0005 5e8c            jsr        Awi_root
[00055c68] 4e75                      rts
[00055c6a] 2079 000e 0d2a            movea.l    top_window,a0
[00055c70] 4e75                      rts
Awi_setontop:
[00055c72] 594f                      subq.w     #4,a7
[00055c74] 2e88                      move.l     a0,(a7)
[00055c76] 2057                      movea.l    (a7),a0
[00055c78] 23c8 000e 0d2a            move.l     a0,top_window
[00055c7e] 584f                      addq.w     #4,a7
[00055c80] 4e75                      rts
Awi_iconcreate:
[00055c82] 4fef fff4                 lea.l      -12(a7),a7
[00055c86] 2f48 0008                 move.l     a0,8(a7)
[00055c8a] 206f 0008                 movea.l    8(a7),a0
[00055c8e] 3028 0020                 move.w     32(a0),d0
[00055c92] 6b4a                      bmi.s      $00055CDE
[00055c94] 206f 0008                 movea.l    8(a7),a0
[00055c98] 0c68 0080 0020            cmpi.w     #$0080,32(a0)
[00055c9e] 6c3e                      bge.s      $00055CDE
[00055ca0] 2039 0011 3f16            move.l     _WWorkIcon,d0
[00055ca6] 6736                      beq.s      $00055CDE
[00055ca8] 206f 0008                 movea.l    8(a7),a0
[00055cac] 3028 0020                 move.w     32(a0),d0
[00055cb0] e548                      lsl.w      #2,d0
[00055cb2] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055cb8] 2030 0000                 move.l     0(a0,d0.w),d0
[00055cbc] 6620                      bne.s      $00055CDE
[00055cbe] 7048                      moveq.l    #72,d0
[00055cc0] 4eb9 0004 c608            jsr        Ax_malloc
[00055cc6] 2e88                      move.l     a0,(a7)
[00055cc8] 226f 0008                 movea.l    8(a7),a1
[00055ccc] 3029 0020                 move.w     32(a1),d0
[00055cd0] e548                      lsl.w      #2,d0
[00055cd2] 43f9 0011 4326            lea.l      _ACSv_wiicons,a1
[00055cd8] 2388 0000                 move.l     a0,0(a1,d0.w)
[00055cdc] 6606                      bne.s      $00055CE4
[00055cde] 4240                      clr.w      d0
[00055ce0] 6000 0080                 bra        $00055D62
[00055ce4] 7048                      moveq.l    #72,d0
[00055ce6] 2279 0011 3f16            movea.l    _WWorkIcon,a1
[00055cec] 2057                      movea.l    (a7),a0
[00055cee] 4eb9 0008 3500            jsr        memcpy
[00055cf4] 206f 0008                 movea.l    8(a7),a0
[00055cf8] 2f68 005a 0004            move.l     90(a0),4(a7)
[00055cfe] 6712                      beq.s      $00055D12
[00055d00] 206f 0004                 movea.l    4(a7),a0
[00055d04] 4eb9 0004 f606            jsr        Aic_create
[00055d0a] 2257                      movea.l    (a7),a1
[00055d0c] 2348 0024                 move.l     a0,36(a1)
[00055d10] 6042                      bra.s      $00055D54
[00055d12] 206f 0008                 movea.l    8(a7),a0
[00055d16] 2028 004a                 move.l     74(a0),d0
[00055d1a] 6710                      beq.s      $00055D2C
[00055d1c] 206f 0008                 movea.l    8(a7),a0
[00055d20] 2257                      movea.l    (a7),a1
[00055d22] 2269 0024                 movea.l    36(a1),a1
[00055d26] 2368 004a 0008            move.l     74(a0),8(a1)
[00055d2c] 2079 0011 3f1a            movea.l    _WIcon,a0
[00055d32] 2068 000c                 movea.l    12(a0),a0
[00055d36] 4eb9 0004 f606            jsr        Aic_create
[00055d3c] 2257                      movea.l    (a7),a1
[00055d3e] 2348 0024                 move.l     a0,36(a1)
[00055d42] 2079 0011 3f1a            movea.l    _WIcon,a0
[00055d48] 2068 000c                 movea.l    12(a0),a0
[00055d4c] 2179 0011 3f12 0008       move.l     _WIconText,8(a0)
[00055d54] 2057                      movea.l    (a7),a0
[00055d56] 41e8 0018                 lea.l      24(a0),a0
[00055d5a] 4eb9 0004 fd76            jsr        Aob_icon
[00055d60] 7001                      moveq.l    #1,d0
[00055d62] 4fef 000c                 lea.l      12(a7),a7
[00055d66] 4e75                      rts
Awi_icondelete:
[00055d68] 594f                      subq.w     #4,a7
[00055d6a] 2e88                      move.l     a0,(a7)
[00055d6c] 2057                      movea.l    (a7),a0
[00055d6e] 3028 0020                 move.w     32(a0),d0
[00055d72] 6b1e                      bmi.s      $00055D92
[00055d74] 2057                      movea.l    (a7),a0
[00055d76] 0c68 0080 0020            cmpi.w     #$0080,32(a0)
[00055d7c] 6c14                      bge.s      $00055D92
[00055d7e] 2057                      movea.l    (a7),a0
[00055d80] 3028 0020                 move.w     32(a0),d0
[00055d84] e548                      lsl.w      #2,d0
[00055d86] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055d8c] 2030 0000                 move.l     0(a0,d0.w),d0
[00055d90] 6604                      bne.s      $00055D96
[00055d92] 4240                      clr.w      d0
[00055d94] 604a                      bra.s      $00055DE0
[00055d96] 2057                      movea.l    (a7),a0
[00055d98] 3028 0020                 move.w     32(a0),d0
[00055d9c] e548                      lsl.w      #2,d0
[00055d9e] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055da4] 2070 0000                 movea.l    0(a0,d0.w),a0
[00055da8] 2068 0024                 movea.l    36(a0),a0
[00055dac] 4eb9 0004 f99a            jsr        Aic_delete
[00055db2] 7048                      moveq.l    #72,d0
[00055db4] 2057                      movea.l    (a7),a0
[00055db6] 3228 0020                 move.w     32(a0),d1
[00055dba] e549                      lsl.w      #2,d1
[00055dbc] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055dc2] 2070 1000                 movea.l    0(a0,d1.w),a0
[00055dc6] 4eb9 0004 cc28            jsr        Ax_recycle
[00055dcc] 2057                      movea.l    (a7),a0
[00055dce] 3028 0020                 move.w     32(a0),d0
[00055dd2] e548                      lsl.w      #2,d0
[00055dd4] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00055dda] 42b0 0000                 clr.l      0(a0,d0.w)
[00055dde] 7001                      moveq.l    #1,d0
[00055de0] 584f                      addq.w     #4,a7
[00055de2] 4e75                      rts
Awi_invalid:
[00055de4] 2f0a                      move.l     a2,-(a7)
[00055de6] 5d4f                      subq.w     #6,a7
[00055de8] 426f 0004                 clr.w      4(a7)
[00055dec] 6020                      bra.s      $00055E0E
[00055dee] 302f 0004                 move.w     4(a7),d0
[00055df2] e548                      lsl.w      #2,d0
[00055df4] 41f9 0011 3af2            lea.l      gemmap,a0
[00055dfa] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00055dfe] 2017                      move.l     (a7),d0
[00055e00] 6708                      beq.s      $00055E0A
[00055e02] 2057                      movea.l    (a7),a0
[00055e04] 317c ffff 0020            move.w     #$FFFF,32(a0)
[00055e0a] 526f 0004                 addq.w     #1,4(a7)
[00055e0e] 0c6f 0080 0004            cmpi.w     #$0080,4(a7)
[00055e14] 6dd8                      blt.s      $00055DEE
[00055e16] 426f 0004                 clr.w      4(a7)
[00055e1a] 603e                      bra.s      $00055E5A
[00055e1c] 302f 0004                 move.w     4(a7),d0
[00055e20] e548                      lsl.w      #2,d0
[00055e22] 41f9 0011 3af2            lea.l      gemmap,a0
[00055e28] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00055e2c] 302f 0004                 move.w     4(a7),d0
[00055e30] e548                      lsl.w      #2,d0
[00055e32] 41f9 0011 3af2            lea.l      gemmap,a0
[00055e38] 42b0 0000                 clr.l      0(a0,d0.w)
[00055e3c] 2017                      move.l     (a7),d0
[00055e3e] 6716                      beq.s      $00055E56
[00055e40] 2057                      movea.l    (a7),a0
[00055e42] 4eb9 0005 8362            jsr        Awi_closed
[00055e48] 93c9                      suba.l     a1,a1
[00055e4a] 7003                      moveq.l    #3,d0
[00055e4c] 2057                      movea.l    (a7),a0
[00055e4e] 2457                      movea.l    (a7),a2
[00055e50] 246a 0004                 movea.l    4(a2),a2
[00055e54] 4e92                      jsr        (a2)
[00055e56] 526f 0004                 addq.w     #1,4(a7)
[00055e5a] 0c6f 0080 0004            cmpi.w     #$0080,4(a7)
[00055e60] 6dba                      blt.s      $00055E1C
[00055e62] 5c4f                      addq.w     #6,a7
[00055e64] 245f                      movea.l    (a7)+,a2
[00055e66] 4e75                      rts
Awi_wid:
[00055e68] 554f                      subq.w     #2,a7
[00055e6a] 3e80                      move.w     d0,(a7)
[00055e6c] 3017                      move.w     (a7),d0
[00055e6e] 6b06                      bmi.s      $00055E76
[00055e70] 0c57 0080                 cmpi.w     #$0080,(a7)
[00055e74] 6d04                      blt.s      $00055E7A
[00055e76] 91c8                      suba.l     a0,a0
[00055e78] 600e                      bra.s      $00055E88
[00055e7a] 3017                      move.w     (a7),d0
[00055e7c] e548                      lsl.w      #2,d0
[00055e7e] 41f9 0011 3af2            lea.l      gemmap,a0
[00055e84] 2070 0000                 movea.l    0(a0,d0.w),a0
[00055e88] 544f                      addq.w     #2,a7
[00055e8a] 4e75                      rts
Awi_root:
[00055e8c] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00055e92] 4e75                      rts
Awi_init:
[00055e94] 4240                      clr.w      d0
[00055e96] 4e75                      rts
Ash_prog:
[00055e98] 2f0a                      move.l     a2,-(a7)
[00055e9a] 4fef fc8c                 lea.l      -884(a7),a7
[00055e9e] 2f48 0358                 move.l     a0,856(a7)
[00055ea2] 2f49 0354                 move.l     a1,852(a7)
[00055ea6] 426f 014a                 clr.w      330(a7)
[00055eaa] 426f 0146                 clr.w      326(a7)
[00055eae] 42af 012a                 clr.l      298(a7)
[00055eb2] 41f9 000e 0d46            lea.l      $000E0D46,a0
[00055eb8] 43ef 00a0                 lea.l      160(a7),a1
[00055ebc] 707f                      moveq.l    #127,d0
[00055ebe] 12d8                      move.b     (a0)+,(a1)+
[00055ec0] 51c8 fffc                 dbf        d0,$00055EBE
[00055ec4] 41f9 000e 0dc6            lea.l      $000E0DC6,a0
[00055eca] 43ef 0020                 lea.l      32(a7),a1
[00055ece] 707f                      moveq.l    #127,d0
[00055ed0] 12d8                      move.b     (a0)+,(a1)+
[00055ed2] 51c8 fffc                 dbf        d0,$00055ED0
[00055ed6] 42af 0018                 clr.l      24(a7)
[00055eda] 2039 000e 0d0a            move.l     exec_com,d0
[00055ee0] 6712                      beq.s      $00055EF4
[00055ee2] 2079 000e 0d0a            movea.l    exec_com,a0
[00055ee8] 4eb9 0004 c9da            jsr        Ax_glfree
[00055eee] 42b9 000e 0d0a            clr.l      exec_com
[00055ef4] 2039 000e 0d06            move.l     exec_path,d0
[00055efa] 6712                      beq.s      $00055F0E
[00055efc] 2079 000e 0d06            movea.l    exec_path,a0
[00055f02] 4eb9 0004 c9da            jsr        Ax_glfree
[00055f08] 42b9 000e 0d06            clr.l      exec_path
[00055f0e] 206f 0358                 movea.l    856(a7),a0
[00055f12] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00055f18] 4a40                      tst.w      d0
[00055f1a] 6706                      beq.s      $00055F22
[00055f1c] 70ff                      moveq.l    #-1,d0
[00055f1e] 6000 08f2                 bra        $00056812
[00055f22] 2079 0010 ee4e            movea.l    ACSblk,a0
[00055f28] 2068 023c                 movea.l    572(a0),a0
[00055f2c] 3028 000e                 move.w     14(a0),d0
[00055f30] c07c 0200                 and.w      #$0200,d0
[00055f34] 6642                      bne.s      $00055F78
[00055f36] 707f                      moveq.l    #127,d0
[00055f38] 226f 0358                 movea.l    856(a7),a1
[00055f3c] 41ef 0020                 lea.l      32(a7),a0
[00055f40] 4eb9 0008 2f96            jsr        strncat
[00055f46] 705c                      moveq.l    #92,d0
[00055f48] 41ef 0020                 lea.l      32(a7),a0
[00055f4c] 4eb9 0008 2e9e            jsr        strrchr
[00055f52] 2f48 001c                 move.l     a0,28(a7)
[00055f56] 6706                      beq.s      $00055F5E
[00055f58] 206f 001c                 movea.l    28(a7),a0
[00055f5c] 4210                      clr.b      (a0)
[00055f5e] 41ef 0020                 lea.l      32(a7),a0
[00055f62] 4eb9 0004 b548            jsr        Af_2drv
[00055f68] 4eb9 0008 0c48            jsr        Dsetdrv
[00055f6e] 41ef 0022                 lea.l      34(a7),a0
[00055f72] 4eb9 0008 0c58            jsr        Dsetpath
[00055f78] 226f 0358                 movea.l    856(a7),a1
[00055f7c] 41ef 0120                 lea.l      288(a7),a0
[00055f80] 4eb9 0004 b758            jsr        Af_2ext
[00055f86] 4eb9 0004 64da            jsr        Ast_toupper
[00055f8c] 41f9 000e 0f30            lea.l      $000E0F30,a0
[00055f92] 4eb9 0005 be00            jsr        Ash_getenv
[00055f98] 2f48 001c                 move.l     a0,28(a7)
[00055f9c] 6762                      beq.s      $00056000
[00055f9e] 707f                      moveq.l    #127,d0
[00055fa0] 226f 001c                 movea.l    28(a7),a1
[00055fa4] 41ef 00a0                 lea.l      160(a7),a0
[00055fa8] 4eb9 0008 2f96            jsr        strncat
[00055fae] 4eb9 0004 64da            jsr        Ast_toupper
[00055fb4] 422f 011f                 clr.b      287(a7)
[00055fb8] 43f9 000e 0f3a            lea.l      $000E0F3A,a1
[00055fbe] 41ef 00a0                 lea.l      160(a7),a0
[00055fc2] 4eb9 0008 303c            jsr        strtok
[00055fc8] 2f48 001c                 move.l     a0,28(a7)
[00055fcc] 602c                      bra.s      $00055FFA
[00055fce] 226f 001c                 movea.l    28(a7),a1
[00055fd2] 41ef 0120                 lea.l      288(a7),a0
[00055fd6] 4eb9 0008 2eba            jsr        strcmp
[00055fdc] 4a40                      tst.w      d0
[00055fde] 6608                      bne.s      $00055FE8
[00055fe0] 3f7c 0001 0146            move.w     #$0001,326(a7)
[00055fe6] 6018                      bra.s      $00056000
[00055fe8] 43f9 000e 0f3c            lea.l      $000E0F3C,a1
[00055fee] 91c8                      suba.l     a0,a0
[00055ff0] 4eb9 0008 303c            jsr        strtok
[00055ff6] 2f48 001c                 move.l     a0,28(a7)
[00055ffa] 202f 001c                 move.l     28(a7),d0
[00055ffe] 66ce                      bne.s      $00055FCE
[00056000] 302f 0146                 move.w     326(a7),d0
[00056004] 6642                      bne.s      $00056048
[00056006] 43f9 000e 0f3e            lea.l      $000E0F3E,a1
[0005600c] 41ef 0120                 lea.l      288(a7),a0
[00056010] 4eb9 0008 2eba            jsr        strcmp
[00056016] 4a40                      tst.w      d0
[00056018] 6728                      beq.s      $00056042
[0005601a] 43f9 000e 0f42            lea.l      $000E0F42,a1
[00056020] 41ef 0120                 lea.l      288(a7),a0
[00056024] 4eb9 0008 2eba            jsr        strcmp
[0005602a] 4a40                      tst.w      d0
[0005602c] 6714                      beq.s      $00056042
[0005602e] 43f9 000e 0f46            lea.l      $000E0F46,a1
[00056034] 41ef 0120                 lea.l      288(a7),a0
[00056038] 4eb9 0008 2eba            jsr        strcmp
[0005603e] 4a40                      tst.w      d0
[00056040] 6606                      bne.s      $00056048
[00056042] 3f7c 0001 0146            move.w     #$0001,326(a7)
[00056048] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005604e] 3028 0238                 move.w     568(a0),d0
[00056052] 6700 0080                 beq        $000560D4
[00056056] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005605c] 2028 04fe                 move.l     1278(a0),d0
[00056060] 663a                      bne.s      $0005609C
[00056062] 2f39 000e 692a            move.l     _globl,-(a7)
[00056068] 226f 0358                 movea.l    856(a7),a1
[0005606c] 206f 035c                 movea.l    860(a7),a0
[00056070] 7401                      moveq.l    #1,d2
[00056072] 2f09                      move.l     a1,-(a7)
[00056074] 2f08                      move.l     a0,-(a7)
[00056076] 3f02                      move.w     d2,-(a7)
[00056078] 302f 0154                 move.w     340(a7),d0
[0005607c] 6704                      beq.s      $00056082
[0005607e] 7201                      moveq.l    #1,d1
[00056080] 6002                      bra.s      $00056084
[00056082] 4241                      clr.w      d1
[00056084] 4240                      clr.w      d0
[00056086] 341f                      move.w     (a7)+,d2
[00056088] 205f                      movea.l    (a7)+,a0
[0005608a] 225f                      movea.l    (a7)+,a1
[0005608c] 4eb9 0007 bcf6            jsr        mt_shel_write
[00056092] 584f                      addq.w     #4,a7
[00056094] 48c0                      ext.l      d0
[00056096] 6000 077a                 bra        $00056812
[0005609a] 6038                      bra.s      $000560D4
[0005609c] 2f39 000e 692a            move.l     _globl,-(a7)
[000560a2] 226f 0358                 movea.l    856(a7),a1
[000560a6] 206f 035c                 movea.l    860(a7),a0
[000560aa] 7464                      moveq.l    #100,d2
[000560ac] 2f09                      move.l     a1,-(a7)
[000560ae] 2f08                      move.l     a0,-(a7)
[000560b0] 3f02                      move.w     d2,-(a7)
[000560b2] 302f 0154                 move.w     340(a7),d0
[000560b6] 6704                      beq.s      $000560BC
[000560b8] 7201                      moveq.l    #1,d1
[000560ba] 6002                      bra.s      $000560BE
[000560bc] 4241                      clr.w      d1
[000560be] 7001                      moveq.l    #1,d0
[000560c0] 341f                      move.w     (a7)+,d2
[000560c2] 205f                      movea.l    (a7)+,a0
[000560c4] 225f                      movea.l    (a7)+,a1
[000560c6] 4eb9 0007 bcf6            jsr        mt_shel_write
[000560cc] 584f                      addq.w     #4,a7
[000560ce] 48c0                      ext.l      d0
[000560d0] 6000 0740                 bra        $00056812
[000560d4] 4eb9 0005 1388            jsr        Awi_diaend
[000560da] 4eb9 0004 ee96            jsr        Amo_point
[000560e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000560e6] 3028 0236                 move.w     566(a0),d0
[000560ea] 6700 0514                 beq        $00056600
[000560ee] 41d7                      lea.l      (a7),a0
[000560f0] 4eb9 0006 bf9e            jsr        Act_save
[000560f6] 42a7                      clr.l      -(a7)
[000560f8] 42a7                      clr.l      -(a7)
[000560fa] 42a7                      clr.l      -(a7)
[000560fc] 486f 0154                 pea.l      340(a7)
[00056100] 720a                      moveq.l    #10,d1
[00056102] 4240                      clr.w      d0
[00056104] 4eb9 0007 f7ba            jsr        wind_get
[0005610a] 4fef 0010                 lea.l      16(a7),a7
[0005610e] 302f 0148                 move.w     328(a7),d0
[00056112] 6100 fd54                 bsr        Awi_wid
[00056116] 2f48 014c                 move.l     a0,332(a7)
[0005611a] 3f7c 0001 014a            move.w     #$0001,330(a7)
[00056120] 6076                      bra.s      $00056198
[00056122] 302f 014a                 move.w     330(a7),d0
[00056126] e548                      lsl.w      #2,d0
[00056128] 41f9 0011 3af2            lea.l      gemmap,a0
[0005612e] 2070 0000                 movea.l    0(a0,d0.w),a0
[00056132] 2f48 0150                 move.l     a0,336(a7)
[00056136] 302f 014a                 move.w     330(a7),d0
[0005613a] e548                      lsl.w      #2,d0
[0005613c] 43ef 0154                 lea.l      340(a7),a1
[00056140] 2388 0000                 move.l     a0,0(a1,d0.w)
[00056144] 302f 014a                 move.w     330(a7),d0
[00056148] e548                      lsl.w      #2,d0
[0005614a] 41f9 0011 3af2            lea.l      gemmap,a0
[00056150] 42b0 0000                 clr.l      0(a0,d0.w)
[00056154] 202f 0150                 move.l     336(a7),d0
[00056158] 673a                      beq.s      $00056194
[0005615a] 206f 0150                 movea.l    336(a7),a0
[0005615e] 3f68 0020 0148            move.w     32(a0),328(a7)
[00056164] 2079 000e 692a            movea.l    _globl,a0
[0005616a] 302f 0148                 move.w     328(a7),d0
[0005616e] 4eb9 0007 b48a            jsr        mt_wind_close
[00056174] 2079 000e 692a            movea.l    _globl,a0
[0005617a] 302f 0148                 move.w     328(a7),d0
[0005617e] 4eb9 0007 b4e4            jsr        mt_wind_delete
[00056184] 206f 0150                 movea.l    336(a7),a0
[00056188] 317c ffff 0020            move.w     #$FFFF,32(a0)
[0005618e] 4eb9 0004 b086            jsr        Aev_mess
[00056194] 526f 014a                 addq.w     #1,330(a7)
[00056198] 0c6f 0080 014a            cmpi.w     #$0080,330(a7)
[0005619e] 6d82                      blt.s      $00056122
[000561a0] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000561a6] 3028 0020                 move.w     32(a0),d0
[000561aa] 6600 00e4                 bne        $00056290
[000561ae] 2279 000e 692a            movea.l    _globl,a1
[000561b4] 4240                      clr.w      d0
[000561b6] 91c8                      suba.l     a0,a0
[000561b8] 4eb9 0007 9632            jsr        mt_menu_bar
[000561be] 4267                      clr.w      -(a7)
[000561c0] 42a7                      clr.l      -(a7)
[000561c2] 720e                      moveq.l    #14,d1
[000561c4] 4240                      clr.w      d0
[000561c6] 4eb9 0007 f926            jsr        wind_set
[000561cc] 5c4f                      addq.w     #6,a7
[000561ce] 302f 0146                 move.w     326(a7),d0
[000561d2] 6700 00bc                 beq        $00056290
[000561d6] 23ef 0358 000e 0d3a       move.l     856(a7),$000E0D3A
[000561de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000561e4] 33e8 000c 000e 0d42       move.w     12(a0),$000E0D42
[000561ec] 70ff                      moveq.l    #-1,d0
[000561ee] 2079 0010 ee4e            movea.l    ACSblk,a0
[000561f4] d068 000a                 add.w      10(a0),d0
[000561f8] 33c0 000e 0d44            move.w     d0,$000E0D44
[000561fe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056204] 3f28 000e                 move.w     14(a0),-(a7)
[00056208] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005620e] 3f28 000c                 move.w     12(a0),-(a7)
[00056212] 4267                      clr.w      -(a7)
[00056214] 2279 000e 692a            movea.l    _globl,a1
[0005621a] 4242                      clr.w      d2
[0005621c] 7201                      moveq.l    #1,d1
[0005621e] 4240                      clr.w      d0
[00056220] 41f9 000e 0d2e            lea.l      topline,a0
[00056226] 4eb9 0007 9c0c            jsr        mt_objc_draw
[0005622c] 5c4f                      addq.w     #6,a7
[0005622e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056234] 3f28 000e                 move.w     14(a0),-(a7)
[00056238] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005623e] 3f28 000c                 move.w     12(a0),-(a7)
[00056242] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056248] 3f28 000a                 move.w     10(a0),-(a7)
[0005624c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056252] 3f28 0008                 move.w     8(a0),-(a7)
[00056256] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005625c] 3f28 000e                 move.w     14(a0),-(a7)
[00056260] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056266] 3f28 000c                 move.w     12(a0),-(a7)
[0005626a] 2079 000e 692a            movea.l    _globl,a0
[00056270] 2279 0010 ee4e            movea.l    ACSblk,a1
[00056276] 3429 000a                 move.w     10(a1),d2
[0005627a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00056280] 3229 0008                 move.w     8(a1),d1
[00056284] 7003                      moveq.l    #3,d0
[00056286] 4eb9 0007 a0b4            jsr        mt_form_dial
[0005628c] 4fef 000c                 lea.l      12(a7),a7
[00056290] 4eb9 0004 b086            jsr        Aev_mess
[00056296] 302f 0146                 move.w     326(a7),d0
[0005629a] 671c                      beq.s      $000562B8
[0005629c] 2f39 000e 692a            move.l     _globl,-(a7)
[000562a2] 226f 0358                 movea.l    856(a7),a1
[000562a6] 206f 035c                 movea.l    860(a7),a0
[000562aa] 4242                      clr.w      d2
[000562ac] 7201                      moveq.l    #1,d1
[000562ae] 4240                      clr.w      d0
[000562b0] 4eb9 0007 bcf6            jsr        mt_shel_write
[000562b6] 584f                      addq.w     #4,a7
[000562b8] 7010                      moveq.l    #16,d0
[000562ba] 4eb9 0005 ae7e            jsr        Awi_update
[000562c0] 2079 000e 692a            movea.l    _globl,a0
[000562c6] 4eb9 0007 8d52            jsr        mt_appl_exit
[000562cc] 302f 0146                 move.w     326(a7),d0
[000562d0] 671e                      beq.s      $000562F0
[000562d2] 2f2f 037c                 move.l     892(a7),-(a7)
[000562d6] 226f 0358                 movea.l    856(a7),a1
[000562da] 206f 035c                 movea.l    860(a7),a0
[000562de] 4240                      clr.w      d0
[000562e0] 4eb9 0008 0de6            jsr        Pexec
[000562e6] 584f                      addq.w     #4,a7
[000562e8] 2f40 012a                 move.l     d0,298(a7)
[000562ec] 6000 01ca                 bra        $000564B8
[000562f0] 2279 000e 692a            movea.l    _globl,a1
[000562f6] 91c8                      suba.l     a0,a0
[000562f8] 303c 0100                 move.w     #$0100,d0
[000562fc] 4eb9 0007 abe4            jsr        mt_graf_mouse
[00056302] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056308] 3228 000a                 move.w     10(a0),d1
[0005630c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056312] 3028 000c                 move.w     12(a0),d0
[00056316] 4eb9 0005 4b6e            jsr        Abp_create
[0005631c] 2f48 0018                 move.l     a0,24(a7)
[00056320] 202f 0018                 move.l     24(a7),d0
[00056324] 6760                      beq.s      $00056386
[00056326] 4240                      clr.w      d0
[00056328] 3f40 0140                 move.w     d0,320(a7)
[0005632c] 3f40 013e                 move.w     d0,318(a7)
[00056330] 3f40 0138                 move.w     d0,312(a7)
[00056334] 3f40 0136                 move.w     d0,310(a7)
[00056338] 70ff                      moveq.l    #-1,d0
[0005633a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056340] d068 000c                 add.w      12(a0),d0
[00056344] 3f40 0142                 move.w     d0,322(a7)
[00056348] 3f40 013a                 move.w     d0,314(a7)
[0005634c] 70ff                      moveq.l    #-1,d0
[0005634e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056354] d068 000a                 add.w      10(a0),d0
[00056358] 3f40 0144                 move.w     d0,324(a7)
[0005635c] 3f40 013c                 move.w     d0,316(a7)
[00056360] 2f2f 0018                 move.l     24(a7),-(a7)
[00056364] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005636a] 43e9 026a                 lea.l      618(a1),a1
[0005636e] 41ef 013a                 lea.l      314(a7),a0
[00056372] 7203                      moveq.l    #3,d1
[00056374] 2479 0010 ee4e            movea.l    ACSblk,a2
[0005637a] 302a 0010                 move.w     16(a2),d0
[0005637e] 4eb9 0007 489e            jsr        vro_cpyfm
[00056384] 584f                      addq.w     #4,a7
[00056386] 4240                      clr.w      d0
[00056388] 3f40 0130                 move.w     d0,304(a7)
[0005638c] 3f40 012e                 move.w     d0,302(a7)
[00056390] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056396] 3028 0008                 move.w     8(a0),d0
[0005639a] 2079 0010 ee4e            movea.l    ACSblk,a0
[000563a0] d068 000c                 add.w      12(a0),d0
[000563a4] 5340                      subq.w     #1,d0
[000563a6] 3f40 0132                 move.w     d0,306(a7)
[000563aa] 2079 0010 ee4e            movea.l    ACSblk,a0
[000563b0] 3028 000a                 move.w     10(a0),d0
[000563b4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000563ba] d068 000e                 add.w      14(a0),d0
[000563be] 5340                      subq.w     #1,d0
[000563c0] 3f40 0134                 move.w     d0,308(a7)
[000563c4] 7201                      moveq.l    #1,d1
[000563c6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000563cc] 3028 0010                 move.w     16(a0),d0
[000563d0] 4eb9 0007 3070            jsr        vswr_mode
[000563d6] 4241                      clr.w      d1
[000563d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000563de] 3028 0010                 move.w     16(a0),d0
[000563e2] 4eb9 0007 3660            jsr        vsf_interior
[000563e8] 4241                      clr.w      d1
[000563ea] 2079 0010 ee4e            movea.l    ACSblk,a0
[000563f0] 3028 0010                 move.w     16(a0),d0
[000563f4] 4eb9 0007 375c            jsr        vsf_perimeter
[000563fa] 41ef 012e                 lea.l      302(a7),a0
[000563fe] 2279 0010 ee4e            movea.l    ACSblk,a1
[00056404] 3029 0010                 move.w     16(a1),d0
[00056408] 4eb9 0007 282e            jsr        v_bar
[0005640e] 41f9 000e 0f4a            lea.l      $000E0F4A,a0
[00056414] 4eb9 0008 0ba2            jsr        Cconws
[0005641a] 2f2f 037c                 move.l     892(a7),-(a7)
[0005641e] 226f 0358                 movea.l    856(a7),a1
[00056422] 206f 035c                 movea.l    860(a7),a0
[00056426] 4240                      clr.w      d0
[00056428] 4eb9 0008 0de6            jsr        Pexec
[0005642e] 584f                      addq.w     #4,a7
[00056430] 2f40 012a                 move.l     d0,298(a7)
[00056434] 41f9 000e 0f4f            lea.l      $000E0F4F,a0
[0005643a] 4eb9 0008 0ba2            jsr        Cconws
[00056440] 7002                      moveq.l    #2,d0
[00056442] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056448] 2068 023c                 movea.l    572(a0),a0
[0005644c] c068 000e                 and.w      14(a0),d0
[00056450] 671e                      beq.s      $00056470
[00056452] 41f9 000e 0f52            lea.l      $000E0F52,a0
[00056458] 4eb9 0008 0ba2            jsr        Cconws
[0005645e] 4e71                      nop
[00056460] 4eb9 0008 0b94            jsr        Cconis
[00056466] 4a40                      tst.w      d0
[00056468] 67f6                      beq.s      $00056460
[0005646a] 4eb9 0008 0b86            jsr        Cconin
[00056470] 202f 0018                 move.l     24(a7),d0
[00056474] 6730                      beq.s      $000564A6
[00056476] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005647c] 4868 026a                 pea.l      618(a0)
[00056480] 226f 001c                 movea.l    28(a7),a1
[00056484] 41ef 013a                 lea.l      314(a7),a0
[00056488] 7203                      moveq.l    #3,d1
[0005648a] 2479 0010 ee4e            movea.l    ACSblk,a2
[00056490] 302a 0010                 move.w     16(a2),d0
[00056494] 4eb9 0007 489e            jsr        vro_cpyfm
[0005649a] 584f                      addq.w     #4,a7
[0005649c] 206f 0018                 movea.l    24(a7),a0
[000564a0] 4eb9 0005 4c04            jsr        Abp_delete
[000564a6] 2279 000e 692a            movea.l    _globl,a1
[000564ac] 91c8                      suba.l     a0,a0
[000564ae] 303c 0101                 move.w     #$0101,d0
[000564b2] 4eb9 0007 abe4            jsr        mt_graf_mouse
[000564b8] 2079 000e 692a            movea.l    _globl,a0
[000564be] 4eb9 0007 b996            jsr        mt_wind_new
[000564c4] 2079 000e 692a            movea.l    _globl,a0
[000564ca] 4eb9 0007 8d52            jsr        mt_appl_exit
[000564d0] 2079 000e 692a            movea.l    _globl,a0
[000564d6] 4eb9 0007 8a1c            jsr        mt_appl_init
[000564dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000564e2] 3080                      move.w     d0,(a0)
[000564e4] 7020                      moveq.l    #32,d0
[000564e6] 4eb9 0005 ae7e            jsr        Awi_update
[000564ec] 4267                      clr.w      -(a7)
[000564ee] 42a7                      clr.l      -(a7)
[000564f0] 720e                      moveq.l    #14,d1
[000564f2] 4240                      clr.w      d0
[000564f4] 4eb9 0007 f926            jsr        wind_set
[000564fa] 5c4f                      addq.w     #6,a7
[000564fc] 2f79 000e 0d26 0150       move.l     Aroot_wi,336(a7)
[00056504] 206f 0150                 movea.l    336(a7),a0
[00056508] 3028 0020                 move.w     32(a0),d0
[0005650c] 6600 009a                 bne        $000565A8
[00056510] 206f 0150                 movea.l    336(a7),a0
[00056514] 2028 0014                 move.l     20(a0),d0
[00056518] 6716                      beq.s      $00056530
[0005651a] 4267                      clr.w      -(a7)
[0005651c] 206f 0152                 movea.l    338(a7),a0
[00056520] 2f28 0014                 move.l     20(a0),-(a7)
[00056524] 720e                      moveq.l    #14,d1
[00056526] 4240                      clr.w      d0
[00056528] 4eb9 0007 f926            jsr        wind_set
[0005652e] 5c4f                      addq.w     #6,a7
[00056530] 2279 000e 692a            movea.l    _globl,a1
[00056536] 7001                      moveq.l    #1,d0
[00056538] 206f 0150                 movea.l    336(a7),a0
[0005653c] 2068 005e                 movea.l    94(a0),a0
[00056540] 4eb9 0007 9632            jsr        mt_menu_bar
[00056546] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005654c] 3f28 000e                 move.w     14(a0),-(a7)
[00056550] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056556] 3f28 000c                 move.w     12(a0),-(a7)
[0005655a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056560] 3f28 000a                 move.w     10(a0),-(a7)
[00056564] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005656a] 3f28 0008                 move.w     8(a0),-(a7)
[0005656e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056574] 3f28 000e                 move.w     14(a0),-(a7)
[00056578] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005657e] 3f28 000c                 move.w     12(a0),-(a7)
[00056582] 2079 000e 692a            movea.l    _globl,a0
[00056588] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005658e] 3429 000a                 move.w     10(a1),d2
[00056592] 2279 0010 ee4e            movea.l    ACSblk,a1
[00056598] 3229 0008                 move.w     8(a1),d1
[0005659c] 7003                      moveq.l    #3,d0
[0005659e] 4eb9 0007 a0b4            jsr        mt_form_dial
[000565a4] 4fef 000c                 lea.l      12(a7),a7
[000565a8] 3f7c 0001 014a            move.w     #$0001,330(a7)
[000565ae] 6028                      bra.s      $000565D8
[000565b0] 302f 014a                 move.w     330(a7),d0
[000565b4] e548                      lsl.w      #2,d0
[000565b6] 41ef 0154                 lea.l      340(a7),a0
[000565ba] 2f70 0000 0150            move.l     0(a0,d0.w),336(a7)
[000565c0] 202f 0150                 move.l     336(a7),d0
[000565c4] 670e                      beq.s      $000565D4
[000565c6] 206f 0150                 movea.l    336(a7),a0
[000565ca] 226f 0150                 movea.l    336(a7),a1
[000565ce] 2269 000c                 movea.l    12(a1),a1
[000565d2] 4e91                      jsr        (a1)
[000565d4] 526f 014a                 addq.w     #1,330(a7)
[000565d8] 0c6f 0080 014a            cmpi.w     #$0080,330(a7)
[000565de] 6dd0                      blt.s      $000565B0
[000565e0] 202f 014c                 move.l     332(a7),d0
[000565e4] 670e                      beq.s      $000565F4
[000565e6] 206f 014c                 movea.l    332(a7),a0
[000565ea] 226f 014c                 movea.l    332(a7),a1
[000565ee] 2269 006e                 movea.l    110(a1),a1
[000565f2] 4e91                      jsr        (a1)
[000565f4] 41d7                      lea.l      (a7),a0
[000565f6] 4eb9 0006 c00a            jsr        Act_restore
[000565fc] 6000 01fe                 bra        $000567FC
[00056600] 41f9 000e 0e46            lea.l      $000E0E46,a0
[00056606] 43ef 0364                 lea.l      868(a7),a1
[0005660a] 700f                      moveq.l    #15,d0
[0005660c] 12d8                      move.b     (a0)+,(a1)+
[0005660e] 51c8 fffc                 dbf        d0,$0005660C
[00056612] 3f7c 0014 0362            move.w     #$0014,866(a7)
[00056618] 42af 035c                 clr.l      860(a7)
[0005661c] 601a                      bra.s      $00056638
[0005661e] 7004                      moveq.l    #4,d0
[00056620] 206f 035c                 movea.l    860(a7),a0
[00056624] c0a8 0002                 and.l      2(a0),d0
[00056628] 670e                      beq.s      $00056638
[0005662a] 7020                      moveq.l    #32,d0
[0005662c] 206f 035c                 movea.l    860(a7),a0
[00056630] c068 000c                 and.w      12(a0),d0
[00056634] 6702                      beq.s      $00056638
[00056636] 6010                      bra.s      $00056648
[00056638] 206f 035c                 movea.l    860(a7),a0
[0005663c] 4eb9 0005 dd58            jsr        Ash_nextdd
[00056642] 2f48 035c                 move.l     a0,860(a7)
[00056646] 66d6                      bne.s      $0005661E
[00056648] 202f 035c                 move.l     860(a7),d0
[0005664c] 6606                      bne.s      $00056654
[0005664e] 70ff                      moveq.l    #-1,d0
[00056650] 6000 01c0                 bra        $00056812
[00056654] 206f 0358                 movea.l    856(a7),a0
[00056658] 4eb9 0008 2f6c            jsr        strlen
[0005665e] 5280                      addq.l     #1,d0
[00056660] 4eb9 0004 c95e            jsr        Ax_glmalloc
[00056666] 23c8 000e 0d06            move.l     a0,exec_path
[0005666c] 6606                      bne.s      $00056674
[0005666e] 70ff                      moveq.l    #-1,d0
[00056670] 6000 01a0                 bra        $00056812
[00056674] 226f 0358                 movea.l    856(a7),a1
[00056678] 2079 000e 0d06            movea.l    exec_path,a0
[0005667e] 4eb9 0008 2f0c            jsr        strcpy
[00056684] 202f 0354                 move.l     852(a7),d0
[00056688] 673c                      beq.s      $000566C6
[0005668a] 206f 0354                 movea.l    852(a7),a0
[0005668e] 4eb9 0008 2f6c            jsr        strlen
[00056694] 4eb9 0004 c95e            jsr        Ax_glmalloc
[0005669a] 23c8 000e 0d0a            move.l     a0,exec_com
[000566a0] 6612                      bne.s      $000566B4
[000566a2] 2079 000e 0d06            movea.l    exec_path,a0
[000566a8] 4eb9 0004 c9da            jsr        Ax_glfree
[000566ae] 70ff                      moveq.l    #-1,d0
[000566b0] 6000 0160                 bra        $00056812
[000566b4] 226f 0354                 movea.l    852(a7),a1
[000566b8] 5249                      addq.w     #1,a1
[000566ba] 2079 000e 0d0a            movea.l    exec_com,a0
[000566c0] 4eb9 0008 2f0c            jsr        strcpy
[000566c6] 7010                      moveq.l    #16,d0
[000566c8] 4eb9 0005 ae7e            jsr        Awi_update
[000566ce] 4eb9 0004 b086            jsr        Aev_mess
[000566d4] 3f7c 4722 0364            move.w     #$4722,868(a7)
[000566da] 2079 0010 ee4e            movea.l    ACSblk,a0
[000566e0] 3f50 0366                 move.w     (a0),870(a7)
[000566e4] 2039 000e 0d06            move.l     exec_path,d0
[000566ea] 7210                      moveq.l    #16,d1
[000566ec] e2a0                      asr.l      d1,d0
[000566ee] 3f40 036a                 move.w     d0,874(a7)
[000566f2] 70ff                      moveq.l    #-1,d0
[000566f4] c079 000e 0d08            and.w      $000E0D08,d0
[000566fa] 3f40 036c                 move.w     d0,876(a7)
[000566fe] 2039 000e 0d0a            move.l     exec_com,d0
[00056704] 7210                      moveq.l    #16,d1
[00056706] e2a0                      asr.l      d1,d0
[00056708] 3f40 036e                 move.w     d0,878(a7)
[0005670c] 70ff                      moveq.l    #-1,d0
[0005670e] c079 000e 0d0c            and.w      $000E0D0C,d0
[00056714] 3f40 0370                 move.w     d0,880(a7)
[00056718] 2279 000e 692a            movea.l    _globl,a1
[0005671e] 41ef 0364                 lea.l      868(a7),a0
[00056722] 7210                      moveq.l    #16,d1
[00056724] 246f 035c                 movea.l    860(a7),a2
[00056728] 3012                      move.w     (a2),d0
[0005672a] 4eb9 0007 8ae8            jsr        mt_appl_write
[00056730] 4a40                      tst.w      d0
[00056732] 6700 00b8                 beq        $000567EC
[00056736] 6000 00aa                 bra        $000567E2
[0005673a] 2f39 000e 692a            move.l     _globl,-(a7)
[00056740] 486f 0364                 pea.l      868(a7)
[00056744] 486f 0368                 pea.l      872(a7)
[00056748] 486f 036c                 pea.l      876(a7)
[0005674c] 486f 0370                 pea.l      880(a7)
[00056750] 486f 0374                 pea.l      884(a7)
[00056754] 4878 01f4                 pea.l      ($000001F4).w
[00056758] 4267                      clr.w      -(a7)
[0005675a] 4267                      clr.w      -(a7)
[0005675c] 4267                      clr.w      -(a7)
[0005675e] 4267                      clr.w      -(a7)
[00056760] 4267                      clr.w      -(a7)
[00056762] 4267                      clr.w      -(a7)
[00056764] 4267                      clr.w      -(a7)
[00056766] 4267                      clr.w      -(a7)
[00056768] 4267                      clr.w      -(a7)
[0005676a] 4267                      clr.w      -(a7)
[0005676c] 4267                      clr.w      -(a7)
[0005676e] 43ef 0392                 lea.l      914(a7),a1
[00056772] 41ef 0396                 lea.l      918(a7),a0
[00056776] 4242                      clr.w      d2
[00056778] 4241                      clr.w      d1
[0005677a] 7030                      moveq.l    #48,d0 MU_TIMER | MU_MESAG
[0005677c] 4eb9 0007 9240            jsr        mt_evnt_multi
[00056782] 4fef 0032                 lea.l      50(a7),a7
[00056786] c07c 0010                 and.w      #$0010,d0
[0005678a] 6752                      beq.s      $000567DE
[0005678c] 0c6f 0029 0364            cmpi.w     #$0029,868(a7)
[00056792] 6614                      bne.s      $000567A8
[00056794] 91c8                      suba.l     a0,a0
[00056796] 4eb9 0005 ead4            jsr        Aev_GetAcClose
[0005679c] 4eb9 0004 a2f8            jsr        Aev_unhidepointer
[000567a2] 42af 012a                 clr.l      298(a7)
[000567a6] 6042                      bra.s      $000567EA
[000567a8] 0c6f 4723 0364            cmpi.w     #$4723,868(a7)
[000567ae] 6614                      bne.s      $000567C4
[000567b0] 302f 036a                 move.w     874(a7),d0
[000567b4] 6604                      bne.s      $000567BA
[000567b6] 70ff                      moveq.l    #-1,d0
[000567b8] 6002                      bra.s      $000567BC
[000567ba] 7000                      moveq.l    #0,d0
[000567bc] 2f40 012a                 move.l     d0,298(a7)
[000567c0] 6028                      bra.s      $000567EA
[000567c2] 601a                      bra.s      $000567DE
[000567c4] 7020                      moveq.l    #32,d0
[000567c6] 4eb9 0005 ae7e            jsr        Awi_update
[000567cc] 41ef 0364                 lea.l      868(a7),a0
[000567d0] 4eb9 0005 d5e6            jsr        Aev_message
[000567d6] 7010                      moveq.l    #16,d0
[000567d8] 4eb9 0005 ae7e            jsr        Awi_update
[000567de] 536f 0362                 subq.w     #1,866(a7)
[000567e2] 302f 0362                 move.w     866(a7),d0
[000567e6] 6600 ff52                 bne        $0005673A
[000567ea] 6008                      bra.s      $000567F4
[000567ec] 2f7c ffff ffff 012a       move.l     #$FFFFFFFF,298(a7)
[000567f4] 7020                      moveq.l    #32,d0
[000567f6] 4eb9 0005 ae7e            jsr        Awi_update
[000567fc] 4eb9 0004 b086            jsr        Aev_mess
[00056802] 4eb9 0005 0c80            jsr        Aev_release
[00056808] 4eb9 0005 147c            jsr        Awi_diastart
[0005680e] 202f 012a                 move.l     298(a7),d0
[00056812] 4fef 0374                 lea.l      884(a7),a7
[00056816] 245f                      movea.l    (a7)+,a2
[00056818] 4e75                      rts
Awi_catch:
[0005681a] 2f0a                      move.l     a2,-(a7)
[0005681c] 4fef ffec                 lea.l      -20(a7),a7
[00056820] 2f48 0010                 move.l     a0,16(a7)
[00056824] 41f9 000e 0e56            lea.l      $000E0E56,a0
[0005682a] 43d7                      lea.l      (a7),a1
[0005682c] 12d8                      move.b     (a0)+,(a1)+
[0005682e] 12d8                      move.b     (a0)+,(a1)+
[00056830] 12d8                      move.b     (a0)+,(a1)+
[00056832] 12d8                      move.b     (a0)+,(a1)+
[00056834] 12d8                      move.b     (a0)+,(a1)+
[00056836] 12d8                      move.b     (a0)+,(a1)+
[00056838] 12d8                      move.b     (a0)+,(a1)+
[0005683a] 12d8                      move.b     (a0)+,(a1)+
[0005683c] 206f 0010                 movea.l    16(a7),a0
[00056840] 3028 0022                 move.w     34(a0),d0
[00056844] c07c 2000                 and.w      #$2000,d0
[00056848] 6738                      beq.s      $00056882
[0005684a] 2f39 000e 692a            move.l     _globl,-(a7)
[00056850] 486f 000a                 pea.l      10(a7)
[00056854] 486f 000c                 pea.l      12(a7)
[00056858] 43ef 000e                 lea.l      14(a7),a1
[0005685c] 41ef 000c                 lea.l      12(a7),a0
[00056860] 700b                      moveq.l    #11,d0
[00056862] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[00056868] 4fef 000c                 lea.l      12(a7),a7
[0005686c] 4a40                      tst.w      d0
[0005686e] 6708                      beq.s      $00056878
[00056870] 7006                      moveq.l    #6,d0
[00056872] c06f 0004                 and.w      4(a7),d0
[00056876] 660a                      bne.s      $00056882
[00056878] 206f 0010                 movea.l    16(a7),a0
[0005687c] 0268 dfff 0054            andi.w     #$DFFF,84(a0)
[00056882] 206f 0010                 movea.l    16(a7),a0
[00056886] 3028 0022                 move.w     34(a0),d0
[0005688a] c07c 1000                 and.w      #$1000,d0
[0005688e] 6738                      beq.s      $000568C8
[00056890] 2f39 000e 692a            move.l     _globl,-(a7)
[00056896] 486f 000a                 pea.l      10(a7)
[0005689a] 486f 000c                 pea.l      12(a7)
[0005689e] 43ef 000e                 lea.l      14(a7),a1
[000568a2] 41ef 000c                 lea.l      12(a7),a0
[000568a6] 700b                      moveq.l    #11,d0
[000568a8] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[000568ae] 4fef 000c                 lea.l      12(a7),a7
[000568b2] 4a40                      tst.w      d0
[000568b4] 6708                      beq.s      $000568BE
[000568b6] 7008                      moveq.l    #8,d0
[000568b8] c06f 0004                 and.w      4(a7),d0
[000568bc] 660a                      bne.s      $000568C8
[000568be] 206f 0010                 movea.l    16(a7),a0
[000568c2] 0268 efff 0054            andi.w     #$EFFF,84(a0)
[000568c8] 4267                      clr.w      -(a7)
[000568ca] 4267                      clr.w      -(a7)
[000568cc] 2079 000e 692a            movea.l    _globl,a0
[000568d2] 4242                      clr.w      d2
[000568d4] 4241                      clr.w      d1
[000568d6] 226f 0014                 movea.l    20(a7),a1
[000568da] 3029 0022                 move.w     34(a1),d0
[000568de] 4eb9 0007 b396            jsr        mt_wind_create
[000568e4] 584f                      addq.w     #4,a7
[000568e6] 3f40 000e                 move.w     d0,14(a7)
[000568ea] 0c6f 0080 000e            cmpi.w     #$0080,14(a7)
[000568f0] 6d06                      blt.s      $000568F8
[000568f2] 70ff                      moveq.l    #-1,d0
[000568f4] 6000 00d8                 bra        $000569CE
[000568f8] 302f 000e                 move.w     14(a7),d0
[000568fc] 6a00 00a6                 bpl        $000569A4
[00056900] 3f79 000e 0cfa 000c       move.w     cycle,12(a7)
[00056908] 7001                      moveq.l    #1,d0
[0005690a] d079 000e 0cfa            add.w      cycle,d0
[00056910] c07c 007f                 and.w      #$007F,d0
[00056914] 33c0 000e 0cfa            move.w     d0,cycle
[0005691a] 3039 000e 0cfa            move.w     cycle,d0
[00056920] e548                      lsl.w      #2,d0
[00056922] 41f9 0011 3af2            lea.l      gemmap,a0
[00056928] 2f70 0000 0008            move.l     0(a0,d0.w),8(a7)
[0005692e] 3039 000e 0cfa            move.w     cycle,d0
[00056934] 6760                      beq.s      $00056996
[00056936] 202f 0008                 move.l     8(a7),d0
[0005693a] 675a                      beq.s      $00056996
[0005693c] 7004                      moveq.l    #4,d0
[0005693e] 206f 0008                 movea.l    8(a7),a0
[00056942] c068 0054                 and.w      84(a0),d0
[00056946] 664e                      bne.s      $00056996
[00056948] 206f 0008                 movea.l    8(a7),a0
[0005694c] 3028 0056                 move.w     86(a0),d0
[00056950] c07c 0400                 and.w      #$0400,d0
[00056954] 6640                      bne.s      $00056996
[00056956] 206f 0008                 movea.l    8(a7),a0
[0005695a] 4eb9 0005 8362            jsr        Awi_closed
[00056960] 93c9                      suba.l     a1,a1
[00056962] 7003                      moveq.l    #3,d0
[00056964] 206f 0008                 movea.l    8(a7),a0
[00056968] 246f 0008                 movea.l    8(a7),a2
[0005696c] 246a 0004                 movea.l    4(a2),a2
[00056970] 4e92                      jsr        (a2)
[00056972] 4267                      clr.w      -(a7)
[00056974] 4267                      clr.w      -(a7)
[00056976] 2079 000e 692a            movea.l    _globl,a0
[0005697c] 4242                      clr.w      d2
[0005697e] 4241                      clr.w      d1
[00056980] 226f 0014                 movea.l    20(a7),a1
[00056984] 3029 0022                 move.w     34(a1),d0
[00056988] 4eb9 0007 b396            jsr        mt_wind_create
[0005698e] 584f                      addq.w     #4,a7
[00056990] 3f40 000e                 move.w     d0,14(a7)
[00056994] 600e                      bra.s      $000569A4
[00056996] 302f 000c                 move.w     12(a7),d0
[0005699a] b079 000e 0cfa            cmp.w      cycle,d0
[000569a0] 6600 ff66                 bne        $00056908
[000569a4] 302f 000e                 move.w     14(a7),d0
[000569a8] 6b0e                      bmi.s      $000569B8
[000569aa] 0c6f 0080 000e            cmpi.w     #$0080,14(a7)
[000569b0] 6e06                      bgt.s      $000569B8
[000569b2] 302f 000e                 move.w     14(a7),d0
[000569b6] 6016                      bra.s      $000569CE
[000569b8] 2279 000e 692a            movea.l    _globl,a1
[000569be] 41f9 000d 66a1            lea.l      _A_ERR_WINDOW,a0
[000569c4] 7001                      moveq.l    #1,d0
[000569c6] 4eb9 0007 a146            jsr        mt_form_alert
[000569cc] 70ff                      moveq.l    #-1,d0
[000569ce] 4fef 0014                 lea.l      20(a7),a7
[000569d2] 245f                      movea.l    (a7)+,a2
[000569d4] 4e75                      rts
Awi_list:
[000569d6] 5d4f                      subq.w     #6,a7
[000569d8] 426f 0004                 clr.w      4(a7)
[000569dc] 3039 000e 0e5e            move.w     next,d0
[000569e2] b079 0011 452a            cmp.w      _Wmax_wi,d0
[000569e8] 6f14                      ble.s      $000569FE
[000569ea] 4279 000e 0e5e            clr.w      next
[000569f0] 302f 0004                 move.w     4(a7),d0
[000569f4] 6704                      beq.s      $000569FA
[000569f6] 91c8                      suba.l     a0,a0
[000569f8] 6022                      bra.s      $00056A1C
[000569fa] 526f 0004                 addq.w     #1,4(a7)
[000569fe] 3039 000e 0e5e            move.w     next,d0
[00056a04] e548                      lsl.w      #2,d0
[00056a06] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[00056a0c] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00056a10] 5279 000e 0e5e            addq.w     #1,next
[00056a16] 2017                      move.l     (a7),d0
[00056a18] 67c2                      beq.s      $000569DC
[00056a1a] 2057                      movea.l    (a7),a0
[00056a1c] 5c4f                      addq.w     #6,a7
[00056a1e] 4e75                      rts
Awi_sendall:
[00056a20] 2f0a                      move.l     a2,-(a7)
[00056a22] 4fef fff4                 lea.l      -12(a7),a7
[00056a26] 3f40 000a                 move.w     d0,10(a7)
[00056a2a] 2f48 0006                 move.l     a0,6(a7)
[00056a2e] 3f79 0011 452a 0004       move.w     _Wmax_wi,4(a7)
[00056a36] 6028                      bra.s      $00056A60
[00056a38] 302f 0004                 move.w     4(a7),d0
[00056a3c] e548                      lsl.w      #2,d0
[00056a3e] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[00056a44] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00056a48] 6712                      beq.s      $00056A5C
[00056a4a] 226f 0006                 movea.l    6(a7),a1
[00056a4e] 302f 000a                 move.w     10(a7),d0
[00056a52] 2057                      movea.l    (a7),a0
[00056a54] 2457                      movea.l    (a7),a2
[00056a56] 246a 0004                 movea.l    4(a2),a2
[00056a5a] 4e92                      jsr        (a2)
[00056a5c] 536f 0004                 subq.w     #1,4(a7)
[00056a60] 302f 0004                 move.w     4(a7),d0
[00056a64] 6ad2                      bpl.s      $00056A38
[00056a66] 4fef 000c                 lea.l      12(a7),a7
[00056a6a] 245f                      movea.l    (a7)+,a2
[00056a6c] 4e75                      rts
Awi_lateupdate:
[00056a6e] 2f0a                      move.l     a2,-(a7)
[00056a70] 5d4f                      subq.w     #6,a7
[00056a72] 3f79 0011 452a 0004       move.w     _Wmax_wi,4(a7)
[00056a7a] 606e                      bra.s      $00056AEA
[00056a7c] 302f 0004                 move.w     4(a7),d0
[00056a80] e548                      lsl.w      #2,d0
[00056a82] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[00056a88] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00056a8c] 2017                      move.l     (a7),d0
[00056a8e] 6756                      beq.s      $00056AE6
[00056a90] 7020                      moveq.l    #32,d0
[00056a92] 2057                      movea.l    (a7),a0
[00056a94] c068 0056                 and.w      86(a0),d0
[00056a98] 674c                      beq.s      $00056AE6
[00056a9a] 2057                      movea.l    (a7),a0
[00056a9c] 0268 ffdf 0056            andi.w     #$FFDF,86(a0)
[00056aa2] 2057                      movea.l    (a7),a0
[00056aa4] 3028 0020                 move.w     32(a0),d0
[00056aa8] 6b2e                      bmi.s      $00056AD8
[00056aaa] 2057                      movea.l    (a7),a0
[00056aac] 0268 fffb 0056            andi.w     #$FFFB,86(a0)
[00056ab2] 2057                      movea.l    (a7),a0
[00056ab4] 2257                      movea.l    (a7),a1
[00056ab6] 2269 0010                 movea.l    16(a1),a1
[00056aba] 4e91                      jsr        (a1)
[00056abc] 7010                      moveq.l    #16,d0
[00056abe] 2057                      movea.l    (a7),a0
[00056ac0] c068 0056                 and.w      86(a0),d0
[00056ac4] 6710                      beq.s      $00056AD6
[00056ac6] 2257                      movea.l    (a7),a1
[00056ac8] 43e9 0024                 lea.l      36(a1),a1
[00056acc] 2057                      movea.l    (a7),a0
[00056ace] 2457                      movea.l    (a7),a2
[00056ad0] 246a 0086                 movea.l    134(a2),a2
[00056ad4] 4e92                      jsr        (a2)
[00056ad6] 6008                      bra.s      $00056AE0
[00056ad8] 2057                      movea.l    (a7),a0
[00056ada] 0068 0004 0056            ori.w      #$0004,86(a0)
[00056ae0] 4eb9 0004 c8f6            jsr        Ax_release
[00056ae6] 536f 0004                 subq.w     #1,4(a7)
[00056aea] 302f 0004                 move.w     4(a7),d0
[00056aee] 6a8c                      bpl.s      $00056A7C
[00056af0] 5c4f                      addq.w     #6,a7
[00056af2] 245f                      movea.l    (a7)+,a2
[00056af4] 4e75                      rts
Awi_up:
[00056af6] 514f                      subq.w     #8,a7
[00056af8] 3f79 000e 0cfa 0006       move.w     cycle,6(a7)
[00056b00] 7001                      moveq.l    #1,d0
[00056b02] d079 000e 0cfa            add.w      cycle,d0
[00056b08] c07c 007f                 and.w      #$007F,d0
[00056b0c] 33c0 000e 0cfa            move.w     d0,cycle
[00056b12] 3039 000e 0cfa            move.w     cycle,d0
[00056b18] e548                      lsl.w      #2,d0
[00056b1a] 41f9 0011 3af2            lea.l      gemmap,a0
[00056b20] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00056b24] 3039 000e 0cfa            move.w     cycle,d0
[00056b2a] 6734                      beq.s      $00056B60
[00056b2c] 2017                      move.l     (a7),d0
[00056b2e] 6730                      beq.s      $00056B60
[00056b30] 42a7                      clr.l      -(a7)
[00056b32] 42a7                      clr.l      -(a7)
[00056b34] 42a7                      clr.l      -(a7)
[00056b36] 486f 0010                 pea.l      16(a7)
[00056b3a] 720a                      moveq.l    #10,d1
[00056b3c] 4240                      clr.w      d0
[00056b3e] 4eb9 0007 f7ba            jsr        wind_get
[00056b44] 4fef 0010                 lea.l      16(a7),a7
[00056b48] 2057                      movea.l    (a7),a0
[00056b4a] 3028 0020                 move.w     32(a0),d0
[00056b4e] b06f 0004                 cmp.w      4(a7),d0
[00056b52] 670c                      beq.s      $00056B60
[00056b54] 2057                      movea.l    (a7),a0
[00056b56] 2257                      movea.l    (a7),a1
[00056b58] 2269 006e                 movea.l    110(a1),a1
[00056b5c] 4e91                      jsr        (a1)
[00056b5e] 600c                      bra.s      $00056B6C
[00056b60] 302f 0006                 move.w     6(a7),d0
[00056b64] b079 000e 0cfa            cmp.w      cycle,d0
[00056b6a] 6694                      bne.s      $00056B00
[00056b6c] 504f                      addq.w     #8,a7
[00056b6e] 4e75                      rts
Awi_down:
[00056b70] 514f                      subq.w     #8,a7
[00056b72] 3f79 000e 0cfa 0006       move.w     cycle,6(a7)
[00056b7a] 70ff                      moveq.l    #-1,d0
[00056b7c] d079 000e 0cfa            add.w      cycle,d0
[00056b82] c07c 007f                 and.w      #$007F,d0
[00056b86] 33c0 000e 0cfa            move.w     d0,cycle
[00056b8c] 3039 000e 0cfa            move.w     cycle,d0
[00056b92] e548                      lsl.w      #2,d0
[00056b94] 41f9 0011 3af2            lea.l      gemmap,a0
[00056b9a] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00056b9e] 3039 000e 0cfa            move.w     cycle,d0
[00056ba4] 6734                      beq.s      $00056BDA
[00056ba6] 2017                      move.l     (a7),d0
[00056ba8] 6730                      beq.s      $00056BDA
[00056baa] 42a7                      clr.l      -(a7)
[00056bac] 42a7                      clr.l      -(a7)
[00056bae] 42a7                      clr.l      -(a7)
[00056bb0] 486f 0010                 pea.l      16(a7)
[00056bb4] 720a                      moveq.l    #10,d1
[00056bb6] 4240                      clr.w      d0
[00056bb8] 4eb9 0007 f7ba            jsr        wind_get
[00056bbe] 4fef 0010                 lea.l      16(a7),a7
[00056bc2] 2057                      movea.l    (a7),a0
[00056bc4] 3028 0020                 move.w     32(a0),d0
[00056bc8] b06f 0004                 cmp.w      4(a7),d0
[00056bcc] 670c                      beq.s      $00056BDA
[00056bce] 2057                      movea.l    (a7),a0
[00056bd0] 2257                      movea.l    (a7),a1
[00056bd2] 2269 006e                 movea.l    110(a1),a1
[00056bd6] 4e91                      jsr        (a1)
[00056bd8] 600c                      bra.s      $00056BE6
[00056bda] 302f 0006                 move.w     6(a7),d0
[00056bde] b079 000e 0cfa            cmp.w      cycle,d0
[00056be4] 6694                      bne.s      $00056B7A
[00056be6] 504f                      addq.w     #8,a7
[00056be8] 4e75                      rts
Awi_show:
[00056bea] 594f                      subq.w     #4,a7
[00056bec] 2e88                      move.l     a0,(a7)
[00056bee] 2057                      movea.l    (a7),a0
[00056bf0] 3028 0020                 move.w     32(a0),d0
[00056bf4] 6f0c                      ble.s      $00056C02
[00056bf6] 2057                      movea.l    (a7),a0
[00056bf8] 2257                      movea.l    (a7),a1
[00056bfa] 2269 006e                 movea.l    110(a1),a1
[00056bfe] 4e91                      jsr        (a1)
[00056c00] 600a                      bra.s      $00056C0C
[00056c02] 2057                      movea.l    (a7),a0
[00056c04] 2257                      movea.l    (a7),a1
[00056c06] 2269 000c                 movea.l    12(a1),a1
[00056c0a] 4e91                      jsr        (a1)
[00056c0c] 2057                      movea.l    (a7),a0
[00056c0e] 6100 f062                 bsr        Awi_setontop
[00056c12] 584f                      addq.w     #4,a7
[00056c14] 4e75                      rts
Awi_selfcreate:
[00056c16] 594f                      subq.w     #4,a7
[00056c18] 2e88                      move.l     a0,(a7)
[00056c1a] 2017                      move.l     (a7),d0
[00056c1c] 670a                      beq.s      $00056C28
[00056c1e] 2057                      movea.l    (a7),a0
[00056c20] 4eb9 0005 7052            jsr        Awi_create
[00056c26] 6002                      bra.s      $00056C2A
[00056c28] 91c8                      suba.l     a0,a0
[00056c2a] 584f                      addq.w     #4,a7
[00056c2c] 4e75                      rts
MakeModernMenu:
[00056c2e] 2f0a                      move.l     a2,-(a7)
[00056c30] 4fef ffd0                 lea.l      -48(a7),a7
[00056c34] 2f48 0028                 move.l     a0,40(a7)
[00056c38] 2f6f 0028 0024            move.l     40(a7),36(a7)
[00056c3e] 3f7c 0001 0004            move.w     #$0001,4(a7)
[00056c44] 0c79 ffff 000e 0ea0       cmpi.w     #$FFFF,box_trans
[00056c4c] 6642                      bne.s      $00056C90
[00056c4e] 2f39 000e 692a            move.l     _globl,-(a7)
[00056c54] 486f 0032                 pea.l      50(a7)
[00056c58] 486f 0036                 pea.l      54(a7)
[00056c5c] 43ef 003a                 lea.l      58(a7),a1
[00056c60] 41ef 0038                 lea.l      56(a7),a0
[00056c64] 700d                      moveq.l    #13,d0
[00056c66] 4eb9 0007 8da2            jsr        mt_appl_getinfo
[00056c6c] 4fef 000c                 lea.l      12(a7),a7
[00056c70] 4a40                      tst.w      d0
[00056c72] 6716                      beq.s      $00056C8A
[00056c74] 7001                      moveq.l    #1,d0
[00056c76] c06f 002c                 and.w      44(a7),d0
[00056c7a] 6704                      beq.s      $00056C80
[00056c7c] 7001                      moveq.l    #1,d0
[00056c7e] 6002                      bra.s      $00056C82
[00056c80] 4240                      clr.w      d0
[00056c82] 33c0 000e 0ea0            move.w     d0,box_trans
[00056c88] 6006                      bra.s      $00056C90
[00056c8a] 4279 000e 0ea0            clr.w      box_trans
[00056c90] 3039 000e 0ea0            move.w     box_trans,d0
[00056c96] 6746                      beq.s      $00056CDE
[00056c98] 206f 0024                 movea.l    36(a7),a0
[00056c9c] 0c68 0014 0006            cmpi.w     #$0014,6(a0)
[00056ca2] 663a                      bne.s      $00056CDE
[00056ca4] 206f 0024                 movea.l    36(a7),a0
[00056ca8] 0268 fff0 000e            andi.w     #$FFF0,14(a0)
[00056cae] 0068 0008 000e            ori.w      #$0008,14(a0)
[00056cb4] 206f 0024                 movea.l    36(a7),a0
[00056cb8] 0268 ff8f 000e            andi.w     #$FF8F,14(a0)
[00056cbe] 0068 0070 000e            ori.w      #$0070,14(a0)
[00056cc4] 206f 0024                 movea.l    36(a7),a0
[00056cc8] 0268 ff7f 000e            andi.w     #$FF7F,14(a0)
[00056cce] 0068 0080 000e            ori.w      #$0080,14(a0)
[00056cd4] 206f 0024                 movea.l    36(a7),a0
[00056cd8] 0068 0400 0008            ori.w      #$0400,8(a0)
[00056cde] 7008                      moveq.l    #8,d0
[00056ce0] 206f 0024                 movea.l    36(a7),a0
[00056ce4] c068 000a                 and.w      10(a0),d0
[00056ce8] 6700 0110                 beq        $00056DFA
[00056cec] 206f 0024                 movea.l    36(a7),a0
[00056cf0] 0c68 001c 0006            cmpi.w     #$001C,6(a0)
[00056cf6] 6600 0102                 bne        $00056DFA
[00056cfa] 206f 0024                 movea.l    36(a7),a0
[00056cfe] 2f68 000c 0020            move.l     12(a0),32(a7)
[00056d04] 206f 0020                 movea.l    32(a7),a0
[00056d08] 4eb9 0004 69f6            jsr        Ast_isEmpty
[00056d0e] 4a40                      tst.w      d0
[00056d10] 6706                      beq.s      $00056D18
[00056d12] 426f 0006                 clr.w      6(a7)
[00056d16] 602e                      bra.s      $00056D46
[00056d18] 3f7c 0001 0006            move.w     #$0001,6(a7)
[00056d1e] 6018                      bra.s      $00056D38
[00056d20] 206f 0020                 movea.l    32(a7),a0
[00056d24] 0c10 002d                 cmpi.b     #$2D,(a0)
[00056d28] 6604                      bne.s      $00056D2E
[00056d2a] 7001                      moveq.l    #1,d0
[00056d2c] 6002                      bra.s      $00056D30
[00056d2e] 4240                      clr.w      d0
[00056d30] 3f40 0006                 move.w     d0,6(a7)
[00056d34] 52af 0020                 addq.l     #1,32(a7)
[00056d38] 302f 0006                 move.w     6(a7),d0
[00056d3c] 6708                      beq.s      $00056D46
[00056d3e] 206f 0020                 movea.l    32(a7),a0
[00056d42] 1010                      move.b     (a0),d0
[00056d44] 66da                      bne.s      $00056D20
[00056d46] 302f 0006                 move.w     6(a7),d0
[00056d4a] 6700 00ae                 beq        $00056DFA
[00056d4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056d54] 0c68 0010 001a            cmpi.w     #$0010,26(a0)
[00056d5a] 6d10                      blt.s      $00056D6C
[00056d5c] 41f9 000e 0e80            lea.l      dis_arrow_col,a0
[00056d62] 4eb9 0004 fb5e            jsr        Aus_create
[00056d68] 2e88                      move.l     a0,(a7)
[00056d6a] 600e                      bra.s      $00056D7A
[00056d6c] 41f9 000e 0e60            lea.l      dis_arrow_mon,a0
[00056d72] 4eb9 0004 fb5e            jsr        Aus_create
[00056d78] 2e88                      move.l     a0,(a7)
[00056d7a] 2017                      move.l     (a7),d0
[00056d7c] 6700 007c                 beq.w      $00056DFA
[00056d80] 7018                      moveq.l    #24,d0
[00056d82] 226f 0024                 movea.l    36(a7),a1
[00056d86] 41ef 0008                 lea.l      8(a7),a0
[00056d8a] 4eb9 0008 3500            jsr        memcpy
[00056d90] 206f 0024                 movea.l    36(a7),a0
[00056d94] 317c 0018 0006            move.w     #$0018,6(a0)
[00056d9a] 206f 0024                 movea.l    36(a7),a0
[00056d9e] 2157 000c                 move.l     (a7),12(a0)
[00056da2] 2057                      movea.l    (a7),a0
[00056da4] 2028 0008                 move.l     8(a0),d0
[00056da8] 6714                      beq.s      $00056DBE
[00056daa] 43ef 0004                 lea.l      4(a7),a1
[00056dae] 7001                      moveq.l    #1,d0
[00056db0] 206f 0024                 movea.l    36(a7),a0
[00056db4] 2457                      movea.l    (a7),a2
[00056db6] 246a 0008                 movea.l    8(a2),a2
[00056dba] 4e92                      jsr        (a2)
[00056dbc] 6006                      bra.s      $00056DC4
[00056dbe] 3f7c 0001 0004            move.w     #$0001,4(a7)
[00056dc4] 0c6f ffff 0004            cmpi.w     #$FFFF,4(a7)
[00056dca] 6716                      beq.s      $00056DE2
[00056dcc] 302f 0012                 move.w     18(a7),d0
[00056dd0] c07c 2000                 and.w      #$2000,d0
[00056dd4] 660a                      bne.s      $00056DE0
[00056dd6] 206f 0014                 movea.l    20(a7),a0
[00056dda] 4eb9 0004 649c            jsr        Ast_delete
[00056de0] 6018                      bra.s      $00056DFA
[00056de2] 2057                      movea.l    (a7),a0
[00056de4] 4eb9 0004 fbb2            jsr        Aus_delete
[00056dea] 7018                      moveq.l    #24,d0
[00056dec] 43ef 0008                 lea.l      8(a7),a1
[00056df0] 206f 0024                 movea.l    36(a7),a0
[00056df4] 4eb9 0008 3500            jsr        memcpy
[00056dfa] 7008                      moveq.l    #8,d0
[00056dfc] 206f 0024                 movea.l    36(a7),a0
[00056e00] c068 000a                 and.w      10(a0),d0
[00056e04] 674e                      beq.s      $00056E54
[00056e06] 206f 0024                 movea.l    36(a7),a0
[00056e0a] 0c68 0018 0006            cmpi.w     #$0018,6(a0)
[00056e10] 6642                      bne.s      $00056E54
[00056e12] 206f 0024                 movea.l    36(a7),a0
[00056e16] 2068 000c                 movea.l    12(a0),a0
[00056e1a] 2050                      movea.l    (a0),a0
[00056e1c] b1fc 0006 5c72            cmpa.l     #A_arrows,a0
[00056e22] 6630                      bne.s      $00056E54
[00056e24] 206f 0024                 movea.l    36(a7),a0
[00056e28] 2068 000c                 movea.l    12(a0),a0
[00056e2c] 0ca8 2209 0001 0004       cmpi.l     #$22090001,4(a0)
[00056e34] 661e                      bne.s      $00056E54
[00056e36] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056e3c] 0c68 0010 001a            cmpi.w     #$0010,26(a0)
[00056e42] 6d10                      blt.s      $00056E54
[00056e44] 206f 0024                 movea.l    36(a7),a0
[00056e48] 2068 000c                 movea.l    12(a0),a0
[00056e4c] 217c 2201 0009 0004       move.l     #$22010009,4(a0)
[00056e54] 7020                      moveq.l    #32,d0
[00056e56] 206f 0024                 movea.l    36(a7),a0
[00056e5a] 06af 0000 0018 0024       addi.l     #$00000018,36(a7)
[00056e62] c068 0008                 and.w      8(a0),d0
[00056e66] 6700 fe28                 beq        $00056C90
[00056e6a] 4fef 0030                 lea.l      48(a7),a7
[00056e6e] 245f                      movea.l    (a7)+,a2
[00056e70] 4e75                      rts
MakeOldMenu:
[00056e72] 4fef fff4                 lea.l      -12(a7),a7
[00056e76] 2f48 0008                 move.l     a0,8(a7)
[00056e7a] 6100 f010                 bsr        Awi_root
[00056e7e] 2e88                      move.l     a0,(a7)
[00056e80] 2f6f 0008 0004            move.l     8(a7),4(a7)
[00056e86] 6000 008e                 bra        $00056F16
[00056e8a] 206f 0004                 movea.l    4(a7),a0
[00056e8e] 0c68 0014 0006            cmpi.w     #$0014,6(a0)
[00056e94] 663e                      bne.s      $00056ED4
[00056e96] 2017                      move.l     (a7),d0
[00056e98] 670c                      beq.s      $00056EA6
[00056e9a] 2057                      movea.l    (a7),a0
[00056e9c] 2068 005e                 movea.l    94(a0),a0
[00056ea0] b1ef 0008                 cmpa.l     8(a7),a0
[00056ea4] 6724                      beq.s      $00056ECA
[00056ea6] 206f 0004                 movea.l    4(a7),a0
[00056eaa] 0268 fff0 000e            andi.w     #$FFF0,14(a0)
[00056eb0] 206f 0004                 movea.l    4(a7),a0
[00056eb4] 0268 ff8f 000e            andi.w     #$FF8F,14(a0)
[00056eba] 0068 0070 000e            ori.w      #$0070,14(a0)
[00056ec0] 206f 0004                 movea.l    4(a7),a0
[00056ec4] 0268 ff7f 000e            andi.w     #$FF7F,14(a0)
[00056eca] 206f 0004                 movea.l    4(a7),a0
[00056ece] 0268 fbff 0008            andi.w     #$FBFF,8(a0)
[00056ed4] 7008                      moveq.l    #8,d0
[00056ed6] 206f 0004                 movea.l    4(a7),a0
[00056eda] c068 000a                 and.w      10(a0),d0
[00056ede] 672e                      beq.s      $00056F0E
[00056ee0] 206f 0004                 movea.l    4(a7),a0
[00056ee4] 0c68 0018 0006            cmpi.w     #$0018,6(a0)
[00056eea] 6622                      bne.s      $00056F0E
[00056eec] 206f 0004                 movea.l    4(a7),a0
[00056ef0] 2068 000c                 movea.l    12(a0),a0
[00056ef4] 2050                      movea.l    (a0),a0
[00056ef6] b1fc 0006 5c72            cmpa.l     #A_arrows,a0
[00056efc] 6610                      bne.s      $00056F0E
[00056efe] 206f 0004                 movea.l    4(a7),a0
[00056f02] 2068 000c                 movea.l    12(a0),a0
[00056f06] 217c 2209 0001 0004       move.l     #$22090001,4(a0)
[00056f0e] 06af 0000 0018 0004       addi.l     #$00000018,4(a7)
[00056f16] 7020                      moveq.l    #32,d0
[00056f18] 206f 0004                 movea.l    4(a7),a0
[00056f1c] c068 0008                 and.w      8(a0),d0
[00056f20] 6700 ff68                 beq        $00056E8A
[00056f24] 4fef 000c                 lea.l      12(a7),a7
[00056f28] 4e75                      rts
Awi_layout:
[00056f2a] 2f0a                      move.l     a2,-(a7)
[00056f2c] 4fef fff0                 lea.l      -16(a7),a7
[00056f30] 3f40 000e                 move.w     d0,14(a7)
[00056f34] 3f41 000c                 move.w     d1,12(a7)
[00056f38] 3f42 000a                 move.w     d2,10(a7)
[00056f3c] 0c6f ffff 000e            cmpi.w     #$FFFF,14(a7)
[00056f42] 6f28                      ble.s      $00056F6C
[00056f44] 302f 000e                 move.w     14(a7),d0
[00056f48] 6712                      beq.s      $00056F5C
[00056f4a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056f50] 2068 023c                 movea.l    572(a0),a0
[00056f54] 0268 feff 000e            andi.w     #$FEFF,14(a0)
[00056f5a] 6010                      bra.s      $00056F6C
[00056f5c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056f62] 2068 023c                 movea.l    572(a0),a0
[00056f66] 0068 0100 000e            ori.w      #$0100,14(a0)
[00056f6c] 0c6f ffff 000c            cmpi.w     #$FFFF,12(a7)
[00056f72] 6f28                      ble.s      $00056F9C
[00056f74] 302f 000c                 move.w     12(a7),d0
[00056f78] 6712                      beq.s      $00056F8C
[00056f7a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056f80] 2068 023c                 movea.l    572(a0),a0
[00056f84] 0268 efff 000e            andi.w     #$EFFF,14(a0)
[00056f8a] 6010                      bra.s      $00056F9C
[00056f8c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056f92] 2068 023c                 movea.l    572(a0),a0
[00056f96] 0068 1000 000e            ori.w      #$1000,14(a0)
[00056f9c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00056fa2] 2068 023c                 movea.l    572(a0),a0
[00056fa6] 3028 000e                 move.w     14(a0),d0
[00056faa] c07c 1000                 and.w      #$1000,d0
[00056fae] 6704                      beq.s      $00056FB4
[00056fb0] 7001                      moveq.l    #1,d0
[00056fb2] 6002                      bra.s      $00056FB6
[00056fb4] 4240                      clr.w      d0
[00056fb6] 3f40 0002                 move.w     d0,2(a7)
[00056fba] 426f 0004                 clr.w      4(a7)
[00056fbe] 6064                      bra.s      $00057024
[00056fc0] 302f 0004                 move.w     4(a7),d0
[00056fc4] e548                      lsl.w      #2,d0
[00056fc6] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[00056fcc] 2f70 0000 0006            move.l     0(a0,d0.w),6(a7)
[00056fd2] 202f 0006                 move.l     6(a7),d0
[00056fd6] 6748                      beq.s      $00057020
[00056fd8] 206f 0006                 movea.l    6(a7),a0
[00056fdc] 2028 005e                 move.l     94(a0),d0
[00056fe0] 673e                      beq.s      $00057020
[00056fe2] 3ebc 0001                 move.w     #$0001,(a7)
[00056fe6] 43d7                      lea.l      (a7),a1
[00056fe8] 7035                      moveq.l    #53,d0
[00056fea] 206f 0006                 movea.l    6(a7),a0
[00056fee] 246f 0006                 movea.l    6(a7),a2
[00056ff2] 246a 0004                 movea.l    4(a2),a2
[00056ff6] 4e92                      jsr        (a2)
[00056ff8] 4a40                      tst.w      d0
[00056ffa] 6704                      beq.s      $00057000
[00056ffc] 3017                      move.w     (a7),d0
[00056ffe] 6720                      beq.s      $00057020
[00057000] 302f 0002                 move.w     2(a7),d0
[00057004] 670e                      beq.s      $00057014
[00057006] 206f 0006                 movea.l    6(a7),a0
[0005700a] 2068 005e                 movea.l    94(a0),a0
[0005700e] 6100 fe62                 bsr        MakeOldMenu
[00057012] 600c                      bra.s      $00057020
[00057014] 206f 0006                 movea.l    6(a7),a0
[00057018] 2068 005e                 movea.l    94(a0),a0
[0005701c] 6100 fc10                 bsr        MakeModernMenu
[00057020] 526f 0004                 addq.w     #1,4(a7)
[00057024] 0c6f 0100 0004            cmpi.w     #$0100,4(a7)
[0005702a] 6d94                      blt.s      $00056FC0
[0005702c] 302f 000a                 move.w     10(a7),d0
[00057030] 6718                      beq.s      $0005704A
[00057032] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057038] 5048                      addq.w     #8,a0
[0005703a] 72ff                      moveq.l    #-1,d1
[0005703c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00057042] 3011                      move.w     (a1),d0
[00057044] 4eb9 0005 eb60            jsr        Aev_WmRedraw
[0005704a] 4fef 0010                 lea.l      16(a7),a7
[0005704e] 245f                      movea.l    (a7)+,a2
[00057050] 4e75                      rts
Awi_create:
[00057052] 2f0a                      move.l     a2,-(a7)
[00057054] 4fef fff6                 lea.l      -10(a7),a7
[00057058] 2f48 0006                 move.l     a0,6(a7)
[0005705c] 203c 0000 00a2            move.l     #$000000A2,d0
[00057062] 4eb9 0004 c608            jsr        Ax_malloc
[00057068] 2e88                      move.l     a0,(a7)
[0005706a] 203c 0000 00a2            move.l     #$000000A2,d0
[00057070] 226f 0006                 movea.l    6(a7),a1
[00057074] 2057                      movea.l    (a7),a0
[00057076] 4eb9 0008 3500            jsr        memcpy
[0005707c] 2057                      movea.l    (a7),a0
[0005707e] 2028 0014                 move.l     20(a0),d0
[00057082] 673a                      beq.s      $000570BE
[00057084] 2057                      movea.l    (a7),a0
[00057086] 2068 0014                 movea.l    20(a0),a0
[0005708a] 4eb9 0004 f064            jsr        Aob_create
[00057090] 2257                      movea.l    (a7),a1
[00057092] 2348 0014                 move.l     a0,20(a1)
[00057096] 2057                      movea.l    (a7),a0
[00057098] 2028 0014                 move.l     20(a0),d0
[0005709c] 6614                      bne.s      $000570B2
[0005709e] 203c 0000 00a2            move.l     #$000000A2,d0
[000570a4] 2057                      movea.l    (a7),a0
[000570a6] 4eb9 0004 cc28            jsr        Ax_recycle
[000570ac] 91c8                      suba.l     a0,a0
[000570ae] 6000 02be                 bra        $0005736E
[000570b2] 2057                      movea.l    (a7),a0
[000570b4] 2068 0014                 movea.l    20(a0),a0
[000570b8] 4eb9 0004 fbdc            jsr        Aob_fix
[000570be] 2057                      movea.l    (a7),a0
[000570c0] 2028 0018                 move.l     24(a0),d0
[000570c4] 6746                      beq.s      $0005710C
[000570c6] 2057                      movea.l    (a7),a0
[000570c8] 2068 0018                 movea.l    24(a0),a0
[000570cc] 4eb9 0004 f064            jsr        Aob_create
[000570d2] 2257                      movea.l    (a7),a1
[000570d4] 2348 0018                 move.l     a0,24(a1)
[000570d8] 2057                      movea.l    (a7),a0
[000570da] 2028 0018                 move.l     24(a0),d0
[000570de] 6620                      bne.s      $00057100
[000570e0] 2057                      movea.l    (a7),a0
[000570e2] 2068 0014                 movea.l    20(a0),a0
[000570e6] 4eb9 0004 f20a            jsr        Aob_delete
[000570ec] 203c 0000 00a2            move.l     #$000000A2,d0
[000570f2] 2057                      movea.l    (a7),a0
[000570f4] 4eb9 0004 cc28            jsr        Ax_recycle
[000570fa] 91c8                      suba.l     a0,a0
[000570fc] 6000 0270                 bra        $0005736E
[00057100] 2057                      movea.l    (a7),a0
[00057102] 2068 0018                 movea.l    24(a0),a0
[00057106] 4eb9 0004 fbdc            jsr        Aob_fix
[0005710c] 2057                      movea.l    (a7),a0
[0005710e] 2028 005e                 move.l     94(a0),d0
[00057112] 6700 008a                 beq        $0005719E
[00057116] 2057                      movea.l    (a7),a0
[00057118] 2068 005e                 movea.l    94(a0),a0
[0005711c] 4eb9 0004 f064            jsr        Aob_create
[00057122] 2257                      movea.l    (a7),a1
[00057124] 2348 005e                 move.l     a0,94(a1)
[00057128] 2057                      movea.l    (a7),a0
[0005712a] 2028 005e                 move.l     94(a0),d0
[0005712e] 662c                      bne.s      $0005715C
[00057130] 2057                      movea.l    (a7),a0
[00057132] 2068 0018                 movea.l    24(a0),a0
[00057136] 4eb9 0004 f20a            jsr        Aob_delete
[0005713c] 2057                      movea.l    (a7),a0
[0005713e] 2068 0014                 movea.l    20(a0),a0
[00057142] 4eb9 0004 f20a            jsr        Aob_delete
[00057148] 203c 0000 00a2            move.l     #$000000A2,d0
[0005714e] 2057                      movea.l    (a7),a0
[00057150] 4eb9 0004 cc28            jsr        Ax_recycle
[00057156] 91c8                      suba.l     a0,a0
[00057158] 6000 0214                 bra        $0005736E
[0005715c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057162] 2068 023c                 movea.l    572(a0),a0
[00057166] 3028 000e                 move.w     14(a0),d0
[0005716a] c07c 1000                 and.w      #$1000,d0
[0005716e] 670c                      beq.s      $0005717C
[00057170] 2057                      movea.l    (a7),a0
[00057172] 2068 005e                 movea.l    94(a0),a0
[00057176] 6100 fcfa                 bsr        MakeOldMenu
[0005717a] 600a                      bra.s      $00057186
[0005717c] 2057                      movea.l    (a7),a0
[0005717e] 2068 005e                 movea.l    94(a0),a0
[00057182] 6100 faaa                 bsr        MakeModernMenu
[00057186] 2057                      movea.l    (a7),a0
[00057188] 2068 005e                 movea.l    94(a0),a0
[0005718c] 4eb9 0004 fbdc            jsr        Aob_fix
[00057192] 2057                      movea.l    (a7),a0
[00057194] 2068 005e                 movea.l    94(a0),a0
[00057198] 4eb9 0004 ec24            jsr        Ame_namefix
[0005719e] 2057                      movea.l    (a7),a0
[000571a0] 2028 005a                 move.l     90(a0),d0
[000571a4] 6752                      beq.s      $000571F8
[000571a6] 2057                      movea.l    (a7),a0
[000571a8] 2068 005a                 movea.l    90(a0),a0
[000571ac] 4eb9 0004 f606            jsr        Aic_create
[000571b2] 2257                      movea.l    (a7),a1
[000571b4] 2348 005a                 move.l     a0,90(a1)
[000571b8] 2057                      movea.l    (a7),a0
[000571ba] 2028 005a                 move.l     90(a0),d0
[000571be] 6638                      bne.s      $000571F8
[000571c0] 2057                      movea.l    (a7),a0
[000571c2] 2068 005e                 movea.l    94(a0),a0
[000571c6] 4eb9 0004 f20a            jsr        Aob_delete
[000571cc] 2057                      movea.l    (a7),a0
[000571ce] 2068 0018                 movea.l    24(a0),a0
[000571d2] 4eb9 0004 f20a            jsr        Aob_delete
[000571d8] 2057                      movea.l    (a7),a0
[000571da] 2068 0014                 movea.l    20(a0),a0
[000571de] 4eb9 0004 f20a            jsr        Aob_delete
[000571e4] 203c 0000 00a2            move.l     #$000000A2,d0
[000571ea] 2057                      movea.l    (a7),a0
[000571ec] 4eb9 0004 cc28            jsr        Ax_recycle
[000571f2] 91c8                      suba.l     a0,a0
[000571f4] 6000 0178                 bra        $0005736E
[000571f8] 2057                      movea.l    (a7),a0
[000571fa] 4eb9 0005 180a            jsr        Awi_uoself
[00057200] 2057                      movea.l    (a7),a0
[00057202] 2028 004a                 move.l     74(a0),d0
[00057206] 6712                      beq.s      $0005721A
[00057208] 2057                      movea.l    (a7),a0
[0005720a] 2068 004a                 movea.l    74(a0),a0
[0005720e] 4eb9 0004 643c            jsr        Ast_create
[00057214] 2257                      movea.l    (a7),a1
[00057216] 2348 004a                 move.l     a0,74(a1)
[0005721a] 2057                      movea.l    (a7),a0
[0005721c] 2028 004e                 move.l     78(a0),d0
[00057220] 6712                      beq.s      $00057234
[00057222] 2057                      movea.l    (a7),a0
[00057224] 2068 004e                 movea.l    78(a0),a0
[00057228] 4eb9 0004 643c            jsr        Ast_create
[0005722e] 2257                      movea.l    (a7),a1
[00057230] 2348 004e                 move.l     a0,78(a1)
[00057234] 2057                      movea.l    (a7),a0
[00057236] 2028 009a                 move.l     154(a0),d0
[0005723a] 6712                      beq.s      $0005724E
[0005723c] 2057                      movea.l    (a7),a0
[0005723e] 2068 009a                 movea.l    154(a0),a0
[00057242] 4eb9 0004 643c            jsr        Ast_create
[00057248] 2257                      movea.l    (a7),a1
[0005724a] 2348 009a                 move.l     a0,154(a1)
[0005724e] 2057                      movea.l    (a7),a0
[00057250] 2028 009e                 move.l     158(a0),d0
[00057254] 6712                      beq.s      $00057268
[00057256] 2057                      movea.l    (a7),a0
[00057258] 2068 009e                 movea.l    158(a0),a0
[0005725c] 4eb9 0004 643c            jsr        Ast_create
[00057262] 2257                      movea.l    (a7),a1
[00057264] 2348 009e                 move.l     a0,158(a1)
[00057268] 2057                      movea.l    (a7),a0
[0005726a] 317c 0004 0056            move.w     #$0004,86(a0)
[00057270] 2057                      movea.l    (a7),a0
[00057272] 317c ffff 0058            move.w     #$FFFF,88(a0)
[00057278] 2057                      movea.l    (a7),a0
[0005727a] 317c ffff 001c            move.w     #$FFFF,28(a0)
[00057280] 2057                      movea.l    (a7),a0
[00057282] 4268 0052                 clr.w      82(a0)
[00057286] 426f 0004                 clr.w      4(a7)
[0005728a] 6000 00c2                 bra        $0005734E
[0005728e] 302f 0004                 move.w     4(a7),d0
[00057292] e548                      lsl.w      #2,d0
[00057294] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[0005729a] 2030 0000                 move.l     0(a0,d0.w),d0
[0005729e] 6600 00aa                 bne        $0005734A
[000572a2] 302f 0004                 move.w     4(a7),d0
[000572a6] b079 0011 452a            cmp.w      _Wmax_wi,d0
[000572ac] 6f08                      ble.s      $000572B6
[000572ae] 33ef 0004 0011 452a       move.w     4(a7),_Wmax_wi
[000572b6] 302f 0004                 move.w     4(a7),d0
[000572ba] e548                      lsl.w      #2,d0
[000572bc] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[000572c2] 2197 0000                 move.l     (a7),0(a0,d0.w)
[000572c6] 2039 000e 0d26            move.l     Aroot_wi,d0
[000572cc] 6720                      beq.s      $000572EE
[000572ce] 7001                      moveq.l    #1,d0
[000572d0] 2057                      movea.l    (a7),a0
[000572d2] c068 0054                 and.w      84(a0),d0
[000572d6] 6716                      beq.s      $000572EE
[000572d8] 2257                      movea.l    (a7),a1
[000572da] 7064                      moveq.l    #100,d0
[000572dc] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000572e2] 2479 000e 0d26            movea.l    Aroot_wi,a2
[000572e8] 246a 0004                 movea.l    4(a2),a2
[000572ec] 4e92                      jsr        (a2)
[000572ee] 2057                      movea.l    (a7),a0
[000572f0] 3028 0024                 move.w     36(a0),d0
[000572f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000572fa] c1e8 0012                 muls.w     18(a0),d0
[000572fe] 2057                      movea.l    (a7),a0
[00057300] 3140 0024                 move.w     d0,36(a0)
[00057304] 2057                      movea.l    (a7),a0
[00057306] 3028 0026                 move.w     38(a0),d0
[0005730a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057310] c1e8 0014                 muls.w     20(a0),d0
[00057314] 2057                      movea.l    (a7),a0
[00057316] 3140 0026                 move.w     d0,38(a0)
[0005731a] 2057                      movea.l    (a7),a0
[0005731c] 3028 0028                 move.w     40(a0),d0
[00057320] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057326] c1e8 0012                 muls.w     18(a0),d0
[0005732a] 2057                      movea.l    (a7),a0
[0005732c] 3140 0028                 move.w     d0,40(a0)
[00057330] 2057                      movea.l    (a7),a0
[00057332] 3028 002a                 move.w     42(a0),d0
[00057336] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005733c] c1e8 0014                 muls.w     20(a0),d0
[00057340] 2057                      movea.l    (a7),a0
[00057342] 3140 002a                 move.w     d0,42(a0)
[00057346] 2057                      movea.l    (a7),a0
[00057348] 6024                      bra.s      $0005736E
[0005734a] 526f 0004                 addq.w     #1,4(a7)
[0005734e] 0c6f 0100 0004            cmpi.w     #$0100,4(a7)
[00057354] 6d00 ff38                 blt        $0005728E
[00057358] 2279 000e 692a            movea.l    _globl,a1
[0005735e] 41f9 000d 670e            lea.l      _A_ERR_WISLOT,a0
[00057364] 7001                      moveq.l    #1,d0
[00057366] 4eb9 0007 a146            jsr        mt_form_alert
[0005736c] 91c8                      suba.l     a0,a0
[0005736e] 4fef 000a                 lea.l      10(a7),a7
[00057372] 245f                      movea.l    (a7)+,a2
[00057374] 4e75                      rts
Awi_slider:
[00057376] 4fef fff6                 lea.l      -10(a7),a7
[0005737a] 2f48 0006                 move.l     a0,6(a7)
[0005737e] 206f 0006                 movea.l    6(a7),a0
[00057382] 3ea8 0020                 move.w     32(a0),(a7)
[00057386] 3017                      move.w     (a7),d0
[00057388] 6b00 0098                 bmi        $00057422
[0005738c] 206f 0006                 movea.l    6(a7),a0
[00057390] 41e8 003c                 lea.l      60(a0),a0
[00057394] 2f48 0002                 move.l     a0,2(a7)
[00057398] 206f 0006                 movea.l    6(a7),a0
[0005739c] 3028 0022                 move.w     34(a0),d0
[000573a0] c07c 0800                 and.w      #$0800,d0
[000573a4] 6736                      beq.s      $000573DC
[000573a6] 4267                      clr.w      -(a7)
[000573a8] 4267                      clr.w      -(a7)
[000573aa] 4267                      clr.w      -(a7)
[000573ac] 206f 0008                 movea.l    8(a7),a0
[000573b0] 3f10                      move.w     (a0),-(a7)
[000573b2] 7208                      moveq.l    #8,d1
[000573b4] 302f 0008                 move.w     8(a7),d0
[000573b8] 4eb9 0007 f926            jsr        wind_set
[000573be] 504f                      addq.w     #8,a7
[000573c0] 4267                      clr.w      -(a7)
[000573c2] 4267                      clr.w      -(a7)
[000573c4] 4267                      clr.w      -(a7)
[000573c6] 206f 0008                 movea.l    8(a7),a0
[000573ca] 3f28 0004                 move.w     4(a0),-(a7)
[000573ce] 720f                      moveq.l    #15,d1
[000573d0] 302f 0008                 move.w     8(a7),d0
[000573d4] 4eb9 0007 f926            jsr        wind_set
[000573da] 504f                      addq.w     #8,a7
[000573dc] 206f 0006                 movea.l    6(a7),a0
[000573e0] 3028 0022                 move.w     34(a0),d0
[000573e4] c07c 0100                 and.w      #$0100,d0
[000573e8] 6738                      beq.s      $00057422
[000573ea] 4267                      clr.w      -(a7)
[000573ec] 4267                      clr.w      -(a7)
[000573ee] 4267                      clr.w      -(a7)
[000573f0] 206f 0008                 movea.l    8(a7),a0
[000573f4] 3f28 0002                 move.w     2(a0),-(a7)
[000573f8] 7209                      moveq.l    #9,d1
[000573fa] 302f 0008                 move.w     8(a7),d0
[000573fe] 4eb9 0007 f926            jsr        wind_set
[00057404] 504f                      addq.w     #8,a7
[00057406] 4267                      clr.w      -(a7)
[00057408] 4267                      clr.w      -(a7)
[0005740a] 4267                      clr.w      -(a7)
[0005740c] 206f 0008                 movea.l    8(a7),a0
[00057410] 3f28 0006                 move.w     6(a0),-(a7)
[00057414] 7210                      moveq.l    #16,d1
[00057416] 302f 0008                 move.w     8(a7),d0
[0005741a] 4eb9 0007 f926            jsr        wind_set
[00057420] 504f                      addq.w     #8,a7
[00057422] 4fef 000a                 lea.l      10(a7),a7
[00057426] 4e75                      rts
Awi_open:
[00057428] 2f0a                      move.l     a2,-(a7)
[0005742a] 4fef ffce                 lea.l      -50(a7),a7
[0005742e] 2f48 001e                 move.l     a0,30(a7)
[00057432] 41f9 000e 0ea2            lea.l      $000E0EA2,a0
[00057438] 43ef 0010                 lea.l      16(a7),a1
[0005743c] 22d8                      move.l     (a0)+,(a1)+
[0005743e] 22d8                      move.l     (a0)+,(a1)+
[00057440] 206f 001e                 movea.l    30(a7),a0
[00057444] 3028 0020                 move.w     32(a0),d0
[00057448] 6b06                      bmi.s      $00057450
[0005744a] 4240                      clr.w      d0
[0005744c] 6000 0448                 bra        $00057896
[00057450] 7004                      moveq.l    #4,d0
[00057452] 206f 001e                 movea.l    30(a7),a0
[00057456] c068 0056                 and.w      86(a0),d0
[0005745a] 6722                      beq.s      $0005747E
[0005745c] 206f 001e                 movea.l    30(a7),a0
[00057460] 0268 fffb 0056            andi.w     #$FFFB,86(a0)
[00057466] 206f 001e                 movea.l    30(a7),a0
[0005746a] 226f 001e                 movea.l    30(a7),a1
[0005746e] 2269 0010                 movea.l    16(a1),a1
[00057472] 4e91                      jsr        (a1)
[00057474] 4a40                      tst.w      d0
[00057476] 6706                      beq.s      $0005747E
[00057478] 70ff                      moveq.l    #-1,d0
[0005747a] 6000 041a                 bra        $00057896
[0005747e] 206f 001e                 movea.l    30(a7),a0
[00057482] 0268 f7ff 0056            andi.w     #$F7FF,86(a0)
[00057488] 206f 001e                 movea.l    30(a7),a0
[0005748c] 6100 f38c                 bsr        Awi_catch
[00057490] 3f40 001c                 move.w     d0,28(a7)
[00057494] 302f 001c                 move.w     28(a7),d0
[00057498] 6a06                      bpl.s      $000574A0
[0005749a] 70ff                      moveq.l    #-1,d0
[0005749c] 6000 03f8                 bra        $00057896
[000574a0] 206f 001e                 movea.l    30(a7),a0
[000574a4] 2028 0014                 move.l     20(a0),d0
[000574a8] 6614                      bne.s      $000574BE
[000574aa] 41f9 000e 0d0e            lea.l      empty,a0
[000574b0] 4eb9 0004 f064            jsr        Aob_create
[000574b6] 226f 001e                 movea.l    30(a7),a1
[000574ba] 2348 0014                 move.l     a0,20(a1)
[000574be] 206f 001e                 movea.l    30(a7),a0
[000574c2] 316f 001c 0020            move.w     28(a7),32(a0)
[000574c8] 302f 001c                 move.w     28(a7),d0
[000574cc] e548                      lsl.w      #2,d0
[000574ce] 41f9 0011 3af2            lea.l      gemmap,a0
[000574d4] 21af 001e 0000            move.l     30(a7),0(a0,d0.w)
[000574da] 206f 001e                 movea.l    30(a7),a0
[000574de] 3028 0054                 move.w     84(a0),d0
[000574e2] c07c 0100                 and.w      #$0100,d0
[000574e6] 6718                      beq.s      $00057500
[000574e8] 4267                      clr.w      -(a7)
[000574ea] 4267                      clr.w      -(a7)
[000574ec] 4267                      clr.w      -(a7)
[000574ee] 7001                      moveq.l    #1,d0
[000574f0] 3f00                      move.w     d0,-(a7)
[000574f2] 7218                      moveq.l    #24,d1
[000574f4] 302f 0024                 move.w     36(a7),d0
[000574f8] 4eb9 0007 f926            jsr        wind_set
[000574fe] 504f                      addq.w     #8,a7
[00057500] 4267                      clr.w      -(a7)
[00057502] 4267                      clr.w      -(a7)
[00057504] 206f 0022                 movea.l    34(a7),a0
[00057508] 2f28 004a                 move.l     74(a0),-(a7)
[0005750c] 7202                      moveq.l    #2,d1
[0005750e] 302f 0024                 move.w     36(a7),d0
[00057512] 4eb9 0007 f926            jsr        wind_set
[00057518] 504f                      addq.w     #8,a7
[0005751a] 4267                      clr.w      -(a7)
[0005751c] 4267                      clr.w      -(a7)
[0005751e] 206f 0022                 movea.l    34(a7),a0
[00057522] 2f28 004e                 move.l     78(a0),-(a7)
[00057526] 7203                      moveq.l    #3,d1
[00057528] 302f 0024                 move.w     36(a7),d0
[0005752c] 4eb9 0007 f926            jsr        wind_set
[00057532] 504f                      addq.w     #8,a7
[00057534] 206f 001e                 movea.l    30(a7),a0
[00057538] 3028 0026                 move.w     38(a0),d0
[0005753c] 6600 00f4                 bne        $00057632
[00057540] 7010                      moveq.l    #16,d0
[00057542] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057548] 2068 023c                 movea.l    572(a0),a0
[0005754c] c068 000e                 and.w      14(a0),d0
[00057550] 6700 00ae                 beq        $00057600
[00057554] 206f 001e                 movea.l    30(a7),a0
[00057558] 2028 0014                 move.l     20(a0),d0
[0005755c] 6700 00a2                 beq        $00057600
[00057560] 2f39 000e 692a            move.l     _globl,-(a7)
[00057566] 486f 0012                 pea.l      18(a7)
[0005756a] 486f 0014                 pea.l      20(a7)
[0005756e] 486f 0016                 pea.l      22(a7)
[00057572] 43ef 0018                 lea.l      24(a7),a1
[00057576] 206f 002e                 movea.l    46(a7),a0
[0005757a] 2068 0014                 movea.l    20(a0),a0
[0005757e] 4eb9 0007 a218            jsr        mt_form_center
[00057584] 4fef 0010                 lea.l      16(a7),a7
[00057588] 4240                      clr.w      d0
[0005758a] 206f 001e                 movea.l    30(a7),a0
[0005758e] 2068 0014                 movea.l    20(a0),a0
[00057592] 3140 0012                 move.w     d0,18(a0)
[00057596] 206f 001e                 movea.l    30(a7),a0
[0005759a] 2068 0014                 movea.l    20(a0),a0
[0005759e] 3140 0010                 move.w     d0,16(a0)
[000575a2] 206f 001e                 movea.l    30(a7),a0
[000575a6] 2028 0018                 move.l     24(a0),d0
[000575aa] 6710                      beq.s      $000575BC
[000575ac] 206f 001e                 movea.l    30(a7),a0
[000575b0] 2068 0018                 movea.l    24(a0),a0
[000575b4] 3028 0016                 move.w     22(a0),d0
[000575b8] 916f 000a                 sub.w      d0,10(a7)
[000575bc] 2f39 000e 692a            move.l     _globl,-(a7)
[000575c2] 486f 001e                 pea.l      30(a7)
[000575c6] 486f 0022                 pea.l      34(a7)
[000575ca] 3f2f 001a                 move.w     26(a7),-(a7)
[000575ce] 3f2f 001a                 move.w     26(a7),-(a7)
[000575d2] 3f2f 001a                 move.w     26(a7),-(a7)
[000575d6] 226f 0030                 movea.l    48(a7),a1
[000575da] 43e9 0026                 lea.l      38(a1),a1
[000575de] 206f 0030                 movea.l    48(a7),a0
[000575e2] 41e8 0024                 lea.l      36(a0),a0
[000575e6] 342f 001a                 move.w     26(a7),d2
[000575ea] 246f 0030                 movea.l    48(a7),a2
[000575ee] 322a 0022                 move.w     34(a2),d1
[000575f2] 4240                      clr.w      d0
[000575f4] 4eb9 0007 b8da            jsr        mt_wind_calc
[000575fa] 4fef 0012                 lea.l      18(a7),a7
[000575fe] 6032                      bra.s      $00057632
[00057600] 7008                      moveq.l    #8,d0
[00057602] d06f 001c                 add.w      28(a7),d0
[00057606] e748                      lsl.w      #3,d0
[00057608] 206f 001e                 movea.l    30(a7),a0
[0005760c] 3140 0024                 move.w     d0,36(a0)
[00057610] 7003                      moveq.l    #3,d0
[00057612] d06f 001c                 add.w      28(a7),d0
[00057616] e748                      lsl.w      #3,d0
[00057618] 206f 001e                 movea.l    30(a7),a0
[0005761c] 3140 0026                 move.w     d0,38(a0)
[00057620] 93c9                      suba.l     a1,a1
[00057622] 700e                      moveq.l    #14,d0
[00057624] 206f 001e                 movea.l    30(a7),a0
[00057628] 246f 001e                 movea.l    30(a7),a2
[0005762c] 246a 0004                 movea.l    4(a2),a2
[00057630] 4e92                      jsr        (a2)
[00057632] 206f 001e                 movea.l    30(a7),a0
[00057636] 4eb9 0005 9572            jsr        Awi_oblist
[0005763c] 206f 001e                 movea.l    30(a7),a0
[00057640] 6100 fd34                 bsr        Awi_slider
[00057644] 206f 001e                 movea.l    30(a7),a0
[00057648] 3f68 0058 0018            move.w     88(a0),24(a7)
[0005764e] 302f 0018                 move.w     24(a7),d0
[00057652] 6b00 0096                 bmi        $000576EA
[00057656] 2039 000e 0d26            move.l     Aroot_wi,d0
[0005765c] 6700 008c                 beq        $000576EA
[00057660] 7002                      moveq.l    #2,d0
[00057662] 206f 001e                 movea.l    30(a7),a0
[00057666] c068 0054                 and.w      84(a0),d0
[0005766a] 671e                      beq.s      $0005768A
[0005766c] 226f 001e                 movea.l    30(a7),a1
[00057670] 43e9 0058                 lea.l      88(a1),a1
[00057674] 7066                      moveq.l    #102,d0
[00057676] 2079 000e 0d26            movea.l    Aroot_wi,a0
[0005767c] 2479 000e 0d26            movea.l    Aroot_wi,a2
[00057682] 246a 0004                 movea.l    4(a2),a2
[00057686] 4e92                      jsr        (a2)
[00057688] 601c                      bra.s      $000576A6
[0005768a] 226f 001e                 movea.l    30(a7),a1
[0005768e] 43e9 0058                 lea.l      88(a1),a1
[00057692] 7065                      moveq.l    #101,d0
[00057694] 2079 000e 0d26            movea.l    Aroot_wi,a0
[0005769a] 2479 000e 0d26            movea.l    Aroot_wi,a2
[000576a0] 246a 0004                 movea.l    4(a2),a2
[000576a4] 4e92                      jsr        (a2)
[000576a6] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000576ac] 2028 0014                 move.l     20(a0),d0
[000576b0] 6738                      beq.s      $000576EA
[000576b2] 206f 001e                 movea.l    30(a7),a0
[000576b6] 3028 0058                 move.w     88(a0),d0
[000576ba] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000576c0] 2268 0014                 movea.l    20(a0),a1
[000576c4] 41ef 0010                 lea.l      16(a7),a0
[000576c8] 4eb9 0004 fe06            jsr        Aob_offset
[000576ce] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000576d4] 3028 0034                 move.w     52(a0),d0
[000576d8] d16f 0010                 add.w      d0,16(a7)
[000576dc] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000576e2] 3028 0036                 move.w     54(a0),d0
[000576e6] d16f 0012                 add.w      d0,18(a7)
[000576ea] 302f 0010                 move.w     16(a7),d0
[000576ee] 6a14                      bpl.s      $00057704
[000576f0] 4240                      clr.w      d0
[000576f2] 3f40 0012                 move.w     d0,18(a7)
[000576f6] 3f40 0010                 move.w     d0,16(a7)
[000576fa] 7030                      moveq.l    #48,d0
[000576fc] 3f40 0016                 move.w     d0,22(a7)
[00057700] 3f40 0014                 move.w     d0,20(a7)
[00057704] 4eb9 0005 1388            jsr        Awi_diaend
[0005770a] 7002                      moveq.l    #2,d0
[0005770c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057712] 2068 023c                 movea.l    572(a0),a0
[00057716] c068 000e                 and.w      14(a0),d0
[0005771a] 6740                      beq.s      $0005775C
[0005771c] 206f 001e                 movea.l    30(a7),a0
[00057720] 3f28 002a                 move.w     42(a0),-(a7)
[00057724] 206f 0020                 movea.l    32(a7),a0
[00057728] 3f28 0028                 move.w     40(a0),-(a7)
[0005772c] 206f 0022                 movea.l    34(a7),a0
[00057730] 3f28 0026                 move.w     38(a0),-(a7)
[00057734] 206f 0024                 movea.l    36(a7),a0
[00057738] 3f28 0024                 move.w     36(a0),-(a7)
[0005773c] 3f2f 001e                 move.w     30(a7),-(a7)
[00057740] 2079 000e 692a            movea.l    _globl,a0
[00057746] 342f 001e                 move.w     30(a7),d2
[0005774a] 322f 001c                 move.w     28(a7),d1
[0005774e] 302f 001a                 move.w     26(a7),d0
[00057752] 4eb9 0007 a834            jsr        mt_graf_growbox
[00057758] 4fef 000a                 lea.l      10(a7),a7
[0005775c] 206f 001e                 movea.l    30(a7),a0
[00057760] 3f28 002a                 move.w     42(a0),-(a7)
[00057764] 206f 0020                 movea.l    32(a7),a0
[00057768] 3f28 0028                 move.w     40(a0),-(a7)
[0005776c] 2079 000e 692a            movea.l    _globl,a0
[00057772] 226f 0022                 movea.l    34(a7),a1
[00057776] 3429 0026                 move.w     38(a1),d2
[0005777a] 226f 0022                 movea.l    34(a7),a1
[0005777e] 3229 0024                 move.w     36(a1),d1
[00057782] 302f 0020                 move.w     32(a7),d0
[00057786] 4eb9 0007 b410            jsr        mt_wind_open
[0005778c] 584f                      addq.w     #4,a7
[0005778e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057794] 2068 0280                 movea.l    640(a0),a0
[00057798] 0c50 0300                 cmpi.w     #$0300,(a0)
[0005779c] 6f18                      ble.s      $000577B6
[0005779e] 2079 0010 ee4e            movea.l    ACSblk,a0
[000577a4] 2068 0280                 movea.l    640(a0),a0
[000577a8] 0c50 0400                 cmpi.w     #$0400,(a0)
[000577ac] 6c08                      bge.s      $000577B6
[000577ae] 206f 001e                 movea.l    30(a7),a0
[000577b2] 6100 fbc2                 bsr        Awi_slider
[000577b6] 206f 001e                 movea.l    30(a7),a0
[000577ba] 6100 e4b6                 bsr        Awi_setontop
[000577be] 4297                      clr.l      (a7)
[000577c0] 604a                      bra.s      $0005780C
[000577c2] 7004                      moveq.l    #4,d0
[000577c4] 2057                      movea.l    (a7),a0
[000577c6] c0a8 0002                 and.l      2(a0),d0
[000577ca] 6740                      beq.s      $0005780C
[000577cc] 41f9 000e 0eaa            lea.l      $000E0EAA,a0
[000577d2] 43ef 0022                 lea.l      34(a7),a1
[000577d6] 700f                      moveq.l    #15,d0
[000577d8] 12d8                      move.b     (a0)+,(a1)+
[000577da] 51c8 fffc                 dbf        d0,$000577D8
[000577de] 3f7c 4724 0022            move.w     #$4724,34(a7)
[000577e4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000577ea] 3f50 0024                 move.w     (a0),36(a7)
[000577ee] 3f6f 001c 0028            move.w     28(a7),40(a7)
[000577f4] 2279 000e 692a            movea.l    _globl,a1
[000577fa] 41ef 0022                 lea.l      34(a7),a0
[000577fe] 7210                      moveq.l    #16,d1
[00057800] 2457                      movea.l    (a7),a2
[00057802] 3012                      move.w     (a2),d0
[00057804] 4eb9 0007 8ae8            jsr        mt_appl_write
[0005780a] 600c                      bra.s      $00057818
[0005780c] 2057                      movea.l    (a7),a0
[0005780e] 4eb9 0005 dd58            jsr        Ash_nextdd
[00057814] 2e88                      move.l     a0,(a7)
[00057816] 66aa                      bne.s      $000577C2
[00057818] 206f 001e                 movea.l    30(a7),a0
[0005781c] 2f68 0014 0004            move.l     20(a0),4(a7)
[00057822] 4eb9 0004 b086            jsr        Aev_mess
[00057828] 206f 001e                 movea.l    30(a7),a0
[0005782c] 3028 001c                 move.w     28(a0),d0
[00057830] 6a5c                      bpl.s      $0005788E
[00057832] 7208                      moveq.l    #8,d1
[00057834] 70ff                      moveq.l    #-1,d0
[00057836] 206f 0004                 movea.l    4(a7),a0
[0005783a] 4eb9 0005 0e62            jsr        Aob_findflag
[00057840] 206f 001e                 movea.l    30(a7),a0
[00057844] 3140 001c                 move.w     d0,28(a0)
[00057848] 206f 001e                 movea.l    30(a7),a0
[0005784c] 3028 001c                 move.w     28(a0),d0
[00057850] 6a28                      bpl.s      $0005787A
[00057852] 206f 001e                 movea.l    30(a7),a0
[00057856] 2028 0018                 move.l     24(a0),d0
[0005785a] 671e                      beq.s      $0005787A
[0005785c] 7208                      moveq.l    #8,d1
[0005785e] 70ff                      moveq.l    #-1,d0
[00057860] 206f 001e                 movea.l    30(a7),a0
[00057864] 2068 0018                 movea.l    24(a0),a0
[00057868] 4eb9 0005 0e62            jsr        Aob_findflag
[0005786e] 807c 1000                 or.w       #$1000,d0
[00057872] 206f 001e                 movea.l    30(a7),a0
[00057876] 3140 001c                 move.w     d0,28(a0)
[0005787a] 206f 001e                 movea.l    30(a7),a0
[0005787e] 3028 001c                 move.w     28(a0),d0
[00057882] 6f0a                      ble.s      $0005788E
[00057884] 206f 001e                 movea.l    30(a7),a0
[00057888] 317c ffff 001e            move.w     #$FFFF,30(a0)
[0005788e] 4eb9 0005 147c            jsr        Awi_diastart
[00057894] 4240                      clr.w      d0
[00057896] 4fef 0032                 lea.l      50(a7),a7
[0005789a] 245f                      movea.l    (a7)+,a2
[0005789c] 4e75                      rts
Awi_register:
[0005789e] 2f0a                      move.l     a2,-(a7)
[000578a0] 4fef ffdc                 lea.l      -36(a7),a7
[000578a4] 2f48 0010                 move.l     a0,16(a7)
[000578a8] 41f9 000e 0eba            lea.l      $000E0EBA,a0
[000578ae] 43ef 0004                 lea.l      4(a7),a1
[000578b2] 22d8                      move.l     (a0)+,(a1)+
[000578b4] 22d8                      move.l     (a0)+,(a1)+
[000578b6] 206f 0010                 movea.l    16(a7),a0
[000578ba] 3028 0020                 move.w     32(a0),d0
[000578be] 6a06                      bpl.s      $000578C6
[000578c0] 70ff                      moveq.l    #-1,d0
[000578c2] 6000 0278                 bra        $00057B3C
[000578c6] 7004                      moveq.l    #4,d0
[000578c8] 206f 0010                 movea.l    16(a7),a0
[000578cc] c068 0056                 and.w      86(a0),d0
[000578d0] 6722                      beq.s      $000578F4
[000578d2] 206f 0010                 movea.l    16(a7),a0
[000578d6] 0268 fffb 0056            andi.w     #$FFFB,86(a0)
[000578dc] 206f 0010                 movea.l    16(a7),a0
[000578e0] 226f 0010                 movea.l    16(a7),a1
[000578e4] 2269 0010                 movea.l    16(a1),a1
[000578e8] 4e91                      jsr        (a1)
[000578ea] 4a40                      tst.w      d0
[000578ec] 6706                      beq.s      $000578F4
[000578ee] 70ff                      moveq.l    #-1,d0
[000578f0] 6000 024a                 bra        $00057B3C
[000578f4] 206f 0010                 movea.l    16(a7),a0
[000578f8] 0268 f7ff 0056            andi.w     #$F7FF,86(a0)
[000578fe] 206f 0010                 movea.l    16(a7),a0
[00057902] 2028 0014                 move.l     20(a0),d0
[00057906] 6614                      bne.s      $0005791C
[00057908] 41f9 000e 0d0e            lea.l      empty,a0
[0005790e] 4eb9 0004 f064            jsr        Aob_create
[00057914] 226f 0010                 movea.l    16(a7),a1
[00057918] 2348 0014                 move.l     a0,20(a1)
[0005791c] 206f 0010                 movea.l    16(a7),a0
[00057920] 3f68 0020 000e            move.w     32(a0),14(a7)
[00057926] 302f 000e                 move.w     14(a7),d0
[0005792a] e548                      lsl.w      #2,d0
[0005792c] 41f9 0011 3af2            lea.l      gemmap,a0
[00057932] 21af 0010 0000            move.l     16(a7),0(a0,d0.w)
[00057938] 206f 0010                 movea.l    16(a7),a0
[0005793c] 3028 0054                 move.w     84(a0),d0
[00057940] c07c 0100                 and.w      #$0100,d0
[00057944] 6718                      beq.s      $0005795E
[00057946] 4267                      clr.w      -(a7)
[00057948] 4267                      clr.w      -(a7)
[0005794a] 4267                      clr.w      -(a7)
[0005794c] 7001                      moveq.l    #1,d0
[0005794e] 3f00                      move.w     d0,-(a7)
[00057950] 7218                      moveq.l    #24,d1
[00057952] 302f 0016                 move.w     22(a7),d0
[00057956] 4eb9 0007 f926            jsr        wind_set
[0005795c] 504f                      addq.w     #8,a7
[0005795e] 4267                      clr.w      -(a7)
[00057960] 4267                      clr.w      -(a7)
[00057962] 206f 0014                 movea.l    20(a7),a0
[00057966] 2f28 004a                 move.l     74(a0),-(a7)
[0005796a] 7202                      moveq.l    #2,d1
[0005796c] 302f 0016                 move.w     22(a7),d0
[00057970] 4eb9 0007 f926            jsr        wind_set
[00057976] 504f                      addq.w     #8,a7
[00057978] 4267                      clr.w      -(a7)
[0005797a] 4267                      clr.w      -(a7)
[0005797c] 206f 0014                 movea.l    20(a7),a0
[00057980] 2f28 004e                 move.l     78(a0),-(a7)
[00057984] 7203                      moveq.l    #3,d1
[00057986] 302f 0016                 move.w     22(a7),d0
[0005798a] 4eb9 0007 f926            jsr        wind_set
[00057990] 504f                      addq.w     #8,a7
[00057992] 206f 0010                 movea.l    16(a7),a0
[00057996] 3f68 0058 000c            move.w     88(a0),12(a7)
[0005799c] 302f 000c                 move.w     12(a7),d0
[000579a0] 6b00 0096                 bmi        $00057A38
[000579a4] 2039 000e 0d26            move.l     Aroot_wi,d0
[000579aa] 6700 008c                 beq        $00057A38
[000579ae] 7002                      moveq.l    #2,d0
[000579b0] 206f 0010                 movea.l    16(a7),a0
[000579b4] c068 0054                 and.w      84(a0),d0
[000579b8] 671e                      beq.s      $000579D8
[000579ba] 226f 0010                 movea.l    16(a7),a1
[000579be] 43e9 0058                 lea.l      88(a1),a1
[000579c2] 7066                      moveq.l    #102,d0
[000579c4] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000579ca] 2479 000e 0d26            movea.l    Aroot_wi,a2
[000579d0] 246a 0004                 movea.l    4(a2),a2
[000579d4] 4e92                      jsr        (a2)
[000579d6] 601c                      bra.s      $000579F4
[000579d8] 226f 0010                 movea.l    16(a7),a1
[000579dc] 43e9 0058                 lea.l      88(a1),a1
[000579e0] 7065                      moveq.l    #101,d0
[000579e2] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000579e8] 2479 000e 0d26            movea.l    Aroot_wi,a2
[000579ee] 246a 0004                 movea.l    4(a2),a2
[000579f2] 4e92                      jsr        (a2)
[000579f4] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000579fa] 2028 0014                 move.l     20(a0),d0
[000579fe] 6738                      beq.s      $00057A38
[00057a00] 206f 0010                 movea.l    16(a7),a0
[00057a04] 3028 0058                 move.w     88(a0),d0
[00057a08] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00057a0e] 2268 0014                 movea.l    20(a0),a1
[00057a12] 41ef 0004                 lea.l      4(a7),a0
[00057a16] 4eb9 0004 fe06            jsr        Aob_offset
[00057a1c] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00057a22] 3028 0034                 move.w     52(a0),d0
[00057a26] d16f 0004                 add.w      d0,4(a7)
[00057a2a] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00057a30] 3028 0036                 move.w     54(a0),d0
[00057a34] d16f 0006                 add.w      d0,6(a7)
[00057a38] 302f 0004                 move.w     4(a7),d0
[00057a3c] 6a14                      bpl.s      $00057A52
[00057a3e] 4240                      clr.w      d0
[00057a40] 3f40 0006                 move.w     d0,6(a7)
[00057a44] 3f40 0004                 move.w     d0,4(a7)
[00057a48] 7030                      moveq.l    #48,d0
[00057a4a] 3f40 000a                 move.w     d0,10(a7)
[00057a4e] 3f40 0008                 move.w     d0,8(a7)
[00057a52] 4eb9 0005 1388            jsr        Awi_diaend
[00057a58] 7002                      moveq.l    #2,d0
[00057a5a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057a60] 2068 023c                 movea.l    572(a0),a0
[00057a64] c068 000e                 and.w      14(a0),d0
[00057a68] 6740                      beq.s      $00057AAA
[00057a6a] 206f 0010                 movea.l    16(a7),a0
[00057a6e] 3f28 002a                 move.w     42(a0),-(a7)
[00057a72] 206f 0012                 movea.l    18(a7),a0
[00057a76] 3f28 0028                 move.w     40(a0),-(a7)
[00057a7a] 206f 0014                 movea.l    20(a7),a0
[00057a7e] 3f28 0026                 move.w     38(a0),-(a7)
[00057a82] 206f 0016                 movea.l    22(a7),a0
[00057a86] 3f28 0024                 move.w     36(a0),-(a7)
[00057a8a] 3f2f 0012                 move.w     18(a7),-(a7)
[00057a8e] 2079 000e 692a            movea.l    _globl,a0
[00057a94] 342f 0012                 move.w     18(a7),d2
[00057a98] 322f 0010                 move.w     16(a7),d1
[00057a9c] 302f 000e                 move.w     14(a7),d0
[00057aa0] 4eb9 0007 a834            jsr        mt_graf_growbox
[00057aa6] 4fef 000a                 lea.l      10(a7),a7
[00057aaa] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057ab0] 2068 0280                 movea.l    640(a0),a0
[00057ab4] 0c50 0300                 cmpi.w     #$0300,(a0)
[00057ab8] 6f18                      ble.s      $00057AD2
[00057aba] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057ac0] 2068 0280                 movea.l    640(a0),a0
[00057ac4] 0c50 0400                 cmpi.w     #$0400,(a0)
[00057ac8] 6c08                      bge.s      $00057AD2
[00057aca] 206f 0010                 movea.l    16(a7),a0
[00057ace] 6100 f8a6                 bsr        Awi_slider
[00057ad2] 206f 0010                 movea.l    16(a7),a0
[00057ad6] 6100 e19a                 bsr        Awi_setontop
[00057ada] 4297                      clr.l      (a7)
[00057adc] 604a                      bra.s      $00057B28
[00057ade] 7004                      moveq.l    #4,d0
[00057ae0] 2057                      movea.l    (a7),a0
[00057ae2] c0a8 0002                 and.l      2(a0),d0
[00057ae6] 6740                      beq.s      $00057B28
[00057ae8] 41f9 000e 0ec2            lea.l      $000E0EC2,a0
[00057aee] 43ef 0014                 lea.l      20(a7),a1
[00057af2] 700f                      moveq.l    #15,d0
[00057af4] 12d8                      move.b     (a0)+,(a1)+
[00057af6] 51c8 fffc                 dbf        d0,$00057AF4
[00057afa] 3f7c 4724 0014            move.w     #$4724,20(a7)
[00057b00] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057b06] 3f50 0016                 move.w     (a0),22(a7)
[00057b0a] 3f6f 000e 001a            move.w     14(a7),26(a7)
[00057b10] 2279 000e 692a            movea.l    _globl,a1
[00057b16] 41ef 0014                 lea.l      20(a7),a0
[00057b1a] 7210                      moveq.l    #16,d1
[00057b1c] 2457                      movea.l    (a7),a2
[00057b1e] 3012                      move.w     (a2),d0
[00057b20] 4eb9 0007 8ae8            jsr        mt_appl_write
[00057b26] 600c                      bra.s      $00057B34
[00057b28] 2057                      movea.l    (a7),a0
[00057b2a] 4eb9 0005 dd58            jsr        Ash_nextdd
[00057b30] 2e88                      move.l     a0,(a7)
[00057b32] 66aa                      bne.s      $00057ADE
[00057b34] 4eb9 0004 b086            jsr        Aev_mess
[00057b3a] 4240                      clr.w      d0
[00057b3c] 4fef 0024                 lea.l      36(a7),a7
[00057b40] 245f                      movea.l    (a7)+,a2
[00057b42] 4e75                      rts
Awi_backdrop:
[00057b44] 594f                      subq.w     #4,a7
[00057b46] 2e88                      move.l     a0,(a7)
[00057b48] 2057                      movea.l    (a7),a0
[00057b4a] 3028 0020                 move.w     32(a0),d0
[00057b4e] 6e04                      bgt.s      $00057B54
[00057b50] 4240                      clr.w      d0
[00057b52] 602a                      bra.s      $00057B7E
[00057b54] 2057                      movea.l    (a7),a0
[00057b56] 3028 0056                 move.w     86(a0),d0
[00057b5a] c07c 0400                 and.w      #$0400,d0
[00057b5e] 6702                      beq.s      $00057B62
[00057b60] 601a                      bra.s      $00057B7C
[00057b62] 4267                      clr.w      -(a7)
[00057b64] 4267                      clr.w      -(a7)
[00057b66] 4267                      clr.w      -(a7)
[00057b68] 4267                      clr.w      -(a7)
[00057b6a] 7219                      moveq.l    #25,d1
[00057b6c] 206f 0008                 movea.l    8(a7),a0
[00057b70] 3028 0020                 move.w     32(a0),d0
[00057b74] 4eb9 0007 f926            jsr        wind_set
[00057b7a] 504f                      addq.w     #8,a7
[00057b7c] 4240                      clr.w      d0
[00057b7e] 584f                      addq.w     #4,a7
[00057b80] 4e75                      rts
Awi_modal:
[00057b82] 554f                      subq.w     #2,a7
[00057b84] 3ebc 0007                 move.w     #$0007,(a7)
[00057b88] 6022                      bra.s      $00057BAC
[00057b8a] 3017                      move.w     (a7),d0
[00057b8c] e548                      lsl.w      #2,d0
[00057b8e] 41f9 0011 3cf2            lea.l      modwins,a0
[00057b94] 2030 0000                 move.l     0(a0,d0.w),d0
[00057b98] 6710                      beq.s      $00057BAA
[00057b9a] 3017                      move.w     (a7),d0
[00057b9c] e548                      lsl.w      #2,d0
[00057b9e] 41f9 0011 3cf2            lea.l      modwins,a0
[00057ba4] 2070 0000                 movea.l    0(a0,d0.w),a0
[00057ba8] 6008                      bra.s      $00057BB2
[00057baa] 5357                      subq.w     #1,(a7)
[00057bac] 3017                      move.w     (a7),d0
[00057bae] 6ada                      bpl.s      $00057B8A
[00057bb0] 91c8                      suba.l     a0,a0
[00057bb2] 544f                      addq.w     #2,a7
[00057bb4] 4e75                      rts
Awi_up_modal:
[00057bb6] 2f0a                      move.l     a2,-(a7)
[00057bb8] 5d4f                      subq.w     #6,a7
[00057bba] 6100 ffc6                 bsr.w      Awi_modal
[00057bbe] 2f48 0002                 move.l     a0,2(a7)
[00057bc2] 202f 0002                 move.l     2(a7),d0
[00057bc6] 6604                      bne.s      $00057BCC
[00057bc8] 6000 023c                 bra        $00057E06
[00057bcc] 42a7                      clr.l      -(a7)
[00057bce] 42a7                      clr.l      -(a7)
[00057bd0] 42a7                      clr.l      -(a7)
[00057bd2] 486f 000c                 pea.l      12(a7)
[00057bd6] 720a                      moveq.l    #10,d1
[00057bd8] 4240                      clr.w      d0
[00057bda] 4eb9 0007 f7ba            jsr        wind_get
[00057be0] 4fef 0010                 lea.l      16(a7),a7
[00057be4] 206f 0002                 movea.l    2(a7),a0
[00057be8] 3028 0020                 move.w     32(a0),d0
[00057bec] b057                      cmp.w      (a7),d0
[00057bee] 6746                      beq.s      $00057C36
[00057bf0] 4267                      clr.w      -(a7)
[00057bf2] 4267                      clr.w      -(a7)
[00057bf4] 4267                      clr.w      -(a7)
[00057bf6] 4267                      clr.w      -(a7)
[00057bf8] 720a                      moveq.l    #10,d1
[00057bfa] 206f 000a                 movea.l    10(a7),a0
[00057bfe] 3028 0020                 move.w     32(a0),d0
[00057c02] 4eb9 0007 f926            jsr        wind_set
[00057c08] 504f                      addq.w     #8,a7
[00057c0a] 206f 0002                 movea.l    2(a7),a0
[00057c0e] 0068 0010 0056            ori.w      #$0010,86(a0)
[00057c14] 226f 0002                 movea.l    2(a7),a1
[00057c18] 43e9 0024                 lea.l      36(a1),a1
[00057c1c] 206f 0002                 movea.l    2(a7),a0
[00057c20] 246f 0002                 movea.l    2(a7),a2
[00057c24] 246a 0086                 movea.l    134(a2),a2
[00057c28] 4e92                      jsr        (a2)
[00057c2a] 206f 0002                 movea.l    2(a7),a0
[00057c2e] 6100 e042                 bsr        Awi_setontop
[00057c32] 6000 01d2                 bra        $00057E06
[00057c36] 7010                      moveq.l    #16,d0
[00057c38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057c3e] 2068 023c                 movea.l    572(a0),a0
[00057c42] c068 000e                 and.w      14(a0),d0
[00057c46] 6600 01a2                 bne        $00057DEA
[00057c4a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057c50] 3228 0264                 move.w     612(a0),d1
[00057c54] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057c5a] 3028 0262                 move.w     610(a0),d0
[00057c5e] 206f 0002                 movea.l    2(a7),a0
[00057c62] 41e8 0034                 lea.l      52(a0),a0
[00057c66] 4eb9 0006 b7a6            jsr        Aob_within
[00057c6c] 4a40                      tst.w      d0
[00057c6e] 6600 0178                 bne        $00057DE8
[00057c72] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057c78] 3028 000c                 move.w     12(a0),d0
[00057c7c] 206f 0002                 movea.l    2(a7),a0
[00057c80] 9068 0028                 sub.w      40(a0),d0
[00057c84] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057c8a] 3228 0262                 move.w     610(a0),d1
[00057c8e] 206f 0002                 movea.l    2(a7),a0
[00057c92] 3428 0028                 move.w     40(a0),d2
[00057c96] e242                      asr.w      #1,d2
[00057c98] 9242                      sub.w      d2,d1
[00057c9a] b041                      cmp.w      d1,d0
[00057c9c] 6c14                      bge.s      $00057CB2
[00057c9e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057ca4] 3028 000c                 move.w     12(a0),d0
[00057ca8] 206f 0002                 movea.l    2(a7),a0
[00057cac] 9068 0028                 sub.w      40(a0),d0
[00057cb0] 6016                      bra.s      $00057CC8
[00057cb2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057cb8] 3028 0262                 move.w     610(a0),d0
[00057cbc] 206f 0002                 movea.l    2(a7),a0
[00057cc0] 3228 0028                 move.w     40(a0),d1
[00057cc4] e241                      asr.w      #1,d1
[00057cc6] 9041                      sub.w      d1,d0
[00057cc8] 206f 0002                 movea.l    2(a7),a0
[00057ccc] 3140 0024                 move.w     d0,36(a0)
[00057cd0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057cd6] 3028 000a                 move.w     10(a0),d0
[00057cda] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057ce0] d068 000e                 add.w      14(a0),d0
[00057ce4] 206f 0002                 movea.l    2(a7),a0
[00057ce8] 9068 002a                 sub.w      42(a0),d0
[00057cec] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057cf2] 3228 0264                 move.w     612(a0),d1
[00057cf6] 206f 0002                 movea.l    2(a7),a0
[00057cfa] 3428 002a                 move.w     42(a0),d2
[00057cfe] e242                      asr.w      #1,d2
[00057d00] 9242                      sub.w      d2,d1
[00057d02] b041                      cmp.w      d1,d0
[00057d04] 6c1e                      bge.s      $00057D24
[00057d06] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057d0c] 3028 000a                 move.w     10(a0),d0
[00057d10] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057d16] d068 000e                 add.w      14(a0),d0
[00057d1a] 206f 0002                 movea.l    2(a7),a0
[00057d1e] 9068 002a                 sub.w      42(a0),d0
[00057d22] 6016                      bra.s      $00057D3A
[00057d24] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057d2a] 3028 0264                 move.w     612(a0),d0
[00057d2e] 206f 0002                 movea.l    2(a7),a0
[00057d32] 3228 002a                 move.w     42(a0),d1
[00057d36] e241                      asr.w      #1,d1
[00057d38] 9041                      sub.w      d1,d0
[00057d3a] 206f 0002                 movea.l    2(a7),a0
[00057d3e] 3140 0026                 move.w     d0,38(a0)
[00057d42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057d48] 3028 0008                 move.w     8(a0),d0
[00057d4c] 206f 0002                 movea.l    2(a7),a0
[00057d50] b068 0024                 cmp.w      36(a0),d0
[00057d54] 6f0c                      ble.s      $00057D62
[00057d56] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057d5c] 3028 0008                 move.w     8(a0),d0
[00057d60] 6008                      bra.s      $00057D6A
[00057d62] 206f 0002                 movea.l    2(a7),a0
[00057d66] 3028 0024                 move.w     36(a0),d0
[00057d6a] 206f 0002                 movea.l    2(a7),a0
[00057d6e] 3140 0024                 move.w     d0,36(a0)
[00057d72] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057d78] 3028 000a                 move.w     10(a0),d0
[00057d7c] 206f 0002                 movea.l    2(a7),a0
[00057d80] b068 0026                 cmp.w      38(a0),d0
[00057d84] 6f0c                      ble.s      $00057D92
[00057d86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057d8c] 3028 000a                 move.w     10(a0),d0
[00057d90] 6008                      bra.s      $00057D9A
[00057d92] 206f 0002                 movea.l    2(a7),a0
[00057d96] 3028 0026                 move.w     38(a0),d0
[00057d9a] 206f 0002                 movea.l    2(a7),a0
[00057d9e] 3140 0026                 move.w     d0,38(a0)
[00057da2] 206f 0002                 movea.l    2(a7),a0
[00057da6] 0268 fffe 0056            andi.w     #$FFFE,86(a0)
[00057dac] 206f 0002                 movea.l    2(a7),a0
[00057db0] 4eb9 0005 8ddc            jsr        Awi_cleanup
[00057db6] 206f 0002                 movea.l    2(a7),a0
[00057dba] 3f28 002a                 move.w     42(a0),-(a7)
[00057dbe] 206f 0004                 movea.l    4(a7),a0
[00057dc2] 3f28 0028                 move.w     40(a0),-(a7)
[00057dc6] 206f 0006                 movea.l    6(a7),a0
[00057dca] 3f28 0026                 move.w     38(a0),-(a7)
[00057dce] 206f 0008                 movea.l    8(a7),a0
[00057dd2] 3f28 0024                 move.w     36(a0),-(a7)
[00057dd6] 7205                      moveq.l    #5,d1
[00057dd8] 206f 000a                 movea.l    10(a7),a0
[00057ddc] 3028 0020                 move.w     32(a0),d0
[00057de0] 4eb9 0007 f926            jsr        wind_set
[00057de6] 504f                      addq.w     #8,a7
[00057de8] 601c                      bra.s      $00057E06
[00057dea] 7004                      moveq.l    #4,d0
[00057dec] 2079 0010 ee4e            movea.l    ACSblk,a0
[00057df2] 2068 023c                 movea.l    572(a0),a0
[00057df6] c068 000e                 and.w      14(a0),d0
[00057dfa] 670a                      beq.s      $00057E06
[00057dfc] 7207                      moveq.l    #7,d1
[00057dfe] 7002                      moveq.l    #2,d0
[00057e00] 4eb9 0008 0b1a            jsr        Bconout
[00057e06] 5c4f                      addq.w     #6,a7
[00057e08] 245f                      movea.l    (a7)+,a2
[00057e0a] 4e75                      rts
Awi_set_modal:
[00057e0c] 4fef fff6                 lea.l      -10(a7),a7
[00057e10] 2f48 0006                 move.l     a0,6(a7)
[00057e14] 3f40 0004                 move.w     d0,4(a7)
[00057e18] 302f 0004                 move.w     4(a7),d0
[00057e1c] 6700 009c                 beq        $00057EBA
[00057e20] 426f 0002                 clr.w      2(a7)
[00057e24] 602a                      bra.s      $00057E50
[00057e26] 302f 0002                 move.w     2(a7),d0
[00057e2a] e548                      lsl.w      #2,d0
[00057e2c] 41f9 0011 3cf2            lea.l      modwins,a0
[00057e32] 2030 0000                 move.l     0(a0,d0.w),d0
[00057e36] 6614                      bne.s      $00057E4C
[00057e38] 302f 0002                 move.w     2(a7),d0
[00057e3c] e548                      lsl.w      #2,d0
[00057e3e] 41f9 0011 3cf2            lea.l      modwins,a0
[00057e44] 21af 0006 0000            move.l     6(a7),0(a0,d0.w)
[00057e4a] 600c                      bra.s      $00057E58
[00057e4c] 526f 0002                 addq.w     #1,2(a7)
[00057e50] 0c6f 0008 0002            cmpi.w     #$0008,2(a7)
[00057e56] 6dce                      blt.s      $00057E26
[00057e58] 0c6f 0008 0002            cmpi.w     #$0008,2(a7)
[00057e5e] 6606                      bne.s      $00057E66
[00057e60] 70ff                      moveq.l    #-1,d0
[00057e62] 6000 00b2                 bra        $00057F16
[00057e66] 302f 0002                 move.w     2(a7),d0
[00057e6a] 6608                      bne.s      $00057E74
[00057e6c] 4240                      clr.w      d0
[00057e6e] 4eb9 0005 7f1c            jsr        Awi_show_menu
[00057e74] 42a7                      clr.l      -(a7)
[00057e76] 42a7                      clr.l      -(a7)
[00057e78] 42a7                      clr.l      -(a7)
[00057e7a] 486f 000c                 pea.l      12(a7)
[00057e7e] 720a                      moveq.l    #10,d1
[00057e80] 4240                      clr.w      d0
[00057e82] 4eb9 0007 f7ba            jsr        wind_get
[00057e88] 4fef 0010                 lea.l      16(a7),a7
[00057e8c] 206f 0006                 movea.l    6(a7),a0
[00057e90] 3028 0020                 move.w     32(a0),d0
[00057e94] 6f1a                      ble.s      $00057EB0
[00057e96] 206f 0006                 movea.l    6(a7),a0
[00057e9a] 3017                      move.w     (a7),d0
[00057e9c] b068 0020                 cmp.w      32(a0),d0
[00057ea0] 670e                      beq.s      $00057EB0
[00057ea2] 206f 0006                 movea.l    6(a7),a0
[00057ea6] 226f 0006                 movea.l    6(a7),a1
[00057eaa] 2269 006e                 movea.l    110(a1),a1
[00057eae] 4e91                      jsr        (a1)
[00057eb0] 206f 0006                 movea.l    6(a7),a0
[00057eb4] 6100 ddbc                 bsr        Awi_setontop
[00057eb8] 605a                      bra.s      $00057F14
[00057eba] 206f 0006                 movea.l    6(a7),a0
[00057ebe] 3028 0056                 move.w     86(a0),d0
[00057ec2] c07c 0400                 and.w      #$0400,d0
[00057ec6] 6604                      bne.s      $00057ECC
[00057ec8] 4240                      clr.w      d0
[00057eca] 604a                      bra.s      $00057F16
[00057ecc] 3f7c 0007 0002            move.w     #$0007,2(a7)
[00057ed2] 602c                      bra.s      $00057F00
[00057ed4] 302f 0002                 move.w     2(a7),d0
[00057ed8] e548                      lsl.w      #2,d0
[00057eda] 41f9 0011 3cf2            lea.l      modwins,a0
[00057ee0] 2070 0000                 movea.l    0(a0,d0.w),a0
[00057ee4] b1ef 0006                 cmpa.l     6(a7),a0
[00057ee8] 6612                      bne.s      $00057EFC
[00057eea] 302f 0002                 move.w     2(a7),d0
[00057eee] e548                      lsl.w      #2,d0
[00057ef0] 41f9 0011 3cf2            lea.l      modwins,a0
[00057ef6] 42b0 0000                 clr.l      0(a0,d0.w)
[00057efa] 600a                      bra.s      $00057F06
[00057efc] 536f 0002                 subq.w     #1,2(a7)
[00057f00] 302f 0002                 move.w     2(a7),d0
[00057f04] 6ace                      bpl.s      $00057ED4
[00057f06] 302f 0002                 move.w     2(a7),d0
[00057f0a] 6608                      bne.s      $00057F14
[00057f0c] 7001                      moveq.l    #1,d0
[00057f0e] 4eb9 0005 7f1c            jsr        Awi_show_menu
[00057f14] 4240                      clr.w      d0
[00057f16] 4fef 000a                 lea.l      10(a7),a7
[00057f1a] 4e75                      rts
Awi_show_menu:
[00057f1c] 2f03                      move.l     d3,-(a7)
[00057f1e] 2f04                      move.l     d4,-(a7)
[00057f20] 514f                      subq.w     #8,a7
[00057f22] 3f40 0006                 move.w     d0,6(a7)
[00057f26] 3039 0011 4528            move.w     _ACSv_wmenu,d0
[00057f2c] 6714                      beq.s      $00057F42
[00057f2e] 2039 000e 0d26            move.l     Aroot_wi,d0
[00057f34] 670c                      beq.s      $00057F42
[00057f36] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00057f3c] 2028 005e                 move.l     94(a0),d0
[00057f40] 6604                      bne.s      $00057F46
[00057f42] 6000 0228                 bra        $0005816C
[00057f46] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00057f4c] 2ea8 005e                 move.l     94(a0),(a7)
[00057f50] 302f 0006                 move.w     6(a7),d0
[00057f54] 6700 00dc                 beq        $00058032
[00057f58] 6100 fc28                 bsr        Awi_modal
[00057f5c] 2008                      move.l     a0,d0
[00057f5e] 660a                      bne.s      $00057F6A
[00057f60] 4eb9 0006 c076            jsr        A_isModDia
[00057f66] 4a40                      tst.w      d0
[00057f68] 6704                      beq.s      $00057F6E
[00057f6a] 6000 0200                 bra        $0005816C
[00057f6e] 2279 000e 692a            movea.l    _globl,a1
[00057f74] 4240                      clr.w      d0
[00057f76] 91c8                      suba.l     a0,a0
[00057f78] 4eb9 0007 9632            jsr        mt_menu_bar
[00057f7e] 2057                      movea.l    (a7),a0
[00057f80] 3828 0002                 move.w     2(a0),d4
[00057f84] 48c4                      ext.l      d4
[00057f86] 2604                      move.l     d4,d3
[00057f88] d683                      add.l      d3,d3
[00057f8a] d684                      add.l      d4,d3
[00057f8c] e78b                      lsl.l      #3,d3
[00057f8e] 2057                      movea.l    (a7),a0
[00057f90] 3630 3800                 move.w     0(a0,d3.l),d3
[00057f94] 48c3                      ext.l      d3
[00057f96] 2403                      move.l     d3,d2
[00057f98] d482                      add.l      d2,d2
[00057f9a] d483                      add.l      d3,d2
[00057f9c] e78a                      lsl.l      #3,d2
[00057f9e] 2057                      movea.l    (a7),a0
[00057fa0] 3430 2802                 move.w     2(a0,d2.l),d2
[00057fa4] 48c2                      ext.l      d2
[00057fa6] 2202                      move.l     d2,d1
[00057fa8] d281                      add.l      d1,d1
[00057faa] d282                      add.l      d2,d1
[00057fac] e789                      lsl.l      #3,d1
[00057fae] 2057                      movea.l    (a7),a0
[00057fb0] 3230 1802                 move.w     2(a0,d1.l),d1
[00057fb4] 48c1                      ext.l      d1
[00057fb6] 2001                      move.l     d1,d0
[00057fb8] d080                      add.l      d0,d0
[00057fba] d081                      add.l      d1,d0
[00057fbc] e788                      lsl.l      #3,d0
[00057fbe] 2057                      movea.l    (a7),a0
[00057fc0] 0270 fff7 080a            andi.w     #$FFF7,10(a0,d0.l)
[00057fc6] 2057                      movea.l    (a7),a0
[00057fc8] 3228 0032                 move.w     50(a0),d1
[00057fcc] 48c1                      ext.l      d1
[00057fce] 2001                      move.l     d1,d0
[00057fd0] d080                      add.l      d0,d0
[00057fd2] d081                      add.l      d1,d0
[00057fd4] e788                      lsl.l      #3,d0
[00057fd6] 2057                      movea.l    (a7),a0
[00057fd8] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
[00057fde] 602c                      bra.s      $0005800C
[00057fe0] 322f 0004                 move.w     4(a7),d1
[00057fe4] 48c1                      ext.l      d1
[00057fe6] 2001                      move.l     d1,d0
[00057fe8] d080                      add.l      d0,d0
[00057fea] d081                      add.l      d1,d0
[00057fec] e788                      lsl.l      #3,d0
[00057fee] 2057                      movea.l    (a7),a0
[00057ff0] 0270 fff7 080a            andi.w     #$FFF7,10(a0,d0.l)
[00057ff6] 322f 0004                 move.w     4(a7),d1
[00057ffa] 48c1                      ext.l      d1
[00057ffc] 2001                      move.l     d1,d0
[00057ffe] d080                      add.l      d0,d0
[00058000] d081                      add.l      d1,d0
[00058002] e788                      lsl.l      #3,d0
[00058004] 2057                      movea.l    (a7),a0
[00058006] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
[0005800c] 0c6f 0002 0004            cmpi.w     #$0002,4(a7)
[00058012] 66cc                      bne.s      $00057FE0
[00058014] 2057                      movea.l    (a7),a0
[00058016] 3179 000e 0cfc 0044       move.w     menu_width,68(a0)
[0005801e] 2279 000e 692a            movea.l    _globl,a1
[00058024] 7001                      moveq.l    #1,d0
[00058026] 2057                      movea.l    (a7),a0
[00058028] 4eb9 0007 9632            jsr        mt_menu_bar
[0005802e] 6000 013c                 bra        $0005816C
[00058032] 6100 fb4e                 bsr        Awi_modal
[00058036] 2008                      move.l     a0,d0
[00058038] 660e                      bne.s      $00058048
[0005803a] 4eb9 0006 c076            jsr        A_isModDia
[00058040] 4a40                      tst.w      d0
[00058042] 6604                      bne.s      $00058048
[00058044] 6000 0126                 bra        $0005816C
[00058048] 2279 000e 692a            movea.l    _globl,a1
[0005804e] 4240                      clr.w      d0
[00058050] 91c8                      suba.l     a0,a0
[00058052] 4eb9 0007 9632            jsr        mt_menu_bar
[00058058] 2057                      movea.l    (a7),a0
[0005805a] 3828 0002                 move.w     2(a0),d4
[0005805e] 48c4                      ext.l      d4
[00058060] 2604                      move.l     d4,d3
[00058062] d683                      add.l      d3,d3
[00058064] d684                      add.l      d4,d3
[00058066] e78b                      lsl.l      #3,d3
[00058068] 2057                      movea.l    (a7),a0
[0005806a] 3630 3800                 move.w     0(a0,d3.l),d3
[0005806e] 48c3                      ext.l      d3
[00058070] 2403                      move.l     d3,d2
[00058072] d482                      add.l      d2,d2
[00058074] d483                      add.l      d3,d2
[00058076] e78a                      lsl.l      #3,d2
[00058078] 2057                      movea.l    (a7),a0
[0005807a] 3430 2802                 move.w     2(a0,d2.l),d2
[0005807e] 48c2                      ext.l      d2
[00058080] 2202                      move.l     d2,d1
[00058082] d281                      add.l      d1,d1
[00058084] d282                      add.l      d2,d1
[00058086] e789                      lsl.l      #3,d1
[00058088] 2057                      movea.l    (a7),a0
[0005808a] 3230 1802                 move.w     2(a0,d1.l),d1
[0005808e] 48c1                      ext.l      d1
[00058090] 2001                      move.l     d1,d0
[00058092] d080                      add.l      d0,d0
[00058094] d081                      add.l      d1,d0
[00058096] e788                      lsl.l      #3,d0
[00058098] 2057                      movea.l    (a7),a0
[0005809a] 0070 0008 080a            ori.w      #$0008,10(a0,d0.l)
[000580a0] 2057                      movea.l    (a7),a0
[000580a2] 3828 0002                 move.w     2(a0),d4
[000580a6] 48c4                      ext.l      d4
[000580a8] 2604                      move.l     d4,d3
[000580aa] d683                      add.l      d3,d3
[000580ac] d684                      add.l      d4,d3
[000580ae] e78b                      lsl.l      #3,d3
[000580b0] 2057                      movea.l    (a7),a0
[000580b2] 3630 3800                 move.w     0(a0,d3.l),d3
[000580b6] 48c3                      ext.l      d3
[000580b8] 2403                      move.l     d3,d2
[000580ba] d482                      add.l      d2,d2
[000580bc] d483                      add.l      d3,d2
[000580be] e78a                      lsl.l      #3,d2
[000580c0] 2057                      movea.l    (a7),a0
[000580c2] 3430 2802                 move.w     2(a0,d2.l),d2
[000580c6] 48c2                      ext.l      d2
[000580c8] 2202                      move.l     d2,d1
[000580ca] d281                      add.l      d1,d1
[000580cc] d282                      add.l      d2,d1
[000580ce] e789                      lsl.l      #3,d1
[000580d0] 2057                      movea.l    (a7),a0
[000580d2] 3230 1802                 move.w     2(a0,d1.l),d1
[000580d6] 48c1                      ext.l      d1
[000580d8] 2001                      move.l     d1,d0
[000580da] d080                      add.l      d0,d0
[000580dc] d081                      add.l      d1,d0
[000580de] e788                      lsl.l      #3,d0
[000580e0] 2057                      movea.l    (a7),a0
[000580e2] 0270 fffe 080a            andi.w     #$FFFE,10(a0,d0.l)
[000580e8] 2057                      movea.l    (a7),a0
[000580ea] 2257                      movea.l    (a7),a1
[000580ec] 3368 005c 0044            move.w     92(a0),68(a1)
[000580f2] 2057                      movea.l    (a7),a0
[000580f4] 3f68 0032 0004            move.w     50(a0),4(a7)
[000580fa] 322f 0004                 move.w     4(a7),d1
[000580fe] 48c1                      ext.l      d1
[00058100] 2001                      move.l     d1,d0
[00058102] d080                      add.l      d0,d0
[00058104] d081                      add.l      d1,d0
[00058106] e788                      lsl.l      #3,d0
[00058108] 2057                      movea.l    (a7),a0
[0005810a] 0270 fffe 080a            andi.w     #$FFFE,10(a0,d0.l)
[00058110] 322f 0004                 move.w     4(a7),d1
[00058114] 48c1                      ext.l      d1
[00058116] 2001                      move.l     d1,d0
[00058118] d080                      add.l      d0,d0
[0005811a] d081                      add.l      d1,d0
[0005811c] e788                      lsl.l      #3,d0
[0005811e] 2057                      movea.l    (a7),a0
[00058120] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
[00058126] 602c                      bra.s      $00058154
[00058128] 322f 0004                 move.w     4(a7),d1
[0005812c] 48c1                      ext.l      d1
[0005812e] 2001                      move.l     d1,d0
[00058130] d080                      add.l      d0,d0
[00058132] d081                      add.l      d1,d0
[00058134] e788                      lsl.l      #3,d0
[00058136] 2057                      movea.l    (a7),a0
[00058138] 0070 0008 080a            ori.w      #$0008,10(a0,d0.l)
[0005813e] 322f 0004                 move.w     4(a7),d1
[00058142] 48c1                      ext.l      d1
[00058144] 2001                      move.l     d1,d0
[00058146] d080                      add.l      d0,d0
[00058148] d081                      add.l      d1,d0
[0005814a] e788                      lsl.l      #3,d0
[0005814c] 2057                      movea.l    (a7),a0
[0005814e] 3f70 0800 0004            move.w     0(a0,d0.l),4(a7)
[00058154] 0c6f 0002 0004            cmpi.w     #$0002,4(a7)
[0005815a] 66cc                      bne.s      $00058128
[0005815c] 2279 000e 692a            movea.l    _globl,a1
[00058162] 7001                      moveq.l    #1,d0
[00058164] 2057                      movea.l    (a7),a0
[00058166] 4eb9 0007 9632            jsr        mt_menu_bar
[0005816c] 504f                      addq.w     #8,a7
[0005816e] 281f                      move.l     (a7)+,d4
[00058170] 261f                      move.l     (a7)+,d3
[00058172] 4e75                      rts
Awi_ropen:
[00058174] 2f03                      move.l     d3,-(a7)
[00058176] 4fef fff4                 lea.l      -12(a7),a7
[0005817a] 2f48 0008                 move.l     a0,8(a7)
[0005817e] 206f 0008                 movea.l    8(a7),a0
[00058182] 2f68 005e 0004            move.l     94(a0),4(a7)
[00058188] 23ef 0008 0011 3af2       move.l     8(a7),gemmap
[00058190] 206f 0008                 movea.l    8(a7),a0
[00058194] 4268 0020                 clr.w      32(a0)
[00058198] 202f 0004                 move.l     4(a7),d0
[0005819c] 6700 0080                 beq        $0005821E
[000581a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000581a6] 41e8 021f                 lea.l      543(a0),a0
[000581aa] 4eb9 0004 643c            jsr        Ast_create
[000581b0] 226f 0004                 movea.l    4(a7),a1
[000581b4] 3629 0002                 move.w     2(a1),d3
[000581b8] 48c3                      ext.l      d3
[000581ba] 2403                      move.l     d3,d2
[000581bc] d482                      add.l      d2,d2
[000581be] d483                      add.l      d3,d2
[000581c0] e78a                      lsl.l      #3,d2
[000581c2] 226f 0004                 movea.l    4(a7),a1
[000581c6] 3431 2802                 move.w     2(a1,d2.l),d2
[000581ca] 48c2                      ext.l      d2
[000581cc] 2202                      move.l     d2,d1
[000581ce] d281                      add.l      d1,d1
[000581d0] d282                      add.l      d2,d1
[000581d2] e789                      lsl.l      #3,d1
[000581d4] 226f 0004                 movea.l    4(a7),a1
[000581d8] 3231 1802                 move.w     2(a1,d1.l),d1
[000581dc] 48c1                      ext.l      d1
[000581de] 2001                      move.l     d1,d0
[000581e0] d080                      add.l      d0,d0
[000581e2] d081                      add.l      d1,d0
[000581e4] e788                      lsl.l      #3,d0
[000581e6] 226f 0004                 movea.l    4(a7),a1
[000581ea] 2388 080c                 move.l     a0,12(a1,d0.l)
[000581ee] 206f 0004                 movea.l    4(a7),a0
[000581f2] 4eb9 0004 ec24            jsr        Ame_namefix
[000581f8] 2279 000e 692a            movea.l    _globl,a1
[000581fe] 7001                      moveq.l    #1,d0
[00058200] 206f 0004                 movea.l    4(a7),a0
[00058204] 4eb9 0007 9632            jsr        mt_menu_bar
[0005820a] 206f 0004                 movea.l    4(a7),a0
[0005820e] 33e8 0044 000e 0cfc       move.w     68(a0),menu_width
[00058216] 33fc 0001 0011 4528       move.w     #$0001,_ACSv_wmenu
[0005821e] 7004                      moveq.l    #4,d0
[00058220] 206f 0008                 movea.l    8(a7),a0
[00058224] c068 0056                 and.w      86(a0),d0
[00058228] 6722                      beq.s      $0005824C
[0005822a] 206f 0008                 movea.l    8(a7),a0
[0005822e] 0268 fffb 0056            andi.w     #$FFFB,86(a0)
[00058234] 206f 0008                 movea.l    8(a7),a0
[00058238] 226f 0008                 movea.l    8(a7),a1
[0005823c] 2269 0010                 movea.l    16(a1),a1
[00058240] 4e91                      jsr        (a1)
[00058242] 4a40                      tst.w      d0
[00058244] 6706                      beq.s      $0005824C
[00058246] 70ff                      moveq.l    #-1,d0
[00058248] 6000 0110                 bra        $0005835A
[0005824c] 206f 0008                 movea.l    8(a7),a0
[00058250] 2ea8 0014                 move.l     20(a0),(a7)
[00058254] 2017                      move.l     (a7),d0
[00058256] 6700 00b8                 beq        $00058310
[0005825a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058260] 2257                      movea.l    (a7),a1
[00058262] 3368 0008 0010            move.w     8(a0),16(a1)
[00058268] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005826e] 2257                      movea.l    (a7),a1
[00058270] 3368 000a 0012            move.w     10(a0),18(a1)
[00058276] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005827c] 2257                      movea.l    (a7),a1
[0005827e] 3368 000c 0014            move.w     12(a0),20(a1)
[00058284] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005828a] 2257                      movea.l    (a7),a1
[0005828c] 3368 000e 0016            move.w     14(a0),22(a1)
[00058292] 4267                      clr.w      -(a7)
[00058294] 4267                      clr.w      -(a7)
[00058296] 2f2f 0004                 move.l     4(a7),-(a7)
[0005829a] 720e                      moveq.l    #14,d1
[0005829c] 4240                      clr.w      d0
[0005829e] 4eb9 0007 f926            jsr        wind_set
[000582a4] 504f                      addq.w     #8,a7
[000582a6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000582ac] 3f28 000e                 move.w     14(a0),-(a7)
[000582b0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000582b6] 3f28 000c                 move.w     12(a0),-(a7)
[000582ba] 2079 0010 ee4e            movea.l    ACSblk,a0
[000582c0] 3f28 000a                 move.w     10(a0),-(a7)
[000582c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000582ca] 3f28 0008                 move.w     8(a0),-(a7)
[000582ce] 2079 0010 ee4e            movea.l    ACSblk,a0
[000582d4] 3f28 000e                 move.w     14(a0),-(a7)
[000582d8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000582de] 3f28 000c                 move.w     12(a0),-(a7)
[000582e2] 2079 000e 692a            movea.l    _globl,a0
[000582e8] 2279 0010 ee4e            movea.l    ACSblk,a1
[000582ee] 3429 000a                 move.w     10(a1),d2
[000582f2] 2279 0010 ee4e            movea.l    ACSblk,a1
[000582f8] 3229 0008                 move.w     8(a1),d1
[000582fc] 7003                      moveq.l    #3,d0
[000582fe] 4eb9 0007 a0b4            jsr        mt_form_dial
[00058304] 4fef 000c                 lea.l      12(a7),a7
[00058308] 33fc 0001 0011 4526       move.w     #$0001,_ACSv_wwork
[00058310] 206f 0008                 movea.l    8(a7),a0
[00058314] 4268 0034                 clr.w      52(a0)
[00058318] 206f 0008                 movea.l    8(a7),a0
[0005831c] 4268 0036                 clr.w      54(a0)
[00058320] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058326] 3028 0008                 move.w     8(a0),d0
[0005832a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058330] d068 000c                 add.w      12(a0),d0
[00058334] 206f 0008                 movea.l    8(a7),a0
[00058338] 3140 0038                 move.w     d0,56(a0)
[0005833c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058342] 3028 000a                 move.w     10(a0),d0
[00058346] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005834c] d068 000e                 add.w      14(a0),d0
[00058350] 206f 0008                 movea.l    8(a7),a0
[00058354] 3140 003a                 move.w     d0,58(a0)
[00058358] 4240                      clr.w      d0
[0005835a] 4fef 000c                 lea.l      12(a7),a7
[0005835e] 261f                      move.l     (a7)+,d3
[00058360] 4e75                      rts
Awi_closed:
[00058362] 2f0a                      move.l     a2,-(a7)
[00058364] 4fef ffde                 lea.l      -34(a7),a7
[00058368] 2f48 000e                 move.l     a0,14(a7)
[0005836c] 6100 f814                 bsr        Awi_modal
[00058370] 2008                      move.l     a0,d0
[00058372] 6710                      beq.s      $00058384
[00058374] 6100 f80c                 bsr        Awi_modal
[00058378] 226f 000e                 movea.l    14(a7),a1
[0005837c] b3c8                      cmpa.l     a0,a1
[0005837e] 6704                      beq.s      $00058384
[00058380] 6000 0268                 bra        $000585EA
[00058384] 206f 000e                 movea.l    14(a7),a0
[00058388] 3f68 0020 000c            move.w     32(a0),12(a7)
[0005838e] 206f 000e                 movea.l    14(a7),a0
[00058392] 317c ffff 0020            move.w     #$FFFF,32(a0)
[00058398] 7002                      moveq.l    #2,d0
[0005839a] 206f 000e                 movea.l    14(a7),a0
[0005839e] c068 0056                 and.w      86(a0),d0
[000583a2] 6706                      beq.s      $000583AA
[000583a4] 4eb9 0005 1388            jsr        Awi_diaend
[000583aa] 70ff                      moveq.l    #-1,d0
[000583ac] 206f 000e                 movea.l    14(a7),a0
[000583b0] 3140 0052                 move.w     d0,82(a0)
[000583b4] 206f 000e                 movea.l    14(a7),a0
[000583b8] 3140 001e                 move.w     d0,30(a0)
[000583bc] 206f 000e                 movea.l    14(a7),a0
[000583c0] 3140 001c                 move.w     d0,28(a0)
[000583c4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000583ca] 2068 0240                 movea.l    576(a0),a0
[000583ce] b1ef 000e                 cmpa.l     14(a7),a0
[000583d2] 6606                      bne.s      $000583DA
[000583d4] 4eb9 0004 810e            jsr        Adr_unselect
[000583da] 302f 000c                 move.w     12(a7),d0
[000583de] 6628                      bne.s      $00058408
[000583e0] 4267                      clr.w      -(a7)
[000583e2] 4267                      clr.w      -(a7)
[000583e4] 4267                      clr.w      -(a7)
[000583e6] 4267                      clr.w      -(a7)
[000583e8] 720e                      moveq.l    #14,d1
[000583ea] 4240                      clr.w      d0
[000583ec] 4eb9 0007 f926            jsr        wind_set
[000583f2] 504f                      addq.w     #8,a7
[000583f4] 2279 000e 692a            movea.l    _globl,a1
[000583fa] 4240                      clr.w      d0
[000583fc] 91c8                      suba.l     a0,a0
[000583fe] 4eb9 0007 9632            jsr        mt_menu_bar
[00058404] 6000 01ce                 bra        $000585D4
[00058408] 206f 000e                 movea.l    14(a7),a0
[0005840c] 3028 0056                 move.w     86(a0),d0
[00058410] c07c 0500                 and.w      #$0500,d0
[00058414] 6648                      bne.s      $0005845E
[00058416] 2039 000e 0d26            move.l     Aroot_wi,d0
[0005841c] 6740                      beq.s      $0005845E
[0005841e] 206f 000e                 movea.l    14(a7),a0
[00058422] 3028 0058                 move.w     88(a0),d0
[00058426] 6b1e                      bmi.s      $00058446
[00058428] 226f 000e                 movea.l    14(a7),a1
[0005842c] 43e9 0058                 lea.l      88(a1),a1
[00058430] 7067                      moveq.l    #103,d0
[00058432] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00058438] 2479 000e 0d26            movea.l    Aroot_wi,a2
[0005843e] 246a 0004                 movea.l    4(a2),a2
[00058442] 4e92                      jsr        (a2)
[00058444] 6018                      bra.s      $0005845E
[00058446] 226f 000e                 movea.l    14(a7),a1
[0005844a] 7064                      moveq.l    #100,d0
[0005844c] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00058452] 2479 000e 0d26            movea.l    Aroot_wi,a2
[00058458] 246a 0004                 movea.l    4(a2),a2
[0005845c] 4e92                      jsr        (a2)
[0005845e] 302f 000c                 move.w     12(a7),d0
[00058462] 6f00 0170                 ble        $000585D4
[00058466] 7002                      moveq.l    #2,d0
[00058468] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005846e] 2068 023c                 movea.l    572(a0),a0
[00058472] c068 000e                 and.w      14(a0),d0
[00058476] 6700 00ae                 beq        $00058526
[0005847a] 206f 000e                 movea.l    14(a7),a0
[0005847e] 3028 0058                 move.w     88(a0),d0
[00058482] 6b4e                      bmi.s      $000584D2
[00058484] 2039 000e 0d26            move.l     Aroot_wi,d0
[0005848a] 6746                      beq.s      $000584D2
[0005848c] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00058492] 2028 0014                 move.l     20(a0),d0
[00058496] 673a                      beq.s      $000584D2
[00058498] 206f 000e                 movea.l    14(a7),a0
[0005849c] 3028 0058                 move.w     88(a0),d0
[000584a0] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000584a6] 2268 0014                 movea.l    20(a0),a1
[000584aa] 41ef 0004                 lea.l      4(a7),a0
[000584ae] 4eb9 0004 fe06            jsr        Aob_offset
[000584b4] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000584ba] 3028 0034                 move.w     52(a0),d0
[000584be] d16f 0004                 add.w      d0,4(a7)
[000584c2] 2079 000e 0d26            movea.l    Aroot_wi,a0
[000584c8] 3028 0036                 move.w     54(a0),d0
[000584cc] d16f 0006                 add.w      d0,6(a7)
[000584d0] 6014                      bra.s      $000584E6
[000584d2] 4240                      clr.w      d0
[000584d4] 3f40 0006                 move.w     d0,6(a7)
[000584d8] 3f40 0004                 move.w     d0,4(a7)
[000584dc] 7030                      moveq.l    #48,d0
[000584de] 3f40 000a                 move.w     d0,10(a7)
[000584e2] 3f40 0008                 move.w     d0,8(a7)
[000584e6] 206f 000e                 movea.l    14(a7),a0
[000584ea] 3f28 002a                 move.w     42(a0),-(a7)
[000584ee] 206f 0010                 movea.l    16(a7),a0
[000584f2] 3f28 0028                 move.w     40(a0),-(a7)
[000584f6] 206f 0012                 movea.l    18(a7),a0
[000584fa] 3f28 0026                 move.w     38(a0),-(a7)
[000584fe] 206f 0014                 movea.l    20(a7),a0
[00058502] 3f28 0024                 move.w     36(a0),-(a7)
[00058506] 3f2f 0012                 move.w     18(a7),-(a7)
[0005850a] 2079 000e 692a            movea.l    _globl,a0
[00058510] 342f 0012                 move.w     18(a7),d2
[00058514] 322f 0010                 move.w     16(a7),d1
[00058518] 302f 000e                 move.w     14(a7),d0
[0005851c] 4eb9 0007 a8c0            jsr        mt_graf_shrinkbox
[00058522] 4fef 000a                 lea.l      10(a7),a7
[00058526] 2079 000e 692a            movea.l    _globl,a0
[0005852c] 302f 000c                 move.w     12(a7),d0
[00058530] 4eb9 0007 b48a            jsr        mt_wind_close
[00058536] 6100 d722                 bsr        Awi_ontop
[0005853a] b1ef 000e                 cmpa.l     14(a7),a0
[0005853e] 6606                      bne.s      $00058546
[00058540] 91c8                      suba.l     a0,a0
[00058542] 6100 d72e                 bsr        Awi_setontop
[00058546] 2079 000e 692a            movea.l    _globl,a0
[0005854c] 302f 000c                 move.w     12(a7),d0
[00058550] 4eb9 0007 b4e4            jsr        mt_wind_delete
[00058556] 4240                      clr.w      d0
[00058558] 206f 000e                 movea.l    14(a7),a0
[0005855c] 6100 f8ae                 bsr        Awi_set_modal
[00058560] 4297                      clr.l      (a7)
[00058562] 604a                      bra.s      $000585AE
[00058564] 7004                      moveq.l    #4,d0
[00058566] 2057                      movea.l    (a7),a0
[00058568] c0a8 0002                 and.l      2(a0),d0
[0005856c] 6740                      beq.s      $000585AE
[0005856e] 41f9 000e 0ed2            lea.l      $000E0ED2,a0
[00058574] 43ef 0012                 lea.l      18(a7),a1
[00058578] 700f                      moveq.l    #15,d0
[0005857a] 12d8                      move.b     (a0)+,(a1)+
[0005857c] 51c8 fffc                 dbf        d0,$0005857A
[00058580] 3f7c 4726 0012            move.w     #$4726,18(a7)
[00058586] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005858c] 3f50 0014                 move.w     (a0),20(a7)
[00058590] 3f6f 000c 0018            move.w     12(a7),24(a7)
[00058596] 2279 000e 692a            movea.l    _globl,a1
[0005859c] 41ef 0012                 lea.l      18(a7),a0
[000585a0] 7210                      moveq.l    #16,d1
[000585a2] 2457                      movea.l    (a7),a2
[000585a4] 3012                      move.w     (a2),d0
[000585a6] 4eb9 0007 8ae8            jsr        mt_appl_write
[000585ac] 600c                      bra.s      $000585BA
[000585ae] 2057                      movea.l    (a7),a0
[000585b0] 4eb9 0005 dd58            jsr        Ash_nextdd
[000585b6] 2e88                      move.l     a0,(a7)
[000585b8] 66aa                      bne.s      $00058564
[000585ba] 4eb9 0004 b086            jsr        Aev_mess
[000585c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000585c6] 2068 023c                 movea.l    572(a0),a0
[000585ca] 41e8 0038                 lea.l      56(a0),a0
[000585ce] 4eb9 0004 ee3c            jsr        Amo_new
[000585d4] 302f 000c                 move.w     12(a7),d0
[000585d8] 6b10                      bmi.s      $000585EA
[000585da] 302f 000c                 move.w     12(a7),d0
[000585de] e548                      lsl.w      #2,d0
[000585e0] 41f9 0011 3af2            lea.l      gemmap,a0
[000585e6] 42b0 0000                 clr.l      0(a0,d0.w)
[000585ea] 4fef 0022                 lea.l      34(a7),a7
[000585ee] 245f                      movea.l    (a7)+,a2
[000585f0] 4e75                      rts
Awi_delete:
[000585f2] 2f0a                      move.l     a2,-(a7)
[000585f4] 5d4f                      subq.w     #6,a7
[000585f6] 2f48 0002                 move.l     a0,2(a7)
[000585fa] 206f 0002                 movea.l    2(a7),a0
[000585fe] 0068 0100 0056            ori.w      #$0100,86(a0)
[00058604] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005860a] 2068 0240                 movea.l    576(a0),a0
[0005860e] b1ef 0002                 cmpa.l     2(a7),a0
[00058612] 660a                      bne.s      $0005861E
[00058614] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005861a] 4268 0246                 clr.w      582(a0)
[0005861e] 206f 0002                 movea.l    2(a7),a0
[00058622] 4eb9 0006 2430            jsr        CheckPcHelp
[00058628] 206f 0002                 movea.l    2(a7),a0
[0005862c] 4eb9 0006 21a6            jsr        CheckSTGuide
[00058632] 206f 0002                 movea.l    2(a7),a0
[00058636] 6100 d730                 bsr        Awi_icondelete
[0005863a] 3ebc 0064                 move.w     #$0064,(a7)
[0005863e] 6010                      bra.s      $00058650
[00058640] 206f 0002                 movea.l    2(a7),a0
[00058644] 226f 0002                 movea.l    2(a7),a1
[00058648] 2269 0072                 movea.l    114(a1),a1
[0005864c] 4e91                      jsr        (a1)
[0005864e] 5357                      subq.w     #1,(a7)
[00058650] 206f 0002                 movea.l    2(a7),a0
[00058654] 3028 0020                 move.w     32(a0),d0
[00058658] 6b04                      bmi.s      $0005865E
[0005865a] 3017                      move.w     (a7),d0
[0005865c] 6ee2                      bgt.s      $00058640
[0005865e] 3017                      move.w     (a7),d0
[00058660] 6e12                      bgt.s      $00058674
[00058662] 206f 0002                 movea.l    2(a7),a0
[00058666] 0268 f7ff 0056            andi.w     #$F7FF,86(a0)
[0005866c] 206f 0002                 movea.l    2(a7),a0
[00058670] 6100 fcf0                 bsr        Awi_closed
[00058674] 206f 0002                 movea.l    2(a7),a0
[00058678] 3028 0058                 move.w     88(a0),d0
[0005867c] 6b24                      bmi.s      $000586A2
[0005867e] 2039 000e 0d26            move.l     Aroot_wi,d0
[00058684] 671c                      beq.s      $000586A2
[00058686] 226f 0002                 movea.l    2(a7),a1
[0005868a] 43e9 0058                 lea.l      88(a1),a1
[0005868e] 7065                      moveq.l    #101,d0
[00058690] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00058696] 2479 000e 0d26            movea.l    Aroot_wi,a2
[0005869c] 246a 0004                 movea.l    4(a2),a2
[000586a0] 4e92                      jsr        (a2)
[000586a2] 206f 0002                 movea.l    2(a7),a0
[000586a6] 2068 009e                 movea.l    158(a0),a0
[000586aa] 4eb9 0004 649c            jsr        Ast_delete
[000586b0] 206f 0002                 movea.l    2(a7),a0
[000586b4] 2068 009a                 movea.l    154(a0),a0
[000586b8] 4eb9 0004 649c            jsr        Ast_delete
[000586be] 206f 0002                 movea.l    2(a7),a0
[000586c2] 2068 004e                 movea.l    78(a0),a0
[000586c6] 4eb9 0004 649c            jsr        Ast_delete
[000586cc] 206f 0002                 movea.l    2(a7),a0
[000586d0] 2068 004a                 movea.l    74(a0),a0
[000586d4] 4eb9 0004 649c            jsr        Ast_delete
[000586da] 206f 0002                 movea.l    2(a7),a0
[000586de] 2068 005a                 movea.l    90(a0),a0
[000586e2] 4eb9 0004 f99a            jsr        Aic_delete
[000586e8] 206f 0002                 movea.l    2(a7),a0
[000586ec] 2068 005e                 movea.l    94(a0),a0
[000586f0] 4eb9 0004 f20a            jsr        Aob_delete
[000586f6] 206f 0002                 movea.l    2(a7),a0
[000586fa] 2068 0018                 movea.l    24(a0),a0
[000586fe] 4eb9 0004 f20a            jsr        Aob_delete
[00058704] 206f 0002                 movea.l    2(a7),a0
[00058708] 2068 0014                 movea.l    20(a0),a0
[0005870c] 4eb9 0004 f20a            jsr        Aob_delete
[00058712] 206f 0002                 movea.l    2(a7),a0
[00058716] b1f9 000e 0d26            cmpa.l     Aroot_wi,a0
[0005871c] 660c                      bne.s      $0005872A
[0005871e] 42b9 000e 0d26            clr.l      Aroot_wi
[00058724] 4eb9 0004 a30e            jsr        Aev_quit
[0005872a] 4257                      clr.w      (a7)
[0005872c] 6066                      bra.s      $00058794
[0005872e] 3017                      move.w     (a7),d0
[00058730] e548                      lsl.w      #2,d0
[00058732] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[00058738] 2070 0000                 movea.l    0(a0,d0.w),a0
[0005873c] b1ef 0002                 cmpa.l     2(a7),a0
[00058740] 6650                      bne.s      $00058792
[00058742] 3017                      move.w     (a7),d0
[00058744] e548                      lsl.w      #2,d0
[00058746] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[0005874c] 42b0 0000                 clr.l      0(a0,d0.w)
[00058750] 3017                      move.w     (a7),d0
[00058752] b079 0011 452a            cmp.w      _Wmax_wi,d0
[00058758] 6626                      bne.s      $00058780
[0005875a] 4e71                      nop
[0005875c] 3039 0011 452a            move.w     _Wmax_wi,d0
[00058762] 5379 0011 452a            subq.w     #1,_Wmax_wi
[00058768] 4a40                      tst.w      d0
[0005876a] 6f14                      ble.s      $00058780
[0005876c] 3039 0011 452a            move.w     _Wmax_wi,d0
[00058772] e548                      lsl.w      #2,d0
[00058774] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[0005877a] 2030 0000                 move.l     0(a0,d0.w),d0
[0005877e] 67dc                      beq.s      $0005875C
[00058780] 203c 0000 00a2            move.l     #$000000A2,d0
[00058786] 206f 0002                 movea.l    2(a7),a0
[0005878a] 4eb9 0004 cc28            jsr        Ax_recycle
[00058790] 600c                      bra.s      $0005879E
[00058792] 5257                      addq.w     #1,(a7)
[00058794] 3017                      move.w     (a7),d0
[00058796] b079 0011 452a            cmp.w      _Wmax_wi,d0
[0005879c] 6f90                      ble.s      $0005872E
[0005879e] 5c4f                      addq.w     #6,a7
[000587a0] 245f                      movea.l    (a7)+,a2
[000587a2] 4e75                      rts
Awi_topped:
[000587a4] 5d4f                      subq.w     #6,a7
[000587a6] 2f48 0002                 move.l     a0,2(a7)
[000587aa] 206f 0002                 movea.l    2(a7),a0
[000587ae] 3ea8 0020                 move.w     32(a0),(a7)
[000587b2] 3017                      move.w     (a7),d0
[000587b4] 6f32                      ble.s      $000587E8
[000587b6] 6100 f3ca                 bsr        Awi_modal
[000587ba] 2008                      move.l     a0,d0
[000587bc] 6706                      beq.s      $000587C4
[000587be] 6100 f3f6                 bsr        Awi_up_modal
[000587c2] 6024                      bra.s      $000587E8
[000587c4] 4eb9 0005 1388            jsr        Awi_diaend
[000587ca] 4267                      clr.w      -(a7)
[000587cc] 4267                      clr.w      -(a7)
[000587ce] 4267                      clr.w      -(a7)
[000587d0] 4267                      clr.w      -(a7)
[000587d2] 720a                      moveq.l    #10,d1
[000587d4] 302f 0008                 move.w     8(a7),d0
[000587d8] 4eb9 0007 f926            jsr        wind_set
[000587de] 504f                      addq.w     #8,a7
[000587e0] 206f 0002                 movea.l    2(a7),a0
[000587e4] 6100 d48c                 bsr        Awi_setontop
[000587e8] 5c4f                      addq.w     #6,a7
[000587ea] 4e75                      rts
Awi_fulled:
[000587ec] 2f0a                      move.l     a2,-(a7)
[000587ee] 4fef ffe6                 lea.l      -26(a7),a7
[000587f2] 2f48 0016                 move.l     a0,22(a7)
[000587f6] 206f 0016                 movea.l    22(a7),a0
[000587fa] 3028 0020                 move.w     32(a0),d0
[000587fe] 6e04                      bgt.s      $00058804
[00058800] 6000 03a6                 bra        $00058BA8
[00058804] 206f 0016                 movea.l    22(a7),a0
[00058808] 2f68 0014 0004            move.l     20(a0),4(a7)
[0005880e] 206f 0016                 movea.l    22(a7),a0
[00058812] 41e8 0024                 lea.l      36(a0),a0
[00058816] 2f48 000c                 move.l     a0,12(a7)
[0005881a] 206f 0016                 movea.l    22(a7),a0
[0005881e] 41e8 002c                 lea.l      44(a0),a0
[00058822] 2f48 0008                 move.l     a0,8(a7)
[00058826] 7001                      moveq.l    #1,d0
[00058828] 206f 0016                 movea.l    22(a7),a0
[0005882c] c068 0056                 and.w      86(a0),d0
[00058830] 6700 0084                 beq        $000588B6
[00058834] 206f 0008                 movea.l    8(a7),a0
[00058838] 226f 000c                 movea.l    12(a7),a1
[0005883c] 3290                      move.w     (a0),(a1)
[0005883e] 206f 0008                 movea.l    8(a7),a0
[00058842] 226f 000c                 movea.l    12(a7),a1
[00058846] 3368 0002 0002            move.w     2(a0),2(a1)
[0005884c] 206f 0008                 movea.l    8(a7),a0
[00058850] 226f 000c                 movea.l    12(a7),a1
[00058854] 3368 0004 0004            move.w     4(a0),4(a1)
[0005885a] 206f 0008                 movea.l    8(a7),a0
[0005885e] 226f 000c                 movea.l    12(a7),a1
[00058862] 3368 0006 0006            move.w     6(a0),6(a1)
[00058868] 206f 0004                 movea.l    4(a7),a0
[0005886c] 3028 0010                 move.w     16(a0),d0
[00058870] 206f 0016                 movea.l    22(a7),a0
[00058874] b068 0044                 cmp.w      68(a0),d0
[00058878] 6612                      bne.s      $0005888C
[0005887a] 206f 0004                 movea.l    4(a7),a0
[0005887e] 3028 0012                 move.w     18(a0),d0
[00058882] 206f 0016                 movea.l    22(a7),a0
[00058886] b068 0046                 cmp.w      70(a0),d0
[0005888a] 670a                      beq.s      $00058896
[0005888c] 206f 0016                 movea.l    22(a7),a0
[00058890] 0068 0010 0056            ori.w      #$0010,86(a0)
[00058896] 206f 0016                 movea.l    22(a7),a0
[0005889a] 226f 0004                 movea.l    4(a7),a1
[0005889e] 3368 0044 0010            move.w     68(a0),16(a1)
[000588a4] 206f 0016                 movea.l    22(a7),a0
[000588a8] 226f 0004                 movea.l    4(a7),a1
[000588ac] 3368 0046 0012            move.w     70(a0),18(a1)
[000588b2] 6000 0218                 bra        $00058ACC
[000588b6] 206f 000c                 movea.l    12(a7),a0
[000588ba] 226f 0008                 movea.l    8(a7),a1
[000588be] 3290                      move.w     (a0),(a1)
[000588c0] 206f 000c                 movea.l    12(a7),a0
[000588c4] 226f 0008                 movea.l    8(a7),a1
[000588c8] 3368 0002 0002            move.w     2(a0),2(a1)
[000588ce] 206f 000c                 movea.l    12(a7),a0
[000588d2] 226f 0008                 movea.l    8(a7),a1
[000588d6] 3368 0004 0004            move.w     4(a0),4(a1)
[000588dc] 206f 000c                 movea.l    12(a7),a0
[000588e0] 226f 0008                 movea.l    8(a7),a1
[000588e4] 3368 0006 0006            move.w     6(a0),6(a1)
[000588ea] 7008                      moveq.l    #8,d0
[000588ec] 206f 0016                 movea.l    22(a7),a0
[000588f0] c068 0054                 and.w      84(a0),d0
[000588f4] 6742                      beq.s      $00058938
[000588f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000588fc] 226f 000c                 movea.l    12(a7),a1
[00058900] 32a8 0008                 move.w     8(a0),(a1)
[00058904] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005890a] 226f 000c                 movea.l    12(a7),a1
[0005890e] 3368 000a 0002            move.w     10(a0),2(a1)
[00058914] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005891a] 226f 000c                 movea.l    12(a7),a1
[0005891e] 3368 000c 0004            move.w     12(a0),4(a1)
[00058924] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005892a] 226f 000c                 movea.l    12(a7),a1
[0005892e] 3368 000e 0006            move.w     14(a0),6(a1)
[00058934] 6000 014c                 bra        $00058A82
[00058938] 206f 0016                 movea.l    22(a7),a0
[0005893c] 3028 0048                 move.w     72(a0),d0
[00058940] 807c ff00                 or.w       #$FF00,d0
[00058944] 3f40 0012                 move.w     d0,18(a7)
[00058948] 206f 0016                 movea.l    22(a7),a0
[0005894c] 3028 0048                 move.w     72(a0),d0
[00058950] e040                      asr.w      #8,d0
[00058952] 3f40 0010                 move.w     d0,16(a7)
[00058956] 302f 0012                 move.w     18(a7),d0
[0005895a] 4640                      not.w      d0
[0005895c] 206f 0004                 movea.l    4(a7),a0
[00058960] d168 0014                 add.w      d0,20(a0)
[00058964] 302f 0012                 move.w     18(a7),d0
[00058968] 206f 0004                 movea.l    4(a7),a0
[0005896c] c168 0014                 and.w      d0,20(a0)
[00058970] 302f 0010                 move.w     16(a7),d0
[00058974] 4640                      not.w      d0
[00058976] 206f 0004                 movea.l    4(a7),a0
[0005897a] d168 0016                 add.w      d0,22(a0)
[0005897e] 302f 0010                 move.w     16(a7),d0
[00058982] 206f 0004                 movea.l    4(a7),a0
[00058986] c168 0016                 and.w      d0,22(a0)
[0005898a] 2f39 000e 692a            move.l     _globl,-(a7)
[00058990] 206f 0010                 movea.l    16(a7),a0
[00058994] 4868 0006                 pea.l      6(a0)
[00058998] 206f 0014                 movea.l    20(a7),a0
[0005899c] 4868 0004                 pea.l      4(a0)
[000589a0] 206f 0010                 movea.l    16(a7),a0
[000589a4] 3f28 0016                 move.w     22(a0),-(a7)
[000589a8] 206f 0012                 movea.l    18(a7),a0
[000589ac] 3f28 0014                 move.w     20(a0),-(a7)
[000589b0] 4267                      clr.w      -(a7)
[000589b2] 43ef 0026                 lea.l      38(a7),a1
[000589b6] 41ef 0026                 lea.l      38(a7),a0
[000589ba] 4242                      clr.w      d2
[000589bc] 246f 0028                 movea.l    40(a7),a2
[000589c0] 322a 0022                 move.w     34(a2),d1
[000589c4] 4240                      clr.w      d0
[000589c6] 4eb9 0007 b8da            jsr        mt_wind_calc
[000589cc] 4fef 0012                 lea.l      18(a7),a7
[000589d0] 206f 000c                 movea.l    12(a7),a0
[000589d4] 3010                      move.w     (a0),d0
[000589d6] 206f 000c                 movea.l    12(a7),a0
[000589da] d068 0004                 add.w      4(a0),d0
[000589de] 2079 0010 ee4e            movea.l    ACSblk,a0
[000589e4] 3228 0008                 move.w     8(a0),d1
[000589e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[000589ee] d268 000c                 add.w      12(a0),d1
[000589f2] b041                      cmp.w      d1,d0
[000589f4] 6f0e                      ble.s      $00058A04
[000589f6] 2079 0010 ee4e            movea.l    ACSblk,a0
[000589fc] 226f 000c                 movea.l    12(a7),a1
[00058a00] 32a8 0008                 move.w     8(a0),(a1)
[00058a04] 206f 0016                 movea.l    22(a7),a0
[00058a08] 2ea8 005e                 move.l     94(a0),(a7)
[00058a0c] 671e                      beq.s      $00058A2C
[00058a0e] 2057                      movea.l    (a7),a0
[00058a10] 3228 0002                 move.w     2(a0),d1
[00058a14] 48c1                      ext.l      d1
[00058a16] 2001                      move.l     d1,d0
[00058a18] d080                      add.l      d0,d0
[00058a1a] d081                      add.l      d1,d0
[00058a1c] e788                      lsl.l      #3,d0
[00058a1e] 2057                      movea.l    (a7),a0
[00058a20] 3030 0816                 move.w     22(a0,d0.l),d0
[00058a24] 206f 000c                 movea.l    12(a7),a0
[00058a28] d168 0006                 add.w      d0,6(a0)
[00058a2c] 206f 0016                 movea.l    22(a7),a0
[00058a30] 2028 0018                 move.l     24(a0),d0
[00058a34] 6714                      beq.s      $00058A4A
[00058a36] 206f 0016                 movea.l    22(a7),a0
[00058a3a] 2068 0018                 movea.l    24(a0),a0
[00058a3e] 3028 0016                 move.w     22(a0),d0
[00058a42] 206f 000c                 movea.l    12(a7),a0
[00058a46] d168 0006                 add.w      d0,6(a0)
[00058a4a] 206f 000c                 movea.l    12(a7),a0
[00058a4e] 3028 0002                 move.w     2(a0),d0
[00058a52] 206f 000c                 movea.l    12(a7),a0
[00058a56] d068 0006                 add.w      6(a0),d0
[00058a5a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058a60] 3228 000a                 move.w     10(a0),d1
[00058a64] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058a6a] d268 000e                 add.w      14(a0),d1
[00058a6e] b041                      cmp.w      d1,d0
[00058a70] 6f10                      ble.s      $00058A82
[00058a72] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058a78] 226f 000c                 movea.l    12(a7),a1
[00058a7c] 3368 000a 0002            move.w     10(a0),2(a1)
[00058a82] 206f 0004                 movea.l    4(a7),a0
[00058a86] 226f 0016                 movea.l    22(a7),a1
[00058a8a] 3368 0010 0044            move.w     16(a0),68(a1)
[00058a90] 206f 0004                 movea.l    4(a7),a0
[00058a94] 226f 0016                 movea.l    22(a7),a1
[00058a98] 3368 0012 0046            move.w     18(a0),70(a1)
[00058a9e] 206f 0004                 movea.l    4(a7),a0
[00058aa2] 3028 0010                 move.w     16(a0),d0
[00058aa6] 660a                      bne.s      $00058AB2
[00058aa8] 206f 0004                 movea.l    4(a7),a0
[00058aac] 3028 0012                 move.w     18(a0),d0
[00058ab0] 670a                      beq.s      $00058ABC
[00058ab2] 206f 0016                 movea.l    22(a7),a0
[00058ab6] 0068 0010 0056            ori.w      #$0010,86(a0)
[00058abc] 206f 0004                 movea.l    4(a7),a0
[00058ac0] 4268 0010                 clr.w      16(a0)
[00058ac4] 206f 0004                 movea.l    4(a7),a0
[00058ac8] 4268 0012                 clr.w      18(a0)
[00058acc] 206f 0016                 movea.l    22(a7),a0
[00058ad0] 0a68 0001 0056            eori.w     #$0001,86(a0)
[00058ad6] 206f 0016                 movea.l    22(a7),a0
[00058ada] 4eb9 0005 9572            jsr        Awi_oblist
[00058ae0] 206f 000c                 movea.l    12(a7),a0
[00058ae4] 3f28 0006                 move.w     6(a0),-(a7)
[00058ae8] 206f 000e                 movea.l    14(a7),a0
[00058aec] 3f28 0004                 move.w     4(a0),-(a7)
[00058af0] 206f 0010                 movea.l    16(a7),a0
[00058af4] 3f28 0002                 move.w     2(a0),-(a7)
[00058af8] 206f 0012                 movea.l    18(a7),a0
[00058afc] 3f10                      move.w     (a0),-(a7)
[00058afe] 7205                      moveq.l    #5,d1
[00058b00] 206f 001e                 movea.l    30(a7),a0
[00058b04] 3028 0020                 move.w     32(a0),d0
[00058b08] 4eb9 0007 f926            jsr        wind_set
[00058b0e] 504f                      addq.w     #8,a7
[00058b10] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058b16] 2068 0280                 movea.l    640(a0),a0
[00058b1a] 0c50 0300                 cmpi.w     #$0300,(a0)
[00058b1e] 6f18                      ble.s      $00058B38
[00058b20] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058b26] 2068 0280                 movea.l    640(a0),a0
[00058b2a] 0c50 0400                 cmpi.w     #$0400,(a0)
[00058b2e] 6c08                      bge.s      $00058B38
[00058b30] 206f 0016                 movea.l    22(a7),a0
[00058b34] 6100 e840                 bsr        Awi_slider
[00058b38] 7010                      moveq.l    #16,d0
[00058b3a] 206f 0016                 movea.l    22(a7),a0
[00058b3e] c068 0056                 and.w      86(a0),d0
[00058b42] 672c                      beq.s      $00058B70
[00058b44] 7040                      moveq.l    #64,d0
[00058b46] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058b4c] 2068 023c                 movea.l    572(a0),a0
[00058b50] c068 000e                 and.w      14(a0),d0
[00058b54] 671a                      beq.s      $00058B70
[00058b56] 206f 000c                 movea.l    12(a7),a0
[00058b5a] 226f 0016                 movea.l    22(a7),a1
[00058b5e] 3229 0020                 move.w     32(a1),d1
[00058b62] 2279 0010 ee4e            movea.l    ACSblk,a1
[00058b68] 3011                      move.w     (a1),d0
[00058b6a] 4eb9 0005 eb60            jsr        Aev_WmRedraw
[00058b70] 4eb9 0004 b086            jsr        Aev_mess
[00058b76] 7010                      moveq.l    #16,d0
[00058b78] 206f 0016                 movea.l    22(a7),a0
[00058b7c] c068 0056                 and.w      86(a0),d0
[00058b80] 6726                      beq.s      $00058BA8
[00058b82] 206f 0016                 movea.l    22(a7),a0
[00058b86] 0268 fffd 0056            andi.w     #$FFFD,86(a0)
[00058b8c] 226f 0016                 movea.l    22(a7),a1
[00058b90] 43e9 0024                 lea.l      36(a1),a1
[00058b94] 206f 0016                 movea.l    22(a7),a0
[00058b98] 246f 0016                 movea.l    22(a7),a2
[00058b9c] 246a 006a                 movea.l    106(a2),a2
[00058ba0] 4e92                      jsr        (a2)
[00058ba2] 4eb9 0005 147c            jsr        Awi_diastart
[00058ba8] 4fef 001a                 lea.l      26(a7),a7
[00058bac] 245f                      movea.l    (a7)+,a2
[00058bae] 4e75                      rts
Awi_sized:
[00058bb0] 2f0a                      move.l     a2,-(a7)
[00058bb2] 4fef fff0                 lea.l      -16(a7),a7
[00058bb6] 2f48 000c                 move.l     a0,12(a7)
[00058bba] 2f49 0008                 move.l     a1,8(a7)
[00058bbe] 206f 000c                 movea.l    12(a7),a0
[00058bc2] 3028 0020                 move.w     32(a0),d0
[00058bc6] 6e04                      bgt.s      $00058BCC
[00058bc8] 6000 017e                 bra        $00058D48
[00058bcc] 206f 000c                 movea.l    12(a7),a0
[00058bd0] 0268 fffe 0056            andi.w     #$FFFE,86(a0)
[00058bd6] 206f 000c                 movea.l    12(a7),a0
[00058bda] 41e8 0024                 lea.l      36(a0),a0
[00058bde] 2f48 0004                 move.l     a0,4(a7)
[00058be2] 206f 0004                 movea.l    4(a7),a0
[00058be6] 3f68 0004 0002            move.w     4(a0),2(a7)
[00058bec] 206f 0004                 movea.l    4(a7),a0
[00058bf0] 3ea8 0006                 move.w     6(a0),(a7)
[00058bf4] 206f 0008                 movea.l    8(a7),a0
[00058bf8] 226f 0004                 movea.l    4(a7),a1
[00058bfc] 3290                      move.w     (a0),(a1)
[00058bfe] 206f 0008                 movea.l    8(a7),a0
[00058c02] 226f 0004                 movea.l    4(a7),a1
[00058c06] 3368 0002 0002            move.w     2(a0),2(a1)
[00058c0c] 206f 0008                 movea.l    8(a7),a0
[00058c10] 3039 0011 3ae6            move.w     wi_minw,d0
[00058c16] b068 0004                 cmp.w      4(a0),d0
[00058c1a] 6f08                      ble.s      $00058C24
[00058c1c] 3039 0011 3ae6            move.w     wi_minw,d0
[00058c22] 6008                      bra.s      $00058C2C
[00058c24] 206f 0008                 movea.l    8(a7),a0
[00058c28] 3028 0004                 move.w     4(a0),d0
[00058c2c] 206f 0004                 movea.l    4(a7),a0
[00058c30] 3140 0004                 move.w     d0,4(a0)
[00058c34] 206f 0008                 movea.l    8(a7),a0
[00058c38] 3039 0011 3ae8            move.w     wi_minh,d0
[00058c3e] b068 0006                 cmp.w      6(a0),d0
[00058c42] 6f08                      ble.s      $00058C4C
[00058c44] 3039 0011 3ae8            move.w     wi_minh,d0
[00058c4a] 6008                      bra.s      $00058C54
[00058c4c] 206f 0008                 movea.l    8(a7),a0
[00058c50] 3028 0006                 move.w     6(a0),d0
[00058c54] 206f 0004                 movea.l    4(a7),a0
[00058c58] 3140 0006                 move.w     d0,6(a0)
[00058c5c] 206f 000c                 movea.l    12(a7),a0
[00058c60] 4eb9 0005 9572            jsr        Awi_oblist
[00058c66] 206f 0004                 movea.l    4(a7),a0
[00058c6a] 302f 0002                 move.w     2(a7),d0
[00058c6e] b068 0004                 cmp.w      4(a0),d0
[00058c72] 661c                      bne.s      $00058C90
[00058c74] 206f 0004                 movea.l    4(a7),a0
[00058c78] 3017                      move.w     (a7),d0
[00058c7a] b068 0006                 cmp.w      6(a0),d0
[00058c7e] 6610                      bne.s      $00058C90
[00058c80] 7010                      moveq.l    #16,d0
[00058c82] 206f 000c                 movea.l    12(a7),a0
[00058c86] c068 0056                 and.w      86(a0),d0
[00058c8a] 6604                      bne.s      $00058C90
[00058c8c] 6000 00ba                 bra        $00058D48
[00058c90] 206f 0004                 movea.l    4(a7),a0
[00058c94] 3f28 0006                 move.w     6(a0),-(a7)
[00058c98] 206f 0006                 movea.l    6(a7),a0
[00058c9c] 3f28 0004                 move.w     4(a0),-(a7)
[00058ca0] 206f 0008                 movea.l    8(a7),a0
[00058ca4] 3f28 0002                 move.w     2(a0),-(a7)
[00058ca8] 206f 000a                 movea.l    10(a7),a0
[00058cac] 3f10                      move.w     (a0),-(a7)
[00058cae] 7205                      moveq.l    #5,d1
[00058cb0] 206f 0014                 movea.l    20(a7),a0
[00058cb4] 3028 0020                 move.w     32(a0),d0
[00058cb8] 4eb9 0007 f926            jsr        wind_set
[00058cbe] 504f                      addq.w     #8,a7
[00058cc0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058cc6] 2068 0280                 movea.l    640(a0),a0
[00058cca] 0c50 0300                 cmpi.w     #$0300,(a0)
[00058cce] 6f18                      ble.s      $00058CE8
[00058cd0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058cd6] 2068 0280                 movea.l    640(a0),a0
[00058cda] 0c50 0400                 cmpi.w     #$0400,(a0)
[00058cde] 6c08                      bge.s      $00058CE8
[00058ce0] 206f 000c                 movea.l    12(a7),a0
[00058ce4] 6100 e690                 bsr        Awi_slider
[00058ce8] 7010                      moveq.l    #16,d0
[00058cea] 206f 000c                 movea.l    12(a7),a0
[00058cee] c068 0056                 and.w      86(a0),d0
[00058cf2] 6754                      beq.s      $00058D48
[00058cf4] 7040                      moveq.l    #64,d0
[00058cf6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058cfc] 2068 023c                 movea.l    572(a0),a0
[00058d00] c068 000e                 and.w      14(a0),d0
[00058d04] 671c                      beq.s      $00058D22
[00058d06] 206f 0004                 movea.l    4(a7),a0
[00058d0a] 226f 000c                 movea.l    12(a7),a1
[00058d0e] 3229 0020                 move.w     32(a1),d1
[00058d12] 2279 0010 ee4e            movea.l    ACSblk,a1
[00058d18] 3011                      move.w     (a1),d0
[00058d1a] 4eb9 0005 eb60            jsr        Aev_WmRedraw
[00058d20] 6026                      bra.s      $00058D48
[00058d22] 206f 000c                 movea.l    12(a7),a0
[00058d26] 0268 fffd 0056            andi.w     #$FFFD,86(a0)
[00058d2c] 226f 000c                 movea.l    12(a7),a1
[00058d30] 43e9 0024                 lea.l      36(a1),a1
[00058d34] 206f 000c                 movea.l    12(a7),a0
[00058d38] 246f 000c                 movea.l    12(a7),a2
[00058d3c] 246a 006a                 movea.l    106(a2),a2
[00058d40] 4e92                      jsr        (a2)
[00058d42] 4eb9 0005 147c            jsr        Awi_diastart
[00058d48] 4fef 0010                 lea.l      16(a7),a7
[00058d4c] 245f                      movea.l    (a7)+,a2
[00058d4e] 4e75                      rts
Awi_moved:
[00058d50] 514f                      subq.w     #8,a7
[00058d52] 2f48 0004                 move.l     a0,4(a7)
[00058d56] 2e89                      move.l     a1,(a7)
[00058d58] 206f 0004                 movea.l    4(a7),a0
[00058d5c] 3028 0020                 move.w     32(a0),d0
[00058d60] 6e02                      bgt.s      $00058D64
[00058d62] 6074                      bra.s      $00058DD8
[00058d64] 206f 0004                 movea.l    4(a7),a0
[00058d68] 0268 fffe 0056            andi.w     #$FFFE,86(a0)
[00058d6e] 2057                      movea.l    (a7),a0
[00058d70] 226f 0004                 movea.l    4(a7),a1
[00058d74] 3350 0024                 move.w     (a0),36(a1)
[00058d78] 2057                      movea.l    (a7),a0
[00058d7a] 226f 0004                 movea.l    4(a7),a1
[00058d7e] 3368 0002 0026            move.w     2(a0),38(a1)
[00058d84] 2057                      movea.l    (a7),a0
[00058d86] 226f 0004                 movea.l    4(a7),a1
[00058d8a] 3368 0004 0028            move.w     4(a0),40(a1)
[00058d90] 2057                      movea.l    (a7),a0
[00058d92] 226f 0004                 movea.l    4(a7),a1
[00058d96] 3368 0006 002a            move.w     6(a0),42(a1)
[00058d9c] 206f 0004                 movea.l    4(a7),a0
[00058da0] 4eb9 0005 8ddc            jsr        Awi_cleanup
[00058da6] 206f 0004                 movea.l    4(a7),a0
[00058daa] 3f28 002a                 move.w     42(a0),-(a7)
[00058dae] 206f 0006                 movea.l    6(a7),a0
[00058db2] 3f28 0028                 move.w     40(a0),-(a7)
[00058db6] 206f 0008                 movea.l    8(a7),a0
[00058dba] 3f28 0026                 move.w     38(a0),-(a7)
[00058dbe] 206f 000a                 movea.l    10(a7),a0
[00058dc2] 3f28 0024                 move.w     36(a0),-(a7)
[00058dc6] 7205                      moveq.l    #5,d1
[00058dc8] 206f 000c                 movea.l    12(a7),a0
[00058dcc] 3028 0020                 move.w     32(a0),d0
[00058dd0] 4eb9 0007 f926            jsr        wind_set
[00058dd6] 504f                      addq.w     #8,a7
[00058dd8] 504f                      addq.w     #8,a7
[00058dda] 4e75                      rts
Awi_cleanup:
[00058ddc] 2f0a                      move.l     a2,-(a7)
[00058dde] 4fef ffc4                 lea.l      -60(a7),a7
[00058de2] 2f48 0030                 move.l     a0,48(a7)
[00058de6] 206f 0030                 movea.l    48(a7),a0
[00058dea] 3028 0056                 move.w     86(a0),d0
[00058dee] c07c 0800                 and.w      #$0800,d0
[00058df2] 6704                      beq.s      $00058DF8
[00058df4] 6000 0774                 bra        $0005956A
[00058df8] 206f 0030                 movea.l    48(a7),a0
[00058dfc] 3f68 0020 0014            move.w     32(a0),20(a7)
[00058e02] 206f 0030                 movea.l    48(a7),a0
[00058e06] 2f68 0014 0004            move.l     20(a0),4(a7)
[00058e0c] 206f 0030                 movea.l    48(a7),a0
[00058e10] 2ea8 0018                 move.l     24(a0),(a7)
[00058e14] 206f 0030                 movea.l    48(a7),a0
[00058e18] 2f68 005e 0008            move.l     94(a0),8(a7)
[00058e1e] 206f 0030                 movea.l    48(a7),a0
[00058e22] 3028 0048                 move.w     72(a0),d0
[00058e26] 807c ff00                 or.w       #$FF00,d0
[00058e2a] 3f40 000e                 move.w     d0,14(a7)
[00058e2e] 206f 0030                 movea.l    48(a7),a0
[00058e32] 3028 0048                 move.w     72(a0),d0
[00058e36] e040                      asr.w      #8,d0
[00058e38] 3f40 000c                 move.w     d0,12(a7)
[00058e3c] 7020                      moveq.l    #32,d0
[00058e3e] 206f 0030                 movea.l    48(a7),a0
[00058e42] c068 0022                 and.w      34(a0),d0
[00058e46] 6734                      beq.s      $00058E7C
[00058e48] 302f 000e                 move.w     14(a7),d0
[00058e4c] 4640                      not.w      d0
[00058e4e] 206f 0004                 movea.l    4(a7),a0
[00058e52] d168 0014                 add.w      d0,20(a0)
[00058e56] 302f 000e                 move.w     14(a7),d0
[00058e5a] 206f 0004                 movea.l    4(a7),a0
[00058e5e] c168 0014                 and.w      d0,20(a0)
[00058e62] 302f 000c                 move.w     12(a7),d0
[00058e66] 4640                      not.w      d0
[00058e68] 206f 0004                 movea.l    4(a7),a0
[00058e6c] d168 0016                 add.w      d0,22(a0)
[00058e70] 302f 000c                 move.w     12(a7),d0
[00058e74] 206f 0004                 movea.l    4(a7),a0
[00058e78] c168 0016                 and.w      d0,22(a0)
[00058e7c] 426f 001a                 clr.w      26(a7)
[00058e80] 202f 0008                 move.l     8(a7),d0
[00058e84] 671c                      beq.s      $00058EA2
[00058e86] 206f 0008                 movea.l    8(a7),a0
[00058e8a] 3228 0002                 move.w     2(a0),d1
[00058e8e] 48c1                      ext.l      d1
[00058e90] 2001                      move.l     d1,d0
[00058e92] d080                      add.l      d0,d0
[00058e94] d081                      add.l      d1,d0
[00058e96] e788                      lsl.l      #3,d0
[00058e98] 206f 0008                 movea.l    8(a7),a0
[00058e9c] 3f70 0816 001a            move.w     22(a0,d0.l),26(a7)
[00058ea2] 2017                      move.l     (a7),d0
[00058ea4] 670a                      beq.s      $00058EB0
[00058ea6] 2057                      movea.l    (a7),a0
[00058ea8] 3028 0016                 move.w     22(a0),d0
[00058eac] d16f 001a                 add.w      d0,26(a7)
[00058eb0] 206f 0030                 movea.l    48(a7),a0
[00058eb4] 3f68 0024 002e            move.w     36(a0),46(a7)
[00058eba] 206f 0030                 movea.l    48(a7),a0
[00058ebe] 3f68 0026 002c            move.w     38(a0),44(a7)
[00058ec4] 206f 0030                 movea.l    48(a7),a0
[00058ec8] 3f68 0028 002a            move.w     40(a0),42(a7)
[00058ece] 206f 0030                 movea.l    48(a7),a0
[00058ed2] 3f68 002a 0028            move.w     42(a0),40(a7)
[00058ed8] 2f39 000e 692a            move.l     _globl,-(a7)
[00058ede] 486f 0024                 pea.l      36(a7)
[00058ee2] 486f 002a                 pea.l      42(a7)
[00058ee6] 206f 0010                 movea.l    16(a7),a0
[00058eea] 3028 0016                 move.w     22(a0),d0
[00058eee] d06f 0026                 add.w      38(a7),d0
[00058ef2] 3f00                      move.w     d0,-(a7)
[00058ef4] 206f 0012                 movea.l    18(a7),a0
[00058ef8] 3f28 0014                 move.w     20(a0),-(a7)
[00058efc] 4267                      clr.w      -(a7)
[00058efe] 43ef 0036                 lea.l      54(a7),a1
[00058f02] 41ef 0038                 lea.l      56(a7),a0
[00058f06] 4242                      clr.w      d2
[00058f08] 246f 0042                 movea.l    66(a7),a2
[00058f0c] 322a 0022                 move.w     34(a2),d1
[00058f10] 4240                      clr.w      d0
[00058f12] 4eb9 0007 b8da            jsr        mt_wind_calc
[00058f18] 4fef 0012                 lea.l      18(a7),a7
[00058f1c] 302f 002a                 move.w     42(a7),d0
[00058f20] b06f 0022                 cmp.w      34(a7),d0
[00058f24] 6c06                      bge.s      $00058F2C
[00058f26] 302f 002a                 move.w     42(a7),d0
[00058f2a] 6004                      bra.s      $00058F30
[00058f2c] 302f 0022                 move.w     34(a7),d0
[00058f30] 3f40 002a                 move.w     d0,42(a7)
[00058f34] 302f 0028                 move.w     40(a7),d0
[00058f38] b06f 0020                 cmp.w      32(a7),d0
[00058f3c] 6c06                      bge.s      $00058F44
[00058f3e] 302f 0028                 move.w     40(a7),d0
[00058f42] 6004                      bra.s      $00058F48
[00058f44] 302f 0020                 move.w     32(a7),d0
[00058f48] 3f40 0028                 move.w     d0,40(a7)
[00058f4c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058f52] 302f 002a                 move.w     42(a7),d0
[00058f56] b068 000c                 cmp.w      12(a0),d0
[00058f5a] 6c06                      bge.s      $00058F62
[00058f5c] 302f 002a                 move.w     42(a7),d0
[00058f60] 600a                      bra.s      $00058F6C
[00058f62] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058f68] 3028 000c                 move.w     12(a0),d0
[00058f6c] 3f40 002a                 move.w     d0,42(a7)
[00058f70] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058f76] 302f 0028                 move.w     40(a7),d0
[00058f7a] b068 000e                 cmp.w      14(a0),d0
[00058f7e] 6c06                      bge.s      $00058F86
[00058f80] 302f 0028                 move.w     40(a7),d0
[00058f84] 600a                      bra.s      $00058F90
[00058f86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058f8c] 3028 000e                 move.w     14(a0),d0
[00058f90] 3f40 0028                 move.w     d0,40(a7)
[00058f94] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058f9a] 3028 0012                 move.w     18(a0),d0
[00058f9e] b06f 002a                 cmp.w      42(a7),d0
[00058fa2] 6f0c                      ble.s      $00058FB0
[00058fa4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058faa] 3028 0012                 move.w     18(a0),d0
[00058fae] 6004                      bra.s      $00058FB4
[00058fb0] 302f 002a                 move.w     42(a7),d0
[00058fb4] 3f40 002a                 move.w     d0,42(a7)
[00058fb8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058fbe] 3028 0014                 move.w     20(a0),d0
[00058fc2] b06f 0028                 cmp.w      40(a7),d0
[00058fc6] 6f0c                      ble.s      $00058FD4
[00058fc8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00058fce] 3028 0014                 move.w     20(a0),d0
[00058fd2] 6004                      bra.s      $00058FD8
[00058fd4] 302f 0028                 move.w     40(a7),d0
[00058fd8] 3f40 0028                 move.w     d0,40(a7)
[00058fdc] 3039 0011 3f20            move.w     $00113F20,d0
[00058fe2] 906f 0024                 sub.w      36(a7),d0
[00058fe6] 3f40 0016                 move.w     d0,22(a7)
[00058fea] 3039 0011 3f1e            move.w     virt_desk,d0
[00058ff0] d079 0011 3f22            add.w      $00113F22,d0
[00058ff6] 906f 002a                 sub.w      42(a7),d0
[00058ffa] 322f 002e                 move.w     46(a7),d1
[00058ffe] b240                      cmp.w      d0,d1
[00059000] 6c06                      bge.s      $00059008
[00059002] 302f 002e                 move.w     46(a7),d0
[00059006] 6010                      bra.s      $00059018
[00059008] 3039 0011 3f1e            move.w     virt_desk,d0
[0005900e] d079 0011 3f22            add.w      $00113F22,d0
[00059014] 906f 002a                 sub.w      42(a7),d0
[00059018] 3f40 002e                 move.w     d0,46(a7)
[0005901c] 3039 0011 3f20            move.w     $00113F20,d0
[00059022] d079 0011 3f24            add.w      $00113F24,d0
[00059028] 906f 0028                 sub.w      40(a7),d0
[0005902c] 322f 002c                 move.w     44(a7),d1
[00059030] b240                      cmp.w      d0,d1
[00059032] 6c06                      bge.s      $0005903A
[00059034] 302f 002c                 move.w     44(a7),d0
[00059038] 6010                      bra.s      $0005904A
[0005903a] 3039 0011 3f20            move.w     $00113F20,d0
[00059040] d079 0011 3f24            add.w      $00113F24,d0
[00059046] 906f 0028                 sub.w      40(a7),d0
[0005904a] 3f40 002c                 move.w     d0,44(a7)
[0005904e] 3039 0011 3f1e            move.w     virt_desk,d0
[00059054] b06f 002e                 cmp.w      46(a7),d0
[00059058] 6f08                      ble.s      $00059062
[0005905a] 3039 0011 3f1e            move.w     virt_desk,d0
[00059060] 6004                      bra.s      $00059066
[00059062] 302f 002e                 move.w     46(a7),d0
[00059066] 3f40 002e                 move.w     d0,46(a7)
[0005906a] 3039 0011 3f20            move.w     $00113F20,d0
[00059070] b06f 002c                 cmp.w      44(a7),d0
[00059074] 6f08                      ble.s      $0005907E
[00059076] 3039 0011 3f20            move.w     $00113F20,d0
[0005907c] 6004                      bra.s      $00059082
[0005907e] 302f 002c                 move.w     44(a7),d0
[00059082] 3f40 002c                 move.w     d0,44(a7)
[00059086] 2f39 000e 692a            move.l     _globl,-(a7)
[0005908c] 486f 0024                 pea.l      36(a7)
[00059090] 486f 002a                 pea.l      42(a7)
[00059094] 3f2f 0034                 move.w     52(a7),-(a7)
[00059098] 3f2f 0038                 move.w     56(a7),-(a7)
[0005909c] 3f2f 003c                 move.w     60(a7),-(a7)
[000590a0] 43ef 0036                 lea.l      54(a7),a1
[000590a4] 41ef 0038                 lea.l      56(a7),a0
[000590a8] 342f 0040                 move.w     64(a7),d2
[000590ac] 246f 0042                 movea.l    66(a7),a2
[000590b0] 322a 0022                 move.w     34(a2),d1
[000590b4] 7001                      moveq.l    #1,d0
[000590b6] 4eb9 0007 b8da            jsr        mt_wind_calc
[000590bc] 4fef 0012                 lea.l      18(a7),a7
[000590c0] 302f 001a                 move.w     26(a7),d0
[000590c4] 916f 0020                 sub.w      d0,32(a7)
[000590c8] 302f 000e                 move.w     14(a7),d0
[000590cc] c16f 0026                 and.w      d0,38(a7)
[000590d0] 302f 0024                 move.w     36(a7),d0
[000590d4] 906f 0016                 sub.w      22(a7),d0
[000590d8] 906f 000c                 sub.w      12(a7),d0
[000590dc] 5340                      subq.w     #1,d0
[000590de] c06f 000c                 and.w      12(a7),d0
[000590e2] d06f 0016                 add.w      22(a7),d0
[000590e6] d06f 001a                 add.w      26(a7),d0
[000590ea] 3f40 0024                 move.w     d0,36(a7)
[000590ee] 7020                      moveq.l    #32,d0
[000590f0] 206f 0030                 movea.l    48(a7),a0
[000590f4] c068 0022                 and.w      34(a0),d0
[000590f8] 6710                      beq.s      $0005910A
[000590fa] 302f 000e                 move.w     14(a7),d0
[000590fe] c16f 0022                 and.w      d0,34(a7)
[00059102] 302f 000c                 move.w     12(a7),d0
[00059106] c16f 0020                 and.w      d0,32(a7)
[0005910a] 202f 0008                 move.l     8(a7),d0
[0005910e] 6700 00e8                 beq        $000591F8
[00059112] 206f 0008                 movea.l    8(a7),a0
[00059116] 3228 0002                 move.w     2(a0),d1
[0005911a] 48c1                      ext.l      d1
[0005911c] 2001                      move.l     d1,d0
[0005911e] d080                      add.l      d0,d0
[00059120] d081                      add.l      d1,d0
[00059122] e788                      lsl.l      #3,d0
[00059124] 206f 0008                 movea.l    8(a7),a0
[00059128] 3f70 0802 0010            move.w     2(a0,d0.l),16(a7)
[0005912e] 322f 0010                 move.w     16(a7),d1
[00059132] 48c1                      ext.l      d1
[00059134] 2001                      move.l     d1,d0
[00059136] d080                      add.l      d0,d0
[00059138] d081                      add.l      d1,d0
[0005913a] e788                      lsl.l      #3,d0
[0005913c] 206f 0008                 movea.l    8(a7),a0
[00059140] 0c70 0003 0802            cmpi.w     #$0003,2(a0,d0.l)
[00059146] 6662                      bne.s      $000591AA
[00059148] 206f 0008                 movea.l    8(a7),a0
[0005914c] 322f 0010                 move.w     16(a7),d1
[00059150] 48c1                      ext.l      d1
[00059152] 2001                      move.l     d1,d0
[00059154] d080                      add.l      d0,d0
[00059156] d081                      add.l      d1,d0
[00059158] e788                      lsl.l      #3,d0
[0005915a] 226f 0008                 movea.l    8(a7),a1
[0005915e] 33a8 0048 0802            move.w     72(a0),2(a1,d0.l)
[00059164] 206f 0008                 movea.l    8(a7),a0
[00059168] 3f68 0004 0012            move.w     4(a0),18(a7)
[0005916e] 342f 0012                 move.w     18(a7),d2
[00059172] 48c2                      ext.l      d2
[00059174] 2202                      move.l     d2,d1
[00059176] d281                      add.l      d1,d1
[00059178] d282                      add.l      d2,d1
[0005917a] e789                      lsl.l      #3,d1
[0005917c] 206f 0008                 movea.l    8(a7),a0
[00059180] 3230 1802                 move.w     2(a0,d1.l),d1
[00059184] 48c1                      ext.l      d1
[00059186] 2001                      move.l     d1,d0
[00059188] d080                      add.l      d0,d0
[0005918a] d081                      add.l      d1,d0
[0005918c] e788                      lsl.l      #3,d0
[0005918e] 206f 0008                 movea.l    8(a7),a0
[00059192] 342f 0012                 move.w     18(a7),d2
[00059196] 48c2                      ext.l      d2
[00059198] 2202                      move.l     d2,d1
[0005919a] d281                      add.l      d1,d1
[0005919c] d282                      add.l      d2,d1
[0005919e] e789                      lsl.l      #3,d1
[000591a0] 226f 0008                 movea.l    8(a7),a1
[000591a4] 33b0 0800 1802            move.w     0(a0,d0.l),2(a1,d1.l)
[000591aa] 206f 0008                 movea.l    8(a7),a0
[000591ae] 3228 0002                 move.w     2(a0),d1
[000591b2] 48c1                      ext.l      d1
[000591b4] 2001                      move.l     d1,d0
[000591b6] d080                      add.l      d0,d0
[000591b8] d081                      add.l      d1,d0
[000591ba] e788                      lsl.l      #3,d0
[000591bc] 206f 0008                 movea.l    8(a7),a0
[000591c0] 00b0 00ff 0000 080c       ori.l      #$00FF0000,12(a0,d0.l)
[000591c8] 302f 0026                 move.w     38(a7),d0
[000591cc] 2079 0010 ee4e            movea.l    ACSblk,a0
[000591d2] 3428 0012                 move.w     18(a0),d2
[000591d6] 3202                      move.w     d2,d1
[000591d8] d241                      add.w      d1,d1
[000591da] d242                      add.w      d2,d1
[000591dc] 9041                      sub.w      d1,d0
[000591de] 206f 0008                 movea.l    8(a7),a0
[000591e2] 3140 0010                 move.w     d0,16(a0)
[000591e6] 302f 0024                 move.w     36(a7),d0
[000591ea] 906f 001a                 sub.w      26(a7),d0
[000591ee] 5340                      subq.w     #1,d0
[000591f0] 206f 0008                 movea.l    8(a7),a0
[000591f4] 3140 0012                 move.w     d0,18(a0)
[000591f8] 206f 0030                 movea.l    48(a7),a0
[000591fc] 316f 0026 0034            move.w     38(a7),52(a0)
[00059202] 206f 0030                 movea.l    48(a7),a0
[00059206] 316f 0024 0036            move.w     36(a7),54(a0)
[0005920c] 206f 0030                 movea.l    48(a7),a0
[00059210] 316f 0022 0038            move.w     34(a7),56(a0)
[00059216] 206f 0030                 movea.l    48(a7),a0
[0005921a] 316f 0020 003a            move.w     32(a7),58(a0)
[00059220] 2017                      move.l     (a7),d0
[00059222] 6700 00c4                 beq        $000592E8
[00059226] 7040                      moveq.l    #64,d0
[00059228] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005922e] 2068 023c                 movea.l    572(a0),a0
[00059232] c068 000e                 and.w      14(a0),d0
[00059236] 6700 0094                 beq        $000592CC
[0005923a] 2057                      movea.l    (a7),a0
[0005923c] 3028 0014                 move.w     20(a0),d0
[00059240] b06f 0022                 cmp.w      34(a7),d0
[00059244] 6c00 0086                 bge        $000592CC
[00059248] 206f 0030                 movea.l    48(a7),a0
[0005924c] 3028 0038                 move.w     56(a0),d0
[00059250] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059256] 3228 0012                 move.w     18(a0),d1
[0005925a] d241                      add.w      d1,d1
[0005925c] 9041                      sub.w      d1,d0
[0005925e] 6f18                      ble.s      $00059278
[00059260] 206f 0030                 movea.l    48(a7),a0
[00059264] 3028 0038                 move.w     56(a0),d0
[00059268] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005926e] 3228 0012                 move.w     18(a0),d1
[00059272] d241                      add.w      d1,d1
[00059274] 9041                      sub.w      d1,d0
[00059276] 6002                      bra.s      $0005927A
[00059278] 4240                      clr.w      d0
[0005927a] 206f 0030                 movea.l    48(a7),a0
[0005927e] d068 0034                 add.w      52(a0),d0
[00059282] 3f40 0034                 move.w     d0,52(a7)
[00059286] 206f 0030                 movea.l    48(a7),a0
[0005928a] 3f68 0036 0036            move.w     54(a0),54(a7)
[00059290] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059296] 3028 0012                 move.w     18(a0),d0
[0005929a] d040                      add.w      d0,d0
[0005929c] 3f40 0038                 move.w     d0,56(a7)
[000592a0] 2057                      movea.l    (a7),a0
[000592a2] 3f68 0016 003a            move.w     22(a0),58(a7)
[000592a8] 41ef 0034                 lea.l      52(a7),a0
[000592ac] 226f 0030                 movea.l    48(a7),a1
[000592b0] 3229 0020                 move.w     32(a1),d1
[000592b4] 2279 0010 ee4e            movea.l    ACSblk,a1
[000592ba] 3011                      move.w     (a1),d0
[000592bc] 4eb9 0005 eb60            jsr        Aev_WmRedraw
[000592c2] 206f 0030                 movea.l    48(a7),a0
[000592c6] 0068 0010 0056            ori.w      #$0010,86(a0)
[000592cc] 2057                      movea.l    (a7),a0
[000592ce] 4268 0010                 clr.w      16(a0)
[000592d2] 2057                      movea.l    (a7),a0
[000592d4] 3028 0016                 move.w     22(a0),d0
[000592d8] 4440                      neg.w      d0
[000592da] 2057                      movea.l    (a7),a0
[000592dc] 3140 0012                 move.w     d0,18(a0)
[000592e0] 2057                      movea.l    (a7),a0
[000592e2] 316f 0022 0014            move.w     34(a7),20(a0)
[000592e8] 206f 0004                 movea.l    4(a7),a0
[000592ec] 3028 0014                 move.w     20(a0),d0
[000592f0] 906f 0022                 sub.w      34(a7),d0
[000592f4] c06f 000e                 and.w      14(a7),d0
[000592f8] 3f40 001e                 move.w     d0,30(a7)
[000592fc] 206f 0004                 movea.l    4(a7),a0
[00059300] 3028 0010                 move.w     16(a0),d0
[00059304] 322f 001e                 move.w     30(a7),d1
[00059308] 4441                      neg.w      d1
[0005930a] b041                      cmp.w      d1,d0
[0005930c] 6c0e                      bge.s      $0005931C
[0005930e] 302f 001e                 move.w     30(a7),d0
[00059312] 4440                      neg.w      d0
[00059314] 206f 0004                 movea.l    4(a7),a0
[00059318] 3140 0010                 move.w     d0,16(a0)
[0005931c] 206f 0004                 movea.l    4(a7),a0
[00059320] 3028 0016                 move.w     22(a0),d0
[00059324] 906f 0020                 sub.w      32(a7),d0
[00059328] c06f 000c                 and.w      12(a7),d0
[0005932c] 3f40 001c                 move.w     d0,28(a7)
[00059330] 206f 0004                 movea.l    4(a7),a0
[00059334] 3028 0012                 move.w     18(a0),d0
[00059338] 322f 001c                 move.w     28(a7),d1
[0005933c] 4441                      neg.w      d1
[0005933e] b041                      cmp.w      d1,d0
[00059340] 6c0e                      bge.s      $00059350
[00059342] 302f 001c                 move.w     28(a7),d0
[00059346] 4440                      neg.w      d0
[00059348] 206f 0004                 movea.l    4(a7),a0
[0005934c] 3140 0012                 move.w     d0,18(a0)
[00059350] 2f39 000e 692a            move.l     _globl,-(a7)
[00059356] 206f 0034                 movea.l    52(a7),a0
[0005935a] 4868 002a                 pea.l      42(a0)
[0005935e] 206f 0038                 movea.l    56(a7),a0
[00059362] 4868 0028                 pea.l      40(a0)
[00059366] 302f 002c                 move.w     44(a7),d0
[0005936a] d06f 0026                 add.w      38(a7),d0
[0005936e] 3f00                      move.w     d0,-(a7)
[00059370] 3f2f 0030                 move.w     48(a7),-(a7)
[00059374] 302f 0034                 move.w     52(a7),d0
[00059378] 906f 002a                 sub.w      42(a7),d0
[0005937c] 3f00                      move.w     d0,-(a7)
[0005937e] 226f 0042                 movea.l    66(a7),a1
[00059382] 43e9 0026                 lea.l      38(a1),a1
[00059386] 206f 0042                 movea.l    66(a7),a0
[0005938a] 41e8 0024                 lea.l      36(a0),a0
[0005938e] 342f 0038                 move.w     56(a7),d2
[00059392] 246f 0042                 movea.l    66(a7),a2
[00059396] 322a 0022                 move.w     34(a2),d1
[0005939a] 4240                      clr.w      d0
[0005939c] 4eb9 0007 b8da            jsr        mt_wind_calc
[000593a2] 4fef 0012                 lea.l      18(a7),a7
[000593a6] 206f 0030                 movea.l    48(a7),a0
[000593aa] 3028 0022                 move.w     34(a0),d0
[000593ae] c07c 0800                 and.w      #$0800,d0
[000593b2] 6700 00d4                 beq        $00059488
[000593b6] 7020                      moveq.l    #32,d0
[000593b8] 206f 0030                 movea.l    48(a7),a0
[000593bc] c068 0054                 and.w      84(a0),d0
[000593c0] 6600 00c6                 bne        $00059488
[000593c4] 426f 0018                 clr.w      24(a7)
[000593c8] 302f 001e                 move.w     30(a7),d0
[000593cc] 6f28                      ble.s      $000593F6
[000593ce] 206f 0004                 movea.l    4(a7),a0
[000593d2] 3228 0010                 move.w     16(a0),d1
[000593d6] 48c1                      ext.l      d1
[000593d8] 2001                      move.l     d1,d0
[000593da] eb88                      lsl.l      #5,d0
[000593dc] 9081                      sub.l      d1,d0
[000593de] e588                      lsl.l      #2,d0
[000593e0] d081                      add.l      d1,d0
[000593e2] e788                      lsl.l      #3,d0
[000593e4] 4480                      neg.l      d0
[000593e6] 322f 001e                 move.w     30(a7),d1
[000593ea] 48c1                      ext.l      d1
[000593ec] 4eb9 0008 3cf6            jsr        _ldiv
[000593f2] 3f40 0018                 move.w     d0,24(a7)
[000593f6] 206f 0030                 movea.l    48(a7),a0
[000593fa] 302f 0018                 move.w     24(a7),d0
[000593fe] b068 003c                 cmp.w      60(a0),d0
[00059402] 6728                      beq.s      $0005942C
[00059404] 206f 0030                 movea.l    48(a7),a0
[00059408] 316f 0018 003c            move.w     24(a7),60(a0)
[0005940e] 302f 0014                 move.w     20(a7),d0
[00059412] 6f18                      ble.s      $0005942C
[00059414] 4267                      clr.w      -(a7)
[00059416] 4267                      clr.w      -(a7)
[00059418] 4267                      clr.w      -(a7)
[0005941a] 3f2f 001e                 move.w     30(a7),-(a7)
[0005941e] 7208                      moveq.l    #8,d1
[00059420] 302f 001c                 move.w     28(a7),d0
[00059424] 4eb9 0007 f926            jsr        wind_set
[0005942a] 504f                      addq.w     #8,a7
[0005942c] 322f 0022                 move.w     34(a7),d1
[00059430] 48c1                      ext.l      d1
[00059432] 2001                      move.l     d1,d0
[00059434] eb88                      lsl.l      #5,d0
[00059436] 9081                      sub.l      d1,d0
[00059438] e588                      lsl.l      #2,d0
[0005943a] d081                      add.l      d1,d0
[0005943c] e788                      lsl.l      #3,d0
[0005943e] 206f 0004                 movea.l    4(a7),a0
[00059442] 3228 0014                 move.w     20(a0),d1
[00059446] 48c1                      ext.l      d1
[00059448] 4eb9 0008 3cf6            jsr        _ldiv
[0005944e] 3f40 0018                 move.w     d0,24(a7)
[00059452] 206f 0030                 movea.l    48(a7),a0
[00059456] 302f 0018                 move.w     24(a7),d0
[0005945a] b068 0040                 cmp.w      64(a0),d0
[0005945e] 6728                      beq.s      $00059488
[00059460] 206f 0030                 movea.l    48(a7),a0
[00059464] 316f 0018 0040            move.w     24(a7),64(a0)
[0005946a] 302f 0014                 move.w     20(a7),d0
[0005946e] 6f18                      ble.s      $00059488
[00059470] 4267                      clr.w      -(a7)
[00059472] 4267                      clr.w      -(a7)
[00059474] 4267                      clr.w      -(a7)
[00059476] 3f2f 001e                 move.w     30(a7),-(a7)
[0005947a] 720f                      moveq.l    #15,d1
[0005947c] 302f 001c                 move.w     28(a7),d0
[00059480] 4eb9 0007 f926            jsr        wind_set
[00059486] 504f                      addq.w     #8,a7
[00059488] 206f 0030                 movea.l    48(a7),a0
[0005948c] 3028 0022                 move.w     34(a0),d0
[00059490] c07c 0100                 and.w      #$0100,d0
[00059494] 6700 00d4                 beq        $0005956A
[00059498] 7040                      moveq.l    #64,d0
[0005949a] 206f 0030                 movea.l    48(a7),a0
[0005949e] c068 0054                 and.w      84(a0),d0
[000594a2] 6600 00c6                 bne        $0005956A
[000594a6] 426f 0018                 clr.w      24(a7)
[000594aa] 302f 001c                 move.w     28(a7),d0
[000594ae] 6f28                      ble.s      $000594D8
[000594b0] 206f 0004                 movea.l    4(a7),a0
[000594b4] 3228 0012                 move.w     18(a0),d1
[000594b8] 48c1                      ext.l      d1
[000594ba] 2001                      move.l     d1,d0
[000594bc] eb88                      lsl.l      #5,d0
[000594be] 9081                      sub.l      d1,d0
[000594c0] e588                      lsl.l      #2,d0
[000594c2] d081                      add.l      d1,d0
[000594c4] e788                      lsl.l      #3,d0
[000594c6] 4480                      neg.l      d0
[000594c8] 322f 001c                 move.w     28(a7),d1
[000594cc] 48c1                      ext.l      d1
[000594ce] 4eb9 0008 3cf6            jsr        _ldiv
[000594d4] 3f40 0018                 move.w     d0,24(a7)
[000594d8] 206f 0030                 movea.l    48(a7),a0
[000594dc] 302f 0018                 move.w     24(a7),d0
[000594e0] b068 003e                 cmp.w      62(a0),d0
[000594e4] 6728                      beq.s      $0005950E
[000594e6] 206f 0030                 movea.l    48(a7),a0
[000594ea] 316f 0018 003e            move.w     24(a7),62(a0)
[000594f0] 302f 0014                 move.w     20(a7),d0
[000594f4] 6f18                      ble.s      $0005950E
[000594f6] 4267                      clr.w      -(a7)
[000594f8] 4267                      clr.w      -(a7)
[000594fa] 4267                      clr.w      -(a7)
[000594fc] 3f2f 001e                 move.w     30(a7),-(a7)
[00059500] 7209                      moveq.l    #9,d1
[00059502] 302f 001c                 move.w     28(a7),d0
[00059506] 4eb9 0007 f926            jsr        wind_set
[0005950c] 504f                      addq.w     #8,a7
[0005950e] 322f 0020                 move.w     32(a7),d1
[00059512] 48c1                      ext.l      d1
[00059514] 2001                      move.l     d1,d0
[00059516] eb88                      lsl.l      #5,d0
[00059518] 9081                      sub.l      d1,d0
[0005951a] e588                      lsl.l      #2,d0
[0005951c] d081                      add.l      d1,d0
[0005951e] e788                      lsl.l      #3,d0
[00059520] 206f 0004                 movea.l    4(a7),a0
[00059524] 3228 0016                 move.w     22(a0),d1
[00059528] 48c1                      ext.l      d1
[0005952a] 4eb9 0008 3cf6            jsr        _ldiv
[00059530] 3f40 0018                 move.w     d0,24(a7)
[00059534] 206f 0030                 movea.l    48(a7),a0
[00059538] 302f 0018                 move.w     24(a7),d0
[0005953c] b068 0042                 cmp.w      66(a0),d0
[00059540] 6728                      beq.s      $0005956A
[00059542] 206f 0030                 movea.l    48(a7),a0
[00059546] 316f 0018 0042            move.w     24(a7),66(a0)
[0005954c] 302f 0014                 move.w     20(a7),d0
[00059550] 6f18                      ble.s      $0005956A
[00059552] 4267                      clr.w      -(a7)
[00059554] 4267                      clr.w      -(a7)
[00059556] 4267                      clr.w      -(a7)
[00059558] 3f2f 001e                 move.w     30(a7),-(a7)
[0005955c] 7210                      moveq.l    #16,d1
[0005955e] 302f 001c                 move.w     28(a7),d0
[00059562] 4eb9 0007 f926            jsr        wind_set
[00059568] 504f                      addq.w     #8,a7
[0005956a] 4fef 003c                 lea.l      60(a7),a7
[0005956e] 245f                      movea.l    (a7)+,a2
[00059570] 4e75                      rts
Awi_oblist:
[00059572] 2f0a                      move.l     a2,-(a7)
[00059574] 4fef ffda                 lea.l      -38(a7),a7
[00059578] 2f48 0022                 move.l     a0,34(a7)
[0005957c] 426f 0016                 clr.w      22(a7)
[00059580] 426f 0014                 clr.w      20(a7)
[00059584] 3f7c ffff 0010            move.w     #$FFFF,16(a7)
[0005958a] 3f7c ffff 000e            move.w     #$FFFF,14(a7)
[00059590] 4257                      clr.w      (a7)
[00059592] 206f 0022                 movea.l    34(a7),a0
[00059596] 3028 0056                 move.w     86(a0),d0
[0005959a] c07c 0800                 and.w      #$0800,d0
[0005959e] 660c                      bne.s      $000595AC
[000595a0] 206f 0022                 movea.l    34(a7),a0
[000595a4] 2f68 0014 001e            move.l     20(a0),30(a7)
[000595aa] 6604                      bne.s      $000595B0
[000595ac] 6000 03d4                 bra        $00059982
[000595b0] 7008                      moveq.l    #8,d0
[000595b2] 206f 0022                 movea.l    34(a7),a0
[000595b6] c068 0054                 and.w      84(a0),d0
[000595ba] 6700 02ec                 beq        $000598A8
[000595be] 2f39 000e 692a            move.l     _globl,-(a7)
[000595c4] 486f 0018                 pea.l      24(a7)
[000595c8] 486f 001e                 pea.l      30(a7)
[000595cc] 206f 002e                 movea.l    46(a7),a0
[000595d0] 3f28 002a                 move.w     42(a0),-(a7)
[000595d4] 206f 0030                 movea.l    48(a7),a0
[000595d8] 3f28 0028                 move.w     40(a0),-(a7)
[000595dc] 206f 0032                 movea.l    50(a7),a0
[000595e0] 3f28 0026                 move.w     38(a0),-(a7)
[000595e4] 43ef 0024                 lea.l      36(a7),a1
[000595e8] 41ef 0024                 lea.l      36(a7),a0
[000595ec] 246f 0034                 movea.l    52(a7),a2
[000595f0] 342a 0024                 move.w     36(a2),d2
[000595f4] 246f 0034                 movea.l    52(a7),a2
[000595f8] 322a 0022                 move.w     34(a2),d1
[000595fc] 7001                      moveq.l    #1,d0
[000595fe] 4eb9 0007 b8da            jsr        mt_wind_calc
[00059604] 4fef 0012                 lea.l      18(a7),a7
[00059608] 206f 001e                 movea.l    30(a7),a0
[0005960c] 3f68 0002 001c            move.w     2(a0),28(a7)
[00059612] 426f 0002                 clr.w      2(a7)
[00059616] 302f 001c                 move.w     28(a7),d0
[0005961a] 6f00 01a2                 ble        $000597BE
[0005961e] 322f 001c                 move.w     28(a7),d1
[00059622] 48c1                      ext.l      d1
[00059624] 2001                      move.l     d1,d0
[00059626] d080                      add.l      d0,d0
[00059628] d081                      add.l      d1,d0
[0005962a] e788                      lsl.l      #3,d0
[0005962c] 206f 001e                 movea.l    30(a7),a0
[00059630] 3030 0810                 move.w     16(a0,d0.l),d0
[00059634] 3f40 001a                 move.w     d0,26(a7)
[00059638] 3f40 0008                 move.w     d0,8(a7)
[0005963c] 322f 001c                 move.w     28(a7),d1
[00059640] 48c1                      ext.l      d1
[00059642] 2001                      move.l     d1,d0
[00059644] d080                      add.l      d0,d0
[00059646] d081                      add.l      d1,d0
[00059648] e788                      lsl.l      #3,d0
[0005964a] 206f 001e                 movea.l    30(a7),a0
[0005964e] 3030 0812                 move.w     18(a0,d0.l),d0
[00059652] 3f40 0018                 move.w     d0,24(a7)
[00059656] 3f40 0006                 move.w     d0,6(a7)
[0005965a] 6000 014e                 bra        $000597AA
[0005965e] 303c 0080                 move.w     #$0080,d0
[00059662] 342f 001c                 move.w     28(a7),d2
[00059666] 48c2                      ext.l      d2
[00059668] 2202                      move.l     d2,d1
[0005966a] d281                      add.l      d1,d1
[0005966c] d282                      add.l      d2,d1
[0005966e] e789                      lsl.l      #3,d1
[00059670] 206f 001e                 movea.l    30(a7),a0
[00059674] c070 1808                 and.w      8(a0,d1.l),d0
[00059678] 6600 0118                 bne        $00059792
[0005967c] 302f 0008                 move.w     8(a7),d0
[00059680] 342f 001c                 move.w     28(a7),d2
[00059684] 48c2                      ext.l      d2
[00059686] 2202                      move.l     d2,d1
[00059688] d281                      add.l      d1,d1
[0005968a] d282                      add.l      d2,d1
[0005968c] e789                      lsl.l      #3,d1
[0005968e] 206f 001e                 movea.l    30(a7),a0
[00059692] d070 1814                 add.w      20(a0,d1.l),d0
[00059696] 3f40 0004                 move.w     d0,4(a7)
[0005969a] 302f 0004                 move.w     4(a7),d0
[0005969e] b06f 0016                 cmp.w      22(a7),d0
[000596a2] 6f32                      ble.s      $000596D6
[000596a4] 206f 001e                 movea.l    30(a7),a0
[000596a8] 302f 001c                 move.w     28(a7),d0
[000596ac] b068 0002                 cmp.w      2(a0),d0
[000596b0] 6724                      beq.s      $000596D6
[000596b2] 302f 001a                 move.w     26(a7),d0
[000596b6] 906f 0008                 sub.w      8(a7),d0
[000596ba] d16f 0004                 add.w      d0,4(a7)
[000596be] 3f6f 001a 0008            move.w     26(a7),8(a7)
[000596c4] 302f 0002                 move.w     2(a7),d0
[000596c8] d06f 0018                 add.w      24(a7),d0
[000596cc] d16f 0006                 add.w      d0,6(a7)
[000596d0] 3f6f 0018 0002            move.w     24(a7),2(a7)
[000596d6] 322f 001c                 move.w     28(a7),d1
[000596da] 48c1                      ext.l      d1
[000596dc] 2001                      move.l     d1,d0
[000596de] d080                      add.l      d0,d0
[000596e0] d081                      add.l      d1,d0
[000596e2] e788                      lsl.l      #3,d0
[000596e4] 206f 001e                 movea.l    30(a7),a0
[000596e8] 322f 0002                 move.w     2(a7),d1
[000596ec] b270 0816                 cmp.w      22(a0,d0.l),d1
[000596f0] 6c18                      bge.s      $0005970A
[000596f2] 322f 001c                 move.w     28(a7),d1
[000596f6] 48c1                      ext.l      d1
[000596f8] 2001                      move.l     d1,d0
[000596fa] d080                      add.l      d0,d0
[000596fc] d081                      add.l      d1,d0
[000596fe] e788                      lsl.l      #3,d0
[00059700] 206f 001e                 movea.l    30(a7),a0
[00059704] 3f70 0816 0002            move.w     22(a0,d0.l),2(a7)
[0005970a] 322f 001c                 move.w     28(a7),d1
[0005970e] 48c1                      ext.l      d1
[00059710] 2001                      move.l     d1,d0
[00059712] d080                      add.l      d0,d0
[00059714] d081                      add.l      d1,d0
[00059716] e788                      lsl.l      #3,d0
[00059718] 206f 001e                 movea.l    30(a7),a0
[0005971c] 3030 0810                 move.w     16(a0,d0.l),d0
[00059720] b06f 0008                 cmp.w      8(a7),d0
[00059724] 661c                      bne.s      $00059742
[00059726] 322f 001c                 move.w     28(a7),d1
[0005972a] 48c1                      ext.l      d1
[0005972c] 2001                      move.l     d1,d0
[0005972e] d080                      add.l      d0,d0
[00059730] d081                      add.l      d1,d0
[00059732] e788                      lsl.l      #3,d0
[00059734] 206f 001e                 movea.l    30(a7),a0
[00059738] 3030 0812                 move.w     18(a0,d0.l),d0
[0005973c] b06f 0006                 cmp.w      6(a7),d0
[00059740] 6734                      beq.s      $00059776
[00059742] 322f 001c                 move.w     28(a7),d1
[00059746] 48c1                      ext.l      d1
[00059748] 2001                      move.l     d1,d0
[0005974a] d080                      add.l      d0,d0
[0005974c] d081                      add.l      d1,d0
[0005974e] e788                      lsl.l      #3,d0
[00059750] 206f 001e                 movea.l    30(a7),a0
[00059754] 31af 0008 0810            move.w     8(a7),16(a0,d0.l)
[0005975a] 322f 001c                 move.w     28(a7),d1
[0005975e] 48c1                      ext.l      d1
[00059760] 2001                      move.l     d1,d0
[00059762] d080                      add.l      d0,d0
[00059764] d081                      add.l      d1,d0
[00059766] e788                      lsl.l      #3,d0
[00059768] 206f 001e                 movea.l    30(a7),a0
[0005976c] 31af 0006 0812            move.w     6(a7),18(a0,d0.l)
[00059772] 3ebc 0001                 move.w     #$0001,(a7)
[00059776] 302f 0016                 move.w     22(a7),d0
[0005977a] b06f 0004                 cmp.w      4(a7),d0
[0005977e] 6c06                      bge.s      $00059786
[00059780] 3f6f 0004 0016            move.w     4(a7),22(a7)
[00059786] 302f 0004                 move.w     4(a7),d0
[0005978a] d06f 001a                 add.w      26(a7),d0
[0005978e] 3f40 0008                 move.w     d0,8(a7)
[00059792] 322f 001c                 move.w     28(a7),d1
[00059796] 48c1                      ext.l      d1
[00059798] 2001                      move.l     d1,d0
[0005979a] d080                      add.l      d0,d0
[0005979c] d081                      add.l      d1,d0
[0005979e] e788                      lsl.l      #3,d0
[000597a0] 206f 001e                 movea.l    30(a7),a0
[000597a4] 3f70 0800 001c            move.w     0(a0,d0.l),28(a7)
[000597aa] 302f 001c                 move.w     28(a7),d0
[000597ae] 6e00 feae                 bgt        $0005965E
[000597b2] 302f 0006                 move.w     6(a7),d0
[000597b6] d06f 0018                 add.w      24(a7),d0
[000597ba] d16f 0002                 add.w      d0,2(a7)
[000597be] 206f 001e                 movea.l    30(a7),a0
[000597c2] 3028 0014                 move.w     20(a0),d0
[000597c6] b06f 0016                 cmp.w      22(a7),d0
[000597ca] 6736                      beq.s      $00059802
[000597cc] 206f 001e                 movea.l    30(a7),a0
[000597d0] 3f68 0014 0010            move.w     20(a0),16(a7)
[000597d6] 206f 0022                 movea.l    34(a7),a0
[000597da] 3028 0048                 move.w     72(a0),d0
[000597de] 807c ff00                 or.w       #$FF00,d0
[000597e2] c16f 0016                 and.w      d0,22(a7)
[000597e6] 206f 001e                 movea.l    30(a7),a0
[000597ea] 316f 0016 0014            move.w     22(a7),20(a0)
[000597f0] 206f 0022                 movea.l    34(a7),a0
[000597f4] 3028 0022                 move.w     34(a0),d0
[000597f8] c07c 0800                 and.w      #$0800,d0
[000597fc] 6704                      beq.s      $00059802
[000597fe] 3ebc 0001                 move.w     #$0001,(a7)
[00059802] 206f 0022                 movea.l    34(a7),a0
[00059806] 2028 005e                 move.l     94(a0),d0
[0005980a] 6726                      beq.s      $00059832
[0005980c] 206f 0022                 movea.l    34(a7),a0
[00059810] 2068 005e                 movea.l    94(a0),a0
[00059814] 3228 0002                 move.w     2(a0),d1
[00059818] 48c1                      ext.l      d1
[0005981a] 2001                      move.l     d1,d0
[0005981c] d080                      add.l      d0,d0
[0005981e] d081                      add.l      d1,d0
[00059820] e788                      lsl.l      #3,d0
[00059822] 206f 0022                 movea.l    34(a7),a0
[00059826] 2068 005e                 movea.l    94(a0),a0
[0005982a] 3030 0816                 move.w     22(a0,d0.l),d0
[0005982e] 916f 0014                 sub.w      d0,20(a7)
[00059832] 206f 0022                 movea.l    34(a7),a0
[00059836] 2028 0018                 move.l     24(a0),d0
[0005983a] 6710                      beq.s      $0005984C
[0005983c] 206f 0022                 movea.l    34(a7),a0
[00059840] 2068 0018                 movea.l    24(a0),a0
[00059844] 3028 0016                 move.w     22(a0),d0
[00059848] 916f 0014                 sub.w      d0,20(a7)
[0005984c] 302f 0014                 move.w     20(a7),d0
[00059850] b06f 0002                 cmp.w      2(a7),d0
[00059854] 6f06                      ble.s      $0005985C
[00059856] 302f 0014                 move.w     20(a7),d0
[0005985a] 6004                      bra.s      $00059860
[0005985c] 302f 0002                 move.w     2(a7),d0
[00059860] 206f 0022                 movea.l    34(a7),a0
[00059864] 3228 0048                 move.w     72(a0),d1
[00059868] e041                      asr.w      #8,d1
[0005986a] 827c ff00                 or.w       #$FF00,d1
[0005986e] c041                      and.w      d1,d0
[00059870] 3f40 0014                 move.w     d0,20(a7)
[00059874] 206f 001e                 movea.l    30(a7),a0
[00059878] 3028 0016                 move.w     22(a0),d0
[0005987c] b06f 0014                 cmp.w      20(a7),d0
[00059880] 6726                      beq.s      $000598A8
[00059882] 206f 001e                 movea.l    30(a7),a0
[00059886] 3f68 0016 000e            move.w     22(a0),14(a7)
[0005988c] 206f 001e                 movea.l    30(a7),a0
[00059890] 316f 0014 0016            move.w     20(a7),22(a0)
[00059896] 206f 0022                 movea.l    34(a7),a0
[0005989a] 3028 0022                 move.w     34(a0),d0
[0005989e] c07c 0800                 and.w      #$0800,d0
[000598a2] 6704                      beq.s      $000598A8
[000598a4] 3ebc 0001                 move.w     #$0001,(a7)
[000598a8] 206f 0022                 movea.l    34(a7),a0
[000598ac] 3f68 003c 000c            move.w     60(a0),12(a7)
[000598b2] 206f 0022                 movea.l    34(a7),a0
[000598b6] 3f68 003e 000a            move.w     62(a0),10(a7)
[000598bc] 206f 0022                 movea.l    34(a7),a0
[000598c0] 6100 f51a                 bsr        Awi_cleanup
[000598c4] 3017                      move.w     (a7),d0
[000598c6] 6600 00ac                 bne        $00059974
[000598ca] 7008                      moveq.l    #8,d0
[000598cc] 206f 0022                 movea.l    34(a7),a0
[000598d0] c068 0054                 and.w      84(a0),d0
[000598d4] 6756                      beq.s      $0005992C
[000598d6] 206f 0022                 movea.l    34(a7),a0
[000598da] 3028 0022                 move.w     34(a0),d0
[000598de] c07c 0800                 and.w      #$0800,d0
[000598e2] 671a                      beq.s      $000598FE
[000598e4] 302f 0010                 move.w     16(a7),d0
[000598e8] b06f 0016                 cmp.w      22(a7),d0
[000598ec] 6c10                      bge.s      $000598FE
[000598ee] 206f 0022                 movea.l    34(a7),a0
[000598f2] 0c68 03e8 003c            cmpi.w     #$03E8,60(a0)
[000598f8] 6604                      bne.s      $000598FE
[000598fa] 3ebc 0001                 move.w     #$0001,(a7)
[000598fe] 3017                      move.w     (a7),d0
[00059900] 6628                      bne.s      $0005992A
[00059902] 206f 0022                 movea.l    34(a7),a0
[00059906] 3028 0022                 move.w     34(a0),d0
[0005990a] c07c 0100                 and.w      #$0100,d0
[0005990e] 671a                      beq.s      $0005992A
[00059910] 302f 000e                 move.w     14(a7),d0
[00059914] b06f 0014                 cmp.w      20(a7),d0
[00059918] 6c10                      bge.s      $0005992A
[0005991a] 206f 0022                 movea.l    34(a7),a0
[0005991e] 0c68 03e8 003e            cmpi.w     #$03E8,62(a0)
[00059924] 6604                      bne.s      $0005992A
[00059926] 3ebc 0001                 move.w     #$0001,(a7)
[0005992a] 6048                      bra.s      $00059974
[0005992c] 206f 0022                 movea.l    34(a7),a0
[00059930] 3028 0022                 move.w     34(a0),d0
[00059934] c07c 0800                 and.w      #$0800,d0
[00059938] 6714                      beq.s      $0005994E
[0005993a] 206f 0022                 movea.l    34(a7),a0
[0005993e] 3028 003c                 move.w     60(a0),d0
[00059942] 6606                      bne.s      $0005994A
[00059944] 302f 000c                 move.w     12(a7),d0
[00059948] 6704                      beq.s      $0005994E
[0005994a] 3ebc 0001                 move.w     #$0001,(a7)
[0005994e] 3017                      move.w     (a7),d0
[00059950] 6622                      bne.s      $00059974
[00059952] 206f 0022                 movea.l    34(a7),a0
[00059956] 3028 0022                 move.w     34(a0),d0
[0005995a] c07c 0100                 and.w      #$0100,d0
[0005995e] 6714                      beq.s      $00059974
[00059960] 206f 0022                 movea.l    34(a7),a0
[00059964] 3028 003e                 move.w     62(a0),d0
[00059968] 6606                      bne.s      $00059970
[0005996a] 302f 000a                 move.w     10(a7),d0
[0005996e] 6704                      beq.s      $00059974
[00059970] 3ebc 0001                 move.w     #$0001,(a7)
[00059974] 3017                      move.w     (a7),d0
[00059976] 670a                      beq.s      $00059982
[00059978] 206f 0022                 movea.l    34(a7),a0
[0005997c] 0068 0010 0056            ori.w      #$0010,86(a0)
[00059982] 4fef 0026                 lea.l      38(a7),a7
[00059986] 245f                      movea.l    (a7)+,a2
[00059988] 4e75                      rts
Awi_iconify:
[0005998a] 4fef ffec                 lea.l      -20(a7),a7
[0005998e] 2f48 0010                 move.l     a0,16(a7)
[00059992] 3f40 000e                 move.w     d0,14(a7)
[00059996] 206f 0010                 movea.l    16(a7),a0
[0005999a] 3028 0020                 move.w     32(a0),d0
[0005999e] 6f1a                      ble.s      $000599BA
[000599a0] 206f 0010                 movea.l    16(a7),a0
[000599a4] 3028 0056                 move.w     86(a0),d0
[000599a8] c07c 0c00                 and.w      #$0C00,d0
[000599ac] 660c                      bne.s      $000599BA
[000599ae] 206f 0010                 movea.l    16(a7),a0
[000599b2] 6100 c2ce                 bsr        Awi_iconcreate
[000599b6] 4a40                      tst.w      d0
[000599b8] 6606                      bne.s      $000599C0
[000599ba] 4240                      clr.w      d0
[000599bc] 6000 02a8                 bra        $00059C66
[000599c0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000599c6] 2068 0240                 movea.l    576(a0),a0
[000599ca] b1ef 0010                 cmpa.l     16(a7),a0
[000599ce] 660c                      bne.s      $000599DC
[000599d0] 4eb9 0004 810e            jsr        Adr_unselect
[000599d6] 4eb9 0004 b086            jsr        Aev_mess
[000599dc] 70ff                      moveq.l    #-1,d0
[000599de] 206f 0010                 movea.l    16(a7),a0
[000599e2] 3140 0052                 move.w     d0,82(a0)
[000599e6] 206f 0010                 movea.l    16(a7),a0
[000599ea] 3140 001e                 move.w     d0,30(a0)
[000599ee] 206f 0010                 movea.l    16(a7),a0
[000599f2] 3140 001c                 move.w     d0,28(a0)
[000599f6] 70fe                      moveq.l    #-2,d0
[000599f8] 206f 0010                 movea.l    16(a7),a0
[000599fc] c068 0056                 and.w      86(a0),d0
[00059a00] 807c 0800                 or.w       #$0800,d0
[00059a04] 206f 0010                 movea.l    16(a7),a0
[00059a08] 3140 0056                 move.w     d0,86(a0)
[00059a0c] 302f 000e                 move.w     14(a7),d0
[00059a10] 670a                      beq.s      $00059A1C
[00059a12] 206f 0010                 movea.l    16(a7),a0
[00059a16] 0068 1000 0056            ori.w      #$1000,86(a0)
[00059a1c] 7008                      moveq.l    #8,d0
[00059a1e] 226f 0010                 movea.l    16(a7),a1
[00059a22] 43e9 0024                 lea.l      36(a1),a1
[00059a26] 206f 0010                 movea.l    16(a7),a0
[00059a2a] 41e8 002c                 lea.l      44(a0),a0
[00059a2e] 4eb9 0008 3500            jsr        memcpy
[00059a34] 2079 000e 692a            movea.l    _globl,a0
[00059a3a] 226f 0010                 movea.l    16(a7),a1
[00059a3e] 3029 0020                 move.w     32(a1),d0
[00059a42] 4eb9 0007 b48a            jsr        mt_wind_close
[00059a48] 70ff                      moveq.l    #-1,d0
[00059a4a] 3f00                      move.w     d0,-(a7)
[00059a4c] 70ff                      moveq.l    #-1,d0
[00059a4e] 3f00                      move.w     d0,-(a7)
[00059a50] 70ff                      moveq.l    #-1,d0
[00059a52] 3f00                      move.w     d0,-(a7)
[00059a54] 70ff                      moveq.l    #-1,d0
[00059a56] 3f00                      move.w     d0,-(a7)
[00059a58] 721a                      moveq.l    #26,d1
[00059a5a] 206f 0018                 movea.l    24(a7),a0
[00059a5e] 3028 0020                 move.w     32(a0),d0
[00059a62] 4eb9 0007 f926            jsr        wind_set
[00059a68] 504f                      addq.w     #8,a7
[00059a6a] 70ff                      moveq.l    #-1,d0
[00059a6c] 3f00                      move.w     d0,-(a7)
[00059a6e] 70ff                      moveq.l    #-1,d0
[00059a70] 3f00                      move.w     d0,-(a7)
[00059a72] 2079 000e 692a            movea.l    _globl,a0
[00059a78] 74ff                      moveq.l    #-1,d2
[00059a7a] 72ff                      moveq.l    #-1,d1
[00059a7c] 226f 0014                 movea.l    20(a7),a1
[00059a80] 3029 0020                 move.w     32(a1),d0
[00059a84] 4eb9 0007 b410            jsr        mt_wind_open
[00059a8a] 584f                      addq.w     #4,a7
[00059a8c] 7219                      moveq.l    #25,d1
[00059a8e] 206f 0010                 movea.l    16(a7),a0
[00059a92] 3028 0020                 move.w     32(a0),d0
[00059a96] 4eb9 0007 f926            jsr        wind_set
[00059a9c] 206f 0010                 movea.l    16(a7),a0
[00059aa0] 3028 0020                 move.w     32(a0),d0
[00059aa4] e548                      lsl.w      #2,d0
[00059aa6] 41f9 0011 4326            lea.l      _ACSv_wiicons,a0
[00059aac] 2f70 0000 0008            move.l     0(a0,d0.w),8(a7)
[00059ab2] 206f 0008                 movea.l    8(a7),a0
[00059ab6] 4868 0016                 pea.l      22(a0)
[00059aba] 206f 000c                 movea.l    12(a7),a0
[00059abe] 4868 0014                 pea.l      20(a0)
[00059ac2] 206f 0010                 movea.l    16(a7),a0
[00059ac6] 4868 0012                 pea.l      18(a0)
[00059aca] 206f 0014                 movea.l    20(a7),a0
[00059ace] 4868 0010                 pea.l      16(a0)
[00059ad2] 7204                      moveq.l    #4,d1
[00059ad4] 206f 0020                 movea.l    32(a7),a0
[00059ad8] 3028 0020                 move.w     32(a0),d0
[00059adc] 4eb9 0007 f7ba            jsr        wind_get
[00059ae2] 4fef 0010                 lea.l      16(a7),a7
[00059ae6] 206f 0008                 movea.l    8(a7),a0
[00059aea] 2f68 0024 0004            move.l     36(a0),4(a7)
[00059af0] 206f 0008                 movea.l    8(a7),a0
[00059af4] 3028 0014                 move.w     20(a0),d0
[00059af8] 206f 0004                 movea.l    4(a7),a0
[00059afc] 9068 0016                 sub.w      22(a0),d0
[00059b00] e240                      asr.w      #1,d0
[00059b02] 206f 0004                 movea.l    4(a7),a0
[00059b06] 3140 0012                 move.w     d0,18(a0)
[00059b0a] 206f 0008                 movea.l    8(a7),a0
[00059b0e] 3028 0016                 move.w     22(a0),d0
[00059b12] 206f 0004                 movea.l    4(a7),a0
[00059b16] 9068 0018                 sub.w      24(a0),d0
[00059b1a] 206f 0004                 movea.l    4(a7),a0
[00059b1e] 9068 0020                 sub.w      32(a0),d0
[00059b22] e240                      asr.w      #1,d0
[00059b24] 206f 0004                 movea.l    4(a7),a0
[00059b28] 3140 0014                 move.w     d0,20(a0)
[00059b2c] 206f 0004                 movea.l    4(a7),a0
[00059b30] 3028 0020                 move.w     32(a0),d0
[00059b34] 673e                      beq.s      $00059B74
[00059b36] 206f 0004                 movea.l    4(a7),a0
[00059b3a] 3028 001e                 move.w     30(a0),d0
[00059b3e] 6734                      beq.s      $00059B74
[00059b40] 206f 0008                 movea.l    8(a7),a0
[00059b44] 3028 0014                 move.w     20(a0),d0
[00059b48] 206f 0004                 movea.l    4(a7),a0
[00059b4c] 9068 001e                 sub.w      30(a0),d0
[00059b50] e240                      asr.w      #1,d0
[00059b52] 206f 0004                 movea.l    4(a7),a0
[00059b56] 3140 001a                 move.w     d0,26(a0)
[00059b5a] 206f 0004                 movea.l    4(a7),a0
[00059b5e] 3028 0014                 move.w     20(a0),d0
[00059b62] 206f 0004                 movea.l    4(a7),a0
[00059b66] d068 0018                 add.w      24(a0),d0
[00059b6a] 206f 0004                 movea.l    4(a7),a0
[00059b6e] 3140 001c                 move.w     d0,28(a0)
[00059b72] 6024                      bra.s      $00059B98
[00059b74] 206f 0008                 movea.l    8(a7),a0
[00059b78] 3028 0014                 move.w     20(a0),d0
[00059b7c] e240                      asr.w      #1,d0
[00059b7e] 206f 0004                 movea.l    4(a7),a0
[00059b82] 3140 001a                 move.w     d0,26(a0)
[00059b86] 206f 0008                 movea.l    8(a7),a0
[00059b8a] 3028 0016                 move.w     22(a0),d0
[00059b8e] e240                      asr.w      #1,d0
[00059b90] 206f 0004                 movea.l    4(a7),a0
[00059b94] 3140 001c                 move.w     d0,28(a0)
[00059b98] 302f 000e                 move.w     14(a7),d0
[00059b9c] 6700 00c6                 beq        $00059C64
[00059ba0] 4eb9 0004 810e            jsr        Adr_unselect
[00059ba6] 3f7c 0001 000c            move.w     #$0001,12(a7)
[00059bac] 6000 00ac                 bra        $00059C5A
[00059bb0] 302f 000c                 move.w     12(a7),d0
[00059bb4] e548                      lsl.w      #2,d0
[00059bb6] 41f9 0011 3af2            lea.l      gemmap,a0
[00059bbc] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[00059bc0] 2017                      move.l     (a7),d0
[00059bc2] 6700 0092                 beq        $00059C56
[00059bc6] 206f 0010                 movea.l    16(a7),a0
[00059bca] 302f 000c                 move.w     12(a7),d0
[00059bce] b068 0020                 cmp.w      32(a0),d0
[00059bd2] 6700 0082                 beq        $00059C56
[00059bd6] 2057                      movea.l    (a7),a0
[00059bd8] 3028 0056                 move.w     86(a0),d0
[00059bdc] c07c 0800                 and.w      #$0800,d0
[00059be0] 671a                      beq.s      $00059BFC
[00059be2] 2057                      movea.l    (a7),a0
[00059be4] 6100 c182                 bsr        Awi_icondelete
[00059be8] 7008                      moveq.l    #8,d0
[00059bea] 2257                      movea.l    (a7),a1
[00059bec] 43e9 002c                 lea.l      44(a1),a1
[00059bf0] 2057                      movea.l    (a7),a0
[00059bf2] 41e8 0024                 lea.l      36(a0),a0
[00059bf6] 4eb9 0008 3500            jsr        memcpy
[00059bfc] 302f 000c                 move.w     12(a7),d0
[00059c00] e548                      lsl.w      #2,d0
[00059c02] 41f9 0011 3d12            lea.l      icnmap,a0
[00059c08] 2197 0000                 move.l     (a7),0(a0,d0.w)
[00059c0c] 302f 000c                 move.w     12(a7),d0
[00059c10] e548                      lsl.w      #2,d0
[00059c12] 41f9 0011 3af2            lea.l      gemmap,a0
[00059c18] 42b0 0000                 clr.l      0(a0,d0.w)
[00059c1c] 2079 000e 692a            movea.l    _globl,a0
[00059c22] 2257                      movea.l    (a7),a1
[00059c24] 3029 0020                 move.w     32(a1),d0
[00059c28] 4eb9 0007 b48a            jsr        mt_wind_close
[00059c2e] 2079 000e 692a            movea.l    _globl,a0
[00059c34] 2257                      movea.l    (a7),a1
[00059c36] 3029 0020                 move.w     32(a1),d0
[00059c3a] 4eb9 0007 b4e4            jsr        mt_wind_delete
[00059c40] 2057                      movea.l    (a7),a0
[00059c42] 317c ffff 0020            move.w     #$FFFF,32(a0)
[00059c48] 2057                      movea.l    (a7),a0
[00059c4a] 0068 0800 0056            ori.w      #$0800,86(a0)
[00059c50] 4eb9 0004 b086            jsr        Aev_mess
[00059c56] 526f 000c                 addq.w     #1,12(a7)
[00059c5a] 0c6f 0080 000c            cmpi.w     #$0080,12(a7)
[00059c60] 6d00 ff4e                 blt        $00059BB0
[00059c64] 7001                      moveq.l    #1,d0
[00059c66] 4fef 0014                 lea.l      20(a7),a7
[00059c6a] 4e75                      rts
Awi_uniconify:
[00059c6c] 4fef fff6                 lea.l      -10(a7),a7
[00059c70] 2f48 0006                 move.l     a0,6(a7)
[00059c74] 202f 0006                 move.l     6(a7),d0
[00059c78] 6700 00f0                 beq        $00059D6A
[00059c7c] 206f 0006                 movea.l    6(a7),a0
[00059c80] 3028 0056                 move.w     86(a0),d0
[00059c84] c07c 0800                 and.w      #$0800,d0
[00059c88] 6700 00e0                 beq        $00059D6A
[00059c8c] 206f 0006                 movea.l    6(a7),a0
[00059c90] 6100 c0d6                 bsr        Awi_icondelete
[00059c94] 4a40                      tst.w      d0
[00059c96] 6700 00d2                 beq        $00059D6A
[00059c9a] 7008                      moveq.l    #8,d0
[00059c9c] 226f 0006                 movea.l    6(a7),a1
[00059ca0] 43e9 002c                 lea.l      44(a1),a1
[00059ca4] 206f 0006                 movea.l    6(a7),a0
[00059ca8] 41e8 0024                 lea.l      36(a0),a0
[00059cac] 4eb9 0008 3500            jsr        memcpy
[00059cb2] 206f 0006                 movea.l    6(a7),a0
[00059cb6] 3f28 0032                 move.w     50(a0),-(a7)
[00059cba] 206f 0008                 movea.l    8(a7),a0
[00059cbe] 3f28 0030                 move.w     48(a0),-(a7)
[00059cc2] 206f 000a                 movea.l    10(a7),a0
[00059cc6] 3f28 002e                 move.w     46(a0),-(a7)
[00059cca] 206f 000c                 movea.l    12(a7),a0
[00059cce] 3f28 002c                 move.w     44(a0),-(a7)
[00059cd2] 721b                      moveq.l    #27,d1
[00059cd4] 206f 000e                 movea.l    14(a7),a0
[00059cd8] 3028 0020                 move.w     32(a0),d0
[00059cdc] 4eb9 0007 f926            jsr        wind_set
[00059ce2] 504f                      addq.w     #8,a7
[00059ce4] 4eb9 0005 1388            jsr        Awi_diaend
[00059cea] 4267                      clr.w      -(a7)
[00059cec] 4267                      clr.w      -(a7)
[00059cee] 4267                      clr.w      -(a7)
[00059cf0] 4267                      clr.w      -(a7)
[00059cf2] 720a                      moveq.l    #10,d1
[00059cf4] 206f 000e                 movea.l    14(a7),a0
[00059cf8] 3028 0020                 move.w     32(a0),d0
[00059cfc] 4eb9 0007 f926            jsr        wind_set
[00059d02] 504f                      addq.w     #8,a7
[00059d04] 206f 0006                 movea.l    6(a7),a0
[00059d08] 0268 f7ff 0056            andi.w     #$F7FF,86(a0)
[00059d0e] 7208                      moveq.l    #8,d1
[00059d10] 70ff                      moveq.l    #-1,d0
[00059d12] 206f 0006                 movea.l    6(a7),a0
[00059d16] 2068 0014                 movea.l    20(a0),a0
[00059d1a] 4eb9 0005 0e62            jsr        Aob_findflag
[00059d20] 206f 0006                 movea.l    6(a7),a0
[00059d24] 3140 001c                 move.w     d0,28(a0)
[00059d28] 206f 0006                 movea.l    6(a7),a0
[00059d2c] 3028 001c                 move.w     28(a0),d0
[00059d30] 6a28                      bpl.s      $00059D5A
[00059d32] 206f 0006                 movea.l    6(a7),a0
[00059d36] 2028 0018                 move.l     24(a0),d0
[00059d3a] 671e                      beq.s      $00059D5A
[00059d3c] 7208                      moveq.l    #8,d1
[00059d3e] 70ff                      moveq.l    #-1,d0
[00059d40] 206f 0006                 movea.l    6(a7),a0
[00059d44] 2068 0018                 movea.l    24(a0),a0
[00059d48] 4eb9 0005 0e62            jsr        Aob_findflag
[00059d4e] 807c 1000                 or.w       #$1000,d0
[00059d52] 206f 0006                 movea.l    6(a7),a0
[00059d56] 3140 001c                 move.w     d0,28(a0)
[00059d5a] 206f 0006                 movea.l    6(a7),a0
[00059d5e] 317c ffff 001e            move.w     #$FFFF,30(a0)
[00059d64] 4eb9 0005 147c            jsr        Awi_diastart
[00059d6a] 206f 0006                 movea.l    6(a7),a0
[00059d6e] 3028 0056                 move.w     86(a0),d0
[00059d72] c07c 1000                 and.w      #$1000,d0
[00059d76] 6750                      beq.s      $00059DC8
[00059d78] 3ebc 0001                 move.w     #$0001,(a7)
[00059d7c] 6044                      bra.s      $00059DC2
[00059d7e] 3017                      move.w     (a7),d0
[00059d80] e548                      lsl.w      #2,d0
[00059d82] 41f9 0011 3d12            lea.l      icnmap,a0
[00059d88] 2f70 0000 0002            move.l     0(a0,d0.w),2(a7)
[00059d8e] 202f 0002                 move.l     2(a7),d0
[00059d92] 672c                      beq.s      $00059DC0
[00059d94] 206f 0002                 movea.l    2(a7),a0
[00059d98] 0268 f7ff 0056            andi.w     #$F7FF,86(a0)
[00059d9e] 206f 0002                 movea.l    2(a7),a0
[00059da2] 226f 0002                 movea.l    2(a7),a1
[00059da6] 2269 000c                 movea.l    12(a1),a1
[00059daa] 4e91                      jsr        (a1)
[00059dac] 3017                      move.w     (a7),d0
[00059dae] e548                      lsl.w      #2,d0
[00059db0] 41f9 0011 3d12            lea.l      icnmap,a0
[00059db6] 42b0 0000                 clr.l      0(a0,d0.w)
[00059dba] 4eb9 0004 b086            jsr        Aev_mess
[00059dc0] 5257                      addq.w     #1,(a7)
[00059dc2] 0c57 0080                 cmpi.w     #$0080,(a7)
[00059dc6] 6db6                      blt.s      $00059D7E
[00059dc8] 7001                      moveq.l    #1,d0
[00059dca] 4fef 000a                 lea.l      10(a7),a7
[00059dce] 4e75                      rts
Awi_service:
[00059dd0] 5d4f                      subq.w     #6,a7
[00059dd2] 2f48 0002                 move.l     a0,2(a7)
[00059dd6] 3e80                      move.w     d0,(a7)
[00059dd8] 3017                      move.w     (a7),d0
[00059dda] 5540                      subq.w     #2,d0
[00059ddc] 6702                      beq.s      $00059DE0
[00059dde] 600a                      bra.s      $00059DEA
[00059de0] 206f 0002                 movea.l    2(a7),a0
[00059de4] 6100 e80c                 bsr        Awi_delete
[00059de8] 6004                      bra.s      $00059DEE
[00059dea] 4240                      clr.w      d0
[00059dec] 6002                      bra.s      $00059DF0
[00059dee] 7001                      moveq.l    #1,d0
[00059df0] 5c4f                      addq.w     #6,a7
[00059df2] 4e75                      rts
Awi_dialog:
[00059df4] 2f0a                      move.l     a2,-(a7)
[00059df6] 4fef ffc8                 lea.l      -56(a7),a7
[00059dfa] 2f48 0034                 move.l     a0,52(a7)
[00059dfe] 206f 0034                 movea.l    52(a7),a0
[00059e02] 3028 0056                 move.w     86(a0),d0
[00059e06] c07c 0800                 and.w      #$0800,d0
[00059e0a] 6706                      beq.s      $00059E12
[00059e0c] 70fd                      moveq.l    #-3,d0
[00059e0e] 6000 054e                 bra        $0005A35E
[00059e12] 3039 000e 1fca            move.w     a_dialog_active,d0
[00059e18] 6748                      beq.s      $00059E62
[00059e1a] 206f 0034                 movea.l    52(a7),a0
[00059e1e] 2028 0014                 move.l     20(a0),d0
[00059e22] 6608                      bne.s      $00059E2C
[00059e24] 70fd                      moveq.l    #-3,d0
[00059e26] 6000 0536                 bra        $0005A35E
[00059e2a] 6036                      bra.s      $00059E62
[00059e2c] 41d7                      lea.l      (a7),a0
[00059e2e] 4eb9 0006 bf9e            jsr        Act_save
[00059e34] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059e3a] 216f 0034 0258            move.l     52(a7),600(a0)
[00059e40] 206f 0034                 movea.l    52(a7),a0
[00059e44] 2068 0014                 movea.l    20(a0),a0
[00059e48] 4eb9 0006 c596            jsr        A_dialog
[00059e4e] 3f40 002c                 move.w     d0,44(a7)
[00059e52] 41d7                      lea.l      (a7),a0
[00059e54] 4eb9 0006 c00a            jsr        Act_restore
[00059e5a] 302f 002c                 move.w     44(a7),d0
[00059e5e] 6000 04fe                 bra        $0005A35E
[00059e62] 206f 0034                 movea.l    52(a7),a0
[00059e66] 3028 0020                 move.w     32(a0),d0
[00059e6a] 6a58                      bpl.s      $00059EC4
[00059e6c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059e72] 3f28 000e                 move.w     14(a0),-(a7)
[00059e76] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059e7c] 3f28 000c                 move.w     12(a0),-(a7)
[00059e80] 2079 000e 692a            movea.l    _globl,a0
[00059e86] 2279 0010 ee4e            movea.l    ACSblk,a1
[00059e8c] 3429 000a                 move.w     10(a1),d2
[00059e90] 2279 0010 ee4e            movea.l    ACSblk,a1
[00059e96] 3229 0008                 move.w     8(a1),d1
[00059e9a] 4240                      clr.w      d0
[00059e9c] 4eb9 0007 b396            jsr        mt_wind_create
[00059ea2] 584f                      addq.w     #4,a7
[00059ea4] 3f40 002e                 move.w     d0,46(a7)
[00059ea8] 302f 002e                 move.w     46(a7),d0
[00059eac] 6a06                      bpl.s      $00059EB4
[00059eae] 70fe                      moveq.l    #-2,d0
[00059eb0] 6000 04ac                 bra        $0005A35E
[00059eb4] 2079 000e 692a            movea.l    _globl,a0
[00059eba] 302f 002e                 move.w     46(a7),d0
[00059ebe] 4eb9 0007 b4e4            jsr        mt_wind_delete
[00059ec4] 206f 0034                 movea.l    52(a7),a0
[00059ec8] 2028 0014                 move.l     20(a0),d0
[00059ecc] 670e                      beq.s      $00059EDC
[00059ece] 206f 0034                 movea.l    52(a7),a0
[00059ed2] 3028 0056                 move.w     86(a0),d0
[00059ed6] c07c 0400                 and.w      #$0400,d0
[00059eda] 6706                      beq.s      $00059EE2
[00059edc] 70fd                      moveq.l    #-3,d0
[00059ede] 6000 047e                 bra        $0005A35E
[00059ee2] 7001                      moveq.l    #1,d0
[00059ee4] 206f 0034                 movea.l    52(a7),a0
[00059ee8] 6100 df22                 bsr        Awi_set_modal
[00059eec] 5240                      addq.w     #1,d0
[00059eee] 6606                      bne.s      $00059EF6
[00059ef0] 70fe                      moveq.l    #-2,d0
[00059ef2] 6000 046a                 bra        $0005A35E
[00059ef6] 41d7                      lea.l      (a7),a0
[00059ef8] 4eb9 0006 bf9e            jsr        Act_save
[00059efe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059f04] 216f 0034 0258            move.l     52(a7),600(a0)
[00059f0a] 206f 0034                 movea.l    52(a7),a0
[00059f0e] 0268 bfff 0022            andi.w     #$BFFF,34(a0)
[00059f14] 42a7                      clr.l      -(a7)
[00059f16] 42a7                      clr.l      -(a7)
[00059f18] 42a7                      clr.l      -(a7)
[00059f1a] 486f 003e                 pea.l      62(a7)
[00059f1e] 720a                      moveq.l    #10,d1
[00059f20] 4240                      clr.w      d0
[00059f22] 4eb9 0007 f7ba            jsr        wind_get
[00059f28] 4fef 0010                 lea.l      16(a7),a7
[00059f2c] 206f 0034                 movea.l    52(a7),a0
[00059f30] 3028 0020                 move.w     32(a0),d0
[00059f34] 6b18                      bmi.s      $00059F4E
[00059f36] 206f 0034                 movea.l    52(a7),a0
[00059f3a] 3028 0020                 move.w     32(a0),d0
[00059f3e] b06f 0032                 cmp.w      50(a7),d0
[00059f42] 670a                      beq.s      $00059F4E
[00059f44] 206f 0034                 movea.l    52(a7),a0
[00059f48] 6100 e85a                 bsr        Awi_topped
[00059f4c] 603e                      bra.s      $00059F8C
[00059f4e] 206f 0034                 movea.l    52(a7),a0
[00059f52] 0068 0100 0056            ori.w      #$0100,86(a0)
[00059f58] 206f 0034                 movea.l    52(a7),a0
[00059f5c] 226f 0034                 movea.l    52(a7),a1
[00059f60] 2269 000c                 movea.l    12(a1),a1
[00059f64] 4e91                      jsr        (a1)
[00059f66] 4a40                      tst.w      d0
[00059f68] 6718                      beq.s      $00059F82
[00059f6a] 41d7                      lea.l      (a7),a0
[00059f6c] 4eb9 0006 c00a            jsr        Act_restore
[00059f72] 4240                      clr.w      d0
[00059f74] 206f 0034                 movea.l    52(a7),a0
[00059f78] 6100 de92                 bsr        Awi_set_modal
[00059f7c] 70fe                      moveq.l    #-2,d0
[00059f7e] 6000 03de                 bra        $0005A35E
[00059f82] 206f 0034                 movea.l    52(a7),a0
[00059f86] 0268 feff 0056            andi.w     #$FEFF,86(a0)
[00059f8c] 206f 0034                 movea.l    52(a7),a0
[00059f90] 3f68 0058 0030            move.w     88(a0),48(a7)
[00059f96] 302f 0030                 move.w     48(a7),d0
[00059f9a] 6b24                      bmi.s      $00059FC0
[00059f9c] 2039 000e 0d26            move.l     Aroot_wi,d0
[00059fa2] 671c                      beq.s      $00059FC0
[00059fa4] 226f 0034                 movea.l    52(a7),a1
[00059fa8] 43e9 0058                 lea.l      88(a1),a1
[00059fac] 7065                      moveq.l    #101,d0
[00059fae] 2079 000e 0d26            movea.l    Aroot_wi,a0
[00059fb4] 2479 000e 0d26            movea.l    Aroot_wi,a2
[00059fba] 246a 0004                 movea.l    4(a2),a2
[00059fbe] 4e92                      jsr        (a2)
[00059fc0] 206f 0034                 movea.l    52(a7),a0
[00059fc4] 0068 0400 0056            ori.w      #$0400,86(a0)
[00059fca] 2f39 000e 692a            move.l     _globl,-(a7)
[00059fd0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059fd6] 4868 0266                 pea.l      614(a0)
[00059fda] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059fe0] 4868 02ca                 pea.l      714(a0)
[00059fe4] 2279 0010 ee4e            movea.l    ACSblk,a1
[00059fea] 43e9 0264                 lea.l      612(a1),a1
[00059fee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00059ff4] 41e8 0262                 lea.l      610(a0),a0
[00059ff8] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[00059ffe] 4fef 000c                 lea.l      12(a7),a7
[0005a002] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a008] 4268 0268                 clr.w      616(a0)
[0005a00c] 3f7c ffff 002c            move.w     #$FFFF,44(a7)
[0005a012] 7010                      moveq.l    #16,d0
[0005a014] 4eb9 0005 ae7e            jsr        Awi_update
[0005a01a] 2f39 000e 692a            move.l     _globl,-(a7)
[0005a020] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a026] 4868 02cc                 pea.l      716(a0)
[0005a02a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a030] 4868 02ce                 pea.l      718(a0)
[0005a034] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a03a] 4868 0266                 pea.l      614(a0)
[0005a03e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a044] 4868 02ca                 pea.l      714(a0)
[0005a048] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a04e] 4868 0264                 pea.l      612(a0)
[0005a052] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a058] 2028 0232                 move.l     562(a0),d0
[0005a05c] 7210                      moveq.l    #16,d1
[0005a05e] e2a0                      asr.l      d1,d0
[0005a060] 7200                      moveq.l    #0,d1
[0005a062] 3200                      move.w     d0,d1
[0005a064] 7010                      moveq.l    #16,d0
[0005a066] e1a9                      lsl.l      d0,d1
[0005a068] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a06e] 7000                      moveq.l    #0,d0
[0005a070] 3028 0234                 move.w     564(a0),d0
[0005a074] 8280                      or.l       d0,d1
[0005a076] 2f01                      move.l     d1,-(a7)
[0005a078] 4267                      clr.w      -(a7)
[0005a07a] 4267                      clr.w      -(a7)
[0005a07c] 4267                      clr.w      -(a7)
[0005a07e] 4267                      clr.w      -(a7)
[0005a080] 4267                      clr.w      -(a7)
[0005a082] 7001                      moveq.l    #1,d0
[0005a084] 3f00                      move.w     d0,-(a7)
[0005a086] 7001                      moveq.l    #1,d0
[0005a088] 3f00                      move.w     d0,-(a7)
[0005a08a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a090] 3f28 0264                 move.w     612(a0),-(a7)
[0005a094] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a09a] 3f28 0262                 move.w     610(a0),-(a7)
[0005a09e] 7001                      moveq.l    #1,d0
[0005a0a0] 3f00                      move.w     d0,-(a7)
[0005a0a2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a0a8] 3f28 02c8                 move.w     712(a0),-(a7)
[0005a0ac] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005a0b2] 43e9 0262                 lea.l      610(a1),a1
[0005a0b6] 41ef 004c                 lea.l      76(a7),a0
[0005a0ba] 2479 0010 ee4e            movea.l    ACSblk,a2
[0005a0c0] 342a 02c6                 move.w     710(a2),d2
[0005a0c4] 2479 0010 ee4e            movea.l    ACSblk,a2
[0005a0ca] 322a 02d0                 move.w     720(a2),d1
[0005a0ce] 7037                      moveq.l    #55,d0 MU_TIMER | MU_MESAG | MU_M1 | MU_BUTTON | MU_KEYBD
[0005a0d0] 4eb9 0007 9240            jsr        mt_evnt_multi
[0005a0d6] 4fef 0032                 lea.l      50(a7),a7
[0005a0da] 3f40 0018                 move.w     d0,24(a7)
[0005a0de] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a0e4] 3228 0266                 move.w     614(a0),d1
[0005a0e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a0ee] 3028 02ce                 move.w     718(a0),d0
[0005a0f2] 4eb9 0004 4284            jsr        nkc_gemks2n
[0005a0f8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a0fe] 3140 02ce                 move.w     d0,718(a0)
[0005a102] 7020                      moveq.l    #32,d0
[0005a104] 4eb9 0005 ae7e            jsr        Awi_update
[0005a10a] 7010                      moveq.l    #16,d0 if (events & MU_MESAG)
[0005a10c] c06f 0018                 and.w      24(a7),d0
[0005a110] 6724                      beq.s      $0005A136
[0005a112] 41ef 001a                 lea.l      26(a7),a0
[0005a116] 4eb9 0005 d5e6            jsr        Aev_message
[0005a11c] 0c6f 0029 001a            cmpi.w     #$0029,26(a7)
[0005a122] 6612                      bne.s      $0005A136
[0005a124] 3f7c ffff 002c            move.w     #$FFFF,44(a7)
[0005a12a] 7020                      moveq.l    #32,d0
[0005a12c] 4eb9 0005 ae7e            jsr        Awi_update
[0005a132] 6000 01dc                 bra        $0005A310
[0005a136] 7002                      moveq.l    #2,d0 if (events & MU_BUTTON)
[0005a138] c06f 0018                 and.w      24(a7),d0
[0005a13c] 671e                      beq.s      $0005A15C
[0005a13e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a144] 3228 02cc                 move.w     716(a0),d1
[0005a148] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a14e] 3028 02ca                 move.w     714(a0),d0
[0005a152] 4eb9 0004 ab64            jsr        evbutton
[0005a158] 3f40 002c                 move.w     d0,44(a7)
[0005a15c] 7001                      moveq.l    #1,d0 if (events & MU_KEYBD)
[0005a15e] c06f 0018                 and.w      24(a7),d0
[0005a162] 670c                      beq.s      $0005A170
[0005a164] 91c8                      suba.l     a0,a0
[0005a166] 4eb9 0004 a498            jsr        evkeybrd
[0005a16c] 3f40 002c                 move.w     d0,44(a7)
[0005a170] 2f39 000e 692a            move.l     _globl,-(a7)
[0005a176] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a17c] 4868 0266                 pea.l      614(a0)
[0005a180] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a186] 4868 02ca                 pea.l      714(a0)
[0005a18a] 2279 0010 ee4e            movea.l    ACSblk,a1
[0005a190] 43e9 0264                 lea.l      612(a1),a1
[0005a194] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a19a] 41e8 0262                 lea.l      610(a0),a0
[0005a19e] 4eb9 0007 ac48            jsr        mt_graf_mkstate
[0005a1a4] 4fef 000c                 lea.l      12(a7),a7
[0005a1a8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a1ae] 3028 02ca                 move.w     714(a0),d0
[0005a1b2] 6614                      bne.s      $0005A1C8
[0005a1b4] 7004                      moveq.l    #4,d0 if (events & MU_M1)
[0005a1b6] c06f 0018                 and.w      24(a7),d0
[0005a1ba] 6706                      beq.s      $0005A1C2
[0005a1bc] 4eb9 0004 a2f8            jsr        Aev_unhidepointer
[0005a1c2] 4eb9 0004 ae44            jsr        evmouse
[0005a1c8] 4eb9 0004 c8f6            jsr        Ax_release
[0005a1ce] 6100 c89e                 bsr        Awi_lateupdate
[0005a1d2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a1d8] 2179 000e 0d26 0258       move.l     Aroot_wi,600(a0)
[0005a1e0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a1e6] 2068 02ac                 movea.l    684(a0),a0
[0005a1ea] 4e90                      jsr        (a0)
[0005a1ec] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a1f2] 3028 0268                 move.w     616(a0),d0
[0005a1f6] 672c                      beq.s      $0005A224
[0005a1f8] 0c6f ffff 002c            cmpi.w     #$FFFF,44(a7)
[0005a1fe] 6620                      bne.s      $0005A220
[0005a200] 206f 0034                 movea.l    52(a7),a0
[0005a204] 2028 0014                 move.l     20(a0),d0
[0005a208] 6716                      beq.s      $0005A220
[0005a20a] 7202                      moveq.l    #2,d1
[0005a20c] 70ff                      moveq.l    #-1,d0
[0005a20e] 206f 0034                 movea.l    52(a7),a0
[0005a212] 2068 0014                 movea.l    20(a0),a0
[0005a216] 4eb9 0005 0e62            jsr        Aob_findflag
[0005a21c] 3f40 002c                 move.w     d0,44(a7)
[0005a220] 6000 00ee                 bra        $0005A310
[0005a224] 302f 002c                 move.w     44(a7),d0
[0005a228] 6b00 00d6                 bmi        $0005A300
[0005a22c] 302f 002c                 move.w     44(a7),d0
[0005a230] c07c 1000                 and.w      #$1000,d0
[0005a234] 676c                      beq.s      $0005A2A2
[0005a236] 302f 002c                 move.w     44(a7),d0
[0005a23a] c07c 0fff                 and.w      #$0FFF,d0
[0005a23e] 3f40 002a                 move.w     d0,42(a7)
[0005a242] 7005                      moveq.l    #5,d0
[0005a244] 342f 002a                 move.w     42(a7),d2
[0005a248] 48c2                      ext.l      d2
[0005a24a] 2202                      move.l     d2,d1
[0005a24c] d281                      add.l      d1,d1
[0005a24e] d282                      add.l      d2,d1
[0005a250] e789                      lsl.l      #3,d1
[0005a252] 206f 0034                 movea.l    52(a7),a0
[0005a256] 2068 0018                 movea.l    24(a0),a0
[0005a25a] c070 1808                 and.w      8(a0,d1.l),d0
[0005a25e] 5b40                      subq.w     #5,d0
[0005a260] 663e                      bne.s      $0005A2A0
[0005a262] 322f 002a                 move.w     42(a7),d1
[0005a266] 48c1                      ext.l      d1
[0005a268] 2001                      move.l     d1,d0
[0005a26a] d080                      add.l      d0,d0
[0005a26c] d081                      add.l      d1,d0
[0005a26e] e788                      lsl.l      #3,d0
[0005a270] 206f 0034                 movea.l    52(a7),a0
[0005a274] 2068 0014                 movea.l    20(a0),a0
[0005a278] 3030 0820                 move.w     32(a0,d0.l),d0
[0005a27c] c07c 8000                 and.w      #$8000,d0
[0005a280] 671c                      beq.s      $0005A29E
[0005a282] 322f 002a                 move.w     42(a7),d1
[0005a286] 48c1                      ext.l      d1
[0005a288] 2001                      move.l     d1,d0
[0005a28a] d080                      add.l      d0,d0
[0005a28c] d081                      add.l      d1,d0
[0005a28e] e788                      lsl.l      #3,d0
[0005a290] 206f 0034                 movea.l    52(a7),a0
[0005a294] 2068 0014                 movea.l    20(a0),a0
[0005a298] 2030 0818                 move.l     24(a0,d0.l),d0
[0005a29c] 6602                      bne.s      $0005A2A0
[0005a29e] 6070                      bra.s      $0005A310
[0005a2a0] 605e                      bra.s      $0005A300
[0005a2a2] 7005                      moveq.l    #5,d0
[0005a2a4] 342f 002c                 move.w     44(a7),d2
[0005a2a8] 48c2                      ext.l      d2
[0005a2aa] 2202                      move.l     d2,d1
[0005a2ac] d281                      add.l      d1,d1
[0005a2ae] d282                      add.l      d2,d1
[0005a2b0] e789                      lsl.l      #3,d1
[0005a2b2] 206f 0034                 movea.l    52(a7),a0
[0005a2b6] 2068 0014                 movea.l    20(a0),a0
[0005a2ba] c070 1808                 and.w      8(a0,d1.l),d0
[0005a2be] 5b40                      subq.w     #5,d0
[0005a2c0] 663e                      bne.s      $0005A300
[0005a2c2] 322f 002c                 move.w     44(a7),d1
[0005a2c6] 48c1                      ext.l      d1
[0005a2c8] 2001                      move.l     d1,d0
[0005a2ca] d080                      add.l      d0,d0
[0005a2cc] d081                      add.l      d1,d0
[0005a2ce] e788                      lsl.l      #3,d0
[0005a2d0] 206f 0034                 movea.l    52(a7),a0
[0005a2d4] 2068 0014                 movea.l    20(a0),a0
[0005a2d8] 3030 0820                 move.w     32(a0,d0.l),d0
[0005a2dc] c07c 8000                 and.w      #$8000,d0
[0005a2e0] 671c                      beq.s      $0005A2FE
[0005a2e2] 322f 002c                 move.w     44(a7),d1
[0005a2e6] 48c1                      ext.l      d1
[0005a2e8] 2001                      move.l     d1,d0
[0005a2ea] d080                      add.l      d0,d0
[0005a2ec] d081                      add.l      d1,d0
[0005a2ee] e788                      lsl.l      #3,d0
[0005a2f0] 206f 0034                 movea.l    52(a7),a0
[0005a2f4] 2068 0014                 movea.l    20(a0),a0
[0005a2f8] 2030 0818                 move.l     24(a0,d0.l),d0
[0005a2fc] 6602                      bne.s      $0005A300
[0005a2fe] 6010                      bra.s      $0005A310
[0005a300] 206f 0034                 movea.l    52(a7),a0
[0005a304] 3028 0020                 move.w     32(a0),d0
[0005a308] 6a02                      bpl.s      $0005A30C
[0005a30a] 6004                      bra.s      $0005A310
[0005a30c] 6000 fcf4                 bra        $0005A002
[0005a310] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a316] 4268 0268                 clr.w      616(a0)
[0005a31a] 206f 0034                 movea.l    52(a7),a0
[0005a31e] 3028 0020                 move.w     32(a0),d0
[0005a322] 6b0e                      bmi.s      $0005A332
[0005a324] 206f 0034                 movea.l    52(a7),a0
[0005a328] 226f 0034                 movea.l    52(a7),a1
[0005a32c] 2269 0072                 movea.l    114(a1),a1
[0005a330] 4e91                      jsr        (a1)
[0005a332] 4240                      clr.w      d0
[0005a334] 206f 0034                 movea.l    52(a7),a0
[0005a338] 6100 dad2                 bsr        Awi_set_modal
[0005a33c] 206f 0034                 movea.l    52(a7),a0
[0005a340] 0268 fbff 0056            andi.w     #$FBFF,86(a0)
[0005a346] 41d7                      lea.l      (a7),a0
[0005a348] 4eb9 0006 c00a            jsr        Act_restore
[0005a34e] 4eb9 0004 b086            jsr        Aev_mess
[0005a354] 4eb9 0004 b086            jsr        Aev_mess
[0005a35a] 302f 002c                 move.w     44(a7),d0
[0005a35e] 4fef 0038                 lea.l      56(a7),a7
[0005a362] 245f                      movea.l    (a7)+,a2
[0005a364] 4e75                      rts
Awi_doform:
[0005a366] 4fef ffee                 lea.l      -18(a7),a7
[0005a36a] 2f48 000e                 move.l     a0,14(a7)
[0005a36e] 2f49 000a                 move.l     a1,10(a7)
[0005a372] 42af 0006                 clr.l      6(a7)
[0005a376] 42af 0002                 clr.l      2(a7)
[0005a37a] 3ebc fffe                 move.w     #$FFFE,(a7)
[0005a37e] 206f 000a                 movea.l    10(a7),a0
[0005a382] 226f 000e                 movea.l    14(a7),a1
[0005a386] 2269 0008                 movea.l    8(a1),a1
[0005a38a] 4e91                      jsr        (a1)
[0005a38c] 2f48 0006                 move.l     a0,6(a7)
[0005a390] 202f 0006                 move.l     6(a7),d0
[0005a394] 6700 008c                 beq        $0005A422
[0005a398] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a39e] 3028 000c                 move.w     12(a0),d0
[0005a3a2] 206f 0006                 movea.l    6(a7),a0
[0005a3a6] b068 0038                 cmp.w      56(a0),d0
[0005a3aa] 6f0a                      ble.s      $0005A3B6
[0005a3ac] 206f 0006                 movea.l    6(a7),a0
[0005a3b0] 0268 f1ff 0022            andi.w     #$F1FF,34(a0)
[0005a3b6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a3bc] 3028 000e                 move.w     14(a0),d0
[0005a3c0] 206f 0006                 movea.l    6(a7),a0
[0005a3c4] b068 003a                 cmp.w      58(a0),d0
[0005a3c8] 6f0a                      ble.s      $0005A3D4
[0005a3ca] 206f 0006                 movea.l    6(a7),a0
[0005a3ce] 0268 fe3f 0022            andi.w     #$FE3F,34(a0)
[0005a3d4] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a3da] 3028 000e                 move.w     14(a0),d0
[0005a3de] 206f 0006                 movea.l    6(a7),a0
[0005a3e2] b068 003a                 cmp.w      58(a0),d0
[0005a3e6] 6f1e                      ble.s      $0005A406
[0005a3e8] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a3ee] 3028 000c                 move.w     12(a0),d0
[0005a3f2] 206f 0006                 movea.l    6(a7),a0
[0005a3f6] b068 0038                 cmp.w      56(a0),d0
[0005a3fa] 6f0a                      ble.s      $0005A406
[0005a3fc] 206f 0006                 movea.l    6(a7),a0
[0005a400] 0268 ffdb 0022            andi.w     #$FFDB,34(a0)
[0005a406] 206f 0006                 movea.l    6(a7),a0
[0005a40a] 0268 9fff 0022            andi.w     #$9FFF,34(a0)
[0005a410] 206f 0006                 movea.l    6(a7),a0
[0005a414] 6100 f9de                 bsr        Awi_dialog
[0005a418] 3e80                      move.w     d0,(a7)
[0005a41a] 206f 0006                 movea.l    6(a7),a0
[0005a41e] 6100 e1d2                 bsr        Awi_delete
[0005a422] 0c57 ffff                 cmpi.w     #$FFFF,(a7)
[0005a426] 6c3e                      bge.s      $0005A466
[0005a428] 206f 000e                 movea.l    14(a7),a0
[0005a42c] 2068 0014                 movea.l    20(a0),a0
[0005a430] 4eb9 0004 f064            jsr        Aob_create
[0005a436] 2f48 0002                 move.l     a0,2(a7)
[0005a43a] 202f 0002                 move.l     2(a7),d0
[0005a43e] 6718                      beq.s      $0005A458
[0005a440] 206f 0002                 movea.l    2(a7),a0
[0005a444] 4eb9 0006 c596            jsr        A_dialog
[0005a44a] 3e80                      move.w     d0,(a7)
[0005a44c] 206f 0002                 movea.l    2(a7),a0
[0005a450] 4eb9 0004 f20a            jsr        Aob_delete
[0005a456] 600e                      bra.s      $0005A466
[0005a458] 41f9 000e 0f58            lea.l      $000E0F58,a0
[0005a45e] 7001                      moveq.l    #1,d0
[0005a460] 4eb9 0005 a600            jsr        Awi_alert
[0005a466] 3017                      move.w     (a7),d0
[0005a468] 4fef 0012                 lea.l      18(a7),a7
[0005a46c] 4e75                      rts
Awi_diaabort:
[0005a46e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a474] 317c 0001 0268            move.w     #$0001,616(a0)
[0005a47a] 4e75                      rts
Awi_shadow:
[0005a47c] 4fef fff4                 lea.l      -12(a7),a7
[0005a480] 2f48 0008                 move.l     a0,8(a7)
[0005a484] 206f 0008                 movea.l    8(a7),a0
[0005a488] 3028 0020                 move.w     32(a0),d0
[0005a48c] 6a04                      bpl.s      $0005A492
[0005a48e] 7001                      moveq.l    #1,d0
[0005a490] 6044                      bra.s      $0005A4D6
[0005a492] 486f 0004                 pea.l      4(a7)
[0005a496] 486f 0008                 pea.l      8(a7)
[0005a49a] 486f 000a                 pea.l      10(a7)
[0005a49e] 486f 000c                 pea.l      12(a7)
[0005a4a2] 720b                      moveq.l    #11,d1
[0005a4a4] 206f 0018                 movea.l    24(a7),a0
[0005a4a8] 3028 0020                 move.w     32(a0),d0
[0005a4ac] 4eb9 0007 f7ba            jsr        wind_get
[0005a4b2] 4fef 0010                 lea.l      16(a7),a7
[0005a4b6] 206f 0008                 movea.l    8(a7),a0
[0005a4ba] 3028 0056                 move.w     86(a0),d0
[0005a4be] c07c 2000                 and.w      #$2000,d0
[0005a4c2] 660c                      bne.s      $0005A4D0
[0005a4c4] 302f 0004                 move.w     4(a7),d0
[0005a4c8] 660a                      bne.s      $0005A4D4
[0005a4ca] 302f 0006                 move.w     6(a7),d0
[0005a4ce] 6604                      bne.s      $0005A4D4
[0005a4d0] 7001                      moveq.l    #1,d0
[0005a4d2] 6002                      bra.s      $0005A4D6
[0005a4d4] 4240                      clr.w      d0
[0005a4d6] 4fef 000c                 lea.l      12(a7),a7
[0005a4da] 4e75                      rts
_init_alert:
[0005a4dc] 2f0a                      move.l     a2,-(a7)
[0005a4de] 4fef fff2                 lea.l      -14(a7),a7
[0005a4e2] 2f48 000a                 move.l     a0,10(a7)
[0005a4e6] 206f 000a                 movea.l    10(a7),a0
[0005a4ea] 2010                      move.l     (a0),d0
[0005a4ec] 6606                      bne.s      $0005A4F4
[0005a4ee] 4240                      clr.w      d0
[0005a4f0] 6000 0106                 bra        $0005A5F8
[0005a4f4] 206f 000a                 movea.l    10(a7),a0
[0005a4f8] 0068 0020 0056            ori.w      #$0020,86(a0)
[0005a4fe] 4eb9 0008 0f6c            jsr        Ash_gettimer
[0005a504] 23c0 0011 3aea            move.l     d0,timer1
[0005a50a] 2039 0011 3aea            move.l     timer1,d0
[0005a510] 90b9 0011 3aee            sub.l      timer2,d0
[0005a516] b0bc 0000 0258            cmp.l      #$00000258,d0
[0005a51c] 6f00 00d8                 ble        $0005A5F6
[0005a520] 23f9 0011 3aea 0011 3aee  move.l     timer1,timer2
[0005a52a] 3f7c 0005 0008            move.w     #$0005,8(a7)
[0005a530] 6026                      bra.s      $0005A558
[0005a532] 303c 0080                 move.w     #$0080,d0
[0005a536] 342f 0008                 move.w     8(a7),d2
[0005a53a] 48c2                      ext.l      d2
[0005a53c] 2202                      move.l     d2,d1
[0005a53e] d281                      add.l      d1,d1
[0005a540] d282                      add.l      d2,d1
[0005a542] e789                      lsl.l      #3,d1
[0005a544] 206f 000a                 movea.l    10(a7),a0
[0005a548] 2068 0014                 movea.l    20(a0),a0
[0005a54c] c070 1808                 and.w      8(a0,d1.l),d0
[0005a550] 6602                      bne.s      $0005A554
[0005a552] 600c                      bra.s      $0005A560
[0005a554] 526f 0008                 addq.w     #1,8(a7)
[0005a558] 0c6f 000d 0008            cmpi.w     #$000D,8(a7)
[0005a55e] 6fd2                      ble.s      $0005A532
[0005a560] 322f 0008                 move.w     8(a7),d1
[0005a564] 48c1                      ext.l      d1
[0005a566] 2001                      move.l     d1,d0
[0005a568] d080                      add.l      d0,d0
[0005a56a] d081                      add.l      d1,d0
[0005a56c] e788                      lsl.l      #3,d0
[0005a56e] 206f 000a                 movea.l    10(a7),a0
[0005a572] 2068 0014                 movea.l    20(a0),a0
[0005a576] 0070 0080 0808            ori.w      #$0080,8(a0,d0.l)
[0005a57c] 536f 0008                 subq.w     #1,8(a7)
[0005a580] 322f 0008                 move.w     8(a7),d1
[0005a584] 48c1                      ext.l      d1
[0005a586] 2001                      move.l     d1,d0
[0005a588] d080                      add.l      d0,d0
[0005a58a] d081                      add.l      d1,d0
[0005a58c] e788                      lsl.l      #3,d0
[0005a58e] 206f 000a                 movea.l    10(a7),a0
[0005a592] 2068 0014                 movea.l    20(a0),a0
[0005a596] 0270 ff7f 0808            andi.w     #$FF7F,8(a0,d0.l)
[0005a59c] 7002                      moveq.l    #2,d0
[0005a59e] 206f 000a                 movea.l    10(a7),a0
[0005a5a2] 2268 0014                 movea.l    20(a0),a1
[0005a5a6] 41d7                      lea.l      (a7),a0
[0005a5a8] 4eb9 0004 fe06            jsr        Aob_offset
[0005a5ae] 206f 000a                 movea.l    10(a7),a0
[0005a5b2] 3028 0034                 move.w     52(a0),d0
[0005a5b6] d157                      add.w      d0,(a7)
[0005a5b8] 206f 000a                 movea.l    10(a7),a0
[0005a5bc] 3028 0036                 move.w     54(a0),d0
[0005a5c0] d16f 0002                 add.w      d0,2(a7)
[0005a5c4] 43d7                      lea.l      (a7),a1
[0005a5c6] 206f 000a                 movea.l    10(a7),a0
[0005a5ca] 246f 000a                 movea.l    10(a7),a2
[0005a5ce] 246a 006a                 movea.l    106(a2),a2
[0005a5d2] 4e92                      jsr        (a2)
[0005a5d4] 0c6f 0005 0008            cmpi.w     #$0005,8(a7)
[0005a5da] 661a                      bne.s      $0005A5F6
[0005a5dc] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a5e2] 317c 0001 0268            move.w     #$0001,616(a0)
[0005a5e8] 7000                      moveq.l    #0,d0
[0005a5ea] 23c0 0011 3aee            move.l     d0,timer2
[0005a5f0] 23c0 0011 3aea            move.l     d0,timer1
[0005a5f6] 4240                      clr.w      d0
[0005a5f8] 4fef 000e                 lea.l      14(a7),a7
[0005a5fc] 245f                      movea.l    (a7)+,a2
[0005a5fe] 4e75                      rts
Awi_alert:
[0005a600] 4fef ffbc                 lea.l      -68(a7),a7
[0005a604] 3f40 0042                 move.w     d0,66(a7)
[0005a608] 2f48 003e                 move.l     a0,62(a7)
[0005a60c] 206f 003e                 movea.l    62(a7),a0
[0005a610] 4eb9 0008 2f6c            jsr        strlen
[0005a616] 7209                      moveq.l    #9,d1
[0005a618] b280                      cmp.l      d0,d1
[0005a61a] 6306                      bls.s      $0005A622
[0005a61c] 70ff                      moveq.l    #-1,d0
[0005a61e] 6000 07ea                 bra        $0005AE0A
[0005a622] 41f9 000d fb04            lea.l      _W_ALERT,a0
[0005a628] 2279 000d fb0c            movea.l    $000DFB0C,a1
[0005a62e] 4e91                      jsr        (a1)
[0005a630] 2f48 003a                 move.l     a0,58(a7)
[0005a634] 202f 003a                 move.l     58(a7),d0
[0005a638] 6700 07a6                 beq        $0005ADE0
[0005a63c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a642] 2028 03e0                 move.l     992(a0),d0
[0005a646] 6746                      beq.s      $0005A68E
[0005a648] 206f 003a                 movea.l    58(a7),a0
[0005a64c] 2f68 004a 0016            move.l     74(a0),22(a7)
[0005a652] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a658] 2068 03e0                 movea.l    992(a0),a0
[0005a65c] 4eb9 0004 643c            jsr        Ast_create
[0005a662] 226f 003a                 movea.l    58(a7),a1
[0005a666] 2348 004a                 move.l     a0,74(a1)
[0005a66a] 206f 003a                 movea.l    58(a7),a0
[0005a66e] 2028 004a                 move.l     74(a0),d0
[0005a672] 670c                      beq.s      $0005A680
[0005a674] 206f 0016                 movea.l    22(a7),a0
[0005a678] 4eb9 0004 649c            jsr        Ast_delete
[0005a67e] 600a                      bra.s      $0005A68A
[0005a680] 206f 003a                 movea.l    58(a7),a0
[0005a684] 216f 0016 004a            move.l     22(a7),74(a0)
[0005a68a] 6000 00bc                 bra        $0005A748
[0005a68e] 206f 003a                 movea.l    58(a7),a0
[0005a692] 2f68 004a 0016            move.l     74(a0),22(a7)
[0005a698] 206f 003e                 movea.l    62(a7),a0
[0005a69c] 1028 0001                 move.b     1(a0),d0
[0005a6a0] 4880                      ext.w      d0
[0005a6a2] 907c 0031                 sub.w      #$0031,d0
[0005a6a6] 670a                      beq.s      $0005A6B2
[0005a6a8] 5340                      subq.w     #1,d0
[0005a6aa] 6724                      beq.s      $0005A6D0
[0005a6ac] 5340                      subq.w     #1,d0
[0005a6ae] 673e                      beq.s      $0005A6EE
[0005a6b0] 605a                      bra.s      $0005A70C
[0005a6b2] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a6b8] 2068 023c                 movea.l    572(a0),a0
[0005a6bc] 2068 0170                 movea.l    368(a0),a0
[0005a6c0] 4eb9 0004 643c            jsr        Ast_create
[0005a6c6] 226f 003a                 movea.l    58(a7),a1
[0005a6ca] 2348 004a                 move.l     a0,74(a1)
[0005a6ce] 6058                      bra.s      $0005A728
[0005a6d0] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a6d6] 2068 023c                 movea.l    572(a0),a0
[0005a6da] 2068 0174                 movea.l    372(a0),a0
[0005a6de] 4eb9 0004 643c            jsr        Ast_create
[0005a6e4] 226f 003a                 movea.l    58(a7),a1
[0005a6e8] 2348 004a                 move.l     a0,74(a1)
[0005a6ec] 603a                      bra.s      $0005A728
[0005a6ee] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a6f4] 2068 023c                 movea.l    572(a0),a0
[0005a6f8] 2068 0178                 movea.l    376(a0),a0
[0005a6fc] 4eb9 0004 643c            jsr        Ast_create
[0005a702] 226f 003a                 movea.l    58(a7),a1
[0005a706] 2348 004a                 move.l     a0,74(a1)
[0005a70a] 601c                      bra.s      $0005A728
[0005a70c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a712] 2068 023c                 movea.l    572(a0),a0
[0005a716] 2068 017c                 movea.l    380(a0),a0
[0005a71a] 4eb9 0004 643c            jsr        Ast_create
[0005a720] 226f 003a                 movea.l    58(a7),a1
[0005a724] 2348 004a                 move.l     a0,74(a1)
[0005a728] 206f 003a                 movea.l    58(a7),a0
[0005a72c] 2028 004a                 move.l     74(a0),d0
[0005a730] 670c                      beq.s      $0005A73E
[0005a732] 206f 0016                 movea.l    22(a7),a0
[0005a736] 4eb9 0004 649c            jsr        Ast_delete
[0005a73c] 600a                      bra.s      $0005A748
[0005a73e] 206f 003a                 movea.l    58(a7),a0
[0005a742] 216f 0016 004a            move.l     22(a7),74(a0)
[0005a748] 7010                      moveq.l    #16,d0
[0005a74a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a750] 2068 023c                 movea.l    572(a0),a0
[0005a754] c068 000e                 and.w      14(a0),d0
[0005a758] 6752                      beq.s      $0005A7AC
[0005a75a] 7002                      moveq.l    #2,d0
[0005a75c] 206f 003a                 movea.l    58(a7),a0
[0005a760] 2068 0014                 movea.l    20(a0),a0
[0005a764] 2068 01ec                 movea.l    492(a0),a0
[0005a768] 3140 0010                 move.w     d0,16(a0)
[0005a76c] 206f 003a                 movea.l    58(a7),a0
[0005a770] 2068 0014                 movea.l    20(a0),a0
[0005a774] 2068 01d4                 movea.l    468(a0),a0
[0005a778] 3140 0010                 move.w     d0,16(a0)
[0005a77c] 206f 003a                 movea.l    58(a7),a0
[0005a780] 2068 0014                 movea.l    20(a0),a0
[0005a784] 2068 01bc                 movea.l    444(a0),a0
[0005a788] 3140 0010                 move.w     d0,16(a0)
[0005a78c] 206f 003a                 movea.l    58(a7),a0
[0005a790] 2068 0014                 movea.l    20(a0),a0
[0005a794] 2068 01a4                 movea.l    420(a0),a0
[0005a798] 3140 0010                 move.w     d0,16(a0)
[0005a79c] 206f 003a                 movea.l    58(a7),a0
[0005a7a0] 2068 0014                 movea.l    20(a0),a0
[0005a7a4] 2068 018c                 movea.l    396(a0),a0
[0005a7a8] 3140 0010                 move.w     d0,16(a0)
[0005a7ac] 3f7c 0002 0004            move.w     #$0002,4(a7)
[0005a7b2] 6020                      bra.s      $0005A7D4
[0005a7b4] 322f 0004                 move.w     4(a7),d1
[0005a7b8] 48c1                      ext.l      d1
[0005a7ba] 2001                      move.l     d1,d0
[0005a7bc] d080                      add.l      d0,d0
[0005a7be] d081                      add.l      d1,d0
[0005a7c0] e788                      lsl.l      #3,d0
[0005a7c2] 206f 003a                 movea.l    58(a7),a0
[0005a7c6] 2068 0014                 movea.l    20(a0),a0
[0005a7ca] 0070 0080 0808            ori.w      #$0080,8(a0,d0.l)
[0005a7d0] 526f 0004                 addq.w     #1,4(a7)
[0005a7d4] 0c6f 000d 0004            cmpi.w     #$000D,4(a7)
[0005a7da] 6fd8                      ble.s      $0005A7B4
[0005a7dc] 206f 003e                 movea.l    62(a7),a0
[0005a7e0] 1028 0001                 move.b     1(a0),d0
[0005a7e4] 4880                      ext.w      d0
[0005a7e6] 907c 0030                 sub.w      #$0030,d0
[0005a7ea] b07c 0004                 cmp.w      #$0004,d0
[0005a7ee] 6200 0096                 bhi        $0005A886
[0005a7f2] d040                      add.w      d0,d0
[0005a7f4] 303b 0006                 move.w     $0005A7FC(pc,d0.w),d0
[0005a7f8] 4efb 0002                 jmp        $0005A7FC(pc,d0.w)
J45:
[0005a7fc] 000a                      dc.w $000a   ; $0005a806-$0005a7fc
[0005a7fe] 0024                      dc.w $0024   ; $0005a820-$0005a7fc
[0005a800] 0034                      dc.w $0034   ; $0005a830-$0005a7fc
[0005a802] 0044                      dc.w $0044   ; $0005a840-$0005a7fc
[0005a804] 0054                      dc.w $0054   ; $0005a850-$0005a7fc
[0005a806] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a80c] 3028 0012                 move.w     18(a0),d0
[0005a810] d040                      add.w      d0,d0
[0005a812] 206f 003a                 movea.l    58(a7),a0
[0005a816] 2068 0014                 movea.l    20(a0),a0
[0005a81a] 9168 0160                 sub.w      d0,352(a0)
[0005a81e] 6066                      bra.s      $0005A886
[0005a820] 206f 003a                 movea.l    58(a7),a0
[0005a824] 2068 0014                 movea.l    20(a0),a0
[0005a828] 0268 ff7f 0050            andi.w     #$FF7F,80(a0)
[0005a82e] 6056                      bra.s      $0005A886
[0005a830] 206f 003a                 movea.l    58(a7),a0
[0005a834] 2068 0014                 movea.l    20(a0),a0
[0005a838] 0268 ff7f 0068            andi.w     #$FF7F,104(a0)
[0005a83e] 6046                      bra.s      $0005A886
[0005a840] 206f 003a                 movea.l    58(a7),a0
[0005a844] 2068 0014                 movea.l    20(a0),a0
[0005a848] 0268 ff7f 0038            andi.w     #$FF7F,56(a0)
[0005a84e] 6036                      bra.s      $0005A886
[0005a850] 206f 003a                 movea.l    58(a7),a0
[0005a854] 2068 0014                 movea.l    20(a0),a0
[0005a858] 0268 ff7f 0140            andi.w     #$FF7F,320(a0)
[0005a85e] 206f 003a                 movea.l    58(a7),a0
[0005a862] 20bc 0000 0001            move.l     #$00000001,(a0)
[0005a868] 4eb9 0008 0f6c            jsr        Ash_gettimer
[0005a86e] 23c0 0011 3aee            move.l     d0,timer2
[0005a874] 23c0 0011 3aea            move.l     d0,timer1
[0005a87a] 206f 003a                 movea.l    58(a7),a0
[0005a87e] 0068 0020 0056            ori.w      #$0020,86(a0)
[0005a884] 4e71                      nop
[0005a886] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a88c] 2ea8 0232                 move.l     562(a0),(a7)
[0005a890] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005a896] 217c 0000 014d 0232       move.l     #$0000014D,562(a0)
[0005a89e] 206f 003e                 movea.l    62(a7),a0
[0005a8a2] 5248                      addq.w     #1,a0
[0005a8a4] 2f48 0016                 move.l     a0,22(a7)
[0005a8a8] 6004                      bra.s      $0005A8AE
[0005a8aa] 52af 0016                 addq.l     #1,22(a7)
[0005a8ae] 705b                      moveq.l    #91,d0
[0005a8b0] 206f 0016                 movea.l    22(a7),a0
[0005a8b4] 4eb9 0008 2e8a            jsr        strchr
[0005a8ba] 2f48 0016                 move.l     a0,22(a7)
[0005a8be] 670c                      beq.s      $0005A8CC
[0005a8c0] 206f 0016                 movea.l    22(a7),a0
[0005a8c4] 0c28 005d 0001            cmpi.b     #$5D,1(a0)
[0005a8ca] 67de                      beq.s      $0005A8AA
[0005a8cc] 202f 0016                 move.l     22(a7),d0
[0005a8d0] 6730                      beq.s      $0005A902
[0005a8d2] 206f 0016                 movea.l    22(a7),a0
[0005a8d6] 5248                      addq.w     #1,a0
[0005a8d8] 2f48 0012                 move.l     a0,18(a7)
[0005a8dc] 6004                      bra.s      $0005A8E2
[0005a8de] 52af 0012                 addq.l     #1,18(a7)
[0005a8e2] 705b                      moveq.l    #91,d0
[0005a8e4] 206f 0012                 movea.l    18(a7),a0
[0005a8e8] 4eb9 0008 2e8a            jsr        strchr
[0005a8ee] 2f48 0012                 move.l     a0,18(a7)
[0005a8f2] 670c                      beq.s      $0005A900
[0005a8f4] 206f 0012                 movea.l    18(a7),a0
[0005a8f8] 0c28 005d 0001            cmpi.b     #$5D,1(a0)
[0005a8fe] 67de                      beq.s      $0005A8DE
[0005a900] 6004                      bra.s      $0005A906
[0005a902] 42af 0012                 clr.l      18(a7)
[0005a906] 202f 0016                 move.l     22(a7),d0
[0005a90a] 6700 04d4                 beq        $0005ADE0
[0005a90e] 202f 0012                 move.l     18(a7),d0
[0005a912] 6700 04cc                 beq        $0005ADE0
[0005a916] 3f7c 0010 0004            move.w     #$0010,4(a7)
[0005a91c] 601c                      bra.s      $0005A93A
[0005a91e] 43f9 000e 0f98            lea.l      $000E0F98,a1
[0005a924] 302f 0004                 move.w     4(a7),d0
[0005a928] 206f 003a                 movea.l    58(a7),a0
[0005a92c] 2068 0014                 movea.l    20(a0),a0
[0005a930] 4eb9 0005 0fd8            jsr        Aob_puttext
[0005a936] 526f 0004                 addq.w     #1,4(a7)
[0005a93a] 0c6f 0014 0004            cmpi.w     #$0014,4(a7)
[0005a940] 6fdc                      ble.s      $0005A91E
[0005a942] 206f 0012                 movea.l    18(a7),a0
[0005a946] 4228 ffff                 clr.b      -1(a0)
[0005a94a] 3f7c 0004 0008            move.w     #$0004,8(a7)
[0005a950] 3f7c 0010 0004            move.w     #$0010,4(a7)
[0005a956] 206f 0016                 movea.l    22(a7),a0
[0005a95a] 5248                      addq.w     #1,a0
[0005a95c] 2f48 000e                 move.l     a0,14(a7)
[0005a960] 707c                      moveq.l    #124,d0
[0005a962] 206f 000e                 movea.l    14(a7),a0
[0005a966] 4eb9 0008 2e8a            jsr        strchr
[0005a96c] 2f48 000a                 move.l     a0,10(a7)
[0005a970] 662c                      bne.s      $0005A99E
[0005a972] 701e                      moveq.l    #30,d0
[0005a974] 226f 000e                 movea.l    14(a7),a1
[0005a978] 41ef 001a                 lea.l      26(a7),a0
[0005a97c] 4eb9 0008 2fd6            jsr        strncpy
[0005a982] 422f 0038                 clr.b      56(a7)
[0005a986] 43ef 001a                 lea.l      26(a7),a1
[0005a98a] 302f 0004                 move.w     4(a7),d0
[0005a98e] 206f 003a                 movea.l    58(a7),a0
[0005a992] 2068 0014                 movea.l    20(a0),a0
[0005a996] 4eb9 0005 0fd8            jsr        Aob_puttext
[0005a99c] 6046                      bra.s      $0005A9E4
[0005a99e] 536f 0008                 subq.w     #1,8(a7)
[0005a9a2] 206f 000a                 movea.l    10(a7),a0
[0005a9a6] 4210                      clr.b      (a0)
[0005a9a8] 701e                      moveq.l    #30,d0
[0005a9aa] 226f 000e                 movea.l    14(a7),a1
[0005a9ae] 41ef 001a                 lea.l      26(a7),a0
[0005a9b2] 4eb9 0008 2fd6            jsr        strncpy
[0005a9b8] 422f 0038                 clr.b      56(a7)
[0005a9bc] 43ef 001a                 lea.l      26(a7),a1
[0005a9c0] 302f 0004                 move.w     4(a7),d0
[0005a9c4] 206f 003a                 movea.l    58(a7),a0
[0005a9c8] 2068 0014                 movea.l    20(a0),a0
[0005a9cc] 4eb9 0005 0fd8            jsr        Aob_puttext
[0005a9d2] 206f 000a                 movea.l    10(a7),a0
[0005a9d6] 10bc 007c                 move.b     #$7C,(a0)
[0005a9da] 206f 000a                 movea.l    10(a7),a0
[0005a9de] 5248                      addq.w     #1,a0
[0005a9e0] 2f48 000e                 move.l     a0,14(a7)
[0005a9e4] 526f 0004                 addq.w     #1,4(a7)
[0005a9e8] 202f 000a                 move.l     10(a7),d0
[0005a9ec] 6600 ff72                 bne        $0005A960
[0005a9f0] 206f 0012                 movea.l    18(a7),a0
[0005a9f4] 117c 005d ffff            move.b     #$5D,-1(a0)
[0005a9fa] 0c6f 0003 0008            cmpi.w     #$0003,8(a7)
[0005aa00] 6f04                      ble.s      $0005AA06
[0005aa02] 7003                      moveq.l    #3,d0
[0005aa04] 6004                      bra.s      $0005AA0A
[0005aa06] 302f 0008                 move.w     8(a7),d0
[0005aa0a] 3f40 0008                 move.w     d0,8(a7)
[0005aa0e] 302f 0008                 move.w     8(a7),d0
[0005aa12] 6f00 00b8                 ble        $0005AACC
[0005aa16] 302f 0008                 move.w     8(a7),d0
[0005aa1a] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005aa20] c1e8 0014                 muls.w     20(a0),d0
[0005aa24] 206f 003a                 movea.l    58(a7),a0
[0005aa28] 2068 0014                 movea.l    20(a0),a0
[0005aa2c] 9168 0016                 sub.w      d0,22(a0)
[0005aa30] 302f 0008                 move.w     8(a7),d0
[0005aa34] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005aa3a] c1e8 0014                 muls.w     20(a0),d0
[0005aa3e] 206f 003a                 movea.l    58(a7),a0
[0005aa42] 2068 0014                 movea.l    20(a0),a0
[0005aa46] 9168 002e                 sub.w      d0,46(a0)
[0005aa4a] 302f 0008                 move.w     8(a7),d0
[0005aa4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005aa54] c1e8 0014                 muls.w     20(a0),d0
[0005aa58] 206f 003a                 movea.l    58(a7),a0
[0005aa5c] 2068 0014                 movea.l    20(a0),a0
[0005aa60] 9168 0166                 sub.w      d0,358(a0)
[0005aa64] 302f 0008                 move.w     8(a7),d0
[0005aa68] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005aa6e] c1e8 0014                 muls.w     20(a0),d0
[0005aa72] 206f 003a                 movea.l    58(a7),a0
[0005aa76] 2068 0014                 movea.l    20(a0),a0
[0005aa7a] 9168 017e                 sub.w      d0,382(a0)
[0005aa7e] 302f 0008                 move.w     8(a7),d0
[0005aa82] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005aa88] c1e8 0014                 muls.w     20(a0),d0
[0005aa8c] 206f 003a                 movea.l    58(a7),a0
[0005aa90] 2068 0014                 movea.l    20(a0),a0
[0005aa94] 9168 020a                 sub.w      d0,522(a0)
[0005aa98] 302f 0008                 move.w     8(a7),d0
[0005aa9c] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005aaa2] c1e8 0014                 muls.w     20(a0),d0
[0005aaa6] 206f 003a                 movea.l    58(a7),a0
[0005aaaa] 2068 0014                 movea.l    20(a0),a0
[0005aaae] 9168 023a                 sub.w      d0,570(a0)
[0005aab2] 302f 0008                 move.w     8(a7),d0
[0005aab6] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005aabc] c1e8 0014                 muls.w     20(a0),d0
[0005aac0] 206f 003a                 movea.l    58(a7),a0
[0005aac4] 2068 0014                 movea.l    20(a0),a0
[0005aac8] 9168 026a                 sub.w      d0,618(a0)
[0005aacc] 2f6f 0012 000e            move.l     18(a7),14(a7)
[0005aad2] 426f 0008                 clr.w      8(a7)
[0005aad6] 600e                      bra.s      $0005AAE6
[0005aad8] 526f 0008                 addq.w     #1,8(a7)
[0005aadc] 206f 000a                 movea.l    10(a7),a0
[0005aae0] 5248                      addq.w     #1,a0
[0005aae2] 2f48 000e                 move.l     a0,14(a7)
[0005aae6] 206f 000e                 movea.l    14(a7),a0
[0005aaea] 1010                      move.b     (a0),d0
[0005aaec] 6712                      beq.s      $0005AB00
[0005aaee] 707c                      moveq.l    #124,d0
[0005aaf0] 206f 000e                 movea.l    14(a7),a0
[0005aaf4] 4eb9 0008 2e8a            jsr        strchr
[0005aafa] 2f48 000a                 move.l     a0,10(a7)
[0005aafe] 66d8                      bne.s      $0005AAD8
[0005ab00] 302f 0008                 move.w     8(a7),d0
[0005ab04] 4a40                      tst.w      d0
[0005ab06] 6710                      beq.s      $0005AB18
[0005ab08] 5340                      subq.w     #1,d0
[0005ab0a] 6700 0096                 beq        $0005ABA2
[0005ab0e] 5340                      subq.w     #1,d0
[0005ab10] 6700 0090                 beq        $0005ABA2
[0005ab14] 6000 0282                 bra        $0005AD98
[0005ab18] 206f 003a                 movea.l    58(a7),a0
[0005ab1c] 2068 0014                 movea.l    20(a0),a0
[0005ab20] 0068 0080 0200            ori.w      #$0080,512(a0)
[0005ab26] 206f 003a                 movea.l    58(a7),a0
[0005ab2a] 2068 0014                 movea.l    20(a0),a0
[0005ab2e] 0068 0080 0260            ori.w      #$0080,608(a0)
[0005ab34] 226f 0012                 movea.l    18(a7),a1
[0005ab38] 5249                      addq.w     #1,a1
[0005ab3a] 41ef 001a                 lea.l      26(a7),a0
[0005ab3e] 4eb9 0008 2f0c            jsr        strcpy
[0005ab44] 705d                      moveq.l    #93,d0
[0005ab46] 41ef 001a                 lea.l      26(a7),a0
[0005ab4a] 4eb9 0008 2e8a            jsr        strchr
[0005ab50] 2f48 000e                 move.l     a0,14(a7)
[0005ab54] 202f 000e                 move.l     14(a7),d0
[0005ab58] 6706                      beq.s      $0005AB60
[0005ab5a] 206f 000e                 movea.l    14(a7),a0
[0005ab5e] 4210                      clr.b      (a0)
[0005ab60] 43ef 001a                 lea.l      26(a7),a1
[0005ab64] 7017                      moveq.l    #23,d0
[0005ab66] 206f 003a                 movea.l    58(a7),a0
[0005ab6a] 2068 0014                 movea.l    20(a0),a0
[0005ab6e] 4eb9 0005 0fd8            jsr        Aob_puttext
[0005ab74] 206f 003a                 movea.l    58(a7),a0
[0005ab78] 2268 0014                 movea.l    20(a0),a1
[0005ab7c] 43e9 0228                 lea.l      552(a1),a1
[0005ab80] 41ef 001a                 lea.l      26(a7),a0
[0005ab84] 4eb9 0005 ae10            jsr        Awi_hotkey
[0005ab8a] 302f 0042                 move.w     66(a7),d0
[0005ab8e] 6f0e                      ble.s      $0005AB9E
[0005ab90] 206f 003a                 movea.l    58(a7),a0
[0005ab94] 2068 0014                 movea.l    20(a0),a0
[0005ab98] 0068 0002 0230            ori.w      #$0002,560(a0)
[0005ab9e] 6000 01f8                 bra        $0005AD98
[0005aba2] 707c                      moveq.l    #124,d0
[0005aba4] 206f 0012                 movea.l    18(a7),a0
[0005aba8] 5248                      addq.w     #1,a0
[0005abaa] 4eb9 0008 2e8a            jsr        strchr
[0005abb0] 2f48 000e                 move.l     a0,14(a7)
[0005abb4] 202f 000e                 move.l     14(a7),d0
[0005abb8] 90af 0012                 sub.l      18(a7),d0
[0005abbc] 5380                      subq.l     #1,d0
[0005abbe] 226f 0012                 movea.l    18(a7),a1
[0005abc2] 5249                      addq.w     #1,a1
[0005abc4] 41ef 001a                 lea.l      26(a7),a0
[0005abc8] 4eb9 0008 2fd6            jsr        strncpy
[0005abce] 206f 000e                 movea.l    14(a7),a0
[0005abd2] 91ef 0012                 suba.l     18(a7),a0
[0005abd6] 4237 8019                 clr.b      25(a7,a0.w)
[0005abda] 43ef 001a                 lea.l      26(a7),a1
[0005abde] 7015                      moveq.l    #21,d0
[0005abe0] 206f 003a                 movea.l    58(a7),a0
[0005abe4] 2068 0014                 movea.l    20(a0),a0
[0005abe8] 4eb9 0005 0fd8            jsr        Aob_puttext
[0005abee] 206f 003a                 movea.l    58(a7),a0
[0005abf2] 2268 0014                 movea.l    20(a0),a1
[0005abf6] 43e9 01f8                 lea.l      504(a1),a1
[0005abfa] 41ef 001a                 lea.l      26(a7),a0
[0005abfe] 4eb9 0005 ae10            jsr        Awi_hotkey
[0005ac04] 52af 000e                 addq.l     #1,14(a7)
[0005ac08] 707c                      moveq.l    #124,d0
[0005ac0a] 206f 000e                 movea.l    14(a7),a0
[0005ac0e] 4eb9 0008 2e8a            jsr        strchr
[0005ac14] 2f48 000a                 move.l     a0,10(a7)
[0005ac18] 202f 000a                 move.l     10(a7),d0
[0005ac1c] 6724                      beq.s      $0005AC42
[0005ac1e] 202f 000a                 move.l     10(a7),d0
[0005ac22] 90af 000e                 sub.l      14(a7),d0
[0005ac26] 226f 000e                 movea.l    14(a7),a1
[0005ac2a] 41ef 001a                 lea.l      26(a7),a0
[0005ac2e] 4eb9 0008 2fd6            jsr        strncpy
[0005ac34] 206f 000a                 movea.l    10(a7),a0
[0005ac38] 91ef 000e                 suba.l     14(a7),a0
[0005ac3c] 4237 801a                 clr.b      26(a7,a0.w)
[0005ac40] 602a                      bra.s      $0005AC6C
[0005ac42] 226f 000e                 movea.l    14(a7),a1
[0005ac46] 41ef 001a                 lea.l      26(a7),a0
[0005ac4a] 4eb9 0008 2f0c            jsr        strcpy
[0005ac50] 705d                      moveq.l    #93,d0
[0005ac52] 41ef 001a                 lea.l      26(a7),a0
[0005ac56] 4eb9 0008 2e8a            jsr        strchr
[0005ac5c] 2f48 000e                 move.l     a0,14(a7)
[0005ac60] 202f 000e                 move.l     14(a7),d0
[0005ac64] 6706                      beq.s      $0005AC6C
[0005ac66] 206f 000e                 movea.l    14(a7),a0
[0005ac6a] 4210                      clr.b      (a0)
[0005ac6c] 43ef 001a                 lea.l      26(a7),a1
[0005ac70] 7017                      moveq.l    #23,d0
[0005ac72] 206f 003a                 movea.l    58(a7),a0
[0005ac76] 2068 0014                 movea.l    20(a0),a0
[0005ac7a] 4eb9 0005 0fd8            jsr        Aob_puttext
[0005ac80] 206f 003a                 movea.l    58(a7),a0
[0005ac84] 2268 0014                 movea.l    20(a0),a1
[0005ac88] 43e9 0228                 lea.l      552(a1),a1
[0005ac8c] 41ef 001a                 lea.l      26(a7),a0
[0005ac90] 4eb9 0005 ae10            jsr        Awi_hotkey
[0005ac96] 0c6f 0002 0008            cmpi.w     #$0002,8(a7)
[0005ac9c] 6662                      bne.s      $0005AD00
[0005ac9e] 52af 000a                 addq.l     #1,10(a7)
[0005aca2] 705d                      moveq.l    #93,d0
[0005aca4] 206f 000a                 movea.l    10(a7),a0
[0005aca8] 4eb9 0008 2e8a            jsr        strchr
[0005acae] 2f48 000e                 move.l     a0,14(a7)
[0005acb2] 202f 000e                 move.l     14(a7),d0
[0005acb6] 90af 000a                 sub.l      10(a7),d0
[0005acba] 226f 000a                 movea.l    10(a7),a1
[0005acbe] 41ef 001a                 lea.l      26(a7),a0
[0005acc2] 4eb9 0008 2fd6            jsr        strncpy
[0005acc8] 206f 000e                 movea.l    14(a7),a0
[0005accc] 91ef 000a                 suba.l     10(a7),a0
[0005acd0] 4237 801a                 clr.b      26(a7,a0.w)
[0005acd4] 43ef 001a                 lea.l      26(a7),a1
[0005acd8] 7019                      moveq.l    #25,d0
[0005acda] 206f 003a                 movea.l    58(a7),a0
[0005acde] 2068 0014                 movea.l    20(a0),a0
[0005ace2] 4eb9 0005 0fd8            jsr        Aob_puttext
[0005ace8] 206f 003a                 movea.l    58(a7),a0
[0005acec] 2268 0014                 movea.l    20(a0),a1
[0005acf0] 43e9 0258                 lea.l      600(a1),a1
[0005acf4] 41ef 001a                 lea.l      26(a7),a0
[0005acf8] 4eb9 0005 ae10            jsr        Awi_hotkey
[0005acfe] 6056                      bra.s      $0005AD56
[0005ad00] 206f 003a                 movea.l    58(a7),a0
[0005ad04] 2068 0014                 movea.l    20(a0),a0
[0005ad08] 3028 020c                 move.w     524(a0),d0
[0005ad0c] e240                      asr.w      #1,d0
[0005ad0e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ad14] d068 0012                 add.w      18(a0),d0
[0005ad18] 206f 003a                 movea.l    58(a7),a0
[0005ad1c] 2068 0014                 movea.l    20(a0),a0
[0005ad20] d168 0208                 add.w      d0,520(a0)
[0005ad24] 206f 003a                 movea.l    58(a7),a0
[0005ad28] 2068 0014                 movea.l    20(a0),a0
[0005ad2c] 3028 023c                 move.w     572(a0),d0
[0005ad30] e240                      asr.w      #1,d0
[0005ad32] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005ad38] d068 0012                 add.w      18(a0),d0
[0005ad3c] 206f 003a                 movea.l    58(a7),a0
[0005ad40] 2068 0014                 movea.l    20(a0),a0
[0005ad44] d168 0238                 add.w      d0,568(a0)
[0005ad48] 206f 003a                 movea.l    58(a7),a0
[0005ad4c] 2068 0014                 movea.l    20(a0),a0
[0005ad50] 0068 0080 0260            ori.w      #$0080,608(a0)
[0005ad56] 302f 0042                 move.w     66(a7),d0
[0005ad5a] 5340                      subq.w     #1,d0
[0005ad5c] 670a                      beq.s      $0005AD68
[0005ad5e] 5340                      subq.w     #1,d0
[0005ad60] 6716                      beq.s      $0005AD78
[0005ad62] 5340                      subq.w     #1,d0
[0005ad64] 6722                      beq.s      $0005AD88
[0005ad66] 6030                      bra.s      $0005AD98
[0005ad68] 206f 003a                 movea.l    58(a7),a0
[0005ad6c] 2068 0014                 movea.l    20(a0),a0
[0005ad70] 0068 0002 0200            ori.w      #$0002,512(a0)
[0005ad76] 6020                      bra.s      $0005AD98
[0005ad78] 206f 003a                 movea.l    58(a7),a0
[0005ad7c] 2068 0014                 movea.l    20(a0),a0
[0005ad80] 0068 0002 0230            ori.w      #$0002,560(a0)
[0005ad86] 6010                      bra.s      $0005AD98
[0005ad88] 206f 003a                 movea.l    58(a7),a0
[0005ad8c] 2068 0014                 movea.l    20(a0),a0
[0005ad90] 0068 0002 0260            ori.w      #$0002,608(a0)
[0005ad96] 4e71                      nop
[0005ad98] 206f 003a                 movea.l    58(a7),a0
[0005ad9c] 6100 f056                 bsr        Awi_dialog
[0005ada0] 3f40 0006                 move.w     d0,6(a7)
[0005ada4] 206f 003a                 movea.l    58(a7),a0
[0005ada8] 6100 d848                 bsr        Awi_delete
[0005adac] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005adb2] 2157 0232                 move.l     (a7),562(a0)
[0005adb6] 302f 0006                 move.w     6(a7),d0
[0005adba] 907c 0015                 sub.w      #$0015,d0
[0005adbe] 670a                      beq.s      $0005ADCA
[0005adc0] 5540                      subq.w     #2,d0
[0005adc2] 670a                      beq.s      $0005ADCE
[0005adc4] 5540                      subq.w     #2,d0
[0005adc6] 670a                      beq.s      $0005ADD2
[0005adc8] 600c                      bra.s      $0005ADD6
[0005adca] 7001                      moveq.l    #1,d0
[0005adcc] 603c                      bra.s      $0005AE0A
[0005adce] 7002                      moveq.l    #2,d0
[0005add0] 6038                      bra.s      $0005AE0A
[0005add2] 7003                      moveq.l    #3,d0
[0005add4] 6034                      bra.s      $0005AE0A
[0005add6] 302f 0006                 move.w     6(a7),d0
[0005adda] 6b04                      bmi.s      $0005ADE0
[0005addc] 70ff                      moveq.l    #-1,d0
[0005adde] 602a                      bra.s      $0005AE0A
[0005ade0] 206f 003e                 movea.l    62(a7),a0
[0005ade4] 0c28 0033 0001            cmpi.b     #$33,1(a0)
[0005adea] 6f0a                      ble.s      $0005ADF6
[0005adec] 206f 003e                 movea.l    62(a7),a0
[0005adf0] 117c 0031 0001            move.b     #$31,1(a0)
[0005adf6] 2279 000e 692a            movea.l    _globl,a1
[0005adfc] 206f 003e                 movea.l    62(a7),a0
[0005ae00] 302f 0042                 move.w     66(a7),d0
[0005ae04] 4eb9 0007 a146            jsr        mt_form_alert
[0005ae0a] 4fef 0044                 lea.l      68(a7),a7
[0005ae0e] 4e75                      rts
Awi_hotkey:
[0005ae10] 4fef fff0                 lea.l      -16(a7),a7
[0005ae14] 2f48 000c                 move.l     a0,12(a7)
[0005ae18] 2f49 0008                 move.l     a1,8(a7)
[0005ae1c] 206f 0008                 movea.l    8(a7),a0
[0005ae20] 41e8 0018                 lea.l      24(a0),a0
[0005ae24] 2e88                      move.l     a0,(a7)
[0005ae26] 2f6f 000c 0004            move.l     12(a7),4(a7)
[0005ae2c] 601a                      bra.s      $0005AE48
[0005ae2e] 206f 0004                 movea.l    4(a7),a0
[0005ae32] 1010                      move.b     (a0),d0
[0005ae34] 4880                      ext.w      d0
[0005ae36] 4eb9 0008 37aa            jsr        isalnum
[0005ae3c] 4a40                      tst.w      d0
[0005ae3e] 6704                      beq.s      $0005AE44
[0005ae40] 600e                      bra.s      $0005AE50
[0005ae42] 6004                      bra.s      $0005AE48
[0005ae44] 52af 0004                 addq.l     #1,4(a7)
[0005ae48] 206f 0004                 movea.l    4(a7),a0
[0005ae4c] 1010                      move.b     (a0),d0
[0005ae4e] 66de                      bne.s      $0005AE2E
[0005ae50] 206f 0004                 movea.l    4(a7),a0
[0005ae54] 1010                      move.b     (a0),d0
[0005ae56] 671a                      beq.s      $0005AE72
[0005ae58] 206f 0004                 movea.l    4(a7),a0
[0005ae5c] 1010                      move.b     (a0),d0
[0005ae5e] 4880                      ext.w      d0
[0005ae60] 4eb9 0008 3824            jsr        toupper
[0005ae66] 807c 8800                 or.w       #$8800,d0
[0005ae6a] 2057                      movea.l    (a7),a0
[0005ae6c] 3140 000a                 move.w     d0,10(a0)
[0005ae70] 6006                      bra.s      $0005AE78
[0005ae72] 2057                      movea.l    (a7),a0
[0005ae74] 4268 000a                 clr.w      10(a0)
[0005ae78] 4fef 0010                 lea.l      16(a7),a7
[0005ae7c] 4e75                      rts
Awi_update:
[0005ae7e] 554f                      subq.w     #2,a7
[0005ae80] 3e80                      move.w     d0,(a7)
[0005ae82] 3017                      move.w     (a7),d0
[0005ae84] c07c 00ff                 and.w      #$00FF,d0
[0005ae88] b07c 0003                 cmp.w      #$0003,d0
[0005ae8c] 6700 007a                 beq.w      $0005AF08
[0005ae90] 6e12                      bgt.s      $0005AEA4
[0005ae92] 4a40                      tst.w      d0
[0005ae94] 674e                      beq.s      $0005AEE4
[0005ae96] 5340                      subq.w     #1,d0
[0005ae98] 671e                      beq.s      $0005AEB8
[0005ae9a] 5340                      subq.w     #1,d0
[0005ae9c] 6700 0096                 beq        $0005AF34
[0005aea0] 6000 0162                 bra        $0005B004
[0005aea4] 907c 0010                 sub.w      #$0010,d0
[0005aea8] 6700 00ae                 beq        $0005AF58
[0005aeac] 907c 0010                 sub.w      #$0010,d0
[0005aeb0] 6700 00f4                 beq        $0005AFA6
[0005aeb4] 6000 014e                 bra        $0005B004
[0005aeb8] 3039 000e 0cfe            move.w     winupd,d0
[0005aebe] 5279 000e 0cfe            addq.w     #1,winupd
[0005aec4] 4a40                      tst.w      d0
[0005aec6] 6704                      beq.s      $0005AECC
[0005aec8] 6000 013a                 bra        $0005B004
[0005aecc] 2079 000e 692a            movea.l    _globl,a0
[0005aed2] 7001                      moveq.l    #1,d0
[0005aed4] 4eb9 0007 b880            jsr        mt_wind_update
[0005aeda] 4279 000e 0d00            clr.w      winoldupd
[0005aee0] 6000 0122                 bra        $0005B004
[0005aee4] 5379 000e 0cfe            subq.w     #1,winupd
[0005aeea] 6704                      beq.s      $0005AEF0
[0005aeec] 6000 0116                 bra        $0005B004
[0005aef0] 2079 000e 692a            movea.l    _globl,a0
[0005aef6] 4240                      clr.w      d0
[0005aef8] 4eb9 0007 b880            jsr        mt_wind_update
[0005aefe] 4279 000e 0d00            clr.w      winoldupd
[0005af04] 6000 00fe                 bra        $0005B004
[0005af08] 3039 000e 0d02            move.w     msupd,d0
[0005af0e] 5279 000e 0d02            addq.w     #1,msupd
[0005af14] 4a40                      tst.w      d0
[0005af16] 6704                      beq.s      $0005AF1C
[0005af18] 6000 00ea                 bra        $0005B004
[0005af1c] 2079 000e 692a            movea.l    _globl,a0
[0005af22] 7003                      moveq.l    #3,d0
[0005af24] 4eb9 0007 b880            jsr        mt_wind_update
[0005af2a] 4279 000e 0d04            clr.w      msoldupd
[0005af30] 6000 00d2                 bra        $0005B004
[0005af34] 5379 000e 0d02            subq.w     #1,msupd
[0005af3a] 6704                      beq.s      $0005AF40
[0005af3c] 6000 00c6                 bra        $0005B004
[0005af40] 2079 000e 692a            movea.l    _globl,a0
[0005af46] 7002                      moveq.l    #2,d0
[0005af48] 4eb9 0007 b880            jsr        mt_wind_update
[0005af4e] 4279 000e 0d04            clr.w      msoldupd
[0005af54] 6000 00ae                 bra        $0005B004
[0005af58] 3039 000e 0cfe            move.w     winupd,d0
[0005af5e] 671e                      beq.s      $0005AF7E
[0005af60] 2079 000e 692a            movea.l    _globl,a0
[0005af66] 4240                      clr.w      d0
[0005af68] 4eb9 0007 b880            jsr        mt_wind_update
[0005af6e] 33f9 000e 0cfe 000e 0d00  move.w     winupd,winoldupd
[0005af78] 4279 000e 0cfe            clr.w      winupd
[0005af7e] 3039 000e 0d02            move.w     msupd,d0
[0005af84] 671e                      beq.s      $0005AFA4
[0005af86] 2079 000e 692a            movea.l    _globl,a0
[0005af8c] 7002                      moveq.l    #2,d0
[0005af8e] 4eb9 0007 b880            jsr        mt_wind_update
[0005af94] 33f9 000e 0d02 000e 0d04  move.w     msupd,msoldupd
[0005af9e] 4279 000e 0d02            clr.w      msupd
[0005afa4] 605e                      bra.s      $0005B004
[0005afa6] 3039 000e 0cfe            move.w     winupd,d0
[0005afac] 6626                      bne.s      $0005AFD4
[0005afae] 3039 000e 0d00            move.w     winoldupd,d0
[0005afb4] 671e                      beq.s      $0005AFD4
[0005afb6] 2079 000e 692a            movea.l    _globl,a0
[0005afbc] 7001                      moveq.l    #1,d0
[0005afbe] 4eb9 0007 b880            jsr        mt_wind_update
[0005afc4] 33f9 000e 0d00 000e 0cfe  move.w     winoldupd,winupd
[0005afce] 4279 000e 0d00            clr.w      winoldupd
[0005afd4] 3039 000e 0d02            move.w     msupd,d0
[0005afda] 6626                      bne.s      $0005B002
[0005afdc] 3039 000e 0d04            move.w     msoldupd,d0
[0005afe2] 671e                      beq.s      $0005B002
[0005afe4] 2079 000e 692a            movea.l    _globl,a0
[0005afea] 7003                      moveq.l    #3,d0
[0005afec] 4eb9 0007 b880            jsr        mt_wind_update
[0005aff2] 33f9 000e 0d04 000e 0d02  move.w     msoldupd,msupd
[0005affc] 4279 000e 0d04            clr.w      msoldupd
[0005b002] 4e71                      nop
[0005b004] 544f                      addq.w     #2,a7
[0005b006] 4e75                      rts
Awi_obfind:
[0005b008] 4fef ffe6                 lea.l      -26(a7),a7
[0005b00c] 2f48 0016                 move.l     a0,22(a7)
[0005b010] 3f40 0014                 move.w     d0,20(a7)
[0005b014] 3f41 0012                 move.w     d1,18(a7)
[0005b018] 2f49 000e                 move.l     a1,14(a7)
[0005b01c] 202f 000e                 move.l     14(a7),d0
[0005b020] 6706                      beq.s      $0005B028
[0005b022] 206f 000e                 movea.l    14(a7),a0
[0005b026] 4290                      clr.l      (a0)
[0005b028] 202f 001e                 move.l     30(a7),d0
[0005b02c] 6708                      beq.s      $0005B036
[0005b02e] 206f 001e                 movea.l    30(a7),a0
[0005b032] 30bc ffff                 move.w     #$FFFF,(a0)
[0005b036] 206f 0016                 movea.l    22(a7),a0
[0005b03a] 3028 0020                 move.w     32(a0),d0
[0005b03e] 6a06                      bpl.s      $0005B046
[0005b040] 91c8                      suba.l     a0,a0
[0005b042] 6000 010e                 bra        $0005B152
[0005b046] 206f 0016                 movea.l    22(a7),a0
[0005b04a] 3f68 0036 000c            move.w     54(a0),12(a7)
[0005b050] 206f 0016                 movea.l    22(a7),a0
[0005b054] 3f68 0034 0008            move.w     52(a0),8(a7)
[0005b05a] 206f 0016                 movea.l    22(a7),a0
[0005b05e] 3f68 0036 0006            move.w     54(a0),6(a7)
[0005b064] 206f 0016                 movea.l    22(a7),a0
[0005b068] 2028 0018                 move.l     24(a0),d0
[0005b06c] 670e                      beq.s      $0005B07C
[0005b06e] 206f 0016                 movea.l    22(a7),a0
[0005b072] 2068 0018                 movea.l    24(a0),a0
[0005b076] 3028 0016                 move.w     22(a0),d0
[0005b07a] 6002                      bra.s      $0005B07E
[0005b07c] 4240                      clr.w      d0
[0005b07e] 3f40 000a                 move.w     d0,10(a7)
[0005b082] 302f 000c                 move.w     12(a7),d0
[0005b086] 906f 000a                 sub.w      10(a7),d0
[0005b08a] 322f 0012                 move.w     18(a7),d1
[0005b08e] b240                      cmp.w      d0,d1
[0005b090] 6c06                      bge.s      $0005B098
[0005b092] 91c8                      suba.l     a0,a0
[0005b094] 6000 00bc                 bra        $0005B152
[0005b098] 206f 0016                 movea.l    22(a7),a0
[0005b09c] 2028 0018                 move.l     24(a0),d0
[0005b0a0] 6724                      beq.s      $0005B0C6
[0005b0a2] 302f 0012                 move.w     18(a7),d0
[0005b0a6] b06f 000c                 cmp.w      12(a7),d0
[0005b0aa] 6c1a                      bge.s      $0005B0C6
[0005b0ac] 302f 000c                 move.w     12(a7),d0
[0005b0b0] 906f 000a                 sub.w      10(a7),d0
[0005b0b4] 322f 0012                 move.w     18(a7),d1
[0005b0b8] b240                      cmp.w      d0,d1
[0005b0ba] 6d0a                      blt.s      $0005B0C6
[0005b0bc] 206f 0016                 movea.l    22(a7),a0
[0005b0c0] 2ea8 0018                 move.l     24(a0),(a7)
[0005b0c4] 6022                      bra.s      $0005B0E8
[0005b0c6] 206f 0016                 movea.l    22(a7),a0
[0005b0ca] 2ea8 0014                 move.l     20(a0),(a7)
[0005b0ce] 206f 0016                 movea.l    22(a7),a0
[0005b0d2] 2028 0018                 move.l     24(a0),d0
[0005b0d6] 670a                      beq.s      $0005B0E2
[0005b0d8] 206f 0016                 movea.l    22(a7),a0
[0005b0dc] 3028 0036                 move.w     54(a0),d0
[0005b0e0] 6002                      bra.s      $0005B0E4
[0005b0e2] 4240                      clr.w      d0
[0005b0e4] d16f 0006                 add.w      d0,6(a7)
[0005b0e8] 2017                      move.l     (a7),d0
[0005b0ea] 6604                      bne.s      $0005B0F0
[0005b0ec] 91c8                      suba.l     a0,a0
[0005b0ee] 6062                      bra.s      $0005B152
[0005b0f0] 302f 0012                 move.w     18(a7),d0
[0005b0f4] 906f 0006                 sub.w      6(a7),d0
[0005b0f8] 3f00                      move.w     d0,-(a7)
[0005b0fa] 2279 000e 692a            movea.l    _globl,a1
[0005b100] 342f 0016                 move.w     22(a7),d2
[0005b104] 946f 000a                 sub.w      10(a7),d2
[0005b108] 7264                      moveq.l    #100,d1
[0005b10a] 4240                      clr.w      d0
[0005b10c] 206f 0002                 movea.l    2(a7),a0
[0005b110] 4eb9 0007 9c96            jsr        mt_objc_find
[0005b116] 544f                      addq.w     #2,a7
[0005b118] 3f40 0004                 move.w     d0,4(a7)
[0005b11c] 202f 000e                 move.l     14(a7),d0
[0005b120] 6706                      beq.s      $0005B128
[0005b122] 206f 000e                 movea.l    14(a7),a0
[0005b126] 2097                      move.l     (a7),(a0)
[0005b128] 202f 001e                 move.l     30(a7),d0
[0005b12c] 6708                      beq.s      $0005B136
[0005b12e] 206f 001e                 movea.l    30(a7),a0
[0005b132] 30af 0004                 move.w     4(a7),(a0)
[0005b136] 302f 0004                 move.w     4(a7),d0
[0005b13a] 6b14                      bmi.s      $0005B150
[0005b13c] 322f 0004                 move.w     4(a7),d1
[0005b140] 48c1                      ext.l      d1
[0005b142] 2001                      move.l     d1,d0
[0005b144] d080                      add.l      d0,d0
[0005b146] d081                      add.l      d1,d0
[0005b148] e788                      lsl.l      #3,d0
[0005b14a] 2057                      movea.l    (a7),a0
[0005b14c] d1c0                      adda.l     d0,a0
[0005b14e] 6002                      bra.s      $0005B152
[0005b150] 91c8                      suba.l     a0,a0
[0005b152] 4fef 001a                 lea.l      26(a7),a7
[0005b156] 4e75                      rts
Awi_contstring:
[0005b158] 2f0a                      move.l     a2,-(a7)
[0005b15a] 4fef ffda                 lea.l      -38(a7),a7
[0005b15e] 2f48 0022                 move.l     a0,34(a7)
[0005b162] 3f40 0020                 move.w     d0,32(a7)
[0005b166] 3f41 001e                 move.w     d1,30(a7)
[0005b16a] 2f42 001a                 move.l     d2,26(a7)
[0005b16e] 2f49 0016                 move.l     a1,22(a7)
[0005b172] 3f7c 0001 0014            move.w     #$0001,20(a7)
[0005b178] 426f 0012                 clr.w      18(a7)
[0005b17c] 41f9 000e 0ee2            lea.l      $000E0EE2,a0
[0005b182] 43d7                      lea.l      (a7),a1
[0005b184] 22d8                      move.l     (a0)+,(a1)+
[0005b186] 32d8                      move.w     (a0)+,(a1)+
[0005b188] 43ef 0014                 lea.l      20(a7),a1
[0005b18c] 302f 002e                 move.w     46(a7),d0
[0005b190] 206f 0022                 movea.l    34(a7),a0
[0005b194] 246f 0022                 movea.l    34(a7),a2
[0005b198] 246a 0004                 movea.l    4(a2),a2
[0005b19c] 4e92                      jsr        (a2)
[0005b19e] 4a40                      tst.w      d0
[0005b1a0] 670c                      beq.s      $0005B1AE
[0005b1a2] 302f 0014                 move.w     20(a7),d0
[0005b1a6] 6606                      bne.s      $0005B1AE
[0005b1a8] 91c8                      suba.l     a0,a0
[0005b1aa] 6000 00de                 bra        $0005B28A
[0005b1ae] 4857                      pea.l      (a7)
[0005b1b0] 43ef 000e                 lea.l      14(a7),a1
[0005b1b4] 322f 0022                 move.w     34(a7),d1
[0005b1b8] 302f 0024                 move.w     36(a7),d0
[0005b1bc] 206f 0026                 movea.l    38(a7),a0
[0005b1c0] 6100 fe46                 bsr        Awi_obfind
[0005b1c4] 584f                      addq.w     #4,a7
[0005b1c6] 3017                      move.w     (a7),d0
[0005b1c8] 6b00 00bc                 bmi        $0005B286
[0005b1cc] 3217                      move.w     (a7),d1
[0005b1ce] 48c1                      ext.l      d1
[0005b1d0] 2001                      move.l     d1,d0
[0005b1d2] d080                      add.l      d0,d0
[0005b1d4] d081                      add.l      d1,d0
[0005b1d6] e788                      lsl.l      #3,d0
[0005b1d8] 206f 000a                 movea.l    10(a7),a0
[0005b1dc] d1c0                      adda.l     d0,a0
[0005b1de] 2f48 000e                 move.l     a0,14(a7)
[0005b1e2] 206f 000e                 movea.l    14(a7),a0
[0005b1e6] 0c68 0018 0006            cmpi.w     #$0018,6(a0)
[0005b1ec] 660c                      bne.s      $0005B1FA
[0005b1ee] 206f 000e                 movea.l    14(a7),a0
[0005b1f2] 2f68 000c 0006            move.l     12(a0),6(a7)
[0005b1f8] 6004                      bra.s      $0005B1FE
[0005b1fa] 42af 0006                 clr.l      6(a7)
[0005b1fe] 202f 0016                 move.l     22(a7),d0
[0005b202] 6708                      beq.s      $0005B20C
[0005b204] 206f 0016                 movea.l    22(a7),a0
[0005b208] 20af 000e                 move.l     14(a7),(a0)
[0005b20c] 202f 0034                 move.l     52(a7),d0
[0005b210] 6706                      beq.s      $0005B218
[0005b212] 206f 0034                 movea.l    52(a7),a0
[0005b216] 3097                      move.w     (a7),(a0)
[0005b218] 202f 0006                 move.l     6(a7),d0
[0005b21c] 6734                      beq.s      $0005B252
[0005b21e] 202f 001a                 move.l     26(a7),d0
[0005b222] e588                      lsl.l      #2,d0
[0005b224] 206f 0006                 movea.l    6(a7),a0
[0005b228] 2f70 0800 0002            move.l     0(a0,d0.l),2(a7)
[0005b22e] 206f 0006                 movea.l    6(a7),a0
[0005b232] 2028 0008                 move.l     8(a0),d0
[0005b236] 671a                      beq.s      $0005B252
[0005b238] 43ef 0002                 lea.l      2(a7),a1
[0005b23c] 302f 0030                 move.w     48(a7),d0
[0005b240] 206f 000e                 movea.l    14(a7),a0
[0005b244] 246f 0006                 movea.l    6(a7),a2
[0005b248] 246a 0008                 movea.l    8(a2),a2
[0005b24c] 4e92                      jsr        (a2)
[0005b24e] 3f40 0012                 move.w     d0,18(a7)
[0005b252] 302f 0012                 move.w     18(a7),d0
[0005b256] 662e                      bne.s      $0005B286
[0005b258] 206f 0022                 movea.l    34(a7),a0
[0005b25c] 226f 000a                 movea.l    10(a7),a1
[0005b260] b3e8 0018                 cmpa.l     24(a0),a1
[0005b264] 6604                      bne.s      $0005B26A
[0005b266] 0057 1000                 ori.w      #$1000,(a7)
[0005b26a] 43d7                      lea.l      (a7),a1
[0005b26c] 302f 0032                 move.w     50(a7),d0
[0005b270] 206f 0022                 movea.l    34(a7),a0
[0005b274] 246f 0022                 movea.l    34(a7),a2
[0005b278] 246a 0004                 movea.l    4(a2),a2
[0005b27c] 4e92                      jsr        (a2)
[0005b27e] 4a40                      tst.w      d0
[0005b280] 6604                      bne.s      $0005B286
[0005b282] 42af 0002                 clr.l      2(a7)
[0005b286] 206f 0002                 movea.l    2(a7),a0
[0005b28a] 4fef 0026                 lea.l      38(a7),a7
[0005b28e] 245f                      movea.l    (a7)+,a2
[0005b290] 4e75                      rts
Awi_bubblegem:
[0005b292] 4fef fff4                 lea.l      -12(a7),a7
[0005b296] 2f48 0008                 move.l     a0,8(a7)
[0005b29a] 3f40 0006                 move.w     d0,6(a7)
[0005b29e] 3f41 0004                 move.w     d1,4(a7)
[0005b2a2] 42a7                      clr.l      -(a7)
[0005b2a4] 7025                      moveq.l    #37,d0
[0005b2a6] 3f00                      move.w     d0,-(a7)
[0005b2a8] 7013                      moveq.l    #19,d0
[0005b2aa] 3f00                      move.w     d0,-(a7)
[0005b2ac] 7024                      moveq.l    #36,d0
[0005b2ae] 3f00                      move.w     d0,-(a7)
[0005b2b0] 93c9                      suba.l     a1,a1
[0005b2b2] 7406                      moveq.l    #6,d2
[0005b2b4] 322f 000e                 move.w     14(a7),d1
[0005b2b8] 302f 0010                 move.w     16(a7),d0
[0005b2bc] 206f 0012                 movea.l    18(a7),a0
[0005b2c0] 6100 fe96                 bsr        Awi_contstring
[0005b2c4] 4fef 000a                 lea.l      10(a7),a7
[0005b2c8] 2e88                      move.l     a0,(a7)
[0005b2ca] 2057                      movea.l    (a7),a0
[0005b2cc] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0005b2d2] 4a40                      tst.w      d0
[0005b2d4] 6704                      beq.s      $0005B2DA
[0005b2d6] 4240                      clr.w      d0
[0005b2d8] 6010                      bra.s      $0005B2EA
[0005b2da] 322f 0004                 move.w     4(a7),d1
[0005b2de] 302f 0006                 move.w     6(a7),d0
[0005b2e2] 2057                      movea.l    (a7),a0
[0005b2e4] 4eb9 0006 074e            jsr        Aev_ShowBubbleGEM
[0005b2ea] 4fef 000c                 lea.l      12(a7),a7
[0005b2ee] 4e75                      rts
Awi_context:
[0005b2f0] 3f03                      move.w     d3,-(a7)
[0005b2f2] 2f0a                      move.l     a2,-(a7)
[0005b2f4] 4fef ffe4                 lea.l      -28(a7),a7
[0005b2f8] 2f48 0018                 move.l     a0,24(a7)
[0005b2fc] 3f40 0016                 move.w     d0,22(a7)
[0005b300] 3f41 0014                 move.w     d1,20(a7)
[0005b304] 4257                      clr.w      (a7)
[0005b306] 486f 0002                 pea.l      2(a7)
[0005b30a] 7027                      moveq.l    #39,d0
[0005b30c] 3f00                      move.w     d0,-(a7)
[0005b30e] 7014                      moveq.l    #20,d0
[0005b310] 3f00                      move.w     d0,-(a7)
[0005b312] 7026                      moveq.l    #38,d0
[0005b314] 3f00                      move.w     d0,-(a7)
[0005b316] 43ef 0016                 lea.l      22(a7),a1
[0005b31a] 7407                      moveq.l    #7,d2
[0005b31c] 322f 001e                 move.w     30(a7),d1
[0005b320] 302f 0020                 move.w     32(a7),d0
[0005b324] 206f 0022                 movea.l    34(a7),a0
[0005b328] 6100 fe2e                 bsr        Awi_contstring
[0005b32c] 4fef 000a                 lea.l      10(a7),a7
[0005b330] 2f48 0010                 move.l     a0,16(a7)
[0005b334] 206f 0010                 movea.l    16(a7),a0
[0005b338] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0005b33e] 4a40                      tst.w      d0
[0005b340] 6600 0092                 bne        $0005B3D4
[0005b344] 42a7                      clr.l      -(a7)
[0005b346] 342f 0018                 move.w     24(a7),d2
[0005b34a] 322f 001a                 move.w     26(a7),d1
[0005b34e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005b354] 3628 0012                 move.w     18(a0),d3
[0005b358] 3003                      move.w     d3,d0
[0005b35a] e948                      lsl.w      #4,d0
[0005b35c] 9043                      sub.w      d3,d0
[0005b35e] d040                      add.w      d0,d0
[0005b360] 226f 0014                 movea.l    20(a7),a1
[0005b364] 206f 001c                 movea.l    28(a7),a0
[0005b368] 4eb9 0006 7b6c            jsr        Ame_strpopup
[0005b36e] 584f                      addq.w     #4,a7
[0005b370] 2f48 0004                 move.l     a0,4(a7)
[0005b374] 206f 000c                 movea.l    12(a7),a0
[0005b378] 0c68 0018 0006            cmpi.w     #$0018,6(a0)
[0005b37e] 660c                      bne.s      $0005B38C
[0005b380] 206f 000c                 movea.l    12(a7),a0
[0005b384] 2f68 000c 0008            move.l     12(a0),8(a7)
[0005b38a] 6004                      bra.s      $0005B390
[0005b38c] 42af 0008                 clr.l      8(a7)
[0005b390] 202f 0008                 move.l     8(a7),d0
[0005b394] 6728                      beq.s      $0005B3BE
[0005b396] 206f 0008                 movea.l    8(a7),a0
[0005b39a] 2028 0008                 move.l     8(a0),d0
[0005b39e] 671e                      beq.s      $0005B3BE
[0005b3a0] 226f 0004                 movea.l    4(a7),a1
[0005b3a4] 7015                      moveq.l    #21,d0
[0005b3a6] 206f 000c                 movea.l    12(a7),a0
[0005b3aa] 246f 0008                 movea.l    8(a7),a2
[0005b3ae] 246a 0008                 movea.l    8(a2),a2
[0005b3b2] 4e92                      jsr        (a2)
[0005b3b4] 4a40                      tst.w      d0
[0005b3b6] 6706                      beq.s      $0005B3BE
[0005b3b8] 3ebc 0001                 move.w     #$0001,(a7)
[0005b3bc] 6016                      bra.s      $0005B3D4
[0005b3be] 43ef 0002                 lea.l      2(a7),a1
[0005b3c2] 7028                      moveq.l    #40,d0
[0005b3c4] 206f 0018                 movea.l    24(a7),a0
[0005b3c8] 246f 0018                 movea.l    24(a7),a2
[0005b3cc] 246a 0004                 movea.l    4(a2),a2
[0005b3d0] 4e92                      jsr        (a2)
[0005b3d2] 3e80                      move.w     d0,(a7)
[0005b3d4] 3017                      move.w     (a7),d0
[0005b3d6] 4fef 001c                 lea.l      28(a7),a7
[0005b3da] 245f                      movea.l    (a7)+,a2
[0005b3dc] 361f                      move.w     (a7)+,d3
[0005b3de] 4e75                      rts
Awi_name:
[0005b3e0] 4fef fff4                 lea.l      -12(a7),a7
[0005b3e4] 2f48 0008                 move.l     a0,8(a7)
[0005b3e8] 3f40 0006                 move.w     d0,6(a7)
[0005b3ec] 206f 0008                 movea.l    8(a7),a0
[0005b3f0] 4eb9 0004 69f6            jsr        Ast_isEmpty
[0005b3f6] 4a40                      tst.w      d0
[0005b3f8] 6706                      beq.s      $0005B400
[0005b3fa] 6100 a85e                 bsr        Awi_ontop
[0005b3fe] 605c                      bra.s      $0005B45C
[0005b400] 426f 0004                 clr.w      4(a7)
[0005b404] 6048                      bra.s      $0005B44E
[0005b406] 302f 0004                 move.w     4(a7),d0
[0005b40a] e548                      lsl.w      #2,d0
[0005b40c] 41f9 0011 3f26            lea.l      _ACSv_winds,a0
[0005b412] 2eb0 0000                 move.l     0(a0,d0.w),(a7)
[0005b416] 2017                      move.l     (a7),d0
[0005b418] 6730                      beq.s      $0005B44A
[0005b41a] 302f 0006                 move.w     6(a7),d0
[0005b41e] 6712                      beq.s      $0005B432
[0005b420] 226f 0008                 movea.l    8(a7),a1
[0005b424] 2057                      movea.l    (a7),a0
[0005b426] 2068 004a                 movea.l    74(a0),a0
[0005b42a] 4eb9 0004 665a            jsr        Ast_cmp
[0005b430] 6010                      bra.s      $0005B442
[0005b432] 226f 0008                 movea.l    8(a7),a1
[0005b436] 2057                      movea.l    (a7),a0
[0005b438] 2068 004a                 movea.l    74(a0),a0
[0005b43c] 4eb9 0004 66ea            jsr        Ast_icmp
[0005b442] 4a40                      tst.w      d0
[0005b444] 6604                      bne.s      $0005B44A
[0005b446] 2057                      movea.l    (a7),a0
[0005b448] 6012                      bra.s      $0005B45C
[0005b44a] 526f 0004                 addq.w     #1,4(a7)
[0005b44e] 0c6f 0100 0004            cmpi.w     #$0100,4(a7)
[0005b454] 6db0                      blt.s      $0005B406
[0005b456] 2079 000e 0d26            movea.l    Aroot_wi,a0
[0005b45c] 4fef 000c                 lea.l      12(a7),a7
[0005b460] 4e75                      rts
_gs_cmp:
[0005b462] 514f                      subq.w     #8,a7
[0005b464] 2f48 0004                 move.l     a0,4(a7)
[0005b468] 2e89                      move.l     a1,(a7)
[0005b46a] 2057                      movea.l    (a7),a0
[0005b46c] 2250                      movea.l    (a0),a1
[0005b46e] 206f 0004                 movea.l    4(a7),a0
[0005b472] 2050                      movea.l    (a0),a0
[0005b474] 4eb9 0004 66ea            jsr        Ast_icmp
[0005b47a] 504f                      addq.w     #8,a7
[0005b47c] 4e75                      rts
_gs_search:
[0005b47e] 514f                      subq.w     #8,a7
[0005b480] 2f48 0004                 move.l     a0,4(a7)
[0005b484] 2e89                      move.l     a1,(a7)
[0005b486] 2057                      movea.l    (a7),a0
[0005b488] 2250                      movea.l    (a0),a1
[0005b48a] 206f 0004                 movea.l    4(a7),a0
[0005b48e] 4eb9 0004 66ea            jsr        Ast_icmp
[0005b494] 504f                      addq.w     #8,a7
[0005b496] 4e75                      rts
gs_str2key:
[0005b498] 4fef ffd0                 lea.l      -48(a7),a7
[0005b49c] 2f48 002c                 move.l     a0,44(a7)
[0005b4a0] 426f 002a                 clr.w      42(a7)
[0005b4a4] 41f9 000e 0ee8            lea.l      $000E0EE8,a0
[0005b4aa] 43ef 001a                 lea.l      26(a7),a1
[0005b4ae] 12d8                      move.b     (a0)+,(a1)+
[0005b4b0] 12d8                      move.b     (a0)+,(a1)+
[0005b4b2] 12d8                      move.b     (a0)+,(a1)+
[0005b4b4] 41f9 000e 0eeb            lea.l      $000E0EEB,a0
[0005b4ba] 43ef 0008                 lea.l      8(a7),a1
[0005b4be] 7011                      moveq.l    #17,d0
[0005b4c0] 12d8                      move.b     (a0)+,(a1)+
[0005b4c2] 51c8 fffc                 dbf        d0,$0005B4C0
[0005b4c6] 41f9 000e 0efe            lea.l      $000E0EFE,a0
[0005b4cc] 43ef 0002                 lea.l      2(a7),a1
[0005b4d0] 12d8                      move.b     (a0)+,(a1)+
[0005b4d2] 12d8                      move.b     (a0)+,(a1)+
[0005b4d4] 12d8                      move.b     (a0)+,(a1)+
[0005b4d6] 12d8                      move.b     (a0)+,(a1)+
[0005b4d8] 12d8                      move.b     (a0)+,(a1)+
[0005b4da] 12d8                      move.b     (a0)+,(a1)+
[0005b4dc] 3ebc 0003                 move.w     #$0003,(a7)
[0005b4e0] 2f6f 002c 001e            move.l     44(a7),30(a7)
[0005b4e6] 426f 0026                 clr.w      38(a7)
[0005b4ea] 6000 00a0                 bra        $0005B58C
[0005b4ee] 426f 0028                 clr.w      40(a7)
[0005b4f2] 6074                      bra.s      $0005B568
[0005b4f4] 322f 0028                 move.w     40(a7),d1
[0005b4f8] 3001                      move.w     d1,d0
[0005b4fa] d040                      add.w      d0,d0
[0005b4fc] d041                      add.w      d1,d0
[0005b4fe] d040                      add.w      d0,d0
[0005b500] 41f7 0008                 lea.l      8(a7,d0.w),a0
[0005b504] 4eb9 0008 2f6c            jsr        strlen
[0005b50a] 2f40 0022                 move.l     d0,34(a7)
[0005b50e] 202f 0022                 move.l     34(a7),d0
[0005b512] 342f 0028                 move.w     40(a7),d2
[0005b516] 3202                      move.w     d2,d1
[0005b518] d241                      add.w      d1,d1
[0005b51a] d242                      add.w      d2,d1
[0005b51c] d241                      add.w      d1,d1
[0005b51e] 43f7 1008                 lea.l      8(a7,d1.w),a1
[0005b522] 206f 001e                 movea.l    30(a7),a0
[0005b526] 4eb9 0008 3266            jsr        strnicmp
[0005b52c] 4a40                      tst.w      d0
[0005b52e] 6634                      bne.s      $0005B564
[0005b530] 222f 0022                 move.l     34(a7),d1
[0005b534] 206f 001e                 movea.l    30(a7),a0
[0005b538] 1030 1800                 move.b     0(a0,d1.l),d0
[0005b53c] 4880                      ext.w      d0
[0005b53e] 41ef 001a                 lea.l      26(a7),a0
[0005b542] 4eb9 0008 2e8a            jsr        strchr
[0005b548] 2008                      move.l     a0,d0
[0005b54a] 6718                      beq.s      $0005B564
[0005b54c] 302f 0028                 move.w     40(a7),d0
[0005b550] d040                      add.w      d0,d0
[0005b552] 3f77 0002 002a            move.w     2(a7,d0.w),42(a7)
[0005b558] 7001                      moveq.l    #1,d0
[0005b55a] d0af 0022                 add.l      34(a7),d0
[0005b55e] d1af 001e                 add.l      d0,30(a7)
[0005b562] 600e                      bra.s      $0005B572
[0005b564] 526f 0028                 addq.w     #1,40(a7)
[0005b568] 302f 0028                 move.w     40(a7),d0
[0005b56c] b057                      cmp.w      (a7),d0
[0005b56e] 6d00 ff84                 blt.w      $0005B4F4
[0005b572] 302f 0028                 move.w     40(a7),d0
[0005b576] b057                      cmp.w      (a7),d0
[0005b578] 6d12                      blt.s      $0005B58C
[0005b57a] 206f 001e                 movea.l    30(a7),a0
[0005b57e] 1010                      move.b     (a0),d0
[0005b580] 4880                      ext.w      d0
[0005b582] 816f 002a                 or.w       d0,42(a7)
[0005b586] 3f7c 0001 0026            move.w     #$0001,38(a7)
[0005b58c] 302f 0026                 move.w     38(a7),d0
[0005b590] 660a                      bne.s      $0005B59C
[0005b592] 206f 001e                 movea.l    30(a7),a0
[0005b596] 1010                      move.b     (a0),d0
[0005b598] 6600 ff54                 bne        $0005B4EE
[0005b59c] 302f 002a                 move.w     42(a7),d0
[0005b5a0] c07c 0f00                 and.w      #$0F00,d0
[0005b5a4] 6706                      beq.s      $0005B5AC
[0005b5a6] 006f 8000 002a            ori.w      #$8000,42(a7)
[0005b5ac] 302f 002a                 move.w     42(a7),d0
[0005b5b0] 4fef 0030                 lea.l      48(a7),a7
[0005b5b4] 4e75                      rts
Awi_gemscript:
[0005b5b6] 2f0a                      move.l     a2,-(a7)
[0005b5b8] 4fef fff2                 lea.l      -14(a7),a7
[0005b5bc] 2f48 000a                 move.l     a0,10(a7)
[0005b5c0] 3f40 0008                 move.w     d0,8(a7)
[0005b5c4] 2f49 0004                 move.l     a1,4(a7)
[0005b5c8] 206f 0016                 movea.l    22(a7),a0
[0005b5cc] 317c 0001 0006            move.w     #$0001,6(a0)
[0005b5d2] 3039 000e 0f2e            move.w     _gs_sorted,d0
[0005b5d8] 6622                      bne.s      $0005B5FC
[0005b5da] 43fa fe86                 lea.l      _gs_cmp(pc),a1
[0005b5de] 7208                      moveq.l    #8,d1
[0005b5e0] 3039 000e 0f2c            move.w     _gs_cmd_anzahl,d0
[0005b5e6] 48c0                      ext.l      d0
[0005b5e8] 41f9 000e 0f04            lea.l      _gs_commands,a0
[0005b5ee] 4eb9 0008 1240            jsr        qsort
[0005b5f4] 33fc 0001 000e 0f2e       move.w     #$0001,_gs_sorted
[0005b5fc] 487a fe80                 pea.l      _gs_search(pc)
[0005b600] 7208                      moveq.l    #8,d1
[0005b602] 3039 000e 0f2c            move.w     _gs_cmd_anzahl,d0
[0005b608] 48c0                      ext.l      d0
[0005b60a] 43f9 000e 0f04            lea.l      _gs_commands,a1
[0005b610] 206f 0008                 movea.l    8(a7),a0
[0005b614] 2050                      movea.l    (a0),a0
[0005b616] 4eb9 0008 10a4            jsr        bsearch
[0005b61c] 584f                      addq.w     #4,a7
[0005b61e] 2e88                      move.l     a0,(a7)
[0005b620] 2017                      move.l     (a7),d0
[0005b622] 6736                      beq.s      $0005B65A
[0005b624] 2057                      movea.l    (a7),a0
[0005b626] 2028 0004                 move.l     4(a0),d0
[0005b62a] 6726                      beq.s      $0005B652
[0005b62c] 2f2f 0016                 move.l     22(a7),-(a7)
[0005b630] 226f 0008                 movea.l    8(a7),a1
[0005b634] 302f 000c                 move.w     12(a7),d0
[0005b638] 206f 000e                 movea.l    14(a7),a0
[0005b63c] 246f 0004                 movea.l    4(a7),a2
[0005b640] 246a 0004                 movea.l    4(a2),a2
[0005b644] 4e92                      jsr        (a2)
[0005b646] 584f                      addq.w     #4,a7
[0005b648] 206f 0016                 movea.l    22(a7),a0
[0005b64c] 3140 0006                 move.w     d0,6(a0)
[0005b650] 6008                      bra.s      $0005B65A
[0005b652] 206f 0016                 movea.l    22(a7),a0
[0005b656] 4268 0006                 clr.w      6(a0)
[0005b65a] 206f 0016                 movea.l    22(a7),a0
[0005b65e] 3028 0006                 move.w     6(a0),d0
[0005b662] 4fef 000e                 lea.l      14(a7),a7
[0005b666] 245f                      movea.l    (a7)+,a2
[0005b668] 4e75                      rts
gs_CheckCommand:
[0005b66a] 4fef fff6                 lea.l      -10(a7),a7
[0005b66e] 3f40 0008                 move.w     d0,8(a7)
[0005b672] 2f49 0004                 move.l     a1,4(a7)
[0005b676] 0c6f 0002 0008            cmpi.w     #$0002,8(a7)
[0005b67c] 6c04                      bge.s      $0005B682
[0005b67e] 7002                      moveq.l    #2,d0
[0005b680] 606e                      bra.s      $0005B6F0
[0005b682] 487a fdfa                 pea.l      _gs_search(pc)
[0005b686] 7208                      moveq.l    #8,d1
[0005b688] 3039 000e 0f2c            move.w     _gs_cmd_anzahl,d0
[0005b68e] 48c0                      ext.l      d0
[0005b690] 43f9 000e 0f04            lea.l      _gs_commands,a1
[0005b696] 206f 0008                 movea.l    8(a7),a0
[0005b69a] 2068 0004                 movea.l    4(a0),a0
[0005b69e] 4eb9 0008 10a4            jsr        bsearch
[0005b6a4] 584f                      addq.w     #4,a7
[0005b6a6] 2e88                      move.l     a0,(a7)
[0005b6a8] 206f 000e                 movea.l    14(a7),a0
[0005b6ac] 2050                      movea.l    (a0),a0
[0005b6ae] 2050                      movea.l    (a0),a0
[0005b6b0] 4eb9 0004 649c            jsr        Ast_delete
[0005b6b6] 2017                      move.l     (a7),d0
[0005b6b8] 6608                      bne.s      $0005B6C2
[0005b6ba] 41f9 000e 0fcf            lea.l      $000E0FCF,a0
[0005b6c0] 6006                      bra.s      $0005B6C8
[0005b6c2] 41f9 000e 0fd1            lea.l      $000E0FD1,a0
[0005b6c8] 4eb9 0004 643c            jsr        Ast_create
[0005b6ce] 226f 000e                 movea.l    14(a7),a1
[0005b6d2] 2251                      movea.l    (a1),a1
[0005b6d4] 2288                      move.l     a0,(a1)
[0005b6d6] 206f 000e                 movea.l    14(a7),a0
[0005b6da] 317c 0001 0004            move.w     #$0001,4(a0)
[0005b6e0] 206f 000e                 movea.l    14(a7),a0
[0005b6e4] 4268 0006                 clr.w      6(a0)
[0005b6e8] 206f 000e                 movea.l    14(a7),a0
[0005b6ec] 3028 0006                 move.w     6(a0),d0
[0005b6f0] 4fef 000a                 lea.l      10(a7),a7
[0005b6f4] 4e75                      rts
gs_GetFront:
[0005b6f6] 594f                      subq.w     #4,a7
[0005b6f8] 2e88                      move.l     a0,(a7)
[0005b6fa] 206f 0008                 movea.l    8(a7),a0
[0005b6fe] 2050                      movea.l    (a0),a0
[0005b700] 2050                      movea.l    (a0),a0
[0005b702] 4eb9 0004 649c            jsr        Ast_delete
[0005b708] 2057                      movea.l    (a7),a0
[0005b70a] 2068 004a                 movea.l    74(a0),a0
[0005b70e] 4eb9 0004 643c            jsr        Ast_create
[0005b714] 226f 0008                 movea.l    8(a7),a1
[0005b718] 2251                      movea.l    (a1),a1
[0005b71a] 2288                      move.l     a0,(a1)
[0005b71c] 206f 0008                 movea.l    8(a7),a0
[0005b720] 317c 0001 0004            move.w     #$0001,4(a0)
[0005b726] 4240                      clr.w      d0
[0005b728] 584f                      addq.w     #4,a7
[0005b72a] 4e75                      rts
gs_ToFront:
[0005b72c] 594f                      subq.w     #4,a7
[0005b72e] 2e88                      move.l     a0,(a7)
[0005b730] 2057                      movea.l    (a7),a0
[0005b732] 6100 b4b6                 bsr        Awi_show
[0005b736] 206f 0008                 movea.l    8(a7),a0
[0005b73a] 2050                      movea.l    (a0),a0
[0005b73c] 2050                      movea.l    (a0),a0
[0005b73e] 4eb9 0004 649c            jsr        Ast_delete
[0005b744] 41f9 000e 0fd3            lea.l      $000E0FD3,a0
[0005b74a] 4eb9 0004 643c            jsr        Ast_create
[0005b750] 226f 0008                 movea.l    8(a7),a1
[0005b754] 2251                      movea.l    (a1),a1
[0005b756] 2288                      move.l     a0,(a1)
[0005b758] 206f 0008                 movea.l    8(a7),a0
[0005b75c] 317c 0001 0004            move.w     #$0001,4(a0)
[0005b762] 4240                      clr.w      d0
[0005b764] 584f                      addq.w     #4,a7
[0005b766] 4e75                      rts
gs_KeyPress:
[0005b768] 4fef fff0                 lea.l      -16(a7),a7
[0005b76c] 2f48 000c                 move.l     a0,12(a7)
[0005b770] 3f40 000a                 move.w     d0,10(a7)
[0005b774] 2f49 0006                 move.l     a1,6(a7)
[0005b778] 0c6f 0002 000a            cmpi.w     #$0002,10(a7)
[0005b77e] 6c06                      bge.s      $0005B786
[0005b780] 7002                      moveq.l    #2,d0
[0005b782] 6000 0104                 bra        $0005B888
[0005b786] 70ff                      moveq.l    #-1,d0
[0005b788] d06f 000a                 add.w      10(a7),d0
[0005b78c] 48c0                      ext.l      d0
[0005b78e] e588                      lsl.l      #2,d0
[0005b790] 4eb9 0004 c608            jsr        Ax_malloc
[0005b796] 2e88                      move.l     a0,(a7)
[0005b798] 2017                      move.l     (a7),d0
[0005b79a] 6606                      bne.s      $0005B7A2
[0005b79c] 7002                      moveq.l    #2,d0
[0005b79e] 6000 00e8                 bra        $0005B888
[0005b7a2] 72ff                      moveq.l    #-1,d1
[0005b7a4] d26f 000a                 add.w      10(a7),d1
[0005b7a8] 48c1                      ext.l      d1
[0005b7aa] e589                      lsl.l      #2,d1
[0005b7ac] 4240                      clr.w      d0
[0005b7ae] 2057                      movea.l    (a7),a0
[0005b7b0] 4eb9 0008 36ea            jsr        memset
[0005b7b6] 426f 0004                 clr.w      4(a7)
[0005b7ba] 6042                      bra.s      $0005B7FE
[0005b7bc] 41f9 000e 0fd5            lea.l      $000E0FD5,a0
[0005b7c2] 4eb9 0004 643c            jsr        Ast_create
[0005b7c8] 302f 0004                 move.w     4(a7),d0
[0005b7cc] 48c0                      ext.l      d0
[0005b7ce] e588                      lsl.l      #2,d0
[0005b7d0] 2257                      movea.l    (a7),a1
[0005b7d2] 2388 0800                 move.l     a0,0(a1,d0.l)
[0005b7d6] 302f 0004                 move.w     4(a7),d0
[0005b7da] 48c0                      ext.l      d0
[0005b7dc] e588                      lsl.l      #2,d0
[0005b7de] 2057                      movea.l    (a7),a0
[0005b7e0] 2030 0800                 move.l     0(a0,d0.l),d0
[0005b7e4] 6614                      bne.s      $0005B7FA
[0005b7e6] 70ff                      moveq.l    #-1,d0
[0005b7e8] d06f 000a                 add.w      10(a7),d0
[0005b7ec] 2057                      movea.l    (a7),a0
[0005b7ee] 4eb9 0004 7410            jsr        Ast_deleteAry
[0005b7f4] 7002                      moveq.l    #2,d0
[0005b7f6] 6000 0090                 bra        $0005B888
[0005b7fa] 526f 0004                 addq.w     #1,4(a7)
[0005b7fe] 70ff                      moveq.l    #-1,d0
[0005b800] d06f 000a                 add.w      10(a7),d0
[0005b804] 322f 0004                 move.w     4(a7),d1
[0005b808] b240                      cmp.w      d0,d1
[0005b80a] 6db0                      blt.s      $0005B7BC
[0005b80c] 206f 0014                 movea.l    20(a7),a0
[0005b810] 3028 0004                 move.w     4(a0),d0
[0005b814] 206f 0014                 movea.l    20(a7),a0
[0005b818] 2050                      movea.l    (a0),a0
[0005b81a] 4eb9 0004 7410            jsr        Ast_deleteAry
[0005b820] 70ff                      moveq.l    #-1,d0
[0005b822] d06f 000a                 add.w      10(a7),d0
[0005b826] 206f 0014                 movea.l    20(a7),a0
[0005b82a] 3140 0004                 move.w     d0,4(a0)
[0005b82e] 206f 0014                 movea.l    20(a7),a0
[0005b832] 2097                      move.l     (a7),(a0)
[0005b834] 3f7c 0001 0004            move.w     #$0001,4(a7)
[0005b83a] 6040                      bra.s      $0005B87C
[0005b83c] 302f 0004                 move.w     4(a7),d0
[0005b840] 48c0                      ext.l      d0
[0005b842] e588                      lsl.l      #2,d0
[0005b844] 206f 0006                 movea.l    6(a7),a0
[0005b848] 2070 0800                 movea.l    0(a0,d0.l),a0
[0005b84c] 6100 fc4a                 bsr        gs_str2key
[0005b850] 2079 0010 ee4e            movea.l    ACSblk,a0
[0005b856] 3140 02ce                 move.w     d0,718(a0)
[0005b85a] 206f 000c                 movea.l    12(a7),a0
[0005b85e] 4eb9 0004 a498            jsr        evkeybrd
[0005b864] 5240                      addq.w     #1,d0
[0005b866] 6604                      bne.s      $0005B86C
[0005b868] 7030                      moveq.l    #48,d0
[0005b86a] 6002                      bra.s      $0005B86E
[0005b86c] 7031                      moveq.l    #49,d0
[0005b86e] 206f 0014                 movea.l    20(a7),a0
[0005b872] 2050                      movea.l    (a0),a0
[0005b874] 2050                      movea.l    (a0),a0
[0005b876] 1080                      move.b     d0,(a0)
[0005b878] 526f 0004                 addq.w     #1,4(a7)
[0005b87c] 302f 0004                 move.w     4(a7),d0
[0005b880] b06f 000a                 cmp.w      10(a7),d0
[0005b884] 6db6                      blt.s      $0005B83C
[0005b886] 4240                      clr.w      d0
[0005b888] 4fef 0010                 lea.l      16(a7),a7
[0005b88c] 4e75                      rts
gs_GetAllCommands:
[0005b88e] 4fef ffee                 lea.l      -18(a7),a7
[0005b892] 206f 0016                 movea.l    22(a7),a0
[0005b896] 0c68 0001 0004            cmpi.w     #$0001,4(a0)
[0005b89c] 663e                      bne.s      $0005B8DC
[0005b89e] 206f 0016                 movea.l    22(a7),a0
[0005b8a2] 2050                      movea.l    (a0),a0
[0005b8a4] 2050                      movea.l    (a0),a0
[0005b8a6] 4eb9 0008 2f6c            jsr        strlen
[0005b8ac] 7201                      moveq.l    #1,d1
[0005b8ae] b280                      cmp.l      d0,d1
[0005b8b0] 662a                      bne.s      $0005B8DC
[0005b8b2] 206f 0016                 movea.l    22(a7),a0
[0005b8b6] 2050                      movea.l    (a0),a0
[0005b8b8] 2050                      movea.l    (a0),a0
[0005b8ba] 1010                      move.b     (a0),d0
[0005b8bc] 4880                      ext.w      d0
[0005b8be] 41f9 000e 0fd7            lea.l      $000E0FD7,a0
[0005b8c4] 4eb9 0008 2e8a            jsr        strchr
[0005b8ca] 2008                      move.l     a0,d0
[0005b8cc] 670e                      beq.s      $0005B8DC
[0005b8ce] 3f79 000e 0f2c 0002       move.w     _gs_cmd_anzahl,2(a7)
[0005b8d6] 3ebc 0001                 move.w     #$0001,(a7)
[0005b8da] 6014                      bra.s      $0005B8F0
[0005b8dc] 3039 000e 0f2c            move.w     _gs_cmd_anzahl,d0
[0005b8e2] 206f 0016                 movea.l    22(a7),a0
[0005b8e6] d068 0004                 add.w      4(a0),d0
[0005b8ea] 3f40 0002                 move.w     d0,2(a7)
[0005b8ee] 4257                      clr.w      (a7)
[0005b8f0] 302f 0002                 move.w     2(a7),d0
[0005b8f4] 48c0                      ext.l      d0
[0005b8f6] e588                      lsl.l      #2,d0
[0005b8f8] 4eb9 0004 c608            jsr        Ax_malloc
[0005b8fe] 2f48 0008                 move.l     a0,8(a7)
[0005b902] 202f 0008                 move.l     8(a7),d0
[0005b906] 6606                      bne.s      $0005B90E
[0005b908] 7002                      moveq.l    #2,d0
[0005b90a] 6000 01fa                 bra        $0005BB06
[0005b90e] 426f 0010                 clr.w      16(a7)
[0005b912] 6052                      bra.s      $0005B966
[0005b914] 302f 0010                 move.w     16(a7),d0
[0005b918] e748                      lsl.w      #3,d0
[0005b91a] 41f9 000e 0f04            lea.l      _gs_commands,a0
[0005b920] 2070 0000                 movea.l    0(a0,d0.w),a0
[0005b924] 4eb9 0004 643c            jsr        Ast_create
[0005b92a] 302f 0010                 move.w     16(a7),d0
[0005b92e] 48c0                      ext.l      d0
[0005b930] e588                      lsl.l      #2,d0
[0005b932] 226f 0008                 movea.l    8(a7),a1
[0005b936] 2388 0800                 move.l     a0,0(a1,d0.l)
[0005b93a] 302f 0010                 move.w     16(a7),d0
[0005b93e] 48c0                      ext.l      d0
[0005b940] e588                      lsl.l      #2,d0
[0005b942] 206f 0008                 movea.l    8(a7),a0
[0005b946] 2030 0800                 move.l     0(a0,d0.l),d0
[0005b94a] 6616                      bne.s      $0005B962
[0005b94c] 3039 000e 0f2c            move.w     _gs_cmd_anzahl,d0
[0005b952] 206f 0008                 movea.l    8(a7),a0
[0005b956] 4eb9 0004 7410            jsr        Ast_deleteAry
[0005b95c] 7002                      moveq.l    #2,d0
[0005b95e] 6000 01a6                 bra        $0005BB06
[0005b962] 526f 0010                 addq.w     #1,16(a7)
[0005b966] 302f 0010                 move.w     16(a7),d0
[0005b96a] b079 000e 0f2c            cmp.w      _gs_cmd_anzahl,d0
[0005b970] 6da2                      blt.s      $0005B914
[0005b972] 3017                      move.w     (a7),d0
[0005b974] 6628                      bne.s      $0005B99E
[0005b976] 206f 0016                 movea.l    22(a7),a0
[0005b97a] 3028 0004                 move.w     4(a0),d0
[0005b97e] 48c0                      ext.l      d0
[0005b980] e588                      lsl.l      #2,d0
[0005b982] 206f 0016                 movea.l    22(a7),a0
[0005b986] 2250                      movea.l    (a0),a1
[0005b988] 3239 000e 0f2c            move.w     _gs_cmd_anzahl,d1
[0005b98e] 48c1                      ext.l      d1
[0005b990] e589                      lsl.l      #2,d1
[0005b992] 206f 0008                 movea.l    8(a7),a0
[0005b996] d1c1                      adda.l     d1,a0
[0005b998] 4eb9 0008 3500            jsr        memcpy
[0005b99e] 43f9 0006 128a            lea.l      _gs_strcmp,a1
[0005b9a4] 7204                      moveq.l    #4,d1
[0005b9a6] 302f 0002                 move.w     2(a7),d0
[0005b9aa] 48c0                      ext.l      d0
[0005b9ac] 206f 0008                 movea.l    8(a7),a0
[0005b9b0] 4eb9 0008 1240            jsr        qsort
[0005b9b6] 426f 000c                 clr.w      12(a7)
[0005b9ba] 3f7c 0001 0010            move.w     #$0001,16(a7)
[0005b9c0] 6032                      bra.s      $0005B9F4
[0005b9c2] 302f 0010                 move.w     16(a7),d0
[0005b9c6] 48c0                      ext.l      d0
[0005b9c8] e588                      lsl.l      #2,d0
[0005b9ca] 206f 0008                 movea.l    8(a7),a0
[0005b9ce] 2270 0800                 movea.l    0(a0,d0.l),a1
[0005b9d2] 302f 0010                 move.w     16(a7),d0
[0005b9d6] 48c0                      ext.l      d0
[0005b9d8] e588                      lsl.l      #2,d0
[0005b9da] 206f 0008                 movea.l    8(a7),a0
[0005b9de] 2070 08fc                 movea.l    -4(a0,d0.l),a0
[0005b9e2] 4eb9 0004 66ea            jsr        Ast_icmp
[0005b9e8] 4a40                      tst.w      d0
[0005b9ea] 6604                      bne.s      $0005B9F0
[0005b9ec] 526f 000c                 addq.w     #1,12(a7)
[0005b9f0] 526f 0010                 addq.w     #1,16(a7)
[0005b9f4] 302f 0010                 move.w     16(a7),d0
[0005b9f8] b06f 0002                 cmp.w      2(a7),d0
[0005b9fc] 6dc4                      blt.s      $0005B9C2
[0005b9fe] 302f 0002                 move.w     2(a7),d0
[0005ba02] 906f 000c                 sub.w      12(a7),d0
[0005ba06] 48c0                      ext.l      d0
[0005ba08] e588                      lsl.l      #2,d0
[0005ba0a] 4eb9 0004 c608            jsr        Ax_malloc
[0005ba10] 2f48 0004                 move.l     a0,4(a7)
[0005ba14] 202f 0004                 move.l     4(a7),d0
[0005ba18] 6700 00ac                 beq        $0005BAC6
[0005ba1c] 206f 0008                 movea.l    8(a7),a0
[0005ba20] 226f 0004                 movea.l    4(a7),a1
[0005ba24] 2290                      move.l     (a0),(a1)
[0005ba26] 3f7c 0001 0010            move.w     #$0001,16(a7)
[0005ba2c] 3f7c 0001 000e            move.w     #$0001,14(a7)
[0005ba32] 6060                      bra.s      $0005BA94
[0005ba34] 302f 000e                 move.w     14(a7),d0
[0005ba38] 48c0                      ext.l      d0
[0005ba3a] e588                      lsl.l      #2,d0
[0005ba3c] 206f 0004                 movea.l    4(a7),a0
[0005ba40] 2270 08fc                 movea.l    -4(a0,d0.l),a1
[0005ba44] 302f 0010                 move.w     16(a7),d0
[0005ba48] 48c0                      ext.l      d0
[0005ba4a] e588                      lsl.l      #2,d0
[0005ba4c] 206f 0008                 movea.l    8(a7),a0
[0005ba50] 2070 0800                 movea.l    0(a0,d0.l),a0
[0005ba54] 4eb9 0004 66ea            jsr        Ast_icmp
[0005ba5a] 4a40                      tst.w      d0
[0005ba5c] 6732                      beq.s      $0005BA90
[0005ba5e] 302f 0010                 move.w     16(a7),d0
[0005ba62] 48c0                      ext.l      d0
[0005ba64] e588                      lsl.l      #2,d0
[0005ba66] 206f 0008                 movea.l    8(a7),a0
[0005ba6a] 322f 000e                 move.w     14(a7),d1
[0005ba6e] 48c1                      ext.l      d1
[0005ba70] e589                      lsl.l      #2,d1
[0005ba72] 226f 0004                 movea.l    4(a7),a1
[0005ba76] 23b0 0800 1800            move.l     0(a0,d0.l),0(a1,d1.l)
[0005ba7c] 526f 000e                 addq.w     #1,14(a7)
[0005ba80] 302f 0010                 move.w     16(a7),d0
[0005ba84] 48c0                      ext.l      d0
[0005ba86] e588                      lsl.l      #2,d0
[0005ba88] 206f 0008                 movea.l    8(a7),a0
[0005ba8c] 42b0 0800                 clr.l      0(a0,d0.l)
[0005ba90] 526f 0010                 addq.w     #1,16(a7)
[0005ba94] 302f 0010                 move.w     16(a7),d0
[0005ba98] b06f 0002                 cmp.w      2(a7),d0
[0005ba9c] 6c10                      bge.s      $0005BAAE
[0005ba9e] 302f 0002                 move.w     2(a7),d0
[0005baa2] 906f 000c                 sub.w      12(a7),d0
[0005baa6] 322f 000e                 move.w     14(a7),d1
[0005baaa] b240                      cmp.w      d0,d1
[0005baac] 6d86                      blt.s      $0005BA34
[0005baae] 302f 0002                 move.w     2(a7),d0
[0005bab2] 206f 0008                 movea.l    8(a7),a0
[0005bab6] 4eb9 0004 7410            jsr        Ast_deleteAry
[0005babc] 302f 000c                 move.w     12(a7),d0
[0005bac0] 916f 0002                 sub.w      d0,2(a7)
[0005bac4] 6006                      bra.s      $0005BACC
[0005bac6] 2f6f 0008 0004            move.l     8(a7),4(a7)
[0005bacc] 3017                      move.w     (a7),d0
[0005bace] 6716                      beq.s      $0005BAE6
[0005bad0] 206f 0016                 movea.l    22(a7),a0
[0005bad4] 3028 0004                 move.w     4(a0),d0
[0005bad8] 206f 0016                 movea.l    22(a7),a0
[0005badc] 2050                      movea.l    (a0),a0
[0005bade] 4eb9 0004 7410            jsr        Ast_deleteAry
[0005bae4] 600c                      bra.s      $0005BAF2
[0005bae6] 206f 0016                 movea.l    22(a7),a0
[0005baea] 2050                      movea.l    (a0),a0
[0005baec] 4eb9 0004 c7c8            jsr        Ax_free
[0005baf2] 206f 0016                 movea.l    22(a7),a0
[0005baf6] 20af 0004                 move.l     4(a7),(a0)
[0005bafa] 206f 0016                 movea.l    22(a7),a0
[0005bafe] 316f 0002 0004            move.w     2(a7),4(a0)
[0005bb04] 4240                      clr.w      d0
[0005bb06] 4fef 0012                 lea.l      18(a7),a7
[0005bb0a] 4e75                      rts

	.data

init:
[000e0cf8]                           dc.w $0000
cycle:
[000e0cfa]                           dc.w $0000
menu_width:
[000e0cfc]                           dc.w $ffff
winupd:
[000e0cfe]                           dc.w $0000
winoldupd:
[000e0d00]                           dc.w $0000
msupd:
[000e0d02]                           dc.w $0000
msoldupd:
[000e0d04]                           dc.w $0000
exec_path:
[000e0d06]                           dc.w $0000
[000e0d08]                           dc.w $0000
exec_com:
[000e0d0a]                           dc.w $0000
[000e0d0c]                           dc.w $0000
empty:
[000e0d0e]                           dc.w $ffff
[000e0d10]                           dc.w $ffff
[000e0d12]                           dc.w $ffff
[000e0d14]                           dc.w $0014
[000e0d16]                           dc.w $0020
[000e0d18]                           dc.w $0000
[000e0d1a]                           dc.w $0000
[000e0d1c]                           dc.w $0000
[000e0d1e]                           dc.w $0000
[000e0d20]                           dc.w $0000
[000e0d22]                           dc.w $00f0
[000e0d24]                           dc.w $00f0
Aroot_wi:
[000e0d26]                           dc.w $0000
[000e0d28]                           dc.w $0000
top_window:
[000e0d2a]                           dc.w $0000
[000e0d2c]                           dc.w $0000
topline:
[000e0d2e]                           dc.w $ffff
[000e0d30]                           dc.w $ffff
[000e0d32]                           dc.w $ffff
[000e0d34]                           dc.w $001a
[000e0d36]                           dc.w $0020
[000e0d38]                           dc.w $0000
[000e0d3a]                           dc.w $0000
[000e0d3c]                           dc.w $0000
[000e0d3e]                           dc.w $0000
[000e0d40]                           dc.w $0000
[000e0d42]                           dc.w $0000
[000e0d44]                           dc.w $0000
[000e0d46]                           dc.w $0000
[000e0d48]                           dc.w $0000
[000e0d4a]                           dc.w $0000
[000e0d4c]                           dc.w $0000
[000e0d4e]                           dc.w $0000
[000e0d50]                           dc.w $0000
[000e0d52]                           dc.w $0000
[000e0d54]                           dc.w $0000
[000e0d56]                           dc.w $0000
[000e0d58]                           dc.w $0000
[000e0d5a]                           dc.w $0000
[000e0d5c]                           dc.w $0000
[000e0d5e]                           dc.w $0000
[000e0d60]                           dc.w $0000
[000e0d62]                           dc.w $0000
[000e0d64]                           dc.w $0000
[000e0d66]                           dc.w $0000
[000e0d68]                           dc.w $0000
[000e0d6a]                           dc.w $0000
[000e0d6c]                           dc.w $0000
[000e0d6e]                           dc.w $0000
[000e0d70]                           dc.w $0000
[000e0d72]                           dc.w $0000
[000e0d74]                           dc.w $0000
[000e0d76]                           dc.w $0000
[000e0d78]                           dc.w $0000
[000e0d7a]                           dc.w $0000
[000e0d7c]                           dc.w $0000
[000e0d7e]                           dc.w $0000
[000e0d80]                           dc.w $0000
[000e0d82]                           dc.w $0000
[000e0d84]                           dc.w $0000
[000e0d86]                           dc.w $0000
[000e0d88]                           dc.w $0000
[000e0d8a]                           dc.w $0000
[000e0d8c]                           dc.w $0000
[000e0d8e]                           dc.w $0000
[000e0d90]                           dc.w $0000
[000e0d92]                           dc.w $0000
[000e0d94]                           dc.w $0000
[000e0d96]                           dc.w $0000
[000e0d98]                           dc.w $0000
[000e0d9a]                           dc.w $0000
[000e0d9c]                           dc.w $0000
[000e0d9e]                           dc.w $0000
[000e0da0]                           dc.w $0000
[000e0da2]                           dc.w $0000
[000e0da4]                           dc.w $0000
[000e0da6]                           dc.w $0000
[000e0da8]                           dc.w $0000
[000e0daa]                           dc.w $0000
[000e0dac]                           dc.w $0000
[000e0dae]                           dc.w $0000
[000e0db0]                           dc.w $0000
[000e0db2]                           dc.w $0000
[000e0db4]                           dc.w $0000
[000e0db6]                           dc.w $0000
[000e0db8]                           dc.w $0000
[000e0dba]                           dc.w $0000
[000e0dbc]                           dc.w $0000
[000e0dbe]                           dc.w $0000
[000e0dc0]                           dc.w $0000
[000e0dc2]                           dc.w $0000
[000e0dc4]                           dc.w $0000
[000e0dc6]                           dc.w $0000
[000e0dc8]                           dc.w $0000
[000e0dca]                           dc.w $0000
[000e0dcc]                           dc.w $0000
[000e0dce]                           dc.w $0000
[000e0dd0]                           dc.w $0000
[000e0dd2]                           dc.w $0000
[000e0dd4]                           dc.w $0000
[000e0dd6]                           dc.w $0000
[000e0dd8]                           dc.w $0000
[000e0dda]                           dc.w $0000
[000e0ddc]                           dc.w $0000
[000e0dde]                           dc.w $0000
[000e0de0]                           dc.w $0000
[000e0de2]                           dc.w $0000
[000e0de4]                           dc.w $0000
[000e0de6]                           dc.w $0000
[000e0de8]                           dc.w $0000
[000e0dea]                           dc.w $0000
[000e0dec]                           dc.w $0000
[000e0dee]                           dc.w $0000
[000e0df0]                           dc.w $0000
[000e0df2]                           dc.w $0000
[000e0df4]                           dc.w $0000
[000e0df6]                           dc.w $0000
[000e0df8]                           dc.w $0000
[000e0dfa]                           dc.w $0000
[000e0dfc]                           dc.w $0000
[000e0dfe]                           dc.w $0000
[000e0e00]                           dc.w $0000
[000e0e02]                           dc.w $0000
[000e0e04]                           dc.w $0000
[000e0e06]                           dc.w $0000
[000e0e08]                           dc.w $0000
[000e0e0a]                           dc.w $0000
[000e0e0c]                           dc.w $0000
[000e0e0e]                           dc.w $0000
[000e0e10]                           dc.w $0000
[000e0e12]                           dc.w $0000
[000e0e14]                           dc.w $0000
[000e0e16]                           dc.w $0000
[000e0e18]                           dc.w $0000
[000e0e1a]                           dc.w $0000
[000e0e1c]                           dc.w $0000
[000e0e1e]                           dc.w $0000
[000e0e20]                           dc.w $0000
[000e0e22]                           dc.w $0000
[000e0e24]                           dc.w $0000
[000e0e26]                           dc.w $0000
[000e0e28]                           dc.w $0000
[000e0e2a]                           dc.w $0000
[000e0e2c]                           dc.w $0000
[000e0e2e]                           dc.w $0000
[000e0e30]                           dc.w $0000
[000e0e32]                           dc.w $0000
[000e0e34]                           dc.w $0000
[000e0e36]                           dc.w $0000
[000e0e38]                           dc.w $0000
[000e0e3a]                           dc.w $0000
[000e0e3c]                           dc.w $0000
[000e0e3e]                           dc.w $0000
[000e0e40]                           dc.w $0000
[000e0e42]                           dc.w $0000
[000e0e44]                           dc.w $0000
[000e0e46]                           dc.w $0000
[000e0e48]                           dc.w $0000
[000e0e4a]                           dc.w $0000
[000e0e4c]                           dc.w $0000
[000e0e4e]                           dc.w $0000
[000e0e50]                           dc.w $0000
[000e0e52]                           dc.w $0000
[000e0e54]                           dc.w $0000
[000e0e56]                           dc.w $0000
[000e0e58]                           dc.w $0000
[000e0e5a]                           dc.w $0000
[000e0e5c]                           dc.w $0000
next:
[000e0e5e]                           dc.w $0000
dis_arrow_mon:
[000e0e60] 00065c72                  dc.l A_arrows
[000e0e64]                           dc.w $2209
[000e0e66]                           dc.w $0001
[000e0e68]                           dc.w $0000
[000e0e6a]                           dc.w $0000
[000e0e6c]                           dc.w $0000
[000e0e6e]                           dc.w $0000
[000e0e70]                           dc.w $0000
[000e0e72]                           dc.w $0000
[000e0e74]                           dc.w $0000
[000e0e76]                           dc.w $0000
[000e0e78]                           dc.w $0000
[000e0e7a]                           dc.w $0000
[000e0e7c]                           dc.w $0000
[000e0e7e]                           dc.w $0000
dis_arrow_col:
[000e0e80] 00065c72                  dc.l A_arrows
[000e0e84]                           dc.w $2201
[000e0e86]                           dc.w $0009
[000e0e88]                           dc.w $0000
[000e0e8a]                           dc.w $0000
[000e0e8c]                           dc.w $0000
[000e0e8e]                           dc.w $0000
[000e0e90]                           dc.w $0000
[000e0e92]                           dc.w $0000
[000e0e94]                           dc.w $0000
[000e0e96]                           dc.w $0000
[000e0e98]                           dc.w $0000
[000e0e9a]                           dc.w $0000
[000e0e9c]                           dc.w $0000
[000e0e9e]                           dc.w $0000
box_trans:
[000e0ea0]                           dc.w $ffff
[000e0ea2]                           dc.w $ffff
[000e0ea4]                           dc.w $0000
[000e0ea6]                           dc.w $0000
[000e0ea8]                           dc.w $0000
[000e0eaa]                           dc.w $0000
[000e0eac]                           dc.w $0000
[000e0eae]                           dc.w $0000
[000e0eb0]                           dc.w $0000
[000e0eb2]                           dc.w $0000
[000e0eb4]                           dc.w $0000
[000e0eb6]                           dc.w $0000
[000e0eb8]                           dc.w $0000
[000e0eba]                           dc.w $ffff
[000e0ebc]                           dc.w $0000
[000e0ebe]                           dc.w $0000
[000e0ec0]                           dc.w $0000
[000e0ec2]                           dc.w $0000
[000e0ec4]                           dc.w $0000
[000e0ec6]                           dc.w $0000
[000e0ec8]                           dc.w $0000
[000e0eca]                           dc.w $0000
[000e0ecc]                           dc.w $0000
[000e0ece]                           dc.w $0000
[000e0ed0]                           dc.w $0000
[000e0ed2]                           dc.w $0000
[000e0ed4]                           dc.w $0000
[000e0ed6]                           dc.w $0000
[000e0ed8]                           dc.w $0000
[000e0eda]                           dc.w $0000
[000e0edc]                           dc.w $0000
[000e0ede]                           dc.w $0000
[000e0ee0]                           dc.w $0000
[000e0ee2]                           dc.w $ffff
[000e0ee4]                           dc.w $0000
[000e0ee6]                           dc.w $0000
[000e0ee8]                           dc.w $2b2d
[000e0eea]                           dc.w $0053
[000e0eec]                           dc.b 'HIFT',0
[000e0ef1]                           dc.b 'CTRL',0
[000e0ef6]                           dc.w $0041
[000e0ef8]                           dc.w $4c54
[000e0efa]                           dc.w $0000
[000e0efc]                           dc.w $0000
[000e0efe]                           dc.w $0200
[000e0f00]                           dc.w $0400
[000e0f02]                           dc.w $0800

_gs_commands:
[000e0f04] 000e0f99                  dc.l $000e0f99
[000e0f08] 0005b6f6                  dc.l gs_GetFront
[000e0f0c] 000e0fa2                  dc.l $000e0fa2
[000e0f10] 0005b72c                  dc.l gs_ToFront
[000e0f14] 000e0faa                  dc.l $000e0faa
[000e0f18] 0005b66a                  dc.l gs_CheckCommand
[000e0f1c] 000e0fb7                  dc.l $000e0fb7
[000e0f20] 0005b768                  dc.l gs_KeyPress
[000e0f24] 000e0fc0                  dc.l $000e0fc0
[000e0f28] 0005b88e                  dc.l gs_GetAllCommands
_gs_cmd_anzahl:
[000e0f2c]                           dc.w $0005
_gs_sorted:
[000e0f2e]                           dc.w $0000
[000e0f30]                           dc.b 'GEMSUFFIX',0
[000e0f3a]                           dc.w $2c00
[000e0f3c]                           dc.w $2c00
[000e0f3e]                           dc.b 'PRG',0
[000e0f42]                           dc.b 'APP',0
[000e0f46]                           dc.b 'GTP',0
[000e0f4a]                           dc.w $1b48
[000e0f4c]                           dc.w $1b65
[000e0f4e]                           dc.w $001b
[000e0f50]                           dc.w $6600
[000e0f52]                           dc.b '[end]',0
[000e0f58]                           dc.b '[4][Das Erzeugen eines|Dialoges ist fehlgeschlagen!][Abbrechen]',0
[000e0f98]                           dc.w $0047
[000e0f9a]                           dc.b 'etFront',0
[000e0fa2]                           dc.b 'ToFront',0
[000e0faa]                           dc.b 'CheckCommand',0
[000e0fb7]                           dc.b 'KeyPress',0
[000e0fc0]                           dc.b 'GetAllCommands',0
[000e0fcf]                           dc.b $30
[000e0fd0]                           dc.w $0031
[000e0fd2]                           dc.w $0031
[000e0fd4]                           dc.w $0030
[000e0fd6]                           dc.w $0030
[000e0fd8]                           dc.w $3100
