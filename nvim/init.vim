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
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set iskeyword+=-                    " Append hyphens, they are quite often used in SCSS and similar
set termguicolors                   " https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
set splitright                      " Split vertical windows right to the current windows
set splitbelow                      " Split horizontal windows below to the current windows
set noshowmode
set relativenumber
set updatetime=750
set listchars=tab:  ,trail:·,space:·,nbsp:·
set list
set title
set clipboard=unnamed
set inccommand=nosplit
set mouse=a

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

let mapleader='\'
map <SPACE> <leader>

call plug#begin('~/.config/nvim/plugged')
Plug 'synaptiko/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'synaptiko/mintabline'
Plug 'synaptiko/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jamessan/vim-gnupg'
Plug 'artnez/vim-wipeout'
Plug 'rust-lang/rust.vim'
Plug 'mhinz/vim-grepper'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'sirtaj/vim-openscad'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'chrisbra/Recover.vim'
Plug 'tpope/vim-commentary'
Plug 'michaeljsmith/vim-indent-object'
Plug '907th/vim-auto-save'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'othree/yajs.vim'
Plug 'tpope/vim-projectionist'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'tpope/vim-abolish'
Plug 'joukevandermaas/vim-ember-hbs'
call plug#end()

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor\ $*
	set grepformat=%f:%l:%c:%m
endif

let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_invert_selection=0
let g:gitgutter_override_sign_column_highlight=1
colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled=0

let g:gitgutter_sign_column_always=1
let g:gitgutter_realtime=1

let g:fzf_command_prefix='Fzf'
let g:fzf_layout={ 'window': 'topleft 14new' }

let g:auto_save=1
let g:auto_save_silent=1

let g:GPGExecutable='gpg2'

let g:vim_json_syntax_conceal=0

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nmap <silent> <leader>j :FzfFiles<CR>
nmap <silent> <leader>k :FzfBuffers<CR>
nmap <silent> <leader>l :FzfBLines<CR>
nmap <silent> <leader>a <plug>NERDTreeTabsToggle<CR>

nmap <silent> <leader>[ <Plug>GitGutterPrevHunk
nmap <silent> <leader>] <Plug>GitGutterNextHunk

" Previous solution: nnoremap <C-l> :let @/ = ""<CR><C-l>
" More solutions here: http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
nmap <silent> <C-l> :nohlsearch<CR>

nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv
imap <Tab> <C-t>
imap <S-Tab> <C-d>

" Better mapping related to the terminal and window movements (derived from i3)
tnoremap <Esc> <Esc><C-\><C-n>
tnoremap <leader>wj <C-\><C-n><C-w>h
tnoremap <leader>wk <C-\><C-n><C-w>j
tnoremap <leader>wl <C-\><C-n><C-w>k
tnoremap <leader>w; <C-\><C-n><C-w>l
nnoremap <leader>wj <C-w>h
nnoremap <leader>wk <C-w>j
nnoremap <leader>wl <C-w>k
nnoremap <leader>w; <C-w>l

" Easier jumping amongst first 9 tabs
nmap <silent> <leader>1 1gt
nmap <silent> <leader>2 2gt
nmap <silent> <leader>3 3gt
nmap <silent> <leader>4 4gt
nmap <silent> <leader>5 5gt
nmap <silent> <leader>6 6gt
nmap <silent> <leader>7 7gt
nmap <silent> <leader>8 8gt
nmap <silent> <leader>9 9gt

" Tabs can be easily moved (similar to Ctrl+Shift+PageDown/Up)
nmap <silent> mt :tabm +<CR>
nmap <silent> mT :tabm -<CR>

" Better search next/prev (always watch one place in long files)
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" Better repeating in visual mode
vnoremap . :norm.<CR>

" Better NERDTree <-> vim-bookmarks integration! (see https://github.com/MattesGroeger/vim-bookmarks#faq)
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
	nmap mm :BookmarkToggle<CR>
	nmap mi :BookmarkAnnotate<CR>
	nmap mn :BookmarkNext<CR>
	nmap mp :BookmarkPrev<CR>
	nmap ma :BookmarkShowAll<CR>
	nmap mc :BookmarkClear<CR>
	nmap mx :BookmarkClearAll<CR>
	nmap mkk :BookmarkMoveUp
	nmap mjj :BookmarkMoveDown
	" Tabs can be easily moved (similar to Ctrl+Shift+PageDown/Up)
	nmap <silent> mt :tabm +<CR>
	nmap <silent> mT :tabm -<CR>
endfunction
function! BookmarkUnmapKeys()
	unmap mm
	unmap mi
	unmap mn
	unmap mp
	unmap ma
	unmap mc
	unmap mx
	unmap mkk
	unmap mjj
	unmap mt
	unmap mT
endfunction

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Avoid accidental unexpected behavior of Ctrl+U in insert mode & ZZ
inoremap <C-u> <nop>
nnoremap ZZ <nop>

" Useful abbreviations
ab fixme // FIXME jprokop:
ab todo // TODO jprokop:
ab clog console.log();<Left><Left>
ab dbg debugger

" Default Fzf's status line is not useful for me
function! s:fzf_statusline()
	setlocal statusline=·
endfunction

