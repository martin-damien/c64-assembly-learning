//
// Hellorld
//
 
*=$0801
.byte $0c,$08,$b5,$07,$9e,$20,$32,$30,$36,$32,$00,$00,$00
jmp main
 
hellotext:
    .text "hello, commodore 64!!"
    .byte $0
    .const ofs = 10
main:
    ldy #0
    lda #$00
    sta $d020
    sta $d021
    tax
    lda #$20
loop:   
    sta $0400,x
    sta $0500,x
    sta $0600,x
    sta $0700,x
    dex
    bne loop
 
hello:
    lda hellotext,y
    beq !loop+
    sta $400+ofs,y
    lda #1
    sta $d800+ofs,y
    iny
    jmp hello
!loop:
    rts