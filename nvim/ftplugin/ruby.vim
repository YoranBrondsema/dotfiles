let b:ale_fixers = ['rubocop']

" run tests
nmap <Leader>tc :Dispatch rspec %<CR>
nmap <Leader>ta :Dispatch rspec<CR>

" splitjoin.vim configuration
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
