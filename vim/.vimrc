" Greg Kikola
" ~/.vimrc
" Created 2021-06-04
" Updated 2025-07-11

" Use settings for Vim, rather than Vi.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Set home directory (normally ~/.vim)
if has("win32") || has("win64")
  let vim_home_dir = expand("$HOME/vimfiles")
else
  let vim_home_dir = expand("~/.vim")
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Use jk instead of <ESC> to exit insert mode.
inoremap jk <ESC>

let mapleader = "\<space>"

set history=200         " Keep 200 lines of command line history
set ruler               " Show the cursor position all the time
set showcmd             " Display incomplete commands
set laststatus=2        " Always show window statusline
set nowrap              " Disable text-wrapping
set wildmenu            " Display completion matches in a status line
set incsearch           " Enable incremental search
set nohlsearch          " Disable search highlight
set scrolloff=0         " Disable context lines when scrolling

" Set options for viminfo file: Limit saved registers to 50 lines and 8 kB
" each, only save marks from 20 different files, and do not restore search
" higlighting.
set viminfo='20,<50,s8,h

" Always use Unix line endings and file separators in session files.
set sessionoptions+=unix,slash

set hidden              " Hide abandoned buffers

set ttimeout            " Time out for key codes
set ttimeoutlen=100     " Wait up to 100ms for key code to be completed

set expandtab           " Indent with spaces instead of tab characters
set shiftwidth=2        " Set indent level for autoindent
set softtabstop=2       " Set tab stop
set textwidth=78        " Set length of formatted lines

if has("mouse")
  " Fix mouse behavior when running inside tmux
  if &term[0:3] ==? "tmux"
    set ttymouse=xterm2
  endif

  set mouse=a
endif

" Disable automatic line wrapping
autocmd BufNewFile,BufRead * setlocal formatoptions-=t
autocmd BufNewFile,BufRead * setlocal formatoptions-=c

set encoding=utf-8      " Set internal encoding

" Set up swap directory
set swapfile
let swap_dir = expand(vim_home_dir . "/swap")
if has("win32") || has("win64")
  let temp_dir = expand("$TEMP")
else
  let temp_dir = "/tmp"
endif
if !isdirectory(swap_dir)
  call mkdir(swap_dir, "p")
endif

let &directory = swap_dir . "//," . temp_dir . "//"


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

" View man pages in Vim
if !has("win32") && !has("win64")
  runtime! ftplugin/man.vim
  set keywordprg=:Man
endif

" Plugins with vim-plug
if filereadable(expand(vim_home_dir . "/autoload/plug.vim"))
  call plug#begin()

  " Registering vim-plug as a plugin will allow docs to be installed
  Plug 'junegunn/vim-plug'

  function s:GetNpxPath()
    if has("win32") || has("win64")
      return ''
    endif

    let l:path = systemlist("which npx")

    if len(l:path) > 0
      return l:path[0]
    endif

    return ''
  endfunction

  " yegappan/lsp LSP plugin
  if !has("nvim") && !has("win32") && !has("win64")
    Plug 'yegappan/lsp'

    function s:InitYegappanLSP()
      let l:lspOpts = {}
      let l:lspServers = []

      let l:npxPath = s:GetNpxPath()

      if filereadable(expand(l:npxPath))
        let l:lspServers += [#{
              \ name: "typescriptlang",
              \ filetype: ["javascript", "typescript"],
              \ path: l:npxPath,
              \ args: ["typescript-language-server", "--stdio"],
              \ }]
      endif

      call LspOptionsSet(l:lspOpts)
      call LspAddServer(l:lspServers)

      nnoremap <leader>i :LspHover<CR>
      nnoremap <leader>d :LspGotoDefinition<CR>
      nnoremap <leader>p :LspPeekDefinition<CR>
      nnoremap <leader>r :LspRename<CR>
      nnoremap <leader>R :LspPeekReferences<CR>
      nnoremap <leader>o :LspDocumentSymbol<CR>
    endfunction

    autocmd User LspSetup call s:InitYegappanLSP()
  endif



  call plug#end()
endif
