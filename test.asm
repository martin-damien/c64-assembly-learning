        * = $1000

        ldy #00

        // We start ZeroPage pointer at $0400

        lda #$00
        sta $fb
        lda #$04
        sta $fc

clear_screen:

        lda #$20 // Space
        sta ($fb),y

        clc
        
        lda $fb
        adc #1
        sta $fb

        lda $fc
        adc #0
        sta $fc

        // We quit the loop once we reached $07E8
        // (screen ends at $07E7)

        lda $fc
        cmp #$07
        bne clear_screen

        lda $fb
        cmp #$E8
        bne clear_screen

then:
        jmp then