call plug#begin('~/.local/share/nvim/site/plugged')
"Completion
Plug 'valloric/youcompleteme'
Plug 'ternjs/tern_for_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Looks
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

"Navigation
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'lokikl/vim-ctrlp-ag'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'

"Manipulation
Plug 'mbbill/undotree'
Plug 'matze/vim-move'
Plug 'reedes/vim-pencil'

"Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"Languages
Plug 'lervag/vimtex'
Plug 'aklt/plantuml-syntax'

call plug#end()

"General
set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set wildmode=longest,list
set cc=80

"Appearance
set number
syntax enable
set background=dark
colorscheme solarized
set showcmd
let g:airline_theme="solarized"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"CtlP
let g:ctrlp_cmd = 'CtrlPMixed'

"vimtex
augroup my_cm_setup
    autocmd!
    autocmd User CmSetup call cm#register_source({
        \ 'name': 'vimtex',
        \ 'priority': 8,
        \ 'scoping': 1,                                                      
        \ 'scopes': ['tex'],
        \ 'abbreviation': 'tex',                                                                                                                                                              
        \ 'cm_refresh_patterns': g:vimtex#re#ncm,
        \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
        \ })
augroup END         

let g:vimtex_complete_recursive_bib = 1

"Commands
command! W :execute ':silent w !sudo tee %' | :edit!

"Keymaps
nmap <C-n> :NERDTreeToggle <CR>
