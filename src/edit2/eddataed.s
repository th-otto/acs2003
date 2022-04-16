editdat_abort:
[0001d31e] 2079 0010 ee4e            movea.l    ACSblk,a0
[0001d324] 2068 0258                 movea.l    600(a0),a0
[0001d328] 4eb9 0001 d418            jsr        term
[0001d32e] 4e75                      rts

dt_make:
[0001d330] 48e7 0038                 movem.l    a2-a4,-(a7)
[0001d334] 594f                      subq.w     #4,a7
[0001d336] 2448                      movea.l    a0,a2
[0001d338] 266a 0004                 movea.l    4(a2),a3
[0001d33c] 286b 0012                 movea.l    18(a3),a4
[0001d340] 200c                      move.l     a4,d0
[0001d342] 670a                      beq.s      dt_make_1
[0001d344] 204c                      movea.l    a4,a0
[0001d346] 4eb9 0005 6bea            jsr        Awi_show
[0001d34c] 6076                      bra.s      dt_make_2
dt_make_1:
[0001d34e] 7008                      moveq.l    #8,d0
[0001d350] 4eb9 0004 c608            jsr        Ax_malloc
[0001d356] 2e88                      move.l     a0,(a7)
[0001d358] 2008                      move.l     a0,d0
[0001d35a] 6764                      beq.s      dt_make_3
[0001d35c] 224a                      movea.l    a2,a1
[0001d35e] 7008                      moveq.l    #8,d0
[0001d360] 4eb9 0008 3500            jsr        memcpy
[0001d366] 41eb 0016                 lea.l      22(a3),a0
[0001d36a] 23c8 000a 9476            move.l     a0,$000A9476
[0001d370] 2279 000a 9482            movea.l    $000A9482,a1
[0001d376] 2348 0008                 move.l     a0,8(a1)
[0001d37a] 41f9 000a 9428            lea.l      WI_DATA,a0
[0001d380] 4eb9 0005 7052            jsr        Awi_create
[0001d386] 2848                      movea.l    a0,a4
[0001d388] 200c                      move.l     a4,d0
[0001d38a] 6734                      beq.s      dt_make_3
[0001d38c] 2252                      movea.l    (a2),a1
[0001d38e] 4869 0168                 pea.l      360(a1)
[0001d392] 43eb 003a                 lea.l      58(a3),a1
[0001d396] 4eb9 0001 6372            jsr        wi_pos
[0001d39c] 584f                      addq.w     #4,a7
[0001d39e] 2897                      move.l     (a7),(a4)
[0001d3a0] 274c 0012                 move.l     a4,18(a3)
[0001d3a4] 204c                      movea.l    a4,a0
[0001d3a6] 4eb9 0001 d414            jsr        set_data
[0001d3ac] 204c                      movea.l    a4,a0
[0001d3ae] 226c 000c                 movea.l    12(a4),a1
[0001d3b2] 4e91                      jsr        (a1)
[0001d3b4] 4a40                      tst.w      d0
[0001d3b6] 670c                      beq.s      dt_make_2
[0001d3b8] 204c                      movea.l    a4,a0
[0001d3ba] 4eb9 0001 d418            jsr        term
dt_make_3:
[0001d3c0] 91c8                      suba.l     a0,a0
[0001d3c2] 6002                      bra.s      dt_make_4
dt_make_2:
[0001d3c4] 204c                      movea.l    a4,a0
dt_make_4:
[0001d3c6] 584f                      addq.w     #4,a7
[0001d3c8] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[0001d3cc] 4e75                      rts

dt_service:
[0001d3ce] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[0001d3d2] 2448                      movea.l    a0,a2
[0001d3d4] 3600                      move.w     d0,d3
[0001d3d6] 2849                      movea.l    a1,a4
[0001d3d8] 2650                      movea.l    (a0),a3
[0001d3da] 5540                      subq.w     #2,d0
[0001d3dc] 6708                      beq.s      dt_service_1
[0001d3de] 907c 270e                 sub.w      #$270E,d0
[0001d3e2] 670c                      beq.s      dt_service_2
[0001d3e4] 6018                      bra.s      dt_service_3
dt_service_1:
[0001d3e6] 204a                      movea.l    a2,a0
[0001d3e8] 4eb9 0001 d418            jsr        term
[0001d3ee] 601c                      bra.s      dt_service_4
dt_service_2:
[0001d3f0] 226b 0004                 movea.l    4(a3),a1
[0001d3f4] 204a                      movea.l    a2,a0
[0001d3f6] 4eb9 0001 60ea            jsr        new_name
[0001d3fc] 600e                      bra.s      dt_service_4
dt_service_3:
[0001d3fe] 224c                      movea.l    a4,a1
[0001d400] 3003                      move.w     d3,d0
[0001d402] 204a                      movea.l    a2,a0
[0001d404] 4eb9 0005 9dd0            jsr        Awi_service
[0001d40a] 6002                      bra.s      dt_service_5
dt_service_4:
[0001d40c] 7001                      moveq.l    #1,d0
dt_service_5:
[0001d40e] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0001d412] 4e75                      rts

set_data:
[0001d414] 2250                      movea.l    (a0),a1
[0001d416] 4e75                      rts

