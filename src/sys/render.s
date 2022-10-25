;;;
;;; RENDER SYSTEM
;;;
.include "cpct_functions.h.s"
.include "assets/assets.h.s"
.include "cpctelera.h.s"
.include "man/entity.h.s"
.include "cmp/entity.h.s"

.module sys_render_entity

;;==============================================================
;; Render system constants
screen_start = 0xC000

;;==============================================================
;; Render system variables

;;==============================================================
;; Render system public functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  SYS ENTITYRENDER INIT
;;      Inits the render system
;;  DESTROYS: AF, BC, DE, HL
;;

sys_eren_init::
    ld c, #0                        ;; Mode 0
    call cpct_setVideoMode_asm      ;; Set video mode
    ld hl, #_pal_main               ;; hl = palette
    ld de, #16                      ;; de = size of palette
    call cpct_setPalette_asm
    cpctm_setBorder_asm HW_WHITE    ;;set border grey
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  ENTITY RENDER UPDATE
;;      Draws all entity components
;;      Entities are continuous and valid
;;      At least one entity
;;  INPUT
;;      IX : array beginning direction
;;       A : number of entities to render
;;  DESTROYS: AF, HL, BC, DE, IX
;;  Stack use: 2 bytes
sys_eren_update::
    ;;Render entities
    ;;TENDRA QUE LLAMAR A RENDER DE OTRAS COSAS
    call sys_eren_render_entities   ;; render all entities
    ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  ENTITY RENDER UPDATE
;;      Draws all entity components
;;      Entities are continuous and valid
;;      At least one entity
;;  INPUT
;;      IX : array beginning direction
;;       A : number of entities to render
;;  DESTROYS: AF, HL, BC, DE, IX
;;  Stack use: 2 bytes
sys_eren_render_entities::
    ld (_ent_counter), a        ;;save entity in counter number of entities

_update_loop:
    ;;Erase previous instance (draw background pixels)
    ld e, e_lastVP_l(ix)    
    ld d, e_lastVP_h(ix)            ;; de = last video memory position
    xor a                           ;; a = 0 = background
    ld c, e_w(ix)                   ;; c = width
    ld b, e_h(ix)                   ;; b = height
    push bc                         ;; save in stack wh
    call cpct_drawSolidBox_asm      ;; draw the box

    ;;Callculate new video memory pointer
    ld de, #screen_start            ;; de = 0xc0000
    ld c, e_x(ix)                   ;; c = entity.x
    ld b, e_y(ix)                   ;; b = entity.y
    call cpct_getScreenPtr_asm      ;; Hl = memory position 

    ;;Save memory position at pointer to last
    ld e_lastVP_l(ix), l            
    ld e_lastVP_h(ix), h 

    ;;Draw entity sprite
    ex de, hl                       ;; de = memory position
    ld l, e_pspr_l(ix)
    ld h, e_pspr_h(ix)              ;; hl = pointer to sprite
    pop bc                          ;; bc = width and height
    call cpct_drawSprite_asm

    ;;Check if no more entites with self-modifying code
    _ent_counter =  .+1               ;; ent counter  = actual position + 1 ----> modify #0
    ld a, #0                        ;; a = self-modyfing entity counter
    dec a                           ;; a -- 
    ret z                           ;; if a = 0 exit

    ld (_ent_counter), a            ;; counter = a
    ld bc, #sizeof_e                ;; bc = sizeofe
    add ix, bc                      ;; ix points next entity
    jr _update_loop



    