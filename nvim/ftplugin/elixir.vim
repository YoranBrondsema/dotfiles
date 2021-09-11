let b:ale_linters = ['credo', 'elixir-ls']
let b:ale_elixir_elixir_ls_release = "/Users/yoran/Programs/elixir-ls"

" run tests
nmap <Leader>tc :Dispatch mix test %<CR>
nmap <Leader>ta :Dispatch mix test<CR>
