-- TODO: add VimResized autocmd
-- Inspired by https://gabrielpoca.com/2019-11-13-a-bit-more-lua-in-your-vim/ and https://www.reddit.com/r/neovim/comments/dw0fm8/a_bit_more_lua_in_your_vim/
-- and https://github.com/huytd/vim-config/blob/master/init.vim#L132-L171 and https://www.reddit.com/r/neovim/comments/di41cm/a_floating_terminal_with_borderpadding/
function NavigationFloatingWin()
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

  if (width > 60 and height > 32) then
    local win_height = math.min(math.ceil(height * 0.33), 30)
		local win_width = width

		-- local top = "╭" .. string.rep("─", win_width - 2) .. "╮"
		local mid = "│" .. string.rep(" ", win_width - 2) .. "│"
		local bot = "╰" .. string.rep("─", win_width - 2) .. "╯"

		local buf1 = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_option(buf1, 'buftype', 'nofile')
		for i = 0, win_height - 2 do
			vim.api.nvim_buf_set_lines(buf1, i, i + 1, false, { mid })
		end
		vim.api.nvim_buf_set_lines(buf1, win_height - 1, win_height, false, { bot })

    local opts = { relative = "editor", width = win_width, height = win_height, row = 0, col = 0, style = "minimal" }
		vim.api.nvim_set_option('winhl', 'Normal:Normal')
    local win = vim.api.nvim_open_win(buf1, true, opts)

		local buf2 = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_option(buf2, 'buftype', 'nofile')
		opts.row = opts.row
		opts.height = opts.height - 1
		opts.col = opts.col + 2
		opts.width = opts.width - 4
    local win = vim.api.nvim_open_win(buf2, true, opts)

		vim.api.nvim_command("silent autocmd BufWipeout <buffer=".. buf2 .."> exe 'bwipeout " .. buf1 .. "'")
	else
    local opts = { relative = "editor", width = width, height = height, row = 0, col = 0, style = "minimal" }
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
		vim.api.nvim_set_option('winhl', 'Normal:Normal')
    local win = vim.api.nvim_open_win(buf, true, opts)
	end
end
