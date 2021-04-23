" Codefmt integration: register bpfmt.

try
  let s:codefmt = maktaba#plugin#Get('codefmt')
  let s:registry = s:codefmt.GetExtensionRegistry()
  call s:registry.AddExtension(soong#bpfmt#GetFormatter())
catch
endtry
