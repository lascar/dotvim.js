execute pathogen#infect()

" colored statusline  Green in normal mode, and Magenta in insert mode
" first, enable status line always
set laststatus=2
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
set statusline=%m%F%h%w\ %{fugitive#statusline()}\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set writebackup
set backup
set hidden
set number
set history=1000
set autoindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
" long line wrap but move on jk on visual line, g to switch to default behaviour
set wrap

" move between split windows ------------------ {{{
nnoremap <silent> <F2> <C-W><C-S> 
nnoremap <silent> <F3> <C-W><C-W>
nnoremap <silent> <F4> <C-W>o
nnoremap <silent> <F5> :buffers<CR>:buffer<Space>
nnoremap <silent> <F6> <C-W>r
nnoremap <silent> <F12> :bn<CR>
" }}}
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/dotvim.js'
let &runtimepath.=','.vimDir
let mapleader = ","
" Vimscript file setting ------------------ {{{
augroup filetype_vim
  if has('autocmd')
    autocmd!
    filetype plugin indent on
    autocmd Filetype vim setlocal foldmethod=marker
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
    autocmd Filetype html setlocal ts=4 sts=4 sw=4 et
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 et
    autocmd Filetype php setlocal ts=4 sts=4 sw=4 et
    autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr> v
  endif
augroup END
" }}}
syntax enable
set  t_Co=256
syntax on
set background=dark
colorscheme distinguished
" Keep undo history across sessions by storing it in a file
" persistent_undo ---------------------------- {{{
augroup persistent_undo
  if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " No console pops up
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
  endif
augroup END
" }}}
noremap <Leader>t :!ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --exclude=log --exclude=public --exclude=node_modules --exclude=app/stylesheets * $(echo $GEM_HOME)/*;fg;mv .git/tags.$$ .git/tags;rm -f .git/tags.$$<CR><CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap <leader>u <esc>vawUea
inoremap <leader>l <esc>vawuea
iabbrev @@ pascal.carrie@gmail.com
function Str(str)
  let b:str = "console.log('" . a:str . " : ' + JSON.stringify(" . a:str . "));"
  return b:str
endfunction
