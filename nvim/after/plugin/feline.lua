-------------------------------------------------------------------------------
-- local line_ok, feline = pcall(require, "feline")
-- if not line_ok then
-- 	return
-- end
--
-- local vi_mode = require("feline.providers.vi_mode")
--
-- --
-- -- 1. define some constants
-- --
--
-- -- left and right constants (first and second items of the components array)
-- local LEFT = 1
-- local RIGHT = 2
--
-- -- vi mode color configuration
-- local MODE_COLORS = {
-- 	["NORMAL"] = "green",
-- 	["COMMAND"] = "skyblue",
-- 	["INSERT"] = "orange",
-- 	["REPLACE"] = "orange",
-- 	["LINES"] = "violet",
-- 	["VISUAL"] = "violet",
-- 	["OP"] = "yellow",
-- 	["BLOCK"] = "yellow",
-- 	["V-REPLACE"] = "yellow",
-- 	["ENTER"] = "yellow",
-- 	["MORE"] = "yellow",
-- 	["SELECT"] = "yellow",
-- 	["SHELL"] = "yellow",
-- 	["TERM"] = "yellow",
-- 	["NONE"] = "yellow",
-- }
--
-- -- gruvbox theme
-- local GRUVBOX = {
-- 	fg = "#ebdbb2",
-- 	bg = "#252526",
-- 	black = "#252526",
-- 	skyblue = "#4EC9B0",
-- 	cyan = "#8e07c",
-- 	green = "#179FFF",
-- 	oceanblue = "#179FFF",
-- 	blue = "#458588",
-- 	magenta = "#d3869b",
-- 	orange = "#FFD700",
-- 	-- red = "#fb4934",
-- 	violet = "#A3719F",
-- 	white = "#FFFFFF",
-- 	yellow = "#FFD700",
-- }
--
-- --
-- -- 2. setup some helpers
-- --
--
-- --- get the current buffer's file name, defaults to '[no name]'
-- function get_filename()
-- 	local filename = vim.api.nvim_buf_get_name(0)
-- 	if filename == "" then
-- 		filename = "[no name]"
-- 	end
-- 	-- this is some vim magic to remove the current working directory path
-- 	-- from the absilute path of the filename in order to make the filename
-- 	-- relative to the current working directory
-- 	return vim.fn.fnamemodify(filename, ":~:.")
-- end
--
-- --- get the current buffer's file type, defaults to '[not type]'
-- function get_filetype()
-- 	local filetype = vim.bo.filetype
-- 	if filetype == "" then
-- 		filetype = "[no type]"
-- 	end
-- 	return filetype:lower()
-- end
--
-- --- get the cursor's line
-- function get_line_cursor()
-- 	local cursor_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return cursor_line
-- end
--
-- --- get the file's total number of lines
-- function get_line_total()
-- 	return vim.api.nvim_buf_line_count(0)
-- end
--
-- --- wrap a string with whitespaces
-- function wrap(string)
-- 	return " " .. string .. " "
-- end
--
-- --- wrap a string with whitespaces and add a '' on the left,
-- -- use on left section components for a nice  transition
-- function wrap_left(string)
-- 	return " " .. string .. " "
-- end
--
-- --- wrap a string with whitespaces and add a '' on the right,
-- -- use on left section components for a nice  transition
-- function wrap_right(string)
-- 	return " " .. string .. " "
-- end
--
-- --- decorate a provider with a wrapper function
-- -- the provider must conform to signature: (component, opts) -> string
-- -- the wrapper must conform to the signature: (string) -> string
-- function wrapped_provider(provider, wrapper)
-- 	return function(component, opts)
-- 		return wrapper(provider(component, opts))
-- 	end
-- end
--
-- --
-- -- 3. setup custom providers
-- --
--
-- --- provide the vim mode (NOMRAL, INSERT, etc.)
-- function provide_mode(component, opts)
-- 	return vi_mode.get_vim_mode()
-- end
--
-- --- provide the buffer's file name
-- function provide_filename(component, opts)
-- 	return get_filename()
-- end
--
-- --- provide the line's information (curosor position and file's total lines)
-- function provide_linenumber(component, opts)
-- 	return get_line_cursor() .. "/" .. get_line_total()
-- end
--
-- -- provide the buffer's file type
-- function provide_filetype(component, opts)
-- 	return get_filetype()
-- end
--
-- --
-- -- 4. build the components
-- --
--
-- local components = {
-- 	-- components when buffer is active
-- 	active = {
-- 		{}, -- left section
-- 		{}, -- right section
-- 	},
-- 	-- components when buffer is inactive
-- 	inactive = {
-- 		{}, -- left section
-- 		{}, -- right section
-- 	},
-- }
--
-- -- insert the mode component at the beginning of the left section
-- table.insert(components.active[LEFT], {
-- 	name = "mode",
-- 	provider = wrapped_provider(provide_mode, wrap),
-- 	right_sep = "slant_right",
-- 	-- hl needs to be a function to avoid calling get_mode_color
-- 	-- before feline initiation
-- 	hl = function()
-- 		return {
-- 			fg = "black",
-- 			bg = vi_mode.get_mode_color(),
-- 		}
-- 	end,
-- })
--
-- -- insert the filename component after the mode component
-- table.insert(components.active[LEFT], {
-- 	name = "filename",
-- 	provider = wrapped_provider(provide_filename, wrap_left),
-- 	right_sep = "slant_right",
-- 	hl = {
-- 		bg = "white",
-- 		fg = "black",
-- 	},
-- })
--
-- -- insert the filetype component before the linenumber component
-- table.insert(components.active[RIGHT], {
-- 	name = "filetype",
-- 	provider = wrapped_provider(provide_filetype, wrap_right),
-- 	left_sep = "slant_left",
-- 	hl = {
-- 		bg = "white",
-- 		fg = "black",
-- 	},
-- })
--
-- -- insert the linenumber component at the end of the left right section
-- table.insert(components.active[RIGHT], {
-- 	name = "linenumber",
-- 	provider = wrapped_provider(provide_linenumber, wrap),
-- 	left_sep = "slant_left",
-- 	hl = {
-- 		bg = "skyblue",
-- 		fg = "black",
-- 	},
-- })
--
-- -- insert the inactive filename component at the beginning of the left section
-- table.insert(components.inactive[LEFT], {
-- 	name = "filename_inactive",
-- 	provider = wrapped_provider(provide_filename, wrap),
-- 	right_sep = "slant_right",
-- 	hl = {
-- 		fg = "white",
-- 		bg = "bg",
-- 	},
-- })
--
-- --
-- -- 5. run the feline setup
-- --
--
-- feline.setup({
-- 	theme = GRUVBOX,
-- 	components = components,
-- 	vi_mode_colors = MODE_COLORS,
-- })
-------------------------------------------------------------------------------
local present, feline = pcall(require, "feline")

