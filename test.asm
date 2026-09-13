        * = $1000

.const choice = $1100

.const chrout = $ffd2
.const chrin = $ffcf

        ldx #00
        ldy #00

        lda #'?'
        jsr chrout

read:   jsr chrin
        sta choice,y
        iny
        cmp #$0D
        bne read
        
        lda #$0D
        jsr chrout
        lda #'>'
        jsr chrout

print:  
        lda choice,x
        beq done
        jsr chrout
        inx
        cmp #$0D
        bne print

done:   rts
