set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add plugins here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = "\<Space>"
set showcmd
set clipboard=unnamed

" Plugin variable
let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
" powerline config
set laststatus=2
set showtabline=2
set noshowmode
set t_Co=256
let g:Powerline_symbols = 'fancy'
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

syntax enable

set number
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
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
" set list

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
" set foldcolumn=5

set splitbelow
set splitright

" Buffer
nnoremap gp :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>
nnoremap gb :ls<CR>:b

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

" Move line: Normal mode
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
" Move line: Insert mode
inoremap <C-Down> <ESC>:m .+1<CR>==gi
inoremap <C-Up> <ESC>:m .-2<CR>==gi
" Move line: Visual mode
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme vividchalk

" Disable stupid backup and swap file
" they trigger too many events for file system watchers
set nobackup
set nowritebackup
set noswapfile
set noundofile

" Enable folding with the spacebar
" nnoremap <space> za

if has('win32') || has ('win64')
    let $VIMHOME = $VIM . "/vimfiles"
else
    let $VIMHOME = $HOME . "/.vim"
endif

" abbreviations
silent! source $VIMHOME/abbreviations.vim

