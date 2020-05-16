autocmd FileType markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd FileType markdown inoremap <buffer> ,g <++>
autocmd FileType markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd FileType markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd FileType markdown inoremap <buffer> ,d ~~~~ <++><Esc>F~hi
autocmd FileType markdown inoremap <buffer> ,a `` <++><Esc>F`i
autocmd FileType markdown inoremap <buffer> ,c ```<CR><++><CR>```<CR><CR><++><Esc>4kA
autocmd FileType markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap <buffer> ,w [](<++>) <++><Esc>F[a
autocmd FileType markdown inoremap <buffer> ,l ---<CR><CR>
autocmd FileType markdown inoremap <buffer> ,1 # 
autocmd FileType markdown inoremap <buffer> ,2 ## 
autocmd FileType markdown inoremap <buffer> ,3 ### 
autocmd FileType markdown inoremap <buffer> ,4 #### 
autocmd FileType markdown inoremap <buffer> ,5 ##### 
autocmd FileType markdown inoremap <buffer> ,6 ###### 

