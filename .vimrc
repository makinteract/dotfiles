" General
set number	    " Show line numbers
set wrap
set linebreak	    " Break lines at word (requires Wrap lines)
set showbreak=+++    " Wrap-broken line prefix
"set textwidth=100   " Line wrap (number of cols)
set textwidth=0
set wrapmargin=0

set showmatch	    " Highlight matching brace
"set spell	    " Enable spell-checking
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
set encoding=UTF-8              " Necessary to show Unicode glyphs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Multi language suppor
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'

" Prettify - <Leader>p
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/0.x'
  \ }

" SuperTab
Plug 'ervandew/supertab'

" The lightline and the name of the branch for GIT to display in it
Plug 'itchyny/lightline.vim'    
Plug 'itchyny/vim-gitbranch'

" NERDtree
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Org-mode support
"Plug 'jceb/vim-orgmode'

" Start page
Plug 'mhinz/vim-startify'

" Add Processing support
Plug 'sophacles/vim-processing'

" Creating comments
Plug 'scrooloose/nerdcommenter'

" Modify * to also work with visual selections.
Plug 'nelstrom/vim-visual-star-search'
" Clear highlights selection
Plug 'haya14busa/is.vim'

" FZF
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" CTRLSF
 Plug 'dyng/ctrlsf.vim'

" CSS colors
Plug 'ap/vim-css-color'

" Syntax
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'

" Coloring parenthesis
Plug 'kien/rainbow_parentheses.vim'

" Undo visual tree
Plug 'sjl/gundo.vim'

" Autocmplete
Plug 'valloric/youcompleteme'

" Icons sets for NERDtree
Plug 'ryanoasis/vim-devicons'

" Change the font size <Leader><Leader> and the + or - multiple times
Plug 'drmikehenry/vim-fontsize'

" Git support
Plug 'tpope/vim-fugitive'

" Tagbar
Plug 'majutsushi/tagbar'

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
" Lightline 
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


" Allow navigation in sof-wrapped lines: make j and k work normally for soft wrapped lines
noremap <buffer> j gj
noremap <buffer> k gk


"""""""""""""""""""""""""""""""""""""""""
" Tabs 
"""""""""""""""""""""""""""""""""""""""""
" Ctrl+T + n(new) | + c (close) | + Ctrl-t (next tab)
noremap <C-T>s :tabe <Bar> Startify<CR>
noremap <C-T>n :tabnew<CR>
noremap <C-T>q :tabc<CR>
noremap <C-T><C-T> :tabnext<CR>

" Ctrl tab enabled in gVim
:nmap <C-tab> :tabnext<CR>
:nmap <C-S-tab> :tabprevious<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-tab> <ESC>:tabnext<CR>i
:imap <C-S-tab> <ESC>:tabprevious<CR>i


""""""""""""""""""""""""""""""""""""""""
" Processing 
" """"""""""""""""""""""""""""""""""""""
:let g:processing_fold = 1


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

" Launch fzf with CTRL+P to search from current directory
" Launch fzf with ALT+P to search from home directory
nnoremap <silent> <C-p> :FZF -m ./ <CR>
nnoremap <silent> <A-p> :FZF -m ~/ <CR>
let $FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"

" Map a few common things to do with FZF.
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = { "type": "style"}

"let g:syntastic_quiet_messages = { "level": "warnings" }
"let g:syntastic_python_pylint_quiet_messages = { "level" : [] }

" Rainbow parenthesis defaults
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


""""""""""""""""""""""""""""""""
" Comments
""""""""""""""""""""""""""""""""
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

""""""""""""""""""""""""""""""""
" Undo
""""""""""""""""""""""""""""""""
if has('python3')
    let g:gundo_prefer_python3 = 1          " anything else breaks on Ubuntu 16.04+
endif
nnoremap <F5> :GundoToggle<CR>


"""""""""""""""""""""""""""""""""""""""""
" Selection
"""""""""""""""""""""""""""""""""""""""""
" CTRL+L to deselect selection
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>



" gVIM remove toolbar and menu
set guioptions -=m
set guioptions -=T

set guifont=BlexMono\ Nerd\ Font\ 21
"set guifont=DejaVu\ Sans\ Mono\ 21
"set guifont=DejaVuSansMono\ Nerd\ Font\ 18

" Toggle spell check.
map <F6> :setlocal spell!<CR>
" Toggle relative line number
nmap <F5> :set invrelativenumber<CR>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk



" Fix common typos 
ab teh the

" Select and turn lowercase or uppercase
command Uppercase s/\%V[a-z]/\U&/g 
command Lowercase s/\%V[a-z]/\L&/g 

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Copy line with ctrol + up or down
nnoremap <C-Down> :t .<CR>==
nnoremap <C-Up> :t .-1<CR>==
inoremap <C-j> <Esc>:t .<CR>==gi
inoremap <C-k> <Esc>:t .-1<CR>==gi


" Fixing the problem with ALT key
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50


" Cancel the other splits except the current one
nnoremap <C-X>1 :only<CR>


" Ctrl SF plugin
nmap <leader>a <Plug>CtrlSFCwordPath -W<CR>
nmap <leader>A :CtrlSF -R ""<Left>
nmap <leader>c :CtrlSFFocus<CR>
nmap <leader>C :CtrlSFToggle<CR>

if has("macunix")
  let g:ctrlsf_ackprg = '/usr/local/bin/rg'
elseif has("unix")
  let g:ctrlsf_ackprg = '/usr/bin/rg'
endif

let g:ctrlsf_winsize = '33%'
let g:ctrlsf_auto_close = 0
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_auto_focus = {
    \ 'at': 'start',
    \ }


"Set the the file's directory as current directory
nnoremap <leader><Space> :cd %:p:h




" Tab menu expanded
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*.DS_STORE,*~:


" Resize splits in all tabs upon window resize
" https://vi.stackexchange.com/a/206
autocmd VimResized * Tabdo wincmd =

" Use F2 to highlight extra white space
set lcs+=space:·
nmap <F2> :set invlist<CR>
imap <F2> <ESC>:set invlist<CR>a


" Use K to show vim documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"Syntax
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_javascript_checkers = ['jsl']

" Tagbar F8
nmap <F8> :TagbarToggle<CR>
