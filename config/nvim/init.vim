scriptencoding utf-8

let mapleader = ','
let g:mapleader = ','


let g:_vimplug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')

if empty(glob(_vimplug_path))
  exec "!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs\
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Required:
let g:_plugin_dir = expand('~/.local/share/nvim/plugged')

call plug#begin(_plugin_dir)

" Add or remove your plugins here:
"  Plug 'Shougo/neosnippet.vim'
"  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make' }
  Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
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
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
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
let g:go_term_enabled = 1
let g:go_doc_keywordprg_enabled = 1

" General properties
let NERDTreeDirArrows=1
" let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$']
" let NERDTreeWinSize = 35
let NERDTreeAutoCenter = 1
let NERDTreeChDirMode = 2
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=1
let NERDTreeCascadeSingleChildDir=0

au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-split)
au FileType go nmap <leader>rv <Plug>(go-run-vertical)
" au Filetype go nmap <Leader>ff <Plug>(go-def)
" au Filetype go nmap <Leader>fs <Plug>(go-def-split)
" au Filetype go nmap <Leader>fv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>i <Plug>(go-describe)
au FileType go nmap <Leader>I <Plug>(go-imports)
nnoremap <Leader>e :NERDTreeToggle<cr>
nnoremap <Leader>gr :grep<space>
nnoremap <Leader>b :Buffers<cr>
au FileType go nmap <leader>ga<Space> <Plug>(go-alternate-edit)
au FileType go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F3> <Plug>(go-vet)
au FileType go nmap <F4> <Plug>(go-implements)
au FileType go nmap <F5> <Plug>(go-run-split)
au FileType go nmap <F6> <Plug>(go-build)
au FileType go nmap <F7> <Plug>(go-install)
au FileType go nmap <F9> :GoTest -short<cr>
au FileType go nmap <F10> :GoCoverageToggle -short<cr>
au FileType go nmap <F12> <Plug>(go-doc-split)

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
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Start live interactive EasyAlign
nnoremap <Leader>ea <Plug>(LiveEasyAlign)

" Mappings related to terminal buffers
inoremap <M-T> :vsp <CR>:terminal<CR>a
nnoremap <M-T> :vsp <CR>:terminal<CR>a
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Fugitive
nnoremap ]] ]c
nnoremap [[ [c
" nnoremap <Leader>di :Gdiff<cr>
nnoremap <Leader>gst :Gstatus<cr>
" nnoremap <Leader>dup :diffupdate<cr>


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
set inccommand=split


au BufRead,BufNewFile *.dylan setf dylan
au BufRead,BufNewFile *.lid   setf dylanlid
au BufRead,BufNewFile *.intr  setf dylanintr
au FileType dylan set tabstop=2
inoremap <C-Space> <C-x><C-o>
autocmd CursorMovedI * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
autocmd InsertLeave * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif

"Mappings from stackexchange re: deoplete w/ tabs.
" delete or comment out section as desired
" ++++++++++++++++BEGIN+++++++++++++++++++++++

"use <tab> for completion
"function! TabWrap()
"    if pumvisible()
"        return "\<C-N>"
"    elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
"        return "\<tab>"
"    elseif &omnifunc !~ ''
"        return "\<C-X>\<C-O>"
"    else
"        return "\<C-N>"
"    endif
"endfunction
"
"" power tab
"imap <silent><expr><tab> TabWrap()
"
"" Enter: complete&close popup if visible (so next Enter works); else: break undo
"inoremap <silent><expr> <Cr> pumvisible() ?
"            \ deoplete#mappings#close_popup() : "<C-g>u<Cr>"
"
"" Ctrl-Space: summon FULL (synced) autocompletion
"inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()
"
"" Escape: exit autocompletion, go to Normal mode
"inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"
"
" =================END============
