" vundle plugins
set nocompatible 
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
call vundle#end()
filetype plugin indent on

"dracula theme
packadd! dracula
syntax enable
colorscheme dracula

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Basic settings
syntax on
set number

" search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set linebreak    "Wrap lines at convenient points


