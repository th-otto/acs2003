		.text
		
load_dfn:
		movem.l    d3-d4/a2,-(a7)
		movea.l    a0,a2
		clr.w      d0
		movea.l    8(a2),a0
		jsr        Fopen
		move.l     d0,d3
		lea.l      dfn_size,a2
		tst.w      d3
		bmi.s      load_dfn_1
		movea.l    a2,a0
		moveq.l    #2,d1
		move.w     d3,d0
		jsr        Fread
		move.w     (a2),d0
		asr.w      #8,d0
		and.w      #0x00FF,d0
		move.w     (a2),d1
		lsl.w      #8,d1
		or.w       d1,d0
		move.w     d0,(a2)
		ext.l      d0
		move.l     d0,d4
		lsl.l      #3,d4
		sub.l      d0,d4
		add.l      d4,d4
		move.l     d4,d0
		jsr        Ax_malloc
		move.l     a0,-4(a2)
		move.l     a0,d0
		bne.s      load_dfn_2
load_dfn_1:
		clr.w      (a2)
		bra.s      load_dfn_3
load_dfn_2:
		movea.l    -4(a2),a0
		move.l     d4,d1
		move.w     d3,d0
		jsr        Fread
		move.w     d3,d0
		jsr        Fclose
load_dfn_3:
		movem.l    (a7)+,d3-d4/a2
		rts

tree_label:
		movem.l    d3-d4/a2-a4,-(a7)
		move.w     d0,d4
		movea.l    a0,a3
		movea.l    a1,a4
		clr.w      d3
		lea.l      dfna,a2
		bra.s      tree_label_1
tree_label_4:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		add.l      d0,d0
		movea.l    (a2),a0
		move.b     0(a0,d0.l),d2
		ext.w      d2
		cmp.w      d2,d4
		bne.s      tree_label_2
		move.b     3(a0,d0.l),d1
		bne.s      tree_label_2
		cmpi.b     #0x01,2(a0,d0.l)
		blt.s      tree_label_2
		cmpi.b     #0x03,2(a0,d0.l)
		bgt.s      tree_label_2
		movea.l    a0,a1
		lea.l      4(a1,d0.l),a1
		movea.l    a3,a0
		jsr        strcpy
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		add.l      d0,d0
		movea.l    (a2),a0
		cmpi.b     #0x02,2(a0,d0.l)
		bne.s      tree_label_3
		move.w     #0x0001,(a4)
		bra.s      tree_label_3
tree_label_2:
		addq.w     #1,d3
tree_label_1:
		cmp.w      4(a2),d3
		blt.s      tree_label_4
		clr.b      (a3)
tree_label_3:
		movem.l    (a7)+,d3-d4/a2-a4
		rts

index_label:
		movem.l    d3-d5/a2-a3,-(a7)
		move.w     d0,d5
		move.w     d1,d4
		movea.l    a0,a3
		clr.w      d3
		lea.l      dfna,a2
		bra.s      index_label_1
index_label_4:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		add.l      d0,d0
		movea.l    (a2),a0
		move.b     0(a0,d0.l),d2
		ext.w      d2
		cmp.w      d2,d4
		bne.s      index_label_2
		move.b     2(a0,d0.l),d1
		bne.s      index_label_2
		cmpi.b     #0x01,3(a0,d0.l)
		bne.s      index_label_2
		move.b     1(a0,d0.l),d2
		ext.w      d2
		cmp.w      d2,d5
		bne.s      index_label_2
		movea.l    a0,a1
		lea.l      4(a1,d0.l),a1
		movea.l    a3,a0
		jsr        strcpy
		bra.s      index_label_3
index_label_2:
		addq.w     #1,d3
index_label_1:
		cmp.w      4(a2),d3
		blt.s      index_label_4
		clr.b      (a3)
index_label_3:
		movem.l    (a7)+,d3-d5/a2-a3
		rts

image_label:
		movem.l    d3-d4/a2-a3,-(a7)
		move.w     d0,d4
		movea.l    a0,a3
		clr.w      d3
		lea.l      dfna,a2
		bra.s      image_label_1
image_label_4:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		add.l      d0,d0
		movea.l    (a2),a0
		move.b     0(a0,d0.l),d2
		ext.w      d2
		cmp.w      d2,d4
		bne.s      image_label_2
		cmpi.b     #0x02,2(a0,d0.l)
		bne.s      image_label_2
		cmpi.b     #0x01,3(a0,d0.l)
		bne.s      image_label_2
		movea.l    a0,a1
		lea.l      4(a1,d0.l),a1
		movea.l    a3,a0
		jsr        strcpy
		bra.s      image_label_3
