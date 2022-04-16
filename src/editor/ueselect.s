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

	.data

visual:
[000bce88]                           dc.w $ffff
[000bce8a]                           dc.w $ffff
[000bce8c]                           dc.w $ffff
[000bce8e]                           dc.w $001a
[000bce90]                           dc.w $0000
[000bce92]                           dc.w $0000
[000bce94] 000bcf36                  dc.l $000bcf36
[000bce98]                           dc.w $0000
[000bce9a]                           dc.w $0000
[000bce9c]                           dc.w $0008
[000bce9e]                           dc.w $0002
logical:
[000bcea0]                           dc.w $ffff
[000bcea2]                           dc.w $ffff
[000bcea4]                           dc.w $ffff
[000bcea6]                           dc.w $0018
[000bcea8]                           dc.w $0000
[000bceaa]                           dc.w $0000
[000bceac]                           dc.w $0000
[000bceae]                           dc.w $0000
[000bceb0]                           dc.w $0000
[000bceb2]                           dc.w $0000
[000bceb4]                           dc.w $0008
[000bceb6]                           dc.w $0002
aud:
[000bceb8] 000bcf3d                  dc.l $000bcf3d
[000bcebc] 000bcf3c                  dc.l $000bcf3c
[000bcec0]                           dc.w $0000
[000bcec2]                           dc.w $0000
[000bcec4]                           dc.w $0000
[000bcec6]                           dc.w $0000
[000bcec8]                           dc.w $0000
[000bceca]                           dc.w $0000
[000bcecc]                           dc.w $0000
[000bcece]                           dc.w $0000
[000bced0]                           dc.w $0000
[000bced2]                           dc.w $0000
[000bced4]                           dc.w $0000
[000bced6]                           dc.w $0000
[000bced8]                           dc.w $0000
[000bceda]                           dc.w $0000
[000bcedc]                           dc.w $0000
[000bcede]                           dc.w $0000
[000bcee0]                           dc.w $0000
[000bcee2]                           dc.w $0000
[000bcee4]                           dc.w $0000
data:
[000bcee6]                           dc.b 'A_select',0
[000bceef]                           dc.b $00
[000bcef0]                           dc.w $0000
[000bcef2]                           dc.w $0000
[000bcef4]                           dc.w $0000
[000bcef6]                           dc.w $0000
[000bcef8]                           dc.w $0000
[000bcefa]                           dc.w $0000
[000bcefc]                           dc.w $0000
[000bcefe]                           dc.w $0000
[000bcf00]                           dc.w $0000
[000bcf02]                           dc.w $0000
[000bcf04]                           dc.w $0000
[000bcf06] 00027444                  dc.l object_tree
[000bcf0a] 00027448                  dc.l test_it
[000bcf0e] 0002746a                  dc.l abort
[000bcf12] 0004f20a                  dc.l Aob_delete
[000bcf16] 000bce88                  dc.l visual
[000bcf1a] 000bcea0                  dc.l logical
[000bcf1e] 000bceb8                  dc.l aud
[000bcf22] 0002742a                  dc.l minsize
[000bcf26]                           dc.w $0000
[000bcf28]                           dc.w $0000
[000bcf2a] 000bcf42                  dc.l $000bcf42
[000bcf2e] 000bcf4b                  dc.l $000bcf4b
[000bcf32]                           dc.w $0000
[000bcf34]                           dc.w $0000
[000bcf36]                           dc.b 'SELECT',0
[000bcf3d]                           dc.b '0x0L',0
[000bcf42]                           dc.b 'SELECT |',0
[000bcf4b]                           dc.b 'Der Select-Editor',0
[000bcf5d]                           dc.b $00
