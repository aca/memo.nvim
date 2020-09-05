" _underline_
" *bold*
" /italic/
" From https://github.com/jocap/rich.vim
setlocal conceallevel=3
setlocal linebreak
highlight Underline gui=underline
syntax match Underline /\(\(^\|[[:space:](\["']\)_\)\@<=[0-9a-zA-Z\u099-\uFFFF]\(\([^_]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?\(_\($\|[[:space:].,;:?!)\]"']\)\)\@=/
syntax match UnderlineMark /\(^\|[[:space:](\["']\)\@<=_\([0-9a-zA-Z\u099-\uFFFF]\(\([^_]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?_\($\|[[:space:].,;:?!)\]"']\)\)\@=/ conceal
syntax match UnderlineMark /\(\(^\|[[:space:](\["']\)_[0-9a-zA-Z\u099-\uFFFF]\(\([^_]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?\)\@<=_\(\($\|[[:space:].,;:?!)\]"']\)\)\@=/ conceal

highlight Bold gui=bold
syntax match Bold /\(\(^\|[[:space:](\["']\)\*\)\@<=[0-9a-zA-Z\u099-\uFFFF]\(\([^\*]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?\(\*\($\|[[:space:].,;:?!)\]"']\)\)\@=/
syntax match BoldMark /\(^\|[[:space:](\["']\)\@<=\*\([0-9a-zA-Z\u099-\uFFFF]\(\([^\*]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?\*\($\|[[:space:].,;:?!)\]"']\)\)\@=/ conceal
syntax match BoldMark /\(\(^\|[[:space:](\["']\)\*[0-9a-zA-Z\u099-\uFFFF]\(\([^\*]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?\)\@<=\*\(\($\|[[:space:].,;:?!)\]"']\)\)\@=/ conceal

highlight Italic gui=italic
syntax match Italic /\(\(^\|[[:space:](\["']\)\/\)\@<=[0-9a-zA-Z\u099-\uFFFF]\(\([^\/]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?\(\/\($\|[[:space:].,;:?!)\]"']\)\)\@=/
syntax match ItalicMark /\(^\|[[:space:](\["']\)\@<=\/\([0-9a-zA-Z\u099-\uFFFF]\(\([^\/]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?\/\($\|[[:space:].,;:?!)\]"']\)\)\@=/ conceal
syntax match ItalicMark /\(\(^\|[[:space:](\["']\)\/[0-9a-zA-Z\u099-\uFFFF]\(\([^\/]*\)\?[0-9a-zA-Z\u099-\uFFFF]\)\?\)\@<=\/\(\($\|[[:space:].,;:?!)\]"']\)\)\@=/ conceal

" CodeBlock
" From help.vim
syn region helpExample	matchgroup=helpIgnore start=" >$" start="^>$" end="^[^ \t]"me=e-1 end="^<" concealends
hi def link helpExample	String

" TODO
" syntax match todoCheckbox "\[\ \]" conceal cchar=
" syntax match todoCheckbox "\[x\]" conceal cchar=
" hi def link todoCheckbox Todo
" hi Conceal guibg=NONE
