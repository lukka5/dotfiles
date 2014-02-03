"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Start                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Use Vim features
set nocompatible

" Initialize Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Bundles                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Utilities
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'bling/vim-airline'
Bundle 'danro/rename.vim'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'matze/vim-move'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/noerrmsg.vim'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'

" Color schemes
Bundle 'Pychimp/vim-luna'
Bundle 'Valloric/vim-valloric-colorscheme'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'baskerville/bubblegum'
Bundle 'cschlueter/vim-wombat'
Bundle 'gilsondev/tomorrow-theme-vim'
Bundle 'morhetz/gruvbox'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/Mustang2'
Bundle '~/.vim/bundle/local_colors/.git'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Indent                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Enable plugin and indent detection (needs to be after Bundle commands)
filetype plugin indent on

" Highlight characters beyond the 79 column
hi OverLength ctermbg=233 guibg=#2d2d2d
match OverLength /\%80v.\+/

" Indentation
set autoindent
set copyindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set list listchars=tab:»·,trail:·


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Color                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Enable syntax and color scheme
syntax enable
set background=dark

" We want different colorshemes for gui
if has("gui_running")
  colorscheme valloric
else
  colorscheme luna-term
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Extras                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if has("gui_running")
  set guioptions=agi     " Don't show the left and right scrollbars
  set guicursor=a:blinkon0  " Stop cursor blinking
  set lines=50 columns=175  " Maximize gvim at start

  " Use specially patched font for vim-airline
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif

set number                 " Enable line number gutter
set ruler                  " Show current cursor position in status bar
set hidden                 " Allow hidden buffers (even modified ones)
"set hlsearch               " Highlight searched phrases
set incsearch              " Highlight as I am searching
set smartcase              " But make it sensitive when it matters
set ignorecase             " Case insensitive searching
set noshowmode             " Don't show mode in status bar
set noswapfile             " Don't create swap files
set cursorline             " Highlight current cursor line
"set showmatch              " Show matching bracket
"set matchtime=2            " Reduces show matching blink time
set history=100            " Amount of commands and searches to remember
set scrolloff=1            " 1 line above/below when scrolling
set laststatus=2           " Always show the status line
set ttimeoutlen=50         " Milliseconds waited for sequence to complete
set pastetoggle=<F2>       " Key to use for toggling paste mode
set wildmode=list:longest  " Bash like command line completion
set textwidth=78           " Useful for reformatting text
set formatoptions=roqnj    " See :h formatoptions

set clipboard=unnamedplus,unnamed      " Use X11 default clipboard :D
set spf=$HOME/.vim/spell/en.utf-8.add  " Spell file to use


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugins                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Ctrlp
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_max_files = 1000  " Speed up ctrlp execution
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|mp3)$|[\/]\.(git)|__init__\.py'

" Syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Tagbar
let g:tagbar_width = 24
let g:tagbar_sort = 0
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_map_help = "?"
nmap <silent><c-t> :TagbarToggle<cr>

" NERDTree
let NERDTreeWinSize = 24
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$', '\~$', '\.o$']
nmap <silent><c-n> :NERDTreeToggle<cr>
nmap <silent><c-y> :NERDTree<cr><c-w>p:NERDTreeFind<cr>

" Vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
nmap <silent><leader>j :YcmCompleter GoToDefinitionElseDeclaration<cr>

" Python file type plugin
let g:python_fold = 0

" Vim Shell
let g:shell_fullscreen_items = 'mT'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Binds                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Use comma as our <leader> key
let mapleader=","

