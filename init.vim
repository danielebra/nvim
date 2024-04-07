" Continue at recent file position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

lua require 'init'
let g:python3_host_prog = $HOME . '/.env/neovim/bin/python3'
let g:loaded_python_provider = 0 " Disable python2
" disable autocomplete match info at bottom of screen
set shortmess+=c

" Disable copilot by default
let g:copilot_enabled = v:false

" Source project rc files
if filereadable(".project.vimrc")
    so .project.vimrc
endif

" Persist folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
