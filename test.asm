#import "pt16.asm"

        * = $1000

.var    direction = $1100
.var    fcounter = $1101 // Frame counter

        ldy #00

        // We start ZeroPage pointer at $0400

        lda #$00
        sta $fb
        lda #$04
        sta $fc

clear_screen:

        :pt16w($fb, $20)
        :pt16inc($fb, $fc)

        // We quit the loop once we reached $07E8
        // (screen ends at $07E7)

        lda $fc
        cmp #$07
        bne clear_screen

        lda $fb
        cmp #$E8
        bne clear_screen

// end: clear_screen

        // Screen is 40x25 characters
        // If we want to start at first col of mid screen verticaly
        // we should start at 12x40 = 480 = 1e0
        // As screen memory starts at $400, we must start at $400 + $1e0 = $5e0

        lda #$e0
        sta $fb
        lda #$05
        sta $fc

        lda #0
        sta fcounter

        lda #1
        sta direction

bounce:

        // New frame detection

        lda $d012
        cmp #0
        bne bounce

        bit $d011
        bmi bounce

        // Increase frame counter, loop if not 50, or continue and reset counter

        inc fcounter

        lda fcounter
        cmp #25

        bne bounce

        lda #0
        sta fcounter

        // Max addresse for the line is 607

        // @TODO Fixme (wrong character displayed)
        :pt16w($fb, $20) // [space]

        // Make correct operation based on $1100

        lda direction
        cmp #1
        beq add
        bne sub

        add:
                :pt16inc($fb, $fc)

                :pt16w($fb, 0)

                lda $fc
                cmp #$06
                bne bounce

                lda $fb
                cmp #$07
                bne bounce

                lda #-1
                sta direction

                jmp bounce

        sub:
                :pt16dec($fb, $fc)

                :pt16w($fb, 0)

                lda $fc
                cmp #$05
                bne bounce

                lda $fb
                cmp #$e0
                bne bounce

                lda #1
                sta direction

                jmp bounce
