if not require("tilde.utils").assert_plug("nvim-colorizer.lua") then
	return
end

-- this needs to be set before invoking the plugin setup...
vim.o.termguicolors = true

require("colorizer").setup({
	"cljs",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"html",
	"css",
	"scss",
	"json",
})
