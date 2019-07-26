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
"  Plug 'https://github.com/saibing/bingo.git', { 'do': 'cd ~/.local/share/nvim/plugged/bingo && GO111MODULE=on go install' }
  Plug 'buoto/gotests-vim'
  " Plug 'baabelfish/nvim-nim'
  " Plug 'Shougo/neosnippet.vim'
  " Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/echodoc.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
  Plug 'sebastianmarkow/deoplete-rust'
  " Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
  " Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
  Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
  " Plug 'https://github.com/visualfc/gocode.git', { 'rtp': 'nvim', 'do': '/home/k/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
  " Plug 'https://github.com/visualfc/gocode.git', { 'commit': 'dfb212f', 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
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
  Plug 'morhetz/gruvbox'
  Plug 'powerline/fonts'
  " Plug 'ryanoasis/vim-devicons'
  " You can specify revision/branch/tag.

 "  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  " Plug 'landaire/deoplete-d', { 'for': 'd' }
  Plug 'ervandew/supertab'
  Plug 'easymotion/vim-easymotion'
  Plug 'ctrlpvim/ctrlp.vim'
  " Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  Plug 'godoctor/godoctor.vim', {'for': 'go'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
  " This is neat, but removes line highlight, TODO: FIXME
  " Plug 'terryma/vim-multiple-cursors'

call plug#end()


" let g:nvim_nim_enable_async = 0

let g:deoplete#enable_at_startup = 0
let g:deoplete#enable_smart_case = 2

 let g:deoplete#ignore_sources = {}
" let g:deoplete#sources#d#dcd_server_autostart = 1
" let g:deoplete#sources#go#gocode_binary = '/home/k/go/bin/gocode-gomod'
let g:deoplete#sources#go#gocode_binary = '/home/k/.local/share/nvim/plugged/gocode-binary/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#use_cache = 1

let g:deoplete#sources#go = ['context', 'buffer']
let g:deoplete#sources#go#cgo = 1
let g:deoplete#sources#go#cgo#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#go#on_event = 0
let g:deoplete#sources#go#package_dot = 0

set hidden

" let g:LanguageClient_serverCommands = {
    " \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    " \ 'go': ['gopls'],
    " \ }

" nnoremap <F7> :call LanguageClient_contextMenu()<CR>
" Run gofmt and goimports on save


let g:go_def_mode = 'guru'
let g:go_autodetect_gopath = 0
let g:go_info_mode = 'guru'
" or 'gopls'
let g:go_list_type = 'quickfix'
let g:go_list_height = 10
let g:go_gocode_propose_source = 0
let g:gocode_propose_builtins = 0
let g:go_gocode_socket_type = 'unix'
let g:go_echo_command_info = 1
let g:go_echo_go_info = 1
let g:go_updatetime = 600
let g:go_decls_includes = 'func,type'
let g:go_decls_mode = ''

let g:go_doc_max_height = 20

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

nmap <Leader><C-]> :GoDefType<cr>

" let g:ale_go_langserver_executable = '/home/k/go/bin/go-langserver'
" let g:ale_linters = {'go': ['gometalinter', 'gofmt']}
"  "let g:ale_go_gometalinter_options = '--fast'
" let g:ale_completion_enabled = 1
" let g:ale_completion_delay = 300
" let g:ale_close_preview_on_insert = 1
" let g:ale_list_vertical = 1
" au FileType go nmap <Leader>de <Plug>(ale_go_to_definition_in_tab)
" au FileType go nmap <Leader>re <Plug>(ale_find_references)
" au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)


filetype plugin on

set cmdheight=2
set nosol
set noshowmode
set completeopt+=noinsert
set completeopt+=noselect
set completeopt+=preview

if has("patch-7.4.314")
    set shortmess+=c
endif

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

let g:python2_host_prog = '/usr/bin/python2'
let g:python2_host_skip_check = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_auto_save = 0

let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0
let g:SuperTabDefaultCompletionType = "context"
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1
let g:go_term_mode = "split"
let g:go_doc_keywordprg_enabled = 1 " set to use godoc instead of man for K

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

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"

au FileType go nmap <Leader>cd <Plug>(coc-definition)
au FileType go nmap <Leader>ct <Plug>(coc-type-definition)
au FileType go nmap <Leader>ci <Plug>(coc-implementation)
au FileType go nmap <Leader>cr <Plug>(coc-references)

