.include "cpctelera.h.s"
.include "man/entity.h.s"
.include "sys/render.h.s"
.include "cpct_functions.h.s"
.area _DATA
.area _CODE

DefineEntity player, 20, 20,  1, 1, 2, 8, 0xF0
DefineEntity enemy,  40, 80, -1, 0, 3, 12, 0xFF

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
