ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;;
                              2 ;;; ENTITY MANAGER
                              3 ;;;
                              4 
                              5 
                              6 ;;PUBLIC FUNCTIONS
                              7 .globl man_entity_getEntityArray_IX
                              8 .globl man_entity_getNumEntities_A
                              9 .globl man_entity_create
                             10 
                             11 ;; CONSTANTS
                             12 ;.globl entity_size
                             13 
                             14 ;; Entity DEFINITION MACRO
                             15 ;; using a macro allows changing order more easily 
                             16 .macro DefineEntityAnnonimous _x, _y, _vx, _vy, _w, _h, _color
                             17    .db _x 
                             18    .db _y 
                             19    .db _w 
                             20    .db _h
                             21    .db _vx 
                             22    .db _vy 
                             23    .db _color
                             24 .endm
                             25 
                             26 .macro DefineEntity _name, _x, _y, _vx, _vy, _w, _h, _color
                             27     _name::
                             28         DefineEntityAnnonimous _x, _y, _vx, _vy, _w, _h, _color
                             29 .endm
                             30 
                     0000    31 e_x = 0
                     0001    32 e_y = 1
                     0002    33 e_w = 2
                     0003    34 e_h = 3
                     0004    35 e_vx = 4
                     0005    36 e_vy = 5
                     0006    37 e_col = 6
                     0007    38 sizeof_e = 7
                             39 
                             40 
                             41 .macro DefineEntityArray _name, _N
                             42     _name::
                             43         .rept _N
                             44             DefineEntityAnnonimous 0xDE, 0xAD, 0xDE, 0xAD, 0xDE, 0xAD, 0xAA ;;code initial : DEAD DEAD DEAD
                             45         .endm
                             46 .endm
