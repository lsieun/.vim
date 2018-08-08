set nocompatible
syntax enable
filetype plugin on

set number
set relativenumber
set list

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set foldenable
set foldcolumn=5

colorscheme google

" Disable stupid backup and swap file
" they trigger too many events for file system watchers
set nobackup
set nowritebackup
set noswapfile
set noundofile


if has('win32') || has ('win64')
    let $VIMHOME = $VIM . "/vimfiles"
else
    let $VIMHOME = $HOME . "/.vim"
endif

" abbreviations
silent! source $VIMHOME/abbreviations.vim
