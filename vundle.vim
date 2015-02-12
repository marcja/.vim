": Title        : vundle.vim
": Author       : "Marc Jacobs" <vim.git@marcja.com>
": Description  : Personal environment file for interactive vim.
": Options      : None

"-------------------------------------------------------------------------------
" vundle bootstrap
"-------------------------------------------------------------------------------
" from: https://github.com/ryanss/vim
" Automatically setup Vundle on first run
if !isdirectory(expand("~/.vim/bundle/vundle"))
  call system("git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle")
endif

"-------------------------------------------------------------------------------
" vundle boilerplate
"-------------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/

"-------------------------------------------------------------------------------
" install bundles
"-------------------------------------------------------------------------------
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/vundle'

Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'trapd00r/vim-syntax-vidir-ls'

" Automatically install bundles on first run
"if !isdirectory(expand("~/.vim/bundle/vim-airline"))
"  execute 'silent BundleInstall'
"  execute 'silent q'
"endif

call vundle#end()

"-------------------------------------------------------------------------------
" vundle boilerplate
"-------------------------------------------------------------------------------
filetype plugin indent on