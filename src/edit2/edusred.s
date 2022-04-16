editus_ok:
[00022ff6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00022ffc] 2068 0258                 movea.l    600(a0),a0
[00023000] 4eb9 0002 31b2            jsr        term
[00023006] 4e75                      rts

user_make:
[00023008] 48e7 0038                 movem.l    a2-a4,-(a7)
[0002300c] 594f                      subq.w     #4,a7
[0002300e] 2e88                      move.l     a0,(a7)
[00023010] 97cb                      suba.l     a3,a3
[00023012] 2868 0004                 movea.l    4(a0),a4
[00023016] 246c 0012                 movea.l    18(a4),a2
[0002301a] 200a                      move.l     a2,d0
[0002301c] 670c                      beq.s      user_make_1
[0002301e] 204a                      movea.l    a2,a0
[00023020] 4eb9 0005 6bea            jsr        Awi_show
[00023026] 6000 007c                 bra.w      user_make_2
user_make_1:
[0002302a] 7008                      moveq.l    #8,d0
[0002302c] 4eb9 0004 c608            jsr        Ax_malloc
[00023032] 2648                      movea.l    a0,a3
[00023034] 200b                      move.l     a3,d0
[00023036] 6768                      beq.s      user_make_3
[00023038] 2257                      movea.l    (a7),a1
[0002303a] 2091                      move.l     (a1),(a0)
[0002303c] 2769 0004 0004            move.l     4(a1),4(a3)
[00023042] 41ec 0016                 lea.l      22(a4),a0
[00023046] 23c8 000b 3264            move.l     a0,$000B3264
[0002304c] 2279 000b 3270            movea.l    $000B3270,a1
[00023052] 2348 0008                 move.l     a0,8(a1)
[00023056] 41f9 000b 3216            lea.l      WI_USER,a0
[0002305c] 4eb9 0005 7052            jsr        Awi_create
[00023062] 2448                      movea.l    a0,a2
[00023064] 200a                      move.l     a2,d0
[00023066] 6738                      beq.s      user_make_3
[00023068] 2257                      movea.l    (a7),a1
[0002306a] 2051                      movea.l    (a1),a0
[0002306c] 4868 0168                 pea.l      360(a0)
[00023070] 43ec 003a                 lea.l      58(a4),a1
[00023074] 204a                      movea.l    a2,a0
[00023076] 4eb9 0001 6372            jsr        wi_pos
[0002307c] 584f                      addq.w     #4,a7
[0002307e] 248b                      move.l     a3,(a2)
[00023080] 294a 0012                 move.l     a2,18(a4)
[00023084] 204a                      movea.l    a2,a0
[00023086] 4eb9 0002 30f4            jsr        set_user
[0002308c] 204a                      movea.l    a2,a0
[0002308e] 226a 000c                 movea.l    12(a2),a1
[00023092] 4e91                      jsr        (a1)
[00023094] 4a40                      tst.w      d0
[00023096] 670c                      beq.s      user_make_2
[00023098] 204a                      movea.l    a2,a0
[0002309a] 4eb9 0002 31b2            jsr        term
user_make_3:
[000230a0] 91c8                      suba.l     a0,a0
[000230a2] 6002                      bra.s      user_make_4
user_make_2:
[000230a4] 204a                      movea.l    a2,a0
user_make_4:
[000230a6] 584f                      addq.w     #4,a7
[000230a8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000230ac] 4e75                      rts

user_service:
[000230ae] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000230b2] 2448                      movea.l    a0,a2
[000230b4] 3600                      move.w     d0,d3
[000230b6] 2849                      movea.l    a1,a4
[000230b8] 2650                      movea.l    (a0),a3
[000230ba] 5540                      subq.w     #2,d0
[000230bc] 6708                      beq.s      user_service_1
[000230be] 907c 270e                 sub.w      #$270E,d0
[000230c2] 670c                      beq.s      user_service_2
[000230c4] 6018                      bra.s      user_service_3
user_service_1:
[000230c6] 204a                      movea.l    a2,a0
[000230c8] 4eb9 0002 31b2            jsr        term
[000230ce] 601c                      bra.s      user_service_4
user_service_2:
[000230d0] 226b 0004                 movea.l    4(a3),a1
[000230d4] 204a                      movea.l    a2,a0
[000230d6] 4eb9 0001 60ea            jsr        new_name
[000230dc] 600e                      bra.s      user_service_4
user_service_3:
[000230de] 224c                      movea.l    a4,a1
[000230e0] 3003                      move.w     d3,d0
[000230e2] 204a                      movea.l    a2,a0
[000230e4] 4eb9 0005 9dd0            jsr        Awi_service
[000230ea] 6002                      bra.s      user_service_5
user_service_4:
[000230ec] 7001                      moveq.l    #1,d0
user_service_5:
[000230ee] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[000230f2] 4e75                      rts

set_user:
[000230f4] 48e7 0038                 movem.l    a2-a4,-(a7)
[000230f8] 594f                      subq.w     #4,a7
[000230fa] 2250                      movea.l    (a0),a1
[000230fc] 2ea8 0014                 move.l     20(a0),(a7)
[00023100] 2069 0004                 movea.l    4(a1),a0
[00023104] 2668 0004                 movea.l    4(a0),a3
[00023108] 2253                      movea.l    (a3),a1
[0002310a] 43e9 0016                 lea.l      22(a1),a1
[0002310e] 7008                      moveq.l    #8,d0
[00023110] 2057                      movea.l    (a7),a0
[00023112] 4eb9 0005 0fd8            jsr        Aob_puttext
[00023118] 226b 0004                 movea.l    4(a3),a1
[0002311c] 43e9 0016                 lea.l      22(a1),a1
[00023120] 7009                      moveq.l    #9,d0
[00023122] 2057                      movea.l    (a7),a0
[00023124] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002312a] 286b 0008                 movea.l    8(a3),a4
[0002312e] 200c                      move.l     a4,d0
[00023130] 6706                      beq.s      set_user_1
[00023132] 45ec 0016                 lea.l      22(a4),a2
[00023136] 6006                      bra.s      set_user_2
set_user_1:
[00023138] 45f9 000b 32b8            lea.l      $000B32B8,a2
set_user_2:
[0002313e] 224a                      movea.l    a2,a1
[00023140] 700a                      moveq.l    #10,d0
[00023142] 2057                      movea.l    (a7),a0
[00023144] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002314a] 286b 000c                 movea.l    12(a3),a4
[0002314e] 200c                      move.l     a4,d0
[00023150] 6706                      beq.s      set_user_3
[00023152] 45ec 0016                 lea.l      22(a4),a2
[00023156] 6006                      bra.s      set_user_4
set_user_3:
[00023158] 45f9 000b 32b8            lea.l      $000B32B8,a2
set_user_4:
[0002315e] 224a                      movea.l    a2,a1
[00023160] 700b                      moveq.l    #11,d0
[00023162] 2057                      movea.l    (a7),a0
[00023164] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002316a] 286b 0010                 movea.l    16(a3),a4
[0002316e] 200c                      move.l     a4,d0
[00023170] 6706                      beq.s      set_user_5
[00023172] 45ec 0016                 lea.l      22(a4),a2
[00023176] 6006                      bra.s      set_user_6
set_user_5:
[00023178] 45f9 000b 32b8            lea.l      $000B32B8,a2
set_user_6:
[0002317e] 224a                      movea.l    a2,a1
[00023180] 700c                      moveq.l    #12,d0
[00023182] 2057                      movea.l    (a7),a0
[00023184] 4eb9 0005 0fd8            jsr        Aob_puttext
[0002318a] 286b 0014                 movea.l    20(a3),a4
[0002318e] 200c                      move.l     a4,d0
[00023190] 6706                      beq.s      set_user_7
[00023192] 45ec 0016                 lea.l      22(a4),a2
[00023196] 6006                      bra.s      set_user_8
set_user_7:
[00023198] 45f9 000b 32b8            lea.l      $000B32B8,a2
set_user_8:
[0002319e] 224a                      movea.l    a2,a1
[000231a0] 700d                      moveq.l    #13,d0
[000231a2] 2057                      movea.l    (a7),a0
[000231a4] 4eb9 0005 0fd8            jsr        Aob_puttext
[000231aa] 584f                      addq.w     #4,a7
[000231ac] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000231b0] 4e75                      rts

