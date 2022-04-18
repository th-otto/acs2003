	.globl Af_cfgfile
Af_cfgfile:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        Ast_isEmpty
		tst.w      d0
		bne.s      Af_cfgfile_1
		movea.l    ACSblk,a0
		lea.l      726(a0),a0
		jsr        Af_length
		moveq.l    #-1,d1
		cmp.l      d0,d1
		ble.s      Af_cfgfile_2
Af_cfgfile_1:
		movea.l    ACSblk,a0
		move.b     854(a0),d0
		bne.s      Af_cfgfile_3
		lea.l      xe083c,a1
		lea.l      scrap,a0
		jsr        strcpy
		jsr        Dgetdrv
		add.b      d0,scrap
		bra.s      Af_cfgfile_4
Af_cfgfile_3:
		movea.l    ACSblk,a1
		lea.l      854(a1),a1
		lea.l      scrap,a0
		jsr        strcpy
Af_cfgfile_4:
		bra.s      Af_cfgfile_5
Af_cfgfile_2:
		movea.l    ACSblk,a1
		lea.l      726(a1),a1
		lea.l      scrap,a0
		jsr        strcpy
Af_cfgfile_5:
		movea.l    (a7),a1
		lea.l      scrap,a0
		jsr        strcat
		lea.l      xe0840,a1
		lea.l      scrap,a0
		jsr        strcat
		lea.l      scrap,a0
		addq.w     #4,a7
		rts

	.globl Af_2drv
