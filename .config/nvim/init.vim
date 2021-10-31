set completeopt-=preview " Remove auto opening of window

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-fugitive'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --rust-completer --clang-completer --system-libclang' }

Plug 'lervag/vimtex'

Plug 'w0rp/ale'

Plug 'mhinz/vim-grepper'

Plug 'tpope/vim-unimpaired'

Plug 'dyng/ctrlsf.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/vim-lsp-ale'
Plug 'mattn/vim-lsp-settings'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Markdown
Plug 'kannokanno/previm'

" Colorscheme
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'zanglg/nova.vim'
Plug 'baines/vim-colorscheme-thaumaturge'

" Initialize plugin system
call plug#end()

" https://vi.stackexchange.com/questions/25149/advice-to-add-set-nocompatible-as-first-line-of-vimrc
if &compatible
  " Vim defaults to `compatible` when selecting a vimrc with the command-line
  " `-u` argument. Override this.
  set nocompatible
endif

filetype plugin indent on

set clipboard=unnamedplus


set termguicolors
colorscheme jellybeans

" Alias
" [https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work#7078429]
command! Wsudo w !sudo tee % >/dev/null
command! Compile w| !g++ % && ./a.out
command! MoPDF silent execute "!cp /tmp/'%:t:r'.pdf '%:h'" | redraw!
command! F12 execute "!cd '%:p:h'; /home/solo/git/zeug_cmk/bin/f12" 

let mapleader = " "

nnoremap <Leader>* :Grepper -tool ag -cword -noprompt<CR>
nnoremap <Leader>g :Grepper -tool git -noopen -jump<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <BS> <C-o>

" This allows for vim to automatically save folds and open them upon
" closing the file
" autocmd BufWinLeave * if expand("%") != "" | mkview | endif
" autocmd BufWinEnter * if expand("%") != "" | loadview | endif

" YCM configuration
" uses config file as suggested by https://jonasdevlieghere.com/a-better-youcompleteme-config/
let g:ycm_extra_conf_globlist = ['/home/solo/git/check_mk/.ycm_extra_conf.py']
let g:ycm_filetype_blacklist = {
      \ 'vimwiki': 1,
      \ 'python' : 1
      \}

set textwidth=100
set colorcolumn=100
set laststatus=2

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" See https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8'],
\  	  'plugins': {
\            'pycodestyle': {
\		'enabled': v:false
\	      },
\            'pyflakes': {
\		'enabled': v:false
\	      },
\            'flake8': {
\		'enabled': v:true,
\               'config' : '.flake8'
\	      }
\	   }
\       }
\     }
\   },
\}

let g:ale_python_pylsp_options = '-vv --log-file=/tmp/pylsp.log'

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

nnoremap <C-o> :LspDefinition<CR>
nnoremap <C-k> :LspDocumentFormat<CR>
nnoremap <C-t> :LspDocumentRangeFormat<CR>

" Autocomplete binding
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