term:
[000231b2] 2f0a                      move.l     a2,-(a7)
[000231b4] 2f0b                      move.l     a3,-(a7)
[000231b6] 2448                      movea.l    a0,a2
[000231b8] 006a 0100 0056            ori.w      #$0100,86(a2)
[000231be] 2650                      movea.l    (a0),a3
[000231c0] 226b 0004                 movea.l    4(a3),a1
[000231c4] 42a9 0012                 clr.l      18(a1)
[000231c8] 302a 0056                 move.w     86(a2),d0
[000231cc] c07c 0800                 and.w      #$0800,d0
[000231d0] 6716                      beq.s      term_1
[000231d2] 43ea 002c                 lea.l      44(a2),a1
[000231d6] 206b 0004                 movea.l    4(a3),a0
[000231da] 41e8 003a                 lea.l      58(a0),a0
[000231de] 7008                      moveq.l    #8,d0
[000231e0] 4eb9 0008 3500            jsr        memcpy
[000231e6] 6014                      bra.s      term_2
term_1:
[000231e8] 7008                      moveq.l    #8,d0
[000231ea] 43ea 0024                 lea.l      36(a2),a1
[000231ee] 206b 0004                 movea.l    4(a3),a0
[000231f2] 41e8 003a                 lea.l      58(a0),a0
[000231f6] 4eb9 0008 3500            jsr        memcpy
term_2:
[000231fc] 204b                      movea.l    a3,a0
[000231fe] 4eb9 0004 c7c8            jsr        Ax_free
[00023204] 204a                      movea.l    a2,a0
[00023206] 4eb9 0005 8362            jsr        Awi_closed
[0002320c] 204a                      movea.l    a2,a0
[0002320e] 4eb9 0005 85f2            jsr        Awi_delete
[00023214] 265f                      movea.l    (a7)+,a3
[00023216] 245f                      movea.l    (a7)+,a2
[00023218] 4e75                      rts

	.data

