        * = $1000

        ldy #00

        // We start ZeroPage pointer at $0400

        lda #$00
        sta $10
        lda #$04
        sta $11

clear_screen:

        lda #$20 // Space
        sta ($10),y

        clc
        
        lda $10
        adc #1
        sta $10

        lda $11
        adc #0
        sta $11

        // We quit the loop once we reached $07E8
        // (screen ends at $07E7)

        lda $11
        cmp #$07
        bne clear_screen

        lda $10
        cmp #$E8
        bne clear_screen

then:
        jmp then