augroup configgroup
	autocmd!
	" Disable auto-insertion of comments (http://vim.wikia.com/wiki/Disable_automatic_comment_insertion)
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" cindent is terrible, smartindent is enough for most cases (and specialized js plugins are terribly complex)
	" TODO someday look at this: http://stackoverflow.com/a/20127451
	autocmd FileType javascript setlocal nocindent smartindent
	" python has whitespace significant philosophy, so don't render spaces visible
	autocmd FileType python setlocal nolist
	" Better looking quickfix window
	autocmd BufReadPost quickfix setlocal nolist
	" Trigger autoread when changing buffers or coming back to vim
	autocmd FocusGained,BufEnter * :checktime
	" Related to NERDTree <-> vim-bookmarks integration defined above
	autocmd BufEnter * :call BookmarkMapKeys()
	autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
	" Related to Fzf's status line above
	autocmd! User FzfStatusLine call <SID>fzf_statusline()
	" Open help vertically
	autocmd FileType help wincmd L

	" TODO convert to some kind of plugin!!!
	" Temporary experiment for i3+nvr mapping
	autocmd FocusGained * :silent exec "!ln -s -f $NVIM_LISTEN_ADDRESS /tmp/nvimsocket"
	autocmd VimLeave * :silent exec "!test -L /tmp/nvimsocket && ls -l /tmp/nvimsocket | grep $NVIM_LISTEN_ADDRESS >& /dev/null && rm /tmp/nvimsocket"
	" It currently doesn't work well as pressing Ctrl+Alt+[jkl;] is causing losing of focus
	" autocmd FocusLost * :silent exec "!test -L /tmp/nvimsocket && ls -l /tmp/nvimsocket | grep $NVIM_LISTEN_ADDRESS >& /dev/null && rm /tmp/nvimsocket"
augroup END

" Following ensures that fzf will be always set correctly, even when run from nvim-wrapper
" (see https://github.com/fmoralesc/neovim-gnome-terminal-wrapper/pull/9#issuecomment-160473798)
let $FZF_DEFAULT_COMMAND='ag -g ""'
let $FZF_DEFAULT_OPTS='--reverse --inline-info'

" Useful for highlight introspection and overrides:
" http://yanpritzker.com/2012/04/17/how-to-change-vim-syntax-colors-that-are-annoying-you/
" nmap ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Update appearance of TabLine (according to gruvbox theme)
highlight TabLineSel guifg=#1d2021 guibg=#a89984

" Convenient 'Mr.Proper for tabs and buffers' function
function! ClearTabsAndBuffers()
	tabedit
	tabonly
	sleep 10m " wait 10ms to avoid gitgutter errors
	Wipeout
endfunction
nmap <leader>Q :call ClearTabsAndBuffers()<CR>

function! SwitchTheme(variant, ...)
	if a:0 == 0
		silent !clear

		if a:variant == 'dark'
			silent !~/.files/xfce4-terminal/switch-theme.sh dark
		else
			silent !~/.files/xfce4-terminal/switch-theme.sh light
		endif

		redraw!
	endif

	if a:variant == 'dark'
		set background=dark

		" TODO remove this and all terminal related this as I'm not using it
		" Better colors in a terminal inside Neovim (https://github.com/neovim/neovim/issues/4436)
		let g:terminal_color_0  = '#282828'
		let g:terminal_color_1  = '#cc241d'
		let g:terminal_color_2  = '#98971a'
		let g:terminal_color_3  = '#d79921'
		let g:terminal_color_4  = '#458588'
		let g:terminal_color_5  = '#b16286'
		let g:terminal_color_6  = '#689d6a'
		let g:terminal_color_7  = '#a89984'
		let g:terminal_color_8  = '#928374'
		let g:terminal_color_9  = '#fb4934'
		let g:terminal_color_10 = '#b8bb26'
		let g:terminal_color_11 = '#fabd2f'
		let g:terminal_color_12 = '#83a598'
		let g:terminal_color_13 = '#d3869b'
		let g:terminal_color_14 = '#8ec07c'
		let g:terminal_color_15 = '#ebdbb2'
	else
		set background=light

		" Better colors in a terminal inside Neovim (https://github.com/neovim/neovim/issues/4436)
		let g:terminal_color_0  = '#fbf1c7'
		let g:terminal_color_1  = '#cc241d'
		let g:terminal_color_2  = '#98971a'
		let g:terminal_color_3  = '#d79921'
		let g:terminal_color_4  = '#458588'
		let g:terminal_color_5  = '#b16286'
		let g:terminal_color_6  = '#689d6a'
		let g:terminal_color_7  = '#7c6f64'
		let g:terminal_color_8  = '#928374'
		let g:terminal_color_9  = '#9d0006'
		let g:terminal_color_10 = '#79740e'
		let g:terminal_color_11 = '#b57614'
		let g:terminal_color_12 = '#076678'
		let g:terminal_color_13 = '#8f3f71'
		let g:terminal_color_14 = '#427b58'
		let g:terminal_color_15 = '#3c3836'
	endif

	" To be more cooler => transparent background
	hi! Normal ctermbg=none guibg=none
endfunction

function! ToggleTheme()
	if &background == 'dark'
		call SwitchTheme('light')
	else
		call SwitchTheme('dark')
	endif
endfunction
nmap <silent> <leader>T :call ToggleTheme()<CR>

function! InitTheme()
	let actualTheme = system("ls -la ~/.config/xfce4/terminal/terminalrc")

	if actualTheme =~# '-light'
		call SwitchTheme('light', 0)
	else
		call SwitchTheme('dark', 0)
	endif
endfunction
call InitTheme()

function! GetNvimListenAddress()
	return $NVIM_LISTEN_ADDRESS
endfunction
set title
let &titlestring = 'Neovim@' . GetNvimListenAddress()
