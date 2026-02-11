" Basic settings
set nocompatible
syntax on
filetype plugin indent on

" UI
set number
set relativenumber
set cursorline
set showmatch
set wildmenu
set laststatus=2

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indentation
set expandtab
set shiftwidth=2
set tabstop=2
set smartindent

" Performance
set lazyredraw
set updatetime=300

" Behavior
set backspace=indent,eol,start
set hidden
set mouse=a
set clipboard=unnamedplus

" No backup files
set nobackup
set nowritebackup
set noswapfile

" Leader key
let mapleader = " "

" Mappings
nnoremap <Esc> :nohlsearch<CR>
vnoremap < <gv
vnoremap > >gv
