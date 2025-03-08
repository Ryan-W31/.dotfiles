local lsp_attach_function = function() end
local get_capabilites = function()
  local success, blink = pcall(require, "blink.cmp")
  if not success then
    return vim.lsp.protocol.make_client_capabilities()
  else
    return blink.get_lsp_capabilities()
  end
end
return {
  {
    "williamboman/mason.nvim",
    lazy=true,
    opts = {
      ui = {
        border = _border,
      },
      registries = { "github:mason-org/mason-registry", "github:nvim-java/mason-registry" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy=true,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local capabilities = get_capabilites()
      --- @diagnostic disable-next-line: missing-fields
      require("mason-lspconfig").setup({
        -- Replace the language servers listed here
        -- with the ones you want to install
        ensure_installed = { "clangd", "markdown_oxide", "lua_ls", "bashls", "jsonls", "pyright", "yamlls", "jdtls" },
        handlers = {
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              on_attach = lsp_attach_function,
              capabilities = capabilities,
              settings = {
                Lua = {
                  format = {
                    enable = false,
                  },
                },
              },
            })
          end,
          ["bashls"] = function()
            require("lspconfig").bashls.setup({
              on_attach = lsp_attach_function,
              capabilities = capabilities,
              filetypes = { "sh", "zsh" },
            })
          end,
          ["pyright"] = function()
            require("lspconfig").pyright.setup({
              on_attach = lsp_attach_function,
              capabilities = capabilities,
              flags = {
                debounce_text_changes = 150,
              },
              settings = {
                python = {
                  -- pythonPath = get_python_path(), -- Use the same function to detect the Python path
                  analysis = {
                    typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                  },
                },
              },
            })
          end,
          ["html"] = function()
            local html_capabilities = get_capabilites()
            html_capabilities.textDocument.completion.completionItem.snippetSupport = true
            html_capabilities.textDocument.publishDiagnostics = {
              relatedInformation = true,
            }
            require("lspconfig").html.setup({
              on_attach = lsp_attach_function,
              capabilities = html_capabilities,
              cmd = { "vscode-html-language-server", "--stdio" },
              filetypes = { "html" },
              init_options = {
                configurationSection = { "html", "css", "javascript" },
                embeddedLanguages = {
                  css = true,
                  javascript = true,
                },
                provideFormatter = true,
              },
              settings = {},
              single_file_support = true,
            })
          end,
          ["yamlls"] = function()
            require("lspconfig").yamlls.setup({
              on_attach = lsp_attach_function,
              capabilities = capabilities,
              settings = {
                yaml = {
                  validate = true,
                  -- disable the schema store
                  schemaStore = {
                    enable = false,
                    url = "",
                  },
                  -- manually select schemas
                  schemas = {
                    ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
                    ["https://spec.openapis.org/oas/3.1/schema/2022-10-07"] = "openapi.{yml,yaml}",
                    },
                  format = {
                    enable = false,
                  },
                },
              },
            })
          end,
          ["clangd"] = function()
            local clangd_capabilities = get_capabilites()
            clangd_capabilities.textDocument.completion.completionItem.snippetSupport = true
            require("lspconfig").clangd.setup({
              on_attach = lsp_attach_function,
              capabilities = clangd_capabilities,
              cmd = {
                "clangd",
                "--background-index",
                "--suggest-missing-includes",
                "--all-scopes-completion",
                "--completion-style=detailed",
              },
            })
          end,
          function(server_name)
            require("lspconfig")[server_name].setup({
              on_attach = lsp_attach_function,
              capabilities = capabilities,
            })
          end,
        },
      })
    end,
  },
{
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    cmd = "Mason",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      -- popup borders
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = _border })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = _border })
      require("lspconfig.ui.windows").default_options = {
        border = _border,
      }
      vim.diagnostic.config({
        float = { border = _border },
      })
      -- diagnostic icons
      -- lsp_zero.set_sign_icons({ error = '✘', warn = '▲', hint = '⚑', info = '»' })
      vim.diagnostic.config({
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      })
    end,
  },
}
