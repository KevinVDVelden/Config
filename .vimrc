" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'sophacles/vim-bundle-mako'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
colorscheme gardener

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set mouse=n

"set nu		"Line numbers
"set cul		"Highlight current line

map - :Explore<cr>
map <c-j> j<c-e>
map <c-k> k<c-y>

imap hj <C-[>
vmap hj <C-[>

map [h :FSHere<cr>
map ]h :FSRight<cr>

map [H :vert rightb sfind %<.h<cr>
map ]H :vert sfind %<.cpp<cr>

map ]w <c-w>l
map [w <c-w>h

map ]t gt
map [t gT

map <c-w>t :tabnew<cr>

map <c-\> :bd<cr>

map as :s#^\([ \t]*\)\([^/]\)#\1//\2#<cr>
map sa :s#^\([ \t]*\)//#\1#<cr>

map <F12><F11> :set fileformats=dos<cr>
map <F11><F12> :set fileformats=dos,unix<cr>

nmap <F5> :make<cr>
imap <F5> <esc>:make<cr>

nmap ;; :make<cr>
nmap ;' :make test<cr>

nmap <C-F5> :make clean<cr>
imap <C-F5> <esc>:make clean<cr>
vmap <C-F5> <esc>:make clean<cr>

nmap <F6> :make test<cr>
imap <F6> <esc>:make test<cr>
vmap <F6> <esc>:make test<cr>

nmap <C-F6> :!ctags -R --c++-kinds=+p --fields=+iaS<cr>
imap <C-F6> <esc>:!ctags -R --c++-kinds=+p --fields=+iaS<cr>
vmap <C-F6> <esc>:!ctags -R --c++-kinds=+p --fields=+iaS<cr>

map <c-n> <c-w><c-w>

set tags=tags;/

set ttyfast
set shell=bash

set scrolloff=5

set statusline=%t%m%h%r%=[%b\ 0x%02B]\ [%l/%L/%p%%@%c]\ [%n]
set laststatus=2
set cmdheight=1

so ~/.vim/vim-repeat/autoload/repeat.vim
so ~/.vim/vim-surround/plugin/surround.vim
so ~/.vim/vim-abolish/plugin/abolish.vim
so ~/.vim/vim-unimpaired/plugin/unimpaired.vim

fu! AutoCorrect()
	source ~/.vim/vim-autocorrect/autocorrect.vim
endfun

fu! Code()
   e %<.cpp
   vert rightb sfind %<.h
endfun

set viminfo='100,f1,<50,s10,h
"
"Folding
set foldmethod=syntax
set foldminlines=4

nnoremap <silent> <cr> @=(foldlevel('.')?'zoj':'j')<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'zo':'l')<CR>

set hidden

source ~/.vim/autoload/pathTweak.vim

set expandtab
set tabstop=4
set shiftwidth=4

set hlsearch

let g:netrw_list_hide='.*\.\(aux\|swp\|glo\|idx\|ind\|tid\|tin\|tms\|toc\|bak\)'

"imap <C-i> \emph{}<left>
"nmap <C-i> vawdi\emph{<ESC>pi}<ESC>
"vmap <C-i> di\emph{<ESC>pi}<ESC>


"Set spell check on in tex files
autocmd bufenter *.tex :set spell

set path+=*/include/

if filereadable( '.viminit' )
   source .viminit
end
