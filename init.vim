syntax on

set clipboard+=unnamedplus
set noshowmatch
set formatoptions-=cro
set notermguicolors
set ma
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set updatetime=4000
set expandtab
set smartindent
set nu
set number
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode

call plug#begin('~/.config/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'

call plug#end()
command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <leader>p :GFiles<CR>
nnoremap <leader>rt :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>r :Rg<SPACE>
nnoremap <leader>gr :CocSearch 
nnoremap <leader>1 1gt<CR>
nnoremap <leader>2 2gt<CR>
nnoremap <leader>3 3gt<CR>
nnoremap <leader>4 4gt<CR>
nnoremap <leader>5 5gt<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>+ :vertical resize +5<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
nnoremap <leader>- :vertical resize -5<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.8/bin/python3.8'
let g:loaded_python_provider = 0

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
let g:airline_powerline_fonts = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
set background=dark
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-H>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
nmap <leader>gs :G<CR>
nmap <leader>gu :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>

