scriptencoding utf-8

let mapleader = ','
let g:mapleader = ','


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/k/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
let g:dein_plugin_dir = expand('/home/k/.cache/dein/bundles/')

if dein#load_state(g:dein_plugin_dir)
  call dein#begin(g:dein_plugin_dir)

  call dein#add('/home/k/.cache/dein/repos/github.com/Shougo/dein.vim')


  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', { 'build': 'make' })

  call dein#add('fatih/vim-go')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tomasr/molokai')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('w0rp/ale')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('majutsushi/tagbar')
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })
  call dein#add('Valloric/YouCompleteMe')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

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

let g:go_fmt_command = "goimports"

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
nnoremap <Leader>gdi :Gdiff<cr>
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


au BufRead,BufNewFile *.dylan setf dylan
au BufRead,BufNewFile *.lid   setf dylanlid
au BufRead,BufNewFile *.intr  setf dylanintr
au FileType dylan set tabstop=2
inoremap <C-Z> <C-x><C-o>
autocmd CursorMovedI * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
autocmd InsertLeave * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