" Stop highlighted search
nmap <silent><leader>` :nohlsearch<cr>

" Select all
nmap <silent><leader>a ggVG

" Delete current buffer keeping window layout intact

nmap <silent><leader>d :bp<bar>sp<bar>bn<bar>bd<cr>

" Close current window
nmap <silent><leader>e :hid<cr>

" Handy shortcut for toggling the foldcolumn (only 1/0 deep)
nmap <silent><leader>F
      \ :if &fdc==0 \| set fdc=1 \| else \| set fdc=0 \| endif<cr>

" Toggle OverLength highlight group
nmap <silent><leader>h :call ToogleOverLength()<cr>

" Toggle highlight of list chars (tab, trail, eol, ...)
nmap <silent><leader>l :set list!<cr>

" Toggle line number gutter
nmap <silent><leader>n :set number!<cr>

" Make current window the only one
nmap <silent><leader>o :on<cr>

" Close preview window
nmap <silent><leader>r :pclose<cr>

" Sort selected lines (visual mode)
vmap <silent><leader>s :sort<cr>

" Toggle spell checking
nmap <silent><leader>S :setlocal spell!<cr>

" Edit/load VIM RC file
nmap <silent><leader>v :e $HOME/.vimrc<cr>
nmap <silent><leader>V :w<cr>:so $HOME/.vimrc<cr>:echo "vimrc reloaded!"<cr>

" Make new vertical split and focus cursor on it
nmap <silent><leader>w :vsplit<cr><c-w><c-l>

" Delete all trailing white spaces in current buffer
nmap <silent><leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Easily switch tabs in vim-airline's tabline plugin
nmap <silent><c-o> :bnext<cr>
nmap <silent><c-i> :bprevious<cr>

" Easily move around windows
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Easily move through the command line (bash-like shortcuts)
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <c-e> <end>
cnoremap <c-a> <home>
cnoremap <c-d> <del>

" Use space key to toggle folds
nnoremap <space> za

" Format the current paragraph or visual selection
vnoremap Q gq
nnoremap Q gqap

" Easily indent selected block of code in visual mode
vnoremap < <gv
vnoremap > >gv

" Case insensitive :quit and :write command shortcuts
command! Q q
command! W w

" Understand lines as screen lines instead of file lines
" (useful for long lines)
nnoremap j gj
nnoremap k gk

" Center searched phrases when cycling through them
nnoremap <silent>n nzz
nnoremap <silent>N Nzz
nnoremap <silent> * *zz

" Create new lines up/down without moving the cursor
nmap T O<esc>j
nmap t o<esc>k


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Autocmd                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


augroup vimrc

  " Clear all autocmd in the group. So autocmds don't appear twice when
  " VIM RC is sourced twice
  au!

  " When editing a file, always jump to the last known cursor position
  au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  " Refresh beyond 79 column highlighting
  au BufWinEnter,BufRead *
      \ match OverLength /\%80v.*/

augroup END


augroup color

  " Clear all autocmd in the group. So autocmds don't appear twice when
  " VIM RC is sourced twice
  au!

  " I like dark background regardless of the current color scheme
  " (236,#2d2d2d == greyish color)
  au VimEnter,ColorScheme *
      \ hi Normal ctermbg=black guibg=black |
      \ hi LineNr ctermbg=black guibg=black |
      \ hi Folded ctermbg=233 guibg=#111111 |
      \ hi FoldColumn ctermbg=black guibg=black |
      \ hi SignColumn ctermbg=black guibg=black |
      \ hi OverLength ctermbg=233 guibg=#2d2d2d |
      \ hi SyntasticError ctermbg=236 guibg=#2d2d2d |
      \ hi SyntasticWarning ctermbg=236 guibg=#2d2d2d |
      \ hi SyntasticErrorSign ctermfg=245 guifg=#6F6F6C |
      \ hi SyntasticWarningSign ctermbg=black guibg=black

augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Functions                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Toggle OverLenght highlight group
let g:overlengthon = 1
function! ToogleOverLength()
  if g:overlengthon
    hi OverLength ctermbg=black guibg=black
    let g:overlengthon = 0
  else
    hi OverLength ctermbg=233 guibg=#2d2d2d
    let g:overlengthon = 1
  endif
endfunction


" vim: set sw=2 sts=2 et:
