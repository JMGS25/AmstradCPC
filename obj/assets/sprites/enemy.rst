                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module enemy
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _sp_enemy
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
   4080                      44 _sp_enemy:
   4080 00                   45 	.db #0x00	; 0
   4081 00                   46 	.db #0x00	; 0
   4082 00                   47 	.db #0x00	; 0
   4083 00                   48 	.db #0x00	; 0
   4084 00                   49 	.db #0x00	; 0
   4085 00                   50 	.db #0x00	; 0
   4086 00                   51 	.db #0x00	; 0
   4087 00                   52 	.db #0x00	; 0
   4088 10                   53 	.db #0x10	; 16
   4089 30                   54 	.db #0x30	; 48	'0'
   408A 30                   55 	.db #0x30	; 48	'0'
   408B 30                   56 	.db #0x30	; 48	'0'
   408C 30                   57 	.db #0x30	; 48	'0'
   408D 30                   58 	.db #0x30	; 48	'0'
   408E 30                   59 	.db #0x30	; 48	'0'
   408F 20                   60 	.db #0x20	; 32
   4090 10                   61 	.db #0x10	; 16
   4091 30                   62 	.db #0x30	; 48	'0'
   4092 30                   63 	.db #0x30	; 48	'0'
   4093 30                   64 	.db #0x30	; 48	'0'
   4094 30                   65 	.db #0x30	; 48	'0'
   4095 30                   66 	.db #0x30	; 48	'0'
   4096 30                   67 	.db #0x30	; 48	'0'
   4097 20                   68 	.db #0x20	; 32
   4098 10                   69 	.db #0x10	; 16
   4099 30                   70 	.db #0x30	; 48	'0'
   409A 30                   71 	.db #0x30	; 48	'0'
   409B 30                   72 	.db #0x30	; 48	'0'
   409C 30                   73 	.db #0x30	; 48	'0'
   409D 30                   74 	.db #0x30	; 48	'0'
   409E 30                   75 	.db #0x30	; 48	'0'
   409F 20                   76 	.db #0x20	; 32
   40A0 10                   77 	.db #0x10	; 16
   40A1 30                   78 	.db #0x30	; 48	'0'
   40A2 30                   79 	.db #0x30	; 48	'0'
   40A3 30                   80 	.db #0x30	; 48	'0'
   40A4 20                   81 	.db #0x20	; 32
   40A5 00                   82 	.db #0x00	; 0
   40A6 30                   83 	.db #0x30	; 48	'0'
   40A7 20                   84 	.db #0x20	; 32
   40A8 10                   85 	.db #0x10	; 16
   40A9 30                   86 	.db #0x30	; 48	'0'
   40AA 00                   87 	.db #0x00	; 0
   40AB 30                   88 	.db #0x30	; 48	'0'
   40AC 20                   89 	.db #0x20	; 32
   40AD 00                   90 	.db #0x00	; 0
   40AE 30                   91 	.db #0x30	; 48	'0'
   40AF 20                   92 	.db #0x20	; 32
   40B0 10                   93 	.db #0x10	; 16
   40B1 30                   94 	.db #0x30	; 48	'0'
   40B2 00                   95 	.db #0x00	; 0
   40B3 30                   96 	.db #0x30	; 48	'0'
   40B4 20                   97 	.db #0x20	; 32
   40B5 00                   98 	.db #0x00	; 0
   40B6 30                   99 	.db #0x30	; 48	'0'
   40B7 20                  100 	.db #0x20	; 32
   40B8 10                  101 	.db #0x10	; 16
   40B9 30                  102 	.db #0x30	; 48	'0'
   40BA 30                  103 	.db #0x30	; 48	'0'
   40BB 30                  104 	.db #0x30	; 48	'0'
   40BC 30                  105 	.db #0x30	; 48	'0'
   40BD 30                  106 	.db #0x30	; 48	'0'
   40BE 30                  107 	.db #0x30	; 48	'0'
   40BF 20                  108 	.db #0x20	; 32
   40C0 10                  109 	.db #0x10	; 16
   40C1 30                  110 	.db #0x30	; 48	'0'
   40C2 30                  111 	.db #0x30	; 48	'0'
   40C3 30                  112 	.db #0x30	; 48	'0'
   40C4 30                  113 	.db #0x30	; 48	'0'
   40C5 30                  114 	.db #0x30	; 48	'0'
   40C6 30                  115 	.db #0x30	; 48	'0'
   40C7 20                  116 	.db #0x20	; 32
   40C8 10                  117 	.db #0x10	; 16
   40C9 30                  118 	.db #0x30	; 48	'0'
   40CA 30                  119 	.db #0x30	; 48	'0'
   40CB 30                  120 	.db #0x30	; 48	'0'
   40CC 30                  121 	.db #0x30	; 48	'0'
   40CD 30                  122 	.db #0x30	; 48	'0'
   40CE 30                  123 	.db #0x30	; 48	'0'
   40CF 20                  124 	.db #0x20	; 32
   40D0 10                  125 	.db #0x10	; 16
   40D1 20                  126 	.db #0x20	; 32
   40D2 10                  127 	.db #0x10	; 16
   40D3 20                  128 	.db #0x20	; 32
   40D4 10                  129 	.db #0x10	; 16
   40D5 20                  130 	.db #0x20	; 32
   40D6 30                  131 	.db #0x30	; 48	'0'
   40D7 20                  132 	.db #0x20	; 32
   40D8 10                  133 	.db #0x10	; 16
   40D9 30                  134 	.db #0x30	; 48	'0'
   40DA 00                  135 	.db #0x00	; 0
   40DB 00                  136 	.db #0x00	; 0
   40DC 00                  137 	.db #0x00	; 0
   40DD 00                  138 	.db #0x00	; 0
   40DE 30                  139 	.db #0x30	; 48	'0'
   40DF 20                  140 	.db #0x20	; 32
   40E0 10                  141 	.db #0x10	; 16
   40E1 30                  142 	.db #0x30	; 48	'0'
   40E2 30                  143 	.db #0x30	; 48	'0'
   40E3 30                  144 	.db #0x30	; 48	'0'
   40E4 30                  145 	.db #0x30	; 48	'0'
   40E5 30                  146 	.db #0x30	; 48	'0'
   40E6 30                  147 	.db #0x30	; 48	'0'
   40E7 20                  148 	.db #0x20	; 32
   40E8 10                  149 	.db #0x10	; 16
   40E9 30                  150 	.db #0x30	; 48	'0'
   40EA 30                  151 	.db #0x30	; 48	'0'
   40EB 30                  152 	.db #0x30	; 48	'0'
   40EC 30                  153 	.db #0x30	; 48	'0'
   40ED 30                  154 	.db #0x30	; 48	'0'
   40EE 30                  155 	.db #0x30	; 48	'0'
   40EF 20                  156 	.db #0x20	; 32
   40F0 10                  157 	.db #0x10	; 16
   40F1 30                  158 	.db #0x30	; 48	'0'
   40F2 30                  159 	.db #0x30	; 48	'0'
   40F3 30                  160 	.db #0x30	; 48	'0'
   40F4 30                  161 	.db #0x30	; 48	'0'
   40F5 30                  162 	.db #0x30	; 48	'0'
   40F6 30                  163 	.db #0x30	; 48	'0'
   40F7 20                  164 	.db #0x20	; 32
   40F8 00                  165 	.db #0x00	; 0
   40F9 00                  166 	.db #0x00	; 0
   40FA 00                  167 	.db #0x00	; 0
   40FB 00                  168 	.db #0x00	; 0
   40FC 00                  169 	.db #0x00	; 0
   40FD 00                  170 	.db #0x00	; 0
   40FE 00                  171 	.db #0x00	; 0
   40FF 00                  172 	.db #0x00	; 0
                            173 	.area _INITIALIZER
                            174 	.area _CABS (ABS)
