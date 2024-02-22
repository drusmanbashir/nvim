require "user.lsp.mason"
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return

end

--[[ lspconfig.setup{ ]]
--[[   ensure_installed = vim.tbl_keys(servers), ]]
--[[   automatic_installation=false, ]]
--[[ } ]]
require "user.lsp.lsp-signature"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
-- require'lspconfig'.clangd.setup{}
-- require("ccls").setup {
--     lsp = {
--         -- check :help vim.lsp.start for config options
--         server = {
--             name = "ccls", --String name
--             cmd = {"/usr/bin/ccls"}, -- point to your binary, has to be a table
--             args = {--[[Any args table]] },
--             offset_encoding = "utf-32", -- default value set by plugin
--             root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]), -- or some other function that returns a string
--             --on_attach = your_func,
--             --capabilites = your_table/func
--         },
--     },
-- }
