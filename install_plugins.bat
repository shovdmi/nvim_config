SET current_dir=%~dp0
git clone https://github.com/neovim/nvim-lspconfig           --depth 1 %current_dir%nvim/pack/nvim/start/nvim-lspconfig
git clone https://github.com/folke/which-key.nvim.git        --depth 1 %current_dir%nvim/pack/nvim/start/which-key.nvim
													        
git clone https://github.com/hrsh7th/nvim-cmp.git            --depth 1 %current_dir%nvim/pack/nvim/start/nvim-cmp
git clone https://github.com/onsails/lspkind.nvim.git        --depth 1 %current_dir%nvim/pack/nvim/start/lspkind.nvim
git clone https://github.com/hrsh7th/cmp-nvim-lsp.git        --depth 1 %current_dir%nvim/pack/nvim/start/cmp-nvim-lsp
git clone https://github.com/L3MON4D3/LuaSnip.git            --depth 1 %current_dir%nvim/pack/nvim/start/LuaSnip

git clone https://github.com/olimorris/onedarkpro.nvim.git   --depth 1 %current_dir%nvim/pack/nvim/start/onedarkpro.nvim

git clone https://github.com/akinsho/bufferline.nvim.git     --depth 1 %current_dir%nvim/pack/nvim/start/bufferline.nvim
git clone https://github.com/nvim-tree/nvim-web-devicons.git --depth 1 %current_dir%nvim/pack/nvim/start/nvim-web-devicons

git clone https://github.com/liuchengxu/vista.vim.git        --depth 1 %current_dir%nvim/pack/nvim/start/vista.vim

git clone https://github.com/mfussenegger/nvim-dap.git       --depth 1 nvim/pack/nvim/start/nvim-dap