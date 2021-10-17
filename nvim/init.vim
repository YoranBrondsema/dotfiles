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

" UI
set showmatch " highlight matching [{()}]

" Searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Necessary cause otherwise syntax highlighting hangs for Typescript files
set regexpengine=0

" show the filename in the window titlebar
set title

" don’t reset cursor to start of line when moving around
set nostartofline

" 80-character line marker
set colorcolumn=80

" show current row
set cursorline

" <leader> is Space bar
let mapleader = "\<Space>"

" vim-plug
call plug#begin(stdpath('data') . '/plugged')

" Color scheme
Plug 'lifepillar/vim-gruvbox8'
" fzf (see https://github.com/junegunn/fzf#as-vim-plugin)
set rtp+=/usr/local/opt/fz
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" All languages
Plug 'sheerun/vim-polyglot'
Plug 'joukevandermaas/vim-ember-hbs' " Handlebars in Ember
Plug 'amadeus/vim-mjml' " MJML
" Splitjoin
Plug 'AndrewRadev/splitjoin.vim'
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
" Smart surround
Plug 'tpope/vim-surround'
" vim-dispatch
Plug 'tpope/vim-dispatch'
" Snake case operations and so on
Plug 'tpope/vim-abolish'
" Initialize plugin system
call plug#end()

" Theme
colorscheme gruvbox8

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

source "ale.vim"

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
nnoremap <Leader>r :%s/<C-r><C-w>/

" Highlight YAML front matter as used by Jekyll or Hugo.
let g:vim_markdown_frontmatter = 1

" vim-terraform
" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
let g:terraform_fmt_on_save=1

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

" set the filetype for 'fastlane' (mobile app automation) files
au BufNewFile,BufRead Appfile set ft=ruby
au BufNewFile,BufRead Deliverfile set ft=ruby
au BufNewFile,BufRead Fastfile set ft=ruby
au BufNewFile,BufRead Gymfile set ft=ruby
au BufNewFile,BufRead Matchfile set ft=ruby
au BufNewFile,BufRead Snapfile set ft=ruby
au BufNewFile,BufRead Scanfile set ft=ruby
