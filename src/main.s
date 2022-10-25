.include "cpctelera.h.s"
;.include "man/entity.h.s"
.include "man/game.h.s"
;.include "sys/render.h.s"
.include "cpct_functions.h.s"

.area _DATA
.area _CODE

;DefineEntity player, 20, 20,  1, 1, 2, 8, 0xF0
;DefineEntity enemy,  40, 80, -1, 0, 3, 12, 0xFF

_main::
   ;;Disable firmware to prevent interfering
   call cpct_disableFirmware_asm

   ;;Init game manager
   call man_game_init

   ;;Loop forever
   loop:
      call man_game_update
      call cpct_waitVSYNC_asm
      call man_game_render
      jr loop



   