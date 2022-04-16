editte_ok:
[0002321a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00023220] 2068 0258                 movea.l    600(a0),a0
[00023224] 4eb9 0002 335a            jsr        term
[0002322a] 4e75                      rts

tedi_make:
[0002322c] 48e7 0038                 movem.l    a2-a4,-(a7)
[00023230] 594f                      subq.w     #4,a7
[00023232] 2448                      movea.l    a0,a2
[00023234] 266a 0004                 movea.l    4(a2),a3
[00023238] 286b 0012                 movea.l    18(a3),a4
[0002323c] 200c                      move.l     a4,d0
[0002323e] 670a                      beq.s      tedi_make_1
[00023240] 204c                      movea.l    a4,a0
[00023242] 4eb9 0005 6bea            jsr        Awi_show
[00023248] 6074                      bra.s      tedi_make_2
tedi_make_1:
[0002324a] 7008                      moveq.l    #8,d0
[0002324c] 4eb9 0004 c608            jsr        Ax_malloc
[00023252] 2e88                      move.l     a0,(a7)
[00023254] 2008                      move.l     a0,d0
[00023256] 6762                      beq.s      tedi_make_3
[00023258] 2092                      move.l     (a2),(a0)
[0002325a] 216a 0004 0004            move.l     4(a2),4(a0)
[00023260] 43eb 0016                 lea.l      22(a3),a1
[00023264] 23c9 000b 39e6            move.l     a1,$000B39E6
[0002326a] 2079 000b 39f2            movea.l    $000B39F2,a0
[00023270] 2149 0008                 move.l     a1,8(a0)
[00023274] 41f9 000b 3998            lea.l      WI_TEDI,a0
[0002327a] 4eb9 0005 7052            jsr        Awi_create
[00023280] 2848                      movea.l    a0,a4
[00023282] 200c                      move.l     a4,d0
[00023284] 6734                      beq.s      tedi_make_3
[00023286] 2252                      movea.l    (a2),a1
[00023288] 4869 0168                 pea.l      360(a1)
[0002328c] 43eb 003a                 lea.l      58(a3),a1
[00023290] 4eb9 0001 6372            jsr        wi_pos
[00023296] 584f                      addq.w     #4,a7
[00023298] 2897                      move.l     (a7),(a4)
[0002329a] 274c 0012                 move.l     a4,18(a3)
[0002329e] 204c                      movea.l    a4,a0
[000232a0] 4eb9 0002 330e            jsr        set_tedi
[000232a6] 204c                      movea.l    a4,a0
[000232a8] 226c 000c                 movea.l    12(a4),a1
[000232ac] 4e91                      jsr        (a1)
[000232ae] 4a40                      tst.w      d0
[000232b0] 670c                      beq.s      tedi_make_2
[000232b2] 204c                      movea.l    a4,a0
[000232b4] 4eb9 0002 335a            jsr        term
tedi_make_3:
[000232ba] 91c8                      suba.l     a0,a0
[000232bc] 6002                      bra.s      tedi_make_4
tedi_make_2:
[000232be] 204c                      movea.l    a4,a0
tedi_make_4:
[000232c0] 584f                      addq.w     #4,a7
[000232c2] 4cdf 1c00                 movem.l    (a7)+,a2-a4
[000232c6] 4e75                      rts

tedi_service:
[000232c8] 48e7 1038                 movem.l    d3/a2-a4,-(a7)
[000232cc] 2448                      movea.l    a0,a2
[000232ce] 3600                      move.w     d0,d3
[000232d0] 2849                      movea.l    a1,a4
[000232d2] 2650                      movea.l    (a0),a3
[000232d4] 5540                      subq.w     #2,d0
[000232d6] 6708                      beq.s      tedi_service_1
[000232d8] 907c 270e                 sub.w      #$270E,d0
[000232dc] 670c                      beq.s      tedi_service_2
[000232de] 6018                      bra.s      tedi_service_3
tedi_service_1:
[000232e0] 204a                      movea.l    a2,a0
[000232e2] 4eb9 0002 335a            jsr        term
[000232e8] 601c                      bra.s      tedi_service_4
tedi_service_2:
[000232ea] 226b 0004                 movea.l    4(a3),a1
[000232ee] 204a                      movea.l    a2,a0
[000232f0] 4eb9 0001 60ea            jsr        new_name
[000232f6] 600e                      bra.s      tedi_service_4
tedi_service_3:
[000232f8] 224c                      movea.l    a4,a1
[000232fa] 3003                      move.w     d3,d0
[000232fc] 204a                      movea.l    a2,a0
[000232fe] 4eb9 0005 9dd0            jsr        Awi_service
[00023304] 6002                      bra.s      tedi_service_5
tedi_service_4:
[00023306] 7001                      moveq.l    #1,d0
tedi_service_5:
[00023308] 4cdf 1c08                 movem.l    (a7)+,d3/a2-a4
[0002330c] 4e75                      rts

set_tedi:
[0002330e] 2f0a                      move.l     a2,-(a7)
[00023310] 2f0b                      move.l     a3,-(a7)
[00023312] 2250                      movea.l    (a0),a1
[00023314] 2468 0014                 movea.l    20(a0),a2
[00023318] 2069 0004                 movea.l    4(a1),a0
[0002331c] 2668 0004                 movea.l    4(a0),a3
[00023320] 2253                      movea.l    (a3),a1
[00023322] 2269 0004                 movea.l    4(a1),a1
[00023326] 7003                      moveq.l    #3,d0
[00023328] 204a                      movea.l    a2,a0
[0002332a] 4eb9 0005 0fd8            jsr        Aob_puttext
[00023330] 206b 0004                 movea.l    4(a3),a0
[00023334] 2268 0004                 movea.l    4(a0),a1
[00023338] 7005                      moveq.l    #5,d0
[0002333a] 204a                      movea.l    a2,a0
[0002333c] 4eb9 0005 0fd8            jsr        Aob_puttext
[00023342] 206b 0008                 movea.l    8(a3),a0
[00023346] 2268 0004                 movea.l    4(a0),a1
[0002334a] 7007                      moveq.l    #7,d0
[0002334c] 204a                      movea.l    a2,a0
[0002334e] 4eb9 0005 0fd8            jsr        Aob_puttext
[00023354] 265f                      movea.l    (a7)+,a3
[00023356] 245f                      movea.l    (a7)+,a2
[00023358] 4e75                      rts

