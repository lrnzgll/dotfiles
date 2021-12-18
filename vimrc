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
 Plug 'tpope/vim-fugitive'
 Plug 'mattn/emmet-vim'
 Plug 'vim-test/vim-test'
 Plug 'tpope/vim-dispatch'
 Plug 'markstory/vim-zoomwin'
 Plug 'tpope/vim-rails'
 Plug 'w0rp/ale'
call plug#end()

" Use the space key as our leader. Put this near the top of your vimrc
let mapleader = "\<Space>"
" Leader shortcut
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent> ff :let a='# frozen_string_literal: true'\|put=a<cr>
""
""
""
" Vim test conf
nmap <silent><leader>s :TestFile<CR>
let test#strategy = "dispatch"
""
set number
set encoding=UTF-8
set bs=2
set tabstop=2
set autoread
"
"VIm KeyBindings
"
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(1) * 2/3)<CR>
nnoremap <C-a> <C-w>>
nnoremap <C-b> <C-w><
"
"NERDTree Settings
"
let NERDTreeShowHidden=1

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

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['brakeman','rubocop'],
\}
let g:ale_fixers = {
\		'ruby': ['rubocop'],
\}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1

" Skeleton for .rb files
augroup ruby
    " Remove all existing autocommands in the group
    au!
    au BufNewFile *.rb 0r ~/.vim/skeletons/ruby.skel
augroup end

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

highlight DiffText ctermfg=LightGray ctermbg=DarkGray guifg=#dadada guibg=#000000
highlight DiffAdd ctermfg=253 ctermbg=DarkGray guifg=#dadada guibg=#000000
highlight DiffChange ctermfg=253 ctermbg=DarkGray guifg=#dadada guibg=#000000

