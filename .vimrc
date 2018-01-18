set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
let mapleader = " "
set autoindent
set cursorline "current line highlighting
set expandtab
set hlsearch
set incsearch
set laststatus=2
set list
set listchars=tab:\|- " show somethingh like '|---'
set noswapfile
set nowrap 
set number "line number
set ruler
set shiftwidth=4
set showcmd
set smartindent
set softtabstop=4
set tabstop=4
hi Cursorline ctermbg=White ctermfg=Black cterm=bold "current line colors
nnoremap <leader>d "_d
nnoremap <leader>x "_x
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" easymotion
hi EasyMotionTarget2First ctermfg=red
hi EasyMotionTarget2Second ctermfg=green

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
