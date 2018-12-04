set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'felixhummel/setcolors.vim'
Plugin 'broadinstitute/vim-wdl'
Plugin 'chrisbra/csv.vim'
Plugin 'christoomey/vim-tmux-navigator'
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
Plugin 'romagnolid/onedark.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-speeddating'
call vundle#end()            " required

filetype plugin indent on    " required

let mapleader = ","

if exists("g:syntax_on")
    syntax enable
endif

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "15", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark

" Plugin 'chrisbra/csv.vim'
    let g:csv_autocmd_arrange = 1
" Plugin 'christoomey/vim-tmux-navigator'
    let g:tmux_navigator_save_on_switch = 1
    let g:tmux_navigator_disable_when_zoomed = 1
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <M-p> :TmuxNavigatePrevious<cr>

" Plugin 'yggdroot/indentline'
    let g:indentLine_color_term="234"

" Plugin 'jalvesaq/southernlights'
    " colorscheme southernlights
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
    let R_assign=3
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
    if !exists('g:undotree_ShortIndicators')
        let g:undotree_ShortIndicators = 0
    endif
    if !exists('g:undotree_SetFocusWhenToggle')
        let g:undotree_SetFocusWhenToggle = 1
    endif
" Plugin 'itchyny/lightline.vim'
    let g:lightline = {
        \ 'colorscheme':'onedark',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent'],
        \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'subseparator':{ 'left':'|', 'right' : '|'},
        \ 'component': {
        \   'lineinfo': '%3l/%3L:%-2v',
        \ },
        \ 'component_function': {
        \   'gitbranch': 'fugitive#head'}
        \ }

set colorcolumn=80
set cursorline "highlight current line
set foldmethod=indent
set foldlevel=99
set gdefault "always search global by default
set hlsearch
set ignorecase
set list listchars=tab:\|-,eol:$ "show tab
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

" Parenthesis
inoremap ( ()<Esc>:let leavechar=")"<CR>i
inoremap [ []<Esc>:let leavechar="]"<CR>i
inoremap {<cr> {<cr>}<esc>O
imap <C-f> <Esc>:exec "normal f" . leavechar<CR>a

set pastetoggle=<F3>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <F2> :if exists("g:syntax_on") <Bar>
    \     syntax off <Bar>
    \ else <Bar>
    \     syntax enable <Bar>
    \ endif <cr>

" newtr: vim default tree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 20

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>

