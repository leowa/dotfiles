#!/usr/bin/env bash
set -ex
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cat << 'EOF' > ~/.vimrc
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'tyru/open-browser.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell.vim'
Bundle 'fatih/vim-go'
Bundle 'nvie/vim-flake8'
" tagbar
Plugin 'majutsushi/tagbar'
nmap <C-k> :TagbarToggle<CR>
" ctag
"Plugin 'ctags.vim'
" vim-easytags and its dependency
" Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'alecthomas/gometalinter'
" also need to install some go packages

filetype plugin indent on
" set background=dark
" colorscheme solarized

if &t_Co > 2 || has("gui_running")
    syntax on
endif

if has("gui_running")
    set lines=45
    set columns=84
    if has("win32")
        set guifont=Source_Code_Pro:h12:cANSI
    else
        set guifont=Source\ Code\ Pro\ 12
    endif
endif
" andyz's customizations
" =====================
" part of them are from: http://vim.wikia.com/wiki/Example_vimrc
" stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" " coming from other editors would expect.
set nostartofline
" Instead of failing a command because of unsaved changes, instead raise a
" " dialogue asking if you wish to save changed files.
set confirm
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
" set file encoding perhttp://blog.csdn.net/ithomer/article/details/6015945
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set file format to unix as default
set fileformats=unix,dos
" auto-load file when it is updated externally
set autoread
" disable auto-backup and swap file
set nobackup
set nowb
set noswapfile
" set auto-indent and auto-newline
set ai
set si
" not to break word in line
set lbr
" =====================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
" replace tab with whitespace
set expandtab
set shiftround
set autoindent
set copyindent
set ignorecase
set smartcase
set showmatch
set hlsearch
set incsearch
set scrolloff=5
set backspace=2
set number
set ruler
set visualbell
set noerrorbells
set laststatus=2
set statusline=%n\ %F\ %m%r\%=%c-%l/%L

nnoremap ; :nohlsearch<CR>
set pastetoggle=<F2>

if has("unix")
    set backup
    set backupdir=/tmp
    set directory=/tmp
elseif has("win32")
    set backup
    set backupdir=C:\Windows\Temp
    set noswapfile
endif

"NERDTree
let NERDTreeChDirMode=1
let NERDTreeIgnore=['\.pyc$', '\.swp$']
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1
map <C-j> :NERDTreeToggle<CR>

"YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

autocmd BufWritePost *.py call Flake8()
"python remove trailing whitespace
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"python highlighting extras
let python_highlight_all = 1

"PHP highlighting extras
let php_sql_query = 1
let php_htmlInStrings = 1
let php_baselib = 1

" tab related key mapping
map <C-a><up> :tabr<cr>
map <C-a><down> :tabl<cr>
map <C-a><left> :tabp<cr>
map <C-a><right> :tabn<cr>

" setting for vimshell
map bs :VimShell<cr>
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
set clipboard=unnamed
" allow paste nicely
set paste
EOF

if test ! -d ~/.vim/bundle/vundle; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

vim +BundleInstall +qall
[ -d ~/.vim/bundle/vimproc ] && {
    cd ~/.vim/bundle/vimproc
    make
    cd -
}
# Set up flake8 default conf file
[ -d ~/.config ] || mkdir ~/.config
cp -f "$__dir/flake8" ~/.config/flake8
