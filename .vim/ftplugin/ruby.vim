let b:ale_fixers = ['rubocop']

" run tests
nmap <Leader>tc :Dispatch bundle exec rspec %<CR>
nmap <Leader>ta :Dispatch bundle exec rspec<CR>
