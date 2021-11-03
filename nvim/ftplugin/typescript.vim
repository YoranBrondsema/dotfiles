let b:ale_fixers = ['eslint']

" run tests
nmap <Leader>tc :Dispatch npm run test -- %<CR>
