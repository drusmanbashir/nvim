local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<M-l>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<Leader>j", ":SymbolsOutline<cr>", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-S-j>", "<C-w>J", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-S-k>", "<C-w>K", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-q>", ":q<cr>", opts)
keymap("i", "<C-q>", "<Esc>:q<cr>", opts)
keymap("n", "<M-m>", ":MaximizerToggle<cr>", opts)
keymap("i", "<M-m>", "<Esc>:MaximizerToggle<Cr>", opts)
-- Resize with arrows
-- Move text up and down
-- keymap("n", "<M-j>", "<Esc>:m .+1<CR>==gi<Esc>", opts)
keymap("n", "<M-k>", "<Esc>:m .-2<CR><Esc>", opts)
keymap("i", "<M-/>", "<Esc>$a", opts)
keymap("n", "<M-j>", "<Esc>:m .+1<CR><Esc>", opts)
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("n", "<M-p>", ":pu<cr>", opts) -- puts in next line


keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)
vim.cmd [[:nnoremap <M-r> :%s/\<<C-r><C-w>\>//g<Left><Left>]] --- replace text under cursor
keymap("n", "<C-M-k>", ":resize +2<CR>", opts)
keymap("n", "<C-M-j>", ":resize -2<CR>", opts)
keymap("n", "<C-M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-M-l>", ":vertical resize +2<CR>", opts)

-- keymap("n", "<M-Left>", ":vertical resize +30<CR>", opts)
-- keymap("n", "<M-Right>", ":vertical resize -30<CR>", opts)
-- Navigate buffers
keymap("n", "<C-i>" ,":%s/.*# %%/# %%<CR>" ,opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<M-o>", ":only<cr>", opts)
keymap("i", "<M-o>", "<Esc>:only<cr>", opts)
-- Navigate tabs(!)
keymap("i", "¹", "<esc>:tabprevious<cr>a", opts) -- altgr 1
keymap("i", "<C-CR>", "<Esc><Cmd>lua require('cmp').mapping.abort()<Cr>i<cr>", opts) -- altgr 1 -- kitty terminal

keymap("i", "²", "<esc>:tabnext<cr>a", opts) -- atlgr 2
keymap("i", "ŧ", "<esc>:tabnew<cr>a", opts) -- altr t
keymap("i", "¢", "<esc>:tabclose<cr>a", opts) -- altr t

keymap("n", "¹", ":tabprevious<cr>", opts) -- altgr 1
keymap("n", "²", ":tabnext<cr>", opts) -- atlgr 2
keymap("n", "ŧ", ":tabnew<cr>", opts) -- altr t
keymap("n", "¢", ":tabclose<cr>", opts) -- altr t

-- fold

keymap("n", "đ", "za", opts) --- altgr f


-- Keeping centered with z
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Undo breakpoints
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Text formatting
keymap("n", "<M-f>", ":%s/.*# %%/# %%<cr>", opts)
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- Visual - -
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "ħ", "<cmd>nohlsearch<cr>", opts) --altgr h
keymap("i", "ħ", "<cmd>nohlsearch<CR>", opts) --altgr h
---Recording macros
-- keymap("n", "\\,","qq", opts)
-- keymap("n", "\\\\", "@q",opts)


keymap("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
  { noremap = true, silent = true, expr = false })
keymap("v", "<Leader>rt", [[ <Esc><Cmd>lua M.refactors()<CR>]], { noremap = true, silent = true, expr = false })

-- Visual Block --
-- Text manipulation
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- Registers

keymap("v", "<Del>", "\"_d", opts)
--Tagbar -------------------
-- keymap ("n", "<c-p>", ":TagbarToggle<CR>", opts)
-- keymap ("i", "<c-p>", "<Esc>:TagbarToggle<CR>", opts)
-- REPL ---------------------
keymap("n", "<leader>l", ":>", opts)


keymap("n", "<M-a>", ":Alpha<CR>", opts)
-- Jumplist mutations
vim.cmd [[nnoremap <expr> k (v:count >5 ? "m'" . v:count :"") . 'k']]
vim.cmd [[nnoremap <expr> j (v:count >5 ? "m'" . v:count :"") . 'j']]

-- Quiclist

keymap("n", "<C-Down>", ":cn<CR>", opts)
keymap("n", "<C-Up>", ":cp<CR>", opts)
keymap("n", "<F9>", ":DapContinue<CR>", opts)
keymap("n", "<F8>", ":DapStepOver<CR>", opts)
keymap("n", "<F7>", ":DapStepInto<CR>", opts)
keymap("n", "<F12>", ":DapTerminate<CR>", opts)
-- keymap("n", "<F2>", ":DapToggleBreakpoint<CR>",opts)
keymap("n", "<F2>", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
keymap("n", "<S-F2>", "<cmd> lua require('dap').set_breakpoint()<CR>", opts)
keymap("n", "<YourKey2>", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
keymap('n', '<S-F4>', '<cmd>lua require"dap".down()<CR>', opts)
keymap('n', '<F4>', '<cmd>lua require"dap".up()<CR>', opts)

vim.cmd [[nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>]]
vim.cmd [[nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>]]
vim.cmd [[vnoremap <silent> <M-S-e> <ESC>:lua require('dap-python').debug_selection()<CR>]]

-- keymap ('n', 'R',":NvimTreeRefresh<CR>",opts)
vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]]

---  DAP ----------------------------------------------------------------------------


---  SAVE FILE -------------------------------------------------

keymap("n", "<C-s>", ":w<cr>", opts)
keymap("i", "<C-s>", "<Esc>:w<cr>a", opts)
---keymap("n", "<<Esc><Esc>", vim.call(firenvim) )
-- vim.cmd[[
-- nnoremap <leader>/ :call firenvim#focus_page()<CR>
-- ]]
--

--- C++ -----------------------------------------
vim.cmd [[
augroup cppKB
function! s:customCPPMappings()


   nmap <buffer> <F9> :CMakeQuickRun<CR>
endfunction


   au!
   autocmd filetype cpp call s:customCPPMappings()
augroup end
]]

vim.cmd [[nmap <M-,> <Plug>JupyterExecute<cr>]]
vim.cmd [[nmap <M-.> <Plug>JupyterExecuteAll<cr>]]
vim.cmd [[nmap <C-m> <Plug>MarkdownPreviewToggle]]
keymap("n", "<F5>", ":w<cr> | VimspectorReset<CR>", opts)
keymap("n", "<S-F5>", ":VimspectorReset<CR>", opts)
keymap("n", "<M-R>", ":IronFocus<CR>Iquit()<CR> <C-w>j", opts)
vim.cmd [[nnoremap <leader>x <cmd>lua require('ts_context_commentstring.internal').update_commentstring()<cr>]]

--- TOGGLETERM KEYMAPPINGS
keymap("n", "<F1>", "<cmd>lua _NCDU_TOGGLE()<cr>", opts)
keymap("n", "<F5>", ":ASToggle<CR>", {})
--- LSP
vim.keymap.set("n", "<leader>lr", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
---vim.cmd[[imap <M-e> <Esc><Plug>(iron-send-line)<cr>]]  --- doesn't work
---keymap("n", "<M-e>","<Plug>ReplSendLine",opts)
-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--- LSP

-- keymap("i", "<M-BS>", function()
--   return vim.fn["codeium#Complete"]() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
vim.keymap.set('i', '<M-cr>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set("n", "<leader>lr", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

vim.keymap.set('n', '<M-s>', require('treesj').toggle)
-- For extending default preset with `recursive = true`, but this doesn't work with dot
vim.keymap.set('n', '<M-d>', function()
  require('treesj').toggle({ split = { recursive = true } })
end)
---     C++ CPP ---------------------

vim.cmd [[autocmd! Filetype c,cpp map<buffer> <C-e> : ClangdSwitchSourceHeader<CR>]]
vim.api.nvim_set_keymap(
  "v",
  "<F3>",
  ":<c-u>HSHighlight 1<CR>",
  {
    noremap = true,
    silent = false,
  }
)

vim.api.nvim_set_keymap(
  "v",
  "<S-F3>",
  ":<c-u>HSRmHighlight<CR>",
  {
    noremap = true,
    silent = true
  }
)


