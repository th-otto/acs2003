acs_closewi:
[00018230] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00018234] 2648                      movea.l    a0,a3
[00018236] 3600                      move.w     d0,d3
[00018238] 246b 0144                 movea.l    324(a3),a2
[0001823c] 220a                      move.l     a2,d1
[0001823e] 670c                      beq.s      acs_closewi_1
[00018240] 93c9                      suba.l     a1,a1
[00018242] 286a 0004                 movea.l    4(a2),a4
[00018246] 204a                      movea.l    a2,a0
[00018248] 7002                      moveq.l    #2,d0
[0001824a] 4e94                      jsr        (a4)
acs_closewi_1:
[0001824c] 4a43                      tst.w      d3
[0001824e] 6714                      beq.s      acs_closewi_2
[00018250] 246b 0148                 movea.l    328(a3),a2
[00018254] 200a                      move.l     a2,d0
[00018256] 670c                      beq.s      acs_closewi_2
[00018258] 93c9                      suba.l     a1,a1
[0001825a] 7002                      moveq.l    #2,d0
[0001825c] 204a                      movea.l    a2,a0
[0001825e] 286a 0004                 movea.l    4(a2),a4
[00018262] 4e94                      jsr        (a4)
acs_closewi_2:
[00018264] 266b 0010                 movea.l    16(a3),a3
[00018268] 6022                      bra.s      acs_closewi_3
[0001826a] 246b 0012                 movea.l    18(a3),a2
acs_closewi_5:
[0001826e] 200a                      move.l     a2,d0
[00018270] 6718                      beq.s      acs_closewi_4
[00018272] 93c9                      suba.l     a1,a1
[00018274] 204a                      movea.l    a2,a0
[00018276] 286a 0004                 movea.l    4(a2),a4
[0001827a] 7002                      moveq.l    #2,d0
[0001827c] 4e94                      jsr        (a4)
[0001827e] 4eb9 0004 b086            jsr        Aev_mess
[00018284] 4eb9 0004 b086            jsr        Aev_mess
acs_closewi_4:
[0001828a] 2653                      movea.l    (a3),a3
acs_closewi_3:
[0001828c] 200b                      move.l     a3,d0
[0001828e] 66da                      bne.s      acs_closewi_5
[00018290] 4eb9 0004 b086            jsr        Aev_mess
[00018296] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001829a] 4e75                      rts

assert_error:
[0001829c] 4a40                      tst.w      d0
[0001829e] 670c                      beq.s      assert_error_1
[000182a0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000182a6] 2269 03d6                 movea.l    982(a1),a1
[000182aa] 4e91                      jsr        (a1)
assert_error_1:
[000182ac] 7001                      moveq.l    #1,d0
[000182ae] 41f9 000e 772c            lea.l      err_jmp,a0
[000182b4] 4eb9 0008 1098            jsr        longjmp
[000182ba] 4e75                      rts

set_handle:
[000182bc] 41f9 000e 772c            lea.l      err_jmp,a0
[000182c2] 7200                      moveq.l    #0,d1
[000182c4] 2141 0032                 move.l     d1,50(a0)
[000182c8] 2141 0036                 move.l     d1,54(a0)
[000182cc] 3140 0030                 move.w     d0,48(a0)
[000182d0] 4e75                      rts

save_buf:
[000182d2] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[000182d6] 2648                      movea.l    a0,a3
[000182d8] 2600                      move.l     d0,d3
[000182da] 45f9 000e 775e            lea.l      bpos,a2
[000182e0] 2012                      move.l     (a2),d0
[000182e2] d083                      add.l      d3,d0
[000182e4] b0bc 0002 0000            cmp.l      #$00020000,d0
[000182ea] 6d34                      blt.s      save_buf_1
[000182ec] 41ea 0808                 lea.l      2056(a2),a0
[000182f0] 2212                      move.l     (a2),d1
[000182f2] 302a fffe                 move.w     -2(a2),d0
[000182f6] 4eb9 0008 0d5e            jsr        Fwrite
[000182fc] 2800                      move.l     d0,d4
[000182fe] b092                      cmp.l      (a2),d0
[00018300] 6c1c                      bge.s      save_buf_2
[00018302] 91c8                      suba.l     a0,a0
[00018304] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001830a] 2269 03d6                 movea.l    982(a1),a1
[0001830e] 700a                      moveq.l    #10,d0
[00018310] 4e91                      jsr        (a1)
[00018312] 7001                      moveq.l    #1,d0
[00018314] 41ea ffce                 lea.l      -50(a2),a0
[00018318] 4eb9 0008 1098            jsr        longjmp
save_buf_2:
[0001831e] 4292                      clr.l      (a2)
save_buf_1:
[00018320] b6bc 0002 0000            cmp.l      #$00020000,d3
[00018326] 6f32                      ble.s      save_buf_3
[00018328] 204b                      movea.l    a3,a0
[0001832a] 2203                      move.l     d3,d1
[0001832c] 302a fffe                 move.w     -2(a2),d0
[00018330] 4eb9 0008 0d5e            jsr        Fwrite
[00018336] 2800                      move.l     d0,d4
[00018338] b680                      cmp.l      d0,d3
[0001833a] 6f32                      ble.s      save_buf_4
[0001833c] 91c8                      suba.l     a0,a0
[0001833e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00018344] 2269 03d6                 movea.l    982(a1),a1
[00018348] 700a                      moveq.l    #10,d0
[0001834a] 4e91                      jsr        (a1)
[0001834c] 7001                      moveq.l    #1,d0
[0001834e] 41ea ffce                 lea.l      -50(a2),a0
[00018352] 4eb9 0008 1098            jsr        longjmp
[00018358] 6014                      bra.s      save_buf_4
save_buf_3:
[0001835a] 2003                      move.l     d3,d0
[0001835c] 224b                      movea.l    a3,a1
[0001835e] 2212                      move.l     (a2),d1
[00018360] 41ea 0808                 lea.l      2056(a2),a0
[00018364] d1c1                      adda.l     d1,a0
[00018366] 4eb9 0008 3500            jsr        memcpy
[0001836c] d792                      add.l      d3,(a2)
save_buf_4:
[0001836e] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[00018372] 4e75                      rts

