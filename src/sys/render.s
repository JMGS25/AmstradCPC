;;;
;;; RENDER SYSTEM
;;;
.include "cpct_functions.h.s"
.include "man/entity.h.s"

sys_render_init::
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  GET ENTITY ARRAY IX
;;     Loads in IX register array beginning direction
;;
;;  INPUT
;;      IX : array beginning direction
;;       A : number of entities to render
sys_render_update::
_renloop:
    push af         ; save number of entities on the stack

    ;;Calculate a video-memory location for printing 
    ld de, #0xC000      ; DE = pointer to start video memory position
    ld c, e_x(ix)       ; C  = x
    ld b, e_y(ix)       ; B  = y
    call cpct_getScreenPtr_asm  ;calculate video memory position in DE

    ;;Draw the entity
    ex de, hl           ; HL = position
    ld a, e_col(ix)     ; A  = color
    ld c, e_w(ix)       ; C  = width
    ld b, e_h(ix)       ; B  = heigh
    call cpct_drawSolidBox_asm  ; draws a solid box

    pop af              ; recover number of entities from the stack

    ;;Check number of entities
    dec a               ; decrements number of entities to draw
    ret z               ; if zero entities exit

    ;;Point to next entity 
    ld bc, #sizeof_e
    add ix, bc
    jr _renloop


    