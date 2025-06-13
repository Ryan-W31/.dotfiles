return {
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
}