term:
[0001d418] 2f0a                      move.l     a2,-(a7)
[0001d41a] 2f0b                      move.l     a3,-(a7)
[0001d41c] 2448                      movea.l    a0,a2
[0001d41e] 006a 0100 0056            ori.w      #$0100,86(a2)
[0001d424] 2650                      movea.l    (a0),a3
[0001d426] 226b 0004                 movea.l    4(a3),a1
[0001d42a] 42a9 0012                 clr.l      18(a1)
[0001d42e] 302a 0056                 move.w     86(a2),d0
[0001d432] c07c 0800                 and.w      #$0800,d0
[0001d436] 6716                      beq.s      term_1
[0001d438] 43ea 002c                 lea.l      44(a2),a1
[0001d43c] 206b 0004                 movea.l    4(a3),a0
[0001d440] 41e8 003a                 lea.l      58(a0),a0
[0001d444] 7008                      moveq.l    #8,d0
[0001d446] 4eb9 0008 3500            jsr        memcpy
[0001d44c] 6014                      bra.s      term_2
term_1:
[0001d44e] 7008                      moveq.l    #8,d0
[0001d450] 43ea 0024                 lea.l      36(a2),a1
[0001d454] 206b 0004                 movea.l    4(a3),a0
[0001d458] 41e8 003a                 lea.l      58(a0),a0
[0001d45c] 4eb9 0008 3500            jsr        memcpy
term_2:
[0001d462] 204b                      movea.l    a3,a0
[0001d464] 4eb9 0004 c7c8            jsr        Ax_free
[0001d46a] 204a                      movea.l    a2,a0
[0001d46c] 4eb9 0005 8362            jsr        Awi_closed
[0001d472] 204a                      movea.l    a2,a0
[0001d474] 4eb9 0005 85f2            jsr        Awi_delete
[0001d47a] 265f                      movea.l    (a7)+,a3
[0001d47c] 245f                      movea.l    (a7)+,a2
[0001d47e] 4e75                      rts

	.data

