set completeopt-=preview " Remove auto opening of window

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-fugitive'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --rust-completer --clang-completer --system-libclang' }

Plug 'lervag/vimtex'

Plug 'ntpeters/vim-better-whitespace'

Plug 'mhinz/vim-grepper'

Plug 'tpope/vim-unimpaired'

Plug 'dyng/ctrlsf.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users. I added this because you need a snippet engine
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'


" Markdown
Plug 'kannokanno/previm'

" Colorscheme
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'baines/vim-colorscheme-thaumaturge'

" Initialize plugin system
call plug#end()

filetype plugin indent on


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

set colorcolumn=100
set laststatus=2

" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"
nnoremap <C-o> :LspDefinition<CR>
nnoremap <C-k> :LspDocumentFormat<CR>
nnoremap <C-t> :LspDocumentRangeFormat<CR>

" Completion options from https://github.com/hrsh7th/nvim-cmp/
set completeopt=menu,menuone,noselect

let g:strip_whitespace_on_save = 0
let g:strip_whitespace_confirm = 0
autocmd BufWritePre * :StripWhitespaceOnChangedLines"

source ~/.config/nvim/cmp.lua
source ~/.config/nvim/lsp.lua
