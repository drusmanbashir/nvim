local servers = {
	"lua_ls",
	-- "cssls",
	-- "html",
	-- "tsserver",
	"pyright",
	-- "bashls",
	"clangd",
	"jsonls",
	-- "yamlls",
}

local settings = {
	ensure_installed = {},
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "clangd" then
		local clang_opts = require("usr.lsp.settings.clangd")
		opts = vim.tbl_deep_extend("force", clang_opts, opts)
		opts.on_attach = function(client, bufnr)
			require("usr.lsp.handlers").on_attach(client, bufnr)

			-- winbar showing the current function
			if client.server_capabilities.documentSymbolProvider then
				vim.notify("The nvim-navic is attached", vim.log.levels.INFO)
				require("nvim-navic").attach(client, bufnr)
			end

			local caps = client.server_capabilities
			if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
				local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
				vim.api.nvim_create_autocmd("TextChanged", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.semantic_tokens_full()
					end,
				})
				-- fire it first time on load as well
				vim.lsp.buf.semantic_tokens_full()
			end
		end
	end

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
