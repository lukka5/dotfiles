"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Start                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vim features
set nocompatible


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Bundles                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Initialize Vundle
call plug#begin('~/.vim/plugged')

" Utilities
Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'heavenshell/vim-pydocstring'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kien/rainbow_parentheses.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mxw/vim-jsx'  " Requires pangloss/vim-javascript
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }  " Install cmake first
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'

" Color schemes
Plug 'lukka5/vim-airline-themes'
Plug 'lukka5/vim-valloric-colorscheme'

" Finalize Vundle
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Indent                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set copyindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set list listchars=tab:»·,trail:·


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Color                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set t_Co=256  " Support for 256 color terminals
set background=dark
colorscheme valloric

" Highlight characters beyond the 79 column
hi OverLength ctermbg=238


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Extras                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt-=preview
set mouse=a
set number                 " Enable line number gutter
set ruler                  " Show current cursor position in status bar
set hidden                 " Allow hidden buffers (even modified ones)
set incsearch              " Highlight as I am searching
set smartcase              " But make it sensitive when it matters
set ignorecase             " Case insensitive searching
set noshowmode             " Don't show mode in status bar
set noswapfile             " Don't create swap files
set nocursorline             " Highlight current cursor line
set history=100            " Amount of commands and searches to remember
set scrolloff=1            " 1 line above/below when scrolling
set laststatus=2           " Always show the status line
set timeout                " Timeout on maps and key codes
set ttimeoutlen=50         " Milliseconds waited for sequence to complete
set pastetoggle=<F2>       " Key to use for toggling paste mode
set wildmode=list:longest  " Bash like command line completion
set textwidth=79           " Useful for reformatting text/comments
set formatoptions=roqnj    " See :h formatoptions
set updatetime=500        " (default 4000) for quick tagbar update of tag
                           " highlighting in tagbar window

set clipboard=unnamedplus,unnamed  " Use X11 default clipboard :D

set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add  " Spell file to use

" Hardcode Python binary path so that Neovim always uses that one instead
" of the current on in each virtualenv.
if has('unix')
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
elseif has('mac')
  let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugins                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fzf.vim

" Mappings
nmap <silent><c-p> :Files<cr>
nmap <silent>b :Buffers<cr>

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.fzf-history'

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)[%an]%Creset" --abbrev-commit --date=relative'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" [Layout]
let g:fzf_layout = { 'up': '~40%' }


" Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['magenta', 'RoyalBlue3'],
    \ ['brown',   'SeaGreen3'],
    \ ['blue',    'DarkOrchid3'],
    \ ['red',     'firebrick3'],
    \ ]

" Python file type plugin
let g:python_fold = 0

" Ale
let g:ale_linters = {
\   'python': ['flake8', 'isort'],
\}

command! Isort execute "ALEFix isort"

" Tagbar
let g:tagbar_autoclose = 0
let g:tagbar_autoshowtag = 2
let g:tagbar_foldlevel = 0
let g:tagbar_map_help = "?"
let g:tagbar_sort = 0
let g:tagbar_width = 28
nmap <silent><c-t> :TagbarToggle<cr>

" NERDTree
let NERDTreeWinSize = 28
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$', '\~$', '\.o$']
nmap <silent><c-y> :NERDTreeToggle<cr>

" Vim-airline
let g:airline_theme = 'murmur'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#trailing_format = 't[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mx[%s]'
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.readonly = '🔒'
let g:airline_symbols.whitespace = '!'

" YouCompleteMe
let g:ycm_python_binary_path = 'python3'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
" Maybe I should move this mapping below the `let mapleader` expression
" or move the mapleader exppression above this mapping.
nmap <silent>,g :YcmCompleter GoTo<cr>
nmap <silent>,G :YcmCompleter GetDoc<cr>

" Easymotion
map f <Plug>(easymotion-f)
map F <Plug>(easymotion-F)
map ,j <Plug>(easymotion-j)
map ,k <Plug>(easymotion-k)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

" Dash.vim
" Maybe I should move this mapping below the `let mapleader` expression
" or move the mapleader exppression above this mapping.
nmap <silent>,D <Plug>DashSearch

" vim-pydocstring
nmap <silent><C-m> <Plug>(pydocstring)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Binds                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use comma as our <leader> key
let mapleader=","