Af_2drv:
		subq.w     #4,a7
		move.l     a0,(a7)
		movea.l    (a7),a0
		cmpi.b     #$3A,1(a0)
		bne.s      Af_2drv_1
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isalpha
		tst.w      d0
		beq.s      Af_2drv_1
		movea.l    (a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        toupper
		add.w      #$FFBF,d0
		bra.s      Af_2drv_2
		bra.s      Af_2drv_2
Af_2drv_1:
		jsr        Dgetdrv
		nop
Af_2drv_2:
		addq.w     #4,a7
		rts

	.globl Af_2path
Af_2path:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		moveq.l    #92,d0
		movea.l    8(a7),a0
		jsr        strchr
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Af_2path_1
		clr.w      d0
		movea.l    12(a7),a0
		jsr        Dgetpath
		movea.l    12(a7),a0
		jsr        strlen
		subq.l     #1,d0
		movea.l    12(a7),a0
		cmpi.b     #$5C,0(a0,d0.l)
		beq.s      Af_2path_2
		lea.l      xe0845,a1
		movea.l    12(a7),a0
		jsr        strcat
Af_2path_2:
		bra        Af_2path_3
Af_2path_1:
		movea.l    8(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isascii
		tst.w      d0
		beq.s      Af_2path_4
		movea.l    8(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isalnum
		tst.w      d0
		beq.s      Af_2path_4
		movea.l    8(a7),a0
		cmpi.b     #$3A,1(a0)
		beq.s      Af_2path_5
Af_2path_4:
		move.l     8(a7),4(a7)
Af_2path_5:
		moveq.l    #2,d0
		lea.l      xe0847,a1
		movea.l    8(a7),a0
		jsr        Ast_ncmp
		tst.w      d0
		bne.s      Af_2path_6
		clr.w      d0
		movea.l    12(a7),a0
		jsr        Dgetpath
		bra.s      Af_2path_7
Af_2path_6:
		movea.l    12(a7),a0
		clr.b      (a0)
Af_2path_7:
		moveq.l    #92,d0
		movea.l    8(a7),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		sub.l      4(a7),d0
		addq.l     #1,d0
		movea.l    4(a7),a1
		movea.l    12(a7),a0
		jsr        strncat
Af_2path_3:
		movea.l    12(a7),a0
		lea.l      16(a7),a7
		rts

	.globl Af_2name
Af_2name:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		moveq.l    #92,d0
		movea.l    8(a7),a0
		jsr        strrchr
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Af_2name_1
		moveq.l    #58,d0
		movea.l    8(a7),a0
		jsr        strrchr
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Af_2name_2
		move.l     8(a7),4(a7)
		bra.s      Af_2name_3
Af_2name_2:
		addq.l     #1,4(a7)
Af_2name_3:
		bra.s      Af_2name_4
Af_2name_1:
		addq.l     #1,4(a7)
Af_2name_4:
		moveq.l    #46,d0
		movea.l    4(a7),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Af_2name_5
		movea.l    4(a7),a1
		movea.l    12(a7),a0
		jsr        strcpy
		bra.s      Af_2name_6
Af_2name_5:
		move.l     (a7),d0
		sub.l      4(a7),d0
		movea.l    4(a7),a1
		movea.l    12(a7),a0
		jsr        strncpy
		movea.l    (a7),a0
		suba.l     4(a7),a0
		movea.l    12(a7),a1
		clr.b      0(a1,a0.l)
Af_2name_6:
		movea.l    12(a7),a0
		lea.l      16(a7),a7
		rts

	.globl Af_2fullname
Af_2fullname:
		lea.l      -12(a7),a7
		move.l     a0,8(a7)
		move.l     a1,4(a7)
		moveq.l    #92,d0
		movea.l    4(a7),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Af_2fullname_1
		moveq.l    #58,d0
		movea.l    4(a7),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Af_2fullname_2
		move.l     4(a7),(a7)
		bra.s      Af_2fullname_3
Af_2fullname_2:
		addq.l     #1,(a7)
Af_2fullname_3:
		bra.s      Af_2fullname_4
Af_2fullname_1:
		addq.l     #1,(a7)
Af_2fullname_4:
		movea.l    (a7),a1
		movea.l    8(a7),a0
		jsr        strcpy
		movea.l    8(a7),a0
		lea.l      12(a7),a7
		rts

	.globl Af_2ext
Af_2ext:
		lea.l      -16(a7),a7
		move.l     a0,12(a7)
		move.l     a1,8(a7)
		moveq.l    #92,d0
		movea.l    8(a7),a0
		jsr        strrchr
		move.l     a0,(a7)
		moveq.l    #46,d0
		movea.l    8(a7),a0
		jsr        strrchr
		move.l     a0,4(a7)
		move.l     4(a7),d0
		beq.s      Af_2ext_1
		movea.l    (a7),a0
		cmpa.l     4(a7),a0
		bls.s      Af_2ext_2
Af_2ext_1:
		lea.l      xe084a,a1
		movea.l    12(a7),a0
		jsr        strcpy
		bra.s      Af_2ext_3
Af_2ext_2:
		movea.l    4(a7),a1
		addq.w     #1,a1
		movea.l    12(a7),a0
		jsr        strcpy
Af_2ext_3:
		movea.l    12(a7),a0
		lea.l      16(a7),a7
		rts

	.globl Af_buildname
Af_buildname:
		lea.l      -14(a7),a7
		move.l     a0,10(a7)
		move.w     d0,8(a7)
		move.l     a1,4(a7)
		move.l     #$00000003,(a7)
		lea.l      xe084b,a1
		movea.l    10(a7),a0
		jsr        strcpy
		move.w     8(a7),d0
		bmi.s      Af_buildname_1
		move.b     9(a7),d0
		movea.l    10(a7),a0
		add.b      d0,(a0)
		bra.s      Af_buildname_2
Af_buildname_1:
		jsr        Dgetdrv
		movea.l    10(a7),a0
		add.b      d0,(a0)
Af_buildname_2:
		move.l     4(a7),d0
		beq.s      Af_buildname_3
		movea.l    4(a7),a0
		move.b     (a0),d0
		bne.s      Af_buildname_4
Af_buildname_3:
		movea.l    10(a7),a0
		move.b     (a0),d0
		ext.w      d0
		add.w      #$FFC0,d0
		movea.l    10(a7),a0
		addq.w     #2,a0
		jsr        Dgetpath
		lea.l      xe084f,a1
		movea.l    10(a7),a0
		jsr        strcat
		jsr        strlen
		move.l     d0,(a7)
		bra.s      Af_buildname_5
Af_buildname_4:
		movea.l    4(a7),a0
		cmpi.b     #$5C,(a0)
		bne.s      Af_buildname_6
		movea.l    4(a7),a1
		addq.w     #1,a1
		bra.s      Af_buildname_7
Af_buildname_6:
		movea.l    4(a7),a1
Af_buildname_7:
		move.l     (a7),d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		jsr        strcpy
		movea.l    10(a7),a0
		jsr        strlen
		move.l     d0,(a7)
		move.l     (a7),d0
		movea.l    10(a7),a0
		cmpi.b     #$5C,-1(a0,d0.l)
		beq.s      Af_buildname_5
		lea.l      xe0851,a1
		move.l     (a7),d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		jsr        strcpy
		addq.l     #1,(a7)
Af_buildname_5:
		move.l     18(a7),d0
		beq.s      Af_buildname_8
		movea.l    18(a7),a1
		movea.l    10(a7),a0
		jsr        strcat
		move.l     22(a7),d0
		beq.s      Af_buildname_8
		movea.l    10(a7),a0
		jsr        strlen
		move.l     d0,(a7)
		move.l     (a7),d0
		movea.l    10(a7),a0
		cmpi.b     #$2E,-1(a0,d0.l)
		beq.s      Af_buildname_9
		lea.l      xe0853,a1
		move.l     (a7),d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		jsr        strcpy
		addq.l     #1,(a7)
Af_buildname_9:
		movea.l    22(a7),a1
		move.l     (a7),d0
		movea.l    10(a7),a0
		adda.l     d0,a0
		jsr        strcpy
Af_buildname_8:
		movea.l    10(a7),a0
		lea.l      14(a7),a7
		rts

	.globl Af_length
Af_length:
		lea.l      -20(a7),a7
		move.l     a0,16(a7)
		move.l     #$FFFFFFFE,(a7)
		move.l     16(a7),d0
		beq.s      Af_length_1
		movea.l    16(a7),a0
		move.b     (a0),d0
		bne.s      Af_length_2
Af_length_1:
		moveq.l    #-2,d0
		bra        Af_length_3
Af_length_2:
		movea.l    16(a7),a0
		move.b     1(a0),d0
		bne.s      Af_length_4
		movea.l    16(a7),a0
		cmpi.b     #$5C,(a0)
		bne.s      Af_length_4
		moveq.l    #-1,d0
		bra        Af_length_3
Af_length_4:
		movea.l    16(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isascii
		tst.w      d0
		beq.s      Af_length_5
		movea.l    16(a7),a0
		move.b     (a0),d0
		ext.w      d0
		jsr        isalpha
		tst.w      d0
		beq.s      Af_length_5
		lea.l      xe0855,a1
		movea.l    16(a7),a0
		addq.w     #1,a0
		jsr        Ast_cmp
		tst.w      d0
		bne.s      Af_length_5
		jsr        Dgetdrv
		jsr        Dsetdrv
		moveq.l    #1,d1
		moveq.l    #-65,d2
		movea.l    16(a7),a0
		add.b      (a0),d2
		lsl.l      d2,d1
		and.l      d1,d0
		beq.s      Af_length_6
		moveq.l    #-1,d0
		bra        Af_length_3
Af_length_6:
		moveq.l    #-2,d0
		bra        Af_length_3
Af_length_5:
		jsr        Amo_busy
		moveq.l    #92,d0
		movea.l    16(a7),a0
		jsr        strrchr
		move.l     a0,8(a7)
		move.l     8(a7),d0
		beq.s      Af_length_7
		movea.l    8(a7),a0
		move.b     1(a0),d0
		bne.s      Af_length_7
		movea.l    8(a7),a0
		clr.b      (a0)
		bra.s      Af_length_8
Af_length_7:
		clr.l      8(a7)
Af_length_8:
		clr.w      d1
		clr.w      d0
		movea.l    16(a7),a0
		jsr        Fattrib
		move.l     d0,12(a7)
		move.l     12(a7),d0
		bmi.s      Af_length_9
		moveq.l    #16,d0
		and.w      14(a7),d0
		beq.s      Af_length_10
		move.l     #$FFFFFFFF,(a7)
		bra.s      Af_length_9
Af_length_10:
		clr.w      d0
		movea.l    16(a7),a0
		jsr        Fopen
		move.l     d0,4(a7)
		move.l     4(a7),d0
		ble.s      Af_length_9
		moveq.l    #2,d2
		move.w     6(a7),d1
		moveq.l    #0,d0
		jsr        Fseek
		move.l     d0,(a7)
		move.w     6(a7),d0
		jsr        Fclose
Af_length_9:
		jsr        Amo_unbusy
		move.l     8(a7),d0
		beq.s      Af_length_11
		movea.l    8(a7),a0
		move.b     #$5C,(a0)
Af_length_11:
		move.l     (a7),d0
Af_length_3:
		lea.l      20(a7),a7
		rts

Af_readdirOld:
		lea.l      -66(a7),a7
		move.l     a0,62(a7)
		movea.l    62(a7),a0
		jsr        strlen
		move.l     d0,8(a7)
		move.l     8(a7),d0
		movea.l    62(a7),a0
		cmpi.b     #$5C,-1(a0,d0.l)
		bne.s      Af_readdirOld_1
		lea.l      xe0858,a1
		movea.l    62(a7),a0
		jsr        strcat
		bra.s      Af_readdirOld_2
Af_readdirOld_1:
		lea.l      xe085c,a1
		movea.l    62(a7),a0
		jsr        strcat
Af_readdirOld_2:
		jsr        Fgetdta
		move.l     a0,58(a7)
		lea.l      14(a7),a0
		jsr        Fsetdta
		moveq.l    #0,d0
		move.l     d0,(a7)
		move.l     d0,4(a7)
		moveq.l    #17,d0
		movea.l    62(a7),a0
		jsr        Fsfirst
		move.w     d0,12(a7)
		bra        Af_readdirOld_3
Af_readdirOld_12:
		lea.l      xe0861,a1
		lea.l      44(a7),a0
		jsr        Ast_cmp
		tst.w      d0
		beq        Af_readdirOld_4
		lea.l      xe0863,a1
		lea.l      44(a7),a0
		jsr        Ast_cmp
		tst.w      d0
		beq        Af_readdirOld_4
		move.l     4(a7),d0
		bne.s      Af_readdirOld_5
		moveq.l    #60,d0
		jsr        Ax_malloc
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Af_readdirOld_6
		bra        Af_readdirOld_7
Af_readdirOld_6:
		moveq.l    #60,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
		move.l     (a7),4(a7)
		bra.s      Af_readdirOld_8
Af_readdirOld_5:
		moveq.l    #60,d0
		jsr        Ax_malloc
		movea.l    (a7),a1
		move.l     a0,4(a1)
		movea.l    (a7),a0
		move.l     4(a0),d0
		bne.s      Af_readdirOld_9
		bra        Af_readdirOld_7
Af_readdirOld_9:
		movea.l    (a7),a0
		move.l     4(a0),(a7)
		moveq.l    #60,d1
		clr.w      d0
		movea.l    (a7),a0
		jsr        memset
Af_readdirOld_8:
		moveq.l    #20,d0
		add.l      8(a7),d0
		jsr        Ax_malloc
		movea.l    (a7),a1
		move.l     a0,(a1)
		movea.l    (a7),a0
		move.l     (a0),d0
		bne.s      Af_readdirOld_10
		bra        Af_readdirOld_7
Af_readdirOld_10:
		movea.l    (a7),a0
		movea.l    (a0),a0
		clr.b      (a0)
		movea.l    62(a7),a1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        strcpy
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        strlen
		subq.l     #3,d0
		movea.l    (a7),a0
		movea.l    (a0),a0
		clr.b      0(a0,d0.l)
		lea.l      44(a7),a1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        strcat
		moveq.l    #16,d0
		and.b      35(a7),d0
		beq.s      Af_readdirOld_11
		lea.l      xe0866,a1
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        strcat
Af_readdirOld_11:
		move.b     35(a7),d0
		ext.w      d0
		movea.l    (a7),a0
		move.w     d0,48(a0)
		movea.l    (a7),a0
		move.w     36(a7),36(a0)
		movea.l    (a7),a0
		move.w     36(a7),40(a0)
		movea.l    (a7),a0
		move.w     36(a7),44(a0)
		movea.l    (a7),a0
		move.w     38(a7),38(a0)
		movea.l    (a7),a0
		move.w     38(a7),42(a0)
		movea.l    (a7),a0
		move.w     38(a7),46(a0)
		movea.l    62(a7),a0
		bsr        Af_2drv
		movea.l    (a7),a0
		move.w     d0,14(a0)
		movea.l    (a7),a0
		move.l     40(a7),24(a0)
Af_readdirOld_4:
		jsr        Fsnext
		move.w     d0,12(a7)
Af_readdirOld_3:
		move.w     12(a7),d0
		beq        Af_readdirOld_12
Af_readdirOld_7:
		movea.l    58(a7),a0
		jsr        Fsetdta
		move.w     12(a7),d0
		bne.s      Af_readdirOld_13
		movea.l    4(a7),a0
		jsr        Af_freedir
		moveq.l    #0,d0
		move.l     d0,(a7)
		move.l     d0,4(a7)
Af_readdirOld_13:
		movea.l    4(a7),a0
		lea.l      66(a7),a7
		rts

Af_readdirNew:
		lea.l      -88(a7),a7
		move.l     a0,84(a7)
		clr.w      64(a7)
		movea.l    84(a7),a0
		jsr        strlen
		move.l     d0,76(a7)
		moveq.l    #-1,d0
		movea.l    84(a7),a0
		jsr        Dpathconf
		move.l     d0,80(a7)
		moveq.l    #-32,d0
		cmp.l      80(a7),d0
		beq.s      Af_readdirNew_1
		moveq.l    #2,d0
		cmp.l      80(a7),d0
		bgt.s      Af_readdirNew_1
		moveq.l    #2,d0
		movea.l    84(a7),a0
		jsr        Dpathconf
		move.l     d0,80(a7)
		moveq.l    #-32,d0
		cmp.l      80(a7),d0
		beq.s      Af_readdirNew_2
		moveq.l    #30,d0
		add.w      82(a7),d0
		bra.s      Af_readdirNew_3
Af_readdirNew_2:
		move.w     #$0096,d0
Af_readdirNew_3:
		move.w     d0,66(a7)
		bra.s      Af_readdirNew_4
Af_readdirNew_1:
		move.w     #$0096,66(a7)
Af_readdirNew_4:
		move.w     66(a7),d0
		ext.l      d0
		jsr        Ax_malloc
		move.l     a0,52(a7)
		move.l     52(a7),d0
		bne.s      Af_readdirNew_5
		suba.l     a0,a0
		bra        Af_readdirNew_6
Af_readdirNew_5:
		movea.l    52(a7),a0
		clr.b      (a0)
		clr.w      d0
		movea.l    84(a7),a0
		jsr        Dopendir
		move.l     d0,72(a7)
		move.l     72(a7),d0
		and.l      #$FF000000,d0
		cmp.l      #$FF000000,d0
		beq.s      Af_readdirNew_7
		moveq.l    #-34,d0
		cmp.l      72(a7),d0
		beq.s      Af_readdirNew_7
		moveq.l    #-36,d0
		cmp.l      72(a7),d0
		beq.s      Af_readdirNew_7
		moveq.l    #-39,d0
		cmp.l      72(a7),d0
		bne.s      Af_readdirNew_8
Af_readdirNew_7:
		move.l     72(a7),d0
		bmi.s      Af_readdirNew_9
		move.l     72(a7),d0
		jsr        Dclosedir
Af_readdirNew_9:
		suba.l     a0,a0
		bra        Af_readdirNew_6
Af_readdirNew_8:
		moveq.l    #0,d0
		move.l     d0,56(a7)
		move.l     d0,60(a7)
Af_readdirNew_36:
		pea.l      68(a7)
		lea.l      4(a7),a1
		movea.l    56(a7),a0
		move.l     76(a7),d1
		move.w     70(a7),d0
		jsr        Dxreaddir
		addq.w     #4,a7
		move.l     d0,80(a7)
		moveq.l    #-32,d0
		cmp.l      80(a7),d0
		bne.s      Af_readdirNew_10
		movea.l    52(a7),a0
		move.l     72(a7),d1
		move.w     66(a7),d0
		jsr        Dreaddir
		move.l     d0,80(a7)
		bra.s      Af_readdirNew_11
Af_readdirNew_12:
		movea.l    52(a7),a0
		move.l     72(a7),d1
		move.w     66(a7),d0
		jsr        Dreaddir
		move.l     d0,80(a7)
Af_readdirNew_11:
		moveq.l    #-64,d0
		cmp.l      80(a7),d0
		beq.s      Af_readdirNew_12
		move.l     80(a7),d0
		bpl.s      Af_readdirNew_13
		moveq.l    #-49,d0
		cmp.l      80(a7),d0
		beq.s      Af_readdirNew_14
		moveq.l    #1,d0
		bra.s      Af_readdirNew_15
Af_readdirNew_14:
		clr.w      d0
Af_readdirNew_15:
		move.w     d0,64(a7)
		bra        Af_readdirNew_16
Af_readdirNew_13:
		move.l     #$FFFFFFE0,68(a7)
		bra.s      Af_readdirNew_17
Af_readdirNew_10:
		bra.s      Af_readdirNew_18
Af_readdirNew_19:
		pea.l      68(a7)
		lea.l      4(a7),a1
		movea.l    56(a7),a0
		move.l     76(a7),d1
		move.w     70(a7),d0
		jsr        Dxreaddir
		addq.w     #4,a7
		move.l     d0,80(a7)
Af_readdirNew_18:
		moveq.l    #-64,d0
		cmp.l      80(a7),d0
		beq.s      Af_readdirNew_19
		move.l     80(a7),d0
		bpl.s      Af_readdirNew_17
		moveq.l    #-49,d0
		cmp.l      80(a7),d0
		beq.s      Af_readdirNew_20
		moveq.l    #1,d0
		bra.s      Af_readdirNew_21
Af_readdirNew_20:
		clr.w      d0
Af_readdirNew_21:
		move.w     d0,64(a7)
		bra        Af_readdirNew_16
Af_readdirNew_17:
		lea.l      xe0868,a1
		movea.l    52(a7),a0
		addq.w     #4,a0
		jsr        Ast_cmp
		tst.w      d0
		bne.s      Af_readdirNew_22
		lea.l      xe086a,a1
		movea.l    52(a7),a0
		addq.w     #4,a0
		jsr        Ast_cmp
		tst.w      d0
		beq        Af_readdirNew_23
Af_readdirNew_22:
		move.l     60(a7),d0
		bne.s      Af_readdirNew_24
		moveq.l    #60,d0
		jsr        Ax_malloc
		move.l     a0,56(a7)
		move.l     56(a7),d0
		bne.s      Af_readdirNew_25
		moveq.l    #1,d0
		bra.s      Af_readdirNew_26
Af_readdirNew_25:
		clr.w      d0
Af_readdirNew_26:
		move.w     d0,64(a7)
		move.w     64(a7),d0
		beq.s      Af_readdirNew_27
		bra        Af_readdirNew_16
Af_readdirNew_27:
		moveq.l    #60,d1
		clr.w      d0
		movea.l    56(a7),a0
		jsr        memset
		move.l     56(a7),60(a7)
		bra.s      Af_readdirNew_28
Af_readdirNew_24:
		moveq.l    #60,d0
		jsr        Ax_malloc
		movea.l    56(a7),a1
		move.l     a0,4(a1)
		movea.l    56(a7),a0
		move.l     4(a0),d0
		bne.s      Af_readdirNew_29
		moveq.l    #1,d0
		bra.s      Af_readdirNew_30
Af_readdirNew_29:
		clr.w      d0
Af_readdirNew_30:
		move.w     d0,64(a7)
		move.w     64(a7),d0
		beq.s      Af_readdirNew_31
		bra        Af_readdirNew_16
Af_readdirNew_31:
		movea.l    56(a7),a0
		move.l     4(a0),56(a7)
		moveq.l    #60,d1
		clr.w      d0
		movea.l    56(a7),a0
		jsr        memset
Af_readdirNew_28:
		move.w     66(a7),d0
		ext.l      d0
		add.l      76(a7),d0
		addq.l     #1,d0
		jsr        Ax_malloc
		movea.l    56(a7),a1
		move.l     a0,(a1)
		movea.l    56(a7),a0
		move.l     (a0),d0
		bne.s      Af_readdirNew_32
		bra        Af_readdirNew_16
Af_readdirNew_32:
		movea.l    56(a7),a0
		movea.l    (a0),a0
		clr.b      (a0)
		movea.l    84(a7),a1
		movea.l    56(a7),a0
		movea.l    (a0),a0
		jsr        strcpy
		lea.l      xe086d,a1
		movea.l    56(a7),a0
		movea.l    (a0),a0
		jsr        strcat
		movea.l    52(a7),a1
		addq.w     #4,a1
		movea.l    56(a7),a0
		movea.l    (a0),a0
		jsr        strcat
		moveq.l    #-32,d0
		cmp.l      68(a7),d0
		bne.s      Af_readdirNew_33
		movea.l    56(a7),a1
		addq.w     #8,a1
		movea.l    56(a7),a0
		movea.l    (a0),a0
		clr.w      d0
		jsr        Fxattr
		move.l     d0,68(a7)
		moveq.l    #-32,d0
		cmp.l      68(a7),d0
		bne.s      Af_readdirNew_34
		moveq.l    #52,d1
		clr.w      d0
		movea.l    56(a7),a0
		addq.w     #8,a0
		jsr        memset
Af_readdirNew_34:
		bra.s      Af_readdirNew_35
Af_readdirNew_33:
		moveq.l    #52,d0
		lea.l      (a7),a1
		movea.l    56(a7),a0
		addq.w     #8,a0
		jsr        memcpy
Af_readdirNew_35:
		moveq.l    #-32,d0
		cmp.l      68(a7),d0
		beq.s      Af_readdirNew_23
		moveq.l    #16,d0
		movea.l    56(a7),a0
		and.w      48(a0),d0
		beq.s      Af_readdirNew_23
		lea.l      xe086f,a1
		movea.l    56(a7),a0
		movea.l    (a0),a0
		jsr        strcat
Af_readdirNew_23:
		bra        Af_readdirNew_36
Af_readdirNew_16:
		movea.l    52(a7),a0
		jsr        Ax_free
		move.l     72(a7),d0
		jsr        Dclosedir
		move.w     64(a7),d0
		beq.s      Af_readdirNew_37
		movea.l    60(a7),a0
		jsr        Af_freedir
		moveq.l    #0,d0
		move.l     d0,56(a7)
		move.l     d0,60(a7)
Af_readdirNew_37:
		movea.l    60(a7),a0
Af_readdirNew_6:
		lea.l      88(a7),a7
		rts

	.globl Af_readdir
Af_readdir:
		lea.l      -26(a7),a7
		move.l     a0,22(a7)
		movea.l    22(a7),a0
		jsr        strlen
		move.l     d0,8(a7)
		moveq.l    #20,d0
		add.l      8(a7),d0
		jsr        Ax_malloc
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Af_readdir_1
		suba.l     a0,a0
		bra        Af_readdir_2
Af_readdir_1:
		movea.l    22(a7),a1
		movea.l    4(a7),a0
		jsr        strcpy
		moveq.l    #92,d0
		movea.l    4(a7),a0
		jsr        strrchr
		move.l     a0,(a7)
		move.l     (a7),d0
		beq.s      Af_readdir_3
		movea.l    (a7),a0
		move.b     1(a0),d0
		bne.s      Af_readdir_3
		movea.l    (a7),a0
		clr.b      (a0)
Af_readdir_3:
		movea.l    4(a7),a0
		jsr        strlen
		moveq.l    #2,d1
		cmp.l      d0,d1
		bne.s      Af_readdir_4
		movea.l    4(a7),a0
		cmpi.b     #$3A,1(a0)
		bne.s      Af_readdir_4
		lea.l      xe0871,a1
		movea.l    4(a7),a0
		jsr        strcat
Af_readdir_4:
		jsr        Dgetdrv
		move.w     d0,16(a7)
		movea.l    22(a7),a0
		bsr        Af_2drv
		jsr        Dsetdrv
		clr.w      d0
		lea.l      xe0873,a0
		jsr        Dopendir
		move.l     d0,12(a7)
		move.w     16(a7),d0
		jsr        Dsetdrv
		moveq.l    #-32,d0
		cmp.l      12(a7),d0
		bne.s      Af_readdir_5
		movea.l    4(a7),a0
		bsr        Af_readdirOld
		move.l     a0,18(a7)
		bra.s      Af_readdir_6
Af_readdir_5:
		move.l     12(a7),d0
		ble.s      Af_readdir_7
		move.l     12(a7),d0
		jsr        Dclosedir
Af_readdir_7:
		movea.l    4(a7),a0
		bsr        Af_readdirNew
		move.l     a0,18(a7)
Af_readdir_6:
		movea.l    4(a7),a0
		jsr        Ax_free
		movea.l    18(a7),a0
Af_readdir_2:
		lea.l      26(a7),a7
		rts

	.globl Af_freedir
Af_freedir:
		subq.w     #8,a7
		move.l     a0,4(a7)
		bra.s      Af_freedir_1
Af_freedir_3:
		move.l     4(a7),(a7)
		movea.l    4(a7),a0
		move.l     4(a0),4(a7)
		movea.l    (a7),a0
		move.l     (a0),d0
		beq.s      Af_freedir_2
		movea.l    (a7),a0
		movea.l    (a0),a0
		jsr        Ast_delete
Af_freedir_2:
		movea.l    (a7),a0
		jsr        Ax_free
Af_freedir_1:
		move.l     4(a7),d0
		bne.s      Af_freedir_3
		addq.w     #8,a7
		rts

	.globl Af_first
Af_first:
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a1,(a7)
		move.l     DateiListe,d0
		beq.s      Af_first_1
		movea.l    DateiListe,a0
		bsr.w      Af_freedir
		moveq.l    #0,d0
		move.l     d0,AktDatei
		move.l     d0,DateiListe
Af_first_1:
		movea.l    4(a7),a0
		bsr        Af_readdir
		move.l     a0,DateiListe
		move.l     DateiListe,d0
		bne.s      Af_first_2
		suba.l     a0,a0
		bra.s      Af_first_3
Af_first_2:
		movea.l    (a7),a0
		jsr        Af_next
Af_first_3:
		addq.w     #8,a7
		rts

	.globl Af_next
Af_next:
		subq.w     #4,a7
		move.l     a0,(a7)
		move.l     DateiListe,d0
		bne.s      Af_next_1
		suba.l     a0,a0
		bra.s      Af_next_2
Af_next_1:
		move.l     AktDatei,d0
		bne.s      Af_next_3
		move.l     DateiListe,AktDatei
		bra.s      Af_next_4
Af_next_3:
		movea.l    AktDatei,a0
		move.l     4(a0),AktDatei
Af_next_4:
		move.l     AktDatei,d0
		bne.s      Af_next_5
		movea.l    DateiListe,a0
		bsr        Af_freedir
		moveq.l    #0,d0
		move.l     d0,AktDatei
		move.l     d0,DateiListe
		bra.s      Af_next_6
Af_next_5:
		move.l     (a7),d0
		beq.s      Af_next_7
		moveq.l    #52,d0
		movea.l    AktDatei,a1
		addq.w     #8,a1
		movea.l    (a7),a0
		jsr        memcpy
Af_next_7:
		movea.l    AktDatei,a0
		movea.l    (a0),a0
		bra.s      Af_next_2
Af_next_6:
		suba.l     a0,a0
Af_next_2:
		addq.w     #4,a7
		rts

	.globl Af_quote
Af_quote:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		movea.l    14(a7),a0
		cmpa.l     10(a7),a0
		beq.s      Af_quote_1
		movea.l    10(a7),a1
		movea.l    14(a7),a0
		jsr        strcpy
Af_quote_1:
		movea.l    14(a7),a0
		jsr        Ast_alltrim
		lea.l      xe0875,a1
		movea.l    14(a7),a0
		jsr        strpbrk
		move.l     a0,d0
		beq        Af_quote_2
		clr.w      (a7)
		move.l     14(a7),6(a7)
		bra.s      Af_quote_3
Af_quote_5:
		movea.l    6(a7),a0
		move.b     (a0),d0
		cmp.b      xe087b,d0
		bne.s      Af_quote_4
		addq.w     #1,(a7)
Af_quote_4:
		addq.l     #1,6(a7)
Af_quote_3:
		movea.l    6(a7),a0
		move.b     (a0),d0
		bne.s      Af_quote_5
		movea.l    14(a7),a0
		jsr        strlen
		movea.l    14(a7),a0
		adda.l     d0,a0
		move.l     a0,6(a7)
		move.w     (a7),d0
		movea.l    6(a7),a0
		lea.l      1(a0,d0.w),a0
		move.l     a0,2(a7)
		bra.s      Af_quote_6
Af_quote_8:
		movea.l    6(a7),a0
		move.b     (a0),d0
		cmp.b      xe087e,d0
		bne.s      Af_quote_7
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.b     (a0),(a1)
		subq.l     #1,2(a7)
Af_quote_7:
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.b     (a0),(a1)
		subq.l     #1,6(a7)
		subq.l     #1,2(a7)
Af_quote_6:
		movea.l    6(a7),a0
		cmpa.l     14(a7),a0
		bcc.s      Af_quote_8
		movea.l    14(a7),a0
		move.b     xe0881,(a0)
		movea.l    14(a7),a0
		jsr        strlen
		movea.l    14(a7),a0
		adda.l     d0,a0
		move.l     a0,2(a7)
		movea.l    2(a7),a0
		addq.l     #1,2(a7)
		move.b     xe0884,(a0)
		movea.l    2(a7),a0
		clr.b      (a0)
Af_quote_2:
		movea.l    14(a7),a0
		lea.l      18(a7),a7
		rts

	.globl Af_unquote
Af_unquote:
		lea.l      -18(a7),a7
		move.l     a0,14(a7)
		move.l     a1,10(a7)
		movea.l    14(a7),a0
		cmpa.l     10(a7),a0
		beq.s      Af_unquote_1
		movea.l    10(a7),a1
		movea.l    14(a7),a0
		jsr        strcpy
Af_unquote_1:
		movea.l    14(a7),a0
		jsr        Ast_alltrim
		movea.l    14(a7),a0
		move.b     (a0),(a7)
		move.b     (a7),d0
		ext.w      d0
		lea.l      xe0887,a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Af_unquote_2
		movea.l    14(a7),a0
		jsr        strlen
		subq.l     #1,d0
		movea.l    14(a7),a0
		move.b     (a7),d1
		cmp.b      0(a0,d0.l),d1
		bne.s      Af_unquote_2
		move.l     14(a7),2(a7)
		movea.l    14(a7),a0
		addq.w     #1,a0
		move.l     a0,6(a7)
		bra.s      Af_unquote_3
Af_unquote_7:
		movea.l    6(a7),a0
		move.b     (a0),d0
		cmp.b      (a7),d0
		bne.s      Af_unquote_4
		movea.l    6(a7),a0
		move.b     (a0),d0
		movea.l    6(a7),a0
		cmp.b      1(a0),d0
		bne.s      Af_unquote_5
		addq.l     #1,6(a7)
		bra.s      Af_unquote_4
Af_unquote_5:
		bra.s      Af_unquote_6
Af_unquote_4:
		movea.l    6(a7),a0
		movea.l    2(a7),a1
		move.b     (a0),(a1)
		addq.l     #1,6(a7)
		addq.l     #1,2(a7)
Af_unquote_3:
		movea.l    6(a7),a0
		move.b     (a0),d0
		bne.s      Af_unquote_7
Af_unquote_6:
		movea.l    2(a7),a0
		clr.b      (a0)
Af_unquote_2:
		movea.l    14(a7),a0
		lea.l      18(a7),a7
		rts

	.globl Af_parseCmdLine
Af_parseCmdLine:
		move.l     a2,-(a7)
		lea.l      -156(a7),a7
		move.l     a0,150(a7)
		jsr        Alu_create
		move.l     a0,(a7)
		move.l     (a7),d0
		bne.s      Af_parseCmdLine_1
		suba.l     a0,a0
		bra        Af_parseCmdLine_2
Af_parseCmdLine_1:
		movea.l    150(a7),a0
		jsr        Ast_create
		move.l     a0,4(a7)
		move.l     4(a7),d0
		bne.s      Af_parseCmdLine_3
		suba.l     a0,a0
		bra        Af_parseCmdLine_2
Af_parseCmdLine_3:
		move.l     4(a7),146(a7)
		bra        Af_parseCmdLine_4
Af_parseCmdLine_12:
		movea.l    146(a7),a0
		jsr        Ast_alltrim
		movea.l    146(a7),a0
		move.b     (a0),136(a7)
		move.b     136(a7),d0
		ext.w      d0
		lea.l      xe088a,a0
		jsr        strchr
		move.l     a0,d0
		beq.s      Af_parseCmdLine_5
		addq.l     #1,146(a7)
		lea.l      8(a7),a0
		move.l     a0,142(a7)
		bra.s      Af_parseCmdLine_6
Af_parseCmdLine_9:
		movea.l    146(a7),a0
		move.b     (a0),d0
		cmp.b      136(a7),d0
		bne.s      Af_parseCmdLine_7
		addq.l     #1,146(a7)
		movea.l    146(a7),a0
		move.b     -1(a0),d0
		movea.l    146(a7),a0
		cmp.b      (a0),d0
		beq.s      Af_parseCmdLine_7
		bra.s      Af_parseCmdLine_8
Af_parseCmdLine_7:
		movea.l    146(a7),a0
		movea.l    142(a7),a1
		move.b     (a0),(a1)
		addq.l     #1,146(a7)
		addq.l     #1,142(a7)
Af_parseCmdLine_6:
		movea.l    146(a7),a0
		move.b     (a0),d0
		bne.s      Af_parseCmdLine_9
Af_parseCmdLine_8:
		movea.l    142(a7),a0
		clr.b      (a0)
		bra.s      Af_parseCmdLine_10
Af_parseCmdLine_5:
		lea.l      xe088d,a1
		movea.l    146(a7),a0
		jsr        strpbrk
		move.l     a0,142(a7)
		move.l     142(a7),d0
		beq.s      Af_parseCmdLine_11
		movea.l    142(a7),a0
		move.b     (a0),154(a7)
		movea.l    142(a7),a0
		clr.b      (a0)
		movea.l    146(a7),a1
		lea.l      8(a7),a0
		jsr        strcpy
		move.l     142(a7),146(a7)
		movea.l    146(a7),a0
		move.b     154(a7),(a0)
		bra.s      Af_parseCmdLine_10
Af_parseCmdLine_11:
		movea.l    146(a7),a1
		lea.l      8(a7),a0
		jsr        strcpy
		clr.l      146(a7)
Af_parseCmdLine_10:
		lea.l      8(a7),a0
		jsr        Ast_create
		move.l     a0,138(a7)
		move.l     138(a7),d0
		beq.s      Af_parseCmdLine_4
		movea.l    138(a7),a1
		movea.l    (a7),a0
		movea.l    (a7),a2
		movea.l    12(a2),a2
		jsr        (a2)
Af_parseCmdLine_4:
		movea.l    146(a7),a0
		jsr        Ast_isEmpty
		tst.w      d0
		beq        Af_parseCmdLine_12
		movea.l    4(a7),a0
		jsr        Ast_delete
		movea.l    (a7),a0
Af_parseCmdLine_2:
		lea.l      156(a7),a7
		movea.l    (a7)+,a2
		rts

	.data

DateiListe:
		dc.w $0000
		dc.w $0000
AktDatei:
		dc.w $0000
		dc.w $0000
		dc.w $2e00
max_mode:
		dc.w $fffe
		dc.b 'A:\',0
xe083c:
		dc.b 'A:\',0
xe0840:
		dc.b '.cfg',0
xe0845:
		dc.b $5c,0
xe0847:
		dc.b $2e,$5c,0
xe084a:
		dc.b $0
xe084b:
		dc.b $41,$3a,$5c,0
xe084f:
		dc.b $5c,0
xe0851:
		dc.b $5c,0
xe0853:
		dc.b $2e,0
xe0855:
		dc.b $3a,$5c,0
xe0858:
		dc.b '*.*',0
xe085c:
		dc.b '\*.*',0
xe0861:
		dc.b $2e,0
xe0863:
		dc.b $2e,$2e,0
xe0866:
		dc.b $5c,0
xe0868:
		dc.b $2e,0
xe086a:
		dc.b $2e,$2e,0
xe086d:
		dc.b $5c,0
xe086f:
		dc.b $5c,0
xe0871:
		dc.b $5c,0
xe0873:
		dc.b $2e,0
xe0875:
		dc.b $20,$09,$0a,$0d,$27,0
xe087b:
		dc.b $27,$22,0
xe087e:
		dc.b $27,$22,0
xe0881:
		dc.b $27,$22,0
xe0884:
		dc.b $27,$22,0
xe0887:
		dc.b $27,$22,0
xe088a:
		dc.b $27,$22,0
xe088d:
		dc.b $20,$09,$0a,$0d,$27,0
		.even

	.bss

scrap: ds.b 256
