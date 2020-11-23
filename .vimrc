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
nnoremap <leader>ps :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/component.ts<CR>
" opens the template.hbs file
nnoremap <leader>pt :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/template.hbs<CR>

" Fixing lints with ale
nmap <leader>l <Plug>(ale_fix)
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 1
" See https://github.com/dense-analysis/ale#5ix-how-can-i-change-the-format-for-echo-messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter% %code%] %s [%severity%]'
" Run unsafe fixes to allow Style/FrozenStringLiteralComment
let g:ale_ruby_rubocop_auto_correct_all = 1

" Yank name of current file
nmap <leader>fy :let @"=expand("%:t")<CR>

" Run Ember.js codemods on current file.
" Requires "codemod:angle-brackets" script to be existent in package.json.
nnoremap <leader>ca :execute "!npm run codemod:angle-brackets " . expand('%:p')<CR>
" Requires "codemod:native-class" script to be existent in package.json.
nnoremap <leader>cc :execute "!npm run codemod:native-class " . expand('%:p')<CR>
" Replace "X.set('Y', Z)" into "X.Y = Z"
nnoremap <leader>cs :%s/\([a-zA-Z]\+\)\.set('\([a-zA-Z\.]\+\)', \(.\+\))/\1\.\2 = \3/<CR>
" Replace "X.get('Y')" into "X.Y"
nnoremap <leader>cg :%s/\([a-zA-Z]\+\)\.get('\([^\)]\+\)')/\1\.\2/<CR>

" Press <Ctrl>-j to insert a new line below the cursor without leaving normal
" mode.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>

" Easily replace the word under the cursor.
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" Highlight YAML front matter as used by Jekyll or Hugo.
let g:vim_markdown_frontmatter = 1

" vim-terraform
" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" install vim-plug for fzf (see
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" fzf (see https://github.com/junegunn/fzf#as-vim-plugin)
set rtp+=~/Programs/fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Typescript support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Splitjoin
Plug 'AndrewRadev/splitjoin.vim'

" GraphQL supprot
Plug 'jparise/vim-graphql'

" Initialize plugin system
call plug#end()

" splitjoin.vim configuration
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" search for git tracked files
nmap <Leader>f :ProjectFiles<CR>