TEXT_002:
[000b299a]                           dc.w $0031
[000b299c]                           dc.b '234567890123456789012345678901',0
TEXT_01:
[000b29bb]                           dc.b 'Code:',0
TEXT_011:
[000b29c1]                           dc.b $4f
[000b29c2]                           dc.w $4b00
TEXT_02:
[000b29c4]                           dc.b 'Parm:',0
TEXT_03:
[000b29ca]                           dc.b 'Serv:',0
TEXT_04:
[000b29d0]                           dc.b 'Ptr1:',0
TEXT_05:
[000b29d6]                           dc.b 'Ptr2:',0
TEXT_06:
[000b29dc]                           dc.b 'Ptr3:',0
TEXT_07:
[000b29e2]                           dc.b ' Userblk-Editor ',0
TEXT_10:
[000b29f3]                           dc.b 'USER-BLOCK',0
DATAS_25:
[000b29fe]                           dc.w $0000
[000b2a00]                           dc.w $0000
[000b2a02]                           dc.w $02f0
[000b2a04]                           dc.w $0000
[000b2a06]                           dc.w $0000
[000b2a08]                           dc.w $0000
[000b2a0a]                           dc.w $0000
[000b2a0c]                           dc.w $0000
[000b2a0e]                           dc.w $0000
[000b2a10]                           dc.w $0000
[000b2a12]                           dc.w $0000
[000b2a14]                           dc.w $0000
[000b2a16]                           dc.w $0000
[000b2a18]                           dc.w $0000
[000b2a1a]                           dc.w $0000
[000b2a1c]                           dc.w $0000
[000b2a1e]                           dc.w $0ffe
[000b2a20]                           dc.w $0000
[000b2a22]                           dc.w $03e0
[000b2a24]                           dc.w $0803
[000b2a26]                           dc.w $0000
[000b2a28]                           dc.w $03e0
[000b2a2a]                           dc.w $fbfb
[000b2a2c]                           dc.w $ffe0
[000b2a2e]                           dc.w $03e0
[000b2a30]                           dc.w $f803
[000b2a32]                           dc.w $ffe0
[000b2a34]                           dc.w $03e0
[000b2a36]                           dc.w $ffff
[000b2a38]                           dc.w $ffe0
[000b2a3a]                           dc.w $03e0
[000b2a3c]                           dc.w $ffff
[000b2a3e]                           dc.w $ffe0
[000b2a40]                           dc.w $0000
[000b2a42]                           dc.w $ffff
[000b2a44]                           dc.w $ffe0
[000b2a46]                           dc.w $0000
[000b2a48]                           dc.w $ffff
[000b2a4a]                           dc.w $ffe0
[000b2a4c]                           dc.w $0000
[000b2a4e]                           dc.w $ffff
[000b2a50]                           dc.w $ffe0
[000b2a52]                           dc.w $0000
[000b2a54]                           dc.w $ffff
[000b2a56]                           dc.w $ffe0
[000b2a58]                           dc.w $0000
[000b2a5a]                           dc.w $ffff
[000b2a5c]                           dc.w $ffe0
[000b2a5e]                           dc.w $01c0
[000b2a60]                           dc.w $ffff
[000b2a62]                           dc.w $ffe0
[000b2a64]                           dc.w $03e0
[000b2a66]                           dc.w $ffff
[000b2a68]                           dc.w $ffe0
[000b2a6a]                           dc.w $03e0
[000b2a6c]                           dc.w $ffff
[000b2a6e]                           dc.w $ffe0
[000b2a70]                           dc.w $03e0
[000b2a72]                           dc.w $ffff
[000b2a74]                           dc.w $ffe0
[000b2a76]                           dc.w $01c0
[000b2a78]                           dc.w $0000
[000b2a7a]                           dc.w $0000
[000b2a7c]                           dc.w $0000
[000b2a7e]                           dc.w $0402
[000b2a80]                           dc.w $0000
[000b2a82]                           dc.w $0000
[000b2a84]                           dc.w $0703
[000b2a86]                           dc.w $8000
[000b2a88]                           dc.w $0000
[000b2a8a]                           dc.w $0402
[000b2a8c]                           dc.w $0000
[000b2a8e]                           dc.w $0000
[000b2a90]                           dc.w $0402
[000b2a92]                           dc.w $0000
[000b2a94]                           dc.w $0000
[000b2a96]                           dc.w $743a
[000b2a98]                           dc.w $0000
[000b2a9a]                           dc.w $0000
[000b2a9c]                           dc.w $f87c
[000b2a9e]                           dc.w $0000
[000b2aa0]                           dc.w $0000
[000b2aa2]                           dc.w $7038
[000b2aa4]                           dc.w $0000
[000b2aa6]                           dc.w $0000
[000b2aa8]                           dc.w $0000
[000b2aaa]                           dc.w $0000
[000b2aac]                           dc.w $0000
[000b2aae]                           dc.w $0000
[000b2ab0]                           dc.w $0000
[000b2ab2]                           dc.w $0000
[000b2ab4]                           dc.w $0000
[000b2ab6]                           dc.w $0000
[000b2ab8]                           dc.w $0000
[000b2aba]                           dc.w $0000
[000b2abc]                           dc.w $0000
[000b2abe]                           dc.w $0000
[000b2ac0]                           dc.w $0000
[000b2ac2]                           dc.w $0000
[000b2ac4]                           dc.w $0000
[000b2ac6]                           dc.w $0000
[000b2ac8]                           dc.w $0000
[000b2aca]                           dc.w $0000
[000b2acc]                           dc.w $0000
[000b2ace]                           dc.w $0000
[000b2ad0]                           dc.w $0000
[000b2ad2]                           dc.w $0000
[000b2ad4]                           dc.w $0000
[000b2ad6]                           dc.w $0000
[000b2ad8]                           dc.w $0ffe
[000b2ada]                           dc.w $0000
[000b2adc]                           dc.w $03e0
[000b2ade]                           dc.w $0803
[000b2ae0]                           dc.w $0000
[000b2ae2]                           dc.w $03e0
[000b2ae4]                           dc.w $fbfb
[000b2ae6]                           dc.w $ffe0
[000b2ae8]                           dc.w $03e0
[000b2aea]                           dc.w $f803
[000b2aec]                           dc.w $ffe0
[000b2aee]                           dc.w $03e0
[000b2af0]                           dc.w $ffff
[000b2af2]                           dc.w $ffe0
[000b2af4]                           dc.w $03e0
[000b2af6]                           dc.w $ffff
[000b2af8]                           dc.w $ffe0
[000b2afa]                           dc.w $0000
[000b2afc]                           dc.w $ffff
[000b2afe]                           dc.w $ffe0
[000b2b00]                           dc.w $0000
[000b2b02]                           dc.w $ffff
[000b2b04]                           dc.w $ffe0
[000b2b06]                           dc.w $0000
[000b2b08]                           dc.w $ffff
[000b2b0a]                           dc.w $ffe0
[000b2b0c]                           dc.w $0000
[000b2b0e]                           dc.w $ffff
[000b2b10]                           dc.w $ffe0
[000b2b12]                           dc.w $0000
[000b2b14]                           dc.w $ffff
[000b2b16]                           dc.w $ffe0
[000b2b18]                           dc.w $01c0
[000b2b1a]                           dc.w $ffff
[000b2b1c]                           dc.w $ffe0
[000b2b1e]                           dc.w $03e0
[000b2b20]                           dc.w $ffff
[000b2b22]                           dc.w $ffe0
[000b2b24]                           dc.w $03e0
[000b2b26]                           dc.w $ffff
[000b2b28]                           dc.w $ffe0
[000b2b2a]                           dc.w $03e0
[000b2b2c]                           dc.w $ffff
[000b2b2e]                           dc.w $ffe0
[000b2b30]                           dc.w $01c0
[000b2b32]                           dc.w $0000
[000b2b34]                           dc.w $0000
[000b2b36]                           dc.w $0000
[000b2b38]                           dc.w $0402
[000b2b3a]                           dc.w $0000
[000b2b3c]                           dc.w $0000
[000b2b3e]                           dc.w $0703
[000b2b40]                           dc.w $8000
[000b2b42]                           dc.w $0000
[000b2b44]                           dc.w $0402
[000b2b46]                           dc.w $0000
[000b2b48]                           dc.w $0000
[000b2b4a]                           dc.w $0402
[000b2b4c]                           dc.w $0000
[000b2b4e]                           dc.w $0000
[000b2b50]                           dc.w $743a
[000b2b52]                           dc.w $0000
[000b2b54]                           dc.w $0000
[000b2b56]                           dc.w $f87c
[000b2b58]                           dc.w $0000
[000b2b5a]                           dc.w $0000
[000b2b5c]                           dc.w $7038
[000b2b5e]                           dc.w $0000
[000b2b60]                           dc.w $0000
[000b2b62]                           dc.w $0000
[000b2b64]                           dc.w $0000
[000b2b66]                           dc.w $0000
[000b2b68]                           dc.w $0000
[000b2b6a]                           dc.w $0000
[000b2b6c]                           dc.w $0000
[000b2b6e]                           dc.w $0000
[000b2b70]                           dc.w $0000
[000b2b72]                           dc.w $0000
[000b2b74]                           dc.w $0000
[000b2b76]                           dc.w $0000
[000b2b78]                           dc.w $0000
[000b2b7a]                           dc.w $0000
[000b2b7c]                           dc.w $0000
[000b2b7e]                           dc.w $0000
[000b2b80]                           dc.w $0000
[000b2b82]                           dc.w $0000
[000b2b84]                           dc.w $0000
[000b2b86]                           dc.w $0000
[000b2b88]                           dc.w $0000
[000b2b8a]                           dc.w $0000
[000b2b8c]                           dc.w $0000
[000b2b8e]                           dc.w $0000
[000b2b90]                           dc.w $0000
[000b2b92]                           dc.w $0ffe
[000b2b94]                           dc.w $0000
[000b2b96]                           dc.w $03e0
[000b2b98]                           dc.w $0803
[000b2b9a]                           dc.w $0000
[000b2b9c]                           dc.w $03e0
[000b2b9e]                           dc.w $fbfb
[000b2ba0]                           dc.w $ffe0
[000b2ba2]                           dc.w $03e0
[000b2ba4]                           dc.w $f803
[000b2ba6]                           dc.w $ffe0
[000b2ba8]                           dc.w $03e0
[000b2baa]                           dc.w $ffff
[000b2bac]                           dc.w $ffe0
[000b2bae]                           dc.w $03e0
[000b2bb0]                           dc.w $ffff
[000b2bb2]                           dc.w $ffe0
[000b2bb4]                           dc.w $0000
[000b2bb6]                           dc.w $ffff
[000b2bb8]                           dc.w $ffe0
[000b2bba]                           dc.w $0000
[000b2bbc]                           dc.w $ffff
[000b2bbe]                           dc.w $ffe0
[000b2bc0]                           dc.w $0000
[000b2bc2]                           dc.w $ffff
[000b2bc4]                           dc.w $ffe0
[000b2bc6]                           dc.w $0000
[000b2bc8]                           dc.w $ffff
[000b2bca]                           dc.w $ffe0
[000b2bcc]                           dc.w $0000
[000b2bce]                           dc.w $ffff
[000b2bd0]                           dc.w $ffe0
[000b2bd2]                           dc.w $01c0
[000b2bd4]                           dc.w $ffff
[000b2bd6]                           dc.w $ffe0
[000b2bd8]                           dc.w $03e0
[000b2bda]                           dc.w $ffff
[000b2bdc]                           dc.w $ffe0
[000b2bde]                           dc.w $03e0
[000b2be0]                           dc.w $ffff
[000b2be2]                           dc.w $ffe0
[000b2be4]                           dc.w $03e0
[000b2be6]                           dc.w $ffff
[000b2be8]                           dc.w $ffe0
[000b2bea]                           dc.w $01c0
[000b2bec]                           dc.w $0000
[000b2bee]                           dc.w $0000
[000b2bf0]                           dc.w $0000
[000b2bf2]                           dc.w $0402
[000b2bf4]                           dc.w $0000
[000b2bf6]                           dc.w $0000
[000b2bf8]                           dc.w $0703
[000b2bfa]                           dc.w $8000
[000b2bfc]                           dc.w $0000
[000b2bfe]                           dc.w $0402
[000b2c00]                           dc.w $0000
[000b2c02]                           dc.w $0000
[000b2c04]                           dc.w $0402
[000b2c06]                           dc.w $0000
[000b2c08]                           dc.w $0000
[000b2c0a]                           dc.w $743a
[000b2c0c]                           dc.w $0000
[000b2c0e]                           dc.w $0000
[000b2c10]                           dc.w $f87c
[000b2c12]                           dc.w $0000
[000b2c14]                           dc.w $0000
[000b2c16]                           dc.w $7038
[000b2c18]                           dc.w $0000
[000b2c1a]                           dc.w $0000
[000b2c1c]                           dc.w $0000
[000b2c1e]                           dc.w $0000
[000b2c20]                           dc.w $0000
[000b2c22]                           dc.w $0000
[000b2c24]                           dc.w $0000
[000b2c26]                           dc.w $0000
[000b2c28]                           dc.w $0000
[000b2c2a]                           dc.w $0000
[000b2c2c]                           dc.w $0000
[000b2c2e]                           dc.w $0000
[000b2c30]                           dc.w $0000
[000b2c32]                           dc.w $0000
[000b2c34]                           dc.w $0000
[000b2c36]                           dc.w $0000
[000b2c38]                           dc.w $0000
[000b2c3a]                           dc.w $0000
[000b2c3c]                           dc.w $0000
[000b2c3e]                           dc.w $0000
[000b2c40]                           dc.w $0000
[000b2c42]                           dc.w $0000
[000b2c44]                           dc.w $0000
[000b2c46]                           dc.w $0000
[000b2c48]                           dc.w $0000
[000b2c4a]                           dc.w $07f0
[000b2c4c]                           dc.w $0ffe
[000b2c4e]                           dc.w $0000
[000b2c50]                           dc.w $0410
[000b2c52]                           dc.w $0803
[000b2c54]                           dc.w $0000
[000b2c56]                           dc.w $0550
[000b2c58]                           dc.w $fbfb
[000b2c5a]                           dc.w $ffe0
[000b2c5c]                           dc.w $0490
[000b2c5e]                           dc.w $8803
[000b2c60]                           dc.w $0020
[000b2c62]                           dc.w $0550
[000b2c64]                           dc.w $8fff
[000b2c66]                           dc.w $0020
[000b2c68]                           dc.w $0410
[000b2c6a]                           dc.w $87ff
[000b2c6c]                           dc.w $0020
[000b2c6e]                           dc.w $07f0
[000b2c70]                           dc.w $8000
[000b2c72]                           dc.w $0020
[000b2c74]                           dc.w $0000
[000b2c76]                           dc.w $8000
[000b2c78]                           dc.w $0020
[000b2c7a]                           dc.w $0000
[000b2c7c]                           dc.w $8000
[000b2c7e]                           dc.w $0020
[000b2c80]                           dc.w $0000
[000b2c82]                           dc.w $8000
[000b2c84]                           dc.w $0020
[000b2c86]                           dc.w $01c0
[000b2c88]                           dc.w $8000
[000b2c8a]                           dc.w $0020
[000b2c8c]                           dc.w $0220
[000b2c8e]                           dc.w $8000
[000b2c90]                           dc.w $0020
[000b2c92]                           dc.w $0490
[000b2c94]                           dc.w $8000
[000b2c96]                           dc.w $0020
[000b2c98]                           dc.w $05d0
[000b2c9a]                           dc.w $8000
[000b2c9c]                           dc.w $0020
[000b2c9e]                           dc.w $0490
[000b2ca0]                           dc.w $ffff
[000b2ca2]                           dc.w $ffe0
[000b2ca4]                           dc.w $0220
[000b2ca6]                           dc.w $0000
[000b2ca8]                           dc.w $0000
[000b2caa]                           dc.w $01c0
[000b2cac]                           dc.w $0402
[000b2cae]                           dc.w $0000
[000b2cb0]                           dc.w $0000
[000b2cb2]                           dc.w $0703
[000b2cb4]                           dc.w $8000
[000b2cb6]                           dc.w $0000
[000b2cb8]                           dc.w $0402
[000b2cba]                           dc.w $0000
[000b2cbc]                           dc.w $0000
[000b2cbe]                           dc.w $0402
[000b2cc0]                           dc.w $0000
[000b2cc2]                           dc.w $0000
[000b2cc4]                           dc.w $743a
[000b2cc6]                           dc.w $0000
[000b2cc8]                           dc.w $0000
[000b2cca]                           dc.w $f87c
[000b2ccc]                           dc.w $0000
[000b2cce]                           dc.w $0000
[000b2cd0]                           dc.w $7038
[000b2cd2]                           dc.w $0000
[000b2cd4]                           dc.w $0000
[000b2cd6]                           dc.w $0000
[000b2cd8]                           dc.w $0000
[000b2cda]                           dc.w $0000
[000b2cdc]                           dc.w $0000
[000b2cde]                           dc.w $0000
[000b2ce0]                           dc.w $0000
[000b2ce2]                           dc.w $0000
[000b2ce4]                           dc.w $0000
[000b2ce6]                           dc.w $0000
[000b2ce8]                           dc.w $0000
[000b2cea]                           dc.w $0000
DATAS_26:
[000b2cec]                           dc.w $0000
[000b2cee]                           dc.w $0000
[000b2cf0]                           dc.w $0000
[000b2cf2]                           dc.w $0000
[000b2cf4]                           dc.w $0000
[000b2cf6]                           dc.w $0000
[000b2cf8]                           dc.w $0000
[000b2cfa]                           dc.w $0000
[000b2cfc]                           dc.w $0000
[000b2cfe]                           dc.w $0000
[000b2d00]                           dc.w $0000
[000b2d02]                           dc.w $0000
[000b2d04]                           dc.w $07f0
[000b2d06]                           dc.w $0ffe
[000b2d08]                           dc.w $0000
[000b2d0a]                           dc.w $07f0
[000b2d0c]                           dc.w $0fff
[000b2d0e]                           dc.w $0000
[000b2d10]                           dc.w $07f0
[000b2d12]                           dc.w $ffff
[000b2d14]                           dc.w $ffe0
[000b2d16]                           dc.w $07f0
[000b2d18]                           dc.w $ffff
[000b2d1a]                           dc.w $ffe0
[000b2d1c]                           dc.w $07f0
[000b2d1e]                           dc.w $ffff
[000b2d20]                           dc.w $ffe0
[000b2d22]                           dc.w $07f0
[000b2d24]                           dc.w $ffff
[000b2d26]                           dc.w $ffe0
[000b2d28]                           dc.w $07f0
[000b2d2a]                           dc.w $ffff
[000b2d2c]                           dc.w $ffe0
[000b2d2e]                           dc.w $0000
[000b2d30]                           dc.w $ffff
[000b2d32]                           dc.w $ffe0
[000b2d34]                           dc.w $0000
[000b2d36]                           dc.w $ffff
[000b2d38]                           dc.w $ffe0
[000b2d3a]                           dc.w $0000
[000b2d3c]                           dc.w $ffff
[000b2d3e]                           dc.w $ffe0
[000b2d40]                           dc.w $01c0
[000b2d42]                           dc.w $ffff
[000b2d44]                           dc.w $ffe0
[000b2d46]                           dc.w $03e0
[000b2d48]                           dc.w $ffff
[000b2d4a]                           dc.w $ffe0
[000b2d4c]                           dc.w $07f0
[000b2d4e]                           dc.w $ffff
[000b2d50]                           dc.w $ffe0
[000b2d52]                           dc.w $07f0
[000b2d54]                           dc.w $ffff
[000b2d56]                           dc.w $ffe0
[000b2d58]                           dc.w $07f0
[000b2d5a]                           dc.w $ffff
[000b2d5c]                           dc.w $ffe0
[000b2d5e]                           dc.w $03e0
[000b2d60]                           dc.w $0402
[000b2d62]                           dc.w $0000
[000b2d64]                           dc.w $01c0
[000b2d66]                           dc.w $0f07
[000b2d68]                           dc.w $8000
[000b2d6a]                           dc.w $0000
[000b2d6c]                           dc.w $0f87
[000b2d6e]                           dc.w $c000
[000b2d70]                           dc.w $0000
[000b2d72]                           dc.w $0f07
[000b2d74]                           dc.w $8000
[000b2d76]                           dc.w $0000
[000b2d78]                           dc.w $7e3f
[000b2d7a]                           dc.w $0000
[000b2d7c]                           dc.w $0000
[000b2d7e]                           dc.w $fe7f
[000b2d80]                           dc.w $0000
[000b2d82]                           dc.w $0001
[000b2d84]                           dc.w $fcfe
[000b2d86]                           dc.w $0000
[000b2d88]                           dc.w $0000
[000b2d8a]                           dc.w $f87c
[000b2d8c]                           dc.w $0000
[000b2d8e]                           dc.w $0000
[000b2d90]                           dc.w $7038
[000b2d92]                           dc.w $0000
[000b2d94]                           dc.w $0000
[000b2d96]                           dc.w $0000
[000b2d98]                           dc.w $0000
[000b2d9a]                           dc.w $0000
[000b2d9c]                           dc.w $0000
[000b2d9e]                           dc.w $0000
[000b2da0]                           dc.w $0000
[000b2da2]                           dc.w $0000
[000b2da4]                           dc.w $0000
TEDINFO_01:
[000b2da6] 000b29bb                  dc.l TEXT_01
[000b2daa] 000b299a                  dc.l TEXT_002
[000b2dae] 000b299a                  dc.l TEXT_002
[000b2db2]                           dc.w $0003
[000b2db4]                           dc.w $0006
[000b2db6]                           dc.w $0002
[000b2db8]                           dc.w $1100
[000b2dba]                           dc.w $0000
[000b2dbc]                           dc.w $ffff
[000b2dbe]                           dc.w $0006
[000b2dc0]                           dc.w $0001
TEDINFO_02:
[000b2dc2] 000b29c4                  dc.l TEXT_02
[000b2dc6] 000b299a                  dc.l TEXT_002
[000b2dca] 000b299a                  dc.l TEXT_002
[000b2dce]                           dc.w $0003
[000b2dd0]                           dc.w $0006
[000b2dd2]                           dc.w $0002
[000b2dd4]                           dc.w $1100
[000b2dd6]                           dc.w $0000
[000b2dd8]                           dc.w $ffff
[000b2dda]                           dc.w $0006
[000b2ddc]                           dc.w $0001
TEDINFO_03:
[000b2dde] 000b29ca                  dc.l TEXT_03
[000b2de2] 000b299a                  dc.l TEXT_002
[000b2de6] 000b299a                  dc.l TEXT_002
[000b2dea]                           dc.w $0003
[000b2dec]                           dc.w $0006
[000b2dee]                           dc.w $0002
[000b2df0]                           dc.w $1100
[000b2df2]                           dc.w $0000
[000b2df4]                           dc.w $ffff
[000b2df6]                           dc.w $0006
[000b2df8]                           dc.w $0001
TEDINFO_04:
[000b2dfa] 000b29d0                  dc.l TEXT_04
[000b2dfe] 000b299a                  dc.l TEXT_002
[000b2e02] 000b299a                  dc.l TEXT_002
[000b2e06]                           dc.w $0003
[000b2e08]                           dc.w $0006
[000b2e0a]                           dc.w $0002
[000b2e0c]                           dc.w $1100
[000b2e0e]                           dc.w $0000
[000b2e10]                           dc.w $ffff
[000b2e12]                           dc.w $0006
[000b2e14]                           dc.w $0001
TEDINFO_05:
[000b2e16] 000b29d6                  dc.l TEXT_05
[000b2e1a] 000b299a                  dc.l TEXT_002
[000b2e1e] 000b299a                  dc.l TEXT_002
[000b2e22]                           dc.w $0003
[000b2e24]                           dc.w $0006
[000b2e26]                           dc.w $0002
[000b2e28]                           dc.w $1100
[000b2e2a]                           dc.w $0000
[000b2e2c]                           dc.w $ffff
[000b2e2e]                           dc.w $0006
[000b2e30]                           dc.w $0001
TEDINFO_06:
[000b2e32] 000b29dc                  dc.l TEXT_06
[000b2e36] 000b299a                  dc.l TEXT_002
[000b2e3a] 000b299a                  dc.l TEXT_002
[000b2e3e]                           dc.w $0003
[000b2e40]                           dc.w $0006
[000b2e42]                           dc.w $0002
[000b2e44]                           dc.w $1100
[000b2e46]                           dc.w $0000
[000b2e48]                           dc.w $ffff
[000b2e4a]                           dc.w $0006
[000b2e4c]                           dc.w $0001
TEDI_007:
[000b2e4e] 000b299b                  dc.l TEXT_006
[000b2e52] 000b299a                  dc.l TEXT_002
[000b2e56] 000b299a                  dc.l TEXT_002
[000b2e5a]                           dc.w $0003
[000b2e5c]                           dc.w $0006
[000b2e5e]                           dc.w $0000
[000b2e60]                           dc.w $1100
[000b2e62]                           dc.w $0000
[000b2e64]                           dc.w $0000
[000b2e66]                           dc.w $0020
[000b2e68]                           dc.w $0001
TEDI_008:
[000b2e6a] 000b299b                  dc.l TEXT_006
[000b2e6e] 000b299a                  dc.l TEXT_002
[000b2e72] 000b299a                  dc.l TEXT_002
[000b2e76]                           dc.w $0003
[000b2e78]                           dc.w $0006
[000b2e7a]                           dc.w $0000
[000b2e7c]                           dc.w $1180
[000b2e7e]                           dc.w $0000
[000b2e80]                           dc.w $0000
[000b2e82]                           dc.w $0020
[000b2e84]                           dc.w $0001
A_3DBUTTON02:
[000b2e86] 00064a22                  dc.l A_3Dbutton
[000b2e8a]                           dc.w $21f1
[000b2e8c]                           dc.w $01f8
[000b2e8e] 000630f2                  dc.l Auo_string
[000b2e92]                           dc.w $0000
[000b2e94]                           dc.w $0000
[000b2e96]                           dc.w $0000
[000b2e98]                           dc.w $0000
[000b2e9a]                           dc.w $0000
[000b2e9c]                           dc.w $0000
[000b2e9e]                           dc.w $0000
[000b2ea0]                           dc.w $0000
[000b2ea2]                           dc.w $0000
[000b2ea4]                           dc.w $0000
A_3DBUTTON04:
[000b2ea6] 00064a22                  dc.l A_3Dbutton
[000b2eaa]                           dc.w $29c1
[000b2eac]                           dc.w $0178
[000b2eae] 000630f2                  dc.l Auo_string
[000b2eb2] 000b29c1                  dc.l TEXT_011
[000b2eb6]                           dc.w $0000
[000b2eb8]                           dc.w $0000
[000b2eba]                           dc.w $0000
[000b2ebc]                           dc.w $0000
[000b2ebe]                           dc.w $0000
[000b2ec0]                           dc.w $0000
[000b2ec2]                           dc.w $0000
[000b2ec4]                           dc.w $0000
A_INNERFRAME02:
[000b2ec6] 00064256                  dc.l A_innerframe
[000b2eca]                           dc.w $1000
[000b2ecc]                           dc.w $8f19
[000b2ece] 000630f2                  dc.l Auo_string
[000b2ed2]                           dc.w $0000
[000b2ed4]                           dc.w $0000
[000b2ed6]                           dc.w $0000
[000b2ed8]                           dc.w $0000
[000b2eda]                           dc.w $0000
[000b2edc]                           dc.w $0000
[000b2ede]                           dc.w $0000
[000b2ee0]                           dc.w $0000
[000b2ee2]                           dc.w $0000
[000b2ee4]                           dc.w $0000
_C4_IC_USER:
[000b2ee6]                           dc.w $0004
[000b2ee8] 000b2a04                  dc.l $000b2a04
[000b2eec] 000b2cec                  dc.l DATAS_26
[000b2ef0]                           dc.w $0000
[000b2ef2]                           dc.w $0000
[000b2ef4]                           dc.w $0000
[000b2ef6]                           dc.w $0000
[000b2ef8]                           dc.w $0000
[000b2efa]                           dc.w $0000
_MSK_IC_USER:
[000b2efc]                           dc.w $0000
[000b2efe]                           dc.w $0000
[000b2f00]                           dc.w $0000
[000b2f02]                           dc.w $0000
[000b2f04]                           dc.w $0000
[000b2f06]                           dc.w $0000
[000b2f08]                           dc.w $0000
[000b2f0a]                           dc.w $0000
[000b2f0c]                           dc.w $0000
[000b2f0e]                           dc.w $0000
[000b2f10]                           dc.w $0000
[000b2f12]                           dc.w $0000
[000b2f14]                           dc.w $07f0
[000b2f16]                           dc.w $0ffe
[000b2f18]                           dc.w $0000
[000b2f1a]                           dc.w $07f0
[000b2f1c]                           dc.w $0fff
[000b2f1e]                           dc.w $0000
[000b2f20]                           dc.w $07f0
[000b2f22]                           dc.w $ffff
[000b2f24]                           dc.w $ffe0
[000b2f26]                           dc.w $07f0
[000b2f28]                           dc.w $ffff
[000b2f2a]                           dc.w $ffe0
[000b2f2c]                           dc.w $07f0
[000b2f2e]                           dc.w $ffff
[000b2f30]                           dc.w $ffe0
[000b2f32]                           dc.w $07f0
[000b2f34]                           dc.w $ffff
[000b2f36]                           dc.w $ffe0
[000b2f38]                           dc.w $07f0
[000b2f3a]                           dc.w $ffff
[000b2f3c]                           dc.w $ffe0
[000b2f3e]                           dc.w $0000
[000b2f40]                           dc.w $ffff
[000b2f42]                           dc.w $ffe0
[000b2f44]                           dc.w $0000
[000b2f46]                           dc.w $ffff
[000b2f48]                           dc.w $ffe0
[000b2f4a]                           dc.w $0000
[000b2f4c]                           dc.w $ffff
[000b2f4e]                           dc.w $ffe0
[000b2f50]                           dc.w $01c0
[000b2f52]                           dc.w $ffff
[000b2f54]                           dc.w $ffe0
[000b2f56]                           dc.w $03e0
[000b2f58]                           dc.w $ffff
[000b2f5a]                           dc.w $ffe0
[000b2f5c]                           dc.w $07f0
[000b2f5e]                           dc.w $ffff
[000b2f60]                           dc.w $ffe0
[000b2f62]                           dc.w $07f0
[000b2f64]                           dc.w $ffff
[000b2f66]                           dc.w $ffe0
[000b2f68]                           dc.w $07f0
[000b2f6a]                           dc.w $ffff
[000b2f6c]                           dc.w $ffe0
[000b2f6e]                           dc.w $03e0
[000b2f70]                           dc.w $0402
[000b2f72]                           dc.w $0000
[000b2f74]                           dc.w $01c0
[000b2f76]                           dc.w $0f07
[000b2f78]                           dc.w $8000
[000b2f7a]                           dc.w $0000
[000b2f7c]                           dc.w $0f87
[000b2f7e]                           dc.w $c000
[000b2f80]                           dc.w $0000
[000b2f82]                           dc.w $0f07
[000b2f84]                           dc.w $8000
[000b2f86]                           dc.w $0000
[000b2f88]                           dc.w $7e3f
[000b2f8a]                           dc.w $0000
[000b2f8c]                           dc.w $0000
[000b2f8e]                           dc.w $fe7f
[000b2f90]                           dc.w $0000
[000b2f92]                           dc.w $0001
[000b2f94]                           dc.w $fcfe
[000b2f96]                           dc.w $0000
[000b2f98]                           dc.w $0000
[000b2f9a]                           dc.w $f87c
[000b2f9c]                           dc.w $0000
[000b2f9e]                           dc.w $0000
[000b2fa0]                           dc.w $7038
[000b2fa2]                           dc.w $0000
[000b2fa4]                           dc.w $0000
[000b2fa6]                           dc.w $0000
[000b2fa8]                           dc.w $0000
[000b2faa]                           dc.w $0000
[000b2fac]                           dc.w $0000
[000b2fae]                           dc.w $0000
[000b2fb0]                           dc.w $0000
[000b2fb2]                           dc.w $0000
[000b2fb4]                           dc.w $0000
_DAT_IC_USER:
[000b2fb6]                           dc.w $0000
[000b2fb8]                           dc.w $0000
[000b2fba]                           dc.w $0000
[000b2fbc]                           dc.w $0000
[000b2fbe]                           dc.w $0000
[000b2fc0]                           dc.w $0000
[000b2fc2]                           dc.w $0000
[000b2fc4]                           dc.w $0000
[000b2fc6]                           dc.w $0000
[000b2fc8]                           dc.w $0000
[000b2fca]                           dc.w $0000
[000b2fcc]                           dc.w $0000
[000b2fce]                           dc.w $07f0
[000b2fd0]                           dc.w $0ffe
[000b2fd2]                           dc.w $0000
[000b2fd4]                           dc.w $0630
[000b2fd6]                           dc.w $0803
[000b2fd8]                           dc.w $0000
[000b2fda]                           dc.w $0550
[000b2fdc]                           dc.w $fbfb
[000b2fde]                           dc.w $ffe0
[000b2fe0]                           dc.w $0490
[000b2fe2]                           dc.w $8803
[000b2fe4]                           dc.w $0020
[000b2fe6]                           dc.w $0550
[000b2fe8]                           dc.w $8fff
[000b2fea]                           dc.w $0020
[000b2fec]                           dc.w $0630
[000b2fee]                           dc.w $87ff
[000b2ff0]                           dc.w $0020
[000b2ff2]                           dc.w $07f0
[000b2ff4]                           dc.w $8000
[000b2ff6]                           dc.w $0020
[000b2ff8]                           dc.w $0000
[000b2ffa]                           dc.w $8000
[000b2ffc]                           dc.w $0020
[000b2ffe]                           dc.w $0000
[000b3000]                           dc.w $8000
[000b3002]                           dc.w $0020
[000b3004]                           dc.w $0000
[000b3006]                           dc.w $8000
[000b3008]                           dc.w $0020
[000b300a]                           dc.w $01c0
[000b300c]                           dc.w $8000
[000b300e]                           dc.w $0020
[000b3010]                           dc.w $0220
[000b3012]                           dc.w $8000
[000b3014]                           dc.w $0020
[000b3016]                           dc.w $0490
[000b3018]                           dc.w $8000
[000b301a]                           dc.w $0020
[000b301c]                           dc.w $05d0
[000b301e]                           dc.w $8000
[000b3020]                           dc.w $0020
[000b3022]                           dc.w $0490
[000b3024]                           dc.w $ffff
[000b3026]                           dc.w $ffe0
[000b3028]                           dc.w $0220
[000b302a]                           dc.w $0000
[000b302c]                           dc.w $0000
[000b302e]                           dc.w $01c0
[000b3030]                           dc.w $0402
[000b3032]                           dc.w $0000
[000b3034]                           dc.w $0000
[000b3036]                           dc.w $0703
[000b3038]                           dc.w $8000
[000b303a]                           dc.w $0000
[000b303c]                           dc.w $0402
[000b303e]                           dc.w $0000
[000b3040]                           dc.w $0000
[000b3042]                           dc.w $0402
[000b3044]                           dc.w $0000
[000b3046]                           dc.w $0000
[000b3048]                           dc.w $743a
[000b304a]                           dc.w $0000
[000b304c]                           dc.w $0000
[000b304e]                           dc.w $f87c
[000b3050]                           dc.w $0000
[000b3052]                           dc.w $0000
[000b3054]                           dc.w $7038
[000b3056]                           dc.w $0000
[000b3058]                           dc.w $0000
[000b305a]                           dc.w $0000
[000b305c]                           dc.w $0000
[000b305e]                           dc.w $0000
[000b3060]                           dc.w $0000
[000b3062]                           dc.w $0000
[000b3064]                           dc.w $0000
[000b3066]                           dc.w $0000
[000b3068]                           dc.w $0000
[000b306a]                           dc.w $0000
[000b306c]                           dc.w $0000
[000b306e]                           dc.w $0000
IC_USER:
[000b3070] 000b2efc                  dc.l _MSK_IC_USER
[000b3074] 000b2fb6                  dc.l _DAT_IC_USER
[000b3078] 000b29f3                  dc.l TEXT_10
[000b307c]                           dc.w $1000
[000b307e]                           dc.w $0000
[000b3080]                           dc.w $0000
[000b3082]                           dc.w $000c
[000b3084]                           dc.w $0000
[000b3086]                           dc.w $0030
[000b3088]                           dc.w $001f
[000b308a]                           dc.w $0000
[000b308c]                           dc.w $0020
[000b308e]                           dc.w $0048
[000b3090]                           dc.w $0008
[000b3092] 000b2ee6                  dc.l _C4_IC_USER
EDIT_USER:
[000b3096]                           dc.w $ffff
[000b3098]                           dc.w $0001
[000b309a]                           dc.w $000e
[000b309c]                           dc.w $0018
[000b309e]                           dc.w $0040
[000b30a0]                           dc.w $0010
[000b30a2] 000b2e86                  dc.l A_3DBUTTON02
[000b30a6]                           dc.w $0000
[000b30a8]                           dc.w $0000
[000b30aa]                           dc.w $0028
[000b30ac]                           dc.w $000b
_01_EDIT_USER:
[000b30ae]                           dc.w $000e
[000b30b0]                           dc.w $0002
[000b30b2]                           dc.w $000d
[000b30b4]                           dc.w $0018
[000b30b6]                           dc.w $0040
[000b30b8]                           dc.w $0000
[000b30ba] 000b2ec6                  dc.l A_INNERFRAME02
[000b30be]                           dc.w $0001
[000b30c0]                           dc.w $0000
[000b30c2]                           dc.w $0026
[000b30c4]                           dc.w $0008
_02_EDIT_USER:
[000b30c6]                           dc.w $0003
[000b30c8]                           dc.w $ffff
[000b30ca]                           dc.w $ffff
[000b30cc]                           dc.w $0015
[000b30ce]                           dc.w $0000
[000b30d0]                           dc.w $0000
[000b30d2] 000b2da6                  dc.l TEDINFO_01
[000b30d6]                           dc.w $0001
[000b30d8]                           dc.w $0001
[000b30da]                           dc.w $0005
[000b30dc]                           dc.w $0001
_03_EDIT_USER:
[000b30de]                           dc.w $0004
[000b30e0]                           dc.w $ffff
[000b30e2]                           dc.w $ffff
[000b30e4]                           dc.w $0015
[000b30e6]                           dc.w $0000
[000b30e8]                           dc.w $0000
[000b30ea] 000b2dc2                  dc.l TEDINFO_02
[000b30ee]                           dc.w $0001
[000b30f0]                           dc.w $0002
[000b30f2]                           dc.w $0005
[000b30f4]                           dc.w $0001
_04_EDIT_USER:
[000b30f6]                           dc.w $0005
[000b30f8]                           dc.w $ffff
[000b30fa]                           dc.w $ffff
[000b30fc]                           dc.w $0015
[000b30fe]                           dc.w $0000
[000b3100]                           dc.w $0000
[000b3102] 000b2dde                  dc.l TEDINFO_03
[000b3106]                           dc.w $0001
[000b3108]                           dc.w $0003
[000b310a]                           dc.w $0005
[000b310c]                           dc.w $0001
_05_EDIT_USER:
[000b310e]                           dc.w $0006
[000b3110]                           dc.w $ffff
[000b3112]                           dc.w $ffff
[000b3114]                           dc.w $0015
[000b3116]                           dc.w $0000
[000b3118]                           dc.w $0000
[000b311a] 000b2dfa                  dc.l TEDINFO_04
[000b311e]                           dc.w $0001
[000b3120]                           dc.w $0004
[000b3122]                           dc.w $0005
[000b3124]                           dc.w $0001
_06_EDIT_USER:
[000b3126]                           dc.w $0007
[000b3128]                           dc.w $ffff
[000b312a]                           dc.w $ffff
[000b312c]                           dc.w $0015
[000b312e]                           dc.w $0000
[000b3130]                           dc.w $0000
[000b3132] 000b2e16                  dc.l TEDINFO_05
[000b3136]                           dc.w $0001
[000b3138]                           dc.w $0005
[000b313a]                           dc.w $0005
[000b313c]                           dc.w $0001
_07_EDIT_USER:
[000b313e]                           dc.w $0008
[000b3140]                           dc.w $ffff
[000b3142]                           dc.w $ffff
[000b3144]                           dc.w $0015
[000b3146]                           dc.w $0000
[000b3148]                           dc.w $0000
[000b314a] 000b2e32                  dc.l TEDINFO_06
[000b314e]                           dc.w $0001
[000b3150]                           dc.w $0006
[000b3152]                           dc.w $0005
[000b3154]                           dc.w $0001
_08_EDIT_USER:
[000b3156]                           dc.w $0009
[000b3158]                           dc.w $ffff
[000b315a]                           dc.w $ffff
[000b315c]                           dc.w $0016
[000b315e]                           dc.w $0000
[000b3160]                           dc.w $0000
[000b3162] 000b2e6a                  dc.l TEDI_008
[000b3166]                           dc.w $0006
[000b3168]                           dc.w $0001
[000b316a]                           dc.w $001f
[000b316c]                           dc.w $0001
_09_EDIT_USER:
[000b316e]                           dc.w $000a
[000b3170]                           dc.w $ffff
[000b3172]                           dc.w $ffff
[000b3174]                           dc.w $0016
[000b3176]                           dc.w $0000
[000b3178]                           dc.w $0000
[000b317a] 000b2e6a                  dc.l TEDI_008
[000b317e]                           dc.w $0006
[000b3180]                           dc.w $0002
[000b3182]                           dc.w $001f
[000b3184]                           dc.w $0001
_10_EDIT_USER:
[000b3186]                           dc.w $000b
[000b3188]                           dc.w $ffff
[000b318a]                           dc.w $ffff
[000b318c]                           dc.w $0016
[000b318e]                           dc.w $0000
[000b3190]                           dc.w $0000
[000b3192] 000b2e6a                  dc.l TEDI_008
[000b3196]                           dc.w $0006
[000b3198]                           dc.w $0003
[000b319a]                           dc.w $001f
[000b319c]                           dc.w $0001
_11_EDIT_USER:
[000b319e]                           dc.w $000c
[000b31a0]                           dc.w $ffff
[000b31a2]                           dc.w $ffff
[000b31a4]                           dc.w $0016
[000b31a6]                           dc.w $0000
[000b31a8]                           dc.w $0000
[000b31aa] 000b2e6a                  dc.l TEDI_008
[000b31ae]                           dc.w $0006
[000b31b0]                           dc.w $0004
[000b31b2]                           dc.w $001f
[000b31b4]                           dc.w $0001
_12_EDIT_USER:
[000b31b6]                           dc.w $000d
[000b31b8]                           dc.w $ffff
[000b31ba]                           dc.w $ffff
[000b31bc]                           dc.w $0016
[000b31be]                           dc.w $0000
[000b31c0]                           dc.w $0000
[000b31c2] 000b2e4e                  dc.l TEDI_007
[000b31c6]                           dc.w $0006
[000b31c8]                           dc.w $0005
[000b31ca]                           dc.w $001f
[000b31cc]                           dc.w $0001
_13_EDIT_USER:
[000b31ce]                           dc.w $0001
[000b31d0]                           dc.w $ffff
[000b31d2]                           dc.w $ffff
[000b31d4]                           dc.w $0016
[000b31d6]                           dc.w $0000
[000b31d8]                           dc.w $0000
[000b31da] 000b2e6a                  dc.l TEDI_008
[000b31de]                           dc.w $0006
[000b31e0]                           dc.w $0006
[000b31e2]                           dc.w $001f
[000b31e4]                           dc.w $0001
_14_EDIT_USER:
[000b31e6]                           dc.w $0000
[000b31e8]                           dc.w $ffff
[000b31ea]                           dc.w $ffff
[000b31ec]                           dc.w $0018
[000b31ee]                           dc.w $4007
[000b31f0]                           dc.w $0010
[000b31f2] 000b2ea6                  dc.l A_3DBUTTON04
[000b31f6]                           dc.w $000e
[000b31f8]                           dc.w $0008
[000b31fa]                           dc.w $000c
[000b31fc]                           dc.w $0002
_14aEDIT_USER:
[000b31fe] 00022ff6                  dc.l editus_ok
[000b3202]                           dc.w $0000
[000b3204]                           dc.w $0000
[000b3206]                           dc.w $8020
[000b3208]                           dc.w $884f
[000b320a]                           dc.w $0000
[000b320c]                           dc.w $0000
[000b320e]                           dc.w $0000
[000b3210]                           dc.w $0000
[000b3212]                           dc.w $0000
[000b3214]                           dc.w $0000
WI_USER:
[000b3216]                           dc.w $0000
[000b3218]                           dc.w $0000
[000b321a] 000230ae                  dc.l user_service
[000b321e] 00023008                  dc.l user_make
[000b3222] 00057428                  dc.l Awi_open
[000b3226] 00055e94                  dc.l Awi_init
[000b322a] 000b3096                  dc.l EDIT_USER
[000b322e]                           dc.w $0000
[000b3230]                           dc.w $0000
[000b3232]                           dc.w $0000
[000b3234]                           dc.w $0000
[000b3236]                           dc.w $ffff
[000b3238]                           dc.w $601f
[000b323a]                           dc.w $0000
[000b323c]                           dc.w $0000
[000b323e]                           dc.w $00a0
[000b3240]                           dc.w $0032
[000b3242]                           dc.w $0000
[000b3244]                           dc.w $0000
[000b3246]                           dc.w $0000
[000b3248]                           dc.w $0000
[000b324a]                           dc.w $0000
[000b324c]                           dc.w $0000
[000b324e]                           dc.w $0000
[000b3250]                           dc.w $0000
[000b3252]                           dc.w $ffff
[000b3254]                           dc.w $ffff
[000b3256]                           dc.w $ffff
[000b3258]                           dc.w $ffff
[000b325a]                           dc.w $0000
[000b325c]                           dc.w $0000
[000b325e]                           dc.w $fcf8
[000b3260] 000b29e2                  dc.l TEXT_07
[000b3264] 000b299a                  dc.l TEXT_002
[000b3268]                           dc.w $2710
[000b326a]                           dc.w $0103
[000b326c]                           dc.w $0000
[000b326e]                           dc.w $ffff
[000b3270] 000b3070                  dc.l IC_USER
[000b3274]                           dc.w $0000
[000b3276]                           dc.w $0000
[000b3278] 0006b744                  dc.l Awi_keys
[000b327c] 00051852                  dc.l Awi_obchange
[000b3280] 00051c46                  dc.l Awi_redraw
[000b3284] 000587a4                  dc.l Awi_topped
[000b3288] 00058362                  dc.l Awi_closed
[000b328c] 000587ec                  dc.l Awi_fulled
[000b3290] 0005217c                  dc.l Awi_arrowed
[000b3294] 000524b4                  dc.l Awi_hslid
[000b3298] 0005255e                  dc.l Awi_vslid
[000b329c] 00058bb0                  dc.l Awi_sized
[000b32a0] 00058d50                  dc.l Awi_moved
[000b32a4] 0005998a                  dc.l Awi_iconify
[000b32a8] 00059c6c                  dc.l Awi_uniconify
[000b32ac] 0005b5b6                  dc.l Awi_gemscript
[000b32b0]                           dc.w $0000
[000b32b2]                           dc.w $0000
[000b32b4]                           dc.w $0000
[000b32b6]                           dc.w $0000

[000b32b8]                           dc.b '- NULL -',0
[000b32c1]                           dc.b $00
