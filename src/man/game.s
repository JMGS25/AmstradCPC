.include "cpctelera.h.s"
.include "cmp/entity.h.s"
.include "sys/physics.h.s"
.include "sys/render.h.s"
.include "sys/input.h.s"
.include "man/entity.h.s"
.include "assets/assets.h.s"

.module game_manager
;;===========================================
;; Manager CONFIGURATION CONSTANTS
;;
;;===========================================


;;===========================================
;; Manager MEMBER VARIABLES
ent1: DefineCmp_Entity 0, 0, 1, 2, 4, 16, _sp_mainchar
ent2: DefineCmp_Entity 70, 40, 0xFF, 0xFE, 4, 8, _sp_redball
ent3: DefineCmp_Entity 40, 120, 2, 0xFC, 5, 12, _sp_sword
;;===========================================


;;===========================================
;; Manager PUBLIC FUNCTIONS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MAN GAME INIT
;;  Initializes game manager to be used
;; 
;;  DESTROYS : AF, BC, DE, HL, IX
man_game_init::
    ;;Init entity manager
    call man_entity_init

    ;;Init systems
    call sys_eren_init
    call sys_physics_init
    call sys_input_init

    ;;Init 3 Test entities
    ld hl, #ent1
    call man_entity_create
    ld hl, #ent2
    call man_entity_create
    ld hl, #ent3
    call man_entity_create
    ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MAN GAME UPDATE
;;  Updates 1 game cycle doing everything but rendering
;; 

man_game_update::
    call man_entity_getArray
    call sys_input_update
    call man_entity_getArray
    call sys_physics_update

    ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MAN GAME RENDER
;;  Renders game
;; 

man_game_render::
    call man_entity_getArray
    call sys_eren_update

    ret