term:
[0002335a] 2f0a                      move.l     a2,-(a7)
[0002335c] 2f0b                      move.l     a3,-(a7)
[0002335e] 2448                      movea.l    a0,a2
[00023360] 006a 0100 0056            ori.w      #$0100,86(a2)
[00023366] 2650                      movea.l    (a0),a3
[00023368] 226b 0004                 movea.l    4(a3),a1
[0002336c] 42a9 0012                 clr.l      18(a1)
[00023370] 302a 0056                 move.w     86(a2),d0
[00023374] c07c 0800                 and.w      #$0800,d0
[00023378] 6716                      beq.s      term_1
[0002337a] 43ea 002c                 lea.l      44(a2),a1
[0002337e] 206b 0004                 movea.l    4(a3),a0
[00023382] 41e8 003a                 lea.l      58(a0),a0
[00023386] 7008                      moveq.l    #8,d0
[00023388] 4eb9 0008 3500            jsr        memcpy
[0002338e] 6014                      bra.s      term_2
term_1:
[00023390] 7008                      moveq.l    #8,d0
[00023392] 43ea 0024                 lea.l      36(a2),a1
[00023396] 206b 0004                 movea.l    4(a3),a0
[0002339a] 41e8 003a                 lea.l      58(a0),a0
[0002339e] 4eb9 0008 3500            jsr        memcpy
term_2:
[000233a4] 204b                      movea.l    a3,a0
[000233a6] 4eb9 0004 c7c8            jsr        Ax_free
[000233ac] 204a                      movea.l    a2,a0
[000233ae] 4eb9 0005 8362            jsr        Awi_closed
[000233b4] 204a                      movea.l    a2,a0
[000233b6] 4eb9 0005 85f2            jsr        Awi_delete
[000233bc] 265f                      movea.l    (a7)+,a3
[000233be] 245f                      movea.l    (a7)+,a2
[000233c0] 4e75                      rts

	.data

