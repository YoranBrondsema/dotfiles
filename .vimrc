execute pathogen#infect()
set nocompatible " We're running Vim, not Vi!
set encoding=utf8
set showcmd
syntax on
filetype on
filetype indent on 
filetype plugin on
compiler ruby

" Whitespace
set wrap
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

colorscheme wombat256i
