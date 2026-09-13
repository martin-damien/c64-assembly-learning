        * = $1000

        #import "io.asm"

.const  choice = $1100

        lda #'?'
        jsr $ffd2

        :readln(choice)
        
        lda #$0D
        jsr $ffd2
        lda #'>'
        jsr $ffd2

        :println(choice)

        rts
