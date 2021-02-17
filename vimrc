" Plugins
call plug#begin()
 Plug 'preservim/nerdtree'
 Plug 'ryanoasis/vim-devicons'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plug 'editorconfig/editorconfig-vim'
 Plug 'mattn/emmet-vim'
 Plug 'Raimondi/delimitMate'
 Plug 'Yggdroot/indentLine'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'airblade/vim-rooter' 
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-sensible' 
call plug#end()


"VIm Settings

set number
set encoding=UTF-8
set bs=2
"
"VIm KeyBindings
"
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <c-s> <C-w>s
nmap <c-v> <C-w>v
"
"NERDTree Settings
"
"KeyBindings
"
nnoremap <C-t> :NERDTreeToggle<CR>
"
" Exit Vim if NERDTree is the only window left.
"
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"
"FZF KeyBindings
"
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty='⚡'

let g:airline_theme='tomorrow'
