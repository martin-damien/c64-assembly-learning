        * = $1000
.const  delay = $1200

init:
        lda #00
        sta delay
        ldx #00
        ldy #01
        jmp change_colors

wait_raster:
        lda $d012
        cmp #00
        
        bne wait_raster

        bit $d011       // check 7th bit of A (stored in the negative flag)
        bmi wait_raster // jump if negative flag is 1     

change_colors:
        inc delay
        lda delay
        cmp #50
        
        bne wait_raster

        // Reset delay
        lda #0
        sta delay

        stx $d020
        sty $d021
        inx
        iny

        jmp wait_raster