TEXT_002:
[000a8d40]                           dc.b 0
TEXT_003:
[000a8d41]                           dc.b 'Datenbl”cke werden von USERDEFs benutzt, und sind daher von den entsprechenden Editoren zu bearbeiten.',0
TEXT_005:
[000a8da8]                           dc.b 'OK',0
TEXT_006:
[000a8dab]                           dc.b 'DATEN',0
TEXT_01:
[000a8db1]                           dc.b ' Data-Editor ',0
[000a8dbf]                           dc.b $00
DATAS_09:
[000a8dc0]                           dc.w $0000
[000a8dc2]                           dc.w $0000
[000a8dc4]                           dc.w $02f0
[000a8dc6]                           dc.w $0000
[000a8dc8]                           dc.w $0000
[000a8dca]                           dc.w $0000
[000a8dcc]                           dc.w $0000
[000a8dce]                           dc.w $0000
[000a8dd0]                           dc.w $0000
[000a8dd2]                           dc.w $0000
[000a8dd4]                           dc.w $0000
[000a8dd6]                           dc.w $0000
[000a8dd8]                           dc.w $1fff
[000a8dda]                           dc.w $ffff
[000a8ddc]                           dc.w $fff8
[000a8dde]                           dc.w $1000
[000a8de0]                           dc.w $0000
[000a8de2]                           dc.w $0008
[000a8de4]                           dc.w $1000
[000a8de6]                           dc.w $0000
[000a8de8]                           dc.w $0008
[000a8dea]                           dc.w $1004
[000a8dec]                           dc.w $8040
[000a8dee]                           dc.w $0088
[000a8df0]                           dc.w $1004
[000a8df2]                           dc.w $8040
[000a8df4]                           dc.w $0088
[000a8df6]                           dc.w $1004
[000a8df8]                           dc.w $8040
[000a8dfa]                           dc.w $0088
[000a8dfc]                           dc.w $1004
[000a8dfe]                           dc.w $8040
[000a8e00]                           dc.w $0088
[000a8e02]                           dc.w $1004
[000a8e04]                           dc.w $8040
[000a8e06]                           dc.w $0088
[000a8e08]                           dc.w $1004
[000a8e0a]                           dc.w $8040
[000a8e0c]                           dc.w $0088
[000a8e0e]                           dc.w $1004
[000a8e10]                           dc.w $8040
[000a8e12]                           dc.w $0088
[000a8e14]                           dc.w $1000
[000a8e16]                           dc.w $0000
[000a8e18]                           dc.w $0008
[000a8e1a]                           dc.w $1000
[000a8e1c]                           dc.w $0000
[000a8e1e]                           dc.w $0008
[000a8e20]                           dc.w $1000
[000a8e22]                           dc.w $0000
[000a8e24]                           dc.w $0008
[000a8e26]                           dc.w $1000
[000a8e28]                           dc.w $0000
[000a8e2a]                           dc.w $0008
[000a8e2c]                           dc.w $1000
[000a8e2e]                           dc.w $0000
[000a8e30]                           dc.w $0008
[000a8e32]                           dc.w $1100
[000a8e34]                           dc.w $8048
[000a8e36]                           dc.w $0488
[000a8e38]                           dc.w $1100
[000a8e3a]                           dc.w $8048
[000a8e3c]                           dc.w $0488
[000a8e3e]                           dc.w $1100
[000a8e40]                           dc.w $8048
[000a8e42]                           dc.w $0488
[000a8e44]                           dc.w $1100
[000a8e46]                           dc.w $8048
[000a8e48]                           dc.w $0488
[000a8e4a]                           dc.w $1100
[000a8e4c]                           dc.w $8048
[000a8e4e]                           dc.w $0488
[000a8e50]                           dc.w $1100
[000a8e52]                           dc.w $8048
[000a8e54]                           dc.w $0488
[000a8e56]                           dc.w $1100
[000a8e58]                           dc.w $8048
[000a8e5a]                           dc.w $0488
[000a8e5c]                           dc.w $1000
[000a8e5e]                           dc.w $0000
[000a8e60]                           dc.w $0008
[000a8e62]                           dc.w $1000
[000a8e64]                           dc.w $0000
[000a8e66]                           dc.w $0008
[000a8e68]                           dc.w $1fff
[000a8e6a]                           dc.w $ffff
[000a8e6c]                           dc.w $fff8
[000a8e6e]                           dc.w $0000
[000a8e70]                           dc.w $0000
[000a8e72]                           dc.w $0000
[000a8e74]                           dc.w $0000
[000a8e76]                           dc.w $0000
[000a8e78]                           dc.w $0000
[000a8e7a]                           dc.w $0000
[000a8e7c]                           dc.w $0000
[000a8e7e]                           dc.w $0000
[000a8e80]                           dc.w $0000
[000a8e82]                           dc.w $0000
[000a8e84]                           dc.w $0000
[000a8e86]                           dc.w $0000
[000a8e88]                           dc.w $0000
[000a8e8a]                           dc.w $0000
[000a8e8c]                           dc.w $0000
[000a8e8e]                           dc.w $0000
[000a8e90]                           dc.w $0000
[000a8e92]                           dc.w $1fff
[000a8e94]                           dc.w $ffff
[000a8e96]                           dc.w $fff8
[000a8e98]                           dc.w $1000
[000a8e9a]                           dc.w $0000
[000a8e9c]                           dc.w $0008
[000a8e9e]                           dc.w $1000
[000a8ea0]                           dc.w $0000
[000a8ea2]                           dc.w $0008
[000a8ea4]                           dc.w $1004
[000a8ea6]                           dc.w $8040
[000a8ea8]                           dc.w $0088
[000a8eaa]                           dc.w $1004
[000a8eac]                           dc.w $8040
[000a8eae]                           dc.w $0088
[000a8eb0]                           dc.w $1004
[000a8eb2]                           dc.w $8040
[000a8eb4]                           dc.w $0088
[000a8eb6]                           dc.w $1004
[000a8eb8]                           dc.w $8040
[000a8eba]                           dc.w $0088
[000a8ebc]                           dc.w $1004
[000a8ebe]                           dc.w $8040
[000a8ec0]                           dc.w $0088
[000a8ec2]                           dc.w $1004
[000a8ec4]                           dc.w $8040
[000a8ec6]                           dc.w $0088
[000a8ec8]                           dc.w $1004
[000a8eca]                           dc.w $8040
[000a8ecc]                           dc.w $0088
[000a8ece]                           dc.w $1000
[000a8ed0]                           dc.w $0000
[000a8ed2]                           dc.w $0008
[000a8ed4]                           dc.w $1000
[000a8ed6]                           dc.w $0000
[000a8ed8]                           dc.w $0008
[000a8eda]                           dc.w $1000
[000a8edc]                           dc.w $0000
[000a8ede]                           dc.w $0008
[000a8ee0]                           dc.w $1000
[000a8ee2]                           dc.w $0000
[000a8ee4]                           dc.w $0008
[000a8ee6]                           dc.w $1000
[000a8ee8]                           dc.w $0000
[000a8eea]                           dc.w $0008
[000a8eec]                           dc.w $1100
[000a8eee]                           dc.w $8048
[000a8ef0]                           dc.w $0488
[000a8ef2]                           dc.w $1100
[000a8ef4]                           dc.w $8048
[000a8ef6]                           dc.w $0488
[000a8ef8]                           dc.w $1100
[000a8efa]                           dc.w $8048
[000a8efc]                           dc.w $0488
[000a8efe]                           dc.w $1100
[000a8f00]                           dc.w $8048
[000a8f02]                           dc.w $0488
[000a8f04]                           dc.w $1100
[000a8f06]                           dc.w $8048
[000a8f08]                           dc.w $0488
[000a8f0a]                           dc.w $1100
[000a8f0c]                           dc.w $8048
[000a8f0e]                           dc.w $0488
[000a8f10]                           dc.w $1100
[000a8f12]                           dc.w $8048
[000a8f14]                           dc.w $0488
[000a8f16]                           dc.w $1000
[000a8f18]                           dc.w $0000
[000a8f1a]                           dc.w $0008
[000a8f1c]                           dc.w $1000
[000a8f1e]                           dc.w $0000
[000a8f20]                           dc.w $0008
[000a8f22]                           dc.w $1fff
[000a8f24]                           dc.w $ffff
[000a8f26]                           dc.w $fff8
[000a8f28]                           dc.w $0000
[000a8f2a]                           dc.w $0000
[000a8f2c]                           dc.w $0000
[000a8f2e]                           dc.w $0000
[000a8f30]                           dc.w $0000
[000a8f32]                           dc.w $0000
[000a8f34]                           dc.w $0000
[000a8f36]                           dc.w $0000
[000a8f38]                           dc.w $0000
[000a8f3a]                           dc.w $0000
[000a8f3c]                           dc.w $0000
[000a8f3e]                           dc.w $0000
[000a8f40]                           dc.w $0000
[000a8f42]                           dc.w $0000
[000a8f44]                           dc.w $0000
[000a8f46]                           dc.w $0000
[000a8f48]                           dc.w $0000
[000a8f4a]                           dc.w $0000
[000a8f4c]                           dc.w $1fff
[000a8f4e]                           dc.w $ffff
[000a8f50]                           dc.w $fff8
[000a8f52]                           dc.w $1000
[000a8f54]                           dc.w $0000
[000a8f56]                           dc.w $0008
[000a8f58]                           dc.w $1000
[000a8f5a]                           dc.w $0000
[000a8f5c]                           dc.w $0008
[000a8f5e]                           dc.w $1004
[000a8f60]                           dc.w $8040
[000a8f62]                           dc.w $0088
[000a8f64]                           dc.w $1004
[000a8f66]                           dc.w $8040
[000a8f68]                           dc.w $0088
[000a8f6a]                           dc.w $1004
[000a8f6c]                           dc.w $8040
[000a8f6e]                           dc.w $0088
[000a8f70]                           dc.w $1004
[000a8f72]                           dc.w $8040
[000a8f74]                           dc.w $0088
[000a8f76]                           dc.w $1004
[000a8f78]                           dc.w $8040
[000a8f7a]                           dc.w $0088
[000a8f7c]                           dc.w $1004
[000a8f7e]                           dc.w $8040
[000a8f80]                           dc.w $0088
[000a8f82]                           dc.w $1004
[000a8f84]                           dc.w $8040
[000a8f86]                           dc.w $0088
[000a8f88]                           dc.w $1000
[000a8f8a]                           dc.w $0000
[000a8f8c]                           dc.w $0008
[000a8f8e]                           dc.w $1000
[000a8f90]                           dc.w $0000
[000a8f92]                           dc.w $0008
[000a8f94]                           dc.w $1000
[000a8f96]                           dc.w $0000
[000a8f98]                           dc.w $0008
[000a8f9a]                           dc.w $1000
[000a8f9c]                           dc.w $0000
[000a8f9e]                           dc.w $0008
[000a8fa0]                           dc.w $1000
[000a8fa2]                           dc.w $0000
[000a8fa4]                           dc.w $0008
[000a8fa6]                           dc.w $1100
[000a8fa8]                           dc.w $8048
[000a8faa]                           dc.w $0488
[000a8fac]                           dc.w $1100
[000a8fae]                           dc.w $8048
[000a8fb0]                           dc.w $0488
[000a8fb2]                           dc.w $1100
[000a8fb4]                           dc.w $8048
[000a8fb6]                           dc.w $0488
[000a8fb8]                           dc.w $1100
[000a8fba]                           dc.w $8048
[000a8fbc]                           dc.w $0488
[000a8fbe]                           dc.w $1100
[000a8fc0]                           dc.w $8048
[000a8fc2]                           dc.w $0488
[000a8fc4]                           dc.w $1100
[000a8fc6]                           dc.w $8048
[000a8fc8]                           dc.w $0488
[000a8fca]                           dc.w $1100
[000a8fcc]                           dc.w $8048
[000a8fce]                           dc.w $0488
[000a8fd0]                           dc.w $1000
[000a8fd2]                           dc.w $0000
[000a8fd4]                           dc.w $0008
[000a8fd6]                           dc.w $1000
[000a8fd8]                           dc.w $0000
[000a8fda]                           dc.w $0008
[000a8fdc]                           dc.w $1fff
[000a8fde]                           dc.w $ffff
[000a8fe0]                           dc.w $fff8
[000a8fe2]                           dc.w $0000
[000a8fe4]                           dc.w $0000
[000a8fe6]                           dc.w $0000
[000a8fe8]                           dc.w $0000
[000a8fea]                           dc.w $0000
[000a8fec]                           dc.w $0000
[000a8fee]                           dc.w $0000
[000a8ff0]                           dc.w $0000
[000a8ff2]                           dc.w $0000
[000a8ff4]                           dc.w $0000
[000a8ff6]                           dc.w $0000
[000a8ff8]                           dc.w $0000
[000a8ffa]                           dc.w $0000
[000a8ffc]                           dc.w $0000
[000a8ffe]                           dc.w $0000
[000a9000]                           dc.w $0000
[000a9002]                           dc.w $0000
[000a9004]                           dc.w $0000
[000a9006]                           dc.w $1fff
[000a9008]                           dc.w $ffff
[000a900a]                           dc.w $fff8
[000a900c]                           dc.w $1fff
[000a900e]                           dc.w $ffff
[000a9010]                           dc.w $fff8
[000a9012]                           dc.w $1fff
[000a9014]                           dc.w $ffff
[000a9016]                           dc.w $fff8
[000a9018]                           dc.w $1e1f
[000a901a]                           dc.w $e1f0
[000a901c]                           dc.w $c3f8
[000a901e]                           dc.w $1edf
[000a9020]                           dc.w $edf6
[000a9022]                           dc.w $dbf8
[000a9024]                           dc.w $1edf
[000a9026]                           dc.w $edf6
[000a9028]                           dc.w $dbf8
[000a902a]                           dc.w $1edf
[000a902c]                           dc.w $edf6
[000a902e]                           dc.w $dbf8
[000a9030]                           dc.w $1edf
[000a9032]                           dc.w $edf6
[000a9034]                           dc.w $dbf8
[000a9036]                           dc.w $1edf
[000a9038]                           dc.w $edf6
[000a903a]                           dc.w $dbf8
[000a903c]                           dc.w $1e1f
[000a903e]                           dc.w $e1f0
[000a9040]                           dc.w $c3f8
[000a9042]                           dc.w $1fff
[000a9044]                           dc.w $ffff
[000a9046]                           dc.w $fff8
[000a9048]                           dc.w $1fff
[000a904a]                           dc.w $ffff
[000a904c]                           dc.w $fff8
[000a904e]                           dc.w $1fff
[000a9050]                           dc.w $ffff
[000a9052]                           dc.w $fff8
[000a9054]                           dc.w $1fff
[000a9056]                           dc.w $ffff
[000a9058]                           dc.w $fff8
[000a905a]                           dc.w $1fff
[000a905c]                           dc.w $ffff
[000a905e]                           dc.w $fff8
[000a9060]                           dc.w $1fc3
[000a9062]                           dc.w $e1fe
[000a9064]                           dc.w $1ff8
[000a9066]                           dc.w $1fdb
[000a9068]                           dc.w $edfe
[000a906a]                           dc.w $dff8
[000a906c]                           dc.w $1fdb
[000a906e]                           dc.w $edfe
[000a9070]                           dc.w $dff8
[000a9072]                           dc.w $1fdb
[000a9074]                           dc.w $edfe
[000a9076]                           dc.w $dff8
[000a9078]                           dc.w $1fdb
[000a907a]                           dc.w $edfe
[000a907c]                           dc.w $dff8
[000a907e]                           dc.w $1fdb
[000a9080]                           dc.w $edfe
[000a9082]                           dc.w $dff8
[000a9084]                           dc.w $1fc3
[000a9086]                           dc.w $e1fe
[000a9088]                           dc.w $1ff8
[000a908a]                           dc.w $1fff
[000a908c]                           dc.w $ffff
[000a908e]                           dc.w $fff8
[000a9090]                           dc.w $1fff
[000a9092]                           dc.w $ffff
[000a9094]                           dc.w $fff8
[000a9096]                           dc.w $1fff
[000a9098]                           dc.w $ffff
[000a909a]                           dc.w $fff8
[000a909c]                           dc.w $0000
[000a909e]                           dc.w $0000
[000a90a0]                           dc.w $0000
[000a90a2]                           dc.w $0000
[000a90a4]                           dc.w $0000
[000a90a6]                           dc.w $0000
[000a90a8]                           dc.w $0000
[000a90aa]                           dc.w $0000
[000a90ac]                           dc.w $0000
DATAS_10:
[000a90ae]                           dc.w $0000
[000a90b0]                           dc.w $0000
[000a90b2]                           dc.w $0000
[000a90b4]                           dc.w $0000
[000a90b6]                           dc.w $0000
[000a90b8]                           dc.w $0000
[000a90ba]                           dc.w $0000
[000a90bc]                           dc.w $0000
[000a90be]                           dc.w $0000
[000a90c0]                           dc.w $1fff
[000a90c2]                           dc.w $ffff
[000a90c4]                           dc.w $fff8
[000a90c6]                           dc.w $1fff
[000a90c8]                           dc.w $ffff
[000a90ca]                           dc.w $fff8
[000a90cc]                           dc.w $1fff
[000a90ce]                           dc.w $ffff
[000a90d0]                           dc.w $fff8
[000a90d2]                           dc.w $1fff
[000a90d4]                           dc.w $ffff
[000a90d6]                           dc.w $fff8
[000a90d8]                           dc.w $1fff
[000a90da]                           dc.w $ffff
[000a90dc]                           dc.w $fff8
[000a90de]                           dc.w $1fff
[000a90e0]                           dc.w $ffff
[000a90e2]                           dc.w $fff8
[000a90e4]                           dc.w $1fff
[000a90e6]                           dc.w $ffff
[000a90e8]                           dc.w $fff8
[000a90ea]                           dc.w $1fff
[000a90ec]                           dc.w $ffff
[000a90ee]                           dc.w $fff8
[000a90f0]                           dc.w $1fff
[000a90f2]                           dc.w $ffff
[000a90f4]                           dc.w $fff8
[000a90f6]                           dc.w $1fff
[000a90f8]                           dc.w $ffff
[000a90fa]                           dc.w $fff8
[000a90fc]                           dc.w $1fff
[000a90fe]                           dc.w $ffff
[000a9100]                           dc.w $fff8
[000a9102]                           dc.w $1fff
[000a9104]                           dc.w $ffff
[000a9106]                           dc.w $fff8
[000a9108]                           dc.w $1fff
[000a910a]                           dc.w $ffff
[000a910c]                           dc.w $fff8
[000a910e]                           dc.w $1fff
[000a9110]                           dc.w $ffff
[000a9112]                           dc.w $fff8
[000a9114]                           dc.w $1fff
[000a9116]                           dc.w $ffff
[000a9118]                           dc.w $fff8
[000a911a]                           dc.w $1fff
[000a911c]                           dc.w $ffff
[000a911e]                           dc.w $fff8
[000a9120]                           dc.w $1fff
[000a9122]                           dc.w $ffff
[000a9124]                           dc.w $fff8
[000a9126]                           dc.w $1fff
[000a9128]                           dc.w $ffff
[000a912a]                           dc.w $fff8
[000a912c]                           dc.w $1fff
[000a912e]                           dc.w $ffff
[000a9130]                           dc.w $fff8
[000a9132]                           dc.w $1fff
[000a9134]                           dc.w $ffff
[000a9136]                           dc.w $fff8
[000a9138]                           dc.w $1fff
[000a913a]                           dc.w $ffff
[000a913c]                           dc.w $fff8
[000a913e]                           dc.w $1fff
[000a9140]                           dc.w $ffff
[000a9142]                           dc.w $fff8
[000a9144]                           dc.w $1fff
[000a9146]                           dc.w $ffff
[000a9148]                           dc.w $fff8
[000a914a]                           dc.w $1fff
[000a914c]                           dc.w $ffff
[000a914e]                           dc.w $fff8
[000a9150]                           dc.w $1fff
[000a9152]                           dc.w $ffff
[000a9154]                           dc.w $fff8
[000a9156]                           dc.w $0000
[000a9158]                           dc.w $0000
[000a915a]                           dc.w $0000
[000a915c]                           dc.w $0000
[000a915e]                           dc.w $0000
[000a9160]                           dc.w $0000
[000a9162]                           dc.w $0000
[000a9164]                           dc.w $0000
[000a9166]                           dc.w $0000
A_3DBUTTON01:
[000a9168] 00064a22                  dc.l A_3Dbutton
[000a916c]                           dc.w $29c1
[000a916e]                           dc.w $0178
[000a9170] 000630f2                  dc.l Auo_string
[000a9174] 000a8da8                  dc.l TEXT_005
[000a9178]                           dc.w $0000
[000a917a]                           dc.w $0000
[000a917c]                           dc.w $0000
[000a917e]                           dc.w $0000
[000a9180]                           dc.w $0000
[000a9182]                           dc.w $0000
[000a9184]                           dc.w $0000
[000a9186]                           dc.w $0000
A_3DBUTTON02:
[000a9188] 00064a22                  dc.l A_3Dbutton
[000a918c]                           dc.w $21f1
[000a918e]                           dc.w $01f8
[000a9190] 000630f2                  dc.l Auo_string
[000a9194]                           dc.w $0000
[000a9196]                           dc.w $0000
[000a9198]                           dc.w $0000
[000a919a]                           dc.w $0000
[000a919c]                           dc.w $0000
[000a919e]                           dc.w $0000
[000a91a0]                           dc.w $0000
[000a91a2]                           dc.w $0000
[000a91a4]                           dc.w $0000
[000a91a6]                           dc.w $0000
A_FTEXT01:
[000a91a8] 0006639a                  dc.l A_ftext
[000a91ac]                           dc.w $0001
[000a91ae]                           dc.w $000d
[000a91b0] 00066924                  dc.l Auo_ftext
[000a91b4] 000a8d41                  dc.l TEXT_003
[000a91b8]                           dc.w $0000
[000a91ba]                           dc.w $0000
[000a91bc]                           dc.w $0000
[000a91be]                           dc.w $0000
[000a91c0]                           dc.w $0000
[000a91c2]                           dc.w $0000
[000a91c4]                           dc.w $0000
[000a91c6]                           dc.w $0000
A_INNERFRAME02:
[000a91c8] 00064256                  dc.l A_innerframe
[000a91cc]                           dc.w $1000
[000a91ce]                           dc.w $8f19
[000a91d0] 000630f2                  dc.l Auo_string
[000a91d4]                           dc.w $0000
[000a91d6]                           dc.w $0000
[000a91d8]                           dc.w $0000
[000a91da]                           dc.w $0000
[000a91dc]                           dc.w $0000
[000a91de]                           dc.w $0000
[000a91e0]                           dc.w $0000
[000a91e2]                           dc.w $0000
[000a91e4]                           dc.w $0000
[000a91e6]                           dc.w $0000
_C4_IC_DATA:
[000a91e8]                           dc.w $0004
[000a91ea] 000a8dc6                  dc.l $000a8dc6
[000a91ee] 000a90ae                  dc.l DATAS_10
[000a91f2]                           dc.w $0000
[000a91f4]                           dc.w $0000
[000a91f6]                           dc.w $0000
[000a91f8]                           dc.w $0000
[000a91fa]                           dc.w $0000
[000a91fc]                           dc.w $0000
_MSK_IC_DATA:
[000a91fe]                           dc.w $0000
[000a9200]                           dc.w $0000
[000a9202]                           dc.w $0000
[000a9204]                           dc.w $0000
[000a9206]                           dc.w $0000
[000a9208]                           dc.w $0000
[000a920a]                           dc.w $0000
[000a920c]                           dc.w $0000
[000a920e]                           dc.w $0000
[000a9210]                           dc.w $1fff
[000a9212]                           dc.w $ffff
[000a9214]                           dc.w $fff8
[000a9216]                           dc.w $1fff
[000a9218]                           dc.w $ffff
[000a921a]                           dc.w $fff8
[000a921c]                           dc.w $1fff
[000a921e]                           dc.w $ffff
[000a9220]                           dc.w $fff8
[000a9222]                           dc.w $1fff
[000a9224]                           dc.w $ffff
[000a9226]                           dc.w $fff8
[000a9228]                           dc.w $1fff
[000a922a]                           dc.w $ffff
[000a922c]                           dc.w $fff8
[000a922e]                           dc.w $1fff
[000a9230]                           dc.w $ffff
[000a9232]                           dc.w $fff8
[000a9234]                           dc.w $1fff
[000a9236]                           dc.w $ffff
[000a9238]                           dc.w $fff8
[000a923a]                           dc.w $1fff
[000a923c]                           dc.w $ffff
[000a923e]                           dc.w $fff8
[000a9240]                           dc.w $1fff
[000a9242]                           dc.w $ffff
[000a9244]                           dc.w $fff8
[000a9246]                           dc.w $1fff
[000a9248]                           dc.w $ffff
[000a924a]                           dc.w $fff8
[000a924c]                           dc.w $1fff
[000a924e]                           dc.w $ffff
[000a9250]                           dc.w $fff8
[000a9252]                           dc.w $1fff
[000a9254]                           dc.w $ffff
[000a9256]                           dc.w $fff8
[000a9258]                           dc.w $1fff
[000a925a]                           dc.w $ffff
[000a925c]                           dc.w $fff8
[000a925e]                           dc.w $1fff
[000a9260]                           dc.w $ffff
[000a9262]                           dc.w $fff8
[000a9264]                           dc.w $1fff
[000a9266]                           dc.w $ffff
[000a9268]                           dc.w $fff8
[000a926a]                           dc.w $1fff
[000a926c]                           dc.w $ffff
[000a926e]                           dc.w $fff8
[000a9270]                           dc.w $1fff
[000a9272]                           dc.w $ffff
[000a9274]                           dc.w $fff8
[000a9276]                           dc.w $1fff
[000a9278]                           dc.w $ffff
[000a927a]                           dc.w $fff8
[000a927c]                           dc.w $1fff
[000a927e]                           dc.w $ffff
[000a9280]                           dc.w $fff8
[000a9282]                           dc.w $1fff
[000a9284]                           dc.w $ffff
[000a9286]                           dc.w $fff8
[000a9288]                           dc.w $1fff
[000a928a]                           dc.w $ffff
[000a928c]                           dc.w $fff8
[000a928e]                           dc.w $1fff
[000a9290]                           dc.w $ffff
[000a9292]                           dc.w $fff8
[000a9294]                           dc.w $1fff
[000a9296]                           dc.w $ffff
[000a9298]                           dc.w $fff8
[000a929a]                           dc.w $1fff
[000a929c]                           dc.w $ffff
[000a929e]                           dc.w $fff8
[000a92a0]                           dc.w $1fff
[000a92a2]                           dc.w $ffff
[000a92a4]                           dc.w $fff8
[000a92a6]                           dc.w $0000
[000a92a8]                           dc.w $0000
[000a92aa]                           dc.w $0000
[000a92ac]                           dc.w $0000
[000a92ae]                           dc.w $0000
[000a92b0]                           dc.w $0000
[000a92b2]                           dc.w $0000
[000a92b4]                           dc.w $0000
[000a92b6]                           dc.w $0000
_DAT_IC_DATA:
[000a92b8]                           dc.w $0000
[000a92ba]                           dc.w $0000
[000a92bc]                           dc.w $0000
[000a92be]                           dc.w $0000
[000a92c0]                           dc.w $0000
[000a92c2]                           dc.w $0000
[000a92c4]                           dc.w $0000
[000a92c6]                           dc.w $0000
[000a92c8]                           dc.w $0000
[000a92ca]                           dc.w $1fff
[000a92cc]                           dc.w $ffff
[000a92ce]                           dc.w $fff8
[000a92d0]                           dc.w $1000
[000a92d2]                           dc.w $0000
[000a92d4]                           dc.w $0008
[000a92d6]                           dc.w $1000
[000a92d8]                           dc.w $0000
[000a92da]                           dc.w $0008
[000a92dc]                           dc.w $11e4
[000a92de]                           dc.w $9e4f
[000a92e0]                           dc.w $3c88
[000a92e2]                           dc.w $1124
[000a92e4]                           dc.w $9249
[000a92e6]                           dc.w $2488
[000a92e8]                           dc.w $1124
[000a92ea]                           dc.w $9249
[000a92ec]                           dc.w $2488
[000a92ee]                           dc.w $1124
[000a92f0]                           dc.w $9249
[000a92f2]                           dc.w $2488
[000a92f4]                           dc.w $1124
[000a92f6]                           dc.w $9249
[000a92f8]                           dc.w $2488
[000a92fa]                           dc.w $1124
[000a92fc]                           dc.w $9249
[000a92fe]                           dc.w $2488
[000a9300]                           dc.w $11e4
[000a9302]                           dc.w $9e4f
[000a9304]                           dc.w $3c88
[000a9306]                           dc.w $1000
[000a9308]                           dc.w $0000
[000a930a]                           dc.w $0008
[000a930c]                           dc.w $1000
[000a930e]                           dc.w $0000
[000a9310]                           dc.w $0008
[000a9312]                           dc.w $1000
[000a9314]                           dc.w $0000
[000a9316]                           dc.w $0008
[000a9318]                           dc.w $1000
[000a931a]                           dc.w $0000
[000a931c]                           dc.w $0008
[000a931e]                           dc.w $1000
[000a9320]                           dc.w $0000
[000a9322]                           dc.w $0008
[000a9324]                           dc.w $113c
[000a9326]                           dc.w $9e49
[000a9328]                           dc.w $e488
[000a932a]                           dc.w $1124
[000a932c]                           dc.w $9249
[000a932e]                           dc.w $2488
[000a9330]                           dc.w $1124
[000a9332]                           dc.w $9249
[000a9334]                           dc.w $2488
[000a9336]                           dc.w $1124
[000a9338]                           dc.w $9249
[000a933a]                           dc.w $2488
[000a933c]                           dc.w $1124
[000a933e]                           dc.w $9249
[000a9340]                           dc.w $2488
[000a9342]                           dc.w $1124
[000a9344]                           dc.w $9249
[000a9346]                           dc.w $2488
[000a9348]                           dc.w $113c
[000a934a]                           dc.w $9e49
[000a934c]                           dc.w $e488
[000a934e]                           dc.w $1000
[000a9350]                           dc.w $0000
[000a9352]                           dc.w $0008
[000a9354]                           dc.w $1000
[000a9356]                           dc.w $0000
[000a9358]                           dc.w $0008
[000a935a]                           dc.w $1fff
[000a935c]                           dc.w $ffff
[000a935e]                           dc.w $fff8
[000a9360]                           dc.w $0000
[000a9362]                           dc.w $0000
[000a9364]                           dc.w $0000
[000a9366]                           dc.w $0000
[000a9368]                           dc.w $0000
[000a936a]                           dc.w $0000
[000a936c]                           dc.w $0000
[000a936e]                           dc.w $0000
[000a9370]                           dc.w $0000
IC_DATA:
[000a9372] 000a91fe                  dc.l _MSK_IC_DATA
[000a9376] 000a92b8                  dc.l _DAT_IC_DATA
[000a937a] 000a8dab                  dc.l TEXT_006
[000a937e]                           dc.w $1000
[000a9380]                           dc.w $0000
[000a9382]                           dc.w $0000
[000a9384]                           dc.w $000c
[000a9386]                           dc.w $0000
[000a9388]                           dc.w $0030
[000a938a]                           dc.w $001f
[000a938c]                           dc.w $0000
[000a938e]                           dc.w $0020
[000a9390]                           dc.w $0048
[000a9392]                           dc.w $0008
[000a9394] 000a91e8                  dc.l _C4_IC_DATA
EDIT_DATA:
[000a9398]                           dc.w $ffff
[000a939a]                           dc.w $0001
[000a939c]                           dc.w $0004
[000a939e]                           dc.w $0018
[000a93a0]                           dc.w $0040
[000a93a2]                           dc.w $0010
[000a93a4] 000a9188                  dc.l A_3DBUTTON02
[000a93a8]                           dc.w $0000
[000a93aa]                           dc.w $0000
[000a93ac]                           dc.w $0023
[000a93ae]                           dc.w $0009
_01_EDIT_DATA:
[000a93b0]                           dc.w $0004
[000a93b2]                           dc.w $0002
[000a93b4]                           dc.w $0002
[000a93b6]                           dc.w $0018
[000a93b8]                           dc.w $0040
[000a93ba]                           dc.w $0000
[000a93bc] 000a91c8                  dc.l A_INNERFRAME02
[000a93c0]                           dc.w $0001
[000a93c2]                           dc.w $0000
[000a93c4]                           dc.w $0021
[000a93c6]                           dc.w $0006
_02_EDIT_DATA:
[000a93c8]                           dc.w $0001
[000a93ca]                           dc.w $0003
[000a93cc]                           dc.w $0003
[000a93ce]                           dc.w $0014
[000a93d0]                           dc.w $0000
[000a93d2]                           dc.w $0000
[000a93d4]                           dc.w $0000
[000a93d6]                           dc.w $1101
[000a93d8]                           dc.w $0001
[000a93da]                           dc.w $0001
[000a93dc]                           dc.w $001f
[000a93de]                           dc.w $0004
_03_EDIT_DATA:
[000a93e0]                           dc.w $0002
[000a93e2]                           dc.w $ffff
[000a93e4]                           dc.w $ffff
[000a93e6]                           dc.w $0018
[000a93e8]                           dc.w $0000
[000a93ea]                           dc.w $0000
[000a93ec] 000a91a8                  dc.l A_FTEXT01
[000a93f0]                           dc.w $0001
[000a93f2]                           dc.w $0000
[000a93f4]                           dc.w $001d
[000a93f6]                           dc.w $0004
_04_EDIT_DATA:
[000a93f8]                           dc.w $0000
[000a93fa]                           dc.w $ffff
[000a93fc]                           dc.w $ffff
[000a93fe]                           dc.w $0018
[000a9400]                           dc.w $0007
[000a9402]                           dc.w $0010
[000a9404] 000a9168                  dc.l A_3DBUTTON01
[000a9408]                           dc.w $000b
[000a940a]                           dc.w $0006
[000a940c]                           dc.w $000c
[000a940e]                           dc.w $0002
_04aEDIT_DATA:
[000a9410] 0001d31e                  dc.l editdat_abort
[000a9414]                           dc.w $0000
[000a9416]                           dc.w $0000
[000a9418]                           dc.w $8020
[000a941a]                           dc.w $884f
[000a941c]                           dc.w $0000
[000a941e]                           dc.w $0000
[000a9420]                           dc.w $0000
[000a9422]                           dc.w $0000
[000a9424]                           dc.w $0000
[000a9426]                           dc.w $0000
WI_DATA:
[000a9428]                           dc.w $0000
[000a942a]                           dc.w $0000
[000a942c] 0001d3ce                  dc.l dt_service
[000a9430] 0001d330                  dc.l dt_make
[000a9434] 00057428                  dc.l Awi_open
[000a9438] 00055e94                  dc.l Awi_init
[000a943c] 000a9398                  dc.l EDIT_DATA
[000a9440]                           dc.w $0000
[000a9442]                           dc.w $0000
[000a9444]                           dc.w $0000
[000a9446]                           dc.w $0000
[000a9448]                           dc.w $ffff
[000a944a]                           dc.w $601f
[000a944c]                           dc.w $0000
[000a944e]                           dc.w $0000
[000a9450]                           dc.w $0063
[000a9452]                           dc.w $0063
[000a9454]                           dc.w $0000
[000a9456]                           dc.w $0000
[000a9458]                           dc.w $0000
[000a945a]                           dc.w $0000
[000a945c]                           dc.w $0000
[000a945e]                           dc.w $0000
[000a9460]                           dc.w $0000
[000a9462]                           dc.w $0000
[000a9464]                           dc.w $ffff
[000a9466]                           dc.w $ffff
[000a9468]                           dc.w $ffff
[000a946a]                           dc.w $ffff
[000a946c]                           dc.w $0000
[000a946e]                           dc.w $0000
[000a9470]                           dc.w $fcf8
[000a9472] 000a8db1                  dc.l TEXT_01
[000a9476] 000a8d40                  dc.l TEXT_002
[000a947a]                           dc.w $2710
[000a947c]                           dc.w $0100
[000a947e]                           dc.w $0000
[000a9480]                           dc.w $ffff
[000a9482] 000a9372                  dc.l IC_DATA
[000a9486]                           dc.w $0000
[000a9488]                           dc.w $0000
[000a948a] 0006b744                  dc.l Awi_keys
[000a948e] 00051852                  dc.l Awi_obchange
[000a9492] 00051c46                  dc.l Awi_redraw
[000a9496] 000587a4                  dc.l Awi_topped
[000a949a] 00058362                  dc.l Awi_closed
[000a949e] 000587ec                  dc.l Awi_fulled
[000a94a2] 0005217c                  dc.l Awi_arrowed
[000a94a6] 000524b4                  dc.l Awi_hslid
[000a94aa] 0005255e                  dc.l Awi_vslid
[000a94ae] 00058bb0                  dc.l Awi_sized
[000a94b2] 00058d50                  dc.l Awi_moved
[000a94b6] 0005998a                  dc.l Awi_iconify
[000a94ba] 00059c6c                  dc.l Awi_uniconify
[000a94be] 0005b5b6                  dc.l Awi_gemscript
[000a94c2]                           dc.w $0000
[000a94c4]                           dc.w $0000
[000a94c6]                           dc.w $0000
[000a94c8]                           dc.w $0000
