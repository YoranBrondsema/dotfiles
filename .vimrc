set nocompatible " We're running Vim, not Vi!
set encoding=utf8
set showcmd
filetype on
filetype indent on " load filetype-specific indent files
filetype plugin on
compiler ruby

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

" Syntax highlightings
syntax on
" Necessary cause otherwise syntax highlighting hangs for Typescript files
set regexpengine=0

" Theme
let g:gruvbox_contrast_dark = 'hard'
autocmd vimenter * ++nested colorscheme gruvbox

" Backup and swap files
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

" <leader> is Space bar
let mapleader = "\<Space>"

" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'morhetz/gruvbox'
" Typescript
Plug 'HerringtonDarkholme/yats.vim'
" fzf (see https://github.com/junegunn/fzf#as-vim-plugin)
set rtp+=/usr/local/opt/fz
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Splitjoin
Plug 'AndrewRadev/splitjoin.vim'
" GraphQL support
Plug 'jparise/vim-graphql'
" Nice comments
Plug 'tomtom/tcomment_vim'
" ALE
Plug 'dense-analysis/ale'
" Sensible defaults
Plug 'tpope/vim-sensible'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" Show whitespaces
Plug 'ntpeters/vim-better-whitespace'
" Handlebars
Plug 'joukevandermaas/vim-ember-hbs'
" Elixir
Plug 'elixir-editors/vim-elixir'
" Smart surround
Plug 'tpope/vim-surround'
" SCSS
Plug 'cakebaker/scss-syntax.vim'
" vim-dispatch
Plug 'tpope/vim-dispatch'
" Initialize plugin system
call plug#end()

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
" Set up elixir-ls
let g:ale_elixir_elixir_ls_release = $HOME.'/Programs/elixir-ls'
" Fixes the high CPU usage
let g:ale_elixir_elixir_ls_config = {
      \   'elixirLS': {
      \     'dialyzerEnabled': v:false,
      \   },
      \ }
" linters and fixers
let g:ale_linters = {
\ 'elixir': ['credo', 'elixir-ls'],
\ 'javascript': ['eslint'],
\ 'html.handlebars': ['ember-template-lint'],
\}
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint'],
\ 'typescriptreact': ['eslint'],
\ 'ruby': ['rubocop'],
\}

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

" splitjoin.vim configuration
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" fzf config
function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd -t f' : printf('fd -t f | proximity-sort %s', expand('%'))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" search for git tracked files
nmap <Leader>f :Files<CR>
