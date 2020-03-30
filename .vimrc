" General
set number	    " Show line numbers
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set showmatch	    " Highlight matching brace
set spell	    " Enable spell-checking
"set visualbell	    " Use visual bell (no beeping)
set noerrorbells

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
set encoding=UTF-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
Plugin 'jreybert/vimagit'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'jceb/vim-orgmode'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mhinz/vim-startify'
Plugin 'sophacles/vim-processing'
Plugin 'itchyny/vim-gitbranch'

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
 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme and GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme onehalfdark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse and clipboard
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('mouse')
    set mouse=a
endif


if has("macunix")
    set clipboard=unnamed
elseif has("unix")
    set clipboard=unnamedplus
endif





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
      
      
" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

syntax enable   
set relativenumber
let g:rehash256 = 1

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

" hitting jj will jump out of insert mode
inoremap jj <esc>

" Make j and k work normally for soft wrapped lines
noremap <buffer> j gj
noremap <buffer> k gk


"""""""""""""""""""""""""""""""""""""""""
" Tabs 
"""""""""""""""""""""""""""""""""""""""""
noremap <C-H> :tabp<CR>
noremap <C-L> :tabn<CR>
noremap <C-J> :tabc<CR>
noremap <C-K> :tabe <Bar> Startify<CR>

""""""""""""""""""""""""""""""""""""""""
" Processing 
" """"""""""""""""""""""""""""""""""""""
:let g:processing_fold = 1


set guifont=IBM\ Plex\ Mono\ 25
"set guifont=JetBrains\ Mono\ 25
"set guifont=DroidSansMono\ Nerd\ Font\ 20