image_label_2:
		addq.w     #1,d3
image_label_1:
		cmp.w      4(a2),d3
		blt.s      image_label_4
		clr.b      (a3)
image_label_3:
		movem.l    (a7)+,d3-d4/a2-a3
		rts

string_label:
		movem.l    d3-d4/a2-a4,-(a7)
		move.w     d0,d4
		movea.l    a0,a4
		movea.l    a1,a3
		clr.w      d3
		lea.l      dfna,a2
		bra.s      string_label_1
string_label_6:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		add.l      d0,d0
		movea.l    (a2),a0
		move.b     0(a0,d0.l),d2
		ext.w      d2
		cmp.w      d2,d4
		bne.s      string_label_2
		cmpi.b     #0x01,2(a0,d0.l)
		bne.s      string_label_3
		cmpi.b     #0x01,3(a0,d0.l)
		beq.s      string_label_4
string_label_3:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		add.l      d0,d0
		movea.l    (a2),a0
		cmpi.b     #0x04,2(a0,d0.l)
		bne.s      string_label_2
		move.b     3(a0,d0.l),d2
		bne.s      string_label_2
		move.w     #0x0001,(a3)
string_label_4:
		move.w     d3,d1
		ext.l      d1
		move.l     d1,d0
		lsl.l      #3,d0
		sub.l      d1,d0
		add.l      d0,d0
		movea.l    (a2),a1
		lea.l      4(a1,d0.l),a1
		movea.l    a4,a0
		jsr        strcpy
		bra.s      string_label_5
string_label_2:
		addq.w     #1,d3
string_label_1:
		cmp.w      4(a2),d3
		blt.s      string_label_6
		clr.b      (a4)
string_label_5:
		movem.l    (a7)+,d3-d4/a2-a4
		rts

strings:
		movem.l    d3-d5/a2-a5,-(a7)
		lea.l      -26(a7),a7
		movea.l    a0,a5
		move.l     a1,22(a7)
		movea.l    a1,a0
		move.w     30(a0),d3
		moveq.l    #0,d0
		move.w     10(a0),d0
		lea.l      0(a0,d0.l),a1
		move.l     a1,18(a7)
		clr.w      d4
		lea.l      16(a7),a2
		bra        strings_1
strings_10:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    18(a7),a0
		move.l     0(a0,d0.l),d1
		movea.l    22(a7),a4
		adda.l     d1,a4
		movea.l    a4,a0
		jsr        strlen
		move.l     d0,d5
		addq.l     #1,d5
		move.l     d5,d0
		movea.l    a5,a0
		jsr        objmalloc
		movea.l    a0,a3
		ori.w      #0x0100,56(a3)
		move.l     a3,d0
		beq        strings_2
		move.l     d5,14(a3)
		movea.l    a4,a1
		movea.l    4(a3),a0
		jsr        strcpy
		ori.w      #0x0100,56(a3)
		clr.w      (a2)
		movea.l    a2,a1
		lea.l      (a7),a0
		move.w     d4,d0
		bsr        string_label
		move.b     (a7),d0
		beq.s      strings_3
		pea.l      xa53a0
		pea.l      4(a7)
		movea.l    a3,a1
		movea.l    a5,a0
		jsr        objname
		addq.w     #8,a7
		bra.w      strings_4
strings_3:
		cmpi.b     #0x5B,(a4)
		bne.s      strings_5
		cmpi.b     #0x30,1(a4)
		beq.s      strings_6
		cmpi.b     #0x31,1(a4)
		beq.s      strings_6
		cmpi.b     #0x32,1(a4)
		beq.s      strings_6
		cmpi.b     #0x33,1(a4)
		bne.s      strings_5
strings_6:
		cmpi.b     #0x5D,2(a4)
		bne.s      strings_5
		cmpi.b     #0x5B,3(a4)
		bne.s      strings_5
		move.w     #0x0001,(a2)
strings_5:
		move.w     (a2),d0
		beq.s      strings_7
		pea.l      xa53ad
		pea.l      xa53a1
		movea.l    a3,a1
		movea.l    a5,a0
		jsr        objname
		addq.w     #8,a7
		bra.s      strings_4
