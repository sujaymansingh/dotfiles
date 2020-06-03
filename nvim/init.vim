" TODO: How can I avoid hardcoding this?
let g:python3_host_prog = '~/venvs/neovim/bin/python3'

:syntax on
:set background=dark " Highlight searches
:set hls

" Line numbers on the side, and column numbers at the bottom
:set number
:set ruler

" Just stick to 4 spaces instead of tabs
:set smarttab
:set expandtab
:set shiftwidth=4

" http://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi#11560415
:set backspace=2

" Force myself to use HJKL
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

:autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
:autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab

" To map <Esc> to exit terminal-mode:
" https://neovim.io/doc/user/nvim_terminal_emulator.html
:tnoremap <Esc> <C-\><C-n>

call plug#begin()

" Python
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'psf/black'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Git
Plug 'tpope/vim-fugitive'

call plug#end()
