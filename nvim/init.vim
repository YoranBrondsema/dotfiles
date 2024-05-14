filetype on
filetype indent on " load filetype-specific indent files
filetype plugin on
compiler ruby

source $HOME/.config/nvim/modules/global.lua

" Whitespace
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=2
set wrap
" UI
set showmatch " highlight matching [{()}]
" Necessary cause otherwise syntax highlighting hangs for Typescript files
set regexpengine=0
" show the filename in the window titlebar
set title
" don’t reset cursor to start of line when moving around
set nostartofline
" 80-character line marker
set colorcolumn=80

" vim-plug
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'amadeus/vim-mjml'
Plug 'dstein64/vim-startuptime'
Plug 'github/copilot.vim'
Plug 'hashivim/vim-terraform'
Plug 'wuelnerdotexe/vim-astro'
" Nice comments
Plug 'numToStr/Comment.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Snake case operations and so on
Plug 'tpope/vim-abolish'
" Repeat vim-surround
Plug 'tpope/vim-repeat'
" No yanking when deleting
Plug 'svermeulen/vim-cutlass'
" Color scheme
Plug 'folke/tokyonight.nvim'
" Initialize plugin system
call plug#end()

" Set up numToStr/Comment.nvim
lua require('Comment').setup()

" Colors
colorscheme tokyonight-night
if (has("termguicolors"))
   set termguicolors
endif

" Type "%%/" path to quickly edit a file in the same directory as the current
" file (from
" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory#Using_a_command_line_abbreviation)
cabbr <expr> %% expand('%:p:h')

" Yank path of current file
nmap <leader>fy :let @"=expand("%")<CR>

" Press <Ctrl>-j to insert a new line below the cursor without leaving normal
" mode.
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" Easily replace the word under the cursor.
nnoremap <Leader>r :%s/<C-r><C-w>/

" Highlight YAML front matter as used by Jekyll or Hugo.
let g:vim_markdown_frontmatter = 1

" vim-terraform
" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" disable the providers we don't use
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

source $HOME/.config/nvim/modules/cutlass.vim
source $HOME/.config/nvim/modules/telescope.lua
source $HOME/.config/nvim/modules/ale.vim
source $HOME/.config/nvim/modules/treesitter.lua
source $HOME/.config/nvim/modules/ruby.vim
