" General
set number	    " Show line numbers
set wrap
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++    " Wrap-broken line prefix
"set textwidth=100   " Line wrap (number of cols)
set textwidth=0
set wrapmargin=0

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install PLug if not present on the system
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" The powerline and the name of the branch for GIT to display in the powerline
Plug 'itchyny/lightline.vim'    
Plug 'itchyny/vim-gitbranch'
"Plug 'jreybert/vimagit'
" NERDtree
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Org-mode support
Plug 'jceb/vim-orgmode'
Plug 'ryanoasis/vim-devicons'
" Start page
Plug 'mhinz/vim-startify'
" Add Processing support
Plug 'sophacles/vim-processing'
" Creating comments
Plug 'scrooloose/nerdcommenter'
Plug 'haya14busa/is.vim'
" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'
" FZF
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
" Initialize plugin system
call plug#end()





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

"""""""""""""""""""""""""""""""""""""""
" NERDtree
""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"



""""""""""""""""""""""""""""""""""""
" Search and replace
""""""""""""""""""""""""""""""""""""
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn


" .............................................................................
" junegunn/fzf.vim from https://github.com/nickjj/dotfiles/blob/master/.vimrc 
" .............................................................................

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)
