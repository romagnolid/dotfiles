set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'broadinstitute/vim-wdl'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'chrisbra/csv.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

let mapleader = ","

set wildmode=longest,list,full "wildmenu
set foldmethod=indent
set foldlevelstart=99

set ignorecase
set smartcase "use case if any caps used
set noshowmatch "don't show matching parenthesis
set gdefault "always search global by default
" working with windows
set splitbelow
set splitright
nnoremap <leader>r :source $MYVIMRC<cr>
" scroll within wrapped lines
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
