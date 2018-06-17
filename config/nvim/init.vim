scriptencoding utf-8

let mapleader = ','
let g:mapleader = ','



" Required:
let g:_vimplug_path = expand('~/local/share/nvim/site/autoload/plug.vim')
let g:_plugin_dir = expand('~/.local/share/nvim/plugged')
if empty(glob(_plugin_dir))
	exec silent !mkdir -p ._plugin_dir
	exec silent !curl -fLo ._vimplug_path --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin(_plugin_dir)

" Add or remove your plugins here:
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make' }

  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-update-rc --no-key-bindings --no-completion', 'merged': 0 }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'sheerun/vim-polyglot'
  Plug 'tomasr/molokai'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'w0rp/ale'
  Plug 'jiangmiao/auto-pairs'
  Plug 'majutsushi/tagbar'
  " You can specify revision/branch/tag.

  " Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'ervandew/supertab'
call plug#end()


let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#go#gocode_binary = '/home/k/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
" let g:deoplete#sources#go#cgo = 1
let g:deoplete#sources#go#use_cache = 1

let g:deoplete#sources = {}
let g:deoplete#sources.go = ['buffer', 'go']

set completeopt+=noinsert
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

let g:go_fmt_command = "gofmt"
let g:go_fmt_auto_save = 1

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:SuperTabDefaultCompletionType = "context"
let g:go_fmt_fail_silently = 1

" General properties
let NERDTreeDirArrows=1
" let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$']
" let NERDTreeWinSize = 35
let NERDTreeAutoCenter = 1
let NERDTreeChDirMode = 2
let NERDTreeAutoDeleteBuffer = 1


au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>i <Plug>(go-info)
nnoremap <Leader>e :NERDTreeToggle<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>g :grep<space>
nnoremap <Leader>b :Buffers<cr>
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F12> <Plug>(go-def)

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


nnoremap ; :

" Keep cursor in centre of screen after motions
nnoremap n nzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap { {zz
nnoremap } }zz
nnoremap gd gdzz

" Closing buffers/windows more conveniently
nnoremap <silent> <C-x> :bd<cr>
nnoremap <silent> <C-q> :q<cr>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Arrow keys to resize vim splits
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" Return to previous edit point
nnoremap <BS> <C-^>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Mappings related to terminal buffers
tnoremap <Leader><Leader> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Fugitive
nnoremap ]] ]c
nnoremap [[ [c
nnoremap <Leader>di :Gdiff<cr>
nnoremap <Leader>gst :Gstatus<cr>
nnoremap <Leader>dup :diffupdate<cr>


autocmd BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.nviminfo

set nu
set relativenumber
set shiftwidth=8
set noswapfile
set termguicolors
set background=dark
colorscheme molokai
set cursorline
set showmatch
set wildmode=longest,list,full
set wildmenu


au BufRead,BufNewFile *.dylan setf dylan
au BufRead,BufNewFile *.lid   setf dylanlid
au BufRead,BufNewFile *.intr  setf dylanintr
au FileType dylan set tabstop=2
inoremap <C-Z> <C-x><C-o>
autocmd CursorMovedI * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
autocmd InsertLeave * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
