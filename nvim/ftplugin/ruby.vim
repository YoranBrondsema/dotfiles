let b:ale_linters = ['rubocop', 'sorbet']
let b:ale_fixers = ['rubocop']
" Hard-coded until https://github.com/sorbet/sorbet/issues/2496 is fixed.
let g:ale_ruby_sorbet_executable = '/Users/yoran/.rvm/gems/ruby-3.0.3@curvo-backend/gems/sorbet-static-0.5.9859-universal-darwin-21/libexec/sorbet'

" run tests
nmap <Leader>tc :Dispatch rspec %<CR>
nmap <Leader>ta :Dispatch rspec<CR>

" splitjoin.vim configuration
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
