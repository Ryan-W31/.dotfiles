local home = vim.env.HOME -- Get the home directory
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name

local system_os = "linux"
if vim.fn.has("mac") == 1 then
  system_os = "mac"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  system_os = "win"
end

local jdtls = require("jdtls")
local mason = require("mason-registry")
local jdtls_path = mason.get_package("jdtls"):get_install_path()
local java_debug_path = mason.get_package("java-debug-adapter"):get_install_path()
local java_test_path = mason.get_package("java-test"):get_install_path()
local config_path = vim.fn.glob(jdtls_path .. "/config_" .. system_os)
local lombok_path = jdtls_path .. "/lombok.jar"
local equinox_launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

local bundles = { vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar") }
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "/Library/Java/JavaVirtualMachines/applejdk-21.0.6.7.1.jdk/Contents/Home/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. lombok_path,
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    equinox_launcher_path,
    "-configuration",
    config_path,
    "-data",
    workspace_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  -- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),
  root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew" }),
  -- on_attach = require('gmr.configs.lsp').on_attach,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
      server = { launchMode = "Hybrid" },
      -- TODO Replace this with the absolute path to your main java version (JDK 17 or higher)
      home = "/Library/Java/JavaVirtualMachines/applejdk-21.0.6.7.1.jdk/Contents/Home",
      jdt = { ls = { java = { home = "/Library/Java/JavaVirtualMachines/applejdk-21.0.6.7.1.jdk/Contents/Home" } } },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        -- The runtime name parameters need to match specific Java execution environments.  See https://github.com/tamago324/nlsp-settings.nvim/blob/2a52e793d4f293c0e1d61ee5794e3ff62bfbbb5d/schemas/_generated/jdtls.json#L317-L334
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/Library/Java/JavaVirtualMachines/applejdk-17.0.1.12.1.jdk/Contents/Home",
          },
          {
            name = "JavaSE-21",
            path = "/Library/Java/JavaVirtualMachines/applejdk-21.0.6.7.1.jdk/Contents/Home",
          },
        },
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      signatureHelp = { enabled = true },
      format = {
        enabled = true,
      },
      completion = {
        -- favoriteStaticMembers = {
        --   "org.hamcrest.MatcherAssert.assertThat",
        --   "org.hamcrest.Matchers.*",
        --   "org.hamcrest.CoreMatchers.*",
        --   "org.junit.jupiter.api.Assertions.*",
        --   "java.util.Objects.requireNonNull",
        --   "java.util.Objects.requireNonNullElse",
        --   "org.mockito.Mockito.*",
        -- },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
  },
  -- Needed for auto-completion with method signatures and placeholders
  -- capabilities = require("blink.cmp").get_lsp_capabilities(),
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    --   -- References the bundles defined above to support Debugging and Unit Testing
    bundles = bundles,
    -- extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
  on_attach = function(_, _)
    jdtls.setup_dap({ config_overrides = { hotcodereplace = "auto" } })
    require("jdtls.dap").setup_dap_main_class_configs()
  end,
}

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)

vim.diagnostic.config({
  underline = {
      vim.diagnostic.severity.ERROR,
      vim.diagnostic.severity.WARN,
  },
  virtual_text = {
    severity = {
      vim.diagnostic.severity.ERROR,
    },
  },
})
