-- local iron = require('iron')
--
-- -- iron.core.add_repl_definitions {
-- --   python = {
-- --     mycustom = {
-- --       command = {"mycmd"}
-- --     }
-- --   },
-- --   clojure = {
-- --     lein_connect = {
-- --       command = {"lein", "repl", ":connect"}
-- --     }
-- --   }
-- -- }
--
-- iron.core.set_config {
--   scope = require("iron.scope").singleton,
--   preferred = {
--     python = "ipython",
--     clojure = "lein"
--   },
--   repl_open_cmd='to 25 split',
--   buflisted=false,
-- }
--
--
--
local iron = require("iron.core")
--
iron.setup {
  config = {
   
    buflisted = false,
    -- If iron should expose `<plug>(...)` mappings for the plugins
    -- should_map_plug = true,
    -- Whether a repl should be discarded or not
    scope = require("iron.scope").singleton,
    scratch_repl = true,
    close_window_on_exit = true,
    -- Your repl definitions come here
    repl_open_cmd='to 25 split',
    repl_definition = {
     python = require("iron.fts.python").ipython,
     sh = {
        command = {"zsh"}
      },
     sage = {
        command ={"sage"}
      }
    },
  },
  -- Iron doesn't set keymaps by default anymore. Set them here
  keymaps = {
  --   -- send_motion = "<M-t>",
    clear = "<space>cl",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    send_line = "<space>sl",
    send_mark = "<space>xm",
    send_motion = "<M-c>",
    visual_send = "<M-e>",
    --[[ exit = "<space>sq", ]]
  },
  visibility={single=true}
}
vim.cmd [[nmap <M-e> <space>slj]]
-- vim.cmd [[nmap <M-x> ctraj/^# %%<CR><CR>]]
vim.cmd [[nmap <M-x> l[hj<M-c>v]h]h]]
vim.cmd [[nmap <M-y> v$<M-e>]]

