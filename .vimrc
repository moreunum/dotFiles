"allow cursor past end of line in visual block mode
set virtualedit=block

" Used for jumping to marks
nnoremap ' `

" syntax highlighting
syntax on

" easmotion
map <SPACE> <Plug>(easymotion-s2)

" convenience remappings
map W :w <cr>
imap kd <Esc>
imap dk <Esc>
nmap <C-J> :bnext <CR>
nmap <C-K> :bprevious <CR>

" wombat color scheme
colorscheme wombat256mod

" line numbers
set nu

" Maintain indent after carriage return
set autoindent

" Change tab size to 2
set shiftwidth=2 " << and >> are 2 spaces
set expandtab " convert tabs into spaces
set tabstop=2 " Tab size is 2 spaces
set softtabstop=2 " Tab key creates tab 2 spaces wide

" Enable search highlighting
set hlsearch
set incsearch

" case insensitive search
set smartcase
set ignorecase

" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set timeoutlen=60
set wildignorecase

" fzf
set rtp+=~/.fzf
nmap <C-t> :FZF! <CR>

" YCM - don't show preview window at top of screen
set completeopt-=preview

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'easymotion/vim-easymotion'
Plugin 'lyuts/vim-rtags'
call vundle#end()            " required
filetype plugin indent on    " required

" show the command that was typed (vundle stuff turns this off)
set showcmd
