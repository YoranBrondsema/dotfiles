let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier', 'eslint']
let b:ale_fix_on_save = 1

" Ember.js
nnoremap <leader>ca :execute "!npm run codemod:angle-brackets " . expand('%:p')<CR>
nnoremap <leader>cc :execute "!npm run codemod:native-class " . expand('%:p')<CR>
" Replace "X.set('Y', Z)" into "X.Y = Z"
nnoremap <leader>cs :%s/\([a-zA-Z]\+\)\.set('\([0-9a-zA-Z\.]\+\)', \(.\+\))/\1\.\2 = \3/<CR>
" Replace "X.get('Y')" into "X.Y"
nnoremap <leader>cg :%s/\([a-zA-Z]\+\)\.get('\([^\)]\+\)')/\1\.\2/<CR>
" opens the template.hbs file
nnoremap <leader>pt :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/template.hbs<CR>
