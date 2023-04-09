set completeopt-=preview " Remove auto opening of window

filetype plugin indent on

let mapleader = " "

source ~/.config/nvim/package_manager.lua

set termguicolors
colorscheme jellybeans

nnoremap <Leader>g :Grepper -tool rg -noopen -jump<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <BS> <C-o>

set colorcolumn=100
set laststatus=2

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