strings_7:
		pea.l      xa53be
		pea.l      xa53b6
		movea.l    a3,a1
		movea.l    a5,a0
		jsr        objname
		addq.w     #8,a7
strings_4:
		move.w     (a2),d0
		beq.s      strings_8
		movea.l    a3,a1
		movea.l    36(a5),a0
		jsr        add_entry
		bra.s      strings_9
strings_8:
		movea.l    a3,a1
		movea.l    52(a5),a0
		jsr        add_entry
strings_9:
		addq.w     #1,d4
strings_1:
		cmp.w      d4,d3
		bgt        strings_10
strings_2:
		lea.l      26(a7),a7
		movem.l    (a7)+,d3-d5/a2-a5
		rts

images:
		movem.l    d3-d4/a2/a4-a5,-(a7)
		lea.l      -20(a7),a7
		movea.l    a0,a4
		movea.l    a1,a2
		movea.l    a1,a0
		move.w     32(a0),d3
		moveq.l    #0,d0
		move.w     16(a0),d0
		lea.l      0(a2,d0.l),a1
		move.l     a1,16(a7)
		clr.w      d4
		bra.s      images_1
images_3:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    16(a7),a0
		move.l     0(a0,d0.l),d1
		lea.l      0(a2,d1.l),a5
		move.l     (a5),d2
		lea.l      0(a2,d2.l),a1
		move.l     a1,(a5)
		movea.l    a4,a0
		movea.l    a5,a1
		jsr        dup_image
		movea.l    a0,a5
		ori.w      #0x0100,56(a5)
		lea.l      (a7),a0
		move.w     d4,d0
		bsr        image_label
		move.b     (a7),d0
		beq.s      images_2
		pea.l      xa53a0
		pea.l      4(a7)
		movea.l    a5,a1
		movea.l    a4,a0
		jsr        objname
		addq.w     #8,a7
images_2:
		addq.w     #1,d4
images_1:
		cmp.w      d4,d3
		bgt.s      images_3
		lea.l      20(a7),a7
		movem.l    (a7)+,d3-d4/a2/a4-a5
		rts

fix_cicon:
		movem.l    d3/a2-a6,-(a7)
		subq.w     #8,a7
		move.l     a0,4(a7)
		move.l     a0,(a7)
fix_cicon_1:
		movea.l    (a7),a0
		addq.l     #4,(a7)
		move.l     (a0),d0
		beq.s      fix_cicon_1
		bra        fix_cicon_2
fix_cicon_9:
		movea.l    4(a7),a0
		addq.l     #4,4(a7)
		move.l     (a7),(a0)
		movea.l    (a7),a4
		moveq.l    #15,d3
		add.w      22(a4),d3
		and.w      #0xFFF0,d3
		muls.w     24(a4),d3
		asr.w      #3,d3
		ext.l      d3
		lea.l      38(a4),a5
		move.l     a5,4(a4)
		adda.l     d3,a5
		move.l     a5,(a4)
		adda.l     d3,a5
		move.l     a5,8(a4)
		lea.l      12(a5),a5
		suba.l     a6,a6
		movea.l    a6,a2
fix_cicon_6:
		movea.l    a5,a3
		cmpi.w     #0x0004,(a3)
		bne.s      fix_cicon_3
		movea.l    a3,a2
fix_cicon_3:
		cmpi.w     #0x0008,(a3)
		bne.s      fix_cicon_4
		movea.l    a3,a6
fix_cicon_4:
		lea.l      22(a5),a5
		move.l     a5,2(a3)
		move.l     d3,d0
		move.w     (a3),d1
		ext.l      d1
		jsr        _lmul
		adda.l     d0,a5
		move.l     a5,6(a3)
		adda.l     d3,a5
		move.l     10(a3),d0
		beq.s      fix_cicon_5
		move.l     a5,10(a3)
		move.l     d3,d0
		move.w     (a3),d1
		ext.l      d1
		jsr        _lmul
		adda.l     d0,a5
		move.l     a5,14(a3)
		adda.l     d3,a5
fix_cicon_5:
		move.l     18(a3),d0
		bne.s      fix_cicon_6
		clr.l      34(a4)
		move.l     a2,d0
		beq.s      fix_cicon_7
		move.l     d0,34(a4)
		move.l     a6,d1
		beq.s      fix_cicon_8
		move.l     d1,18(a2)
		bra.s      fix_cicon_8
