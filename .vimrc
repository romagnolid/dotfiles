"Many useful commands were stolen from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#vim-s-feeling
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/mayansmoke'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/southernlights'
call vundle#end()            " required
filetype plugin indent on    " required

" runtime! plugin/sensible.vim

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Nvim-R
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif
let R_args = ['--no-save']
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1

" NERDTREE
noremap <C-n> :NERDTreeToggle<CR>
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCOMMENTER
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

let mapleader = ","
set t_Co=256
colorscheme southernlights

set hlsearch "highlight search
set ignorecase
set smartcase "use case if any caps used

set showmatch "show matching parenthesis

set gdefault "always search global by default

set number "line number
set relativenumber "relative line number
set ruler

set smartindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

set list
set listchars=tab:\|- " show somethingh like '|---'

set showcmd "show command while they are typed

set noswapfile
set nowrap 

set colorcolumn=80
set cursorline "highlight current line 

" shortcuts
noremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
set pastetoggle=<f5>

" working with windows: open new vertical window and switch to it
noremap <leader>w <c-w>v<c-w>l

" undofiles
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undofiles")
    call mkdir($HOME."/.vim/undofiles", "", 0700)
endif
set undodir=~/.vim/undofiles
set undofile

" scroll within wrapped lines
nnoremap j gj
nnoremap k gk

" delete without putting into registers
nnoremap <leader>d "_d
nnoremap <leader>x "_x
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" save and exit
inoremap <leader>s <esc>:w<cr>
nnoremap <leader>s <esc>:w<cr>
inoremap <leader>q <esc>:wq<cr>
nnoremap <leader>q <esc>:wq<cr>

" highlight words but stays on current word
nnoremap * *N
nnoremap # *n