save_string:
[00018374] 2f0a                      move.l     a2,-(a7)
[00018376] 2448                      movea.l    a0,a2
[00018378] 4eb9 0008 2f6c            jsr        strlen
[0001837e] 204a                      movea.l    a2,a0
[00018380] 6100 ff50                 bsr        save_buf
[00018384] 245f                      movea.l    (a7)+,a2
[00018386] 4e75                      rts

close_buf:
[00018388] 2f0a                      move.l     a2,-(a7)
[0001838a] 45f9 000e 775e            lea.l      bpos,a2
[00018390] 2012                      move.l     (a2),d0
[00018392] 6f30                      ble.s      close_buf_1
[00018394] 41ea 0808                 lea.l      2056(a2),a0
[00018398] 2200                      move.l     d0,d1
[0001839a] 302a fffe                 move.w     -2(a2),d0
[0001839e] 4eb9 0008 0d5e            jsr        Fwrite
[000183a4] b092                      cmp.l      (a2),d0
[000183a6] 6c1c                      bge.s      close_buf_1
[000183a8] 91c8                      suba.l     a0,a0
[000183aa] 700a                      moveq.l    #10,d0
[000183ac] 2279 0010 ee4e            movea.l    ACSblk,a1
[000183b2] 2269 03d6                 movea.l    982(a1),a1
[000183b6] 4e91                      jsr        (a1)
[000183b8] 7001                      moveq.l    #1,d0
[000183ba] 41ea ffce                 lea.l      -50(a2),a0
[000183be] 4eb9 0008 1098            jsr        longjmp
close_buf_1:
[000183c4] 245f                      movea.l    (a7)+,a2
[000183c6] 4e75                      rts

read_buf:
[000183c8] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[000183cc] 2648                      movea.l    a0,a3
[000183ce] 2600                      move.l     d0,d3
[000183d0] 45f9 000e 7762            lea.l      bfill,a2
[000183d6] 202a fffc                 move.l     -4(a2),d0
[000183da] d083                      add.l      d3,d0
[000183dc] b092                      cmp.l      (a2),d0
[000183de] 6f00 0098                 ble        read_buf_1
[000183e2] 2812                      move.l     (a2),d4
[000183e4] 98aa fffc                 sub.l      -4(a2),d4
[000183e8] 4a84                      tst.l      d4
[000183ea] 6f14                      ble.s      read_buf_2
[000183ec] 222a fffc                 move.l     -4(a2),d1
[000183f0] 43ea 0804                 lea.l      2052(a2),a1
[000183f4] d3c1                      adda.l     d1,a1
[000183f6] 204b                      movea.l    a3,a0
[000183f8] 2004                      move.l     d4,d0
[000183fa] 4eb9 0008 3500            jsr        memcpy
read_buf_2:
[00018400] 42aa fffc                 clr.l      -4(a2)
[00018404] 9684                      sub.l      d4,d3
[00018406] d7c4                      adda.l     d4,a3
[00018408] b6bc 0002 0000            cmp.l      #$00020000,d3
[0001840e] 6d32                      blt.s      read_buf_3
[00018410] 204b                      movea.l    a3,a0
[00018412] 2203                      move.l     d3,d1
[00018414] 302a fffa                 move.w     -6(a2),d0
[00018418] 4eb9 0008 0cd2            jsr        Fread
[0001841e] 2480                      move.l     d0,(a2)
[00018420] b680                      cmp.l      d0,d3
[00018422] 676c                      beq.s      read_buf_4
[00018424] 91c8                      suba.l     a0,a0
[00018426] 2279 0010 ee4e            movea.l    ACSblk,a1
[0001842c] 2269 03d6                 movea.l    982(a1),a1
[00018430] 700b                      moveq.l    #11,d0
[00018432] 4e91                      jsr        (a1)
[00018434] 7001                      moveq.l    #1,d0
[00018436] 41ea ffca                 lea.l      -54(a2),a0
[0001843a] 4eb9 0008 1098            jsr        longjmp
[00018440] 604e                      bra.s      read_buf_4
read_buf_3:
[00018442] 41ea 0804                 lea.l      2052(a2),a0
[00018446] 223c 0002 0000            move.l     #$00020000,d1
[0001844c] 302a fffa                 move.w     -6(a2),d0
[00018450] 4eb9 0008 0cd2            jsr        Fread
[00018456] 2480                      move.l     d0,(a2)
[00018458] b680                      cmp.l      d0,d3
[0001845a] 6f1c                      ble.s      read_buf_1
[0001845c] 91c8                      suba.l     a0,a0
[0001845e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00018464] 2269 03d6                 movea.l    982(a1),a1
[00018468] 700b                      moveq.l    #11,d0
[0001846a] 4e91                      jsr        (a1)
[0001846c] 7001                      moveq.l    #1,d0
[0001846e] 41ea ffca                 lea.l      -54(a2),a0
[00018472] 4eb9 0008 1098            jsr        longjmp
read_buf_1:
[00018478] 2003                      move.l     d3,d0
[0001847a] 222a fffc                 move.l     -4(a2),d1
[0001847e] 43ea 0804                 lea.l      2052(a2),a1
[00018482] d3c1                      adda.l     d1,a1
[00018484] 204b                      movea.l    a3,a0
[00018486] 4eb9 0008 3500            jsr        memcpy
[0001848c] d7aa fffc                 add.l      d3,-4(a2)
read_buf_4:
[00018490] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[00018494] 4e75                      rts