if not present then
	return
end

local theme = {
	aqua = "#179FFF",
	bg = "#1e1e1e",
	blue = "#5FB0FC",
	cyan = "#70C0BA",
	darkred = "#FB7373",
	fg = "CBCBCB",
	gray = "#222730",
	green = "#4EC9B0",
	lime = "#54CED6",
	orange = "#FFD064",
	pink = "#d3869b",
	purple = "#A3719F",
	red = "#F87070",
	yellow = "#FFD700",
}

local mode_theme = {
	["NORMAL"] = theme.green,
	["OP"] = theme.cyan,
	["INSERT"] = theme.aqua,
	["VISUAL"] = theme.yellow,
	["LINES"] = theme.darkred,
	["BLOCK"] = theme.orange,
	["REPLACE"] = theme.purple,
	["V-REPLACE"] = theme.pink,
	["ENTER"] = theme.pink,
	["MORE"] = theme.pink,
	["SELECT"] = theme.darkred,
	["SHELL"] = theme.cyan,
	["TERM"] = theme.lime,
	["NONE"] = theme.gray,
	["COMMAND"] = theme.blue,
}

local component = {}

component.vim_mode = {
	provider = function()
		return vim.api.nvim_get_mode().mode:upper()
	end,
	hl = function()
		return {
			fg = "bg",
			bg = require("feline.providers.vi_mode").get_mode_color(),
			style = "bold",
			name = "NeovimModeHLColor",
		}
	end,
	left_sep = "block",
	right_sep = "block",
}

