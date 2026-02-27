call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'jacoborus/tender.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'junegunn/vim-peekaboo'
Plug 'jiangmiao/auto-pairs'
Plug 'jalvesaq/Vim-R'
call plug#end()

let mapleader=","
let maplocalleader="\<space>"
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $HOME/.vimrc<cr>

colorscheme tender

set softtabstop=4 tabstop=4 shiftwidth=4
" yank from current point to end of line
nnoremap Y y$
" highlight from current point to end of line
nnoremap V v$
" highlight entire line
vnoremap v V

" Plugin 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 400

" better menu navigation
augroup HelpMaps
    autocmd!
    autocmd FileType help nnoremap <buffer> <C-[>  <C-t>
augroup END

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undofiles")
    call mkdir($HOME."/.vim/undofiles", "", 0700)
endif
set undodir=~/.vim/undofiles
set undofile

"Plug 'jalvesaq/Vim-R'
let R_assign_map = "--"

" Skeletons
augroup templates
    autocmd!
    autocmd BufNewFile *.R      0r ~/.dotfiles/vim/skeletons/skeleton.R
    autocmd BufNewFile *.sh     0r ~/.dotfiles/vim/skeletons/skeleton.sh
    autocmd BufNewFile *.py     0r ~/.dotfiles/vim/skeletons/skeleton.py
augroup END