save_acs:
[00018496] 2f0a                      move.l     a2,-(a7)
[00018498] 2448                      movea.l    a0,a2
[0001849a] 42b9 000e 775e            clr.l      bpos
[000184a0] 6100 fe1a                 bsr        set_handle
[000184a4] 4eb9 0008 108e            jsr        setjmp
[000184aa] 4a40                      tst.w      d0
[000184ac] 670a                      beq.s      save_acs_1
[000184ae] 204a                      movea.l    a2,a0
[000184b0] 4eb9 0001 7274            jsr        unfix_all
[000184b6] 600c                      bra.s      save_acs_2
save_acs_1:
[000184b8] 204a                      movea.l    a2,a0
[000184ba] 4eb9 0001 6fdc            jsr        fix_all
[000184c0] 4a40                      tst.w      d0
[000184c2] 6610                      bne.s      save_acs_3
save_acs_2:
[000184c4] 3039 000e 775c            move.w     handle,d0
[000184ca] 4eb9 0008 0c7e            jsr        Fclose
[000184d0] 70ff                      moveq.l    #-1,d0
[000184d2] 603c                      bra.s      save_acs_4
save_acs_3:
[000184d4] 204a                      movea.l    a2,a0
[000184d6] 4eb9 0001 74a2            jsr        wr_all
[000184dc] 6100 feaa                 bsr        close_buf
[000184e0] 026a fffe 0006            andi.w     #$FFFE,6(a2)
[000184e6] 204a                      movea.l    a2,a0
[000184e8] 4eb9 0001 7274            jsr        unfix_all
[000184ee] 3039 000e 775c            move.w     handle,d0
[000184f4] 4eb9 0008 0c7e            jsr        Fclose
[000184fa] 206a 0008                 movea.l    8(a2),a0
[000184fe] 4eb9 0006 1fe0            jsr        Aev_OlgaUpdate
[00018504] 206a 0008                 movea.l    8(a2),a0
[00018508] 4eb9 0006 056e            jsr        Aev_DhstSaved
[0001850e] 4240                      clr.w      d0
save_acs_4:
[00018510] 245f                      movea.l    (a7)+,a2
[00018512] 4e75                      rts

