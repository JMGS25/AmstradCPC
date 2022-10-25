;; Entity DEFINITION MACRO
;; using a macro allows changing order more easily 
.macro DefineCmp_Entity _x, _y, _vx, _vy, _w, _h, _pspr
   .db _x, _y                   ; Position x, y
   .db _vx, _vy                 ; Velocity x, y
   .db _w, _h                   ; Width, height 
   .dw _pspr                    ; pointer to sprite             
   .dw 0xC000                   ; last video memory value (for optimization)(default value) 
.endm

;; Entity_t offsets
e_x = 0
e_y = 1
e_vx = 2
e_vy = 3
e_w = 4
e_h = 5
e_pspr_l = 6
e_pspr_h = 7
e_lastVP_l = 8
e_lastVP_h = 9
sizeof_e = 10


;; Default constrcutor for entity components
.macro DefineCmp_Entity_default
    DefineCmp_Entity 0, 0, 0, 0, 1, 1, 0x0000
.endm