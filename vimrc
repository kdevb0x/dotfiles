
set nu
set relativenumber
set shiftwidth=4
set shell=bash
let g:mapleader = '\'
"execute pathogen#infect()
"call pathogen#infect('~/.vim/bundle/{}')
call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle' }
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
call plug#end()

autocmd BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.viminfo

"  use go imports for formatting
let g:go_fmt_command = "goimports"

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

au Filetype go nmap <leader>d, <leader>s <Plug>(go-doc-vertical)
au Filetype go nmap <leader>dd <Plug>(go-doc)
au Filetype go nmap <leader>di <Plug>(go-doc-split)<CR>
au Filetype go nmap <leader>ff <Plug>(go-def)
au Filetype go nmap <leader>fi <Plug>(go-def-split)
au Filetype go nmap <leader>fs <Plug>(go-def-vertical)

" Arrow keys to resize vim splits
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

"Navi
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>e :NERDTreeToggle<cr>

" Theme-ish stuff
set termguicolors
set background=dark

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