init_acs:
[00018514] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00018518] 2448                      movea.l    a0,a2
[0001851a] 49f9 000a 5050            lea.l      ml_title,a4
[00018520] 296a 0008 0020            move.l     8(a2),32(a4)
[00018526] 203c 0000 0262            move.l     #$00000262,d0
[0001852c] 43ec 0018                 lea.l      24(a4),a1
[00018530] 204a                      movea.l    a2,a0
[00018532] 4eb9 0008 3500            jsr        memcpy
[00018538] 203c 0000 0080            move.l     #$00000080,d0
[0001853e] 204a                      movea.l    a2,a0
[00018540] 4eb9 0001 7fae            jsr        objmalloc
[00018546] 2548 0014                 move.l     a0,20(a2)
[0001854a] 47f9 000a 534e            lea.l      $000A534E,a3
[00018550] 4853                      pea.l      (a3)
[00018552] 4879 000a 79c7            pea.l      wi_obj
[00018558] 226a 0014                 movea.l    20(a2),a1
[0001855c] 204a                      movea.l    a2,a0
[0001855e] 4eb9 0001 81c6            jsr        objname
[00018564] 504f                      addq.w     #8,a7
[00018566] 203c 0000 0080            move.l     #$00000080,d0
[0001856c] 204a                      movea.l    a2,a0
[0001856e] 4eb9 0001 7fae            jsr        objmalloc
[00018574] 2548 001c                 move.l     a0,28(a2)
[00018578] 4853                      pea.l      (a3)
[0001857a] 4879 000a 7936            pea.l      me_obj
[00018580] 2248                      movea.l    a0,a1
[00018582] 204a                      movea.l    a2,a0
[00018584] 4eb9 0001 81c6            jsr        objname
[0001858a] 504f                      addq.w     #8,a7
[0001858c] 203c 0000 0080            move.l     #$00000080,d0
[00018592] 204a                      movea.l    a2,a0
[00018594] 4eb9 0001 7fae            jsr        objmalloc
[0001859a] 2548 0020                 move.l     a0,32(a2)
[0001859e] 4853                      pea.l      (a3)
[000185a0] 4879 000a 7989            pea.l      pu_obj
[000185a6] 2248                      movea.l    a0,a1
[000185a8] 204a                      movea.l    a2,a0
[000185aa] 4eb9 0001 81c6            jsr        objname
[000185b0] 504f                      addq.w     #8,a7
[000185b2] 203c 0000 0080            move.l     #$00000080,d0
[000185b8] 204a                      movea.l    a2,a0
[000185ba] 4eb9 0001 7fae            jsr        objmalloc
[000185c0] 2548 0018                 move.l     a0,24(a2)
[000185c4] 4853                      pea.l      (a3)
[000185c6] 4879 000a 7979            pea.l      ob_obj
[000185cc] 2248                      movea.l    a0,a1
[000185ce] 204a                      movea.l    a2,a0
[000185d0] 4eb9 0001 81c6            jsr        objname
[000185d6] 504f                      addq.w     #8,a7
[000185d8] 203c 0000 0080            move.l     #$00000080,d0
[000185de] 204a                      movea.l    a2,a0
[000185e0] 4eb9 0001 7fae            jsr        objmalloc
[000185e6] 2548 0024                 move.l     a0,36(a2)
[000185ea] 4853                      pea.l      (a3)
[000185ec] 4879 000a 790c            pea.l      al_obj
[000185f2] 2248                      movea.l    a0,a1
[000185f4] 204a                      movea.l    a2,a0
[000185f6] 4eb9 0001 81c6            jsr        objname
[000185fc] 504f                      addq.w     #8,a7
[000185fe] 203c 0000 0080            move.l     #$00000080,d0
[00018604] 204a                      movea.l    a2,a0
[00018606] 4eb9 0001 7fae            jsr        objmalloc
[0001860c] 2548 0028                 move.l     a0,40(a2)
[00018610] 4853                      pea.l      (a3)
[00018612] 4879 000a 79ad            pea.l      te_obj
[00018618] 2248                      movea.l    a0,a1
[0001861a] 204a                      movea.l    a2,a0
[0001861c] 4eb9 0001 81c6            jsr        objname
[00018622] 504f                      addq.w     #8,a7
[00018624] 203c 0000 0080            move.l     #$00000080,d0
[0001862a] 204a                      movea.l    a2,a0
[0001862c] 4eb9 0001 7fae            jsr        objmalloc
[00018632] 2548 002c                 move.l     a0,44(a2)
[00018636] 4853                      pea.l      (a3)
[00018638] 4879 000a 7917            pea.l      ic_obj
[0001863e] 2248                      movea.l    a0,a1
[00018640] 204a                      movea.l    a2,a0
[00018642] 4eb9 0001 81c6            jsr        objname
[00018648] 504f                      addq.w     #8,a7
[0001864a] 203c 0000 0080            move.l     #$00000080,d0
[00018650] 204a                      movea.l    a2,a0
[00018652] 4eb9 0001 7fae            jsr        objmalloc
[00018658] 2548 0030                 move.l     a0,48(a2)
[0001865c] 4853                      pea.l      (a3)
[0001865e] 4879 000a 792b            pea.l      im_obj
[00018664] 2248                      movea.l    a0,a1
[00018666] 204a                      movea.l    a2,a0
[00018668] 4eb9 0001 81c6            jsr        objname
[0001866e] 504f                      addq.w     #8,a7
[00018670] 203c 0000 0080            move.l     #$00000080,d0
[00018676] 204a                      movea.l    a2,a0
[00018678] 4eb9 0001 7fae            jsr        objmalloc
[0001867e] 2548 0034                 move.l     a0,52(a2)
[00018682] 4853                      pea.l      (a3)
[00018684] 4879 000a 79a3            pea.l      st_obj
[0001868a] 2248                      movea.l    a0,a1
[0001868c] 204a                      movea.l    a2,a0
[0001868e] 4eb9 0001 81c6            jsr        objname
[00018694] 504f                      addq.w     #8,a7
[00018696] 203c 0000 0080            move.l     #$00000080,d0
[0001869c] 204a                      movea.l    a2,a0
[0001869e] 4eb9 0001 7fae            jsr        objmalloc
[000186a4] 2548 0038                 move.l     a0,56(a2)
[000186a8] 4853                      pea.l      (a3)
[000186aa] 4879 000a 79ba            pea.l      us_obj
[000186b0] 2248                      movea.l    a0,a1
[000186b2] 204a                      movea.l    a2,a0
[000186b4] 4eb9 0001 81c6            jsr        objname
[000186ba] 504f                      addq.w     #8,a7
[000186bc] 203c 0000 0080            move.l     #$00000080,d0
[000186c2] 204a                      movea.l    a2,a0
[000186c4] 4eb9 0001 7fae            jsr        objmalloc
[000186ca] 2548 003c                 move.l     a0,60(a2)
[000186ce] 4853                      pea.l      (a3)
[000186d0] 4879 000a 7994            pea.l      rf_obj
[000186d6] 2248                      movea.l    a0,a1
[000186d8] 204a                      movea.l    a2,a0
[000186da] 4eb9 0001 81c6            jsr        objname
[000186e0] 504f                      addq.w     #8,a7
[000186e2] 203c 0000 0080            move.l     #$00000080,d0
[000186e8] 204a                      movea.l    a2,a0
[000186ea] 4eb9 0001 7fae            jsr        objmalloc
[000186f0] 2548 0040                 move.l     a0,64(a2)
[000186f4] 4853                      pea.l      (a3)
[000186f6] 4879 000a 7940            pea.l      mf_obj
[000186fc] 2248                      movea.l    a0,a1
[000186fe] 204a                      movea.l    a2,a0
[00018700] 4eb9 0001 81c6            jsr        objname
[00018706] 504f                      addq.w     #8,a7
[00018708] 203c 0000 0080            move.l     #$00000080,d0
[0001870e] 204a                      movea.l    a2,a0
[00018710] 4eb9 0001 7fae            jsr        objmalloc
[00018716] 2548 0044                 move.l     a0,68(a2)
[0001871a] 4853                      pea.l      (a3)
[0001871c] 4879 000a 7921            pea.l      if_obj
[00018722] 2248                      movea.l    a0,a1
[00018724] 204a                      movea.l    a2,a0
[00018726] 4eb9 0001 81c6            jsr        objname
[0001872c] 504f                      addq.w     #8,a7
[0001872e] 4243                      clr.w      d3
[00018730] 6066                      bra.s      init_acs_1
[00018732] 203c 0000 0080            move.l     #$00000080,d0
init_acs_2:
[00018738] 204a                      movea.l    a2,a0
[0001873a] 4eb9 0001 7fae            jsr        objmalloc
[00018740] 3003                      move.w     d3,d0
[00018742] 48c0                      ext.l      d0
[00018744] e588                      lsl.l      #2,d0
[00018746] 43f2 0800                 lea.l      0(a2,d0.l),a1
[0001874a] 2348 01f6                 move.l     a0,502(a1)
[0001874e] 4853                      pea.l      (a3)
[00018750] 3203                      move.w     d3,d1
[00018752] e549                      lsl.w      #2,d1
[00018754] 2f34 1000                 move.l     0(a4,d1.w),-(a7)
[00018758] 2248                      movea.l    a0,a1
[0001875a] 204a                      movea.l    a2,a0
[0001875c] 4eb9 0001 81c6            jsr        objname
[00018762] 504f                      addq.w     #8,a7
[00018764] 203c 0000 0080            move.l     #$00000080,d0
[0001876a] 204a                      movea.l    a2,a0
[0001876c] 4eb9 0001 7fae            jsr        objmalloc
[00018772] 3003                      move.w     d3,d0
[00018774] 48c0                      ext.l      d0
[00018776] e588                      lsl.l      #2,d0
[00018778] 43f2 0800                 lea.l      0(a2,d0.l),a1
[0001877c] 2348 0202                 move.l     a0,514(a1)
[00018780] 4853                      pea.l      (a3)
[00018782] 3203                      move.w     d3,d1
[00018784] e549                      lsl.w      #2,d1
[00018786] 2f34 100c                 move.l     12(a4,d1.w),-(a7)
[0001878a] 2248                      movea.l    a0,a1
[0001878c] 204a                      movea.l    a2,a0
[0001878e] 4eb9 0001 81c6            jsr        objname
[00018794] 504f                      addq.w     #8,a7
[00018796] 5243                      addq.w     #1,d3
init_acs_1:
[00018798] b67c 0003                 cmp.w      #$0003,d3
[0001879c] 6d94                      blt.s      init_acs_2
[0001879e] 7008                      moveq.l    #8,d0
[000187a0] 2279 0010 ee4e            movea.l    ACSblk,a1
[000187a6] 5049                      addq.w     #8,a1
[000187a8] 41ea 0168                 lea.l      360(a2),a0
[000187ac] 4eb9 0008 3500            jsr        memcpy
[000187b2] 026a fffe 0006            andi.w     #$FFFE,6(a2)
[000187b8] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[000187bc] 4e75                      rts

