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
set hidden

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
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper', { 'on': ['GrepperAg', '<plug>(GrepperOperator)'] }
Plug 'michaeljsmith/vim-indent-object'
Plug 'synaptiko/fzf'
Plug 'synaptiko/mintabline'
Plug 'Pocco81/AutoSave.nvim'
Plug 'https://git.sr.ht/~synaptiko/ownvim', { 'rtp': 'nvim-plugin' }
""""""
Plug 'tpope/vim-abolish' " This supports cr* commands, so I could get rid of my CamelCase etc. commands, it would be great to figure how to map them so it can be used with visual selection
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rhubarb'
Plug 'hoob3rt/lualine.nvim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'dense-analysis/ale'
Plug 'kylef/apiblueprint.vim'
Plug 'rlue/vim-getting-things-down'
Plug 'ziglang/zig.vim'
Plug 'synaptiko/hop.nvim', { 'branch': 'feature-mix' }

Plug 'mcchrish/zenbones.nvim'
Plug 'rktjmp/lush.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
Plug 'folke/trouble.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Comments
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
call plug#end()

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor\ $*
	set grepformat=%f:%l:%c:%m
endif

command! -nargs=1 Grq GrepperAg -Q <args>

let g:gitgutter_override_sign_column_highlight=1

let g:zenbones_solid_vert_split=v:true
let g:zenbones_dim_noncurrent_window=v:false
set background=light
colorscheme zenbones

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

let g:GPGExecutable='gpg2'

let g:vim_json_syntax_conceal=0

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

let g:zig_fmt_autosave=0

let g:ale_hover_cursor=0
let g:ale_linter_aliases = {
\   'svelte': ['svelte', 'javascript']
\}
let g:ale_linters = {
\   'svelte': ['eslint']
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'standard', 'eslint'],
\   'svelte': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint']
\}
let g:ale_javascript_eslint_suppress_missing_config=1
let g:ale_disable_lsp=1
let g:ale_set_highlights=0
let g:ale_sign_error=''
let g:ale_sign_warning=''
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:typescript_indent_disable=1

let g:markdown_folding=0

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nmap <silent> <leader>j :FzfFiles<CR>
nmap <silent> <leader>k :FzfBuffers<CR>
nmap <silent> <leader>L :FzfBLines<CR>

nmap <silent> <leader>[ <Plug>(GitGutterNextHunk)
nmap <silent> <leader>] <Plug>(GitGutterPrevHunk)
nmap <silent> <leader>( <Plug>(GitGutterPreviewHunk)

nmap <leader>d <Plug>(ale_fix)

nmap <silent> <leader>{ :ALENextWrap<CR>
nmap <silent> <leader>} :ALEPreviousWrap<CR>


nmap <silent> <leader>l :HopLineStart<CR>
nmap <silent> <leader>w :HopWord<CR>
nmap <silent> <leader>c :HopChar1<CR>
nmap <silent> f :HopFForward<CR>
nmap <silent> F :HopFBackward<CR>
nmap <silent> t :HopTForward<CR>
nmap <silent> T :HopTBackward<CR>

highlight link HopCursor Cursor

" Previous solution: nnoremap <C-l> :let @/ = ""<CR><C-l>
" More solutions here: http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
nmap <silent> <C-l> :nohlsearch<CR>

nmap <Tab> >>
nmap <S-Tab> <<
vmap <Tab> >gv
vmap <S-Tab> <gv
imap <Tab> <C-t>
imap <S-Tab> <C-d>

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

vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

" Useful abbreviations
ab fixme // FIXME jprokop:
ab todo // TODO jprokop:
ab clog console.log()<Left>
ab cerr console.error()<Left>
ab cdir console.dir()<Left>
ab dbg debugger
ab wtd ¯\_(ツ)_/¯
ab shrg ¯\_(ツ)_/¯

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

	" Better wrapping in markdown files
	autocmd FileType markdown setlocal wrap linebreak showbreak=...
augroup END

" Following ensures that fzf will be always set correctly, even when run from nvim-wrapper
" (see https://github.com/fmoralesc/neovim-gnome-terminal-wrapper/pull/9#issuecomment-160473798)
let $FZF_DEFAULT_COMMAND='ag -g "" || true'
let $FZF_DEFAULT_OPTS='--reverse --inline-info --color=16 --color="bg+:-1"'

" Useful for highlight introspection and overrides:
" http://yanpritzker.com/2012/04/17/how-to-change-vim-syntax-colors-that-are-annoying-you/
" nmap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" For better wrapping of prose text
function! WrapByWords()
	setlocal wrap
	setlocal linebreak
	setlocal showbreak=...
endfunction
nmap <leader>WR :call WrapByWords()<CR>

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

" FIXME jprokop: finalize later!
lua << LUA
require'lspconfig'.tsserver.setup {
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "non-relative"
		}
	},
	flags = {
		debounce_text_changes = 500
	}
}
local saga = require 'lspsaga'
saga.init_lsp_saga {
	code_action_icon = '',
	code_action_prompt = {
		sign = false,
		virtual_text = false,
	},
	code_action_keys = { quit = '<Esc>', exec = '<CR>' },
	rename_action_keys = { quit = '<Esc><Esc>', exec = '<CR>' },
	finder_action_keys = {
		open = '<CR>', vsplit = 'v', split = 's', quit = '<Esc>'
	},
	error_sign = 'E',
	warn_sign = 'W',
	hint_sign = 'H',
	infor_sign = 'I',
	dianostic_header_icon = '',
	finder_definition_icon = '',
	finder_reference_icon = '',
	definition_preview_icon = '',
	rename_prompt_prefix = '❯',
	border_style = "round"
}
LUA
" require'lspconfig'.denols.setup {
" 	init_options = {
" 		enable = true,
" 		lint = true,
" 		unstable = true
" 	};
" }

