--- stylua: ignore
local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

-- local old = {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function()
--     require('lualine').setup {
--       options = {
--         theme = bubbles_theme,
--         -- theme = "dracula"
--         -- theme = "palenight"
--         --theme = "horizon"
--         --theme = "papercolor_light"
--         component_separators = '',
--         section_separators = { left = '', right = '' },
--       },
--       sections = {
--         lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
--         lualine_b = { 'filename', 'branch' },
--         lualine_c = {
--           '%=', --[[ add your center compoentnts here in place of this comment ]]
--         },
--         lualine_x = {},
--         lualine_y = { 'filetype', 'progress' },
--         lualine_z = {
--           { 'location', separator = { right = '' }, left_padding = 2 },
--         },
--       },
--       inactive_sections = {
--         lualine_a = { 'filename' },
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = { 'location' },
--       },
--       tabline = {},
--       extensions = {},
--     }
--   end
-- }
--

return {
	"nvim-lualine/lualine.nvim",
	-- dependencies = {
	--     'kdheepak/tabline.nvim',
	-- },
	config = function()
		local colors = {
			red = "#cdd6f4",
			grey = "#181825",
			black = "#1e1e2e",
			white = "#313244",
			light_green = "#6c7086",
			orange = "#fab387",
			green = "#a6e3a1",
			blue = "#80A7EA",
		}

		local theme = {
			normal = {
				a = { fg = colors.black, bg = colors.blue },
				b = { fg = colors.blue, bg = colors.white },
				c = { fg = colors.white, bg = colors.black },
				z = { fg = colors.white, bg = colors.black },
			},
			insert = { a = { fg = colors.black, bg = colors.orange } },
			visual = { a = { fg = colors.black, bg = colors.green } },
			replace = { a = { fg = colors.black, bg = colors.green } },
		}

		local vim_icons = {
			function()
				return " "
			end,
			separator = { left = "", right = "" },
			color = { bg = "#313244", fg = "#80A7EA" },
		}

		local space = {
			function()
				return " "
			end,
			color = { bg = colors.black, fg = "#80A7EA" },
		}

		local filename = {
			"filename",
			color = { bg = "#80A7EA", fg = "#242735" },
			separator = { left = "", right = "" },
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = true,
			color = { bg = "#313244" },
			separator = { left = "", right = "" },
		}

		local filetype_tab = {
			"filetype",
			icon_only = true,
			colored = true,
			color = { bg = "#313244" },
		}

		-- local buffer = {
		--     require 'tabline'.tabline_buffers,
		--     separator = { left = "", right = "" },
		-- }

		-- local tabs = {
		--     require 'tabline'.tabline_tabs,
		--     separator = { left = "", right = "" },
		-- }

		local fileformat = {
			"fileformat",
			color = { bg = "#b4befe", fg = "#313244" },
			separator = { left = "", right = "" },
		}

		local encoding = {
			"encoding",
			color = { bg = "#313244", fg = "#80A7EA" },
			separator = { left = "", right = "" },
		}

		local branch = {
			"branch",
			color = { bg = "#a6e3a1", fg = "#313244" },
			separator = { left = "", right = "" },
		}

		local diff = {
			"diff",
			color = { bg = "#313244", fg = "#313244" },
			separator = { left = "", right = "" },
		}

		local modes = {
			"mode",
			fmt = function(str)
				return str:sub(1, 1)
			end,
			color = { bg = "#fab387		", fg = "#1e1e2e" },
			separator = { left = "", right = "" },
		}

		local function getLspName()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return "  " .. client.name
				end
			end
			return "  " .. msg
		end

		local dia = {
			"diagnostics",
			color = { bg = "#313244", fg = "#80A7EA" },
			separator = { left = "", right = "" },
		}

		local lsp = {
			function()
				return getLspName()
			end,
			separator = { left = "", right = "" },
			color = { bg = "#f38ba8", fg = "#1e1e2e" },
		}

		require("lualine").setup({

			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					-- tabline = 1000,
					winbar = 1000,
				},
			},

			sections = {
				lualine_a = {
					--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
					modes,
					vim_icons,
					--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
				},
				lualine_b = {
					space,
				},
				lualine_c = {

					filename,
					filetype,
					space,
					branch,
					diff,
				},
				lualine_x = {
					space,
				},
				lualine_y = {
					encoding,
					fileformat,
					space,
				},
				lualine_z = {
					dia,
					lsp,
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			-- tabline = {
			--     lualine_a = {
			--         buffer,
			--     },
			--     lualine_b = {
			--     },
			--     lualine_c = {},
			--     lualine_x = {
			--         tabs,
			--     },
			--     lualine_y = {
			--         space,
			--     },
			--     lualine_z = {
			--     },
			-- },
			winbar = {},
			inactive_winbar = {},
		})

		require("lualine").setup({

			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					-- tabline = 1000,
					winbar = 1000,
				},
			},

			sections = {
				lualine_a = {
					--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
					modes,
					vim_icons,
					--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
				},
				lualine_b = {
					space,
				},
				lualine_c = {

					filename,
					filetype,
					space,
					branch,
					diff,
				},
				lualine_x = {
					space,
				},
				lualine_y = {
					encoding,
					fileformat,
					space,
				},
				lualine_z = {
					dia,
					lsp,
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			-- tabline = {
			--     lualine_a = {
			--         buffer,
			--     },
			--     lualine_b = {
			--     },
			--     lualine_c = {},
			--     lualine_x = {
			--         tabs,
			--     },
			--     lualine_y = {
			--         space,
			--     },
			--     lualine_z = {
			--     },
			-- },
			winbar = {},
			inactive_winbar = {},
		})
	end,
}
