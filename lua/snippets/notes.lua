local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- ∀∃□¬∨∧∑λ∈∅

local function get_date()
	return os.date("%m-%d-%Y")
end

return {

	-- latex
	s("$", {
		t({ "$$", "" }),
		i(1, ""),
		t({ "", "$$" }),
	}),

	-- math plain text snippets
	s("lam", t("λ")),
	s("lsm", t("∃")),
	s("lal", t("∀")),
	s("land", t("∧")),
	s("lor", t("∨")),
	s("lnot", t("¬")),
	s("lin", t("∈")),
	s("nil", t("∅")),
	s("summ", t("∑")),

	-- people
	s("Jean", t("Jean-Paul Sartre")),
	s("Sim", t("Simone de Beauvoir")),
	s("Gabriel", t("Gabriel Marcel")),

	-- gen words
	s("exist", t("existentialist")),
	s("phil", t("philosophy")),
	s("phil", t("philosophical")),
	s("bec", t("because")),
	s("there", t("therefore")),
	s("math", t("mathematical")),
	s("org", t("organization")),
	s("cs", t("computer Science")),
	s("pe", t("people")),
	s("pe", t("person")),
	s("dif", t("different")),

	-- misc

	s("head", {
		t({ "-- Michael Williams", "" }),
		t("-- Date: "),
		f(get_date, {}),
		t({ "", "-- Title: " }),
		i(1, "add title here"),
	}),
	-- markdown stuff
	s("td", t("- [ ]")),
	s("td", t("- [x]")),
}
