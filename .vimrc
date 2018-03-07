"Many useful commands were stolen from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#vim-s-feeling
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/southernlights'
Plugin 'jalvesaq/vimcmdline'
Plugin 'chrisbra/csv.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" runtime! plugin/sensible.vim

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader = ","
set t_Co=256
colorscheme southernlights

set hlsearch "highlight search
set ignorecase
set smartcase "use case if any caps used

set noshowmatch "don't show matching parenthesis

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
set listchars=tab:\>- " show tab

set showcmd "show command while they are typed

set noswapfile
set nowrap 

set colorcolumn=80
set cursorline "highlight current line 

" shortcuts
noremap <leader>r :source $MYVIMRC<cr>
set pastetoggle=<f5>

" working with windows: open new vertical window and switch to it
noremap <leader>w <c-w>v<c-w>l
noremap <leader>h <c-w>s<c-w>j

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
inoremap <leader>q <esc>:q<cr>
nnoremap <leader>q <esc>:q<cr>

" highlight words but stays on current word
nnoremap * *N
nnoremap # *n

"next tab
nnoremap gy gT

" vimcmdline
let cmdline_app = {}
let cmdline_app['python'] = 'ipython3'

" Indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Nvim-R
let R_in_buffer = 0
let R_tmux_split = 1
let r_indent_align_args = 0
execute "set <M-->=\e-"
let R_assign_map = "<M-->"
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
" autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif
" let R_args = ['--no-save']
" dplyr pipe
inoremap <leader>% <space>%>%
nnoremap <leader>% A<space>%>%

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


