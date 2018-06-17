"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/k/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/k/.config/nvim/bundles/')
  call dein#begin('/home/k/.config/nvim/bundles/')

  " Let dein manage dein
  " Required:
call dein#add('/home/k/.config/nvim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('scrooloose/nerdtree')
  call dein#add('fatih/vim-go')
  call dein#add('jiangmiao/auto-pairs')
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
 " call dein#install()
"endif
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"----Old vim vimrc
colorscheme slate

set nu
set shiftwidth=8
set shell=bash
" let mapleader="`"

autocmd BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.nviminfo

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
au BufRead,BufNewFile *.dylan setf dylan
au BufRead,BufNewFile *.lid   setf dylanlid
au BufRead,BufNewFile *.intr  setf dylanintr

autocmd vimenter * NERDTree

