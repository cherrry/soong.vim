if !exists('*maktaba#plugin#Detect')
  finish
endif

call maktaba#plugin#Detect()
if !exists('g:installed_codefmt')
  finish
endif

function! codefmt#bpfmt#GetFormatter() abort
  let l:formatter = {'name': 'bpfmt'}

  function l:formatter.IsAvailable() abort
    return executable('bpfmt')
  endfunction

  function l:formatter.AppliesToBuffer() abort
    return &filetype is# 'soong'
  endfunction

  function l:formatter.Format() abort
    call codefmt#formatterhelpers#Format(['bpfmt', '-o'])
  endfunction

  return l:formatter
endfunction
