" Python config
" let g:deoplete#enable_at_startup = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_disable_signature_help = 1

" let g:syntastic_python_checkers = ['pylint', 'mypy']
let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