autocmd Filetype typescript,typescriptreact,typescript.tsx setlocal omnifunc=v:lua.vim.lsp.omnifunc

" consider to attach those only in buffers which have LSP working
nnoremap <silent> <leader>;r "ryiw:Lspsaga rename<CR><C-r>r
nnoremap <silent> <leader>;f :Lspsaga lsp_finder<CR>
nnoremap <silent> <leader>;c :Lspsaga code_action<CR>
vnoremap <silent> <leader>;c :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <leader>;d :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <leader>;D :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>;i :Lspsaga show_line_diagnostics<CR>

" TODO jprokop: review later
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

set completeopt-=preview

" Treesitter
lua << LUA
require'nvim-treesitter.configs'.setup {
	context_commentstring = { enable = true },
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true
	},
}
LUA

" Comments
lua << LUA
require'Comment'.setup {
	-- Based on: https://github.com/numToStr/Comment.nvim#pre-hook
	---@param ctx Ctx
	pre_hook = function(ctx)
		-- Only calculate commentstring for tsx filetypes
		if vim.bo.filetype == 'typescriptreact' then
			local U = require('Comment.utils')

			-- Detemine whether to use linewise or blockwise commentstring
			local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

			-- Determine the location where to calculate commentstring from
			local location = nil
			if ctx.ctype == U.ctype.block then
				location = require('ts_context_commentstring.utils').get_cursor_location()
			elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
				location = require('ts_context_commentstring.utils').get_visual_start_location()
			end

			return require('ts_context_commentstring.internal').calculate_commentstring({
				key = type,
				location = location,
			})
		end
	end,
}

local ft = require('Comment.ft')
ft.set('zig', '// %s')
LUA

" Lualine
lua << LUA
require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'zenbones',
		component_separators = '',
		section_separators = '',
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {},
		lualine_c = {
			{
					'filename',
					file_status = true,
					path = 1
			}
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
			{
				'diagnostics',
				sources = {'nvim_diagnostic', 'ale'},
				sections = {'hint', 'info', 'warn', 'error'},
				symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'}
			}
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
					'filename',
					file_status = true,
					path = 1
			}
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {'quickfix'}
}
LUA

lua << LUA
require("trouble").setup {
	icons = false,
	fold_open = "-",
	fold_closed = "+",
	indent_lines = false,
	signs = {
			error = "E",
			warning = "W",
			hint = "H",
			information = "I",
			other = "?"
	},
	use_lsp_diagnostic_signs = false
}
LUA

lua << LUA
local autosave = require("autosave")
autosave.setup {
	enabled = true,
	execution_message = "",
	events = {"FocusLost"},
	conditions = {
		exists = true,
		filetype_is_not = {},
		modifiable = true
	},
	write_all_buffers = true,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 250
}
autosave.hook_after_off = function ()
	print("Autosave off")
end
autosave.hook_after_on = function ()
	print("Autosave on")
end
LUA
