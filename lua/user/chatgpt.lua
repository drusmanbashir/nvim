local home = vim.fn.expand("$HOME")
require("chatgpt").setup({
    api_key_cmd = "gpg --decrypt --batch --passphrase 'barrium'" .. home .. ".config/chatgpt.txt.gpg"
})
