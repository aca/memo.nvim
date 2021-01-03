
function! MemoFoldText()
  return getline(v:foldstart) . ' [+]'
endfunction

function! MemoFoldExpr()
  let line = getline(v:lnum)
  " if line =~ '^## '
  "   return '>2'
  if line =~ '^# ' || line =~ '^* '
    return '>1'
  else
    return '='
  endif
endfunction

setlocal foldmethod=expr 
setlocal foldtext=MemoFoldText()
setlocal foldexpr=MemoFoldExpr()
