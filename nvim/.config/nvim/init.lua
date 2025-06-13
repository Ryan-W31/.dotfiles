require("config.settings")
require("config.lazy")
require("config.autocmds")

vim.lsp.enable({ "bashls", "clangd", "jdtls", "luals", "marksman", "html", "pyright", "yamlls" })
