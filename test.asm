        * = $1000

.const  high = $1210
.const  low  = $1211

        // cut $04ff in two (high and low)

        lda #$04
        sta high
        lda #$ff
        sta low

        // Add 1 to the low part

        lda low
        clc
        adc #01
        sta low

        // Report the carry on high if an overflow happened previously

        lda high
        adc #00
        sta high