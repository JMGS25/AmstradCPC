ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 ;;;
                              2 ;;; COMPONENT ARRAY DATA STRUCTURE
                              3 ;;;
                              4 
                              5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                              6 ;;  Generate data strcuture and array of type-T components 
                              7 ;;  Macro to generate all the data strcuture required to manage an array of 
                              8 ;;  components of the same type
                              9 ;;  It generates these labels:
                             10 ;;      T_num   : a byte to count the number of elements in the array
                             11 ;;      T_Plast : a word to store a pointer to the end of the array
                             12 ;;          this will also be the first free element in the array
                             13 ;;      T_array : the array itself
                             14 ;;  INPUTS:
                             15 ;;      _Tname_ : name of the component type
                             16 ;;      _N      : Size of the array in number of components
                             17 ;;      _DefineTypeMacroDefault : Macro to be called to generate a default
                             18 ;;
                             19 
                             20 
                             21 ;;;;;; OJO _Tname = _entities en nuestro caso, la comilla significa concatenar
                             22 .macro DefineComponentArrayStructure _Tname, _N, _DefineTypeMacroDefault
                             23     _Tname'_num:           .db 0                ;;number of defined entities
                             24     _Tname'_pend:          .dw _Tname'_array    ;;Pointer to the end of the array (default start of array)
                             25     _Tname'_array:                              ;;Array of elements 
                             26     .rept _N
                             27         _DefineTypeMacroDefault                 ;;Call default constructor _N times
                             28     .endm
                             29 .endm
                             30 
                             31 ;;; THE SAME BUT GENERATES WITH ZEROES
                             32 ;;; Uses _ComponentSize: bytes of one T-component
                             33 .macro DefineComponentArrayStructure_Size _Tname, _N, _ComponentSize
                             34     _Tname'_num:           .db 0                ;;number of defined entities
                             35     _Tname'_pend:          .dw _Tname'_array    ;;Pointer to the end of the array
                             36     _Tname'_array:                              ;;Array of elements 
                             37         .ds _N * _ComponentSize 
                             38 .endm
                             39         
