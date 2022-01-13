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
    Plug 'danilo-augusto/vim-afterglow'
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
let g:afterglow_italic_comments=1
let g:afterglow_blackout=1
colorscheme afterglow
autocmd vimenter * hi Normal ctermbg=NONE
autocmd vimenter * hi LineNr ctermbg=NONE
autocmd vimenter * hi SignColumn ctermbg=NONE


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
autocmd CursorHold * silent call CocActionAsync('highlight')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



""" KEYBINDINGS
" nvim
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>
imap <PageUp> <C-O><C-U><C-O><C-U>
imap <PageDown> <C-O><C-D><C-O><C-D>
set nostartofline

" coc
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>
nmap <silent><expr> <c-space> coc#refresh()
nmap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
nmap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gd        <Plug>(coc-definition)
nmap <silent> gy        <Plug>(coc-type-definition)
nmap <silent> gi        <Plug>(coc-implementation)
nmap <silent> gr        <Plug>(coc-references)
nmap <leader>rn         <Plug>(coc-rename)
nmap <silent><nowait> <space>`  :<C-u>CocList diagnostics<cr>
nmap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" fzf
nmap <silent> <leader><space> :Files<CR>
nmap <silent> <leader>a       :Buffers<CR>
nmap <silent> <leader>A       :Windows<CR>
nmap <silent> <leader>cc      :Commits<CR>
nmap <silent> <leader>cb      :BCommits<CR>
nmap <silent> <leader>l       :Lines<CR>
nmap <silent> <leader>/       :Rg<CR>
nmap <silent> <leader>?       :History<CR>
nmap <silent> <leader>ft      :Filetypes<CR>

