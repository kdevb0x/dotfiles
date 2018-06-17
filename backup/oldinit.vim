scriptencoding utf-8

let g:mapleader = ','

let g:NERDTreeIgnore = ['\.pyc$']

let g:dein_dir = expand('~/.config/nvim/dein')
let g:dein_plugin_dir = expand('~/.config/nvim/bundles/')

if empty(glob(g:dein_dir))
  exec 'silent !mkdir -p '.g:dein_dir
  exec '!git clone git@github.com:Shougo/dein.vim '.g:dein_dir
endif

exec 'set runtimepath^='.g:dein_dir

if dein#load_state(g:dein_plugin_dir)
  call dein#begin(g:dein_plugin_dir)

  call dein#add(g:dein_dir)
  call dein#add('fatih/vim-go', { 'on_ft': 'go', 'rev': 'v1.17' })
  call dein#add('junegunn/fzf', { 'build': './install --no-update-rc --no-key-bindings --no-completion', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('junegunn/vim-easy-align')
  " call dein#add('rust-lang/rust.vim', { 'on_ft': 'rust' })
  call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
  call dein#add('sheerun/vim-polyglot')
  call dein#add('tomasr/molokai')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-fugitive')
  call dein#add('w0rp/ale')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  let g:deoplete#enable_at_startup = 1
  call dein#add('zchee/deoplete-go', {'unix': 'make'})
  call dein#add('cespare/vim-toml')
  call dein#add('godoctor/godoctor.vim')
  call dein#add('jodosha/vim-godebug')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable


" Path to python for neovim
let g:python3_host_prog = '/usr/bin/python'
let g:python3_host_skip_check = 1
set completeopt+=noinsert
set completeopt+=noselect
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = '/home/k/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
set nu
set relativenumber
set shiftwidth=8
set shell=bash

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
let g:go_auto_type_info = 1
let g:go_info_mode = 'gocode'
let g:go_term_enabled = 1
let g:go_list_type = 'quickfix'

" let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
au BufRead,BufNewFile *.dylan setf dylan
au BufRead,BufNewFile *.lid   setf dylanlid
au BufRead,BufNewFile *.intr  setf dylanintr

" autocmd vimenter * NERDTree
inoremap <C-Space> <C-x><C-o>
autocmd CursorMovedI * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif
autocmd InsertLeave * if pumvisible() == 0 && bufname("%") != "[Command Line]"|pclose|endif

au Filetype go nmap <leader>gdv <Plug>(go-doc-vertical)
au Filetype go nmap <leader>gd <Plug>(go-doc)
au Filetype go nmap <leader>gdh <Plug>(go-doc-split)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)

au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F12> <Plug>(go-def)

" Theming!
set termguicolors
set background=dark
colorscheme molokai

" Searching
set ignorecase
set showmatch
set smartcase
set wildmode=longest,list
set wildignore+=*/.git/*
set wildignore+=*/.svn/*
set wildignore+=*/Godeps/*
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*
nnoremap <silent> <Leader><space> :nohlsearch<cr>

set autowrite
set clipboard^=unnamed,unnamedplus
set completeopt=longest,menuone
set cursorline
set diffopt+=iwhite
set foldlevelstart=20
set foldmethod=syntax
set hidden
set inccommand=split
set linebreak
set listchars=tab:›—,trail:_,space:.
set modelines=1
set mouse=a
set nolist
set nowrap
set nowrapscan
set path+=**
set scrolloff=5
set sidescrolloff=5
set splitbelow
set splitright
set synmaxcol=1000
set timeoutlen=300

" Navigation
nnoremap <Leader>e :NERDTreeToggle<cr>
nnoremap <Leader>f :Files<cr>
nnoremap <Leader>g :grep<space>
nnoremap <Leader>b :Buffers<cr>

" Annoying typo fixes
nnoremap q: <nop>
nnoremap ; :

" Don't jump cursor when using * to search for word under cursor
nnoremap * *``

" Play q macro
nnoremap Q @q

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Opposite of J. Split line at current point.
nmap <M-j> i<CR><Esc>d^==kg_lD

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

" junegunn/vim-easy-align
vmap <Enter> <Plug>(EasyAlign)

" Remove trailing whitespace
nnoremap <Leader>w :%s/\s\+$//

" Auto handle paste-mode
nnoremap <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Arrow keys to resize vim splits
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" Return to previous edit point
nnoremap <BS> <C-^>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Delete erroneous [No Name] buffers
nnoremap <silent> <Leader>B :call g:buffers#CleanNoNameEmptyBuffers()<CR>

" In completion, arrow keys to select, enter to confirm
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" nnoremap <silent> <Leader>s :TagbarToggle<cr>

" Don't clutter directories with .swp files
silent !mkdir ~/.config/nvim/backup > /dev/null 2>&1
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

" Don't save backups of gpg asc files
set backupskip+=*.asc
set viminfo=

" Convenient editing of ascii-armoured encrypted files
augroup GPG
  autocmd!
  autocmd BufReadPost  *.asc :%!gpg -q -d
  autocmd BufReadPost  *.asc |redraw!
  autocmd BufWritePre  *.asc :%!gpg -q -e -a
  autocmd BufWritePost *.asc u
  autocmd VimLeave     *.asc :!clear
augroup END

" Mappings related to terminal buffers
tnoremap <Leader><Leader> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
