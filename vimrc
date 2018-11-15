set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
    " Align line-wise comment delimiters flush left instead of following code indentation
    let g:NERDDefaultAlign = 'left'
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1
Plugin 'machakann/vim-highlightedyank'
    let g:highlightedyank_highlight_duration = 400
Plugin 'broadinstitute/vim-wdl'
Plugin 'jalvesaq/southernlights'
Plugin 'chrisbra/csv.vim'
Plugin 'jalvesaq/Nvim-R'
    let R_args = ['--no-save']
    let R_nvimpager = 'horizontal'
    let R_open_example = 0
    let r_indent_align_args = 1
    let R_show_arg_help = 0 "don't show R's documentation help in preview window when using ^-X ^-O
    let R_args_in_stline = 1 "function arguments displayed in Vim's status line
Plugin 'jalvesaq/vimcmdline'
    let cmdline_app = {}
    let cmdline_app['sh']     = 'bash'
    let cmdline_app['python'] = 'ipython3'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'lervag/vimtex'
    let g:vimtex_compiler_latexmk = {'callback' : 0}
Plugin 'mbbill/undotree'
    if !exists('g:undotree_ShortIndicators')
        let g:undotree_ShortIndicators = 0
    endif
    if !exists('g:undotree_SetFocusWhenToggle')
        let g:undotree_SetFocusWhenToggle = 1
    endif
Plugin 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
    let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'
        \ },
        \ }

call vundle#end()            " required

filetype plugin indent on    " required
syntax on

colorscheme southernlights

let mapleader = ","

nnoremap <leader>r :source $MYVIMRC<cr>
set hlsearch
set wildmode=longest,list,full "wildmenu
set foldmethod=indent
set foldlevelstart=2
set ignorecase
set smartcase "use case if any caps used
set gdefault "always search global by default
set colorcolumn=80
set cursorline "highlight current line
set splitbelow "working with windows
set splitright "working with windows

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
