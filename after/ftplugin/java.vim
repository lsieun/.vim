
" ==== Java
iab sout System.out.println();<LEFT><LEFT>
iab serr System.err.println();<LEFT><LEFT>
iab pr private
iab pe protected
iab pu public
iab ex extends
iab bo boolean
iab ab abstract
iab cl class
iab st static
iab fi final
iab ir import
iab re return
iab sw switch
iab Ob Object
iab Ex Exception
iab En Enumeration
iab Gr Graphics
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
