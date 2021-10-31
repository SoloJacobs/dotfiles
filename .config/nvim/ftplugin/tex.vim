let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_automatic = 1
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
        \ 'background' : 1,
        \ 'build_dir' : '/tmp',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \   '-shell-escape',
        \ ],
\}

command! MoPDF silent execute "!cp /tmp/'%:t:r'.pdf '%:h'" | redraw!
