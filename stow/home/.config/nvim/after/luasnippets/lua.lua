return {
	s("M", {
		t({ "local M = {}", "", "" }),
		i(0),
		t({ "", "", "return M" }),
	}),
	s("#!", {
		t({ "#!/usr/bin/env lua", "", "" }),
		i(0),
	}),
	s({
		trig = "sreq",
		namr = "Safe require",
		dscr = "Try to require a module and return if it fails",
	}, {
		t({ "local status_ok, " }),
		i(1, "var_name"),
		t({ " = pcall(require, '" }),
		i(2, "mod-name"),
		t({ "')", "if not status_ok then", "  return", "end", "" }),
		i(0),
	}),
	s("lua_plug", {
		t({ "if not require('tilde.utils').assert_plug('" }),
		i(1, "plugname"),
		t({ "') then return end", "" }),
	}),
}
