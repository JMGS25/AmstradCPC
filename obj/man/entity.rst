ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;;
                              2 ;;; ENITTY MANAGER
                              3 ;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              4 .include "man/entity.h.s"
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
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                     0003     5 max_entities == 3 ; putting == means constant
                              6 
                              7 
   4050                       8 _num_entities:: 
   4050 00                    9     .db 0                               ; reserve a byte 0-valued
   4051                      10 _last_elem_ptr:: 
   4051 53 40                11     .dw _entity_array                   ; pointer to last element
                             12 
   4053                      13 DefineEntityArray _entity_array, max_entities
   0003                       1     _entity_array::
                              2         .rept max_entities
                              3             DefineEntityAnnonimous 0xDE, 0xAD, 0xDE, 0xAD, 0xDE, 0xAD, 0xAA ;;code initial : DEAD DEAD DEAD
                              4         .endm
   0003                       1             DefineEntityAnnonimous 0xDE, 0xAD, 0xDE, 0xAD, 0xDE, 0xAD, 0xAA ;;code initial : DEAD DEAD DEAD
   4053 DE                    1    .db 0xDE 
   4054 AD                    2    .db 0xAD 
   4055 DE                    3    .db 0xDE 
   4056 AD                    4    .db 0xAD
   4057 DE                    5    .db 0xDE 
   4058 AD                    6    .db 0xAD 
   4059 AA                    7    .db 0xAA
   000A                       1             DefineEntityAnnonimous 0xDE, 0xAD, 0xDE, 0xAD, 0xDE, 0xAD, 0xAA ;;code initial : DEAD DEAD DEAD
   405A DE                    1    .db 0xDE 
   405B AD                    2    .db 0xAD 
   405C DE                    3    .db 0xDE 
   405D AD                    4    .db 0xAD
   405E DE                    5    .db 0xDE 
   405F AD                    6    .db 0xAD 
   4060 AA                    7    .db 0xAA
   0011                       1             DefineEntityAnnonimous 0xDE, 0xAD, 0xDE, 0xAD, 0xDE, 0xAD, 0xAA ;;code initial : DEAD DEAD DEAD
   4061 DE                    1    .db 0xDE 
   4062 AD                    2    .db 0xAD 
   4063 DE                    3    .db 0xDE 
   4064 AD                    4    .db 0xAD
   4065 DE                    5    .db 0xDE 
   4066 AD                    6    .db 0xAD 
   4067 AA                    7    .db 0xAA
                             14 
                             15 
                             16 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             17 ;;  GET ENTITY ARRAY IX
                             18 ;;     Loads in IX register array beginning direction
                             19 ;;
                             20 ;;  RETURN
                             21 ;;      IX : array beginning direction
   4068                      22 man_entity_getEntityArray_IX::
   4068 DD 21 53 40   [14]   23     ld ix, #_entity_array
   406C C9            [10]   24     ret
                             25 
                             26 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             27 ;;  GET NUM ENTITIES
                             28 ;;     Loads in A register number of alive entities
                             29 ;;
                             30 ;;  RETURN
                             31 ;;      A : alive entities
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



   406D                      32 man_entity_getNumEntities_A::
   406D 3A 50 40      [13]   33     ld a, (_num_entities)
   4070 C9            [10]   34     ret 
                             35 
                             36 
                             37 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             38 ;;  CREATE ENTITY
                             39 ;;     Loads in A register number of alive entities
                             40 ;;  INPUT
                             41 ;;      HL : Pointer to entity initializer bytes (template)
                             42 
   4071                      43 man_entity_create::
                             44     ;;Copy entity from template in HL
                             45     ;; memcpy
   4071 ED 5B 51 40   [20]   46     ld de, (_last_elem_ptr)
   4075 01 07 00      [10]   47     ld bc, #sizeof_e
   4078 ED B0         [21]   48     ldir                     ; coge lo de HL, copia en DE tantos bytes como diga BC
                             49 
                             50     ;;Increment number of entities
                             51     ;; ++_num_entities
   407A 3A 50 40      [13]   52     ld a, (_num_entities)
   407D 3C            [ 4]   53     inc a
   407E 32 50 40      [13]   54     ld (_num_entities), a
                             55 
                             56     ;; Set last element pointer to next position 
                             57     ;; last_element_pointer += sizeof_e
   4081 2A 51 40      [16]   58     ld hl, (_last_elem_ptr)
   4084 01 07 00      [10]   59     ld bc, #sizeof_e
   4087 09            [11]   60     add hl, bc
   4088 22 51 40      [16]   61     ld (_last_elem_ptr), hl
                             62 
   408B C9            [10]   63     ret