init_ml_list:
[000187be] 48e7 1c3c                 movem.l    d3-d5/a2-a5,-(a7)
[000187c2] 4fef ffba                 lea.l      -70(a7),a7
[000187c6] 2a48                      movea.l    a0,a5
[000187c8] 286f 0066                 movea.l    102(a7),a4
[000187cc] 41f9 000a 52ca            lea.l      $000A52CA,a0
[000187d2] 45ef 0004                 lea.l      4(a7),a2
[000187d6] 700f                      moveq.l    #15,d0
[000187d8] 24d8                      move.l     (a0)+,(a2)+
init_ml_list_1:
[000187da] 51c8 fffc                 dbf        d0,init_ml_list_1
[000187de] 34d8                      move.w     (a0)+,(a2)+
[000187e0] 2ea9 0004                 move.l     4(a1),(a7)
[000187e4] 2629 000e                 move.l     14(a1),d3
[000187e8] e48b                      lsr.l      #2,d3
[000187ea] 4244                      clr.w      d4
[000187ec] 6012                      bra.s      init_ml_list_2
[000187ee] 3004                      move.w     d4,d0
init_ml_list_3:
[000187f0] 48c0                      ext.l      d0
[000187f2] e588                      lsl.l      #2,d0
[000187f4] 2057                      movea.l    (a7),a0
[000187f6] 2270 0800                 movea.l    0(a0,d0.l),a1
[000187fa] 4229 0033                 clr.b      51(a1)
[000187fe] 5244                      addq.w     #1,d4
init_ml_list_2:
[00018800] b644                      cmp.w      d4,d3
[00018802] 6eea                      bgt.s      init_ml_list_3
[00018804] 4245                      clr.w      d5
[00018806] 6000 00e8                 bra        init_ml_list_4
[0001880a] 3005                      move.w     d5,d0
init_ml_list_11:
[0001880c] 48c0                      ext.l      d0
[0001880e] e588                      lsl.l      #2,d0
[00018810] 2234 0800                 move.l     0(a4,d0.l),d1
[00018814] 6600 00d8                 bne        init_ml_list_5
[00018818] 006d 0001 0006            ori.w      #$0001,6(a5)
[0001881e] 204d                      movea.l    a5,a0
[00018820] 203c 0000 0080            move.l     #$00000080,d0
[00018826] 4eb9 0001 7fae            jsr        objmalloc
[0001882c] 3005                      move.w     d5,d0
[0001882e] 48c0                      ext.l      d0
[00018830] e588                      lsl.l      #2,d0
[00018832] 2988 0800                 move.l     a0,0(a4,d0.l)
[00018836] 2208                      move.l     a0,d1
[00018838] 6608                      bne.s      init_ml_list_6
[0001883a] 7003                      moveq.l    #3,d0
[0001883c] 91c8                      suba.l     a0,a0
[0001883e] 6100 fa5c                 bsr        assert_error
init_ml_list_6:
[00018842] 42a7                      clr.l      -(a7)
[00018844] 3005                      move.w     d5,d0
[00018846] 48c0                      ext.l      d0
[00018848] e588                      lsl.l      #2,d0
[0001884a] 206f 006e                 movea.l    110(a7),a0
[0001884e] 2f30 0800                 move.l     0(a0,d0.l),-(a7)
[00018852] 2274 0800                 movea.l    0(a4,d0.l),a1
[00018856] 204d                      movea.l    a5,a0
[00018858] 4eb9 0001 81c6            jsr        objname
[0001885e] 504f                      addq.w     #8,a7
[00018860] 4244                      clr.w      d4
[00018862] 6000 0084                 bra        init_ml_list_7
[00018866] 3004                      move.w     d4,d0
init_ml_list_10:
[00018868] 48c0                      ext.l      d0
[0001886a] e588                      lsl.l      #2,d0
[0001886c] 2057                      movea.l    (a7),a0
[0001886e] 2670 0800                 movea.l    0(a0,d0.l),a3
[00018872] 2f6b 0004 0008            move.l     4(a3),8(a7)
[00018878] 2f6b 000a 000e            move.l     10(a3),14(a7)
[0001887e] 2f6b 000e 0012            move.l     14(a3),18(a7)
[00018884] 43ef 0004                 lea.l      4(a7),a1
[00018888] 204d                      movea.l    a5,a0
[0001888a] 4eb9 0003 6416            jsr        copy_str
[00018890] 2448                      movea.l    a0,a2
[00018892] 200a                      move.l     a2,d0
[00018894] 6608                      bne.s      init_ml_list_8
[00018896] 7003                      moveq.l    #3,d0
[00018898] 91c8                      suba.l     a0,a0
[0001889a] 6100 fa00                 bsr        assert_error
init_ml_list_8:
[0001889e] 3f05                      move.w     d5,-(a7)
[000188a0] 486b 0016                 pea.l      22(a3)
[000188a4] 43f9 000a 534f            lea.l      $000A534F,a1
[000188aa] 41ea 0016                 lea.l      22(a2),a0
[000188ae] 4eb9 0008 15ac            jsr        sprintf
[000188b4] 5c4f                      addq.w     #6,a7
[000188b6] 42a7                      clr.l      -(a7)
[000188b8] 486a 0016                 pea.l      22(a2)
[000188bc] 224a                      movea.l    a2,a1
[000188be] 204d                      movea.l    a5,a0
[000188c0] 4eb9 0001 81c6            jsr        objname
[000188c6] 504f                      addq.w     #8,a7
[000188c8] 224a                      movea.l    a2,a1
[000188ca] 3005                      move.w     d5,d0
[000188cc] 48c0                      ext.l      d0
[000188ce] e588                      lsl.l      #2,d0
[000188d0] 2074 0800                 movea.l    0(a4,d0.l),a0
[000188d4] 4eb9 0003 33b4            jsr        add_entry
[000188da] 5240                      addq.w     #1,d0
[000188dc] 6608                      bne.s      init_ml_list_9
[000188de] 91c8                      suba.l     a0,a0
[000188e0] 7003                      moveq.l    #3,d0
[000188e2] 6100 f9b8                 bsr        assert_error
init_ml_list_9:
[000188e6] 5244                      addq.w     #1,d4
init_ml_list_7:
[000188e8] b644                      cmp.w      d4,d3
[000188ea] 6e00 ff7a                 bgt        init_ml_list_10
init_ml_list_5:
[000188ee] 5245                      addq.w     #1,d5
init_ml_list_4:
[000188f0] ba7c 0003                 cmp.w      #$0003,d5
[000188f4] 6d00 ff14                 blt        init_ml_list_11
[000188f8] 4fef 0046                 lea.l      70(a7),a7
[000188fc] 4cdf 3c38                 movem.l    (a7)+,d3-d5/a2-a5
[00018900] 4e75                      rts

