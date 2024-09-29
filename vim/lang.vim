let g:poetv_auto_activate = 1

" language server setup
lua <<EOF
    require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "c", "cpp", "javascript", "python" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        -- List of parsers to ignore installing (for "all")

        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }
    -- setup spelling
    require('spellsitter').setup()

    -- pylsp needs to be done separately because of venv support
    require'lspconfig'.pylsp.setup{}


    vim.opt.updatetime = 800

    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({buffer = bufnr})
      lsp_zero.highlight_symbol(client, bufnr)
    end)

    lsp_zero.ui({
      float_border = 'rounded',
      sign_text = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»',
      },
    })

    lsp_zero.omnifunc.setup({
      trigger = '<C-Space>',
      tabcomplete = true,
      use_fallback = true,
      update_on_delete = true,
    })

    require("trouble").setup {
        mode = "workspace_diagnostics",
        icons = true,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = true, -- add an indent guide below the fold icons
        use_diagnostic_signs = true,
        auto_open = false,
        auto_close = true
    }

    local cmp = require('cmp')

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({}),
    })


EOF

" set spell
set spelllang=en
