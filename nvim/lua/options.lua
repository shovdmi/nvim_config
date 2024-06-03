vim.opt.number      = true  -- numbered lines
vim.opt.cursorline  = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth  = 2
vim.opt.expandtab   = true
vim.opt.hlsearch    = true
vim.opt.incsearch   = true

vim.opt.signcolumn  = 'yes' -- left-hand column denoting a breakpoint

vim.opt.smartindent = true
vim.opt.colorcolumn = '119' --Расположение цветной колонки

vim.opt.showcmd     = true

vim.opt.swapfile    = false
vim.opt.backup      = false
-- vim.opt.undodir     = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile    = true

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]



-- http://vimcasts.org/episodes/show-invisibles/
-- Use the same symbols as TextMate for tabstops and EOLs
-- Dot symbols: • · ∙ ␣  ˷
-- eols : § ↲ ¬ ⇰  ⇢
-- tabs : ← → ¤ ▸ \u25b8 \<Char-0x25B8>
-- trail: ☻ \u221 ★  ␠
-- extends:⟩,precedes:⟨
--set invlist
vim.o.list=true
vim.o.showbreak='↪'

--vim.cmd [[set listchars=tab:\¤\ ,trail:\☻,extends:#,nbsp:.]]
vim.opt.listchars={eol = '↲', tab = '←-→', trail =  '☻'}
--
-- Invisible character colors
--vim.cmd [[set t_Co=256]]
vim.api.nvim_set_hl(0,'NonText',   { fg='#404060' }) -- 'NonText'    for 'eol', 'extends' and 'precedes'
vim.api.nvim_set_hl(0,'Whitespace',{ ctermfg=155, fg='#405a66' }) -- 'Whitespace' for 'nbsp', 'space', 'tab', 'multispace', 'lead' and 'trail'
