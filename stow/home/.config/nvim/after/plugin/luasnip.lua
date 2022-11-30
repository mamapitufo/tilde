if not require("tilde.utils").assert_plug("LuaSnip") then
	return
end

local luasnip = require("luasnip")

luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = false,
})

require("luasnip.loaders.from_snipmate").lazy_load()

-- keyboard mappings
vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })
