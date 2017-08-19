
"formatting
" use 4 spaces for tabs
set tabstop=8
set shiftwidth=8

"kde cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set laststatus=2

"visual limit to line length
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

"cursor

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
	\ if v:insertmode == 'i' | 
	\   silent execute '!echo -ne "\e[6 q"' | redraw! |
	\ elseif v:insertmode == 'r' |
	\   silent execute '!echo -ne "\e[4 q"' | redraw! |
	\ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"mappings:
"=========
nnoremap <F3> :!clear<cr>
"compile
nnoremap <F4> :!g++ % -g -std=c++11<cr>
"basic execution
nnoremap <F5> :!./a.out<cr>
"file input/output
nnoremap <F6> :!./a.out < in > out<cr>
"solution done
nnoremap <F7>  :w \| let $prob=expand("%d:t:r") \
		   	\| call inputsave() \| let $nameid=input("ProblemNameProblemID: ")\
			\| call inputrestore()<cr>\
		     	\| :silent exec "!(uva-reset $prob $nameid&) > /tmp/vim_process"\
			\| let $msg=system('cat /tmp/vim_process') \| redraw! \| :e $prob<cr> \| :echo $msg<cr>
 ""\|\| 


set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'itchyny/lightline.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'vhda/verilog_systemverilog.vim'

call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["bundle/ultisnips/snips"]