" au Filetype go nmap <Leader>ff <Plug>(go-def)
" au Filetype go nmap <Leader>fs <Plug>(go-def-split)
" au Filetype go nmap <Leader>fv <Plug>(go-def-vertical)
" au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>a <Plug>(go-describe)
" au FileType go nmap <Leader>I <Plug>(go-imports)
nnoremap <Leader>e :NERDTreeToggle<cr>
nnoremap <Leader>gre :grep<space>
nnoremap <Leader>b :Buffers<cr>
au FileType go nmap <leader>gae<Space> <Plug>(go-alternate-edit)
au FileType go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <F4> <Plug>(go-implements)
au FileType go nmap <F5> <Plug>(go-run-split)
au FileType go nmap <F6> <Plug>(go-build)
au FileType go nnoremap <Leader>s :sp <CR>:exe "GoDef" <CR>
" au FileType go nmap <F10> :sp <CR>:exe "GoDef" <CR>
" au FileType go nmap <F7> :call coc#expandableOrJumpable() <CR>
au FileType go nmap <F9> :GoTest -short<cr>
au FileType go nmap <F10> :GoCoverageToggle -short<cr>
au FileType go nmap <F12> <Plug>(go-doc-split)

set tags+=./tags;/,tags;/

nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autoshowtag = 1
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
noremap <M-T> :vsp <CR>:terminal<CR>a
nnoremap <M-t> :below sp <CR>:terminal<CR>a
tnoremap <Esc> <C-\><C-n>
noremap <A-h> <C-\><C-n><C-w>h
noremap <A-j> <C-\><C-n><C-w>j
noremap <A-k> <C-\><C-n><C-w>k
noremap <A-l> <C-\><C-n><C-w>l

