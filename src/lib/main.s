_ACSmessage:
[000428ec] 4e75                      rts
_ACSclose:
[000428ee] 4eb9 0004 a2f8            jsr        Aev_unhidepointer
[000428f4] 2079 0010 ee4e            movea.l    ACSblk,a0
[000428fa] 3028 0236                 move.w     566(a0),d0
[000428fe] 660c                      bne.s      $0004290C
[00042900] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042906] 3028 027e                 move.w     638(a0),d0
[0004290a] 6708                      beq.s      $00042914
[0004290c] 4eb9 0004 a30e            jsr        Aev_quit
[00042912] 4e75                      rts
[00042914] 91c8                      suba.l     a0,a0
[00042916] 7002                      moveq.l    #2,d0
[00042918] 4eb9 0005 6a20            jsr        Awi_sendall
[0004291e] 4e75                      rts
_ACSaboutme:
[00042920] 594f                      subq.w     #4,a7
[00042922] 41f9 000d fa62            lea.l      _W_ABOUT,a0
[00042928] 2279 000d fa6a            movea.l    $000DFA6A,a1
[0004292e] 4e91                      jsr        (a1)
[00042930] 2e88                      move.l     a0,(a7)
[00042932] 2017                      move.l     (a7),d0
[00042934] 6700 00ca                 beq        $00042A00
[00042938] 43f9 000d fbea            lea.l      _c_version,a1
[0004293e] 7007                      moveq.l    #7,d0
[00042940] 2057                      movea.l    (a7),a0
[00042942] 2068 0014                 movea.l    20(a0),a0
[00042946] 4eb9 0005 0fd8            jsr        Aob_puttext
[0004294c] 1039 000d fc05            move.b     lib_date,d0
[00042952] 6600 007e                 bne.w      $000429D2
[00042956] 1039 000d fbfd            move.b     $000DFBFD,d0
[0004295c] 4880                      ext.w      d0
[0004295e] 4eb9 0008 37f6            jsr        isspace
[00042964] 4a40                      tst.w      d0
[00042966] 6704                      beq.s      $0004296C
[00042968] 7030                      moveq.l    #48,d0
[0004296a] 6006                      bra.s      $00042972
[0004296c] 1039 000d fbfd            move.b     $000DFBFD,d0
[00042972] 13c0 000d fc05            move.b     d0,lib_date
[00042978] 13f9 000d fbfe 000d fc06  move.b     $000DFBFE,$000DFC06
[00042982] 13fc 002e 000d fc07       move.b     #$2E,$000DFC07
[0004298a] 43f9 000d fc08            lea.l      $000DFC08,a1
[00042990] 41f9 000d fbf9            lea.l      compiler_date,a0
[00042996] 4eb9 0006 cd86            jsr        Adate_getMonth
[0004299c] 13fc 002e 000d fc0a       move.b     #$2E,$000DFC0A
[000429a4] 13f9 000d fc00 000d fc0b  move.b     $000DFC00,$000DFC0B
[000429ae] 13f9 000d fc01 000d fc0c  move.b     $000DFC01,$000DFC0C
[000429b8] 13f9 000d fc02 000d fc0d  move.b     $000DFC02,$000DFC0D
[000429c2] 13f9 000d fc03 000d fc0e  move.b     $000DFC03,$000DFC0E
[000429cc] 4239 000d fc0f            clr.b      $000DFC0F
[000429d2] 4879 000d fc05            pea.l      lib_date
[000429d8] 43f9 000d fc10            lea.l      $000DFC10,a1
[000429de] 7006                      moveq.l    #6,d0
[000429e0] 206f 0004                 movea.l    4(a7),a0
[000429e4] 2068 0014                 movea.l    20(a0),a0
[000429e8] 4eb9 0005 0f94            jsr        Aob_printf
[000429ee] 584f                      addq.w     #4,a7
[000429f0] 2057                      movea.l    (a7),a0
[000429f2] 4eb9 0005 9df4            jsr        Awi_dialog
[000429f8] 2057                      movea.l    (a7),a0
[000429fa] 4eb9 0005 85f2            jsr        Awi_delete
[00042a00] 584f                      addq.w     #4,a7
[00042a02] 4e75                      rts
dummy:
[00042a04] 4e75                      rts
ok:
[00042a06] 4240                      clr.w      d0
[00042a08] 4e75                      rts
DEBUG_MEM:
[00042a0a] 594f                      subq.w     #4,a7
[00042a0c] 2e88                      move.l     a0,(a7)
[00042a0e] 23d7 0010 f558            move.l     (a7),DEBUG_DEFECT_MEM
[00042a14] 584f                      addq.w     #4,a7
[00042a16] 4e75                      rts
acs_call:
[00042a18] 4fef fff6                 lea.l      -10(a7),a7
[00042a1c] 3f40 0008                 move.w     d0,8(a7)
[00042a20] 2f48 0004                 move.l     a0,4(a7)
[00042a24] 2e89                      move.l     a1,(a7)
[00042a26] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042a2c] 316f 0008 0286            move.w     8(a7),646(a0)
[00042a32] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042a38] 216f 0004 0288            move.l     4(a7),648(a0)
[00042a3e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042a44] 2157 028c                 move.l     (a7),652(a0)
[00042a48] 4eb9 0004 2d7c            jsr        ACSinitialize
[00042a4e] 4a40                      tst.w      d0
[00042a50] 6612                      bne.s      $00042A64
[00042a52] 4eb9 0004 b150            jsr        ACSeventhandler
[00042a58] 4eb9 0004 2f2c            jsr        ACSterminate
[00042a5e] 4240                      clr.w      d0
[00042a60] 600c                      bra.s      $00042A6E
[00042a62] 600a                      bra.s      $00042A6E
[00042a64] 4eb9 0004 2f2c            jsr        ACSterminate
[00042a6a] 70ff                      moveq.l    #-1,d0
[00042a6c] 4e71                      nop
[00042a6e] 4fef 000a                 lea.l      10(a7),a7
[00042a72] 4e75                      rts
get_acsblk:
[00042a74] 23fc 0010 ee52 0010 ee4e  move.l     #_ACSblk,ACSblk
[00042a7e] 223c 0000 0506            move.l     #$00000506,d1
[00042a84] 4240                      clr.w      d0
[00042a86] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042a8c] 4eb9 0008 36ea            jsr        memset
[00042a92] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042a98] 42a8 04ea                 clr.l      1258(a0)
[00042a9c] 43f9 000d fc17            lea.l      $000DFC17,a1
[00042aa2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042aa8] 41e8 021e                 lea.l      542(a0),a0
[00042aac] 4eb9 0008 2f0c            jsr        strcpy
[00042ab2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042ab8] 217c 0000 01f4 0232       move.l     #$000001F4,562(a0)
[00042ac0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042ac6] 317c 0001 0236            move.w     #$0001,566(a0)
[00042acc] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042ad2] 4268 0238                 clr.w      568(a0)
[00042ad6] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042adc] 4268 023a                 clr.w      570(a0)
[00042ae0] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042ae6] 217c 000a 8278 023c       move.l     #ACSdescr,572(a0)
[00042aee] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042af4] 2068 023c                 movea.l    572(a0),a0
[00042af8] 0068 0040 000e            ori.w      #$0040,14(a0)
[00042afe] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042b04] 4268 027e                 clr.w      638(a0)
[00042b08] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042b0e] 217c 0011 4a54 0280       move.l     #$00114A54,640(a0)
[00042b16] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042b1c] 317c 0100 0244            move.w     #$0100,580(a0)
[00042b22] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042b28] 217c 0010 f358 0254       move.l     #list,596(a0)
[00042b30] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042b36] 4268 0286                 clr.w      646(a0)
[00042b3a] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042b40] 42a8 0288                 clr.l      648(a0)
[00042b44] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042b4a] 42a8 028c                 clr.l      652(a0)
[00042b4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042b54] 217c 0005 bb0c 03d6       move.l     #Ash_error,982(a0)
[00042b5c] 2039 000a 840e            move.l     $000A840E,d0
[00042b62] 6708                      beq.s      $00042B6C
[00042b64] 2079 000a 840e            movea.l    $000A840E,a0
[00042b6a] 6004                      bra.s      $00042B70
[00042b6c] 41fa fe96                 lea.l      dummy(pc),a0
[00042b70] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042b76] 2348 0298                 move.l     a0,664(a1)
[00042b7a] 2039 000a 8412            move.l     $000A8412,d0
[00042b80] 6708                      beq.s      $00042B8A
[00042b82] 2079 000a 8412            movea.l    $000A8412,a0
[00042b88] 6004                      bra.s      $00042B8E
[00042b8a] 41fa fd94                 lea.l      _ACSaboutme(pc),a0
[00042b8e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042b94] 2348 029c                 move.l     a0,668(a1)
[00042b98] 2039 000a 8416            move.l     $000A8416,d0
[00042b9e] 6708                      beq.s      $00042BA8
[00042ba0] 2079 000a 8416            movea.l    $000A8416,a0
[00042ba6] 6004                      bra.s      $00042BAC
[00042ba8] 41fa fd44                 lea.l      _ACSclose(pc),a0
[00042bac] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042bb2] 2348 02a0                 move.l     a0,672(a1)
[00042bb6] 2039 000a 841a            move.l     $000A841A,d0
[00042bbc] 6708                      beq.s      $00042BC6
[00042bbe] 2079 000a 841a            movea.l    $000A841A,a0
[00042bc4] 6004                      bra.s      $00042BCA
[00042bc6] 41fa fd24                 lea.l      _ACSmessage(pc),a0
[00042bca] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042bd0] 2348 02a4                 move.l     a0,676(a1)
[00042bd4] 2039 000a 841e            move.l     $000A841E,d0
[00042bda] 6708                      beq.s      $00042BE4
[00042bdc] 2079 000a 841e            movea.l    $000A841E,a0
[00042be2] 6004                      bra.s      $00042BE8
[00042be4] 41fa fe1e                 lea.l      dummy(pc),a0
[00042be8] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042bee] 2348 02a8                 move.l     a0,680(a1)
[00042bf2] 2039 000a 8422            move.l     $000A8422,d0
[00042bf8] 6708                      beq.s      $00042C02
[00042bfa] 2079 000a 8422            movea.l    $000A8422,a0
[00042c00] 6004                      bra.s      $00042C06
[00042c02] 41fa fe00                 lea.l      dummy(pc),a0
[00042c06] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042c0c] 2348 02ac                 move.l     a0,684(a1)
[00042c10] 2039 000a 843e            move.l     $000A843E,d0
[00042c16] 6708                      beq.s      $00042C20
[00042c18] 2079 000a 843e            movea.l    $000A843E,a0
[00042c1e] 6004                      bra.s      $00042C24
[00042c20] 41fa fde4                 lea.l      ok(pc),a0
[00042c24] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042c2a] 2348 02b0                 move.l     a0,688(a1)
[00042c2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042c34] 317c 00c1 02b4            move.w     #$00C1,692(a0)
[00042c3a] 2039 000a 8426            move.l     $000A8426,d0
[00042c40] 6708                      beq.s      $00042C4A
[00042c42] 2079 000a 8426            movea.l    $000A8426,a0
[00042c48] 6004                      bra.s      $00042C4E
[00042c4a] 41fa fdb8                 lea.l      dummy(pc),a0
[00042c4e] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042c54] 2348 02b6                 move.l     a0,694(a1)
[00042c58] 2039 000a 8432            move.l     $000A8432,d0
[00042c5e] 6708                      beq.s      $00042C68
[00042c60] 2079 000a 8432            movea.l    $000A8432,a0
[00042c66] 6004                      bra.s      $00042C6C
[00042c68] 41fa fd9a                 lea.l      dummy(pc),a0
[00042c6c] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042c72] 2348 02c2                 move.l     a0,706(a1)
[00042c76] 2039 000a 842a            move.l     $000A842A,d0
[00042c7c] 6708                      beq.s      $00042C86
[00042c7e] 2079 000a 842a            movea.l    $000A842A,a0
[00042c84] 6004                      bra.s      $00042C8A
[00042c86] 41fa fd7c                 lea.l      dummy(pc),a0
[00042c8a] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042c90] 2348 02ba                 move.l     a0,698(a1)
[00042c94] 2039 000a 842e            move.l     $000A842E,d0
[00042c9a] 6708                      beq.s      $00042CA4
[00042c9c] 2079 000a 842e            movea.l    $000A842E,a0
[00042ca2] 6004                      bra.s      $00042CA8
[00042ca4] 41fa fd5e                 lea.l      dummy(pc),a0
[00042ca8] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042cae] 2348 02be                 move.l     a0,702(a1)
[00042cb2] 2039 000a 843a            move.l     $000A843A,d0
[00042cb8] 6708                      beq.s      $00042CC2
[00042cba] 2079 000a 843a            movea.l    $000A843A,a0
[00042cc0] 6006                      bra.s      $00042CC8
[00042cc2] 41f9 0006 12a6            lea.l      Aev_GEMScript,a0
[00042cc8] 2279 0010 ee4e            movea.l    ACSblk,a1
[00042cce] 2348 04ee                 move.l     a0,1262(a1)
[00042cd2] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042cd8] 317c 0102 02d0            move.w     #$0102,720(a0)
[00042cde] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042ce4] 4268 02c8                 clr.w      712(a0)
[00042ce8] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042cee] 317c 0003 02c6            move.w     #$0003,710(a0)
[00042cf4] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042cfa] 217c 0004 2a0a 02d2       move.l     #DEBUG_MEM,722(a0)
[00042d02] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042d08] 42a8 03e0                 clr.l      992(a0)
[00042d0c] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042d12] 317c 0014 03e4            move.w     #$0014,996(a0)
[00042d18] 43f9 000d fc2b            lea.l      $000DFC2B,a1
[00042d1e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042d24] 41e8 03e6                 lea.l      998(a0),a0
[00042d28] 4eb9 0008 2f0c            jsr        strcpy
[00042d2e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042d34] 42a8 026a                 clr.l      618(a0)
[00042d38] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042d3e] 4228 04f2                 clr.b      1266(a0)
[00042d42] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042d48] 317c 0001 04fc            move.w     #$0001,1276(a0)
[00042d4e] 2079 0010 ee4e            movea.l    ACSblk,a0
[00042d54] 4e75                      rts
main:
[00042d56] 4fef fff6                 lea.l      -10(a7),a7
[00042d5a] 3f40 0008                 move.w     d0,8(a7)
[00042d5e] 2f48 0004                 move.l     a0,4(a7)
[00042d62] 2e89                      move.l     a1,(a7)
[00042d64] 6100 fd0e                 bsr        get_acsblk
[00042d68] 2257                      movea.l    (a7),a1
[00042d6a] 206f 0004                 movea.l    4(a7),a0
[00042d6e] 302f 0008                 move.w     8(a7),d0
[00042d72] 6100 fca4                 bsr        acs_call
[00042d76] 4fef 000a                 lea.l      10(a7),a7
[00042d7a] 4e75                      rts
