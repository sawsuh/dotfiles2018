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
let g:livepreview_previewer = 'zathura'
let g:Tex_DefaultTargetFormat = 'pdf'
augroup MyIMAPs
    au!
    au VimEnter * call IMAP('``i','\indent <++>','tex')
    au VimEnter * call IMAP('``s','\sum_{<+var+>}^{<+num+>}<++>','tex')
    au VimEnter * call IMAP('``p','\prod_{<+var+>}^{<+num+>}<++>','tex')
    au VimEnter * call IMAP('``b','\binom{<+n+>}{<+r+>}<++>','tex')
    au VimEnter * call IMAP('``9','\left(<++>\right)<++>','tex')
    au VimEnter * call IMAP('``[','\left[<++>\right]<++>','tex')
    au VimEnter * call IMAP('``{','\left\{<++>\right\}<++>','tex')
    au VimEnter * call IMAP('``\','\left|<++>\right|<++>','tex')
    au VimEnter * call IMAP('``n','\mathbb{N} <++>','tex')
    au VimEnter * call IMAP('``r','\mathbb{R} <++>','tex')
    au VimEnter * call IMAP('``q','\mathbb{Q} <++>','tex')
    au VimEnter * call IMAP('``z','\mathbb{Z} <++>','tex')
    au VimEnter * call IMAP('``f','\mathbb{F} <++>','tex')
    au VimEnter * call IMAP('``I','\int_{<+bot+>}^{<+top+>} \! <+func+> \, \mathrm{d}<+var+> <++>','tex')
    au VimEnter * call IMAP('``l','\lim_{<+var+> \to <+lim+>} <+f+>','tex')
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
