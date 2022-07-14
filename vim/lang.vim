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
            enable = false,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }

    -- pylsp needs to be done separately because of venv support
    require'lspconfig'.pylsp.setup{}

    local lsp = require('lsp-zero')
    lsp.set_preferences({
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      set_lsp_keymaps = true,
      configure_diagnostics = true,
      cmp_capabilities = true,
      manage_nvim_cmp = true,
      call_servers = 'local',
      sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
      }
    })

    lsp.setup()


    require("trouble").setup {
        mode = "workspace_diagnostics",
        icons = true,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = true, -- add an indent guide below the fold icons
        use_diagnostic_signs = true,
        auto_open = true,
        auto_close = true
    }
EOF

" uwuwu uwuwu uwuwu gawkfweafwe 
