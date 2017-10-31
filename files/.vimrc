set t_Co=256
syntax on
set background=dark
colorscheme monokai

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

nnoremap <F8> :setl noai nocin nosi inde=<cr>
cnoremap sudow w !sudo tee % >/dev/null

nmap <c-a> :call JsBeautify()<cr>

au BufReadPost Rockerfile set syntax=dockerfile

autocmd FileType python,ruby,javascript,sh,yaml,dockerfile autocmd BufWritePre <buffer> :%s/\s\+$//e

