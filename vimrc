": Title        : vimrc
": Author       : "Marc Jacobs" <vim.git@marcja.com>
": Description  : Personal environment file for interactive vim.
": Options      : None

"-------------------------------------------------------------------------------
" vundle
"-------------------------------------------------------------------------------
runtime vundle.vim

"-------------------------------------------------------------------------------
" colorscheme
"-------------------------------------------------------------------------------
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

if &t_Co >= 256 || has('gui_running')
  set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h12
  set background=dark
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  colorscheme solarized
endif


"-------------------------------------------------------------------------------
" options
"-------------------------------------------------------------------------------
"  1 important
set nocompatible
set pastetoggle=<F2>

"  2 moving around, searching and patterns
set ignorecase
set incsearch
set smartcase
"
"  4 displaying text
set hlsearch
set list
set listchars=tab:▸\ ,trail:˽,eol:¬
set number
set scrolloff=3

if v:version >= 703
  set colorcolumn=81
  set relativenumber
endif

if has('gui_running')
  set cursorline
endif

"  5 syntax, highlighting and spelling
if has('autocmd')
  filetype plugin indent on
endif

"  6 multiple windows
set hidden
set laststatus=2
set splitbelow

"  8 terminal
set title

"  9 using the mouse
set mouse=a

" 10 gui
if has('gui')
  set guioptions-=T
  set guioptions-=r
  set guioptions-=l
endif

if has('gui_macvim')
  let macvim_hig_shift_movement=1
  set macmeta
endif

" 12 messages and info
set ruler
set showcmd
set showmode
set visualbell

" 13 selecting text
set clipboard=autoselect

" 14 editing text
set backspace=indent,eol,start
set formatoptions+=rn
set nowrap
set showmatch
set smarttab
set textwidth=79

if has('macunix')
  set dictionary+=/usr/share/dict/words
endif

" 15 folding
set foldcolumn=2

" 15 tabs and indenting
set autoindent
set copyindent
set expandtab     "expand tabs to spaces
set shiftround    "round indent to multiple of 'shiftwidth'
set shiftwidth=2  "number of spaces to use for each step of (auto)indent
set softtabstop=2 "number of spaces that a <Tab> counts for while performing editing operations
set tabstop=2     "number of spaces that a <Tab> in the file counts for

" 19 reading and writing files
set autoread
set modelines=0
set wildmenu
set wildmode=list:longest,full

" 20 the swap file
set directory=/var/tmp,/tmp
set noswapfile

" 21 command line editing
set history=1000
if v:version >= 703
  set viewdir=~/.vim/.view
  set undodir=~/.vim/.undo
  set undofile
endif

" 25 multi-byte characters
set encoding=utf-8
set termencoding=utf-8

" 26 various
set gdefault

"-------------------------------------------------------------------------------
" mappings
"-------------------------------------------------------------------------------
" change mapleader from \ to ,
let mapleader=','
let maplocalleader=';'

" another alternative to get out of insert mode is C-[
inoremap jk <Esc>

noremap <C-h> ^
noremap <C-l> $

nnoremap / /\v
vnoremap / /\v
nnoremap <silent> <leader>. :nohlsearch<cr>
nnoremap <silent> <BS> :nohlsearch<cr>
nnoremap <tab> %
vnoremap <tab> %
noremap! <C-BS> <C-W>

" split windows
nnoremap <silent> <leader>ws :split<CR>
nnoremap <silent> <leader>we :vsplit<CR>
nnoremap <silent> <leader>wn :new<CR>
nnoremap <silent> <leader>wo :only<CR>

" navigate windows
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wl <C-w>l

" quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" navigate tabs
nnoremap <leader>th  :tabfirst<CR>
nnoremap <leader>tj  :tabprev<CR>
nnoremap <leader>tk  :tabnext<CR>
nnoremap <leader>tl  :tablast<CR>
nnoremap <leader>te  :tabedit<Space>
nnoremap <leader>tn  :tabnext<Space>
nnoremap <leader>tm  :tabmove<Space>
nnoremap <leader>tx  :tabclose<CR>

"-------------------------------------------------------------------------------
" autocmd
"-------------------------------------------------------------------------------
if has('autocmd')
  augroup vim_files "{{{
    autocmd!

    " Bind <F1> to show the keyword under cursor
    " general help can still be entered manually, with :h
    autocmd filetype vim noremap  <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
  augroup end "}}}
endif

"-------------------------------------------------------------------------------
" plugins
"-------------------------------------------------------------------------------
" airblade/vim-gitgutter
highlight clear SignColumn

" bling/vim-airline
let g:airline_powerline_fonts = 1

" kien/ctrlp.vim
nnoremap sk :CtrlP<CR>
nnoremap sj :CtrlPBuffer<CR>

" sjl/gundo.vim
nnoremap <F5> :GundoToggle<CR>

" rking/ag.vim
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore .git5_specs
      \ --ignore review
      \ -g ""'
let g:ackprg = 'ag --vimgrep'

" Lokaltog/vim-easymotion
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

" syntastic
let g:syntastic_javascript_closurecompiler_script = 'closure-compiler'
let g:syntastic_javascript_checkers = ['closurecompiler', 'gjslint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
