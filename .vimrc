"-----CONFIGS-----"

syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set nocompatible  
set clipboard=unnamed
set number relativenumber
set hlsearch
"set paste 
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread
set autoindent 
set smartindent

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
"-----PLUGINS-----"

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mileszs/ack.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

call vundle#end()            " required
filetype plugin indent on    " required

"autocmd vimenter * NERDTree

let g:deoplete#enable_at_startup = 1

"-----MAPPINGS-----"

map <c-j> o<esc>
nnoremap <c-f> :Files<CR>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-p> viwpbyw

"-----FZF-----"

let g:fzf_colors =
\ { "fg":      ["fg", "Normal"],
  \ "bg":      ["bg", "Normal"],
  \ "hl":      ["fg", "IncSearch"],
  \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
  \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
  \ "hl+":     ["fg", "IncSearch"],
  \ "info":    ["fg", "IncSearch"],
  \ "border":  ["fg", "Ignore"],
  \ "prompt":  ["fg", "Comment"],
  \ "pointer": ["fg", "IncSearch"],
  \ "marker":  ["fg", "IncSearch"],
  \ "spinner": ["fg", "IncSearch"],
  \ "header":  ["fg", "WildMenu"] }

"-----Dependencies-----"
" https://github.com/ggreer/the_silver_searcher - for :Ag and FZF
" https://github.com/mileszs/ack.vim - for :Ag and FZF

"-----Commands-----"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
