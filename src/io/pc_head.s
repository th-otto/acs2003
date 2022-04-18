out_acs:
		move.w     6(a0),d0
		and.w      #0x8000,d0
		bne.s      out_acs_1
		lea.l      xa53e8,a0
		jsr        save_string
out_acs_1:
		rts

out_list:
		movem.l    d3-d4/a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a3
		movea.l    28(a7),a4
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble.w      out_list_1
		lea.l      22(a2),a0
		jsr        info_list
		movea.l    4(a2),a2
		movea.l    a3,a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a5
		bra.s      out_list_2
out_list_4:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a3
		lea.l      xa5408,a1
		lea.l      22(a3),a0
		moveq.l    #4,d0
		jsr        strncmp
		tst.w      d0
		beq.s      out_list_3
		move.w     56(a3),d0
		and.w      #0x0500,d0
		cmp.w      #0x0100,d0
		bne.s      out_list_3
		lea.l      22(a3),a0
		jsr        info_obj
		move.l     10(a3),-(a7)
		pea.l      22(a3)
		movea.l    a4,a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a5,a0
		jsr        save_string
out_list_3:
		addq.w     #1,d4
out_list_2:
		cmp.w      d4,d3
		bgt.s      out_list_4
out_list_1:
		movem.l    (a7)+,d3-d4/a2-a5
		rts

out_obj:
		movem.l    d3-d7/a2-a5,-(a7)
		movea.l    a0,a2
		movea.l    a1,a5
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_obj_1
		lea.l      22(a2),a0
		jsr        info_list
		movea.l    4(a2),a2
		movea.l    a5,a0
		jsr        save_string
		clr.w      d4
		lea.l      xa53e8,a3
		lea.l      iostring,a4
		bra        out_obj_2
