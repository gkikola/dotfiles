" Greg Kikola
" ~/.vimrc
" Created 2021-06-04
" Updated 2021-12-03

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system-wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use settings for Vim, rather than Vi.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Use jk instead of <ESC> to exit insert mode.
inoremap jk <ESC>

set history=200         " Keep 200 lines of command line history
set ruler               " Show the cursor position all the time
set showcmd             " Display incomplete commands
set laststatus=2        " Always show window statusline
set nowrap              " Disable text-wrapping
set wildmenu            " Display completion matches in a status line
set incsearch           " Enable incremental search

set hidden              " Hide abandoned buffers

set ttimeout            " Time out for key codes
set ttimeoutlen=100     " Wait up to 100ms for key code to be completed

set expandtab           " Indent with spaces instead of tab characters
set shiftwidth=2        " Set indent level for autoindent
set softtabstop=2       " Set tab stop
set textwidth=78        " Set length of formatted lines

" Disable automatic line wrapping
autocmd BufNewFile,BufRead * setlocal formatoptions-=t
autocmd BufNewFile,BufRead * setlocal formatoptions-=c

set encoding=utf-8      " Set internal encoding

" Set up swap directory
set swapfile
if has("win32")
  let swap_dir = expand("$HOME/vimfiles/swap")
else
  let swap_dir = expand("~/.vim/swap")
endif

if !isdirectory(swap_dir)
  call mkdir(swap_dir, "p")
endif

if has("win32")
  set directory=$HOME\vimfiles\swap//,$TEMP//
else
  set directory=~/.vim/swap//,/tmp//
endif


set writebackup         " Protect against crash-during-write
set nobackup            " Do not keep backup after successful write
set backupcopy=yes      " During backup, copy and overwrite original

" Set GUI options.
set guioptions-=t       " Disable tearoff menus
set guioptions-=T       " Disable toolbar
set guioptions-=L       " Disable left-hand scrollbar

colorscheme desert      " Set color scheme

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection and load indent files.
  filetype plugin indent on

endif

" Set fonts
if has("gui_running")
  if has("x11")
    set guifont=DejaVu\ Sans\ Mono\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h11
  endif
endif

" Enable syntax highlighting when colors are available
if &t_Co > 2 || has("gui_running")
  syntax enable
endif

" Highlight trailing whitespace
autocmd BufWinEnter * match Error /\s\+$/
autocmd InsertEnter * match Error /\s\+\%#\@<!$/
autocmd InsertLeave * match Error /\s\+$/
autocmd BufWinLeave * call clearmatches()
