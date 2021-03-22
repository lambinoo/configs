set list
set number
set hidden
set cmdheight=2
set nocompatible
set updatetime=300
set signcolumn=yes
set shortmess+=c
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set expandtab
let g:mapleader = "\<Space>"

call plug#begin("~/.vim/plugged")    
    Plug 'rust-lang/rust.vim'
    Plug 'cespare/vim-toml'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'neomake/neomake'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()



" Theme
    set background=dark
    colorscheme gruvbox
    hi Normal guibg=NONE ctermbg=NONE

" NERDTree
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeAutoDeleteBuffer = 1
    map <C-l> :NERDTreeToggle<CR>
    autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
    let g:fzf_nvim_statusline = 0
    let g:fzf_buffers_jump = 1

" coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" neomake
call neomake#configure#automake('w')



""" KEYBINDINGS
" coc
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" fzf
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a       :Buffers<CR>
nnoremap <silent> <leader>A       :Windows<CR>
nnoremap <silent> <leader>cc      :Commits<CR>
nnoremap <silent> <leader>cb      :BCommits<CR>
nnoremap <silent> <leader>l       :Lines<CR>
nnoremap <silent> <leader>/       :Ag<CR>
nnoremap <silent> <leader>?       :History<CR>
nnoremap <silent> <leader>ft      :Filetypes<CR>

