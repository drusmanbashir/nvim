local status_ok, which_key = pcall(require, "which-key")

if not status_ok then
  return
end

function get_visual_selection()
  local vstart = vim.fn.getpos("'<")
  local vend = vim.fn.getpos("'>")
  local line_start = vstart[2]
  local line_end = vend[2]
  if line_start > line_end then
    line_start, line_end = line_end, line_start
  end
  return {line_start, line_end}
end



function ReplaceSelfWithInput()
  local input = vim.fn.input('Enter replacement string for self: ')
  local rng = get_visual_selection()
  local line_start = rng[1]
  local line_end = rng[2]
  vim.cmd(line_start .. "," .. line_end .. "s/self/" .. input .. "/g")
end

function ReplaceInputWithSelf()
  local input = vim.fn.input('Enter string to replace with self: ')
  local rng = get_visual_selection()
  local line_start = rng[1]
  local line_end = rng[2]
  vim.cmd(line_start .. "," .. line_end .. "s/" .. input .. "\\./self./g")
end



local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 3,                                                                -- spacing between columns
    align = "left",                                                             -- align columns left, center or right
  },
  ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  triggers = "auto",                                                            -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local function rename()
  return ":IncRename " .. vim.fn.expand("<cword>")
end

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["C"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["p"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  b = {
    name = "Buffers",
    b = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
    },
    o = { ":%bd|e#|bd!#<cr>", "Only this Buffer" },
  },

  e = {
    -- this versioun is for  shaturs
    name = "Sessions",
    e = { ":SessionManager load_session<CR>", "Find session" },
    l = { ":SessionManager load_last_session<cr>", "Load most recent session" },
    s = { ":SessionManager save_current_session<CR>", "Save current session" },
  },

  m = {
    name = "CMake",

    b = { "<cmd>CMakeBuild<cr>", "Build" },
    g = { "<cmd>CMakeGenerate<cr>", "Generate" },
    c = { "<cmd>CMakeClean<cr>", "Clean" },
    q = { "<cmd>CMakeQuickRun<cr>", "Quick Run" },
    r = { "<cmd>CMakeRun<cr>", "Run" },
  },

  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },
  i = {
    name = "Iron",
    i = { "<cmd>IronFocus<cr>", "Focus" },
    c = { "<cmd>IronSend! \04<cr><cmd>IronFocus<cr>iy<cr><cr>", "Close" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    wl = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "Workspace Folders" },
    wa = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Workspace Add Folder" },
    wr = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Workspace Remove Folder" },
    f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format" },
  c = { "<cmd>cclose<cr>", "Close" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  j = {
    "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
    "Next Diagnostic",
  },
  k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
    o = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open Diagnostic" },
    q = { "<cmd>lua vim.lsp.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    -- r = {}
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  -- t={
  --   name = "Trouble",
  --   t = {"<cmd>TroubleRefresh<cr>", "Refresh"}
  --   },
  c = {
    name = "ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", },
  },

  o = {
    name = "Trouble",
    t = { "<cmd>TroubleToggle<cr>", "Toggle" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
    o = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "QuickFix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "LocList" },
    e = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
  },
  r = {
    name = "nvim-r",
    r = { ":RStart<CR>", "Start R" },
    f = { "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract to file" },
  },
  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  d = {
    name = "Debug",
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
    E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
    C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
    S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    F4 = { '<cmd>lua require"dap".up()<CR>', "Up" },
  },
  -- y = {
  --   name = "IPy",
  --   u = {":RunQtConsole<cr>","Qt Console"},
  --   t = {":IPython<Space>--existing<Space>--no-window<cr>", "IPython Connect"}
  -- }
}

local v_opts = {
  mode = "v",     -- VISUAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
  expr = false,
}

local v_mappings = {
  c = {
    name = "ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", },
  },
  p = {
    name = "wrap",
    s = { [[ c[<c-r>"]<esc>] ]], "[]" },
    c = { [[ c{<c-r>"}<esc> ]], "{}" },
    r = { [[c(<c-r>")<esc>]], "()" },
  },
  e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
  r = {
    name = "refactoring",
    e = { "<Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract function" },
    f = { "<Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "Extract to file" },
    v = { "<Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract variable" },
    i = { "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
    r = { "<Cmd> lua require('refactoring').select_refactor()<CR>", "NVIM refactor" },
  },

  s = {
    name = "self replace",
    s = { "<Esc><Cmd>lua ReplaceSelfWithInput() <CR>", "Self > Input " },
    i = { "<Esc><Cmd>lua ReplaceInputWithSelf()<CR>", "Input > Self " },
  },


}
local i_opts = {
  mode = "i",
  prefix = "<leader>x",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
  expr = false,
}

local i_mappings = {
  e = {
    name = "Sessions",
    e = { ":Telescope sessions<CR>", "Find session" },
    l = { ":LoadLastSession!<CR>", "Load most recent session" },
    s = { ":SaveSession<CR>", "Save current session" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(i_mappings, i_opts)
which_key.register(v_mappings, v_opts)
