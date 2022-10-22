;;;
;;; ENITTY MANAGER
;;;

max_entities == 3 ; putting == means constant
entity_size == 7

_num_entities:: 
    .db 0                               ; reserve a byte 0-valued
_last_elem_ptr:: 
    .dw _entity_array                   ; pointer to last element
_entity_array::
    .ds max_entities * entity_size      ;reserve memory with zeroes


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  GET ENTITY ARRAY IX
;;     Loads in IX register array beginning direction
;;
;;  RETURN
;;      IX : array beginning direction
man_entity_getEntityArray_IX::
    ld ix, #_entity_array
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  GET NUM ENTITIES
;;     Loads in A register number of alive entities
;;
;;  RETURN
;;      A : alive entities
man_entity_getNumEntities_A::
    ld a, (_num_entities)
    ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  CREATE ENTITY
;;     Loads in A register number of alive entities
;;  INPUT
;;      HL : Pointer to entity initializer bytes (template)

man_entity_create::
    ;;Copy entity from template in HL
    ;; memcpy
    ld de, (_last_elem_ptr)
    ld bc, #entity_size
    ldir                     ; coge lo de HL, copia en DE tantos bytes como diga BC

    ;;Increment number of entities
    ;; ++_num_entities
    ld a, (_num_entities)
    inc a
    ld (_num_entities), a

    ;; Set last element pointer to next position 
    ;; last_element_pointer += entity_size
    ld hl, (_last_elem_ptr)
    ld bc, #entity_size
    add hl, bc
    ld (_last_elem_ptr), hl

    ret