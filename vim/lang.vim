let g:poetv_auto_activate = 1

" language server setup
lua <<EOF
    -- pylsp needs to be done separately because of venv support
    require'lspconfig'.pylsp.setup{}

    local lsp = require('lsp-zero')

    lsp.preset('recommended')
    lsp.set_preferences({
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      set_lsp_keymaps = true,
      configure_diagnostics = true,
      cmp_capabilities = true,
      manage_nvim_cmp = true,
      call_servers = 'local',
      sign_icons = {}
    })

    lsp.setup()


    require("trouble").setup {
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
            -- icons / text used for a diagnostic
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info"
        },
        use_diagnostic_signs = true,
        auto_open = true,
        auto_close = true
    }
EOF
