scriptencoding utf-8

let mapleader = ','
let g:mapleader = ','

let g:_vimplug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')

if empty(glob(_vimplug_path))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" Required:
let g:_plugin_dir = expand('~/.local/share/nvim/plugged')

call plug#begin(_plugin_dir)

" Add or remove your plugins here:
  Plug 'baabelfish/nvim-nim'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/echodoc.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
  Plug 'sebastianmarkow/deoplete-rust'
  " Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
  " Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
  " Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
  Plug 'https://github.com/visualfc/gocode.git', { 'commit': 'dfb212f', 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
  Plug 'fatih/vim-go', { 'lazy': 1 } "{ 'do': ':GoInstallBinaries' }
  Plug 'zchee/deoplete-jedi', { 'for': 'python' }
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

 "  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'landaire/deoplete-d', { 'for': 'd' }
  Plug 'ervandew/supertab'
  Plug 'easymotion/vim-easymotion'

call plug#end()


let g:nvim_nim_enable_async = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
" let g:deoplete#sources#d#dcd_server_autostart = 1
" let g:deoplete#sources#go#gocode_binary = '/home/k/go/bin/gocode-gomod'
let g:deoplete#sources#go#gocode_binary = '/home/k/.local/share/nvim/plugged/gocode/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
" let g:deoplete#sources#go#cgo = 1 " /* Error deoplete_go: 'Source' object has no attribute 'cgo_complete_pattern' */
let g:deoplete#sources#go#use_cache = 1

let g:deoplete#sources#go = ['context', 'buffer']
let g:deoplete#sources#go#cgo = 1
let g:deoplete#sources#go#cgo#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#go#on_event = 1
let g:deoplete#sources#go#package_dot = 1

let g:go_def_mode = 'guru'
let g:go_autodetect_gopath = 1
" let g:go_info_mode = 'gocode'
" let g:go_list_type = 'quickfix'
let g:go_gocode_propose_source = 1
let g:go_echo_command_info = 1

" let g:ale_go_langserver_executable = '/home/k/go/bin/go-langserver'
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}
" let g:ale_go_gometalinter_options = '--fast'
" let g:ale_completion_enabled = 1
let g:ale_completion_delay = 300
let g:ale_close_preview_on_insert = 1
let g:ale_list_vertical = 1
au FileType go nmap <Leader>de <Plug>(ale_go_to_definition_in_tab)
au FileType go nmap <Leader>re <Plug>(ale_find_references)
au FileType go nmap <Leader>i <Plug>(go-implements)


filetype plugin on

set cmdheight=2
set noshowmode
set completeopt+=noinsert
set completeopt+=noselect
set completeopt+=preview

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

let g:python2_host_prog = '/usr/bin/python2'
let g:python2_host_skip_check = 1

let g:go_fmt_command = "goimports"
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
" let g:go_doc_keywordprg_enabled = 1

" General properties
let NERDTreeDirArrows=1
" let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$']
" let NERDTreeWinSize = 35
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=2
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=1
let NERDTreeCascadeSingleChildDir=0

let g:AutoPairsFlyMode = 0
let g:AutoPairsBackInsert = 0
let g:AutoPairsShortcutBackInsert = '<C-BS>'
let g:AutoPairsMultilineClose = 0

au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au FileType go nmap <leader>grt <Plug>(go-run-tab)
au FileType go nmap <leader>grs <Plug>(go-run-split)
au FileType go nmap <leader>grv <Plug>(go-run-vertical)
au FileType go nmap <leader>gts <Plug>(go-test-split)
au FileType go nmap <leader>gtv <Plug>(go-test-vertical)
au FileType go nmap <leader>gtt <Plug>(go-test-tab)


