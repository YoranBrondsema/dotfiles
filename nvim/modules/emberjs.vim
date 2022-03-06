" Ember.js
" opens the component.js file
nnoremap <leader>pc :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/component.js<CR>
nnoremap <leader>ps :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/component.ts<CR>
" opens the template.hbs file
nnoremap <leader>pt :vsp <C-r>=fnameescape(expand('%:p:h'))<CR>/template.hbs<CR>
