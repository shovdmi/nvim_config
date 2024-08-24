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


vim.opt.termguicolors = true
require("bufferline").setup{}

---------------------------------------------------------------------

local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  --'C:\Program Files (x86)\SEGGER\JLink_V644i\JLinkGDBServerCL.exe -select USB -device GD32F405RG -speed 1000 -if SWD -timeout 5000 -port 57447'
  --'C:\SysGCC\arm-eabi-10.3.1-r1\bin\arm-none-eabi-gdb.exe --interpreter mi "C:\Work\p133\projects_vs\VisualGDB\Debug\atol-stb6"'
  --'target remote :57447'
  --lua vim.fn.termopen(cmd)
  command = "C:\\gcc\\xpack-arm-none-eabi-gcc-13.3.1-1.1\\bin\\arm-none-eabi-gdb-py3.exe", -- C:\\SysGCC\\arm-eabi\\bin\\arm-none-eabi-gdb.exe",
  args = {"-ex", "target extended-remote :2331",  "-i", "dap",
  "--eval-command", "set print pretty on",
--  "--quiet",
  "-iex", "set debug dap-log-level 2",
  "-iex", "set debug dap-log-file gdb-dap.log"
  ,"-ex", "set exception-verbose on"
  ,"-ex", "set exception-debugger on"
  ,"-ex", "set debug target on"
  --,"C:\\\\github_repositories\\\\nvim_config\\\\a.elf"
  }
}

--local dap = require("dap")
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
	  --local cmd = { "C:\\Program Files (x86)\\SEGGER\\JLink_V644i\\JLinkGDBServerCL.exe", "-select", "USB",  "-device", "GD32F405RG",  "-speed", "1000",  "-if", "SWD", "-timeout", "5000", "-port", "57447"}
	  --vim.fn.termopen(cmd)
	  --local out = vim.fn.system(cmd)
      
	  --return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
	  --return vim.fn.getcwd() .. '\\\\a.elf'
	  return "C:\\\\github_repositories\\\\nvim_config\\\\a.elf"
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
  },
}

if vim.fn.executable('gdb') == 1 then
   require('plugins.dap.c')
end

dap.configurations.cpp  = dap.configurations.c
dap.configurations.rust = dap.configurations.c

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

dap.set_log_level('TRACE')