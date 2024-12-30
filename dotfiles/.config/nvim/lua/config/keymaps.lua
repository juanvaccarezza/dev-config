-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "v" }, "jk", "<ESC>", { silent = true })

vim.keymap.set({ "i", "x", "n", "s" }, "<leader>fs", "<cmd>w<cr><esc>", { desc = "Save File" })
vim.keymap.set({ "i", "x", "n", "s" }, "<leader>bn", "<cmd>bn<cr><esc>", { desc = "Move to Next Buffer" })
vim.keymap.set({ "i", "x", "n", "s" }, "<leader>bp", "<cmd>bp<cr><esc>", { desc = "Move to Previous Buffer" })

local wk = require("which-key")
wk.add({
  mode = { "n", "x", "o" },
  { "<leader>j", group = "jump", icon = "" }, -- group
  {
    "<leader>jj",
    function()
      require("flash").jump()
    end,
    desc = "Flash",
  },
})
