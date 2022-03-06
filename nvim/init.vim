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
set background=dark

" <leader> is Space bar
let mapleader = "\<Space>"

" vim-plug
call plug#begin(stdpath('data') . '/plugged')
" Color scheme
Plug 'lifepillar/vim-gruvbox8'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" tree-sitter for syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" tree-sitter doesn't work well for Terraform
Plug 'hashivim/vim-terraform'
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
" Repeat vim-surround
Plug 'tpope/vim-repeat'
" No yanking when deleting
Plug 'svermeulen/vim-cutlass'
" Initialize plugin system
call plug#end()

" Theme
colorscheme gruvbox8

" Type "%%/" path to quickly edit a file in the same directory as the current
" file (from
" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory#Using_a_command_line_abbreviation)
cabbr <expr> %% expand('%:p:h')

" Yank name of current file
nmap <leader>fy :let @"=expand("%:t")<CR>

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

source $HOME/.config/nvim/modules/cutlass.vim
source $HOME/.config/nvim/modules/emberjs.vim
source $HOME/.config/nvim/modules/telescope.vim
source $HOME/.config/nvim/modules/ale.vim
source $HOME/.config/nvim/modules/treesitter.vim
source $HOME/.config/nvim/modules/ruby.vim
