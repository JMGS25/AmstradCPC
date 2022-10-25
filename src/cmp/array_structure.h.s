;;;
;;; COMPONENT ARRAY DATA STRUCTURE
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Generate data strcuture and array of type-T components 
;;  Macro to generate all the data strcuture required to manage an array of 
;;  components of the same type
;;  It generates these labels:
;;      T_num   : a byte to count the number of elements in the array
;;      T_Plast : a word to store a pointer to the end of the array
;;          this will also be the first free element in the array
;;      T_array : the array itself
;;  INPUTS:
;;      _Tname_ : name of the component type
;;      _N      : Size of the array in number of components
;;      _DefineTypeMacroDefault : Macro to be called to generate a default
;;


;;;;;; OJO _Tname = _entities en nuestro caso, la comilla significa concatenar
.macro DefineComponentArrayStructure _Tname, _N, _DefineTypeMacroDefault
    _Tname'_num:           .db 0                ;;number of defined entities
    _Tname'_pend:          .dw _Tname'_array    ;;Pointer to the end of the array (default start of array)
    _Tname'_array:                              ;;Array of elements 
    .rept _N
        _DefineTypeMacroDefault                 ;;Call default constructor _N times
    .endm
.endm

;;; THE SAME BUT GENERATES WITH ZEROES
;;; Uses _ComponentSize: bytes of one T-component
.macro DefineComponentArrayStructure_Size _Tname, _N, _ComponentSize
    _Tname'_num:           .db 0                ;;number of defined entities
    _Tname'_pend:          .dw _Tname'_array    ;;Pointer to the end of the array
    _Tname'_array:                              ;;Array of elements 
        .ds _N * _ComponentSize 
.endm
        