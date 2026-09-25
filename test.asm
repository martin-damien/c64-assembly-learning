        * = $1000

init:
        ldx #0
        ldy #1
        jmp change

loop:

        lda $d012
        cmp #00
        
        bne loop

change:

        stx $d020
        sty $d021
        inx
        iny

        jmp loop
        
        rts