del_mess:
[00018902] 48e7 182c                 movem.l    d3-d4/a2/a4-a5,-(a7)
[00018906] 4fef ffdc                 lea.l      -36(a7),a7
[0001890a] 2848                      movea.l    a0,a4
[0001890c] 4243                      clr.w      d3
[0001890e] 4eb9 0004 eec0            jsr        Amo_busy
[00018914] 4244                      clr.w      d4
[00018916] 45f9 000a 534e            lea.l      $000A534E,a2
[0001891c] 6042                      bra.s      del_mess_1
[0001891e] 3f04                      move.w     d4,-(a7)
del_mess_3:
[00018920] 43ea 000b                 lea.l      11(a2),a1
[00018924] 41ef 0002                 lea.l      2(a7),a0
[00018928] 4eb9 0008 15ac            jsr        sprintf
[0001892e] 544f                      addq.w     #2,a7
[00018930] 43d7                      lea.l      (a7),a1
[00018932] 206c 0024                 movea.l    36(a4),a0
[00018936] 4eb9 0003 337c            jsr        find_entry
[0001893c] 2a48                      movea.l    a0,a5
[0001893e] 200d                      move.l     a5,d0
[00018940] 671c                      beq.s      del_mess_2
[00018942] 322d 0038                 move.w     56(a5),d1
[00018946] c27c 0100                 and.w      #$0100,d1
[0001894a] 6712                      beq.s      del_mess_2
[0001894c] 026d feff 0038            andi.w     #$FEFF,56(a5)
[00018952] 224d                      movea.l    a5,a1
[00018954] 204c                      movea.l    a4,a0
[00018956] 4eb9 0003 3faa            jsr        del_alert
[0001895c] 7601                      moveq.l    #1,d3
del_mess_2:
[0001895e] 5244                      addq.w     #1,d4
del_mess_1:
[00018960] b87c 001e                 cmp.w      #$001E,d4
[00018964] 6db8                      blt.s      del_mess_3
[00018966] 6042                      bra.s      del_mess_4
[00018968] 3f04                      move.w     d4,-(a7)
del_mess_6:
[0001896a] 43ea 000b                 lea.l      11(a2),a1
[0001896e] 41ef 0002                 lea.l      2(a7),a0
[00018972] 4eb9 0008 15ac            jsr        sprintf
[00018978] 544f                      addq.w     #2,a7
[0001897a] 43d7                      lea.l      (a7),a1
[0001897c] 206c 0034                 movea.l    52(a4),a0
[00018980] 4eb9 0003 337c            jsr        find_entry
[00018986] 2a48                      movea.l    a0,a5
[00018988] 200d                      move.l     a5,d0
[0001898a] 671c                      beq.s      del_mess_5
[0001898c] 322d 0038                 move.w     56(a5),d1
[00018990] c27c 0100                 and.w      #$0100,d1
[00018994] 6712                      beq.s      del_mess_5
[00018996] 026d feff 0038            andi.w     #$FEFF,56(a5)
[0001899c] 224d                      movea.l    a5,a1
[0001899e] 204c                      movea.l    a4,a0
[000189a0] 4eb9 0003 6108            jsr        del_string
[000189a6] 7601                      moveq.l    #1,d3
del_mess_5:
[000189a8] 5244                      addq.w     #1,d4
del_mess_4:
[000189aa] b87c 0022                 cmp.w      #$0022,d4
[000189ae] 6db8                      blt.s      del_mess_6
[000189b0] 4eb9 0004 ef0c            jsr        Amo_unbusy
[000189b6] 4a43                      tst.w      d3
[000189b8] 6706                      beq.s      del_mess_7
[000189ba] 006c 0001 0006            ori.w      #$0001,6(a4)
del_mess_7:
[000189c0] 4fef 0024                 lea.l      36(a7),a7
[000189c4] 4cdf 3418                 movem.l    (a7)+,d3-d4/a2/a4-a5
[000189c8] 4e75                      rts

