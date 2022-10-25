ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;; Entity DEFINITION MACRO
                              2 ;; using a macro allows changing order more easily 
                              3 .macro DefineCmp_Entity _x, _y, _vx, _vy, _w, _h, _pspr
                              4    .db _x, _y                   ; Position x, y
                              5    .db _vx, _vy                 ; Velocity x, y
                              6    .db _w, _h                   ; Width, height 
                              7    .dw _pspr                    ; pointer to sprite             
                              8    .dw 0xC000                   ; last video memory value (for optimization)(default value) 
                              9 .endm
                             10 
                             11 ;; Entity_t offsets
                     0000    12 e_x = 0
                     0001    13 e_y = 1
                     0002    14 e_vx = 2
                     0003    15 e_vy = 3
                     0004    16 e_w = 4
                     0005    17 e_h = 5
                     0006    18 e_pspr_l = 6
                     0007    19 e_pspr_h = 7
                     0008    20 e_lastVP_l = 8
                     0009    21 e_lastVP_h = 9
                     000A    22 sizeof_e = 10
                             23 
                             24 
                             25 ;; Default constrcutor for entity components
                             26 .macro DefineCmp_Entity_default
                             27     DefineCmp_Entity 0, 0, 0, 0, 1, 1, 0x0000
                             28 .endm
