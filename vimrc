" ---------------------------------------------------------------------
"                                                                Custom
" Display line number and relative line numbers
set number
set relativenumber
set encoding=UTF-8

" Set backspace
set bs=2

" Set Tab
set tabstop=2

" When a file has been detected to have been changed outside of Vim
" and it has not been changed inside of Vim,
" automatically read it again.
set autoread

" Highlight all search matches
set hlsearch

" Set NO line wrap
set nowrap

" Move between splits
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j

" Spit Vertically
nmap <C-s> <C-w>s

" Split Horizontally
nmap <C-v> <C-w>v

" Start Macvim in fullscreen
set fu

" Set leader to Spacebar
let mapleader = "\<Space>"

" Set Macvim font
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h16
" set guifont=Source\ Code\ Pro\ for\ Powerline:h16
" set guifont=DejaVu\ Sans\ Mono\ Bold\ Nerd\ Font\ Complete:h16
" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Color scheme
syntax enable
set background=dark
colorscheme evening
" colorscheme Tomorrow-Night

" ---------------------------------------------------------------------
"                                                               Plugins

call plug#begin()
 Plug 'preservim/nerdtree'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plug 'ryanoasis/vim-devicons'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'junegunn/fzf.vim'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets' " Adds loads of Ruby Snippets - check with :Snippets
 Plug 'markstory/vim-zoomwin' "A simple vim plugin to focus or zoom in on a single split window and be able to restore it again.
 Plug 'preservim/tagbar' " Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure.
call plug#end()


" ---------------------------------------------------------------------
"                                                       NERDTree config

let NERDTreeShowHidden=1

nnoremap <C-t> :NERDTreeToggle<CR>
"
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let NERDTreeIgnore=[
    \ '.git$[[dir]]',
    \ '.vscode$[[dir]]',
    \ '.idea$[[dir]]',
    \ '.DS_Store$[[file]]',
    \ '.swp$[[file]]'
\ ]

" ---------------------------------------------------------------------
"                                                   vim-devicons config


" ---------------------------------------------------------------------
"                                                    vim-airline config

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty='⚡'

"
" Open tabline on top
let g:airline#extensions#tabline#enabled = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab
" ---------------------------------------------------------------------
"                                                            FZF config
nnoremap <C-p> :Files!<Cr>
nnoremap <C-g> :Rg!<Cr>
nnoremap <silent><leader>b :History!<CR>