" Stop highlighted search
nmap <silent><leader>` :nohlsearch<cr>

" Select all
nmap <silent><leader>a ggVG

" Search inner word with the silver searcher
nmap <silent><leader>A :Ag! <c-r><c-w><cr>

" Print current buffer filename
map <leader>B :echo @%<cr>

" Search with Ag for class under the cursor
nmap <leader>C :Ag class\ <C-r><C-w><cr>

" Delete current buffer keeping window layout intact
nmap <silent><leader>d :bp<bar>sp<bar>bn<bar>bd<cr>

" Close current window
nmap <silent><leader>e :hid<cr>

" Search with Ag for function under the cursor
nmap <leader>F :Ag def\ <C-r><C-w><cr>

" Toggle OverLength highlight group
nmap <silent><leader>h :call ToogleOverLength()<cr>

" Get highlight group under cursor.
nmap <silent><leader>H :echo "hi<" .
      \ synIDattr(synID(line("."),col("."),1),"name") . '> trans<' .
      \ synIDattr(synID(line("."),col("."),0),"name") . "> lo<" .
      \ synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
      \ <cr>

" Join next line to current one without spaces between.
nnoremap <leader>J :call JoinSpaceless()<cr>

" Toggle highlight of list chars (tab, trail, eol, ...)
nmap <silent><leader>l :set list!<cr>

" Toggle line number gutter
nmap <silent><leader>n :set number!<cr>

" Make current window the only one
nmap <silent><leader>o :on<cr>

" Open current buffer (mac only)
nmap <silent><leader>O :!open %<cr>

" Toggle Quicklist and Locationlist
nmap <silent><leader>q :call ToggleList("Quickfix List", 'c')<cr>
nmap <silent><leader>Q :call ToggleList("Location List", 'l')<cr>

" Add celery rdb breackpoint
nnoremap <leader>r ofrom celery.contrib import rdb;rdb.set_trace()<esc>

" Search and replace current word
nmap <leader>R :%s/\<<C-r><C-w>\>//gc<left><left><left>

" Make new horizontal split and focus cursor on it
nmap <silent><leader>s :split<cr><c-w><c-k>

" Sort selected lines (visual mode)
vmap <silent><leader>s :sort i<cr>

" Toggle spell checking
nmap <silent><leader>S :setlocal spell!<cr>

" Edit/load VIM RC file
nmap <silent><leader>v :e $HOME/.vimrc<cr>
nmap <silent><leader>V :w<cr>:so $HOME/.vimrc<cr>:echo "vimrc reloaded!"<cr>

" Make new vertical split and focus cursor on it
nmap <silent><leader><leader>w :vsplit<cr><c-w><c-l>

" Delete all trailing white spaces in current buffer
nmap <silent><leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Switch buffers
nmap <silent><c-o> :bnext<cr>
nmap <silent><c-i> :bprevious<cr>

" Jump list
nnoremap <silent><leader>i <c-o>
nnoremap <silent><leader>o <c-i>

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

" Kill command line except for the command plus a space
cnoremap <c-k> <c-\>esplit(getcmdline(), " ")[0]<cr><space>

" User space to insert space and exit insert mode
nnoremap <space> i<space><esc>

" Format the current paragraph or visual selection
vnoremap Q gq
nnoremap Q gqap

" Easily indent selected block of code in visual mode
vnoremap < <gv
vnoremap > >gv

" Case insensitive :quit and :write command shortcuts
command! Q q
command! W w

" Print the current buffer file's fullpath.
command! Fullpath echo expand('%:p')

" Change vim's pwd to the directory of the current buffer's file.
command! CDFiledir cd %:p:h

" Understand lines as screen lines instead of file lines
" (useful for long lines)
nnoremap j gj
nnoremap k gk

" Center searched phrases when cycling through them
nnoremap <silent>n nzz
nnoremap <silent>N Nzz
nnoremap <silent>* *zz

" Create new lines up/down without moving the cursor
nnoremap T O<esc>j
nnoremap t o<esc>k

" Write protected files
command! WP execute "w !sudo tee %"

" Use normal `.' in visual mode.
vnoremap . :normal .<cr>

" (Shift + 0) `)` == `^` (First column of line)
noremap ) ^

" Lists lines containing the word under the cursor. Type the line number
" followed by <CR> to jump to the corresponding line.
nnoremap [I [I:
xnoremap [I "vy:<C-u>ilist /<C-r>v<CR>:

" Same as above but for 'defines'
nnoremap [D [D:
xnoremap [D "vy:<C-u>dlist /<C-r>v<CR>:

" Don't save deleted word when pasting over a word.
" Allowing multiple paste over word.
xnoremap p pgvy


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Autocmd                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrc
  au!
  " Refresh beyond 79 column highlighting
  au BufWinEnter,WinEnter * match OverLength '\%>79v.\+'
  " Don't move cursor when buffer switching
  if v:version >= 700
    au BufWinLeave * let b:winview = winsaveview()
    au BufWinEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
  endif
augroup END


let g:filetype = 0
augroup ft
  au!
  au FileType *
        \ let g:filetype = &filetype |
        \ call RainbowBraces()
  au FileType vim setlocal sts=2 sw=2 ts=2
  au FileType html setlocal sts=4 sw=4 ts=4
  au FileType htmldjango setlocal sts=4 sw=4 ts=4
  au BufRead,BufNewFile *.less setlocal ft=css
augroup END


augroup mycolor
  au!
  au VimEnter,ColorScheme *
        \ hi OverLength ctermbg=None |
  au Syntax * hi CursorLine ctermbg=none
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
augroup END

augroup clipboard
  au!
  autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")
augroup END


" Add the virtualenv's site-packages to vim path to enable completion
" inside virtualenvs. (i.e. django, etc)
py3 << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this).read(), dict(__file__=activate_this))
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Functions                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set Rainbow braces only on no html files
function! RainbowBraces()
  if g:filetype != 'htmldjango'
    RainbowParenthesesLoadBraces
  endif
  if g:filetype == 'html'
    set ft=htmldjango
  endif
endfunction

" Toggle OverLenght highlight group
let g:overlengthon = 0
function! ToogleOverLength()
  if g:overlengthon
    hi OverLength ctermbg=None
    let g:overlengthon = 0
  else
    hi OverLength ctermbg=238
    let g:overlengthon = 1
  endif
endfunction

" Toggle Quickfix or Location list windows
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'),
        \ 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo "Location List is Empty."
    return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction


" Like gJ, but always remove spaces
fun! JoinSpaceless()
    execute 'normal gJ'
    " Character under cursor is whitespace?
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
        " Then remove it!
        execute 'normal dw'
    endif
endfun


" vim: set sw=2 sts=2 et:
