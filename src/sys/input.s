;;;
;;; INPUT SYSTEM
;;;     Read input from keyboard and joysticks and updates controlled entity 

.include "cpctelera.h.s"
.include "man/entity.h.s"
.include "cmp/entity.h.s"
.include "cpct_functions.h.s"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  SYS_INPUT INIT
;;      Initializes input system
sys_input_init::
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  SYS_INPUT UPDATE
;;      Gets keyboard inputs and applies them to keyboard controlled entities
;;      At the moment, assume only entity 0 is controlled and exists
;;  INPUT:
;;      IX: Pointer to entity[0]
;;
;;  DESTROYS: AF, BC, DE, HL, IX
;;Controls:: A (move down), Q(move up), O(move left), P(move right)

sys_input_update::
    ;;Reset velocity
    ld e_vx(ix), #0
    ld e_vy(ix), #0

    ;;Scan keyboard
    call cpct_scanKeyboard_f_asm

    ;;Check for movement keys
    ld hl, #Key_O                   ;; HL holds key "o" value
    call cpct_isKeyPressed_asm      ;; Check if key in HL is pressed
    jr z, O_NotPressed              ;; if z, not pressed

    O_Pressed:
        ld e_vx(ix), #-1            ;; velocity x = -1

    O_NotPressed:
        ld hl, #Key_P                   ;; HL holds key "p" value
        call cpct_isKeyPressed_asm      ;; Check if key in HL is pressed
        jr z, P_NotPressed              ;; if z, not pressed

        P_Pressed:
            ld e_vx(ix), #1             ;; velocity x = 1
        
        P_NotPressed:
            ld hl, #Key_Q                   ;; HL holds key "q" value
            call cpct_isKeyPressed_asm      ;; Check if key in HL is pressed
            jr z, Q_NotPressed              ;; if z, not pressed


            Q_Pressed:
                ld e_vy(ix), #-2                ;; velocity y = -2

            Q_NotPressed:
                ld hl, #Key_A                   ;; HL holds key "a" value
                call cpct_isKeyPressed_asm      ;; Check if key in HL is pressed
                jr z, A_NotPressed              ;; if z, not pressed

                A_Pressed:
                    ld e_vy(ix), #2             ;; velocity y = 2  

                A_NotPressed:
                    ret