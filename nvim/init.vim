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

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

let mapleader='\'
map <SPACE> <leader>

call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'artnez/vim-wipeout'
Plug 'chrisbra/Recover.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'jamessan/vim-gnupg'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'junegunn/fzf.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'mhinz/vim-grepper'
Plug 'michaeljsmith/vim-indent-object'
Plug 'moll/vim-node'
" Plug 'mxw/vim-jsx'
Plug 'mboughaba/i3config.vim'
" Plug 'sirtaj/vim-openscad'
Plug 'synaptiko/fzf'
Plug 'synaptiko/gruvbox' " To support transparent background correctly & also my custom colors for tabline
Plug 'synaptiko/mintabline'
Plug '907th/vim-auto-save'
Plug 'synaptiko/ownvim', { 'rtp': 'nvim-plugin' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'w0rp/ale'
Plug 'kylef/apiblueprint.vim'
Plug 'rlue/vim-getting-things-down'
Plug 'ziglang/zig.vim'

" Use either those two for javascript/typescript:
Plug 'jelera/vim-javascript-syntax'
" Plug 'leafgarland/typescript-vim'
" or those two:
" Plug 'othree/yajs.vim'
" Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor\ $*
	set grepformat=%f:%l:%c:%m
endif

let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_tabline=0
let g:gitgutter_override_sign_column_highlight=1
colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled=0

set signcolumn=yes
let g:gitgutter_realtime=1
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'

let g:fzf_command_prefix='Fzf'
let g:fzf_preview_window=''
lua require("navigation")
let g:fzf_layout = { 'window': 'lua NavigationFloatingWin()' }

let g:auto_save=1
let g:auto_save_silent=1

let g:GPGExecutable='gpg2'

let g:vim_json_syntax_conceal=0

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

let g:zig_fmt_autosave = 0

let g:ale_linter_aliases = {
\   'svelte': ['svelte', 'javascript']
\}
let g:ale_linters = {
\   'svelte': ['eslint']
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'standard', 'eslint'],
\   'svelte': ['prettier', 'eslint'],
\   'typescript': ['eslint']
\}
let g:ale_javascript_eslint_suppress_missing_config=1

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nmap <silent> <leader>j :FzfFiles<CR>
nmap <silent> <leader>k :FzfBuffers<CR>
nmap <silent> <leader>l :FzfBLines<CR>

nmap <silent> <leader>[ <Plug>GitGutterPrevHunk
nmap <silent> <leader>] <Plug>GitGutterNextHunk

nmap <leader>d <Plug>(ale_fix)

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
" TODO remove?
tnoremap <Esc> <Esc><C-\><C-n>
tnoremap <leader>wj <C-\><C-n><C-w>h
tnoremap <leader>wk <C-\><C-n><C-w>j
tnoremap <leader>wl <C-\><C-n><C-w>k
tnoremap <leader>w; <C-\><C-n><C-w>l

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
	" Related to Fzf's status line above
	autocmd! User FzfStatusLine call <SID>fzf_statusline()
	" Open help vertically
	autocmd FileType help wincmd L

	autocmd BufRead,BufNewFile *.mjs set filetype=javascript
	autocmd BufNewFile,BufRead,BufReadPost *.svelte set filetype=html.svelte

	" Open files in quickfix window in new tab when Ctrl+T is pressed
	autocmd FileType qf nnoremap <buffer> <C-T> <C-W><Enter><C-W>T
augroup END

" Following ensures that fzf will be always set correctly, even when run from nvim-wrapper
" (see https://github.com/fmoralesc/neovim-gnome-terminal-wrapper/pull/9#issuecomment-160473798)
let $FZF_DEFAULT_COMMAND='ag -g ""'
let $FZF_DEFAULT_OPTS='--reverse --inline-info --color=16'

" Useful for highlight introspection and overrides:
" http://yanpritzker.com/2012/04/17/how-to-change-vim-syntax-colors-that-are-annoying-you/
" nmap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

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

" TODO jprokop: replace by some simple C program :-) no need to have yarn, node etc. to convert letters and spaces!
function! ConvertThroughLodash(fnName, type)
	if a:type ==# 'v'
		let saved_unnamed_register = @@

		normal! `<v`>y
		execute "normal! gvc" . system("YARN_GLOBAL_PATH=`yarn global dir` node -e \"process.stdout.write(require(require('path').join(process.env.YARN_GLOBAL_PATH, 'node_modules', 'lodash'))." . a:fnName . "('" . @@ . "'))\" 2> /dev/null")

		let @@ = saved_unnamed_register
	else
		echoerr a:fnName . " can be used only on characterwise selection"
	endif
endfunction

" Variants of multiword casing
command! -range -nargs=0 CamelCase :call ConvertThroughLodash('camelCase', visualmode())
command! -range -nargs=0 KebabCase :call ConvertThroughLodash('kebabCase', visualmode())
command! -range -nargs=0 SnakeCase :call ConvertThroughLodash('snakeCase', visualmode())
command! -range -nargs=0 StartCase :call ConvertThroughLodash('startCase', visualmode())
" Alias for easier search
command! -range -nargs=0 CaseCamel :call ConvertThroughLodash('camelCase', visualmode())
command! -range -nargs=0 CaseKebab :call ConvertThroughLodash('kebabCase', visualmode())
command! -range -nargs=0 CaseSnake :call ConvertThroughLodash('snakeCase', visualmode())
command! -range -nargs=0 CaseStart :call ConvertThroughLodash('startCase', visualmode())

" Helper function to generate and paste random uuid
" It can be used in insert mode by pressing Ctrl+O<leader>uuid
function! Uuid()
    let @u = system('uuid | tr -d "\n"')
		normal! "up
endfunction
nmap <silent> <leader>uuid :call Uuid()<CR>

function! SwitchTheme(variant)
	if a:variant == 'dark'
		set background=dark
	else
		set background=light
	endif

	" To be more cooler => transparent background
	hi! Normal ctermbg=none guibg=none
endfunction
if !empty(expand('~/.files/0-theme/configs/nvim.vim'))
	source ~/.files/0-theme/configs/nvim.vim
else
	call SwitchTheme('dark')
endif
