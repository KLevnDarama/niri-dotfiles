require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	float = {
		transparent = true,
		solid = true,
	},
	term_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
	lsp_styles = {
		virtual_text = {
			errors = { "italic" },
			hints = { "italic" },
			warnings = { "italic" },
			information = { "italic" },
			ok = { "italic" },
		},
		underlines = {
			errors = { "underline" },
			hints = { "underline" },
			warnings = { "underline" },
			information = { "underline" },
			ok = { "underline" },
		},
		inlay_hints = {
			background = false,
		},
	},
})

vim.cmd.colorscheme("catppuccin-nvim")
