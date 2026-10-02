------------------------------------------------------------
-- Basic Neovim settings
------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true


------------------------------------------------------------
-- Packages
------------------------------------------------------------

vim.pack.add({
  {
    src = 'https://github.com/nvim-mini/mini.nvim',
    version = 'stable',
  },
  {
    src = 'https://github.com/Mofiqul/vscode.nvim',
  },
})


------------------------------------------------------------
-- VS Code Light theme
------------------------------------------------------------

vim.opt.background = 'light'
vim.cmd.colorscheme('vscode')


------------------------------------------------------------
-- Icons
------------------------------------------------------------

require('mini.icons').setup({
  style = 'glyph',
})


------------------------------------------------------------
-- File explorer
------------------------------------------------------------

require('mini.files').setup({
  options = {
    -- Use mini.files when opening a directory with:
    --
    --     nvim .
    --
    use_as_default_explorer = true,

    -- Move deleted files to mini.nvim's trash instead of
    -- permanently deleting them.
    permanent_delete = false,
  },

  windows = {
    preview = true,
    width_focus = 30,
    width_preview = 50,
  },
})


------------------------------------------------------------
-- Fuzzy finder
------------------------------------------------------------

require('mini.pick').setup()


------------------------------------------------------------
-- Git
------------------------------------------------------------

require('mini.git').setup()

require('mini.diff').setup({
  view = {
    style = 'sign',
    signs = {
      add = '+',
      change = '~',
      delete = '-',
    },
  },
})


------------------------------------------------------------
-- Statusline
------------------------------------------------------------

require('mini.statusline').setup({
  use_icons = true,
})


------------------------------------------------------------
-- Keybindings
------------------------------------------------------------

-- File explorer
vim.keymap.set('n', '<leader>e', function()
  -- If explorer is already open, close it.
  if MiniFiles.close() then
    return
  end

  -- Otherwise open it focused on the current file.
  local file = vim.api.nvim_buf_get_name(0)

  if file ~= '' then
    MiniFiles.open(file)
  else
    MiniFiles.open()
  end
end, {
  desc = 'File explorer',
})


-- Fuzzy find files
vim.keymap.set('n', '<leader>ff', function()
  MiniPick.builtin.files()
end, {
  desc = 'Find files',
})


-- Search text throughout project
vim.keymap.set('n', '<leader>fg', function()
  MiniPick.builtin.grep_live()
end, {
  desc = 'Search project',
})


-- Find open buffers
vim.keymap.set('n', '<leader>fb', function()
  MiniPick.builtin.buffers()
end, {
  desc = 'Find buffers',
})


-- Git status
vim.keymap.set('n', '<leader>gs', '<cmd>Git status<CR>', {
  desc = 'Git status',
})


-- Git log
vim.keymap.set('n', '<leader>gl', '<cmd>Git log --oneline --decorate -n 50<CR>', {
  desc = 'Git log',
})


-- Git blame current file
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame -- %<CR>', {
  desc = 'Git blame',
})


-- Toggle detailed diff overlay
vim.keymap.set('n', '<leader>gd', function()
  MiniDiff.toggle_overlay()
end, {
  desc = 'Git diff',
})

