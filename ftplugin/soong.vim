if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin=1

" Use 4 space whitespaces.
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

" Native comment editing support.
setlocal formatoptions+=ro
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s

" NERD Commenter integration.
let s:soong_delimiter_map={
      \ 'soong': {'left': '//', 'leftAlt': '/*', 'rightAlt': '*/'}}
if exists('g:NERDDelimiterMap')
  call extend(g:NERDDelimiterMap, s:soong_delimiter_map)
elseif exists('g:NERDCustomDelimiters')
  call extend(g:NERDCustomDelimiters, s:soong_delimiter_map)
else
  let g:NERDCustomDelimiters=s:soong_delimiter_map
endif
