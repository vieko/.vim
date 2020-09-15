call plug#begin($XDG_DATA_HOME.'/vim/bundle')
" completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" explorer
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
" syntax
" Plug 'Sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'jparise/vim-graphql'
" snippets
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile'  }
" statusline
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" interface
Plug 'christoomey/vim-tmux-navigator'
Plug 'andymass/vim-matchup'
" Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/limelight.vim'
" editor
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'wincent/loupe'
Plug 'wincent/scalpel'
" Plug 'takac/vim-hardtime'
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

