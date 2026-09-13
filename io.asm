.macro readln(target) {
    ldy #00
loop:   
    jsr $ffcf
    sta target,y
    iny
    cmp #$0D
    bne loop        
}

.macro println(text) {
    ldx #00
loop:  
    lda text,x
    beq done
    jsr $ffd2
    inx
    cmp #$0D
    bne loop
done: 
    rts
}