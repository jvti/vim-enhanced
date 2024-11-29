" Basic Settings
set nocompatible
set termguicolors
set number relativenumber
set showmatch
set incsearch hlsearch
set tabstop=4 shiftwidth=4 expandtab
set hidden
set encoding=utf-8
syntax on
filetype plugin indent on
set nobackup nowritebackup noswapfile undofile
set shortmess+=c
set history=1000 undolevels=1000
set wildignore=*.swp,*.bak,*.pyc
set visualbell noerrorbells
set foldmethod=indent foldlevel=99
set termguicolors

" Plugin Manager Setup (vim-plug)
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-buftabline'
Plug 'dense-analysis/ale'
Plug 'tell-k/vim-autopep8'
Plug 'rust-lang/rust.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'lifepillar/vim-solarized8'
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

" Colorscheme
set background=dark
colorscheme solarized8_flat " solarized8 gruvbox
let g:airline_theme = 'solarized' " 'gruvbox'

"solarized8 setting
let g:solarized8_termtrans = 1
let g:solarized8_high_visibility = 0
let g:solarized8_disable_bold = 1

" vim-devicons colors
" highlight NERDTreeDir guifg=#ffaa00
" highlight NERDTreeDirSlash guifg=#ffaa00
" highlight NERDTreeOpenable guifg=#00ff00
" highlight NERDTreeClosable guifg=#00ff00
" highlight NERDTreeFile guifg=#ffffff
" highlight NERDTreeExecFile guifg=#888888
" highlight DevIconsDefault guifg=#ffffff
" highlight DevIconsFolderClosed guifg=#ffaa00
" highlight DevIconsFolderOpen guifg=#00ff00
" highlight DevIconsFolderEmpty guifg=#888888


" Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_section_x = '%{FugitiveHead()}'

" General Keybindings
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
noremap <C-t> :FloatermToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <PageUp> :bprevious<CR>
nnoremap <PageDown> :bnext<CR>
nnoremap <space> za

" Git Keybindings
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>gl :G pull<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gm :GitMessenger<CR>

" Git Gutter Settings
let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '✏️'
let g:gitgutter_sign_removed = '➖'
let g:gitgutter_sign_removed_first_line = '⬆️'
let g:gitgutter_sign_removed_above_and_below = '⬇️'

" Git Messenger Settings
let g:git_messenger_floating_win_opts = {'border': 'single'}

" NERDTree Settings
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeGitStatusUseNerdFonts=1


" ALE Settings
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black'], 'javascript': ['prettier']}
let g:ale_fix_on_save = 1

" Language-specific Settings
augroup language_settings
  autocmd!
  " Python
  autocmd BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 expandtab textwidth=79 autoindent
  autocmd FileType python nnoremap <buffer> <f5> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
  autocmd FileType python inoremap <buffer> <f5> <esc>:w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
  autocmd FileType python noremap <buffer> <f8> :call Autopep8()<CR>
  let python_highlight_all=1
  let g:autopep8_disable_show_diff=1

  " Web Development
  autocmd BufNewFile,BufRead *.js,*.html,*.css set tabstop=2 shiftwidth=2
  autocmd FileType html nnoremap <buffer> <f5> :w<CR>:exec '!clear; xdg-open %'<CR>
  autocmd FileType html inoremap <buffer> <f5> <esc>:w<CR>:exec '!clear; xdg-open %'<CR>

  " Shell
  autocmd FileType sh nnoremap <buffer> <f5> :w<CR>:exec '!clear; chmod +x %; ./%' shellescape(@%, 1)<CR>
  autocmd FileType sh inoremap <buffer> <f5> <esc>:w<CR>:exec '!clear; chmod +x %; ./%' shellescape(@%, 1)<CR>

  " C++
  autocmd FileType cpp nnoremap <buffer> <f5> :w<CR>:exec '!clear; if [ -f a.out ]; then rm a.out; fi; g++ --std=c++17 %; ./a.out' shellescape(@%, 1)<CR>
  autocmd FileType cpp inoremap <buffer> <f5> <esc>:w<CR>:exec '!clear; if [ -f a.out ]; then rm a.out; fi; g++ --std=c++17 %; ./a.out' shellescape(@%, 1)<CR>

  " Rust
  autocmd FileType rust nnoremap <buffer> <f5> :w<CR>:exec '!clear; if [ -f Cargo.toml ]; then cargo run; else rustc % -o %:r.out && ./%:r.out; fi'<CR>
  autocmd FileType rust inoremap <buffer> <f5> <esc>:w<CR>:exec '!clear; if [ -f Cargo.toml ]; then cargo run; else rustc % -o %:r.out && ./%:r.out; fi'<CR>
  let g:rust_clip_command = 'xclip -selection clipboard'
augroup END

" Skeleton Files
autocmd BufNewFile *.cpp 0r ~/.skeletons/skeleton.cpp
autocmd BufNewFile *.sh 0r ~/.skeletons/skeleton.sh
autocmd BufNewFile *.html 0r ~/.skeletons/skeleton.html
autocmd BufNewFile *.rs 0r ~/.skeletons/skeleton.rs

" Floating Terminal Configuration
let g:floaterm_width=0.8
let g:floaterm_height=0.8