fix_cicon_7:
		move.l     a6,d0
		beq.s      fix_cicon_8
		move.l     d0,34(a4)
fix_cicon_8:
		move.l     a5,(a7)
fix_cicon_2:
		movea.l    4(a7),a0
		move.l     (a0),d0
		beq        fix_cicon_9
		addq.w     #8,a7
		movem.l    (a7)+,d3/a2-a6
		rts

objects:
		movem.l    d3-d7/a2-a5,-(a7)
		lea.l      -76(a7),a7
		move.l     a0,72(a7)
		movea.l    a1,a2
		move.l     a1,4(a7)
		moveq.l    #0,d0
		move.w     34(a1),d0
		lea.l      0(a2,d0.l),a0
		move.l     4(a0),d1
		lea.l      0(a2,d1.l),a1
		move.l     a1,(a7)
		moveq.l    #4,d2
		movea.l    4(a7),a0
		and.w      (a0),d2
		beq.s      objects_1
		movea.l    a1,a0
		bsr        fix_cicon
objects_1:
		moveq.l    #-1,d3
		movea.l    4(a7),a0
		add.w      22(a0),d3
		moveq.l    #0,d0
		move.w     18(a0),d0
		lea.l      0(a2,d0.l),a1
		move.l     a1,26(a7)
		clr.w      d4
		bra        objects_2
objects_27:
		move.w     d4,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    26(a7),a0
		move.l     0(a0,d0.l),d1
		lea.l      0(a2,d1.l),a3
		movea.l    4(a7),a1
		moveq.l    #0,d7
		move.w     2(a1),d7
		moveq.l    #0,d0
		move.w     20(a1),d0
		move.l     d0,d2
		add.l      d2,d2
		add.l      d0,d2
		lsl.l      #3,d2
		add.l      d2,d7
		move.l     d1,d5
		clr.w      d6
		bra.s      objects_3
objects_5:
		move.w     d6,d0
		ext.l      d0
		lsl.l      #2,d0
		movea.l    26(a7),a0
		cmp.l      0(a0,d0.l),d5
		bge.s      objects_4
		cmp.l      0(a0,d0.l),d7
		ble.s      objects_4
		move.l     0(a0,d0.l),d7
objects_4:
		addq.w     #1,d6
objects_3:
		cmp.w      d6,d3
		bge.s      objects_5
		move.l     d7,d0
		sub.l      d5,d0
		moveq.l    #24,d1
		jsr        _uldiv
		move.l     d0,d5
		move.l     d5,d0
		lsl.l      #3,d0
		sub.l      d5,d0
		lsl.l      #3,d0
		movea.l    72(a7),a0
		jsr        objmalloc
		move.l     a0,68(a7)
		move.l     a0,d0
		beq        objects_6
		ori.w      #0x0100,56(a0)
		movea.l    d0,a1
		move.l     10(a0),14(a1)
		move.w     #0x0002,24(a7)
		lea.l      24(a7),a1
		lea.l      8(a7),a0
		move.w     d4,d0
		bsr        tree_label
		cmpi.w     #0x0002,24(a7)
		bne.s      objects_7
		cmpi.b     #0x19,7(a3)
		bne.s      objects_8
		move.w     4(a3),d0
		cmp.w      24(a3),d0
		bne.s      objects_8
		cmpi.b     #0x14,31(a3)
		bne.s      objects_8
		cmpi.w     #0x0002,26(a3)
		bne.s      objects_8
		cmpi.w     #0x0002,28(a3)
		bne.s      objects_8
		cmpi.w     #0x0001,48(a3)
		bne.s      objects_8
		cmpi.b     #0x19,55(a3)
		bne.s      objects_8
		move.w     #0x0001,24(a7)
		bra.s      objects_7
objects_8:
		clr.w      24(a7)
objects_7:
		move.b     8(a7),d0
		bne.s      objects_9
		move.w     24(a7),d1
		beq.s      objects_10
		pea.l      xa53a0
		pea.l      xa53cc
		movea.l    76(a7),a1
		movea.l    80(a7),a0
		jsr        objname
		addq.w     #8,a7
		bra.s      objects_11
objects_10:
		pea.l      xa53a0
		pea.l      xa53d4
		movea.l    76(a7),a1
		movea.l    80(a7),a0
		jsr        objname
		addq.w     #8,a7
		bra.s      objects_11
