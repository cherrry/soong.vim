if version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif
let b:current_syntax='soong'

syn keyword SoongTodo TODO FIXME contained
syn match SoongComment '//.*' contains=SoongTodo
syn region SoongComment start='/\*' end='\*/' contains=SoongTodo

syn cluster SoongValue contains=SoongBool,SoongString,SoongList,SoongDict
syn keyword SoongBool true false
syn match SoongSpecial '\\\(x\x\+\|\o\{1,3}\|.\|$\)' contained
syn region SoongString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=SoongSpecial
syn region SoongList start=/\[/ end=/]/ transparent contains=@SoongValue,SoongComment
syn region SoongDict start=/{/ end=/}/ transparent contains=SoongDictKey,SoongComment
syn match SoongDictKey /\zs\w\+\ze\s*:/ skipwhite nextgroup=SoongDictValue
syn match SoongDictValue ":" skipwhite nextgroup=@SoongValue

syn match SoongVariable /\zs\w\+\ze\s*=/ skipwhite nextgroup=SoongAssignment
syn match SoongAssignment '=' skipwhite nextgroup=@SoongValue

syn match SoongModuleKey /\zs\w\+\ze\s*{/ skipwhite nextgroup=SoongDict

hi def link SoongTodo Todo
hi def link SoongComment Comment

hi def link SoongBool Boolean
hi def link SoongSpecial SpecialChar
hi def link SoongString String

hi def link SoongModuleKey Label
hi def link SoongVariable Normal
hi def link SoongDictKey Normal
