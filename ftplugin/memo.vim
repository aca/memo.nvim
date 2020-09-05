if exists("b:did_ftplugin")
	finish
endif

let b:did_ftplugin = 1

" FOLD
function! CustomFoldText()
  return getline(v:foldstart) . " "
endfunction
set foldmethod=expr
set foldtext=CustomFoldText()
set foldexpr=getline(v\:lnum+1)=~'.*===='?'>1'\:'='

" augroup memo
augroup memo
  autocmd!
  autocmd CursorHold   * lua require'memo'.vt()
  " autocmd CursorMoved  * lua require'memo'.vt()
augroup end