out_obj_9:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a5
		move.w     56(a5),d1
		and.w      #0x0500,d1
		cmp.w      #0x0100,d1
		bne        out_obj_3
		lea.l      22(a5),a0
		jsr        info_obj
		pea.l      22(a5)
		lea.l      37(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #4,a7
		movea.l    a4,a0
		jsr        save_string
		move.l     14(a5),d0
		moveq.l    #56,d1
		jsr        _uldiv
		move.l     d0,d5
		movea.l    4(a5),a5
		clr.w      d6
		move.w     d6,d7
		bra.s      out_obj_4
out_obj_8:
		move.l     (a5),d0
		beq.s      out_obj_5
		move.w     d6,-(a7)
		movea.l    d0,a0
		pea.l      22(a0)
		lea.l      59(a3),a1
		movea.l    a4,a0
		jsr        sprintf
		addq.w     #6,a7
		movea.l    a4,a0
		jsr        save_string
out_obj_5:
		move.l     32(a5),d0
		bne.s      out_obj_6
		move.l     36(a5),d1
		bne.s      out_obj_6
		move.l     44(a5),d2
		bne.s      out_obj_6
		move.l     48(a5),d0
		bne.s      out_obj_6
		move.l     4(a5),d1
		bne.s      out_obj_6
		move.w     42(a5),d2
		bne.s      out_obj_6
		move.w     52(a5),d0
		bne.s      out_obj_6
		addq.w     #1,d6
		bra.s      out_obj_7
out_obj_6:
		addq.w     #2,d6
out_obj_7:
		lea.l      56(a5),a5
		addq.w     #1,d7
out_obj_4:
		cmp.w      d7,d5
		bgt.s      out_obj_8
out_obj_3:
		addq.w     #1,d4
out_obj_2:
		cmp.w      d4,d3
		bgt        out_obj_9
out_obj_1:
		movem.l    (a7)+,d3-d7/a2-a5
		rts

out_declproto:
		movem.l    d3-d5/a2-a5,-(a7)
		movea.l    a0,a3
		movea.l    60(a3),a2
		move.l     14(a2),d3
		lsr.l      #2,d3
		tst.w      d3
		ble        out_declproto_1
		movea.l    60(a3),a0
		lea.l      22(a0),a0
		jsr        info_list
		movea.l    4(a2),a2
		lea.l      xa53e8,a3
		lea.l      81(a3),a0
		jsr        save_string
		clr.w      d4
		lea.l      iostring,a5
		bra        out_declproto_2
out_declproto_27:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    0(a2,d0.l),a4
		move.w     56(a4),d5
		move.w     d5,d1
		and.w      #0x0200,d1
		bne.s      out_declproto_3
		move.w     d5,d2
		and.w      #0x0500,d2
		cmp.w      #0x0100,d2
		bne        out_declproto_4
out_declproto_3:
		lea.l      22(a4),a0
		jsr        info_obj
		move.w     d5,d0
		and.w      #0x00FF,d0
		cmp.w      #0x0025,d0
		bhi        out_declproto_5
		add.w      d0,d0
		move.w     J4(pc,d0.w),d0
		jmp        J4(pc,d0.w)
J4:
		dc.w out_declproto_6-J4
		dc.w out_declproto_7-J4
		dc.w out_declproto_7-J4
		dc.w out_declproto_8-J4
		dc.w out_declproto_9-J4
		dc.w out_declproto_5-J4
		dc.w out_declproto_10-J4
		dc.w out_declproto_11-J4
		dc.w out_declproto_10-J4
		dc.w out_declproto_12-J4
		dc.w out_declproto_13-J4
		dc.w out_declproto_14-J4
		dc.w out_declproto_15-J4
		dc.w out_declproto_5-J4
		dc.w out_declproto_15-J4
		dc.w out_declproto_16-J4
		dc.w out_declproto_17-J4
		dc.w out_declproto_17-J4
		dc.w out_declproto_14-J4
		dc.w out_declproto_14-J4
		dc.w out_declproto_15-J4
		dc.w out_declproto_18-J4
		dc.w out_declproto_19-J4
		dc.w out_declproto_10-J4
		dc.w out_declproto_20-J4
		dc.w out_declproto_21-J4
		dc.w out_declproto_21-J4
		dc.w out_declproto_7-J4
		dc.w out_declproto_7-J4
		dc.w out_declproto_7-J4
		dc.w out_declproto_22-J4
		dc.w out_declproto_22-J4
		dc.w out_declproto_7-J4
		dc.w out_declproto_23-J4
		dc.w out_declproto_24-J4
		dc.w out_declproto_7-J4
		dc.w out_declproto_23-J4
		dc.w out_declproto_25-J4
out_declproto_7:
		pea.l      22(a4)
		lea.l      115(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_8:
		pea.l      22(a4)
		lea.l      141(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_9:
		pea.l      22(a4)
		lea.l      181(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_10:
		pea.l      22(a4)
		lea.l      243(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_11:
		pea.l      22(a4)
		lea.l      279(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_12:
		pea.l      22(a4)
		lea.l      315(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_13:
		pea.l      22(a4)
		lea.l      376(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_14:
		pea.l      22(a4)
		lea.l      436(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_15:
		pea.l      22(a4)
		lea.l      484(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_16:
		pea.l      22(a4)
		lea.l      519(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_17:
		pea.l      22(a4)
		lea.l      579(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_18:
		pea.l      22(a4)
		lea.l      625(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_6:
		clr.b      (a5)
		bra        out_declproto_26
out_declproto_19:
		pea.l      22(a4)
		lea.l      687(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra        out_declproto_26
out_declproto_20:
		pea.l      22(a4)
		lea.l      734(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.w      out_declproto_26
out_declproto_21:
		pea.l      22(a4)
		lea.l      815(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_22:
		pea.l      22(a4)
		lea.l      842(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_24:
		pea.l      22(a4)
		lea.l      879(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_23:
		pea.l      22(a4)
		lea.l      930(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_25:
		pea.l      22(a4)
		lea.l      977(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #4,a7
		bra.s      out_declproto_26
out_declproto_5:
		move.w     d5,d0
		and.w      #0x00FF,d0
		move.w     d0,-(a7)
		pea.l      22(a4)
		lea.l      1043(a3),a1
		movea.l    a5,a0
		jsr        sprintf
		addq.w     #6,a7
out_declproto_26:
		movea.l    a5,a0
		jsr        save_string
out_declproto_4:
		addq.w     #1,d4
out_declproto_2:
		cmp.w      d4,d3
		bgt        out_declproto_27
		lea.l      27(a3),a0
		jsr        save_string
out_declproto_1:
		movem.l    (a7)+,d3-d5/a2-a5
		rts

	.globl pc_header
pc_header:
		movem.l    d3/a2-a5,-(a7)
		lea.l      -136(a7),a7
		movea.l    a0,a2
		moveq.l    #92,d0
		movea.l    8(a2),a0
		jsr        strrchr
		addq.w     #1,a0
		move.l     a0,(a7)
		lea.l      4(a7),a4
		movea.l    8(a2),a1
		movea.l    a4,a0
		jsr        strcpy
		moveq.l    #46,d0
		movea.l    a4,a0
		jsr        strrchr
		movea.l    a0,a3
		lea.l      xa53e8,a5
		move.l     a3,d0
		beq.s      pc_header_1
		lea.l      1065(a5),a1
		movea.l    a3,a0
		jsr        strcpy
		bra.s      pc_header_2
pc_header_1:
		lea.l      1065(a5),a1
		movea.l    a4,a0
		jsr        strcat
pc_header_2:
		clr.w      d0
		movea.l    a4,a0
		jsr        Fcreate
		move.l     d0,d3
		tst.w      d3
		bpl.s      pc_header_3
		movea.l    (a7),a0
		moveq.l    #9,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra        pc_header_4
pc_header_3:
		movea.l    a4,a0
		jsr        info_start
		lea.l      1068(a5),a0
		jsr        info_title
		move.w     d3,d0
		jsr        set_handle
		jsr        setjmp
		tst.w      d0
		beq.s      pc_header_5
		suba.l     a0,a0
		moveq.l    #10,d0
		movea.l    ACSblk,a1
		movea.l    982(a1),a1
		jsr        (a1)
		bra        pc_header_6
pc_header_5:
		suba.l     a0,a0
		jsr        time
		move.l     d0,132(a7)
		lea.l      iostring,a3
		move.l     8(a2),-(a7)
		lea.l      136(a7),a0
		jsr        ctime
		move.l     a0,-(a7)
		lea.l      pc_welcome,a1
		movea.l    a3,a0
		jsr        sprintf
		addq.w     #8,a7
		movea.l    a3,a0
		jsr        save_string
		lea.l      1082(a5),a0
		jsr        save_string
		pea.l      1151(a5)
		lea.l      1124(a5),a1
		movea.l    36(a2),a0
		bsr        out_list
		addq.w     #4,a7
		pea.l      1151(a5)
		lea.l      1175(a5),a1
		movea.l    52(a2),a0
		bsr        out_list
		addq.w     #4,a7
		pea.l      1221(a5)
		lea.l      1199(a5),a1
		movea.l    44(a2),a0
		bsr        out_list
		addq.w     #4,a7
		pea.l      1266(a5)
		lea.l      1243(a5),a1
		movea.l    48(a2),a0
		bsr        out_list
		addq.w     #4,a7
		lea.l      1286(a5),a1
		movea.l    28(a2),a0
		bsr        out_obj
		lea.l      1313(a5),a1
		movea.l    32(a2),a0
		bsr        out_obj
		lea.l      1341(a5),a1
		movea.l    24(a2),a0
		bsr        out_obj
		pea.l      1394(a5)
		lea.l      1370(a5),a1
		movea.l    20(a2),a0
		bsr        out_list
		addq.w     #4,a7
		pea.l      1442(a5)
		lea.l      1415(a5),a1
		movea.l    64(a2),a0
		bsr        out_list
		addq.w     #4,a7
		movea.l    a2,a0
		bsr        out_acs
		movea.l    a2,a0
		bsr        out_declproto
		jsr        close_buf
pc_header_6:
		jsr        info_end
		move.w     d3,d0
		jsr        Fclose
pc_header_4:
		lea.l      136(a7),a7
		movem.l    (a7)+,d3/a2-a5
		rts

	.data

xa53e8:
		dc.b $0d,$0a,$0d,$0a,'extern Adescr ACSdescr;',$0d,$0a,$0d,$0a,0
xa5408:
x000a5408:                           dc.b 'ACS(',0
x000a540d:                           dc.b $0d,$0a,'extern OBJECT %s;',$0d,$0a,0
x000a5423:                           dc.b '#define %-14s (%3d)',$0d,$0a,0
x000a5439:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ANSI-C Prototypes',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a545b:                           dc.b 'extern void %s( void );',$0d,$0a,0
x000a5475:                           dc.b 'extern INT16 CDECL %s( PARMBLK *pb );',$0d,$0a,0
x000a549d:                           dc.b 'extern INT16 %s( OBJECT *entry, INT16 task, void *in_out );',$0d,$0a,0
x000a54db:                           dc.b 'extern INT16 %s( Awindow *wind );',$0d,$0a,0
x000a54ff:                           dc.b 'extern Awindow *%s( void *para );',$0d,$0a,0
x000a5523:                           dc.b 'extern INT16 %s( Awindow *wind, INT16 kstate, INT16 key );',$0d,$0a,0
x000a5560:                           dc.b 'extern void %s( Awindow *wind, INT16 obnr, INT16 state );',$0d,$0a,0
x000a559c:                           dc.b 'extern void %s( Awindow *wind, Axywh *area );',$0d,$0a,0
x000a55cc:                           dc.b 'extern void %s( Awindow *wind );',$0d,$0a,0
x000a55ef:                           dc.b 'extern void %s( Awindow *wind, INT16 pos, INT16 amount );',$0d,$0a,0
x000a562b:                           dc.b 'extern void %s( Awindow *wind, INT16 pos );',$0d,$0a,0
x000a5659:                           dc.b 'extern INT16 %s( Awindow *wind, INT16 task, void *in_out );',$0d,$0a,0
x000a5697:                           dc.b 'extern INT16 %s( Awindow *wind, INT16 all );',$0d,$0a,0
x000a56c6:                           dc.b 'extern INT16 %s( Awindow *wind, INT16 anz, char **cmd, A_GSAntwort *antwort );',$0d,$0a,0
x000a5717:                           dc.b 'extern INT16 %s( void );',$0d,$0a,0
x000a5732:                           dc.b 'extern INT16 %s( INT16 *message );',$0d,$0a,0
x000a5757:                           dc.b 'extern void %s( INT16 *button, INT16 *kreturn );',$0d,$0a,0
x000a578a:                           dc.b 'extern void %s( INT16 *kstate, INT16 *key );',$0d,$0a,0
x000a57b9:                           dc.b 'extern INT16 %s( INT16 anz, char **cmd, A_GSAntwort *antwort );',$0d,$0a,0
x000a57fb:                           dc.b '/* %s Type %d ?? */',$0d,$0a,0
x000a5811:                           dc.b $2e
x000a5812:                           dc.w $4800
x000a5814:                           dc.b 'ANSI C Header',0
x000a5822:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'PLATFORM',$09,$09,'*/',$0d,$0a,'#define ACS_ATARI',$0d,$0a,0
x000a584c:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ALERTBOXES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5867:                           dc.b 'extern char %s [%ld];',$0d,$0a,0
x000a587f:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'STRINGS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5897:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'ICONS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a58ad:                           dc.b 'extern CICONBLK %s;',$0d,$0a,0
x000a58c3:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'IMAGES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a58da:                           dc.b 'extern BITBLK %s;',$0d,$0a,0
x000a58ee:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'MENU TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5909:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'POPUP TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5925:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'OBJECT TREES',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a5942:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'WINDOWS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a595a:                           dc.b 'extern Awindow %s;',$0d,$0a,0
x000a596f:                           dc.b $0d,$0a,$0d,$0a,'/*',$09,$09,'MOUSEFORMS',$09,$09,'*/',$0d,$0a,$0d,$0a,0
x000a598a:                           dc.b 'extern MFORM %s;',$0d,$0a,0
x000a599d:                           dc.b $00
