        * = $1000

init:
        ldx #0
        ldy #1
        jmp change

loop:

        lda $d012
        cmp #00
        
        bne loop

        bit $d011       // check 7th bit of A (stored in the negative flag)
        bmi loop        // jump if negative flag is 1

change:

        stx $d020
        sty $d021
        inx
        iny

        jmp loop
        
        rts