init_select:
[0002740e] 2f0a                      move.l     a2,-(a7)
[00027410] 2f0b                      move.l     a3,-(a7)
[00027412] 2448                      movea.l    a0,a2
[00027414] 43f9 000b cee6            lea.l      data,a1
[0002741a] 303c 2329                 move.w     #$2329,d0
[0002741e] 266a 0004                 movea.l    4(a2),a3
[00027422] 4e93                      jsr        (a3)
[00027424] 265f                      movea.l    (a7)+,a3
[00027426] 245f                      movea.l    (a7)+,a2
[00027428] 4e75                      rts
minsize:
[0002742a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00027430] 32a8 0012                 move.w     18(a0),(a1)
[00027434] 2079 0010 ee4e            movea.l    ACSblk,a0
[0002743a] 226f 0004                 movea.l    4(a7),a1
[0002743e] 32a8 0014                 move.w     20(a0),(a1)
[00027442] 4e75                      rts
object_tree:
[00027444] 91c8                      suba.l     a0,a0
[00027446] 4e75                      rts
test_it:
[00027448] 22bc 0006 61d6            move.l     #A_select,(a1)
[0002744e] 42a9 0008                 clr.l      8(a1)
[00027452] 7000                      moveq.l    #0,d0
[00027454] 2340 0014                 move.l     d0,20(a1)
[00027458] 2340 0010                 move.l     d0,16(a1)
[0002745c] 2340 000c                 move.l     d0,12(a1)
[00027460] 42a9 0018                 clr.l      24(a1)
[00027464] 42a9 001c                 clr.l      28(a1)
[00027468] 4e75                      rts
abort:
[0002746a] 2079 000b cf26            movea.l    $000BCF26,a0
[00027470] 2050                      movea.l    (a0),a0
[00027472] 4e90                      jsr        (a0)
[00027474] 4e75                      rts
