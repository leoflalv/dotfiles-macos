local conform_setup, conform = pcall(require, "conform")
if not conform_setup then
	return
end

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { "markdownlint" },
		css = { "stylint" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		async = false,
		lsp_fallback = true,
	},
})
