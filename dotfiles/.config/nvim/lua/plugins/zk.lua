return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
      picker = "select",

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { "zk", "lsp" },
          name = "zk",
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { "markdown" },
        },
      },
      -- Create a new note after asking for its title.
      -- vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
      -- keys = {
      --   {
      --     "<leader>zn",
      --     function()
      --       require("zk-nvim").ZkNew({ title = vim.fn.input("Title: ") })
      --     end,
      --     desc = "Find Plugin File",
      --   },
      -- },
    })
  end,
}
