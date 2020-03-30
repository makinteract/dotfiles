" General
set number	    " Show line numbers
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set showmatch	    " Highlight matching brace
set spell	    " Enable spell-checking
"set visualbell	    " Use visual bell (no beeping)

set hlsearch	    " Highlight all search results
set smartcase	    " Enable smart-case search
set ignorecase	    " Always case-insensitive
set incsearch	    " Searches for strings incrementally

set autoindent	    " Auto-indent new lines
set expandtab	    " Use spaces instead of tabs
set shiftwidth=4    " Number of auto-indent spaces
set smartindent	    " Enable smart-indent
set smarttab	    " Enable smart-tabs
set softtabstop=4   " Number of spaces per Tab

" Advanced
set ruler	                " Show row and column ruler information
set autochdir	                " Change working directory to open buffer
set undolevels=1000	        " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'itchyny/lightline.vim'    

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
 
" PLUGINS
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'  "surround.vim: quoting/parenthesizing made simple
Plug 'scrooloose/nerdtree'
"Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'majutsushi/tagbar'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }

" Initialize plugin system
call plug#end()


" Color scheme and GUI
syntax on
set t_Co=256
"colorscheme nord
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme onehalfdark
"let g:airline_theme='onehalfdark'
"set background=dark
"let g:lightline.colorscheme='onehalfdark'
":colorscheme dracula
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ }

" Mouse
if has('mouse')
    set mouse=a
endif


if has("macunix")
    set clipboard=unnamed
elseif has("unix")
    set clipboard=unnamedplus
endif
:imap ii <Esc>


set relativenumber
set laststatus=2
"let g:lightline = { 'colorscheme': 'darcula' }
