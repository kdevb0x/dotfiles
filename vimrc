colorscheme slate

set nu
set relativenumber
set shiftwidth=4
set shell=bash
let mapleader=','
execute pathogen#infect()
call pathogen#infect('~/.vim/bundle/{}')

autocmd BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.viminfo

"  use go imports for formatting
let g:go_fmt_command = "goimports"
let g:go_fmt_options = "-tabwidth=4"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au Filetype go set shiftwidth=8
au BufRead,BufNewFile *.dylan setf dylan
au BufRead,BufNewFile *.lid   setf dylanlid
au BufRead,BufNewFile *.intr  setf dylanintr

autocmd vimenter * NERDTree
inoremap <C-Space> <C-x><C-o>
autocmd CursorMovedI * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
autocmd InsertLeave * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif

au Filetype go nmap <leader>ds <Plug>(go-doc-vertical)
au Filetype go nmap <leader>dd <Plug>(go-doc)
au Filetype go nmap <leader>di <Plug>(go-doc-split)
au Filetype go nmap <leader>ff <Plug>(go-def)
au Filetype go nmap <leader>fi <Plug>(go-def-split)
au Filetype go nmap <leader>fs <Plug>(go-def-vertical)
