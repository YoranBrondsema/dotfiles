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

" <leader>  is Space bar
let mapleader = "\<Space>"

" Key bindings for RSpec focus
" (https://github.com/unifieddialog/vim-rspec-focus)
nnoremap <leader>f :AddFocusTag<CR>
nnoremap <leader>F :RemoveAllFocusTags<CR>

" To delete without cutting.
nnoremap <leader>d "_d

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
nmap <leader>l <Plug>(ale_fix)
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" Yank name of current file
nmap <leader>cs :let @"=expand("%:t")<CR>

" Run Ember.js codemods on current file.
" Requires "codemod:angle-brackets" script to be existent in package.json.
nnoremap <leader>ca :execute "!npm run codemod:angle-brackets " . expand('%:p')<CR>
" Requires "codemod:native-class" script to be existent in package.json.
nnoremap <leader>cc :execute "!npm run codemod:native-class " . expand('%:p')<CR>
" Replace "this.set('X', Y)" into "this.X = Y"
nnoremap <leader>cs :%s/this\.set('\([a-zA-Z\.]\+\)', \(.\+\))/this\.\1 = \2/<CR>
" Replace "this.set('X', Y)" into "this.X = Y"
nnoremap <leader>cg :%s/this\.get('\([^\)]\+\)')/this\.\1/<CR>

" Press <Ctrl>-j to insert a new line below the cursor without leaving normal
" mode.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>

" Easily replace the word under the cursor.
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" Highlight YAML front matter as used by Jekyll or Hugo.
let g:vim_markdown_frontmatter = 1

" fzf (see https://github.com/junegunn/fzf#as-vim-plugin)
set rtp+=~/Programs/fzf
" search for git tracked files
nmap <Leader>f :GFiles<CR>
" search for lines in current buffer
nmap <Leader>s :BLines<CR>

" splitjoin.vim configuration
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
