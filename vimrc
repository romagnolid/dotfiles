set nocompatible              " be iMproved, required
filetype off                  " required

"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'broadinstitute/vim-wdl'
Plugin 'chrisbra/csv.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jacoborus/tender.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'machakann/vim-highlightedyank'
Plugin 'mbbill/undotree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/AfterColors.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
Plugin 'jiangmiao/auto-pairs'
Plugin 'https://github.com/snakemake/snakemake.git', {'rtp': 'misc/vim/'}
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
call vundle#end()            " required

filetype plugin indent on    " required

set t_Co=256
colorscheme tender

let mapleader=","
let maplocalleader="\<space>"

set formatoptions+=r
set list listchars=tab:\|-"show tab
set nowrapscan "stop search at bottom
set splitbelow "working with windows
set splitright "working with windows
set showcmd
set number
set relativenumber
set wildmode=longest,list,full "wildmenu
set expandtab
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4
set smartcase
set ignorecase

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>

" yank from current point to end of line
nnoremap Y y$
" highlight from current point to end of line
nnoremap V v$
" highlight entire line
vnoremap v V

" scroll within wrapped lines
set nowrap
nnoremap j gj
nnoremap k gk

" undofiles
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undofiles")
    call mkdir($HOME."/.vim/undofiles", "", 0700)
endif
set undodir=~/.vim/undofiles
set undofile

" unset cursorline when typing and leaving window
set cul
augroup CursorSet
    autocmd!
    autocmd InsertLeave,WinEnter * set cul
    autocmd InsertEnter,WinLeave * set nocul
augroup END

" save and load folds
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" Plugin 'chrisbra/csv.vim'
let g:csv_autocmd_arrange = 1

" Plugin 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 400

augroup templates
    autocmd!
    autocmd BufNewFile *.R      0r ~/.vim/skeleton.R
    autocmd BufNewFile *.sh     0r ~/.vim/skeleton.sh
    autocmd BufNewFile *.py     0r ~/.vim/skeleton.py
augroup END

" Plugin 'jalvesaq/Nvim-R'

augroup nvimr
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd FileType r,rmd noremap <C-c> :RStop<cr>
augroup END
nnoremap <leader>% <esc>A %>%<space>
inoremap <leader>% <space>%>%<space>
nnoremap <leader>> <esc>A %<>%<space>
inoremap <leader>> <space>%<>%<space>
" nnoremap <silent> <LocalLeader>c :call RAction("class")<CR>
" nnoremap <silent> <LocalLeader>h :call RAction("head")<CR>
" nnoremap <silent> <LocalLeader>t :call RAction("table", ", useNA='ifany'")<CR>

" nnoremap <silent> <LocalLeader>s :call RAction("summary")<CR>
let R_assign_map = "--"
let R_hl_term = 0 "do not rely on the auto detection of colorout
let R_rconsole_width = winwidth(0) / 2 "split evenly
let R_show_arg_help = 0 "don't show R's documentation help in preview window when using ^-X ^-O
let R_show_arg = 0 "don't show R's documentation help in preview window when using ^-X ^-O
let r_indent_align_args = 1 "indent to parenthesis
let R_nvimpager='horizontal'

" Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 0
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
inoremap <silent> <M-h> <esc>:TmuxNavigateLeft<cr>
inoremap <silent> <M-j> <esc>:TmuxNavigateDown<cr>
inoremap <silent> <M-k> <esc>:TmuxNavigateUp<cr>
inoremap <silent> <M-l> <esc>:TmuxNavigateRight<cr>

" Plugin 'chrisbra/csv.vim'
let g:csv_autocmd_arrange = 1

" Plugin 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1

" Plugin 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<cr>
if !exists('g:undotree_ShortIndicators')
    let g:undotree_ShortIndicators = 0
endif
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

" Plugin 'AndrewRadev/switch.vim'
let g:switch_mapping = "t"
let g:switch_custom_definitions =
            \[
            \ [ 'TRUE', 'FALSE' ],
            \ [ '==', '!=' ],
            \ [ '&', '|' ]
            \ ]

" better menu navigation
augroup HelpMaps
    autocmd!
    autocmd FileType help nnoremap <buffer> <C-[>  <C-t>
augroup END

" help cmdline-editing
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>

" Plugin 'lervag/vimtex'
let g:tex_flavor = 'latex'

"Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<Tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"
