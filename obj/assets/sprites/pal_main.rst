                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module pal_main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _pal_main
                             12 ;--------------------------------------------------------
                             13 ; special function registers
                             14 ;--------------------------------------------------------
                             15 ;--------------------------------------------------------
                             16 ; ram data
                             17 ;--------------------------------------------------------
                             18 	.area _DATA
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _INITIALIZED
                             23 ;--------------------------------------------------------
                             24 ; absolute external ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DABS (ABS)
                             27 ;--------------------------------------------------------
                             28 ; global & static initialisations
                             29 ;--------------------------------------------------------
                             30 	.area _HOME
                             31 	.area _GSINIT
                             32 	.area _GSFINAL
                             33 	.area _GSINIT
                             34 ;--------------------------------------------------------
                             35 ; Home
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _HOME
                             39 ;--------------------------------------------------------
                             40 ; code
                             41 ;--------------------------------------------------------
                             42 	.area _CODE
                             43 	.area _CODE
   4180                      44 _pal_main:
   4180 54                   45 	.db #0x54	; 84	'T'
   4181 44                   46 	.db #0x44	; 68	'D'
   4182 55                   47 	.db #0x55	; 85	'U'
   4183 5C                   48 	.db #0x5c	; 92
   4184 4C                   49 	.db #0x4c	; 76	'L'
   4185 56                   50 	.db #0x56	; 86	'V'
   4186 57                   51 	.db #0x57	; 87	'W'
   4187 5E                   52 	.db #0x5e	; 94
   4188 40                   53 	.db #0x40	; 64
   4189 4E                   54 	.db #0x4e	; 78	'N'
   418A 47                   55 	.db #0x47	; 71	'G'
   418B 52                   56 	.db #0x52	; 82	'R'
   418C 53                   57 	.db #0x53	; 83	'S'
   418D 4A                   58 	.db #0x4a	; 74	'J'
   418E 43                   59 	.db #0x43	; 67	'C'
   418F 4B                   60 	.db #0x4b	; 75	'K'
                             61 	.area _INITIALIZER
                             62 	.area _CABS (ABS)
