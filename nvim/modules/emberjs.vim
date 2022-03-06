" opens the component.js file
nnoremap <leader>pc :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/component.js<CR>
nnoremap <leader>ps :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/component.ts<CR>
" opens the template.hbs file
nnoremap <leader>pt :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/template.hbs<CR>

" Run Ember.js codemods on current file.
" Requires "codemod:angle-brackets" script to be existent in package.json.
nnoremap <leader>ca :execute "!npm run codemod:angle-brackets " . expand('%:p')<CR>
" Requires "codemod:native-class" script to be existent in package.json.
nnoremap <leader>cc :execute "!npm run codemod:native-class " . expand('%:p')<CR>
" Replace "X.set('Y', Z)" into "X.Y = Z"
nnoremap <leader>cs :%s/\([a-zA-Z]\+\)\.set('\([0-9a-zA-Z\.]\+\)', \(.\+\))/\1\.\2 = \3/<CR>
" Replace "X.get('Y')" into "X.Y"
nnoremap <leader>cg :%s/\([a-zA-Z]\+\)\.get('\([^\)]\+\)')/\1\.\2/<CR>
