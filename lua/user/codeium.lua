codeium =  require("codeium")
codeium.setup({function()
  vim.keymap.set('i', '<M-c>', function () return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
}
)