objects_9:
		pea.l      xa53a0
		pea.l      12(a7)
		movea.l    76(a7),a1
		movea.l    80(a7),a0
		jsr        objname
		addq.w     #8,a7
objects_11:
		move.w     24(a7),d0
		beq        objects_12
		move.w     2(a3),d7
		ext.l      d7
		move.l     d7,d2
		add.l      d2,d2
		add.l      d7,d2
		lsl.l      #3,d2
		move.w     2(a3,d2.l),d0
		ext.l      d0
		move.l     d0,d1
		add.l      d1,d1
		add.l      d0,d1
		lsl.l      #3,d1
		move.w     2(a3,d1.l),d6
		move.w     d6,d2
		ext.l      d2
		move.l     d2,d1
		add.l      d1,d1
		add.l      d2,d1
		lsl.l      #3,d1
		move.l     12(a3,d1.l),d7
		move.w     #0x0006,20(a3,d1.l)
		ori.w      #0x2000,10(a3,d1.l)
		clr.b      0(a2,d7.l)
		move.w     4(a3),d7
		ext.l      d7
		move.l     d7,d0
		add.l      d0,d0
		add.l      d7,d0
		lsl.l      #3,d0
		move.w     2(a3,d0.l),d7
		move.w     d7,d1
		ext.l      d1
		move.l     d1,d2
		add.l      d2,d2
		add.l      d1,d2
		lsl.l      #3,d2
		move.w     2(a3,d2.l),d6
		bra.s      objects_13
objects_14:
		move.w     d6,d1
		ext.l      d1
		move.l     d1,d0
		add.l      d0,d0
		add.l      d1,d0
		lsl.l      #3,d0
		ori.w      #0x2000,10(a3,d0.l)
		move.w     0(a3,d0.l),d6
objects_13:
		cmp.w      d7,d6
		bne.s      objects_14
objects_12:
		movea.l    68(a7),a0
		movea.l    4(a0),a5
		clr.w      d0
		move.w     d0,18(a3)
		move.w     d0,16(a3)
		clr.w      d6
		bra        objects_15
objects_24:
		moveq.l    #56,d0
		lea.l      obsproto,a1
		movea.l    a5,a0
		jsr        memcpy
		lea.l      8(a7),a0
		move.w     d6,d1
		move.w     d4,d0
		bsr        index_label
		move.b     8(a7),d0
		beq.s      objects_16
		movea.l    72(a7),a0
		moveq.l    #0,d0
		jsr        objmalloc
		movea.l    a0,a4
		move.l     a4,d0
		beq        objects_6
		pea.l      xa53a0
		pea.l      12(a7)
		movea.l    a4,a1
		movea.l    80(a7),a0
		jsr        objname
		addq.w     #8,a7
		move.l     a4,(a5)
objects_16:
		moveq.l    #24,d0
		movea.l    a3,a1
		lea.l      8(a5),a0
		jsr        memcpy
		andi.w     #0x00FF,14(a5)
		andi.w     #0x00DF,16(a5)
		andi.w     #0x203F,18(a5)
		move.b     7(a3),d0
		ext.w      d0
		sub.w      #0x0015,d0
		cmp.w      #0x000C,d0
		bhi        objects_17
		add.w      d0,d0
		move.w     J3(pc,d0.w),d0
		jmp        J3(pc,d0.w)
J3:
		dc.w objects_18-J3
		dc.w objects_18-J3
		dc.w objects_19-J3
		dc.w objects_20-J3
		dc.w objects_17-J3
		dc.w objects_21-J3
		dc.w objects_17-J3
		dc.w objects_21-J3
		dc.w objects_18-J3
		dc.w objects_18-J3
		dc.w objects_22-J3
		dc.w objects_21-J3
		dc.w objects_23-J3
objects_18:
		move.l     12(a3),d0
		lea.l      0(a2,d0.l),a4
		move.l     (a4),d1
		lea.l      0(a2,d1.l),a0
		move.l     a0,(a4)
		move.l     4(a4),d0
		lea.l      0(a2,d0.l),a1
		move.l     a1,4(a4)
		move.l     8(a4),d0
		lea.l      0(a2,d0.l),a0
		move.l     a0,8(a4)
		movea.l    a4,a1
		movea.l    72(a7),a0
		jsr        dup_tedinfo
		move.l     a0,20(a5)
		bra        objects_17
