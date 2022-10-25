;;;
;;; ENITTY MANAGER
;;;
.include "man/entity.h.s"
.include "cpctelera.h.s"
.include "cmp/array_structure.h.s"
.include "cmp/entity.h.s"

.module entity_manager
max_entities == 3 ; putting == means constant



;;===========================================================================
;;  Manager Member variables

;; -----------------Entity components-------------------
DefineComponentArrayStructure _entity, max_entities, DefineCmp_Entity_default

;;===========================================================================
;;===========================================================================
;;  Manager Public functions

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  MAN GET ARRAY
;;      Loads in A register number of alive entities
;;      Loads in IX register array beginning direction
;;
;;  RETURN
;;      A : alive entities
;;      IX: pointer to the entity array
man_entity_getArray::
    ld ix, #_entity_array   ;; IX = pointer to the entity array
    ld a, (_entity_num)   ;; A  = number of entities
    ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  MAN ENTITY INIT
;;     Set up everything with 0 entities and ready to create new ones
;;     Using it makes able to re-game 
;;  
;;  DESTROYS:  AH, HL
man_entity_init::
    xor a                       ;; a = 0
    ld  (_entity_num), a        ;; value num_entities = 0

    ld hl, #_entity_array       ;; hl = pointer to first
    ld (_entity_pend), hl        ;; pointer to last = pointer to first

    ret
    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  MAN ENTITY NEW
;; ------------------------------------------------------------
;;      Adds new component to the array without initializing
;;  INPUT:
;;      HL: Pointer to initializer values for the entity to be created
;;  DESTROYS:  F, BC, HL, DE
;;  RETURN:
;;      DE: points to added element
;;      BC: size of entity
man_entity_new::
    ;; Num entities + 1
    ld hl, #_entity_num
    inc (hl)

    ;;Increment array next pointer to the next
    ld hl, (_entity_pend)       ; hl = pointer to last
    ld d, h                     ; de = hl  (1)
    ld e, l                     ; de = hl  (2)
    ld bc, #sizeof_e            
    add hl, bc                  ; hl = pointer to last + sizeofentity
    ld (_entity_pend), hl       ; pointer to last  += sizeofentity

    ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  MAN ENTITY CREATE
;; ------------------------------------------------------------
;;      Creates and initializes new entity
;;      Return a pointer to newly created entity in IX
;;  INPUT:
;;      HL: Pointer to initializer values for the entity to be created
;;  DESTROYS:  F, BC, HL, DE
;;  STACK USE: 2 bytes
;;  RETURN:
;;      IX: Pointer to the entity created
man_entity_create::
    push hl                     ;; save pointer to the initialization
    call man_entity_new         ;; add new entity on vector (not initialized) return DE added elemtn

    ;; ix = de
    ld__ixh_d                   ;; I = D (Undocummented opcode)
    ld__ixl_e                   ;; X = E  (Undocummented opcode) 

    ;; Copy initialization values to new entity
    ;; DE points the new added entity
    ;; BC holds size of entity
    ;; HL pointer to inizialization 
    pop hl
    ldir                        ;; copy from hl to de the amount of bc

    ret