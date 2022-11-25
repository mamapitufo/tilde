return {
	s("vim_plug", {
		t({ "if !AssertPlugin('" }),
		i(1, "plug_name"),
		t({ "') | finish | endif", "" }),
		i(0),
	}),
}
