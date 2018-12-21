
" ==== Java
iab sout System.out.println();<LEFT><LEFT>
iab serr System.err.println();<LEFT><LEFT>
iab sb_sba @SpringBootApplication<esc>
iab sb_rc @RestController
iab sb_con @Controller

" ==== Eclim
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimMakeLCD = 1
" Import the class under the cursor with <leader>i (:h mapleader)
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
" Search for the javadocs of the element under the cursor with <leader>d
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
" Perform a context sensitive search of the element under the cursor with <enter>
nnoremap <silent> <buffer> <cr> :JavaSearchContext -a edit<cr>
