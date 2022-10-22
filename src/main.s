.include "cpctelera.h.s"
.include "man/entity.h.s"
.include "sys/render.h.s"
.include "cpct_functions.h.s"
.area _DATA
.area _CODE

.globl cpct_disableFirmware_asm
player: 
   ;;; x,  y,  w, h,vx, vy, color
   .db 20, 20, 2, 8, 1, 1, 0xF0
enemy:
   .db 40, 80, 3, 12, -1, 0, 0xFF

_main::
   ;;Disable firmware to prevent interfering
   call cpct_disableFirmware_asm

   ;;Init systems
   call sys_render_init

   ld hl, #player    ; hl = direccion de memoria
   call man_entity_create
   ld hl, #enemy
   call man_entity_create

   loop:
      call man_entity_getEntityArray_IX
      call man_entity_getNumEntities_A
      call sys_render_update
      jr loop
