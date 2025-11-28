---@type LazySpec
return {
  'AstroNvim/astrolsp',
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          -- "go",
        },
        ignore_filetypes = {
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        'lua_ls', -- always use `stylua`
        'volar', -- always use linter/formatter
      },
      timeout_ms = 1000, -- default format timeout
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      vtsls = {
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
          },
        },
      },
      -- rust_analyzer = {
      --   settings = {
      --     ['rust-analyzer'] = {
      --       checkOnSave = true,
      --     },
      --   },
      -- },
    },
    -- customize how language servers are attached
    handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      emmet_ls = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- Remove event `TextChanged` from defaults
      lsp_codelens_refresh = {
        cond = 'textDocument/codeLens',
        {
          event = { 'InsertLeave', 'BufEnter' },
          desc = 'Refresh codelens (buffer)',
          callback = function(args)
            if require('astrolsp').config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        gh = {
          function() vim.lsp.buf.hover() end,
          desc = 'Hover the current symbol',
        },
        gd = {
          function() require('snacks').picker.lsp_definitions() end,
          desc = 'Goto Definition',
        },
        gD = {
          function() require('snacks').picker.lsp_declarations() end,
          desc = 'Goto Declaration',
        },
        gy = {
          function() require('snacks').picker.lsp_type_definitions() end,
          desc = 'Type definition of current symbol',
          cond = 'textDocument/typeDefinition',
        },
        gA = {
          function() require('snacks').picker.lsp_references() end,
          desc = 'Goto All References',
        },
        gI = {
          function() require('snacks').picker.lsp_implementations() end,
          desc = 'Goto Implementations',
        },
        gO = {
          function() require('snacks').picker.lsp_symbols() end,
          desc = 'Open Document Symbols',
        },
        gW = {
          function() require('snacks').picker.lsp_workspace_symbols() end,
          desc = 'Open Document Symbols',
        },
      },
    },
  },
}
