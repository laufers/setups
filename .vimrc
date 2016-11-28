" Colors
colorscheme badwolf         " awesome colorscheme
syntax enable           " enable syntax processing
" Spaces and Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" UI Config
set number              " show line numbers
set showcmd             " show command in bottom bar
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

if has("gui_running")
    "echo "yes, we have a GUI"
    set mouse=a
else
    "echo "Boring old console"
    set mouse=
endif