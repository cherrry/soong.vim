if !exists('*maktaba#plugin#Detect')
  finish
endif

call maktaba#plugin#Detect()
if !exists('g:installed_codefmt')
  finish
endif

let s:codefmt = maktaba#plugin#Get('codefmt')
let s:registry = s:codefmt.GetExtensionRegistry()
call s:registry.AddExtension(codefmt#bpfmt#GetFormatter())
