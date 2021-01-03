if exists("b:current_syntax")
  finish
endif

" URL
syntax match HTTP "https://\S*\|http://\S*"
hi link HTTP Comment

" CodeBlock(by indent)
syn region indent1 start="^    " end="$" oneline contains=HTTP,CommentLine
hi link indent1	Comment

" Title
highlight Bold gui=bold,underline,italic
syn region Bold start="^#"  end="$"

" comment
syn region CommentLine start="//" end="$" contains=indent1,indent2
hi def link CommentLine Comment
