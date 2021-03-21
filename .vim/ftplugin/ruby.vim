let b:ale_fixers = ['rubocop']

" run tests
nmap <Leader>tc :Dispatch rspec %<CR>
nmap <Leader>ta :Dispatch rspec<CR>

" open Rails console in vertical terminal
nmap <Leader>rc :vert term rails console<CR>