" au Filetype go nmap <Leader>ff <Plug>(go-def)
" au Filetype go nmap <Leader>fs <Plug>(go-def-split)
" au Filetype go nmap <Leader>fv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>a <Plug>(go-describe)
" au FileType go nmap <Leader>I <Plug>(go-imports)
nnoremap <Leader>e :NERDTreeToggle<cr>
" nnoremap <Leader>gr :grep<space>
nnoremap <Leader>b :Buffers<cr>
au FileType go nmap <leader>ga<Space> <Plug>(go-alternate-edit)
au FileType go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F4> <Plug>(go-implements)
au FileType go nmap <F5> <Plug>(go-run-split)
au FileType go nmap <F6> <Plug>(go-build)
" au FileType go nnoremap <F7> <leader>s :sp <CR>:exe "GoDef" <CR>
" au FileType go nmap <F10> :sp <CR>:exe "GoDef" <CR>
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
" nnoremap <leader>, <ESC>
" vnoremap <leader>, <ESC>
" inoremap <leader>, <ESC>

" map <S-Space> <ESC>
" vnoremap <S-Space> <ESC>
" inoremap <S-Space> <ESC>


" Keep cursor in centre of screen after motions
nnoremap n nzz
" nnoremap <C-d> <C-d>zz
" nnoremap <C-u> <C-u>zz
nnoremap { {zz
nnoremap } }zz
nnoremap gd gdzz



" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Arrow keys to resize vim splits
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Down> :resize +2<CR>
nnoremap <Up> :resize -2<CR>

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
nnoremap <M-t> :below sp <CR>:terminal<CR>a
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Fugitive
nnoremap ]] ]c
nnoremap [[ [c
" nnoremap <Leader>di :Gdiff<cr>
" nnoremap <Leader>gst :Gstatus<cr>
" nnoremap <Leader>dup :diffupdate<cr>


autocmd BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.nviminfo

set nu
set updatetime=100
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
set autowrite


au BufRead,BufNewFile *.dylan set filetype=dylan tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.lid   set filetype=dylanlid
au BufRead,BufNewFile *.intr  set filetype=dylanintr
au FileType dylan set tabstop=2
au FileType dylan set shiftwidth=2

au FileType python set tabstop=4
au FileType python set shiftwidth=4

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
inoremap <silent><expr> <Cr> pumvisible() ?
            \ deoplete#mappings#close_popup() : "<C-g>u<Cr>"
"
"" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <M-Space> deoplete#mappings#manual_complete()
"
"" Escape: exit autocompletion, go to Normal mode
"inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"
"
" =================END============
function! BsdHeader()
	call append(0, "/* BSD 3-Clause License")
	call append(1, "*")
	call append(2, "*  Copyright (c) 2018, kdevb0x Ltd.")
	call append(3, "*  All rights reserved.")
	call append(4, "*")
	call append(5, "*  Redistribution and use in source and binary forms, with or without")
	call append(6, "*  modification, are permitted provided that the following conditions are met:")
	call append(7, "*")
	call append(8, "*  Redistributions of source code must retain the above copyright notice, this")
	call append(9, "*  list of conditions and the following disclaimer.")
	call append(10, "*")
	call append(11, "*  Redistributions in binary form must reproduce the above copyright notice,")
	call append(12, "*  this list of conditions and the following disclaimer in the documentation")
	call append(13, "*  and/or other materials provided with the distribution.")
	call append(14, "*")
	call append(15, "*  Neither the name of the copyright holder nor the names of its")
	call append(16, "*  contributors may be used to endorse or promote products derived from")
	call append(17, "*  this software without specific prior written permission.")
	call append(18, "*")
	call append(19, "*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS'")
	call append(20, "*  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE")
	call append(21, "*  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE")
	call append(22, "*  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE")
	call append(23, "*  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL")
	call append(24, "*  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR")
	call append(25, "*  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER")
	call append(26, "*  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,")
	call append(27, "*  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE")
	call append(28, "*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.")
	call append(29, " */")
endfunction

function! BsdPreamble()
	call append(0, "// Copyright 2018 kdevb0x Ltd. All rights reserved.")
	call append(1, "// Use of this source code is governed by the BSD 3-Clause license")
	call append(2, "// The full license text can be found in the LICENSE file.")
endfunction

nmap <F27> :call BsdHeader()<CR>
nmap <F3> :call BsdPreamble()<CR>


