require('minintro').setup{
}


-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")


-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup{
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require'luasnip'.lsp_expand(args.body) -- Luasnip expand
		end,
	},

	-- Клавиши, которые будут взаимодействовать в nvim-cmp
	mapping = cmp.mapping.preset.insert {
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Esc>'] = cmp.mapping.close(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

		-- Вызов меню автодополнения
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		--['<CR>'] = cmp.config.disable,                      -- Я не люблю, когда вещи автодополняются на <Enter>
		['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок

		-- Используем <C-e> для того чтобы прервать автодополнение
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(), -- Прерываем автодополнение
			c = cmp.mapping.close(), -- Закрываем автодополнение
		}),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		--{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
		{ name = 'buffer' },
		{ name = 'path' },
		{ name = "emoji" },
	}, {
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	}
}


require'lspconfig'.clangd.setup{
-- https://stackoverflow.com/questions/76625619/is-it-possible-to-override-or-augment-neovims-lsp-configuration-via-a-workspace

   --cmd = {
   --     "~/.espressif/tools/esp-clang/bin/clangd",
   --     "--pretty",
   --     "--header-insertion=iwyu",
   --     .....
   --     "--compile-commands-dir=.",
   -- },
    filetypes = { "c", "cc", "cpp", "objc", "objcpp", "cuda", "proto" },
    capabilities = lsp_capabilities,
    function(fname)
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
}

vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {
}