objects_19:
		move.l     12(a3),d0
		lea.l      0(a2,d0.l),a4
		move.l     (a4),d1
		lea.l      0(a2,d1.l),a0
		move.l     a0,(a4)
		movea.l    a4,a1
		movea.l    72(a7),a0
		jsr        dup_image
		move.l     a0,20(a5)
		bra        objects_17
objects_20:
		clr.l      20(a5)
		bra        objects_17
objects_21:
		move.l     20(a5),d0
		lea.l      0(a2,d0.l),a1
		movea.l    72(a7),a0
		jsr        dup_string
		move.l     a0,20(a5)
		bra.s      objects_17
objects_23:
		move.w     #0x001F,14(a5)
		move.l     12(a3),d0
		lsl.l      #2,d0
		movea.l    (a7),a0
		movea.l    0(a0,d0.l),a1
		movea.l    72(a7),a0
		jsr        dup_icon
		move.l     a0,20(a5)
		bra.s      objects_17
objects_22:
		move.l     12(a3),d0
		lea.l      0(a2,d0.l),a4
		move.l     (a4),d1
		lea.l      0(a2,d1.l),a0
		move.l     a0,(a4)
		move.l     4(a4),d0
		lea.l      0(a2,d0.l),a1
		move.l     a1,4(a4)
		move.l     8(a4),d0
		lea.l      0(a2,d0.l),a0
		move.l     a0,8(a4)
		moveq.l    #34,d0
		movea.l    a4,a1
		lea.l      30(a7),a0
		jsr        memcpy
		clr.l      64(a7)
		lea.l      30(a7),a1
		movea.l    72(a7),a0
		jsr        dup_icon
		move.l     a0,20(a5)
objects_17:
		lea.l      56(a5),a5
		lea.l      24(a3),a3
		addq.w     #1,d6
objects_15:
		move.w     d6,d0
		ext.l      d0
		cmp.l      d0,d5
		bgt        objects_24
		move.w     24(a7),d1
		beq.s      objects_25
		movea.l    68(a7),a1
		movea.l    72(a7),a0
		movea.l    28(a0),a0
		jsr        add_entry
		bra.s      objects_26
objects_25:
		movea.l    68(a7),a1
		movea.l    72(a7),a0
		movea.l    24(a0),a0
		jsr        add_entry
objects_26:
		addq.w     #1,d4
objects_2:
		cmp.w      d4,d3
		bge        objects_27
objects_6:
		lea.l      76(a7),a7
		movem.l    (a7)+,d3-d7/a2-a5
		rts

	.globl read_rsc
read_rsc:
		move.l     a2,-(a7)
		move.l     a3,-(a7)
		lea.l      -36(a7),a7
		movea.l    a0,a2
		moveq.l    #46,d0
		movea.l    8(a2),a0
		jsr        strrchr
		movea.l    a0,a3
		lea.l      xa53de,a1
		jsr        strcpy
		movea.l    a2,a0
		bsr        load_dfn
		lea.l      xa53e3,a1
		movea.l    a3,a0
		jsr        strcpy
		moveq.l    #36,d0
		lea.l      (a7),a0
		jsr        read_buf
		movea.l    a2,a0
		jsr        init_acs
		lea.l      iobuf,a3
		movea.l    a3,a1
		movea.l    a2,a0
		bsr        objects
		movea.l    a3,a1
		movea.l    a2,a0
		bsr        strings
		movea.l    a3,a1
		movea.l    a2,a0
		bsr        images
		movea.l    dfna,a0
		jsr        Ax_free
		lea.l      36(a7),a7
		movea.l    (a7)+,a3
		movea.l    (a7)+,a2
		rts

	.data

xa53a0:
		dc.b 0
xa53a1:
		dc.b 'ALERTBOX_01',0
xa53ad:
		dc.b 'Alertbox',0
xa53b6:
		dc.b 'TEXT_01',0
xa53be:
		dc.b 'Freier String',0
xa53cc:
		dc.b 'MENU_01',0
xa53d4:
		dc.b 'OBJECT_01',0
xa53de:
		dc.b '.DFN',0
xa53e3:
		dc.b '.ACS',0

	.bss
	.globl mapX
mapX: ds.w 1000
iobuf: ds.b 131072
	.globl iostring
iostring: ds.b 1024

dfna: ds.l 1
dfn_size: ds.w 1
