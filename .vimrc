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
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Theme
" The following is necessary to have termguicolors work in the terminal (see
" https://github.com/vim/vim/issues/993#issuecomment-255651605)
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
 set termguicolors
endif
syntax on
colorscheme wombat256i

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

" show current row
set cursorline

" Key bindings for RSpec focus
" (https://github.com/unifieddialog/vim-rspec-focus)
nnoremap <leader>f :AddFocusTag<CR>
nnoremap <leader>F :RemoveAllFocusTags<CR>

" To delete without cutting.
nnoremap <leader>d "_d

" Wrap to 80 columns for Markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Type "%%/" path to quickly edit a file in the same directory as the current
" file (from
" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory#Using_a_command_line_abbreviation)
cabbr <expr> %% expand('%:p:h')

" Ember.js
" opens the component.js file
nnoremap <leader>pc :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/component.js<CR>
" opens the template.hbs file
nnoremap <leader>pt :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/template.hbs<CR>

" Fixing lints with ale
nmap <Leader>f <Plug>(ale_fix)
