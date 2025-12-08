vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.mouse = ""
opt.clipboard = "unnamedplus"

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.wrap = false
opt.scrolloff = 4
opt.updatetime = 250


local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- "contrast" can be "hard", "soft", or "" (default/medium)
      require("gruvbox").setup({
        contrast = "",       -- medium
        terminal_colors = true,
      })

      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
})

