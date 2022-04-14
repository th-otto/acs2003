copyref:
[00034410] 2f0a                      move.l     a2,-(a7)
[00034412] 2449                      movea.l    a1,a2
[00034414] 2011                      move.l     (a1),d0
[00034416] 670a                      beq.s      $00034422
[00034418] 2240                      movea.l    d0,a1
[0003441a] 4eb9 0003 5c26            jsr        add_ref
[00034420] 2488                      move.l     a0,(a2)
[00034422] 245f                      movea.l    (a7)+,a2
[00034424] 4e75                      rts
copy_window:
[00034426] 48e7 003c                 movem.l    a2-a5,-(a7)
[0003442a] 2648                      movea.l    a0,a3
[0003442c] 2449                      movea.l    a1,a2
[0003442e] 202a 000e                 move.l     14(a2),d0
[00034432] 4eb9 0001 7fae            jsr        objmalloc
[00034438] 2848                      movea.l    a0,a4
[0003443a] 200c                      move.l     a4,d0
[0003443c] 6606                      bne.s      $00034444
[0003443e] 91c8                      suba.l     a0,a0
[00034440] 6000 016a                 bra        $000345AC
[00034444] 296a 000e 000e            move.l     14(a2),14(a4)
[0003444a] 2a6c 0004                 movea.l    4(a4),a5
[0003444e] 202a 000e                 move.l     14(a2),d0
[00034452] 226a 0004                 movea.l    4(a2),a1
[00034456] 204d                      movea.l    a5,a0
[00034458] 4eb9 0008 3500            jsr        memcpy
[0003445e] 224d                      movea.l    a5,a1
[00034460] 204b                      movea.l    a3,a0
[00034462] 6100 ffac                 bsr.w      copyref
[00034466] 43ed 000c                 lea.l      12(a5),a1
[0003446a] 204b                      movea.l    a3,a0
[0003446c] 6100 ffa2                 bsr.w      copyref
[00034470] 43ed 0004                 lea.l      4(a5),a1
[00034474] 204b                      movea.l    a3,a0
[00034476] 6100 ff98                 bsr.w      copyref
[0003447a] 43ed 0008                 lea.l      8(a5),a1
[0003447e] 204b                      movea.l    a3,a0
[00034480] 6100 ff8e                 bsr.w      copyref
[00034484] 202d 0014                 move.l     20(a5),d0
[00034488] 670e                      beq.s      $00034498
[0003448a] 2240                      movea.l    d0,a1
[0003448c] 204b                      movea.l    a3,a0
[0003448e] 4eb9 0003 59de            jsr        add_object
[00034494] 2b48 0014                 move.l     a0,20(a5)
[00034498] 202d 0018                 move.l     24(a5),d0
[0003449c] 670e                      beq.s      $000344AC
[0003449e] 2240                      movea.l    d0,a1
[000344a0] 204b                      movea.l    a3,a0
[000344a2] 4eb9 0003 59de            jsr        add_object
[000344a8] 2b48 0018                 move.l     a0,24(a5)
[000344ac] 226d 004a                 movea.l    74(a5),a1
[000344b0] 204b                      movea.l    a3,a0
[000344b2] 4eb9 0003 5f3e            jsr        add_string
[000344b8] 2b48 004a                 move.l     a0,74(a5)
[000344bc] 226d 004e                 movea.l    78(a5),a1
[000344c0] 204b                      movea.l    a3,a0
[000344c2] 4eb9 0003 5f3e            jsr        add_string
[000344c8] 2b48 004e                 move.l     a0,78(a5)
[000344cc] 202d 005a                 move.l     90(a5),d0
[000344d0] 670e                      beq.s      $000344E0
[000344d2] 2240                      movea.l    d0,a1
[000344d4] 204b                      movea.l    a3,a0
[000344d6] 4eb9 0003 4754            jsr        add_icon
[000344dc] 2b48 005a                 move.l     a0,90(a5)
[000344e0] 202d 005e                 move.l     94(a5),d0
[000344e4] 670e                      beq.s      $000344F4
[000344e6] 2240                      movea.l    d0,a1
[000344e8] 204b                      movea.l    a3,a0
[000344ea] 4eb9 0003 5770            jsr        add_men
[000344f0] 2b48 005e                 move.l     a0,94(a5)
[000344f4] 43ed 0010                 lea.l      16(a5),a1
[000344f8] 204b                      movea.l    a3,a0
[000344fa] 6100 ff14                 bsr        copyref
[000344fe] 43ed 0062                 lea.l      98(a5),a1
[00034502] 204b                      movea.l    a3,a0
[00034504] 6100 ff0a                 bsr        copyref
[00034508] 43ed 0066                 lea.l      102(a5),a1
[0003450c] 204b                      movea.l    a3,a0
[0003450e] 6100 ff00                 bsr        copyref
[00034512] 43ed 006a                 lea.l      106(a5),a1
[00034516] 204b                      movea.l    a3,a0
[00034518] 6100 fef6                 bsr        copyref
[0003451c] 43ed 006e                 lea.l      110(a5),a1
[00034520] 204b                      movea.l    a3,a0
[00034522] 6100 feec                 bsr        copyref
[00034526] 43ed 0072                 lea.l      114(a5),a1
[0003452a] 204b                      movea.l    a3,a0
[0003452c] 6100 fee2                 bsr        copyref
[00034530] 43ed 0076                 lea.l      118(a5),a1
[00034534] 204b                      movea.l    a3,a0
[00034536] 6100 fed8                 bsr        copyref
[0003453a] 43ed 007a                 lea.l      122(a5),a1
[0003453e] 204b                      movea.l    a3,a0
[00034540] 6100 fece                 bsr        copyref
[00034544] 43ed 007e                 lea.l      126(a5),a1
[00034548] 204b                      movea.l    a3,a0
[0003454a] 6100 fec4                 bsr        copyref
[0003454e] 43ed 0082                 lea.l      130(a5),a1
[00034552] 204b                      movea.l    a3,a0
[00034554] 6100 feba                 bsr        copyref
[00034558] 43ed 0086                 lea.l      134(a5),a1
[0003455c] 204b                      movea.l    a3,a0
[0003455e] 6100 feb0                 bsr        copyref
[00034562] 43ed 008a                 lea.l      138(a5),a1
[00034566] 204b                      movea.l    a3,a0
[00034568] 6100 fea6                 bsr        copyref
[0003456c] 43ed 008e                 lea.l      142(a5),a1
[00034570] 204b                      movea.l    a3,a0
[00034572] 6100 fe9c                 bsr        copyref
[00034576] 43ed 0092                 lea.l      146(a5),a1
[0003457a] 204b                      movea.l    a3,a0
[0003457c] 6100 fe92                 bsr        copyref
[00034580] 43ed 0096                 lea.l      150(a5),a1
[00034584] 204b                      movea.l    a3,a0
[00034586] 6100 fe88                 bsr        copyref
[0003458a] 226d 009e                 movea.l    158(a5),a1
[0003458e] 204b                      movea.l    a3,a0
[00034590] 4eb9 0003 5f3e            jsr        add_string
[00034596] 2b48 009e                 move.l     a0,158(a5)
[0003459a] 226d 009a                 movea.l    154(a5),a1
[0003459e] 204b                      movea.l    a3,a0
[000345a0] 4eb9 0003 5f3e            jsr        add_string
[000345a6] 2b48 009a                 move.l     a0,154(a5)
[000345aa] 204c                      movea.l    a4,a0
[000345ac] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[000345b0] 4e75                      rts
delref:
[000345b2] 2f0a                      move.l     a2,-(a7)
[000345b4] 2449                      movea.l    a1,a2
[000345b6] 2011                      move.l     (a1),d0
[000345b8] 6708                      beq.s      $000345C2
[000345ba] 2240                      movea.l    d0,a1
[000345bc] 4eb9 0003 5dae            jsr        del_ref
[000345c2] 245f                      movea.l    (a7)+,a2
[000345c4] 4e75                      rts
del_window:
[000345c6] 48e7 003c                 movem.l    a2-a5,-(a7)
[000345ca] 2848                      movea.l    a0,a4
[000345cc] 2449                      movea.l    a1,a2
[000345ce] 536a 0036                 subq.w     #1,54(a2)
[000345d2] 302a 0036                 move.w     54(a2),d0
[000345d6] 6e00 0164                 bgt        $0003473C
[000345da] 266a 0012                 movea.l    18(a2),a3
[000345de] 220b                      move.l     a3,d1
[000345e0] 670c                      beq.s      $000345EE
[000345e2] 2a6b 0004                 movea.l    4(a3),a5
[000345e6] 204b                      movea.l    a3,a0
[000345e8] 7002                      moveq.l    #2,d0
[000345ea] 93c9                      suba.l     a1,a1
[000345ec] 4e95                      jsr        (a5)
[000345ee] 266a 0004                 movea.l    4(a2),a3
[000345f2] 224b                      movea.l    a3,a1
[000345f4] 204c                      movea.l    a4,a0
[000345f6] 6100 ffba                 bsr.w      delref
[000345fa] 43eb 000c                 lea.l      12(a3),a1
[000345fe] 204c                      movea.l    a4,a0
[00034600] 6100 ffb0                 bsr.w      delref
[00034604] 43eb 0004                 lea.l      4(a3),a1
[00034608] 204c                      movea.l    a4,a0
[0003460a] 6100 ffa6                 bsr.w      delref
[0003460e] 43eb 0008                 lea.l      8(a3),a1
[00034612] 204c                      movea.l    a4,a0
[00034614] 6100 ff9c                 bsr.w      delref
[00034618] 202b 0014                 move.l     20(a3),d0
[0003461c] 670a                      beq.s      $00034628
[0003461e] 2240                      movea.l    d0,a1
[00034620] 204c                      movea.l    a4,a0
[00034622] 4eb9 0003 5aa2            jsr        del_object
[00034628] 202b 0018                 move.l     24(a3),d0
[0003462c] 670a                      beq.s      $00034638
[0003462e] 2240                      movea.l    d0,a1
[00034630] 204c                      movea.l    a4,a0
[00034632] 4eb9 0003 5aa2            jsr        del_object
[00034638] 226b 004a                 movea.l    74(a3),a1
[0003463c] 204c                      movea.l    a4,a0
[0003463e] 4eb9 0003 6108            jsr        del_string
[00034644] 226b 004e                 movea.l    78(a3),a1
[00034648] 204c                      movea.l    a4,a0
[0003464a] 4eb9 0003 6108            jsr        del_string
[00034650] 202b 005a                 move.l     90(a3),d0
[00034654] 670a                      beq.s      $00034660
[00034656] 2240                      movea.l    d0,a1
[00034658] 204c                      movea.l    a4,a0
[0003465a] 4eb9 0003 4b40            jsr        del_icon
[00034660] 202b 005e                 move.l     94(a3),d0
[00034664] 670a                      beq.s      $00034670
[00034666] 2240                      movea.l    d0,a1
[00034668] 204c                      movea.l    a4,a0
[0003466a] 4eb9 0003 5834            jsr        del_men
[00034670] 43eb 0010                 lea.l      16(a3),a1
[00034674] 204c                      movea.l    a4,a0
[00034676] 6100 ff3a                 bsr        delref
[0003467a] 43eb 0062                 lea.l      98(a3),a1
[0003467e] 204c                      movea.l    a4,a0
[00034680] 6100 ff30                 bsr        delref
[00034684] 43eb 0066                 lea.l      102(a3),a1
[00034688] 204c                      movea.l    a4,a0
[0003468a] 6100 ff26                 bsr        delref
[0003468e] 43eb 006a                 lea.l      106(a3),a1
[00034692] 204c                      movea.l    a4,a0
[00034694] 6100 ff1c                 bsr        delref
[00034698] 43eb 006e                 lea.l      110(a3),a1
[0003469c] 204c                      movea.l    a4,a0
[0003469e] 6100 ff12                 bsr        delref
[000346a2] 43eb 0072                 lea.l      114(a3),a1
[000346a6] 204c                      movea.l    a4,a0
[000346a8] 6100 ff08                 bsr        delref
[000346ac] 43eb 0076                 lea.l      118(a3),a1
[000346b0] 204c                      movea.l    a4,a0
[000346b2] 6100 fefe                 bsr        delref
[000346b6] 43eb 007a                 lea.l      122(a3),a1
[000346ba] 204c                      movea.l    a4,a0
[000346bc] 6100 fef4                 bsr        delref
[000346c0] 43eb 007e                 lea.l      126(a3),a1
[000346c4] 204c                      movea.l    a4,a0
[000346c6] 6100 feea                 bsr        delref
[000346ca] 43eb 0082                 lea.l      130(a3),a1
[000346ce] 204c                      movea.l    a4,a0
[000346d0] 6100 fee0                 bsr        delref
[000346d4] 43eb 0086                 lea.l      134(a3),a1
[000346d8] 204c                      movea.l    a4,a0
[000346da] 6100 fed6                 bsr        delref
[000346de] 43eb 008a                 lea.l      138(a3),a1
[000346e2] 204c                      movea.l    a4,a0
[000346e4] 6100 fecc                 bsr        delref
[000346e8] 43eb 008e                 lea.l      142(a3),a1
[000346ec] 204c                      movea.l    a4,a0
[000346ee] 6100 fec2                 bsr        delref
[000346f2] 43eb 0092                 lea.l      146(a3),a1
[000346f6] 204c                      movea.l    a4,a0
[000346f8] 6100 feb8                 bsr        delref
[000346fc] 43eb 0096                 lea.l      150(a3),a1
[00034700] 204c                      movea.l    a4,a0
[00034702] 6100 feae                 bsr        delref
[00034706] 202b 009e                 move.l     158(a3),d0
[0003470a] 670a                      beq.s      $00034716
[0003470c] 2240                      movea.l    d0,a1
[0003470e] 204c                      movea.l    a4,a0
[00034710] 4eb9 0003 6108            jsr        del_string
[00034716] 202b 009a                 move.l     154(a3),d0
[0003471a] 670a                      beq.s      $00034726
[0003471c] 2240                      movea.l    d0,a1
[0003471e] 204c                      movea.l    a4,a0
[00034720] 4eb9 0003 6108            jsr        del_string
[00034726] 224a                      movea.l    a2,a1
[00034728] 206c 0014                 movea.l    20(a4),a0
[0003472c] 4eb9 0003 3420            jsr        del_entry
[00034732] 224a                      movea.l    a2,a1
[00034734] 204c                      movea.l    a4,a0
[00034736] 4eb9 0001 7f52            jsr        objfree
[0003473c] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00034740] 4e75                      rts
new_work:
[00034742] 303c 2717                 move.w     #$2717,d0
[00034746] 2279 000b 79c8            movea.l    $000B79C8,a1
[0003474c] 4eb9 0003 3dd6            jsr        work_icon
[00034752] 4e75                      rts
