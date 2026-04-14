-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      diagnostics = { virtual_text = false, virtual_lines = false }, -- diagnostic settings on startup
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      pattern = {
        ["%.env%.[%w_.-]+"] = "sh",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,

        clipboard = "", -- see `polish.lua`
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- Split navigations
        ["<C-S-h>"] = { "<C-W>H", desc = "Move pane to far left" },
        ["<C-S-l>"] = { "<C-W>L", desc = "Move pane to far right" },
        ["<C-S-j>"] = { "<C-W>J", desc = "Move pane to far bottom" },
        ["<C-S-k>"] = { "<C-W>K", desc = "Move pane to far top" },

        -- Navigate buffer like tabs
        ["t"] = { desc = "Navigate buffers like tabs" },
        ["tl"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["th"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["t]"] = { function() require("astrocore.buffer").move(vim.v.count1) end, desc = "Move buffer tab right" },
        ["t["] = { function() require("astrocore.buffer").move(-vim.v.count1) end, desc = "Move buffer tab left" },

        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- Qualities of life
        ["<M-s>"] = { ":noa w<CR>", desc = "Save without format", silent = true }, -- Don't know why `<M-C-s>` isn't recognized...
        -- TODO: Add multi-cursor above & below
      },
    },
  },
}
