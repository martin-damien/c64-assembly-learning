        * = $1000

.const chrout = $ffd2

        ldx #0

loop:
        lda text,x
        beq done
        jsr chrout
        inx
        bne loop

done:   rts

text:   .text "HELLO WORLD"
        .byte 0
