if exists("b:did_ftplugin_memo")
	finish
endif

let b:did_ftplugin_memo = 1

setlocal commentstring=//%s
setlocal tabstop=2
setlocal softtabstop=0 " tab
setlocal shiftwidth=2 " indent key
setlocal expandtab
setlocal smarttab

augroup memo
  autocmd!
  autocmd CursorHold * lua require'memo'.vt()
augroup end

