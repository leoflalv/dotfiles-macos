local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_tools_status, mason_tools = pcall(require, "mason-tool-installer")
if not mason_tools_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"gopls",
		"html",
		"cssls",
		"lua_ls",
	},
})

mason_tools.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"markdownlint",
		"eslint_d",
	},
	automatic_installation = true,
})
