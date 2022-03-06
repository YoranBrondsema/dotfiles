" " fzf config
" function! s:list_cmd()
"   let base = fnamemodify(expand('%'), ':h:.:S')
"   return base == '.' ? 'fd -t f' : printf('fd -t f | proximity-sort %s', expand('%'))
" endfunction
"
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
"   \                               'options': '--tiebreak=index'}, <bang>0)
"
" " search for git tracked files
" nmap <Leader>f :Files<CR>
nnoremap <leader>f <cmd>Telescope find_files<cr>
