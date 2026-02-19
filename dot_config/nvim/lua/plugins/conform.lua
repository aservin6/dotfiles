return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = function(bufnr)
        -- Disable formatting inside Obsidian vault
        local file = vim.api.nvim_buf_get_name(bufnr)
        local vault = vim.fn.expand("~/vaults/Obsidian")

        if file:find(vault, 1, true) then
          return
        end

        return { timeout_ms = 500 }
      end,
    },
  },
}
