add_image:
[00034c1a] 48e7 003c                 movem.l    a2-a5,-(a7)
[00034c1e] 2448                      movea.l    a0,a2
[00034c20] 2849                      movea.l    a1,a4
[00034c22] 006a 0001 0006            ori.w      #$0001,6(a2)
[00034c28] 266a 0030                 movea.l    48(a2),a3
[00034c2c] 3039 0008 480c            move.w     refimages,d0
[00034c32] 6728                      beq.s      $00034C5C
[00034c34] 7206                      moveq.l    #6,d1
[00034c36] 2279 0010 ee4e            movea.l    ACSblk,a1
[00034c3c] c269 0266                 and.w      614(a1),d1
[00034c40] 5d41                      subq.w     #6,d1
[00034c42] 6718                      beq.s      $00034C5C
[00034c44] 43ec 0016                 lea.l      22(a4),a1
[00034c48] 204b                      movea.l    a3,a0
[00034c4a] 4eb9 0003 337c            jsr        find_entry
[00034c50] b9c8                      cmpa.l     a0,a4
[00034c52] 6608                      bne.s      $00034C5C
[00034c54] 526c 0036                 addq.w     #1,54(a4)
[00034c58] 204c                      movea.l    a4,a0
[00034c5a] 6044                      bra.s      $00034CA0
[00034c5c] 7004                      moveq.l    #4,d0
[00034c5e] 204b                      movea.l    a3,a0
[00034c60] 4eb9 0001 8028            jsr        objextent
[00034c66] 4a40                      tst.w      d0
[00034c68] 6610                      bne.s      $00034C7A
[00034c6a] 224c                      movea.l    a4,a1
[00034c6c] 204a                      movea.l    a2,a0
[00034c6e] 4eb9 0003 4ca6            jsr        copy_image
[00034c74] 2a48                      movea.l    a0,a5
[00034c76] 200d                      move.l     a5,d0
[00034c78] 6604                      bne.s      $00034C7E
[00034c7a] 91c8                      suba.l     a0,a0
[00034c7c] 6022                      bra.s      $00034CA0
[00034c7e] 2f39 000c e4e6            move.l     $000CE4E6,-(a7)
[00034c84] 486c 0016                 pea.l      22(a4)
[00034c88] 224d                      movea.l    a5,a1
[00034c8a] 204a                      movea.l    a2,a0
[00034c8c] 4eb9 0001 81c6            jsr        objname
[00034c92] 504f                      addq.w     #8,a7
[00034c94] 224d                      movea.l    a5,a1
[00034c96] 204b                      movea.l    a3,a0
[00034c98] 4eb9 0003 33b4            jsr        add_entry
[00034c9e] 204d                      movea.l    a5,a0
[00034ca0] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00034ca4] 4e75                      rts
copy_image:
[00034ca6] 2f0a                      move.l     a2,-(a7)
[00034ca8] 2f0b                      move.l     a3,-(a7)
[00034caa] 2648                      movea.l    a0,a3
[00034cac] 2449                      movea.l    a1,a2
[00034cae] 202a 000e                 move.l     14(a2),d0
[00034cb2] 4eb9 0001 7fae            jsr        objmalloc
[00034cb8] 2648                      movea.l    a0,a3
[00034cba] 200b                      move.l     a3,d0
[00034cbc] 6604                      bne.s      $00034CC2
[00034cbe] 91c8                      suba.l     a0,a0
[00034cc0] 601a                      bra.s      $00034CDC
[00034cc2] 276a 000e 000e            move.l     14(a2),14(a3)
[00034cc8] 202a 000e                 move.l     14(a2),d0
[00034ccc] 226a 0004                 movea.l    4(a2),a1
[00034cd0] 206b 0004                 movea.l    4(a3),a0
[00034cd4] 4eb9 0008 3500            jsr        memcpy
[00034cda] 204b                      movea.l    a3,a0
[00034cdc] 265f                      movea.l    (a7)+,a3
[00034cde] 245f                      movea.l    (a7)+,a2
[00034ce0] 4e75                      rts
dup_image:
[00034ce2] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[00034ce6] 2648                      movea.l    a0,a3
[00034ce8] 2449                      movea.l    a1,a2
[00034cea] 49f9 000c e50e            lea.l      free_image,a4
[00034cf0] 700e                      moveq.l    #14,d0
[00034cf2] 224a                      movea.l    a2,a1
[00034cf4] 41ec fff2                 lea.l      -14(a4),a0
[00034cf8] 4eb9 0008 3500            jsr        memcpy
[00034cfe] 362a 0004                 move.w     4(a2),d3
[00034d02] c7ea 0006                 muls.w     6(a2),d3
[00034d06] 48c3                      ext.l      d3
[00034d08] 2003                      move.l     d3,d0
[00034d0a] d080                      add.l      d0,d0
[00034d0c] d0bc 0000 000e            add.l      #$0000000E,d0
[00034d12] 2940 000a                 move.l     d0,10(a4)
[00034d16] 2940 000e                 move.l     d0,14(a4)
[00034d1a] 224c                      movea.l    a4,a1
[00034d1c] 204b                      movea.l    a3,a0
[00034d1e] 6100 fefa                 bsr        add_image
[00034d22] 2648                      movea.l    a0,a3
[00034d24] 200b                      move.l     a3,d0
[00034d26] 6604                      bne.s      $00034D2C
[00034d28] 91c8                      suba.l     a0,a0
[00034d2a] 6028                      bra.s      $00034D54
[00034d2c] 286b 0004                 movea.l    4(a3),a4
[00034d30] 2003                      move.l     d3,d0
[00034d32] 2252                      movea.l    (a2),a1
[00034d34] 41ec 000e                 lea.l      14(a4),a0
[00034d38] 4eb9 0008 3500            jsr        memcpy
[00034d3e] 2003                      move.l     d3,d0
[00034d40] 2252                      movea.l    (a2),a1
[00034d42] 41f4 380e                 lea.l      14(a4,d3.l),a0
[00034d46] 4eb9 0008 3500            jsr        memcpy
[00034d4c] 28bc 0000 000e            move.l     #$0000000E,(a4)
[00034d52] 204b                      movea.l    a3,a0
[00034d54] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[00034d58] 4e75                      rts
del_image:
[00034d5a] 48e7 003c                 movem.l    a2-a5,-(a7)
[00034d5e] 2448                      movea.l    a0,a2
[00034d60] 2649                      movea.l    a1,a3
[00034d62] 006a 0001 0006            ori.w      #$0001,6(a2)
[00034d68] 536b 0036                 subq.w     #1,54(a3)
[00034d6c] 302b 0036                 move.w     54(a3),d0
[00034d70] 6e2a                      bgt.s      $00034D9C
[00034d72] 286b 0012                 movea.l    18(a3),a4
[00034d76] 220c                      move.l     a4,d1
[00034d78] 670c                      beq.s      $00034D86
[00034d7a] 2a6c 0004                 movea.l    4(a4),a5
[00034d7e] 204c                      movea.l    a4,a0
[00034d80] 7002                      moveq.l    #2,d0
[00034d82] 93c9                      suba.l     a1,a1
[00034d84] 4e95                      jsr        (a5)
[00034d86] 224b                      movea.l    a3,a1
[00034d88] 206a 0030                 movea.l    48(a2),a0
[00034d8c] 4eb9 0003 3420            jsr        del_entry
[00034d92] 224b                      movea.l    a3,a1
[00034d94] 204a                      movea.l    a2,a0
[00034d96] 4eb9 0001 7f52            jsr        objfree
[00034d9c] 4cdf 3c00                 movem.l    (a7)+,a2-a5
[00034da0] 4e75                      rts
new_work:
[00034da2] 303c 2721                 move.w     #$2721,d0
[00034da6] 2279 000b 1db8            movea.l    $000B1DB8,a1
[00034dac] 4eb9 0003 3dd6            jsr        work_icon
[00034db2] 4e75                      rts

	.data

