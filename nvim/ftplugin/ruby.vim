let b:ale_fixers = ['rubocop']

" run tests
nmap <Leader>tc :Dispatch rspec %<CR>
nmap <Leader>ta :Dispatch rspec<CR>

" Key bindings for RSpec focus
" (https://github.com/unifieddialog/vim-rspec-focus)
nnoremap <leader>f :AddFocusTag<CR>
nnoremap <leader>F :RemoveAllFocusTags<CR>

" splitjoin.vim configuration
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
