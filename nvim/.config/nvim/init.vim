call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'lervag/vimtex'
Plug 'matze/vim-move'
Plug 'fisadev/vim-ctrlp-cmdpalette'
call plug#end()

set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set cc=80

syntax enable
set background=dark
colorscheme solarized

let g:airline_theme="solarized"
let g:airline_powerline_fonts = 1