init_mess:
[000189ca] 48e7 183a                 movem.l    d3-d4/a2-a4/a6,-(a7)
[000189ce] 4fef ff9a                 lea.l      -102(a7),a7
[000189d2] 2648                      movea.l    a0,a3
[000189d4] 45ef 0024                 lea.l      36(a7),a2
[000189d8] 41f9 000a 530c            lea.l      $000A530C,a0
[000189de] 224a                      movea.l    a2,a1
[000189e0] 700f                      moveq.l    #15,d0
[000189e2] 22d8                      move.l     (a0)+,(a1)+
init_mess_1:
[000189e4] 51c8 fffc                 dbf        d0,init_mess_1
[000189e8] 32d8                      move.w     (a0)+,(a1)+
[000189ea] 4243                      clr.w      d3
[000189ec] 302b 0006                 move.w     6(a3),d0
[000189f0] c07c 8000                 and.w      #$8000,d0
[000189f4] 6600 016c                 bne        init_mess_2
[000189f8] 4eb9 0004 eec0            jsr        Amo_busy
[000189fe] 4244                      clr.w      d4
[00018a00] 4df9 0008 af02            lea.l      mlmess,a6
[00018a06] 6000 009e                 bra        init_mess_3
[00018a0a] 3f04                      move.w     d4,-(a7)
init_mess_5:
[00018a0c] 43f9 000a 5359            lea.l      $000A5359,a1
[00018a12] 41ef 0002                 lea.l      2(a7),a0
[00018a16] 4eb9 0008 15ac            jsr        sprintf
[00018a1c] 544f                      addq.w     #2,a7
[00018a1e] 43d7                      lea.l      (a7),a1
[00018a20] 206b 0024                 movea.l    36(a3),a0
[00018a24] 4eb9 0003 337c            jsr        find_entry
[00018a2a] 2008                      move.l     a0,d0
[00018a2c] 6676                      bne.s      init_mess_4
[00018a2e] 3004                      move.w     d4,d0
[00018a30] 48c0                      ext.l      d0
[00018a32] e588                      lsl.l      #2,d0
[00018a34] 2576 0800 0004            move.l     0(a6,d0.l),4(a2)
[00018a3a] 2076 0800                 movea.l    0(a6,d0.l),a0
[00018a3e] 4eb9 0008 2f6c            jsr        strlen
[00018a44] 5280                      addq.l     #1,d0
[00018a46] 2540 000a                 move.l     d0,10(a2)
[00018a4a] 2540 000e                 move.l     d0,14(a2)
[00018a4e] 224a                      movea.l    a2,a1
[00018a50] 204b                      movea.l    a3,a0
[00018a52] 4eb9 0003 3ffe            jsr        copy_alert
[00018a58] 2848                      movea.l    a0,a4
[00018a5a] 200c                      move.l     a4,d0
[00018a5c] 6700 0104                 beq        init_mess_2
[00018a60] 43d7                      lea.l      (a7),a1
[00018a62] 41ec 0016                 lea.l      22(a4),a0
[00018a66] 4eb9 0008 2f0c            jsr        strcpy
[00018a6c] 42a7                      clr.l      -(a7)
[00018a6e] 486c 0016                 pea.l      22(a4)
[00018a72] 224c                      movea.l    a4,a1
[00018a74] 204b                      movea.l    a3,a0
[00018a76] 4eb9 0001 81c6            jsr        objname
[00018a7c] 504f                      addq.w     #8,a7
[00018a7e] 006c 0100 0038            ori.w      #$0100,56(a4)
[00018a84] 224c                      movea.l    a4,a1
[00018a86] 206b 0024                 movea.l    36(a3),a0
[00018a8a] 4eb9 0003 33b4            jsr        add_entry
[00018a90] 5240                      addq.w     #1,d0
[00018a92] 6700 00ce                 beq        init_mess_2
[00018a96] 224c                      movea.l    a4,a1
[00018a98] 7001                      moveq.l    #1,d0
[00018a9a] 204b                      movea.l    a3,a0
[00018a9c] 4eb9 0003 403c            jsr        serv_alert
[00018aa2] 7601                      moveq.l    #1,d3
init_mess_4:
[00018aa4] 5244                      addq.w     #1,d4
init_mess_3:
[00018aa6] b87c 001e                 cmp.w      #$001E,d4
[00018aaa] 6d00 ff5e                 blt        init_mess_5
[00018aae] 6000 009a                 bra        init_mess_6
[00018ab2] 3f04                      move.w     d4,-(a7)
init_mess_8:
[00018ab4] 43f9 000a 5359            lea.l      $000A5359,a1
[00018aba] 41ef 0002                 lea.l      2(a7),a0
[00018abe] 4eb9 0008 15ac            jsr        sprintf
[00018ac4] 544f                      addq.w     #2,a7
[00018ac6] 43d7                      lea.l      (a7),a1
[00018ac8] 206b 0034                 movea.l    52(a3),a0
[00018acc] 4eb9 0003 337c            jsr        find_entry
[00018ad2] 2008                      move.l     a0,d0
[00018ad4] 6672                      bne.s      init_mess_7
[00018ad6] 3004                      move.w     d4,d0
[00018ad8] 48c0                      ext.l      d0
[00018ada] e588                      lsl.l      #2,d0
[00018adc] 2576 0800 0004            move.l     0(a6,d0.l),4(a2)
[00018ae2] 2076 0800                 movea.l    0(a6,d0.l),a0
[00018ae6] 4eb9 0008 2f6c            jsr        strlen
[00018aec] 5280                      addq.l     #1,d0
[00018aee] 2540 000a                 move.l     d0,10(a2)
[00018af2] 2540 000e                 move.l     d0,14(a2)
[00018af6] 224a                      movea.l    a2,a1
[00018af8] 204b                      movea.l    a3,a0
[00018afa] 4eb9 0003 6416            jsr        copy_str
[00018b00] 2848                      movea.l    a0,a4
[00018b02] 200c                      move.l     a4,d0
[00018b04] 675c                      beq.s      init_mess_2
[00018b06] 43d7                      lea.l      (a7),a1
[00018b08] 41ec 0016                 lea.l      22(a4),a0
[00018b0c] 4eb9 0008 2f0c            jsr        strcpy
[00018b12] 42a7                      clr.l      -(a7)
[00018b14] 486c 0016                 pea.l      22(a4)
[00018b18] 224c                      movea.l    a4,a1
[00018b1a] 204b                      movea.l    a3,a0
[00018b1c] 4eb9 0001 81c6            jsr        objname
[00018b22] 504f                      addq.w     #8,a7
[00018b24] 006c 0100 0038            ori.w      #$0100,56(a4)
[00018b2a] 224c                      movea.l    a4,a1
[00018b2c] 206b 0034                 movea.l    52(a3),a0
[00018b30] 4eb9 0003 33b4            jsr        add_entry
[00018b36] 5240                      addq.w     #1,d0
[00018b38] 6728                      beq.s      init_mess_2
[00018b3a] 224c                      movea.l    a4,a1
[00018b3c] 7001                      moveq.l    #1,d0
[00018b3e] 204b                      movea.l    a3,a0
[00018b40] 4eb9 0003 618e            jsr        serv_str
[00018b46] 7601                      moveq.l    #1,d3
init_mess_7:
[00018b48] 5244                      addq.w     #1,d4
init_mess_6:
[00018b4a] b87c 0022                 cmp.w      #$0022,d4
[00018b4e] 6d00 ff62                 blt        init_mess_8
[00018b52] 4eb9 0004 ef0c            jsr        Amo_unbusy
[00018b58] 4a43                      tst.w      d3
[00018b5a] 6706                      beq.s      init_mess_2
[00018b5c] 006b 0001 0006            ori.w      #$0001,6(a3)
init_mess_2:
[00018b62] 4fef 0066                 lea.l      102(a7),a7
[00018b66] 4cdf 5c18                 movem.l    (a7)+,d3-d4/a2-a4/a6
[00018b6a] 4e75                      rts

