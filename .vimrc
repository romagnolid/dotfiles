"Many useful commands have been stolen from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#vim-s-feeling
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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-speeddating'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/southernlights'
Plugin 'jalvesaq/vimcmdline'
Plugin 'chrisbra/csv.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'lervag/vimtex'
Plugin 'mbbill/undotree'
" Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" set iskeyword-=_ "use underscore as word delimiter
let mapleader = ","
colorscheme southernlights

" autocomplete with tab
inoremap <tab> <c-n>
inoremap <s-tab> <c-p>

" autocomplete parenthesis
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
" ino ' ''<left>
" ino " ""<left>
" ino {<CR> {<CR>}<ESC>O

set shiftround "round indent with ^-T and ^-D
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
set listchars=tab:\>- "show tab

set showcmd "show command while they are typed

set noswapfile
set nowrap

set colorcolumn=80
set cursorline "highlight current line

" working with windows
set splitbelow
set splitright

" undofiles
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undofiles")
    call mkdir($HOME."/.vim/undofiles", "", 0700)
endif
set undodir=~/.vim/undofiles
set undofile

" shortcuts
nnoremap G Gzz
nnoremap <leader>r :source $MYVIMRC<cr>

" move lines instantly
nnoremap - ddp
nnoremap _ ddkP

" delete line above
execute "set <M-d>=\ed"
nnoremap <M-d> kdd

" scroll within wrapped lines
nnoremap j gj
nnoremap k gk

" delete without putting into registers
nnoremap <leader>d "_d
nnoremap <leader>D "_D
nnoremap <leader>x "_x
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" save and exit
inoremap <leader>s <esc>:w<cr>
nnoremap <leader>s <esc>:w<cr>
inoremap <leader>q <esc>:q<cr>
nnoremap <leader>q <esc>:q<cr>

" highlight words but stays on current word
nnoremap * *zz
nnoremap # #zz
nnoremap n nzz
nnoremap N Nzz

"next tab
nnoremap gy gT

" yank from current point to end of line
nnoremap Y y$

" vimcmdline
let cmdline_app = {}
let cmdline_app['sh']     = 'bash'
let cmdline_app['python'] = 'ipython3'

" Indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Nvim-R
let r_indent_align_args = 0
let R_show_arg_help = 0 "don't show R's documentation help in preview window when using ^-X ^-O
let R_args_in_stline = 1 "function arguments displayed in Vim's status line
" let R_nvimpager = "tabnew"
let R_args = ['--no-save']
let R_assign_map = "<M-->" "use Alt-<minus> as in RStudio
execute "set <M-->=\e-"
nmap <C-m> <Plug>RDSendLine
vmap <C-m> <Plug>RSendSelection
nmap <space> <Plug>RSendParagraph

" dplyr pipe
inoremap <leader>% <space>%>%
nnoremap <leader>% A<space>%>%
inoremap <leader>+ <space>+
nnoremap <leader>+ A<space>+

" NERDTREE
nnoremap <C-n> :NERDTreeToggle<CR>
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

" vimlatex
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Rainbow-parenthesis
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" F-keys
nnoremap <F4> :RainbowParenthesesToggle<cr>
set pastetoggle=<F5>
nnoremap <F6> :UndotreeToggle<cr>
