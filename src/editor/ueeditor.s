init_editor:
[00027476] 2f0a                      move.l     a2,-(a7)
[00027478] 2f0b                      move.l     a3,-(a7)
[0002747a] 2448                      movea.l    a0,a2
[0002747c] 43f9 000b cfbc            lea.l      data,a1
[00027482] 303c 2329                 move.w     #$2329,d0
[00027486] 266a 0004                 movea.l    4(a2),a3
[0002748a] 4e93                      jsr        (a3)
[0002748c] 265f                      movea.l    (a7)+,a3
[0002748e] 245f                      movea.l    (a7)+,a2
[00027490] 4e75                      rts

minsize:
[00027492] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027498] 3028 0012                 move.w     18(a0),d0
[0002749c] e748                      lsl.w      #3,d0
[0002749e] 3280                      move.w     d0,(a1)
[000274a0] 2079 0010 ee4e            movea.l    ACSblk,a0
[000274a6] 3228 0014                 move.w     20(a0),d1
[000274aa] d241                      add.w      d1,d1
[000274ac] 226f 0004                 movea.l    4(a7),a1
[000274b0] 3281                      move.w     d1,(a1)
[000274b2] 4e75                      rts

object_tree:
[000274b4] 91c8                      suba.l     a0,a0
[000274b6] 4e75                      rts

test_it:
[000274b8] 22bc 0003 7bfa            move.l     #A_editor,(a1)
[000274be] 237c 0003 a772 0008       move.l     #Auo_editor,8(a1)
[000274c6] 7000                      moveq.l    #0,d0
[000274c8] 2340 0014                 move.l     d0,20(a1)
[000274cc] 2340 0010                 move.l     d0,16(a1)
[000274d0] 2340 000c                 move.l     d0,12(a1)
[000274d4] 42a9 0018                 clr.l      24(a1)
[000274d8] 42a9 001c                 clr.l      28(a1)
[000274dc] 4e75                      rts

abort:
[000274de] 2079 000b cffc            movea.l    $000BCFFC,a0
[000274e4] 2050                      movea.l    (a0),a0
[000274e6] 4e90                      jsr        (a0)
[000274e8] 4e75                      rts

	.data

visual:
[000bcf5e]                           dc.w $ffff
[000bcf60]                           dc.w $ffff
[000bcf62]                           dc.w $ffff
[000bcf64]                           dc.w $001a
[000bcf66]                           dc.w $0000
[000bcf68]                           dc.w $0000
[000bcf6a] 000bd00c                  dc.l $000bd00c
[000bcf6e]                           dc.w $0000
[000bcf70]                           dc.w $0000
[000bcf72]                           dc.w $000a
[000bcf74]                           dc.w $0002
logical:
[000bcf76]                           dc.w $ffff
[000bcf78]                           dc.w $ffff
[000bcf7a]                           dc.w $ffff
[000bcf7c]                           dc.w $0018
[000bcf7e]                           dc.w $0000
[000bcf80]                           dc.w $0000
[000bcf82]                           dc.w $0000
[000bcf84]                           dc.w $0000
[000bcf86]                           dc.w $0000
[000bcf88]                           dc.w $0000
[000bcf8a]                           dc.w $0008
[000bcf8c]                           dc.w $0002
aud:
[000bcf8e] 000bd013                  dc.l $000bd013
[000bcf92] 000bd018                  dc.l $000bd018
[000bcf96]                           dc.w $0000
[000bcf98]                           dc.w $0000
[000bcf9a]                           dc.w $0000
[000bcf9c]                           dc.w $0000
[000bcf9e]                           dc.w $0000
[000bcfa0]                           dc.w $0000
[000bcfa2]                           dc.w $0000
[000bcfa4]                           dc.w $0000
[000bcfa6]                           dc.w $0000
[000bcfa8]                           dc.w $0000
[000bcfaa]                           dc.w $0000
[000bcfac]                           dc.w $0000
[000bcfae]                           dc.w $0000
[000bcfb0]                           dc.w $0000
[000bcfb2]                           dc.w $0000
[000bcfb4]                           dc.w $0000
[000bcfb6]                           dc.w $0000
[000bcfb8]                           dc.w $0000
[000bcfba]                           dc.w $0000
data:
[000bcfbc]                           dc.b 'A_editor',0
[000bcfc5]                           dc.b $00
[000bcfc6]                           dc.w $0000
[000bcfc8]                           dc.w $0000
[000bcfca]                           dc.w $0000
[000bcfcc]                           dc.w $0000
[000bcfce]                           dc.w $0000
[000bcfd0]                           dc.w $0000
[000bcfd2]                           dc.w $0000
[000bcfd4]                           dc.w $0000
[000bcfd6]                           dc.w $0000
[000bcfd8]                           dc.w $0000
[000bcfda]                           dc.w $0000
[000bcfdc] 000274b4                  dc.l object_tree
[000bcfe0] 000274b8                  dc.l test_it
[000bcfe4] 000274de                  dc.l abort
[000bcfe8] 0004f20a                  dc.l Aob_delete
[000bcfec] 000bcf5e                  dc.l visual
[000bcff0] 000bcf76                  dc.l logical
[000bcff4] 000bcf8e                  dc.l aud
[000bcff8] 00027492                  dc.l minsize
[000bcffc]                           dc.w $0000
[000bcffe]                           dc.w $0000
[000bd000] 000bd023                  dc.l $000bd023
[000bd004] 000bd02d                  dc.l $000bd02d
[000bd008]                           dc.w $0000
[000bd00a]                           dc.w $0000
[000bd00c]                           dc.b 'EDITOR',0
[000bd013]                           dc.b '0x0L',0
[000bd018]                           dc.b 'Auo_editor',0
[000bd023]                           dc.b ' EDITOR |',0
[000bd02d]                           dc.b 'Der Editor',0