read_acs:
[00018b6c] 48e7 1830                 movem.l    d3-d4/a2-a3,-(a7)
[00018b70] 4fef fff6                 lea.l      -10(a7),a7
[00018b74] 2600                      move.l     d0,d3
[00018b76] 2448                      movea.l    a0,a2
[00018b78] 3803                      move.w     d3,d4
[00018b7a] 47f9 000a 5068            lea.l      proto,a3
[00018b80] 276a 0008 0008            move.l     8(a2),8(a3)
[00018b86] 203c 0000 0262            move.l     #$00000262,d0
[00018b8c] 224b                      movea.l    a3,a1
[00018b8e] 204a                      movea.l    a2,a0
[00018b90] 4eb9 0008 3500            jsr        memcpy
[00018b96] 42ab 0008                 clr.l      8(a3)
[00018b9a] 4a83                      tst.l      d3
[00018b9c] 6a0a                      bpl.s      read_acs_1
[00018b9e] 204a                      movea.l    a2,a0
[00018ba0] 6100 f972                 bsr        init_acs
[00018ba4] 6000 00fc                 bra        read_acs_2
read_acs_1:
[00018ba8] 43f9 000a 5363            lea.l      $000A5363,a1
[00018bae] 2f09                      move.l     a1,-(a7)
[00018bb0] 226a 0008                 movea.l    8(a2),a1
[00018bb4] 41ef 0004                 lea.l      4(a7),a0
[00018bb8] 4eb9 0004 b758            jsr        Af_2ext
[00018bbe] 225f                      movea.l    (a7)+,a1
[00018bc0] 4eb9 0004 66ea            jsr        Ast_icmp
[00018bc6] 4a40                      tst.w      d0
[00018bc8] 6622                      bne.s      read_acs_3
[00018bca] 3004                      move.w     d4,d0
[00018bcc] 6100 f6ee                 bsr        set_handle
[00018bd0] 4eb9 0008 108e            jsr        setjmp
[00018bd6] 4a40                      tst.w      d0
[00018bd8] 6628                      bne.s      read_acs_4
[00018bda] 204a                      movea.l    a2,a0
[00018bdc] 4eb9 0001 95a4            jsr        read_rsc
[00018be2] 026a fffe 0006            andi.w     #$FFFE,6(a2)
[00018be8] 6000 00b0                 bra        read_acs_5
read_acs_3:
[00018bec] 3004                      move.w     d4,d0
[00018bee] 6100 f6cc                 bsr        set_handle
[00018bf2] 4eb9 0008 108e            jsr        setjmp
[00018bf8] 4a40                      tst.w      d0
[00018bfa] 6714                      beq.s      read_acs_6
[00018bfc] 4eb9 0001 7ec2            jsr        release_err
read_acs_4:
[00018c02] 3004                      move.w     d4,d0
[00018c04] 4eb9 0008 0c7e            jsr        Fclose
[00018c0a] 70ff                      moveq.l    #-1,d0
[00018c0c] 6000 0096                 bra        read_acs_7
read_acs_6:
[00018c10] 204a                      movea.l    a2,a0
[00018c12] 4eb9 0001 7502            jsr        rd_all
[00018c18] 204a                      movea.l    a2,a0
[00018c1a] 4eb9 0001 7274            jsr        unfix_all
[00018c20] 202a 0044                 move.l     68(a2),d0
[00018c24] 662a                      bne.s      read_acs_8
[00018c26] 204a                      movea.l    a2,a0
[00018c28] 203c 0000 0080            move.l     #$00000080,d0
[00018c2e] 4eb9 0001 7fae            jsr        objmalloc
[00018c34] 2548 0044                 move.l     a0,68(a2)
[00018c38] 4879 000a 534e            pea.l      $000A534E
[00018c3e] 4879 000a 7921            pea.l      if_obj
[00018c44] 2248                      movea.l    a0,a1
[00018c46] 204a                      movea.l    a2,a0
[00018c48] 4eb9 0001 81c6            jsr        objname
[00018c4e] 504f                      addq.w     #8,a7
read_acs_8:
[00018c50] 486b ffe8                 pea.l      -24(a3)
[00018c54] 486a 01f6                 pea.l      502(a2)
[00018c58] 226a 0034                 movea.l    52(a2),a1
[00018c5c] 204a                      movea.l    a2,a0
[00018c5e] 6100 fb5e                 bsr        init_ml_list
[00018c62] 504f                      addq.w     #8,a7
[00018c64] 486b fff4                 pea.l      -12(a3)
[00018c68] 486a 0202                 pea.l      514(a2)
[00018c6c] 226a 0024                 movea.l    36(a2),a1
[00018c70] 204a                      movea.l    a2,a0
[00018c72] 6100 fb4a                 bsr        init_ml_list
[00018c76] 504f                      addq.w     #8,a7
[00018c78] 204a                      movea.l    a2,a0
[00018c7a] 6100 fd4e                 bsr        init_mess
[00018c7e] 0c6a 0191 0004            cmpi.w     #$0191,4(a2)
[00018c84] 6c08                      bge.s      read_acs_9
[00018c86] 006a 0001 0006            ori.w      #$0001,6(a2)
[00018c8c] 6006                      bra.s      read_acs_10
read_acs_9:
[00018c8e] 026a fffe 0006            andi.w     #$FFFE,6(a2)
read_acs_10:
[00018c94] 357c 0191 0004            move.w     #$0191,4(a2)
read_acs_5:
[00018c9a] 3004                      move.w     d4,d0
[00018c9c] 4eb9 0008 0c7e            jsr        Fclose
read_acs_2:
[00018ca2] 4240                      clr.w      d0
read_acs_7:
[00018ca4] 4fef 000a                 lea.l      10(a7),a7
[00018ca8] 4cdf 0c18                 movem.l    (a7)+,d3-d4/a2-a3
[00018cac] 4e75                      rts

