" Enable ALE
let g:ale_enabled = 1

let g:ale_completion_enabled = 0

" Linting settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1

" Fixers to run when you call :ALEFix
let g:ale_fixers = {
      \ 'lua': ['stylua'],
      \ 'ruby': ['standardrb'],
      \ 'vue': ['prettier'],
\ }

" Enable auto fixing on save
let g:ale_fix_on_save = 1

" Recommended settings for using with ALE's linting
set updatetime=300
let g:ale_completion_enabled = 1

" Configure linters
let g:ale_linters = {
      \ 'lua': ['stylua'],
      \ 'ruby': ['standardrb'],
      \ 'vue': ['volar'],
\ }
