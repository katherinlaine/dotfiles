" ============================================================================
" .vimrc file modified by Ranchow

" Lots of credit to:
" Sample .vimrc file by Dan Sheffner
" ============================================================================
command! W :w
set nocompatible
set nocp
syntax on
" set nowrap
set encoding=utf8
" ----------------------------------------------------------------------------
" Useful settings
set history=700
set undolevels=1000
set undofile  " Save undo tree.
set undodir=/tmp
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
" ----------------------------------------------------------------------------
set spelllang=en_us                        " Set spell check language.
set tags+=tags                               " Enable tags.
" ----------------------------------------------------------------------------
runtime ~/.vim/bundle/pathogen/autoload/pathogen.vim
" ----------------------------------------------------------------------------
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" ----------------------------------------------------------------------------

" Plug Start
call plug#begin('~/.vim/bundle')

" ============================================================================
"                               PLUGINS
" ============================================================================
" ============================================================================
" Utility
Plug 'scrooloose/nerdcommenter' "Easily toggle comments
Plug 'jiangmiao/auto-pairs' " Autocomplete enclosures
Plug 'scrooloose/nerdtree' " To easily browse files
Plug 'kien/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/limelight.vim' "Hyperfocus-writing
Plug 'godlygeek/tabular'
Plug 'henrik/rename.vim'
Plug 'junegunn/goyo.vim'
Plug 'dyng/auto_mkdir'
Plug 'rking/ag.vim'
Plug 'JazzCore/ctrlp-cmatcher'
" ============================================================================
" ============================================================================
" Generic Programming support
Plug 'jakedouglas/exuberant-ctags'
Plug 'honza/vim-snippets'
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'tobyS/vmustache'
Plug 'janko-m/vim-test'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'Shougo/neocomplete.vim'
Plug 'ervandew/supertab' " use <Tab> for all your insert completion needs
" ============================================================================
" ============================================================================
" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'KurtPreston/vim-autoformat-rails'
Plug 'skalnik/vim-vroom'

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" ============================================================================
" ============================================================================
" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'dsawardekar/ember.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'isRuslan/vim-es6'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mustache/vim-mustache-handlebars'
" ============================================================================
" ============================================================================
" HTML/CSS/SCSS
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-haml'
" ============================================================================
" ============================================================================
" MarkDown
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
" ============================================================================
" ============================================================================
" Python
" Plug 'python-mode/python-mode'
Plug 'hdima/python-syntax'
" ============================================================================
" ============================================================================
" Git
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 500  " default value
" ============================================================================
" ============================================================================
" Themes
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
" ============================================================================
" ============================================================================
" ============================================================================
" ============================================================================

"                       CONFIGS
" ============================================================================

call plug#end()  " required

" ----------------------------------------------------------------------------
let mapleader = ","
" ----------------------------------------------------------------------------
" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e
" ----------------------------------------------------------------------------
" map ctrl n to line numbers
:nmap <C-N><C-N> :set invnumber<CR>
" ----------------------------------------------------------------------------
" Mouse and backspace
" set mouse=a " on OSX press ALT and click
set bs=2 " make backspace behave like normal again
" ----------------------------------------------------------------------------
" bind Ctrl+<movement> keys to move around the windows
" instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" ----------------------------------------------------------------------------
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
" ----------------------------------------------------------------------------
" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
" ----------------------------------------------------------------------------
" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows
" ----------------------------------------------------------------------------
" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" ----------------------------------------------------------------------------
" map sort function to a key
vnoremap <Leader>s :sort<CR>
" ----------------------------------------------------------------------------
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation
" ----------------------------------------------------------------------------
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
" ----------------------------------------------------------------------------
" Enable syntax highlighting
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
" ----------------------------------------------------------------------------
" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
" ----------------------------------------------------------------------------
" easier formatting of paragraphs
vmap Q gq
nmap Q gqap
" ----------------------------------------------------------------------------
" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
" ----------------------------------------------------------------------------
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
" ============================================================================
"                Color scheme
" ============================================================================
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
set t_Co=256

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme tomorrow-night
" set background=dark
let g:one_allow_italics = 1 " Allow italics for comments. <3
let g:airline_theme='one'
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" ----------------------------------------------------------------------------
" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
" ----------------------------------------------------------------------------
" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newwin = vnew
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" let g:pymode_rope_lookup_project = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
" ----------------------------------------------------------------------------
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
" ----------------------------------------------------------------------------
" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
" ----------------------------------------------------------------------------
" Neocomplete
" let g:neocomplete#enable_at_startup = 1
"
" ----------------------------------------------------------------------------
set wildmenu
set wildmode=list:longest,full

set clipboard=unnamedplus
" ----------------------------------------------------------------------------
" load up the nerd tree
" autocmd vimenter * NERDTree
map <Leader>t <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the left
let g:NERDTreeWinPos = "left"
" " move to the first buffer
autocmd VimEnter * wincmd p
" ----------------------------------------------------------------------------
" paste toggle
set pastetoggle=<F2>
" ----------------------------------------------------------------------------
" turn off auto complete
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
" ----------------------------------------------------------------------------
" set autoread on
:set autoread
