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
