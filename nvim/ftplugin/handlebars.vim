let b:ale_linters = ['ember-template-lint']
let b:ale_fixers = ['prettier']

" Ember.js
nnoremap <leader>pc :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/component.js<CR>
nnoremap <leader>ps :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/component.ts<CR>
