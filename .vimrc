call plug#begin($XDG_DATA_HOME.'/vim/bundle')
" completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" explorer
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
" syntax
Plug 'Sheerun/vim-polyglot'
" statusline
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes' 
" interface
Plug 'christoomey/vim-tmux-navigator'
Plug 'andymass/vim-matchup'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/limelight.vim'
" editor
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'
" version control
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" themes
Plug 'morhetz/gruvbox'
call plug#end()

syntax on

for s:path in split(glob('~/.config/nvim/*.vim'), "\n")
	exe 'source ' . s:path
endfor
