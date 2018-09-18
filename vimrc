set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==== plugin manager
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add plugins here
" ==== File tree
Plugin 'scrooloose/nerdtree'

" ==== New File
Plugin 'duggiefresh/vim-easydir'

" ==== Status Line
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" ==== Searching
Plugin 'kien/ctrlp.vim'

" ==== Git

" ==== Folding & Indent - Python
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'

" ==== Completion
Plugin 'Valloric/YouCompleteMe'

" ==== Eclim
" Plugin 'file:///home/liusen/.vim/bundle/eclim/eclim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==== Colors and other basic settings
colorscheme ron
set number
" set relativenumber
" set list
set showcmd
syntax enable
set clipboard=unnamedplus
let mapleader = "\<Space>"
"
" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<cr>

" ==== Powerline
set laststatus=2
set showtabline=2
set noshowmode
set t_Co=256
let g:Powerline_symbols = 'fancy'

" ==== CtrlP
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" ==== SimpleFold
let g:SimpylFold_docstring_preview=1

" ==== YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" ==== Eclim
let g:EclimCompletionMethod = 'omnifunc'



" ==== Auto Toggle Number
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" ==== Manual Toggle Number
" use Ctrl+N to toggle the line number counting method
function! g:ToggleNuMode()
  if &relativenumber == 1
     set number
     set norelativenumber
  else
     set relativenumber
     set nonumber
  endif
endfunction
nnoremap <silent><C-N> :call g:ToggleNuMode()<cr>

" ==== Search
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" ==== Folding
set foldenable
" set foldcolumn=5
" Enable folding with the spacebar
" nnoremap <space> za

" ==== Windows
set splitbelow
set splitright
" split navigations / moving around
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ==== Buffers
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b

" ==== Keep Your Fingers on the Home Row
" *** The Two Hand system ***
inoremap ;a <Esc>
inoremap ;d <Esc>:update<Cr>
inoremap ;f <C-O>:update<Cr>
nnoremap ;f :update<CR>
" *** The Right Hand system ***
inoremap ;l <Esc>
inoremap ;k <Esc>:update<Cr>
inoremap ;j <C-O>:update<Cr>
nnoremap ;j :update<CR>

" ==== Move Lines
" Move line: Normal mode
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
" Move line: Insert mode
inoremap <C-Down> <ESC>:m .+1<CR>==gi
inoremap <C-Up> <ESC>:m .-2<CR>==gi
" Move line: Visual mode
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv


" ==== Disable stupid backup and swap file
" they trigger too many events for file system watchers
set nobackup
set nowritebackup
set noswapfile
set noundofile


" ==== VIMHOME
if has('win32') || has ('win64')
    let $VIMHOME = $VIM . "/vimfiles"
else
    let $VIMHOME = $HOME . "/.vim"
endif

" abbreviations
silent! source $VIMHOME/abbreviations.vim

" ==== Last Modified Date
autocmd BufWritePre,FileWritePre *.py mark s|call LastMod()|'s
fun LastMod()
    " if there are more than 20 lines, set max to 20,
    " otherwise, scan entire file
    if line("$") > 20
        let lastModifiedline = 20
    else
        let lastModifiedline = line("$")
    endif
    exe  "1," . lastModifiedline . "g/Last modified: /s/Last modified:.*/Last modified: " . strftime("%Y-%m-%d %T")
endfun

" ==== Python Run
nnoremap <F5> <Esc>:update<CR>:!clear;echo "$ python %";printf "\n";python %<CR>
