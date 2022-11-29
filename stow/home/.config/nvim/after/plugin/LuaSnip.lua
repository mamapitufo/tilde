if not require("tilde.utils").assert_plug("LuaSnip") then
	return
end

local luasnip = require("luasnip")

luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = false,
})

require("luasnip.loaders.from_lua").load()

-- keyboard mappings
vim.keymap.set({ "i", "s" }, "<c-enter>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })
vim.keymap.set("i", "<c-l>", function()
	if luasnip.choice.active() then
		luasnip.change_choice(1)
	end
end, { silent = true })
