" Vim syntax file
" Language: Flux
" Maintainer: Gianluca Arbezzano
" Latest Revision: 11 July 2019
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword     fluxTodo              contained TODO FIXME XXX BUG
syn cluster     fluxCommentGroup      contains=fluxTodo
syn region      fluxComment           start="//" end="$"  contains=@fluxCommentGroup,@Spell

syn match   fluxKeyword        "builtin"
syn match   fluxKeyword        "empty"
syn match   fluxKeyword        "return"
syn match   fluxKeyword        "package"
syn match   fluxKeyword        "option"
syn match   fluxKeyword        "test"


syn keyword   fluxConditional        if then else

syn keyword     fluxRepeat            for

syn match   fluxImport        "import"

syn region fluxString oneline start=/"/ end=/"/

syn keyword fluxBoolean		true false

syn match       fluxDecimalInt        /\<\d\+\>/
syn match       fluxFloat             /\<\d\+\.\d+\>/

syn match   fluxOperator        "="
syn match   fluxOperator        "=>"
syn match   fluxOperator        /</
syn match   fluxOperator        />/
syn match   fluxOperator        />=/
syn match   fluxOperator        /<=/
syn match   fluxOperator        /!=/
syn match   fluxOperator        /!=/
syn match   fluxOperator        /==/
syn match   fluxOperator        /!\~/
syn match   fluxOperator        /=\~/
syn match   fluxOperator        /+/
syn match   fluxOperator        /-/
syn match   fluxOperator        /*/
syn match   fluxOperator        /%/
syn match   fluxOperator        /\^/
syn match   fluxOperator        /\./

syn match       fluxPipe             /|>/

syn match       fluxFunction          /\w\+(/he=e-1

syn keyword fluxOperator		and or not in exists

hi def link fluxBoolean Boolean
hi def link fluxString String
hi def link fluxKeyword  Keyword
hi def link fluxDecimalInt    Constant
hi def link fluxFloat    Float
hi def link fluxOperator  Operator
hi def link fluxComment  Comment
hi def link fluxImport Include
hi def link fluxTodo Todo
hi def link fluxConditional       Conditional
hi def link fluxRepeat       Repeat

hi def link fluxFunction             Function
hi def link fluxOperator	Operator

hi def link fluxPipe             SpecialChar

" Regions
syn region      goParen             start='(' end=')' transparent
syn region    goBlock             start="{" end="}" transparent fold


let b:current_syntax = "flux"
