" ---------------------------------------------------------------------
"                                                                Custom
" Mouse resizing :-)
set mouse+=a
"-set ttymouse=xterm2
set ttymouse=sgr

set cmdheight=1

" Display line number and relative line numbers
set number
" set relativenumber

set encoding=UTF-8

" Set backspace
set bs=2

" Set Tab
set tabstop=2
set shiftwidth=2
set expandtab

" When a file has been detected to have been changed outside of Vim  and it has not been changed inside of Vim,
" automatically read it again.
set autoread

" Highlight all search matches
set hlsearch

" Set NO line wrap
" set nowrap
set wrap

" Move between splits
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j

" Spit Vertically
nmap <C-s> <C-w>s

" Split Horizontally
" nmap <C-v> <C-w>v

" Set leader to Spacebar
let mapleader = "\<Space>"

" Set Macvim font
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h16
" set guifont=Source\ Code\ Pro\ for\ Powerline:h16
" set guifont=DejaVu\ Sans\ Mono\ Bold\ Nerd\ Font\ Complete:h16
" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Folding strategy
set foldmethod=syntax
set foldlevel=99

" Terminal shortcut

map <Leader>u :vert term ++close<cr>
tmap <Leader>u :vert term ++close<cr>

" ---------------------------------------------------------------------
"                                                               Plugins

call plug#begin()
Plug 'chrisbra/csv.vim'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " Adds loads of Ruby Snippets - check with :Snippets
Plug 'markstory/vim-zoomwin' "A simple vim plugin to focus or zoom in on a single split window and be able to restore it again.
Plug 'vim-autoformat/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters
Plug 'vim-test/vim-test'
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-unimpaired' " Handy brackets mappings
Plug 'tpope/vim-surround' " Delete/change/add parentheses/quotes/...
Plug 'tpope/vim-rails'
Plug 'elixir-editors/vim-elixir'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ---------------------------------------------------------------------
"                                                             Ultisnips
let g:UltiSnipsExpandTrigger="§"

let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" ---------------------------------------------------------------------
"                                                            Coloscheme

if has("gui_running")
  autocmd vimenter * ++nested colorscheme gruvbox
  set background=dark
else
  autocmd vimenter * ++nested colorscheme gruvbox
endif

" ---------------------------------------------------------------------
"                                                       NERDTree config

let NERDTreeShowHidden=1

nnoremap <C-t> :NERDTreeToggle %<CR>
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

let g:airline#extensions#ale#enabled = 1

" ---------------------------------------------------------------------
"                                                            FZF config
nnoremap <C-p> :Files!<Cr>
nnoremap <C-g> :Rg!<Cr>
nnoremap <silent><leader>b :History!<CR>
nnoremap <C-b> :Buffers<Cr>

" ---------------------------------------------------------------------
"                                                            indentLine

let g:indentLine_bgcolor_gui = '#4b3b47'
let g:indentLine_char_list = [' ']

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

" --------------------------------------------------------------------
"                                                            vim-rails

nmap <silent><leader>c :Rails console<CR>

" -------------------------------------------------------------------
"  syntax highlight Elixir
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

" mix format
" autocmd BufWritePost *.exs,*.ex,*.heex silent :!mix format %
" ------------------------------------------------------------------
"                                                           coc.nvim
set pumheight=10
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" ----------------------------------------------------------------
"                                                              ALE
let g:ale_linters = {
\   'elixir': ['elixir-ls', 'mix', 'dogma'],
\   'ruby': ['standardrb', 'brakeman', 'cspell', 'reek'],
\   'scss': ['scsslint'],
\   'eruby': ['erblint'],
\}

let g:ale_fixers = {
\ 'html': ['prettier'],
\ 'elixir': ['mix_format'],
\ 'eelixir': ['mix_format'],
\ 'javascript': ['eslint'],
\ 'ruby': ['standardrb'],
\ 'eruby': ['erblint'],
\}

let g:ale_fix_on_save = 1
