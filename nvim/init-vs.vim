scriptencoding uft-8
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set history=1000                    " Store a ton of history (default is 20)
set number                          " Line numbers on
set ignorecase                      " Ignore case-sensitive search
set smartcase                       " And switch on smart-case search
set incsearch                       " Find as you type search
set hlsearch                        " Highlight search terms
set scrolljump=3                    " Lines to scroll when cursor leaves screen
set scrolloff=3                     " Minimum lines to keep above and below cursor
set nowrap                          " Do not wrap long lines
set breakindent                     " But use the same indent level when wrapping is selectively enabled
set shortmess+=filmnrxoOtTI         " Abbrev. of messages (avoids 'hit enter')
set iskeyword+=-                    " Append hyphens, they are quite often used in SCSS and similar
set termguicolors                   " https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
set splitright                      " Split vertical windows right to the current windows
set splitbelow                      " Split horizontal windows below to the current windows
set noshowmode
set relativenumber
set updatetime=750
set listchars=tab:  ,trail:·
set list
set title
set clipboard=unnamed
set inccommand=nosplit
set mouse=a
set nobackup
set nowritebackup
set foldlevel=99                    " Open all folds by default, useful when checking commits in GV plugin

set nocindent
set smartindent

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

let mapleader='\'
map <SPACE> <leader>

" Previous solution: nnoremap <C-l> :let @/ = ""<CR><C-l>
" More solutions here: http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
nmap <silent> <C-l> :nohlsearch<CR>

nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv
" Instead of the below I need custom mapping in VS:
" { "key": "tab",                "command": "editor.action.indentLines",
"                                     "when": "editorTextFocus && neovim.init && neovim.mode == 'insert'" },
" imap <Tab> <C-t>
" imap <S-Tab> <C-d>

" Avoid accidental unexpected behavior of Ctrl+U in insert mode & ZZ
inoremap <C-u> <nop>
nnoremap ZZ <nop>

" Useful abbreviations
ab fixme // FIXME jprokop:
ab todo // TODO jprokop:
ab clog console.log()<Left>
ab cerr console.error()<Left>
ab cdir console.dir()<Left>
ab dbg debugger
ab wtd ¯\_(ツ)_/¯
ab shrg ¯\_(ツ)_/¯

" Helper function to generate and paste random uuid
" It can be used in insert mode by pressing Ctrl+O<leader>uuid
function! Uuid()
    let @u = system('uuid | tr -d "\n"')
		normal! "up
endfunction
nmap <silent> <leader>uuid :call Uuid()<CR>

" Better repeating in visual mode
vnoremap . :norm.<CR>
