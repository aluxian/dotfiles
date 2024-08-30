if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'dag/vim-fish'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dadbod'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
call plug#end()

set nocompatible

filetype plugin on
filetype indent on
syntax on
colorscheme gruvbox

set rtp+=/usr/local/opt/fzf

set ignorecase
set smartcase

set lazyredraw

set clipboard=unnamed
set autoread

set autoindent
set backspace=indent,eol,start
set complete-=i

set number
set ruler

set updatetime=500

set laststatus=2

set exrc
set secure

set background=dark

let g:netrw_liststyle = 3
let g:netrw_banner = 0

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_termcolors = 256
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

let g:lightline = {'colorscheme': 'gruvbox'}
