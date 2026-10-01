// Some reccurent operations on 16 bits pointers

.macro pt16inc(low, high) {
    clc
    
    lda low
    adc #1
    sta low

    lda high
    adc #0
    sta high
}

.macro pt16dec(low, high) {
    sec

    lda low
    sbc #1
    sta low

    lda high
    sbc #0
    sta high
}

.macro pt16w(low, val) {
    lda #val
    sta (low),y
}