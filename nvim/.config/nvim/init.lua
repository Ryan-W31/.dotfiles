require("config.settings")
require("config.lazy")
require("config.autocmds")

vim.lsp.enable({ "bashls", "clangd", "luals", "html", "pyright", "yamlls" })
