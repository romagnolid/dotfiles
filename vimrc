set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

call vundle#end()            " required
Plugin 'VundleVim/Vundle.vim'
Plugin 'broadinstitute/vim-wdl'
Plugin 'chrisbra/csv.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'itchyny/lightline.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/vimcmdline'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'lervag/vimtex'
Plugin 'machakann/vim-highlightedyank'
Plugin 'mbbill/undotree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'farmergreg/vim-lastplace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'wesQ3/vim-windowswap'
Plugin 'ibab/vim-snakemake'
Plugin 'AndrewRadev/switch.vim'
Plugin 'fxn/vim-monochrome'
Plugin 'robertmeta/nofrils'

filetype plugin indent on    " required
if exists("g:syntax_on")
    syntax enable
endif

set t_Co=256
colorscheme nofrils-dark

au Filetype vim setlocal formatoptions-=o formatoptions+=1nBM
set formatoptions+=r
set nowrapscan "stop search at bottom
set startofline "When 'on' the commands listed below move the cursor to the first non-blank of the line.
set showcmd
set termguicolors
set colorcolumn=80
set cursorline "highlight current line
set hlsearch
set ignorecase
set infercase
set list listchars=tab:\|-"show tab
set noswapfile
set number
set relativenumber
set smartcase "use case if any caps used
set splitbelow "working with windows
set splitright "working with windows
set wildmode=longest,list,full "wildmenu
set expandtab
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4
let mapleader=","
let maplocalleader="\<space>"

" UPPERCASE word
inoremap <silent> <c-u> <esc>viwUea

" Plugin 'AndrewRadev/switch.vim'
let g:switch_mapping = "t"
let g:switch_custom_definitions = 
            \[
            \ [ 'TRUE', 'FALSE' ]
            \ ]

" Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Plugin 'tpope/vim-vinegar'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' "hidden files: toggle with 'gh'

" Plugin 'chrisbra/csv.vim'
let g:csv_autocmd_arrange = 1

" Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 0
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-p> :TmuxNavigatePrevious<cr>
inoremap <silent> <M-h> <esc>:TmuxNavigateLeft<cr>
inoremap <silent> <M-j> <esc>:TmuxNavigateDown<cr>
inoremap <silent> <M-k> <esc>:TmuxNavigateUp<cr>
inoremap <silent> <M-l> <esc>:TmuxNavigateRight<cr>
inoremap <silent> <M-p> <esc>:TmuxNavigatePrevious<cr>

augroup templates
    autocmd!
    autocmd BufNewFile *.R      0r ~/.vim/skeleton.R
    autocmd BufNewFile *.c      0r ~/.vim/skeleton.c
    autocmd BufNewFile *.sh     0r ~/.vim/skeleton.sh
    autocmd BufNewFile *.py     0r ~/.vim/skeleton.py
augroup END

" Plugin 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_confirm=0

" Plugin 'scrooloose/nerdcommenter'
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Plugin 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 400

" Plugin 'jalvesaq/Nvim-R'
augroup nvimr
    autocmd!
    autocmd FileType r,rmd noremap <C-c> :RStop<cr>
augroup END
nnoremap <leader>% <esc>A %>%
inoremap <leader>% <esc>A %>%
let R_args = ['--no-save']
let R_assign_map="--"
let R_hl_term=0 "do not rely on the auto detection of colorout
let R_nvimpager='horizontal'
let R_open_example=0
let R_show_arg_help=0 "don't show R's documentation help in preview window when using ^-X ^-O
let r_indent_align_args=1 "indent to parenthesis

" Plugin 'jalvesaq/vimcmdline'
let cmdline_app = {}
let cmdline_app['sh']     = 'bash'
let cmdline_app['python'] = 'ipython3'
let cmdline_map_send = '<LocalLeader>d'
let cmdline_map_send_and_stay = '<LocalLeader>l'

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
    \ 'colorscheme':'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent', 'totline'],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'subseparator':{ 'left':'|', 'right' : '|'},
    \ 'component': {
    \   'percent': '%3.p%%',
    \   'totline': '%3.L lines',
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'}
    \ }

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

" yank from current point to end of line
nnoremap Y y$
" highlight from current point to end of line
nnoremap V v$
" highlight entire line
vnoremap v V

set pastetoggle=<F5>
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

" help cmdline-editing
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

" unset cursorline when typing and leaving window
augroup CursorSet
    autocmd!
    autocmd InsertLeave,WinEnter * set cul
    autocmd InsertEnter,WinLeave * set nocul
augroup END

" move between buffers
noremap <A-n> :bn<cr>
noremap <A-p> :bp<cr>

" Markdown preview
noremap <C-M> :w!<CR>:w!$TMPDIR/vim-markdown.md<CR>:!pandoc -s -f markdown -t html -o $TMPDIR/vim-markdown.html $TMPDIR/vim-markdown.md<CR>:!google-chrome $TMPDIR/vim-markdown.html > /dev/null 2> /dev/null&<CR><CR

" automatically reload file
augroup Focus
    autocmd FocusGained,BufEnter * :silent! !
augroup END

" save and load folds
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" better menu navigation
augroup HelpMaps
    autocmd!
    autocmd FileType help nnoremap <buffer> <C-[>  <C-t>
augroup END

augroup Leave
    au VimLeave * set guicursor=a:ver25
augroup END
