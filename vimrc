set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'broadinstitute/vim-wdl'
Plugin 'chrisbra/csv.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/southernlights'
Plugin 'jalvesaq/vimcmdline'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'lervag/vimtex'
Plugin 'mbbill/undotree'
Plugin 'machakann/vim-highlightedyank'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'yggdroot/indentline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-speeddating'
call vundle#end()            " required

filetype plugin indent on    " required
syntax on
let mapleader = ","

" Parenthesis
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap {<cr> {<cr>}<esc>O
imap <C-f> <Esc>:exec "normal f" . leavechar<CR>a

" Plugin 'yggdroot/indentline'
    let g:indentLine_color_term = "grey"

" Plugin 'jalvesaq/southernlights'
    colorscheme southernlights
    hi Whitespace cterm=none ctermfg=grey
" Plugin 'ntpeters/vim-better-whitespace'
    let g:strip_whitespace_on_save=1
" Plugin 'scrooloose/nerdcommenter'
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
" Plugin 'machakann/vim-highlightedyank'
    let g:highlightedyank_highlight_duration = 400
" Plugin 'jalvesaq/Nvim-R'
    autocmd FileType r noremap <C-c> :RStop<cr>
    let R_args = ['--no-save']
    let R_nvimpager = 'horizontal'
    let R_open_example = 0
    let r_indent_align_args = 1
    let R_show_arg_help = 0 "don't show R's documentation help in preview window when using ^-X ^-O
    let R_args_in_stline = 1 "function arguments displayed in Vim's status line
" Plugin 'jalvesaq/vimcmdline'
    let cmdline_app = {}
    let cmdline_app['sh']     = 'bash'
    let cmdline_app['python'] = 'ipython3'
" Plugin 'lervag/vimtex'
    let g:vimtex_compiler_latexmk = {'callback' : 0}
" Plugin 'mbbill/undotree'
    nnoremap <F3> :UndotreeToggle<cr>
    if !exists('g:undotree_ShortIndicators')
        let g:undotree_ShortIndicators = 0
    endif
    if !exists('g:undotree_SetFocusWhenToggle')
        let g:undotree_SetFocusWhenToggle = 1
    endif
" Plugin 'itchyny/lightline.vim'
    let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'
        \ },
        \ }

nnoremap <leader>r :source $MYVIMRC<cr>
set colorcolumn=80
set cursorline "highlight current line
set foldmethod=indent
set foldlevel=99
set gdefault "always search global by default
set hlsearch
set ignorecase
set list listchars=tab:\|- "show tab
set noswapfile
set number
set relativenumber
set smartcase "use case if any caps used
set splitbelow "working with windows
set splitright "working with windows
set wildmode=longest,list,full "wildmenu

" delete without putting into registers
nnoremap <leader>d "_d
nnoremap <leader>D "_D
nnoremap <leader>x "_x
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

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
set nowrap
nnoremap j gj
nnoremap k gk

" save and exit
inoremap <leader>s <esc>:w<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>q <esc>:q<cr>
nnoremap <leader>q :q<cr>

" yank from current point to end of line
nnoremap Y y$
" highlight from current point to end of line
nnoremap V v$
" highlight entire line
vnoremap v V

inoremap jj <esc>

set pastetoggle=<F2>
