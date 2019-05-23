call plug#begin('~/.vim/plugged')
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/goyo.vim'
call plug#end()
filetype plugin on
filetype indent on
syntax on
set breakindent
set breakindentopt=shift:2
let g:tex_flavor='latex'
let g:livepreview_previewer = 'mupdf'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex $* && pkill -HUP mupdf'
augroup MyIMAPs
    au!
    au VimEnter * call IMAP('``i','\indent <++>','tex')
    au VimEnter * call IMAP('``s','\sum_{<++>}^{<++>}<++>','tex')
    au VimEnter * call IMAP('``p','\prod_{<++>}^{<++>}<++>','tex')
    au VimEnter * call IMAP('``9','\left(<++>\right)<++>','tex')
    au VimEnter * call IMAP('``[','\left[<++>\right]<++>','tex')
    au VimEnter * call IMAP('``n','\mathbb{N} <++>','tex')
    au VimEnter * call IMAP('``r','\mathbb{R} <++>','tex')
    au VimEnter * call IMAP('``q','\mathbb{Q} <++>','tex')
    au VimEnter * call IMAP('``z','\mathbb{Z} <++>','tex')
augroup END 
ca wq :w<cr>:call Quit()<cr>
ca q :call Quit()<cr>
map <S-z><S-z> :w<Cr>:call Quit()<cr>
function! Quit()
    if exists('#goyo')
        Goyo
    endif
    quit
endfunction
autocmd VimEnter * Goyo
