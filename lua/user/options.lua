print("OPTIONS")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cursorline = true,                       -- highlight the current line
  expandtab = true,                        -- convert tabs to spaces
  fileencoding = "utf-8",                  -- the encoding written to a file
  guifont = "monospace:h8",               -- the font used in graphical neovim applications
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  pumheight = 10,                          -- pop up menu height
  relativenumber = true,                  -- set relative numbered lines
  scrolloff = 8,                           -- is one of my fav
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  sidescrolloff = 8,
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                        -- smart case
  autoindent= true,
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  tabstop = 2,                             -- insert 2 spaces for a tab
  timeoutlen = 200,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  wildignore={'*/archived/*'},
  wrap = false,                            -- display lines as one long line
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- foldmethod='expr',
  -- foldexpr="nvim_treesitter#foldexpr()",
  rnu = true ,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
-- vim.g['airline_theme']='nord'
-- vim.g['airline_section_c']='%F' -- show full filepath in statusline
-- vim.api.nvim_command('autocmd CursorHold * update')   --- autosaves file if cursor is idle for 'update' seconds (Not sure if this helps)

vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd "set nofoldenable"
vim.cmd [[syn region Comment start=/"""/ end=/"""/]]
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
-- vim.api.nvim_command('autocmd BufWinLeave * update')   --- autosaves file if cursor is idle for 'update' seconds (Not sure if this helps)
vim.api.nvim_command('autocmd BufNewFile,BufRead *.sws set filetype=sage')   --- autosaves file if cursor is idle for 'update' seconds (Not sure if this helps)
vim.g.loaded_matchparen = 1

-- vim.cmd('autocmd CursorMoved * lua require("mason").update_definitions()')
