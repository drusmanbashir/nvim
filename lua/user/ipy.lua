vim.cmd[[
command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")
]]
vim.g['nvim_ipy_perform_mappings']=0
-- vim.g['ipy_set_ft']=0
vim.g['ipy_celldef']="^##"


vim.cmd[[nmap <silent> <leader>k :RunQtConsole<Enter>]]
vim.cmd[[nmap <silent> <leader>j :IPython<Space>--existing<Space>--no-window<Enter>]]
vim.cmd[[nmap → <Plug>(IPy-RunCell)]] -- altgr i
vim.cmd[[nmap Â¶ <Plug>(IPy-RunAll)]] -- altgr r
