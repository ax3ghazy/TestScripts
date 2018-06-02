"PLUGINS:
execute pathogen#infect()

"Formatting:
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set nowrap
set colorcolumn=80

let g:gruvbox_italic=1
set background=dark    " Setting dark mode
colorscheme gruvbox

"Line_Numbering:
set number
"tab
set tabstop=4
set shiftwidth=4

"color and syntax
set t_Co=256
syntax on
filetype plugin indent on
set ttimeoutlen=50
""COMMANDS:""
command DelTrail :%s/\s\+$//e

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

""PLUGINS:""
let g:SuperTabDefaultCompletionType = 'context'

"tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/xrexeon/.vimundo/

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Mappings:
"=========
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

nnoremap <F3> :!clear<cr>
"c++ compile
nnoremap <F4> :w<CR> :!g++ % -o %<.x -Wall -Wextra 2>errors.err; cat errors.err<CR>

"debugging 
nnoremap <F5> :copen \| cfile errors.err<CR>
nnoremap <Leader>n :cn<cr>
nnoremap <Leader>p :cp<cr>

"basic execution
nnoremap <F6> :!./%<.x<cr>
"file input/output
nnoremap <F7> :!./%<.x < in > out<cr>
"bullshit ahead:
"solution done
"nnoremap <F7>  :w \| let $prob=expand("%d:t:r") \
"			\| call inputsave() \| let $nameid=input("ProblemNameProblemID: ")\
"			\| call inputrestore()<cr>\
"			\| :silent exec "!(uva-reset $prob $nameid&) > /tmp/vim_process"\
"			\| let $msg=system('cat /tmp/vim_process') \| redraw! \| :e $prob<cr> \| :echo $msg<cr>
""\|\|
nnoremap <F8> :UndotreeToggle<CR>
nnoremap <F8> :UndotreeToggle<CR>