component.git_branch = {
	provider = "git_branch",
	hl = {
		fg = "fg",
		bg = "bg",
		style = "bold",
	},
	left_sep = "block",
	right_sep = "",
}

component.git_add = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.git_delete = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.git_change = {
	provider = "git_diff_changed",
	hl = {
		fg = "purple",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.separator = {
	provider = "",
	hl = {
		fg = "bg",
		bg = "bg",
	},
}

component.diagnostic_errors = {
	provider = "diagnostic_errors",
	hl = {
		fg = "red",
	},
}

component.diagnostic_warnings = {
	provider = "diagnostic_warnings",
	hl = {
		fg = "yellow",
	},
}

component.diagnostic_hints = {
	provider = "diagnostic_hints",
	hl = {
		fg = "aqua",
	},
}

component.diagnostic_info = {
	provider = "diagnostic_info",
}

component.lsp = {
	provider = function()
		if not rawget(vim, "lsp") then
			return ""
		end

		local progress = vim.lsp.util.get_progress_messages()[1]
		if vim.o.columns < 120 then
			return ""
		end

		local clients = vim.lsp.get_active_clients({ bufnr = 0 })
		if #clients ~= 0 then
			if progress then
				local spinners = {
					"◜ ",
					"◠ ",
					"◝ ",
					"◞ ",
					"◡ ",
					"◟ ",
				}
				local ms = vim.loop.hrtime() / 1000000
				local frame = math.floor(ms / 120) % #spinners
				local content = string.format("%%<%s", spinners[frame + 1])
				return content or ""
			else
				return "לּ LSP"
			end
		end
		return ""
	end,
	hl = function()
		local progress = vim.lsp.util.get_progress_messages()[1]
		return {
			fg = progress and "yellow" or "green",
			bg = "gray",
			style = "bold",
		}
	end,
	left_sep = "",
	right_sep = "block",
}

component.file_type = {
	provider = {
		name = "file_type",
		opts = {
			filetype_icon = true,
		},
	},
	hl = {
		fg = "fg",
		bg = "gray",
	},
	left_sep = "block",
	right_sep = "block",
}

component.scroll_bar = {
	provider = function()
		local chars = {
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
		}
		local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
		local position = math.floor(line_ratio * 100)

		if position <= 5 then
			position = " TOP"
		elseif position >= 95 then
			position = " BOT"
		else
			position = chars[math.floor(line_ratio * #chars)] .. position
		end
		return position
	end,
	hl = function()
		local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
		local fg
		local style

		if position <= 5 then
			fg = "aqua"
			style = "bold"
		elseif position >= 95 then
			fg = "red"
			style = "bold"
		else
			fg = "purple"
			style = nil
		end
		return {
			fg = fg,
			style = "bold",
			bg = "bg",
		}
	end,
	left_sep = "block",
	right_sep = "block",
}

local left = {}
local middle = {}
local right = {
	component.vim_mode,
	component.file_type,
	component.lsp,
	component.git_branch,
	component.git_add,
	component.git_delete,
	component.git_change,
	component.separator,
	component.diagnostic_errors,
	component.diagnostic_warnings,
	component.diagnostic_info,
	component.diagnostic_hints,
	component.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
}

feline.setup({
	components = components,
	theme = theme,
	vi_mode_colors = mode_theme,
})
