call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mcchrish/nnn.vim'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-renamer'
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'axvr/org.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Chiel92/vim-autoformat' " >>python3 -m pip install pynvim
" Plug 'davidhalter/jedi-vim'
" Plug 'chxuan/cpp-mode'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'zgpio/tree.nvim'
call plug#end()

set number
set clipboard+=unnamedplus
" set ic
set ignorecase
set nowrap
set mouse=a
set hidden
set undofile
set undodir=~/.config/nvim/nvimUndo
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
syntax on
syntax enable
filetype plugin indent on
colorscheme gruvbox
" opacity with colorsheme
hi Normal guibg=NONE ctermbg=NONE

map <C-n> :NERDTreeToggle<CR>
map <Space>. :NERDTreeToggle<CR>
" Plug 'junegunn/fzf.vim'
nnoremap <Space>fr :History<CR>
nnoremap ff :FZF<CR>

map <C-a> <esc>ggVG<CR>
map <Space>yy <esc>ggVG y<CR>
nnoremap tn :tabnew<Space>
nnoremap <Space>c :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <Space>fs :w<CR>
nnoremap <Space>bd ZQ<CR>
nnoremap <Space>ot :!
" nnoremap <Space>. <C-w>v<C-w>w<C-w>20-<CR> :Explore<CR>
" nnoremap <Space>ot <C-w>s<C-w>w :terminal<CR>
nnoremap <Space>wv <C-w>v<CR>
nnoremap <Space>ws <C-w>s<CR>
nnoremap <Space>ww <C-w>w<CR>
nnoremap <Space>wq <C-w>q<CR>
" nnoremap <Space>. <C-w>v<C-w>25><C-w>w :Explore<CR>
nnoremap <Space>, :Buffers<CR>
nnoremap <Space>bn :bnext<CR>
nnoremap <Space>bp :bprevious<CR>
nnoremap <C-x>t :set wrap<CR>
nnoremap <C-x>T :set nowrap<CR>

let g:python3_host_prog="/usr/bin/python"
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
noremap <F3> :Autoformat<CR>

" highlight line in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" " if not using nvim but default vim and you want diffrence in cursor
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

" " reset the cursor on start (for older versions of vim, usually not required)
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

" save text folding
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* loadview

" COMPILING SHORTCUTS
nnoremap <C-c><C-l> :! pdflatex.sh "%"<CR>
nnoremap <C-c><C-s> :! sh "%"<CR>
nnoremap <C-c><C-b> :! sh "%"<CR>
nnoremap <C-c><C-p> :! python "%"
"nnoremap <Space>xb :! xdg-open.sh "%";<CR>
"nnoremap <Space>xb :! xdg-open.sh "%<.pdf";<CR>

