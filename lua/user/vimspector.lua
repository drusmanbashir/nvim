vim.g.vimspector_enable_mappings = "HUMAN"
vim.g.vimspector_base_dir = "/home/ub/.config/vimspector-config"
vim.g["vimspector_sign_priority"]= {
  vimspectorBP=39,
  vimspectorBPCon=38,
  vimspectorBPLog=37,
  vimspectorBPDisabled=36,
  vimspectorPC=999,

}
vim.cmd[[nmap <Leader>dn <Plug>VimspectorBalloonEval<cr>]]

-- Session management
vim.g.vimspector_session_file_name="/home/ub/.config/nvim/.vimspector.session"
vim.api.nvim_command([[
  au SessionLoadPost * silent! VimspectorLoadSession | 
  au! VimLeave * VimspectorMkSession
augroup end
]])

local status_ok,_ = pcall(require,'vimspector')
if not status_ok then
  print ("Could not load Vimspector")
	return
end


