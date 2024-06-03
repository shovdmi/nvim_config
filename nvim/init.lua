require("plugins") -- :e ~\AppData\Local\nvim\lua\plugins.lua
require("keymaps") -- :e ~\AppData\Local\nvim\lua\keymaps.lua
require("options") -- :e ~\AppData\Local\nvim\lua\options.lua
--

-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=300}
augroup end
]], false)