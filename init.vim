call plug#begin()
Plug 'preservim/NERDTree'
Plug 'drzel/vim-gui-zoom'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'xianzhon/vim-code-runner'
call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set number
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:neovide_refresh_rate=144
set encoding=utf-8

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set guifont=Fira\ Code\ Regular\ Nerd\ Font\ Complete:h18
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
nmap <silent><leader>B <plug>CodeRunner
"map <F8> :w <CR> :!gcc % -o %< -lm && ./%< <CR>   "memudahkan compile file C dengan menekan tombol F8
"map <F8> :!gcc % -o %< -lm && ./%< <CR>  "memudahkan compile file C dengan menekan tombol F8
set background=dark         "mengaktifkan bg dark untuk theme gruvbox
set mouse=a                 "mengaktifkan mouse

"nmap <c-c> "+y
"vmap <c-c> "+y
"nmap <c-v> "+p
"inoremap <c-v> <c-r>+
"inoremap <c-v> <c-r>+
let g:code_runner_save_before_execute = 1
let g:neovide_transparency=0.9
let g:neovide_scale=1.5
"let g:neovide_fullscreen=v:true
let g:neovide_cursor_antialiasing=v:true
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