" Fugitive
nnoremap ]] ]c
nnoremap [[ [c
" nnoremap <Leader>di :Gdiff<cr>
" nnoremap <Leader>gst :Gstatus<cr>
" nnoremap <Leader>dup :diffupdate<cr>


autocmd BufWritePre * :%s/\s\+$//e
set viminfo='100,\"2500,:200,%,n~/.nviminfo

set nu
set updatetime=200
set relativenumber
set shiftwidth=8
set noswapfile
set termguicolors
set background=light
colorscheme molokai
set cursorline
set showmatch
set wildmode=longest,list,full
set wildmenu
set inccommand=split
set autowrite

" airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let g:has_fugitive=1

if has('statusline')
  set laststatus=2
  set statusline=%<%f\                    " Filename
  set statusline+=%w%h%m%r                " Options
  if g:has_fugitive == 1
    set statusline+=%{fugitive#statusline()}
  endif
  set statusline+=\ [%{&ff}/%Y]           " Filetype
  set statusline+=\ [%{getcwd()}]         " Current dir
  set statusline+=%=%-16.(%l,%cV%)\ %p%%  " Right aligned file nav info
endif

au BufRead,BufNewFile *.dylan set filetype=dylan tabstop=2 shiftwidth=2
au BufRead,BufNewFile *.lid   set filetype=dylanlid
au BufRead,BufNewFile *.intr  set filetype=dylanintr
au FileType dylan set tabstop=2
"
"    else
"        return "\<C-N>"
"    endif
"endfunction
"
"" power tab
"imap <silent><expr><tab> TabWrap()
"
"" Enter: complete&close popup if visible (so next Enter works); else: break undo
" inoremap <silent><expr> <Cr> pumvisible() ?
 "        \ deoplete#mappings#close_popup() : "<C-g>u<Cr>"

"" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <M-Space> deoplete#mappings#manual_complete()

"" Escape: exit autocompletion, go to Normal mode
" inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

" This function mimics the vscode (I think) hover action for go symbols using
" coc.

nmap <F7> :call HoverFunc()<CR>

function! HoverFunc() abort
	call CocActionAsync('doHover')
endfunction

" =================END============

" ++++++++++++ Free Software License Macros ++++++++++++

function! MitHeader()
	call append(0, "/* Copyright 2018-2019 Kdevb0x Ltd.")
	call append(1, "*")
	call append(2, "* Permission is hereby granted, free of charge, to any person obtaining")
	call append(3, "* a copy of this software and associated documentation files \(the")
	call append(4, "* \"Software\"\), to deal in the Software without restriction, including")
	call append(5, "* without limitation the rights to use, copy, modify, merge, publish,")
	call append(6, "* distribute, sublicense, and/or sell copies of the Software, and to")
	call append(7, "* permit persons to whom the Software is furnished to do so, subject to")
	call append(8, "* the following conditions:")
	call append(9, "* ")
	call append(10, "* The above copyright notice and this permission notice shall be")
	call append(11, "* included in all copies or substantial portions of the Software.")
	call append(12, "* ")
	call append(13, "* THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND,")
	call append(14, "* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF")
	call append(15, "* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND")
	call append(16, "* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE")
	call append(17, "* LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION")
	call append(18, "* OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION")
	call append(19, "* WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.")
	call append(20, "*/")
endfunction

function! MitPreamble()
 	call append(0, "// Copyright (C) 2018-2019 Kdevb0x Ltd.")
 	call append(1, "// This software may be modified and distributed under the terms")
 	call append(2, "// of the MIT license.  See the LICENSE file for details.")
	call append(3, "")
 endfunction

" BSD 3-Clause License

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
	call append(0, "// Copyright 2019 kdevb0x Ltd. All rights reserved.")
	call append(1, "// Use of this source code is governed by the BSD 3-Clause license")
	call append(2, "// The full license text can be found in the LICENSE file.")
endfunction

function! CeCILLPreamble()
	call append(0, "// Copyright 2018 kdevb0x Ltd. All rights reserved.")
	call append(1, "// This software is governed by the CeCILL license under French law")
	call append(2, "// and abiding by the rules of distribution of free software.")
	call append(3, "// The full license text can be found in the LICENSE file.")
	call append(4, "")
endfunction

function! CeCILLHeader()
	call append(0, "/* © Copyright 2019 kdevb0x Ltd. All rights reserved.")
	call append(1, "* ")
	call append(2, "* This software is governed by the CeCILL  license under French law and")
	call append(3, "* abiding by the rules of distribution of free software.  You can  use, ")
	call append(4, "* modify and/ or redistribute the software under the terms of the CeCILL")
	call append(5, "* license as circulated by CEA, CNRS and INRIA at the following URL")
	call append(6, "* \"http://www.cecill.info\". ")
	call append(7, "* ")
	call append(8, "* As a counterpart to the access to the source code and  rights to copy,")
	call append(9, "* modify and redistribute granted by the license, users are provided only")
	call append(10, "* with a limited warranty  and the software's author,  the holder of the")
	call append(11, "* economic rights,  and the successive licensors  have only  limited")
	call append(12, "* liability. ")
	call append(13, "* ")
	call append(14, "* In this respect, the user's attention is drawn to the risks associated")
	call append(15, "* with loading,  using,  modifying and/or developing or reproducing the")
	call append(16, "* software by the user in light of its specific status of free software,")
	call append(17, "* that may mean  that it is complicated to manipulate,  and  that  also")
	call append(18, "* therefore means  that it is reserved for developers  and  experienced")
	call append(19, "* professionals having in-depth computer knowledge. Users are therefore")
	call append(20, "* encouraged to load and test the software's suitability as regards their")
	call append(21, "* requirements in conditions enabling the security of their systems and/or ")
	call append(22, "* data to be ensured and,  more generally, to use and operate it in the ")
	call append(23, "* same conditions as regards security. ")
	call append(24, "* ")
	call append(25, "* The fact that you are presently reading this means that you have had")
	call append(26, "* knowledge of the CeCILL license and that you accept its terms.")
	call append(27, "*/")
endfunction


nmap <F15> :call MitHeader()<CR>
nmap <F28> :call MitPreamble()<CR>
nmap <F27> :call BsdHeader()<CR>
nmap <F16> :call BsdPreamble()<CR>
nmap <F3> :call CeCILLPreamble()<CR>

" unicode middle dot (middot) for Go assembly
inoremap <Leader>. ·

" " fix multicursor interaction with deoplete.
" function! Multiple_cursors_before()
"   if deoplete#is_enabled()
"     call deoplete#disable()
"     let g:deoplete_is_enable_before_multi_cursors = 1
"   else
"     let g:deoplete_is_enable_before_multi_cursors = 0
"   endif
" endfunc
" function! Multiple_cursors_after()
"   if g:deoplete_is_enable_before_multi_cursors
"     call deoplete#enable()
"   endif
" endfunc
"
