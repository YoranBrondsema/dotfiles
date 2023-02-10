" Fixing lints with ale
nmap <leader>l <Plug>(ale_fix)
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
let g:ale_fix_on_save = 0
" See https://github.com/dense-analysis/ale#5ix-how-can-i-change-the-format-for-echo-messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter% %code%] %s [%severity%]'
" Run unsafe fixes to allow Style/FrozenStringLiteralComment
let g:ale_ruby_rubocop_auto_correct_all = 1
let g:ale_javascript_eslint_options = '--cache'
