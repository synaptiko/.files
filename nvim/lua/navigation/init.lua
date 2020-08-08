-- Inspired by https://gabrielpoca.com/2019-11-13-a-bit-more-lua-in-your-vim/ and https://www.reddit.com/r/neovim/comments/dw0fm8/a_bit_more_lua_in_your_vim/
-- and https://github.com/huytd/vim-config/blob/master/init.vim#L132-L171 and https://www.reddit.com/r/neovim/comments/di41cm/a_floating_terminal_with_borderpadding/
function NavigationFloatingWin()
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	local win_width = width
	local buf1 = vim.api.nvim_create_buf(false, true)
	local buf2 = vim.api.nvim_create_buf(false, true)
	local optsWin1
	local optsWin2

	vim.api.nvim_buf_set_option(buf1, 'buftype', 'nofile')
	vim.api.nvim_buf_set_option(buf2, 'buftype', 'nofile')

  if (width > 60 and height > 32) then
    local win_height = math.min(math.ceil(height * 0.33), 30)
		NavigationRenderBorders(buf1, win_width, win_height)
    optsWin1 = { relative = "editor", width = win_width, height = win_height, row = 0, col = 0, style = "minimal" }
    optsWin2 = { relative = "editor", width = win_width - 4, height = win_height - 1, row = 0, col = 2, style = "minimal" }
	else
		local win_height = height
    optsWin1 = { relative = "editor", width = win_width, height = win_height, row = 0, col = 0, style = "minimal" }
    optsWin2 = { relative = "editor", width = win_width, height = win_height, row = 0, col = 0, style = "minimal" }
	end

	vim.api.nvim_set_option('winhl', 'Normal:Normal')

	local win1 = vim.api.nvim_open_win(buf1, true, optsWin1)
	local win2 = vim.api.nvim_open_win(buf2, true, optsWin2)

	vim.api.nvim_command("silent autocmd BufWipeout <buffer=".. buf2 .."> exe 'bwipeout " .. buf1 .. "'")
	vim.api.nvim_command("silent autocmd VimResized <buffer=".. buf2 .."> :lua ResizeNavigationFloatingWin(".. win1 ..", ".. win2 ..", ".. buf1 ..")")
end

function NavigationRenderBorders(buf, width, height)
		-- local top = "╭" .. string.rep("─", win_width - 2) .. "╮"
		local mid = "│" .. string.rep(" ", width - 2) .. "│"
		local bot = "╰" .. string.rep("─", width - 2) .. "╯"

		for i = 0, height - 2 do
			vim.api.nvim_buf_set_lines(buf, i, i + 1, false, { mid })
		end
		vim.api.nvim_buf_set_lines(buf, height - 1, height, false, { bot })
end

function ResizeNavigationFloatingWin(win1, win2, buf1)
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	local win_width = width
	local optsWin1
	local optsWin2

  if (width > 60 and height > 32) then
    local win_height = math.min(math.ceil(height * 0.33), 30)
		NavigationRenderBorders(buf1, win_width, win_height)
    optsWin1 = { relative = "editor", width = win_width, height = win_height, row = 0, col = 0, style = "minimal" }
    optsWin2 = { relative = "editor", width = win_width - 4, height = win_height - 1, row = 0, col = 2, style = "minimal" }
	else
		local win_height = height
    optsWin1 = { relative = "editor", width = win_width, height = win_height, row = 0, col = 0, style = "minimal" }
    optsWin2 = { relative = "editor", width = win_width, height = win_height, row = 0, col = 0, style = "minimal" }
	end

	vim.api.nvim_win_set_config(win1, optsWin1)
	vim.api.nvim_win_set_config(win2, optsWin2)
end
