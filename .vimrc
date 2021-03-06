" Fix pasting inside vim in tmux
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

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
"set incsearch

" case insensitive search
set smartcase
set ignorecase

" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set timeoutlen=60
set wildignorecase

" fzf
set rtp+=~/.fzf
nmap <C-t> :FZF <CR>
"
"function! s:escape(path)
"  return substitute(a:path, ' ', '\\ ', 'g')
"endfunction
"
"function! AgHandler(line)
"  let parts = split(a:line, ':')
"  let [fn, lno] = parts[0 : 1]
"  execute 'e '. s:escape(fn)
"  execute lno
"  normal! zz
"endfunction
"
"command! -nargs=+ Fag call fzf#run({
"  \ 'source': 'ag "<args>"',
"  \ 'sink': function('AgHandler'),
"  \ 'options': '+m',
"  \ 'tmux_height': '60%'
"\ })

" YCM 
set completeopt-=preview " don't show preview window at top of screen
let g:ycm_server_log_level = 'debug'
let g:loaded_youcompleteme = 1 "enable this to turn off YCM

" omni-complete
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" rtags
let g:rtagsUseDefaultMappings=0
command Ri call rtags#SymbolInfo()
command Rj call rtags#JumpTo()
command RS call rtags#JumpTo(" ")
command RV call rtags#JumpTo("vert")
command RT call rtags#JumpTo("tab")
command Rp call rtags#JumpToParent()
command Rf call rtags#FindRefs()
command Rn call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols")
command Rs call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))
command Rr call rtags#ReindexFile()
command Rl call rtags#ProjectList()
command Rw call rtags#RenameSymbolUnderCursor()
command Rv call rtags#FindVirtuals()

" Remapping vim ctags to use rtags
noremap <C-]> :Rj<CR>

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
Plugin 'vim-scripts/Conque-GDB'
call vundle#end()            " required
filetype plugin indent on    " required

" Make vim command prompt work like readline
:cnoremap <C-a>  <Home>
:cnoremap <C-b>  <Left>
:cnoremap <C-f>  <Right>
:cnoremap <C-d>  <Delete>
:cnoremap <M-b>  <S-Left>
:cnoremap <M-f>  <S-Right>
:cnoremap <M-d>  <S-right><Delete>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <Esc>d <S-right><Delete>
:cnoremap <C-g>  <C-c>

" show the command that was typed (vundle stuff turns this off)
set showcmd
