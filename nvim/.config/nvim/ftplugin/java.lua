local home = vim.env.HOME -- Get the home directory
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name

local jdtls = require("jdtls")
local mason_path = vim.fn.stdpath("data") .. "/mason/share"

local jdtls_path = vim.fn.glob(mason_path .. "/jdtls")
local java_debug_path = vim.fn.glob(mason_path .. "/java-debug-adapter")
local java_test_path = vim.fn.glob(mason_path .. "/java-test")

local config_path = vim.fn.glob(jdtls_path .. "/config")
local lombok_path = jdtls_path .. "/lombok.jar"
local equinox_launcher_path = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

local bundles = { vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar") }
vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"/opt/homebrew/Cellar/openjdk/25.0.1/libexec/openjdk.jdk/Contents/Home",
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

	root_dir = vim.fs.root(0, {
		".git",
		"gradlew",
		"build.gradle",
		"build.gradle.kts",
		"build.xml",
		"pom.xml",
		"settings.gradle",
		"settings.gradle.kts",
	}),
	filetypes = { "java" },

	init_options = {
		--   -- References the bundles defined above to support Debugging and Unit Testing
		bundles = bundles,
		-- extendedClientCapabilities = jdtls.extendedClientCapabilities,
		settings = {
			java = {
				imports = { -- <- this
					gradle = {
						enabled = true,
						wrapper = {
							enabled = true,
							checksums = {
								{
									sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
									allowed = true,
								},
							},
						},
					},
				},
			},
		},
	},
	settings = {
		java = {
			server = { launchMode = "Hybrid" },
			-- TODO Replace this with the absolute path to your main java version (JDK 17 or higher)
			home = "/opt/homebrew/Cellar/openjdk/25.0.1/libexec/openjdk.jdk/Contents/Home",
			jdt = {
				ls = {
					java = { home = "/opt/homebrew/Cellar/openjdk/25.0.1/libexec/openjdk.jdk/Contents/Home" },
					lombokSupport = true,
				},
			},
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
						name = "JavaSE-25",
						path = "/opt/homebrew/Cellar/openjdk/25.0.1/libexec/openjdk.jdk/Contents/Home",
					},
					{
						name = "JavaSE-21",
						path = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home",
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
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
		},
	},
	-- Needed for auto-completion with method signatures and placeholders
	-- capabilities = require("blink.cmp").get_lsp_capabilities(),
	flags = {
		allow_incremental_sync = true,
	},

	on_attach = function(_, _)
		jdtls.setup_dap({ config_overrides = { hotcodereplace = "auto" } })
		require("jdtls.dap").setup_dap_main_class_configs()
	end,
}

jdtls.start_or_attach(config)
