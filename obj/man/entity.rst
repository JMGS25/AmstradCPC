ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;;
                              2 ;;; ENITTY MANAGER
                              3 ;;;
                              4 
                     0003     5 max_entities == 3 ; putting == means constant
                     0007     6 entity_size == 7
                              7 
   4050                       8 _num_entities:: 
   4050 00                    9     .db 0                               ; reserve a byte 0-valued
   4051                      10 _last_elem_ptr:: 
   4051 53 40                11     .dw _entity_array                   ; pointer to last element
   4053                      12 _entity_array::
   4053                      13     .ds max_entities * entity_size      ;reserve memory with zeroes
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
   4075 01 07 00      [10]   47     ld bc, #entity_size
   4078 ED B0         [21]   48     ldir                     ; coge lo de HL, copia en DE tantos bytes como diga BC
                             49 
                             50     ;;Increment number of entities
                             51     ;; ++_num_entities
   407A 3A 50 40      [13]   52     ld a, (_num_entities)
   407D 3C            [ 4]   53     inc a
   407E 32 50 40      [13]   54     ld (_num_entities), a
                             55 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                             56     ;; Set last element pointer to next position 
                             57     ;; last_element_pointer += entity_size
   4081 2A 51 40      [16]   58     ld hl, (_last_elem_ptr)
   4084 01 07 00      [10]   59     ld bc, #entity_size
   4087 09            [11]   60     add hl, bc
   4088 22 51 40      [16]   61     ld (_last_elem_ptr), hl
                             62 
   408B C9            [10]   63     ret
