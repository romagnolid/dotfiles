"Many useful commands have been stolen from http://stevelosh.com/blog/2010/09/coming-home-to-vim/#vim-s-feeling
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'broadinstitute/vim-wdl'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'chrisbra/csv.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'itchyny/lightline.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/southernlights'
Plugin 'jalvesaq/vimcmdline'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'lervag/vimtex'
Plugin 'mbbill/undotree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'qpkorr/vim-bufkill'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

let mapleader = ","

if filereadable(expand("$HOME/.vim/bundle/southernlights/colors/southernlights.vim"))
    colorscheme southernlights
endif

set wildmode=longest,list,full "wildmenu
set foldmethod=indent
set foldlevelstart=99

set shiftround "round indent with ^-T and ^-D
set hlsearch "highlight search
set ignorecase
set smartcase "use case if any caps used

set noshowmatch "don't show matching parenthesis

set gdefault "always search global by default

set number "line number
set relativenumber "relative line number

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
nnoremap <leader>r :source $MYVIMRC<cr>
inoremap jj <esc>


" move lines instantly
nnoremap + ddkP
nnoremap - ddp

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
nnoremap <leader>s :w<cr>
inoremap <leader>q <esc>:q<cr>
nnoremap <leader>q :q<cr>

"next tab
nnoremap gy gT

" yank from current point to end of line
nnoremap Y y$
" highlight from current point to end of line
nnoremap V v$
" highlight entire line
vnoremap v V

" vimcmdline
let cmdline_app = {}
let cmdline_app['sh']     = 'bash'
let cmdline_app['python'] = 'ipython3'

" Indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Nvim-R
let R_args = ['--no-save']
let R_nvimpager = 'horizontal'
let R_open_example = 0
let r_indent_align_args = 1
let R_show_arg_help = 0 "don't show R's documentation help in preview window when using ^-X ^-O
let R_args_in_stline = 1 "function arguments displayed in Vim's status line
set <M-->=-
let R_assign_map = "<M-->" "use Alt-<minus> as in RStudio
" nmap <C-m> <Plug>RDSendLine
" vmap <C-m> <Plug>RSendSelection
" nmap <space> <Plug>RSendParagraph

" dplyr pipe
inoremap <leader>% <space>%>%
nnoremap <leader>% A<space>%>%
inoremap <leader>+ <space>+
nnoremap <leader>+ A<space>+

" NERDCOMMENTER
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" vimlatex
let g:vimtex_compiler_latexmk = {'callback' : 0}

" Rainbow-parenthesis
autocmd VimEnter * RainbowParenthesesActivate
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" F-keys
set pastetoggle=<F5>
nnoremap <F2> :FixWhitespace<cr>
nnoremap <F3> :UndotreeToggle<cr>
nnoremap <F4> :RStop<cr>
nnoremap <F6> :RainbowParenthesesToggle<cr>

" vim-tmux-navigator
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" undotree
if !exists('g:undotree_ShortIndicators')
    let g:undotree_ShortIndicators = 0
endif
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

" lightline
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }
