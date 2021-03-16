set nocompatible              " required
filetype off                  " required

"grabs vim-plug
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
call plug#begin('$HOME/vimfiles/plugged')

"plugins
Plug 'gabrielelana/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wheel'
Plug 'ryanoasis/vim-devicons'
"Plug 'vim-scripts/UniCycle'
Plug 'rhysd/vim-grammarous'
Plug 'vim-airline/vim-airline'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-wordy'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'jbyuki/instant.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'b4skyx/serenade'
call plug#end()

filetype plugin indent on    " required
syntax enable

"Makes Goyo less stupid
highlight StatusLineNC ctermfg=white

"Binds file-tree toggle to ctr+o
map <C-o> :NERDTreeToggle<CR>

"Enable both following let if limelight gives error
" Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = '8'

" Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGrey'

let g:instant_username = "ghost"

"Sets vim-airline
set laststatus=2

"Idk if this also needs to be here, I don't think it does; enable if something
"doesn't work lol
"set nocompatible

"Search stuff, I don't remember what it does
set hlsearch
set incsearch

"Create a thesaurus.txt in %home/usr, with this inside: important, valuable, substantial, significant
set thesaurus+=/home/rootwsl/thesaurus.txt

"Remaps j and k to move by line, rather than paragraph
nnoremap j gj
nnoremap k gk

"Airline theme
let g:airline_theme='serenade'

let g:neodark#terminal_transparent = 1 " default: 0
let g:neodark#use_256color = 1 " default: 0

"Vim theme
syntax on
colorscheme serenade

"MD syntax **text** _text_ to conceal
let g:pencil#conceallevel = 3     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

"Sets pencil to PencilSoft on opening MD files
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

set textwidth=0
set wrap linebreak nolist

"Should start start goyo when you open MD but is broken so idk
"autocmd FileType markdown | :Goyo
"Sets Limelight when opening MD files
"autocmd Filetype markdown | :Limelight0.8

autocmd BufRead,BufNewFile *.md :Goyo 80
autocmd BufRead,BufNewFile *.md :Limelight0.8

"Enable mouse support, paste from windows with shift+rclick if this breaks it
set mouse=a
