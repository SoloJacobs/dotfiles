" Python config
let b:ale_linters = []
" let g:ale_python_auto_pipenv = 1
" let g:ale_python_pylint_options = '--rcfile ~/git/check_mk/.pylintrc'
" let g:ale_python_flake8_options = '--config ~/git/check_mk/.flake8 --max-complexity=10 -v'
" let g:ale_python_mypy_executable = 'dmypy run --'
" let g:ale_python_mypy_auto_pipenv = 1
let b:ale_fixers =  ['black', 'isort', 'trim_whitespace', 'remove_trailing_lines']
let b:ale_fix_on_save = 1
