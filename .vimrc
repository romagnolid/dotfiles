"Many useful commands were stolen from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#vim-s-feeling
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Badacadabra/vim-archery'
Plugin 'easymotion/vim-easymotion'
Plugin 'qpkorr/vim-bufkill'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'wolverian/minimal'
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme archery

syntax enable
let mapleader = ","
set autoindent
set colorcolumn=100
set cursorline "highlight current line 
set expandtab
set gdefault
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:\|- " show somethingh like '|---'
set noswapfile
set nowrap 
set number "line number
set relativenumber
set ruler
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set undofile

"hilight search
hi Search ctermfg=yellow ctermbg=blue

" cursorline color
hi Cursorline ctermfg=Black ctermbg=Yellow cterm=bold 
" colorcolumn
hi Colorcolumn ctermbg=Yellow

" nerdcommenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" easymotion
hi EasyMotionTarget2First ctermfg=red
hi EasyMotionTarget2Second ctermfg=green

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
noremap <C-n> :NERDTreeToggle<CR>

" shortcuts
nnoremap ; :
noremap <Tab> <C-w>w
noremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader><space> :noh<cr>

nnoremap j gj
nnoremap k gk

inoremap <leader>s <Esc>:w<CR>
nnoremap <leader>s <Esc>:w<CR>
inoremap <leader>q <Esc>:wq<CR>
nnoremap <leader>q <Esc>:wq<CR>

nnoremap <leader>d "_d
nnoremap <leader>x "_x
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

nnoremap / /\v
vnoremap / /\v

" working with windows
noremap <leader>w <c-w>v<c-w>l
noremap <leader>n :bn<cr>
noremap <leader>p :bp<cr>

" highlight words but stays on current word
nnoremap * *N
nnoremap # *n
