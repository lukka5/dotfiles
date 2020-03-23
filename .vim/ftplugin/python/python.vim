" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

" Toggle syntax fold
if g:python_fold
    set foldmethod=expr
    set foldexpr=PythonFoldExpr(v:lnum)
    set foldtext=PythonFoldText()
endif

" Add ipdb or rdb breackpoint
nnoremap <leader>b oimport ipdb;ipdb.set_trace()<esc>
nnoremap <leader>B oimport ripdb;ripdb.set_trace()<esc>
nnoremap <leader>r ofrom celery.contrib import rdb;rdb.set_trace()<esc>

" Add if __name__ == '__main__' conditional
nnoremap <leader>m oif __name__ == '__main__':<cr>

" Run python on the current buffer
nmap <silent><leader>z :w<cr>:!python3 %<cr>


function! PythonFoldText()

    let size = 1 + v:foldend - v:foldstart
    if size < 10
        let size = " " . size
    endif
    if size < 100
        let size = " " . size
    endif
    if size < 1000
        let size = " " . size
    endif

    if match(getline(v:foldstart), '"""') >= 0
        let text = substitute(getline(v:foldstart), '"""', '', 'g' ) . ' '
    elseif match(getline(v:foldstart), "'''") >= 0
        let text = substitute(getline(v:foldstart), "'''", '', 'g' ) . ' '
    else
        let text = getline(v:foldstart)
    endif

    return size . ' lines:'. text . ' '

endfunction

function! PythonFoldExpr(lnum)

    if indent( nextnonblank(a:lnum) ) == 0
        return 0
    endif

    if getline(a:lnum-1) =~ '^\(class\|def\)\s'
        return 1
    endif

    if getline(a:lnum) =~ '^\s*$'
        return "="
    endif

    if indent(a:lnum) == 0
        return 0
    endif

    return '='

endfunction

" In case folding breaks down
function! ReFold()
    set foldmethod=expr
    set foldexpr=0
    set foldnestmax=1
    set foldmethod=expr
    set foldexpr=PythonFoldExpr(v:lnum)
    set foldtext=PythonFoldText()
    echo
endfunction
