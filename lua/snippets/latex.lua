local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node

return {

	-- simple symbols
	s("int", t("mathbb{Z}")),
	s("intp", t("mathbb{Z^{+}}")),
	s("tf", t("\\therefore")),

	-- flushleft
	s("fll", {
		t("\\begin{flushleft}"),
		i(1, "content"),
		t("\\end{flushleft}"),
	}),

	-- align*
	s("ali", {
		t("\\begin{align*}"),
		i(1, "content"),
		t("\\end{align*}"),
	}),

	-- basic header stuff
	s("head", {
		t({ "\\documentclass{article}", "" }),
		t({ "\\usepackage{amsmath}", "" }),
		t({ "\\usepackage{amssymb}", "" }),
		t({ "\\usepackage{amssymb}", "", "" }),
		t({ "\\title{" }),
		i(1, "title"),
		t({ "}", "" }),
		t({ "\\author{Michael Williams}", "" }),
		t({ "\\date{\\today}", "", "" }),
		t({ "\\begin{document}", "" }),
		t({ "\\maketitle", "" }),
		i(2, "content"),
		t({ "", "\\end{document}" }),
	}),

	-- basic header stuff
	s("frac", {
		t("\\frac{"),
		i(1, "num"),
		t("}{"),
		i(2, "denom"),
		t("}"),
	}),

	-- summation
	s("sum", {
		t("\\sum_{"),
		i(1, "low"),
		t("}^{"),
		i(2, "high"),
		t("}"),
		i(3, ""),
	}),

	-- function
	s("fn", {
		i(1, "fn_name"),
		t("("),
		i(2, "arg(s)"),
		t(") = "),
		i(3, "fn def."),
	}),
}
