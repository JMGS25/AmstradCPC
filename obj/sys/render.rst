ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;;
                              2 ;;; RENDER SYSTEM
                              3 ;;;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              4 .include "cpct_functions.h.s"
                              1 ;;;
                              2 ;;; CPCTELERA FUNCTIONS
                              3 ;;;
                              4 
                              5 .globl cpct_getScreenPtr_asm
                              6 .globl cpct_drawSolidBox_asm
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                              5 .include "man/entity.h.s"
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
                             12 .globl entity_size
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 4.
Hexadecimal [16-Bits]



                              6 
   402B                       7 sys_render_init::
   402B C9            [10]    8     ret
                              9 
                             10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             11 ;;  GET ENTITY ARRAY IX
                             12 ;;     Loads in IX register array beginning direction
                             13 ;;
                             14 ;;  INPUT
                             15 ;;      IX : array beginning direction
                             16 ;;       A : number of entities to render
   402C                      17 sys_render_update::
   402C                      18 _renloop:
   402C F5            [11]   19     push af         ; save number of entities on the stack
                             20 
                             21     ;;Calculate a video-memory location for printing 
   402D 11 00 C0      [10]   22     ld de, #0xC000  ; DE = pointer to start video memory position
   4030 DD 4E 00      [19]   23     ld c, 0(ix)     ; C  = x
   4033 DD 46 01      [19]   24     ld b, 1(ix)     ; B  = y
   4036 CD 3F 41      [17]   25     call cpct_getScreenPtr_asm  ;calculate video memory position in DE
                             26 
                             27     ;;Draw the entity
   4039 EB            [ 4]   28     ex de, hl       ; HL = position
   403A DD 7E 06      [19]   29     ld a, 6(ix)     ; A  = color
   403D DD 4E 02      [19]   30     ld c, 2(ix)     ; C  = width
   4040 DD 46 03      [19]   31     ld b, 3(ix)     ; B  = heigh
   4043 CD 9C 40      [17]   32     call cpct_drawSolidBox_asm  ; draws a solid box
                             33 
   4046 F1            [10]   34     pop af          ; recover number of entities from the stack
                             35 
                             36     ;;Check number of entities
   4047 3D            [ 4]   37     dec a           ; decrements number of entities to draw
   4048 C8            [11]   38     ret z           ; if zero entities exit
                             39 
                             40     ;;Point to next entity 
   4049 01 07 00      [10]   41     ld bc, #entity_size
   404C DD 09         [15]   42     add ix, bc
   404E 18 DC         [12]   43     jr _renloop
                             44 
                             45 
                             46     