TEXT_002:
[000b32c2]                           dc.w $004f
[000b32c4]                           dc.w $4b00
TEXT_01:
[000b32c6]                           dc.b 'Text:',0
TEXT_02:
[000b32cc]                           dc.b 'Tmp:',0
TEXT_025:
[000b32d1]                           dc.b '12345678901234567890123456789012345678901234567890123456',0
TEXT_03:
[000b330a]                           dc.b 'Val:',0
TEXT_04:
[000b330f]                           dc.b ' Tedinfo-Editor ',0
TEXT_13:
[000b3320]                           dc.b 'TEDINFO',0
DATAS_01:
[000b3328]                           dc.w $0000
[000b332a]                           dc.w $0000
[000b332c]                           dc.w $02c0
[000b332e]                           dc.w $0000
[000b3330]                           dc.w $0000
[000b3332]                           dc.w $0000
[000b3334]                           dc.w $0000
[000b3336]                           dc.w $0000
[000b3338]                           dc.w $0000
[000b333a]                           dc.w $0000
[000b333c]                           dc.w $0000
[000b333e]                           dc.w $0000
[000b3340]                           dc.w $0000
[000b3342]                           dc.w $0000
[000b3344]                           dc.w $0000
[000b3346]                           dc.w $0000
[000b3348]                           dc.w $0000
[000b334a]                           dc.w $0000
[000b334c]                           dc.w $0000
[000b334e]                           dc.w $0000
[000b3350]                           dc.w $0000
[000b3352]                           dc.w $0000
[000b3354]                           dc.w $0000
[000b3356]                           dc.w $0000
[000b3358]                           dc.w $0000
[000b335a]                           dc.w $0000
[000b335c]                           dc.w $0000
[000b335e]                           dc.w $0000
[000b3360]                           dc.w $0000
[000b3362]                           dc.w $0000
[000b3364]                           dc.w $0000
[000b3366]                           dc.w $0000
[000b3368]                           dc.w $0000
[000b336a]                           dc.w $0000
[000b336c]                           dc.w $0000
[000b336e]                           dc.w $0000
[000b3370]                           dc.w $0000
[000b3372]                           dc.w $07ff
[000b3374]                           dc.w $fffc
[000b3376]                           dc.w $0000
[000b3378]                           dc.w $0400
[000b337a]                           dc.w $000c
[000b337c]                           dc.w $0000
[000b337e]                           dc.w $0400
[000b3380]                           dc.w $010c
[000b3382]                           dc.w $1ee5
[000b3384]                           dc.w $f402
[000b3386]                           dc.w $010c
[000b3388]                           dc.w $1094
[000b338a]                           dc.w $4402
[000b338c]                           dc.w $010c
[000b338e]                           dc.w $1094
[000b3390]                           dc.w $5402
[000b3392]                           dc.w $010c
[000b3394]                           dc.w $1c94
[000b3396]                           dc.w $5473
[000b3398]                           dc.w $8d0c
[000b339a]                           dc.w $1094
[000b339c]                           dc.w $4492
[000b339e]                           dc.w $510c
[000b33a0]                           dc.w $1094
[000b33a2]                           dc.w $5492
[000b33a4]                           dc.w $510c
[000b33a6]                           dc.w $1ee4
[000b33a8]                           dc.w $546b
[000b33aa]                           dc.w $8dec
[000b33ac]                           dc.w $0000
[000b33ae]                           dc.w $0400
[000b33b0]                           dc.w $010c
[000b33b2]                           dc.w $0000
[000b33b4]                           dc.w $07ff
[000b33b6]                           dc.w $fefc
[000b33b8]                           dc.w $0000
[000b33ba]                           dc.w $07ff
[000b33bc]                           dc.w $fffc
[000b33be]                           dc.w $0000
[000b33c0]                           dc.w $0000
[000b33c2]                           dc.w $0000
[000b33c4]                           dc.w $0000
[000b33c6]                           dc.w $0000
[000b33c8]                           dc.w $0000
[000b33ca]                           dc.w $0000
[000b33cc]                           dc.w $0000
[000b33ce]                           dc.w $0000
[000b33d0]                           dc.w $0000
[000b33d2]                           dc.w $0000
[000b33d4]                           dc.w $0000
[000b33d6]                           dc.w $0000
[000b33d8]                           dc.w $0000
[000b33da]                           dc.w $0000
[000b33dc]                           dc.w $0000
[000b33de]                           dc.w $0000
[000b33e0]                           dc.w $0000
[000b33e2]                           dc.w $0000
[000b33e4]                           dc.w $0000
[000b33e6]                           dc.w $0000
[000b33e8]                           dc.w $0000
[000b33ea]                           dc.w $0000
[000b33ec]                           dc.w $0000
[000b33ee]                           dc.w $0000
[000b33f0]                           dc.w $0000
[000b33f2]                           dc.w $0000
[000b33f4]                           dc.w $0000
[000b33f6]                           dc.w $0000
[000b33f8]                           dc.w $0000
[000b33fa]                           dc.w $0000
[000b33fc]                           dc.w $0000
[000b33fe]                           dc.w $0000
[000b3400]                           dc.w $0000
[000b3402]                           dc.w $0000
[000b3404]                           dc.w $0000
[000b3406]                           dc.w $0000
[000b3408]                           dc.w $0000
[000b340a]                           dc.w $0000
[000b340c]                           dc.w $0000
[000b340e]                           dc.w $0000
[000b3410]                           dc.w $0000
[000b3412]                           dc.w $0000
[000b3414]                           dc.w $0000
[000b3416]                           dc.w $0000
[000b3418]                           dc.w $0000
[000b341a]                           dc.w $0000
[000b341c]                           dc.w $0000
[000b341e]                           dc.w $0000
[000b3420]                           dc.w $07ff
[000b3422]                           dc.w $fffc
[000b3424]                           dc.w $0000
[000b3426]                           dc.w $0400
[000b3428]                           dc.w $000c
[000b342a]                           dc.w $0000
[000b342c]                           dc.w $0400
[000b342e]                           dc.w $010c
[000b3430]                           dc.w $1ee5
[000b3432]                           dc.w $f402
[000b3434]                           dc.w $010c
[000b3436]                           dc.w $1094
[000b3438]                           dc.w $4402
[000b343a]                           dc.w $010c
[000b343c]                           dc.w $1094
[000b343e]                           dc.w $5402
[000b3440]                           dc.w $010c
[000b3442]                           dc.w $1c94
[000b3444]                           dc.w $5473
[000b3446]                           dc.w $8d0c
[000b3448]                           dc.w $1094
[000b344a]                           dc.w $4492
[000b344c]                           dc.w $510c
[000b344e]                           dc.w $1094
[000b3450]                           dc.w $5492
[000b3452]                           dc.w $510c
[000b3454]                           dc.w $1ee4
[000b3456]                           dc.w $546b
[000b3458]                           dc.w $8dec
[000b345a]                           dc.w $0000
[000b345c]                           dc.w $0400
[000b345e]                           dc.w $010c
[000b3460]                           dc.w $0000
[000b3462]                           dc.w $07ff
[000b3464]                           dc.w $fefc
[000b3466]                           dc.w $0000
[000b3468]                           dc.w $07ff
[000b346a]                           dc.w $fffc
[000b346c]                           dc.w $0000
[000b346e]                           dc.w $0000
[000b3470]                           dc.w $0000
[000b3472]                           dc.w $0000
[000b3474]                           dc.w $0000
[000b3476]                           dc.w $0000
[000b3478]                           dc.w $0000
[000b347a]                           dc.w $0000
[000b347c]                           dc.w $0000
[000b347e]                           dc.w $0000
[000b3480]                           dc.w $0000
[000b3482]                           dc.w $0000
[000b3484]                           dc.w $0000
[000b3486]                           dc.w $0000
[000b3488]                           dc.w $0000
[000b348a]                           dc.w $0000
[000b348c]                           dc.w $0000
[000b348e]                           dc.w $0000
[000b3490]                           dc.w $0000
[000b3492]                           dc.w $0000
[000b3494]                           dc.w $0000
[000b3496]                           dc.w $0000
[000b3498]                           dc.w $0000
[000b349a]                           dc.w $0000
[000b349c]                           dc.w $0000
[000b349e]                           dc.w $0000
[000b34a0]                           dc.w $0000
[000b34a2]                           dc.w $0000
[000b34a4]                           dc.w $0000
[000b34a6]                           dc.w $0000
[000b34a8]                           dc.w $0000
[000b34aa]                           dc.w $0000
[000b34ac]                           dc.w $0000
[000b34ae]                           dc.w $0000
[000b34b0]                           dc.w $0000
[000b34b2]                           dc.w $0000
[000b34b4]                           dc.w $0000
[000b34b6]                           dc.w $0000
[000b34b8]                           dc.w $0000
[000b34ba]                           dc.w $0000
[000b34bc]                           dc.w $0000
[000b34be]                           dc.w $0000
[000b34c0]                           dc.w $0000
[000b34c2]                           dc.w $0000
[000b34c4]                           dc.w $0000
[000b34c6]                           dc.w $0000
[000b34c8]                           dc.w $0000
[000b34ca]                           dc.w $0000
[000b34cc]                           dc.w $0000
[000b34ce]                           dc.w $07ff
[000b34d0]                           dc.w $fffc
[000b34d2]                           dc.w $0000
[000b34d4]                           dc.w $0400
[000b34d6]                           dc.w $000c
[000b34d8]                           dc.w $0000
[000b34da]                           dc.w $0400
[000b34dc]                           dc.w $010c
[000b34de]                           dc.w $1ee5
[000b34e0]                           dc.w $f402
[000b34e2]                           dc.w $010c
[000b34e4]                           dc.w $1094
[000b34e6]                           dc.w $4402
[000b34e8]                           dc.w $010c
[000b34ea]                           dc.w $1094
[000b34ec]                           dc.w $5402
[000b34ee]                           dc.w $010c
[000b34f0]                           dc.w $1c94
[000b34f2]                           dc.w $5473
[000b34f4]                           dc.w $8d0c
[000b34f6]                           dc.w $1094
[000b34f8]                           dc.w $4492
[000b34fa]                           dc.w $510c
[000b34fc]                           dc.w $1094
[000b34fe]                           dc.w $5492
[000b3500]                           dc.w $510c
[000b3502]                           dc.w $1ee4
[000b3504]                           dc.w $546b
[000b3506]                           dc.w $8dec
[000b3508]                           dc.w $0000
[000b350a]                           dc.w $0400
[000b350c]                           dc.w $010c
[000b350e]                           dc.w $0000
[000b3510]                           dc.w $07ff
[000b3512]                           dc.w $fefc
[000b3514]                           dc.w $0000
[000b3516]                           dc.w $07ff
[000b3518]                           dc.w $fffc
[000b351a]                           dc.w $0000
[000b351c]                           dc.w $0000
[000b351e]                           dc.w $0000
[000b3520]                           dc.w $0000
[000b3522]                           dc.w $0000
[000b3524]                           dc.w $0000
[000b3526]                           dc.w $0000
[000b3528]                           dc.w $0000
[000b352a]                           dc.w $0000
[000b352c]                           dc.w $0000
[000b352e]                           dc.w $0000
[000b3530]                           dc.w $0000
[000b3532]                           dc.w $0000
[000b3534]                           dc.w $0000
[000b3536]                           dc.w $0000
[000b3538]                           dc.w $0000
[000b353a]                           dc.w $0000
[000b353c]                           dc.w $0000
[000b353e]                           dc.w $0000
[000b3540]                           dc.w $0000
[000b3542]                           dc.w $0000
[000b3544]                           dc.w $0000
[000b3546]                           dc.w $0000
[000b3548]                           dc.w $0000
[000b354a]                           dc.w $0000
[000b354c]                           dc.w $0000
[000b354e]                           dc.w $0000
[000b3550]                           dc.w $0000
[000b3552]                           dc.w $0000
[000b3554]                           dc.w $0000
[000b3556]                           dc.w $0000
[000b3558]                           dc.w $0000
[000b355a]                           dc.w $0000
[000b355c]                           dc.w $0000
[000b355e]                           dc.w $0000
[000b3560]                           dc.w $0000
[000b3562]                           dc.w $0000
[000b3564]                           dc.w $0000
[000b3566]                           dc.w $0000
[000b3568]                           dc.w $0000
[000b356a]                           dc.w $0000
[000b356c]                           dc.w $0000
[000b356e]                           dc.w $0000
[000b3570]                           dc.w $0000
[000b3572]                           dc.w $0000
[000b3574]                           dc.w $0000
[000b3576]                           dc.w $0000
[000b3578]                           dc.w $0000
[000b357a]                           dc.w $0000
[000b357c]                           dc.w $07ff
[000b357e]                           dc.w $fffc
[000b3580]                           dc.w $0000
[000b3582]                           dc.w $07ff
[000b3584]                           dc.w $fef4
[000b3586]                           dc.w $0000
[000b3588]                           dc.w $0600
[000b358a]                           dc.w $0104
[000b358c]                           dc.w $1ee5
[000b358e]                           dc.w $f602
[000b3590]                           dc.w $0104
[000b3592]                           dc.w $1094
[000b3594]                           dc.w $4602
[000b3596]                           dc.w $0104
[000b3598]                           dc.w $1094
[000b359a]                           dc.w $5602
[000b359c]                           dc.w $0104
[000b359e]                           dc.w $1c94
[000b35a0]                           dc.w $5673
[000b35a2]                           dc.w $8d04
[000b35a4]                           dc.w $1094
[000b35a6]                           dc.w $4692
[000b35a8]                           dc.w $5104
[000b35aa]                           dc.w $1094
[000b35ac]                           dc.w $5692
[000b35ae]                           dc.w $5104
[000b35b0]                           dc.w $1ee4
[000b35b2]                           dc.w $566b
[000b35b4]                           dc.w $8de4
[000b35b6]                           dc.w $0000
[000b35b8]                           dc.w $0600
[000b35ba]                           dc.w $0104
[000b35bc]                           dc.w $0000
[000b35be]                           dc.w $0400
[000b35c0]                           dc.w $0004
[000b35c2]                           dc.w $0000
[000b35c4]                           dc.w $07ff
[000b35c6]                           dc.w $fffc
[000b35c8]                           dc.w $0000
[000b35ca]                           dc.w $0000
[000b35cc]                           dc.w $0000
[000b35ce]                           dc.w $0000
[000b35d0]                           dc.w $0000
[000b35d2]                           dc.w $0000
[000b35d4]                           dc.w $0000
[000b35d6]                           dc.w $0000
[000b35d8]                           dc.w $0000
[000b35da]                           dc.w $0000
[000b35dc]                           dc.w $0000
[000b35de]                           dc.w $0000
[000b35e0]                           dc.w $0000
[000b35e2]                           dc.w $0000
[000b35e4]                           dc.w $0000
DATAS_02:
[000b35e6]                           dc.w $0000
[000b35e8]                           dc.w $0000
[000b35ea]                           dc.w $0000
[000b35ec]                           dc.w $0000
[000b35ee]                           dc.w $0000
[000b35f0]                           dc.w $0000
[000b35f2]                           dc.w $0000
[000b35f4]                           dc.w $0000
[000b35f6]                           dc.w $0000
[000b35f8]                           dc.w $0000
[000b35fa]                           dc.w $0000
[000b35fc]                           dc.w $0000
[000b35fe]                           dc.w $0000
[000b3600]                           dc.w $0000
[000b3602]                           dc.w $0000
[000b3604]                           dc.w $0000
[000b3606]                           dc.w $0000
[000b3608]                           dc.w $0000
[000b360a]                           dc.w $0000
[000b360c]                           dc.w $0000
[000b360e]                           dc.w $0000
[000b3610]                           dc.w $0000
[000b3612]                           dc.w $0000
[000b3614]                           dc.w $0000
[000b3616]                           dc.w $0000
[000b3618]                           dc.w $0000
[000b361a]                           dc.w $0000
[000b361c]                           dc.w $0000
[000b361e]                           dc.w $0000
[000b3620]                           dc.w $0000
[000b3622]                           dc.w $0000
[000b3624]                           dc.w $0000
[000b3626]                           dc.w $0000
[000b3628]                           dc.w $0000
[000b362a]                           dc.w $07ff
[000b362c]                           dc.w $fffc
[000b362e]                           dc.w $0000
[000b3630]                           dc.w $07ff
[000b3632]                           dc.w $fffc
[000b3634]                           dc.w $0000
[000b3636]                           dc.w $07ff
[000b3638]                           dc.w $fffc
[000b363a]                           dc.w $1ee5
[000b363c]                           dc.w $f7ff
[000b363e]                           dc.w $fffc
[000b3640]                           dc.w $1094
[000b3642]                           dc.w $47ff
[000b3644]                           dc.w $fffc
[000b3646]                           dc.w $1094
[000b3648]                           dc.w $57ff
[000b364a]                           dc.w $fffc
[000b364c]                           dc.w $1c94
[000b364e]                           dc.w $57ff
[000b3650]                           dc.w $fffc
[000b3652]                           dc.w $1094
[000b3654]                           dc.w $47ff
[000b3656]                           dc.w $fffc
[000b3658]                           dc.w $1094
[000b365a]                           dc.w $57ff
[000b365c]                           dc.w $fffc
[000b365e]                           dc.w $1ee4
[000b3660]                           dc.w $57ff
[000b3662]                           dc.w $fffc
[000b3664]                           dc.w $0000
[000b3666]                           dc.w $07ff
[000b3668]                           dc.w $fffc
[000b366a]                           dc.w $0000
[000b366c]                           dc.w $07ff
[000b366e]                           dc.w $fffc
[000b3670]                           dc.w $0000
[000b3672]                           dc.w $07ff
[000b3674]                           dc.w $fffc
[000b3676]                           dc.w $0000
[000b3678]                           dc.w $0000
[000b367a]                           dc.w $0000
[000b367c]                           dc.w $0000
[000b367e]                           dc.w $0000
[000b3680]                           dc.w $0000
[000b3682]                           dc.w $0000
[000b3684]                           dc.w $0000
[000b3686]                           dc.w $0000
[000b3688]                           dc.w $0000
[000b368a]                           dc.w $0000
[000b368c]                           dc.w $0000
[000b368e]                           dc.w $0000
[000b3690]                           dc.w $0000
[000b3692]                           dc.w $0000
TEDI_001:
[000b3694] 000b32d1                  dc.l TEXT_025
[000b3698] 000b32c2                  dc.l TEXT_002
[000b369c] 000b32c2                  dc.l TEXT_002
[000b36a0]                           dc.w $0003
[000b36a2]                           dc.w $0006
[000b36a4]                           dc.w $0000
[000b36a6]                           dc.w $1180
[000b36a8]                           dc.w $0000
[000b36aa]                           dc.w $0000
[000b36ac]                           dc.w $0039
[000b36ae]                           dc.w $0001
A_3DBUTTON02:
[000b36b0] 00064a22                  dc.l A_3Dbutton
[000b36b4]                           dc.w $21f1
[000b36b6]                           dc.w $01f8
[000b36b8] 000630f2                  dc.l Auo_string
[000b36bc]                           dc.w $0000
[000b36be]                           dc.w $0000
[000b36c0]                           dc.w $0000
[000b36c2]                           dc.w $0000
[000b36c4]                           dc.w $0000
[000b36c6]                           dc.w $0000
[000b36c8]                           dc.w $0000
[000b36ca]                           dc.w $0000
[000b36cc]                           dc.w $0000
[000b36ce]                           dc.w $0000
A_3DBUTTON04:
[000b36d0] 00064a22                  dc.l A_3Dbutton
[000b36d4]                           dc.w $29c1
[000b36d6]                           dc.w $0178
[000b36d8] 000630f2                  dc.l Auo_string
[000b36dc] 000b32c3                  dc.l TEXT_003
[000b36e0]                           dc.w $0000
[000b36e2]                           dc.w $0000
[000b36e4]                           dc.w $0000
[000b36e6]                           dc.w $0000
[000b36e8]                           dc.w $0000
[000b36ea]                           dc.w $0000
[000b36ec]                           dc.w $0000
[000b36ee]                           dc.w $0000
A_INNERFRAME02:
[000b36f0] 00064256                  dc.l A_innerframe
[000b36f4]                           dc.w $1000
[000b36f6]                           dc.w $8f19
[000b36f8] 000630f2                  dc.l Auo_string
[000b36fc]                           dc.w $0000
[000b36fe]                           dc.w $0000
[000b3700]                           dc.w $0000
[000b3702]                           dc.w $0000
[000b3704]                           dc.w $0000
[000b3706]                           dc.w $0000
[000b3708]                           dc.w $0000
[000b370a]                           dc.w $0000
[000b370c]                           dc.w $0000
[000b370e]                           dc.w $0000
_C4_IC_TEDI:
[000b3710]                           dc.w $0004
[000b3712] 000b332e                  dc.l $000b332e
[000b3716] 000b35e6                  dc.l DATAS_02
[000b371a]                           dc.w $0000
[000b371c]                           dc.w $0000
[000b371e]                           dc.w $0000
[000b3720]                           dc.w $0000
[000b3722]                           dc.w $0000
[000b3724]                           dc.w $0000
_MSK_IC_TEDI:
[000b3726]                           dc.w $0000
[000b3728]                           dc.w $0000
[000b372a]                           dc.w $0000
[000b372c]                           dc.w $0000
[000b372e]                           dc.w $0000
[000b3730]                           dc.w $0000
[000b3732]                           dc.w $0000
[000b3734]                           dc.w $0000
[000b3736]                           dc.w $0000
[000b3738]                           dc.w $0000
[000b373a]                           dc.w $0000
[000b373c]                           dc.w $0000
[000b373e]                           dc.w $0000
[000b3740]                           dc.w $0000
[000b3742]                           dc.w $0000
[000b3744]                           dc.w $0000
[000b3746]                           dc.w $0000
[000b3748]                           dc.w $0000
[000b374a]                           dc.w $0000
[000b374c]                           dc.w $0000
[000b374e]                           dc.w $0000
[000b3750]                           dc.w $0000
[000b3752]                           dc.w $0000
[000b3754]                           dc.w $0000
[000b3756]                           dc.w $0000
[000b3758]                           dc.w $0000
[000b375a]                           dc.w $0000
[000b375c]                           dc.w $0000
[000b375e]                           dc.w $0000
[000b3760]                           dc.w $0000
[000b3762]                           dc.w $0000
[000b3764]                           dc.w $0000
[000b3766]                           dc.w $0000
[000b3768]                           dc.w $0000
[000b376a]                           dc.w $0000
[000b376c]                           dc.w $0000
[000b376e]                           dc.w $0000
[000b3770]                           dc.w $03ff
[000b3772]                           dc.w $fff8
[000b3774]                           dc.w $0000
[000b3776]                           dc.w $03ff
[000b3778]                           dc.w $fff8
[000b377a]                           dc.w $1ee5
[000b377c]                           dc.w $f3ff
[000b377e]                           dc.w $fff8
[000b3780]                           dc.w $1094
[000b3782]                           dc.w $43ff
[000b3784]                           dc.w $fff8
[000b3786]                           dc.w $1094
[000b3788]                           dc.w $4bff
[000b378a]                           dc.w $fff8
[000b378c]                           dc.w $1c94
[000b378e]                           dc.w $4bff
[000b3790]                           dc.w $fff8
[000b3792]                           dc.w $1094
[000b3794]                           dc.w $43ff
[000b3796]                           dc.w $fff8
[000b3798]                           dc.w $1094
[000b379a]                           dc.w $4bff
[000b379c]                           dc.w $fff8
[000b379e]                           dc.w $1ee4
[000b37a0]                           dc.w $4bff
[000b37a2]                           dc.w $fff8
[000b37a4]                           dc.w $0000
[000b37a6]                           dc.w $03ff
[000b37a8]                           dc.w $fff8
[000b37aa]                           dc.w $0000
[000b37ac]                           dc.w $03ff
[000b37ae]                           dc.w $fff8
[000b37b0]                           dc.w $0000
[000b37b2]                           dc.w $0000
[000b37b4]                           dc.w $0000
[000b37b6]                           dc.w $0000
[000b37b8]                           dc.w $0000
[000b37ba]                           dc.w $0000
[000b37bc]                           dc.w $0000
[000b37be]                           dc.w $0000
[000b37c0]                           dc.w $0000
[000b37c2]                           dc.w $0000
[000b37c4]                           dc.w $0000
[000b37c6]                           dc.w $0000
[000b37c8]                           dc.w $0000
[000b37ca]                           dc.w $0000
[000b37cc]                           dc.w $0000
[000b37ce]                           dc.w $0000
[000b37d0]                           dc.w $0000
[000b37d2]                           dc.w $0000
_DAT_IC_TEDI:
[000b37d4]                           dc.w $0000
[000b37d6]                           dc.w $0000
[000b37d8]                           dc.w $0000
[000b37da]                           dc.w $0000
[000b37dc]                           dc.w $0000
[000b37de]                           dc.w $0000
[000b37e0]                           dc.w $0000
[000b37e2]                           dc.w $0000
[000b37e4]                           dc.w $0000
[000b37e6]                           dc.w $0000
[000b37e8]                           dc.w $0000
[000b37ea]                           dc.w $0000
[000b37ec]                           dc.w $0000
[000b37ee]                           dc.w $0000
[000b37f0]                           dc.w $0000
[000b37f2]                           dc.w $0000
[000b37f4]                           dc.w $0000
[000b37f6]                           dc.w $0000
[000b37f8]                           dc.w $0000
[000b37fa]                           dc.w $0000
[000b37fc]                           dc.w $0000
[000b37fe]                           dc.w $0000
[000b3800]                           dc.w $0000
[000b3802]                           dc.w $0000
[000b3804]                           dc.w $0000
[000b3806]                           dc.w $0000
[000b3808]                           dc.w $0000
[000b380a]                           dc.w $0000
[000b380c]                           dc.w $0000
[000b380e]                           dc.w $0000
[000b3810]                           dc.w $0000
[000b3812]                           dc.w $0000
[000b3814]                           dc.w $0000
[000b3816]                           dc.w $0000
[000b3818]                           dc.w $0000
[000b381a]                           dc.w $0000
[000b381c]                           dc.w $0000
[000b381e]                           dc.w $03ff
[000b3820]                           dc.w $fef8
[000b3822]                           dc.w $0000
[000b3824]                           dc.w $0200
[000b3826]                           dc.w $0108
[000b3828]                           dc.w $1ee5
[000b382a]                           dc.w $f202
[000b382c]                           dc.w $0108
[000b382e]                           dc.w $1094
[000b3830]                           dc.w $4202
[000b3832]                           dc.w $0108
[000b3834]                           dc.w $1094
[000b3836]                           dc.w $4a02
[000b3838]                           dc.w $0108
[000b383a]                           dc.w $1c94
[000b383c]                           dc.w $4a73
[000b383e]                           dc.w $8d08
[000b3840]                           dc.w $1094
[000b3842]                           dc.w $4292
[000b3844]                           dc.w $5108
[000b3846]                           dc.w $1094
[000b3848]                           dc.w $4a92
[000b384a]                           dc.w $5108
[000b384c]                           dc.w $1ee4
[000b384e]                           dc.w $4a6b
[000b3850]                           dc.w $8de8
[000b3852]                           dc.w $0000
[000b3854]                           dc.w $0200
[000b3856]                           dc.w $0108
[000b3858]                           dc.w $0000
[000b385a]                           dc.w $03ff
[000b385c]                           dc.w $fef8
[000b385e]                           dc.w $0000
[000b3860]                           dc.w $0000
[000b3862]                           dc.w $0000
[000b3864]                           dc.w $0000
[000b3866]                           dc.w $0000
[000b3868]                           dc.w $0000
[000b386a]                           dc.w $0000
[000b386c]                           dc.w $0000
[000b386e]                           dc.w $0000
[000b3870]                           dc.w $0000
[000b3872]                           dc.w $0000
[000b3874]                           dc.w $0000
[000b3876]                           dc.w $0000
[000b3878]                           dc.w $0000
[000b387a]                           dc.w $0000
[000b387c]                           dc.w $0000
[000b387e]                           dc.w $0000
[000b3880]                           dc.w $0000
IC_TEDI:
[000b3882] 000b3726                  dc.l _MSK_IC_TEDI
[000b3886] 000b37d4                  dc.l _DAT_IC_TEDI
[000b388a] 000b3320                  dc.l TEXT_13
[000b388e]                           dc.w $1000
[000b3890]                           dc.w $0000
[000b3892]                           dc.w $0000
[000b3894]                           dc.w $000c
[000b3896]                           dc.w $0000
[000b3898]                           dc.w $0030
[000b389a]                           dc.w $001d
[000b389c]                           dc.w $0000
[000b389e]                           dc.w $0020
[000b38a0]                           dc.w $0048
[000b38a2]                           dc.w $0008
[000b38a4] 000b3710                  dc.l _C4_IC_TEDI
EDIT_TEDI:
[000b38a8]                           dc.w $ffff
[000b38aa]                           dc.w $0001
[000b38ac]                           dc.w $0008
[000b38ae]                           dc.w $0018
[000b38b0]                           dc.w $0040
[000b38b2]                           dc.w $0010
[000b38b4] 000b36b0                  dc.l A_3DBUTTON02
[000b38b8]                           dc.w $0000
[000b38ba]                           dc.w $0000
[000b38bc]                           dc.w $0042
[000b38be]                           dc.w $0008
_01_EDIT_TEDI:
[000b38c0]                           dc.w $0008
[000b38c2]                           dc.w $0002
[000b38c4]                           dc.w $0007
[000b38c6]                           dc.w $0018
[000b38c8]                           dc.w $0040
[000b38ca]                           dc.w $0000
[000b38cc] 000b36f0                  dc.l A_INNERFRAME02
[000b38d0]                           dc.w $0001
[000b38d2]                           dc.w $0000
[000b38d4]                           dc.w $0040
[000b38d6]                           dc.w $0005
_02_EDIT_TEDI:
[000b38d8]                           dc.w $0003
[000b38da]                           dc.w $ffff
[000b38dc]                           dc.w $ffff
[000b38de]                           dc.w $001c
[000b38e0]                           dc.w $0000
[000b38e2]                           dc.w $0000
[000b38e4] 000b32c6                  dc.l TEXT_01
[000b38e8]                           dc.w $0001
[000b38ea]                           dc.w $0001
[000b38ec]                           dc.w $0005
[000b38ee]                           dc.w $0001
_03_EDIT_TEDI:
[000b38f0]                           dc.w $0004
[000b38f2]                           dc.w $ffff
[000b38f4]                           dc.w $ffff
[000b38f6]                           dc.w $0016
[000b38f8]                           dc.w $0000
[000b38fa]                           dc.w $0000
[000b38fc] 000b3694                  dc.l TEDI_001
[000b3900]                           dc.w $0007
[000b3902]                           dc.w $0001
[000b3904]                           dc.w $0038
[000b3906]                           dc.w $0001
_04_EDIT_TEDI:
[000b3908]                           dc.w $0005
[000b390a]                           dc.w $ffff
[000b390c]                           dc.w $ffff
[000b390e]                           dc.w $001c
[000b3910]                           dc.w $0000
[000b3912]                           dc.w $0000
[000b3914] 000b32cc                  dc.l TEXT_02
[000b3918]                           dc.w $0001
[000b391a]                           dc.w $0002
[000b391c]                           dc.w $0004
[000b391e]                           dc.w $0001
_05_EDIT_TEDI:
[000b3920]                           dc.w $0006
[000b3922]                           dc.w $ffff
[000b3924]                           dc.w $ffff
[000b3926]                           dc.w $0016
[000b3928]                           dc.w $0000
[000b392a]                           dc.w $0000
[000b392c] 000b3694                  dc.l TEDI_001
[000b3930]                           dc.w $0007
[000b3932]                           dc.w $0002
[000b3934]                           dc.w $0038
[000b3936]                           dc.w $0001
_06_EDIT_TEDI:
[000b3938]                           dc.w $0007
[000b393a]                           dc.w $ffff
[000b393c]                           dc.w $ffff
[000b393e]                           dc.w $001c
[000b3940]                           dc.w $0000
[000b3942]                           dc.w $0000
[000b3944] 000b330a                  dc.l TEXT_03
[000b3948]                           dc.w $0001
[000b394a]                           dc.w $0003
[000b394c]                           dc.w $0004
[000b394e]                           dc.w $0001
_07_EDIT_TEDI:
[000b3950]                           dc.w $0001
[000b3952]                           dc.w $ffff
[000b3954]                           dc.w $ffff
[000b3956]                           dc.w $0016
[000b3958]                           dc.w $0000
[000b395a]                           dc.w $0000
[000b395c] 000b3694                  dc.l TEDI_001
[000b3960]                           dc.w $0007
[000b3962]                           dc.w $0003
[000b3964]                           dc.w $0038
[000b3966]                           dc.w $0001
_08_EDIT_TEDI:
[000b3968]                           dc.w $0000
[000b396a]                           dc.w $ffff
[000b396c]                           dc.w $ffff
[000b396e]                           dc.w $0018
[000b3970]                           dc.w $4007
[000b3972]                           dc.w $0000
[000b3974] 000b36d0                  dc.l A_3DBUTTON04
[000b3978]                           dc.w $001b
[000b397a]                           dc.w $0005
[000b397c]                           dc.w $000c
[000b397e]                           dc.w $0002
_08aEDIT_TEDI:
[000b3980] 0002321a                  dc.l editte_ok
[000b3984]                           dc.w $0000
[000b3986]                           dc.w $0000
[000b3988]                           dc.w $8020
[000b398a]                           dc.w $884f
[000b398c]                           dc.w $0000
[000b398e]                           dc.w $0000
[000b3990]                           dc.w $0000
[000b3992]                           dc.w $0000
[000b3994]                           dc.w $0000
[000b3996]                           dc.w $0000
WI_TEDI:
[000b3998]                           dc.w $0000
[000b399a]                           dc.w $0000
[000b399c] 000232c8                  dc.l tedi_service
[000b39a0] 0002322c                  dc.l tedi_make
[000b39a4] 00057428                  dc.l Awi_open
[000b39a8] 00055e94                  dc.l Awi_init
[000b39ac] 000b38a8                  dc.l EDIT_TEDI
[000b39b0]                           dc.w $0000
[000b39b2]                           dc.w $0000
[000b39b4]                           dc.w $0000
[000b39b6]                           dc.w $0000
[000b39b8]                           dc.w $ffff
[000b39ba]                           dc.w $601f
[000b39bc]                           dc.w $0000
[000b39be]                           dc.w $0000
[000b39c0]                           dc.w $00a0
[000b39c2]                           dc.w $0032
[000b39c4]                           dc.w $0000
[000b39c6]                           dc.w $0000
[000b39c8]                           dc.w $0000
[000b39ca]                           dc.w $0000
[000b39cc]                           dc.w $0000
[000b39ce]                           dc.w $0000
[000b39d0]                           dc.w $0000
[000b39d2]                           dc.w $0000
[000b39d4]                           dc.w $ffff
[000b39d6]                           dc.w $ffff
[000b39d8]                           dc.w $ffff
[000b39da]                           dc.w $ffff
[000b39dc]                           dc.w $0000
[000b39de]                           dc.w $0000
[000b39e0]                           dc.w $fcf8
[000b39e2] 000b330f                  dc.l TEXT_04
[000b39e6] 000b32c2                  dc.l TEXT_002
[000b39ea]                           dc.w $2710
[000b39ec]                           dc.w $0103
[000b39ee]                           dc.w $0000
[000b39f0]                           dc.w $ffff
[000b39f2] 000b3882                  dc.l IC_TEDI
[000b39f6]                           dc.w $0000
[000b39f8]                           dc.w $0000
[000b39fa] 0006b744                  dc.l Awi_keys
[000b39fe] 00051852                  dc.l Awi_obchange
[000b3a02] 00051c46                  dc.l Awi_redraw
[000b3a06] 000587a4                  dc.l Awi_topped
[000b3a0a] 00058362                  dc.l Awi_closed
[000b3a0e] 000587ec                  dc.l Awi_fulled
[000b3a12] 0005217c                  dc.l Awi_arrowed
[000b3a16] 000524b4                  dc.l Awi_hslid
[000b3a1a] 0005255e                  dc.l Awi_vslid
[000b3a1e] 00058bb0                  dc.l Awi_sized
[000b3a22] 00058d50                  dc.l Awi_moved
[000b3a26] 0005998a                  dc.l Awi_iconify
[000b3a2a] 00059c6c                  dc.l Awi_uniconify
[000b3a2e] 0005b5b6                  dc.l Awi_gemscript
[000b3a32]                           dc.w $0000
[000b3a34]                           dc.w $0000
[000b3a36]                           dc.w $0000
[000b3a38]                           dc.w $0000
