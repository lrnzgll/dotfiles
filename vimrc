" ---------------------------------------------------------------------
"                                                                Custom
set cmdheight=1

" Display line number and relative line numbers
set number
" set relativenumber

set encoding=UTF-8

" Set backspace
set bs=2

" Set Tab
set tabstop=1
set shiftwidth=1
set expandtab

" When a file has been detected to have been changed outside of Vim " and it has not been changed inside of Vim,
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
" nmap <C-v> <C-w>v

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
 Plug 'vim-syntastic/syntastic' " Syntax checking hacks for vim
 Plug 'ryanoasis/vim-devicons'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'junegunn/fzf.vim'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets' " Adds loads of Ruby Snippets - check with :Snippets
 Plug 'markstory/vim-zoomwin' "A simple vim plugin to focus or zoom in on a single split window and be able to restore it again.
 Plug 'preservim/tagbar' " Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure.
 Plug 'Yggdroot/indentLine' " A vim plugin to display the indention levels with thin vertical lines
 Plug 'vim-autoformat/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters
 Plug 'vim-test/vim-test'
 Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
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

" ---------------------------------------------------------------------
"                                                            indentLine

let g:indentLine_bgcolor_gui = '#4b3b47'
let g:indentLine_char_list = [' ']

"" ---------------------------------------------------------------------
""                                                             Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_ruby_rubocop_args =  '-c /Users/lorenzogalli/dev/Charlie/.rubocop.yml'
let g:syntastic_ruby_rubocop_exec = '/Users/lorenzogalli/.rbenv/versions/2.7.5/lib/ruby/gems/2.7.0/gems/rubocop-0.93.1/lib/rubocop.rb'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
""
" ---------------------------------------------------------------------
"                                                        vim-autoformat
noremap <silent><leader>f :Autoformat<CR>

" ---------------------------------------------------------------------
"                                                              vim-test

let test#strategy = "vimterminal"

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ---------------------------------------------------------------------
"                                                          vim-fugitive

set statusline+=%{FugitiveStatusline()}

