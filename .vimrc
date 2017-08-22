execute pathogen#infect()
set nocompatible " We're running Vim, not Vi!
set encoding=utf8
set showcmd
filetype on
filetype indent on " load filetype-specific indent files
filetype plugin on
compiler ruby

" Autocomplete
set omnifunc=syntaxcomplete#Complete

" Whitespace
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=2
set wrap
set autoindent

" UI
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

colorscheme wombat256i
syntax on " enable syntax processing

"
" Backup and swap files
"
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_tmp//      " where to put swap files.

" show the filename in the window titlebar
set title

" don’t reset cursor to start of line when moving around
set nostartofline

" show the (partial) command as it’s being typed
set showcmd

" 80-character line marker
set colorcolumn=80

" Key bindings for RSpec focus
" (https://github.com/unifieddialog/vim-rspec-focus)
nnoremap <leader>f :AddFocusTag<CR>
nnoremap <leader>F :RemoveAllFocusTags<CR>

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_ruby_checkers = ['rubocop']