bitblk_obj:
[000ce3f6]                           dc.w $0000
[000ce3f8]                           dc.w $000e
[000ce3fa]                           dc.w $0006
[000ce3fc]                           dc.w $0018
[000ce3fe]                           dc.w $0000
[000ce400]                           dc.w $0000
[000ce402]                           dc.w $0001
imagedata:
[000ce404]                           dc.w $07ff
[000ce406]                           dc.w $ffff
[000ce408]                           dc.w $ff80
[000ce40a]                           dc.w $0c00
[000ce40c]                           dc.w $0000
[000ce40e]                           dc.w $00c0
[000ce410]                           dc.w $183f
[000ce412]                           dc.w $f03f
[000ce414]                           dc.w $f060
[000ce416]                           dc.w $187f
[000ce418]                           dc.w $f860
[000ce41a]                           dc.w $1860
[000ce41c]                           dc.w $187f
[000ce41e]                           dc.w $f860
[000ce420]                           dc.w $1860
[000ce422]                           dc.w $187f
[000ce424]                           dc.w $f860
[000ce426]                           dc.w $1860
[000ce428]                           dc.w $187f
[000ce42a]                           dc.w $f860
[000ce42c]                           dc.w $1860
[000ce42e]                           dc.w $187f
[000ce430]                           dc.w $f860
[000ce432]                           dc.w $1860
[000ce434]                           dc.w $187f
[000ce436]                           dc.w $f860
[000ce438]                           dc.w $1860
[000ce43a]                           dc.w $187f
[000ce43c]                           dc.w $f860
[000ce43e]                           dc.w $1860
[000ce440]                           dc.w $187f
[000ce442]                           dc.w $f860
[000ce444]                           dc.w $1860
[000ce446]                           dc.w $187f
[000ce448]                           dc.w $f860
[000ce44a]                           dc.w $1860
[000ce44c]                           dc.w $187f
[000ce44e]                           dc.w $f860
[000ce450]                           dc.w $1860
[000ce452]                           dc.w $187f
[000ce454]                           dc.w $f860
[000ce456]                           dc.w $1860
[000ce458]                           dc.w $183f
[000ce45a]                           dc.w $f03f
[000ce45c]                           dc.w $f060
[000ce45e]                           dc.w $0c00
[000ce460]                           dc.w $0000
[000ce462]                           dc.w $00c0
[000ce464]                           dc.w $07ff
[000ce466]                           dc.w $ffff
[000ce468]                           dc.w $ff80
[000ce46a]                           dc.w $0000
[000ce46c]                           dc.w $0000
[000ce46e]                           dc.w $0000
[000ce470]                           dc.w $3f30
[000ce472]                           dc.w $c787
[000ce474]                           dc.w $8fe0
[000ce476]                           dc.w $0c39
[000ce478]                           dc.w $cccc
[000ce47a]                           dc.w $cc00
[000ce47c]                           dc.w $0c36
[000ce47e]                           dc.w $cfcc
[000ce480]                           dc.w $0f80
[000ce482]                           dc.w $0c30
[000ce484]                           dc.w $cccd
[000ce486]                           dc.w $cc00
[000ce488]                           dc.w $3f30
[000ce48a]                           dc.w $ccc7
[000ce48c]                           dc.w $cfe0
[000ce48e]                           dc.w $0000
[000ce490]                           dc.w $0000
[000ce492]                           dc.w $0000
protoimage:
[000ce494]                           dc.w $0000
[000ce496]                           dc.w $0000
[000ce498] 000ce3f6                  dc.l bitblk_obj
[000ce49c]                           dc.w $0000
[000ce49e]                           dc.w $0000
[000ce4a0]                           dc.w $009e
[000ce4a2]                           dc.w $0000
[000ce4a4]                           dc.w $009e
[000ce4a6]                           dc.w $0000
[000ce4a8]                           dc.w $0000
[000ce4aa]                           dc.b 'IMAGE_01',0
[000ce4b3]                           dc.b $00
[000ce4b4]                           dc.w $0000
[000ce4b6]                           dc.w $0000
[000ce4b8]                           dc.w $0000
[000ce4ba]                           dc.w $0000
[000ce4bc]                           dc.w $0000
[000ce4be]                           dc.w $0000
[000ce4c0]                           dc.w $0000
[000ce4c2]                           dc.w $0000
[000ce4c4]                           dc.w $0000
[000ce4c6]                           dc.w $0000
[000ce4c8]                           dc.w $0000
[000ce4ca]                           dc.w $0001
[000ce4cc]                           dc.w $0000
[000ce4ce]                           dc.w $0000
[000ce4d0]                           dc.w $0000
[000ce4d2]                           dc.w $0000
[000ce4d4]                           dc.w $0000
list_image:
[000ce4d6]                           dc.w $0000
[000ce4d8]                           dc.w $0000
[000ce4da]                           dc.w $0000
[000ce4dc]                           dc.w $0000
[000ce4de] 000b1d5e                  dc.l WI_IMAGE
[000ce4e2] 000cd02d                  dc.l im_list
[000ce4e6] 000cd03c                  dc.l im_name
[000ce4ea]                           dc.w $2721
[000ce4ec] 000ce494                  dc.l protoimage
[000ce4f0] 00034ca6                  dc.l copy_image
[000ce4f4] 00034d5a                  dc.l del_image
[000ce4f8] 00034da2                  dc.l new_work
[000ce4fc]                           dc.w $0000
[000ce4fe]                           dc.w $0000
my_image:
[000ce500]                           dc.w $0000
[000ce502]                           dc.w $0000
[000ce504]                           dc.w $0000
[000ce506]                           dc.w $0000
[000ce508]                           dc.w $0000
[000ce50a]                           dc.w $0000
[000ce50c]                           dc.w $0000
free_image:
[000ce50e]                           dc.w $0000
[000ce510]                           dc.w $0000
[000ce512] 000ce500                  dc.l my_image
[000ce516]                           dc.w $0000
[000ce518]                           dc.w $0000
[000ce51a]                           dc.w $0000
[000ce51c]                           dc.w $0000
[000ce51e]                           dc.w $0000
[000ce520]                           dc.w $0000
[000ce522]                           dc.w $0000
[000ce524]                           dc.b 'IMAGE_01',0
[000ce52d]                           dc.b $00
[000ce52e]                           dc.w $0000
[000ce530]                           dc.w $0000
[000ce532]                           dc.w $0000
[000ce534]                           dc.w $0000
[000ce536]                           dc.w $0000
[000ce538]                           dc.w $0000
[000ce53a]                           dc.w $0000
[000ce53c]                           dc.w $0000
[000ce53e]                           dc.w $0000
[000ce540]                           dc.w $0000
[000ce542]                           dc.w $0000
[000ce544]                           dc.w $0001
[000ce546]                           dc.w $0000
[000ce548]                           dc.w $0000
[000ce54a]                           dc.w $0000
[000ce54c]                           dc.w $0000
[000ce54e]                           dc.w $0000
