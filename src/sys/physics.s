;;;
;;; ENTITY PHYSICS MOVEMENTS
;;;     Moves entities according to their velocities
;;;     Takes into account screen borders

.include "cmp/entity.h.s"
.include "man/entity.h.s"
.include "cpctelera.h.s"

.module sys_entity_physics

;;===========================================================
;;  Physics system constants
screen_width    = 80
screen_height   = 200

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  SYS_PHYSICS INIT
;;      Initializes physics system
sys_physics_init::
    ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  SYS_PHYSICS UPDATE
;;      Updates all physics components of entities
;;      Assumes that Entities are contiguous and valid
;;      Assumes there's at leat one entity in the array
;;  INPUT:
;;      IX: pointer to the entity array
;;       A: number of elements in the array
;;  DESTROYS: AF, BC, DE, IX
;;  Stack Use: 2bytes
sys_physics_update::
    ld b, a         ;; b = num entities

    _update_loop:
    
    ;;Update X
    ld a, #screen_width + 1
    sub e_w(ix)                 ;;a = screen_width - spritew 
    ld c,a                      ;;c = max screen_width without touching border

    ld a, e_x(ix)               ;; A = entity.x
    add e_vx(ix)                ;; A = entity.x + entity.vx
    cp c                        ;; c - a === max - new position
    jr nc, invalid_x            ;; if (c-a < 0) invalid

    valid_x: 
        ld e_x(ix), a
        jr endif_x

    invalid_x:                  ;;Fix position by changing velocity sign to bounce in wall
        ld a, e_vx(ix)
        neg                     
        ld e_vx(ix), a          ;; Entity.vx = - Entity.vx

    endif_x:  
        ;;Update Y  
        ld a, #screen_height + 1     
        sub e_h(ix)                 ;;a = screen_height - sprite_h
        ld c,a                      ;;c = max screen_height without touching border

        ld a, e_y(ix)               ;; A = entity.y
        add e_vy(ix)                ;; A = entity.y + entity.vy
        cp c                        ;; c - a === max - new position
        jr nc, invalid_y            ;; if (c-a < 0) invalid

        valid_y:
            ld e_y(ix),a 
            jr endif_y
        
        invalid_y:
            ld a, e_vy(ix)
            neg 
            ld e_vy(ix), a          ;; Entity.vy = - Entity.vy

        endif_y:
            dec b                   ;;entities_left --
            ret z                   ;; if 0 entities_left = end

            ld de, #sizeof_e
            add ix, de              ;; ix points next entity
            jr _update_loop         