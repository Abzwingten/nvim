local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
-----------------------------------------------------------
-- НАВИГАЦИЯ
-----------------------------------------------------------
-- [[ -- Отключаем стрелочки в Нормальном Режиме. Хардко--[[ р ]]
-- map('', '<up>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
-- map('', '<down>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
-- map('', '<left>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
-- map('', '<right>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})


-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim) ]]
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
-- <F5> разные вариации нумераций строк, можно переключаться на ходу
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)

-----------------------------------------------------------
-- РЕЖИМЫ
-----------------------------------------------------------
-- Выходим в нормальный режим через <jk>, чтобы не тянуться
map('i', 'jk', '<Esc>', {noremap = true})
-----------------------------------------------------------
-- ПОИСК
-----------------------------------------------------------
-- Выключить подсветку поиска через комбинацию ,+<space>
map('n', ',<space>', ':nohlsearch<CR>', {noremap = true})
-- Fuzzy Search. CTRL+a для поиска по файлам, CTRL+p для поиска по буфферам
map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)
-- <S-F5> Греповский поиск слова под курсором
map('n', '<S-F5>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Греповский поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-----------------------------------------------------------
-- ФАЙЛЫ
-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
--map('n', '<F8>', ':TagbarToggle<CR>', default_opts)
-- <F4> Дерево файлов. Для иконок следует установить Nerd Font
map('n', '<F4>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)





local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Vim for Colemak
map('', 'n', 'j', {})
map('', 'e', 'k', {})
map('', 'i', 'l', {})
map('', 'j', 'e', {})
map('', 'k', 'n', {})
map('', 'l', 'i', {})
map('', 'K', 'N', {})
map('', 'N', '5j', {})
map('', 'E', '5k', {})
map('', 'L', 'I', {})

map('', 'H', '0', {})
map('', 'I', '$', {})

-- Shortcut for quiting and saving
map('', 'Q', ':q<cr>', {})
map('', 'S', ':w<cr>', {})

-- About buffers
map('n', ',,', '<cmd>sp term://${SHELL}<cr><c-w>x<c-w>w', {})
map('n', '<leader>[]', '<cmd>tabedit<cr>', {})
map('n', '{', '<cmd>bp<cr>', {})
map('n', '}', '<cmd>bn<cr>', {})
map('n', 'tx', '<cmd>bd<cr>', {})

-- Quickly edit the configuration
map('n', '<leader>fs', '<cmd>tabedit ~/.config/nvim/lua/plugins.lua<cr>', {})

-- Copy and Past from the system clipboard
map('v', 'Y', '"+y', {})
map('n', 'P', '"+p', {})

-- Some functional configuration
map('n', '<backspace>', '<cmd>noh<cr>', {})		-- cancel highlight that from search
map('n', '<space>', 'viw', {})				-- select a word
map('n', '-', '@q', {})						-- play the macro 'q'

-- -- NvimTree
-- Open NvimTree
-- map("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", {});
-- map("n", "<leader>f", "<cmd>NvimTreeFocus<CR>", {});

-- -- Telescope
-- Find file
map("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>", {})
-- Find word
map("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<CR>", {})
-- Find special sample
map("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", {})
-- check help doc
map("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", {})
-- check recent files
map("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<CR>", {})
-- find marks
map("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", {})
