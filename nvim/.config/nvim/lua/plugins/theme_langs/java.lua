local javaColors = function(hl)
	hl["@lsp.type.annotation.java"] = {
		fg = "#B4F9E8",
	}
	hl["@lsp.type.namespace.java"] = {
		fg = "#0DB9D7",
	}
	hl.javaClassDecl = {
		fg = "#9D7CD8",
	}
	hl.javaAnnotation = {
		fg = "#B4F9E8",
	}
	hl.javaParen = {
		fg = "#7DCFFF",
	}
	hl.javaParen1 = {
		fg = "#7DCFFF",
	}
	hl.Statement = {
		fg = "#9D7CD8",
		italic = true,
	}
	hl.javaConstant = {
		fg = "#9D7CD8",
		italic = true,
	}
	hl["@lsp.type.enumMember.java"] = {
		fg = "#7AA2F7",
		bold = true,
	}
	hl["@lsp.typemod.class.public.java"] = {
		fg = "#0DB9D7",
		bold = false,
	}
	hl["@lsp.typemod.enum.public.java"] = {
		fg = "#0DB9D7",
		bold = false,
	}
	hl["@lsp.type.property.java"] = {
		fg = "#C0CAF5",
	}
	hl["@lsp.type.variable.java"] = {
		fg = "#C0CAF5",
	}
	hl["@lsp.typemod.property.readonly.java"] = {
		fg = "#7AA2F7",
		bold = true,
	}
	hl["@lsp.type.parameter.java"] = {
		fg = "#C0CAF5",
	}
end
