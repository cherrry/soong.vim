if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin=1

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal formatoptions+=ro
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=//%s

if exists('g:NERDDelimiterMap')
  call extend(g:NERDDelimiterMap, {'soong': {'left': '//', 'leftAlt': '/*', 'rightAlt': '*/'}})
endif
