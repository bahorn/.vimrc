-- neovim config that is meant to be minimal, and work across a decent amount of
-- versions.

-- Bootstrap vim-plug
local plug_path = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"
if vim.fn.filereadable(plug_path) == 0 then
    vim.fn.system({
        "curl", "-fLo", plug_path, "--create-dirs",
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
    })
    vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
            vim.cmd("PlugInstall --sync")
            vim.cmd("source $MYVIMRC")
        end,
    })
end
vim.cmd("source " .. plug_path)

-- Plugins
local Plug = vim.fn["plug#"]
vim.call("plug#begin", vim.fn.expand("~/.vim/plugged"))
    Plug("marko-cerovac/material.nvim")
    Plug("nvim-lualine/lualine.nvim")
    Plug("junegunn/rainbow_parentheses.vim")
    Plug("tpope/vim-commentary")
    -- Completion
    Plug("hrsh7th/nvim-cmp")
    Plug("hrsh7th/cmp-buffer")
    Plug("hrsh7th/cmp-path")
    Plug("hrsh7th/cmp-nvim-lsp")
vim.call("plug#end")

-- Providers
vim.g.loaded_perl_provider = 0
vim.g.python_host_prog = "/usr/bin/python3"
vim.g.python3_host_prog = "/usr/bin/python3"

-- Options
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.guicursor = ""
vim.opt.laststatus = 2
vim.opt.updatetime = 800
vim.o.termsync = false
vim.opt.title = false
vim.opt.shortmess:append("I")
vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.backup = true
vim.opt.backupdir = { vim.fn.expand("~/.vim/tmp"), "." }
vim.opt.directory = { vim.fn.expand("~/.vim/tmp"), "." }
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = { vim.fn.expand("~/.vim/undo"), "." }
vim.opt.history = 1000

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.backspace = "indent,eol,start"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.ignorecase = true
vim.opt.smartcase  = true

vim.opt.scrolloff = 5
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.opt.list = true
vim.opt.listchars = { trail = "·", tab = "→ " }

vim.opt.colorcolumn = "81"
vim.opt.textwidth = 80

vim.opt.spelllang = "en"
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "text", "markdown", "gitcommit", "rst" },
    callback = function() vim.opt_local.spell = true end,
})

-- Open all folds on file load
vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*",
    callback = function() vim.cmd("normal! zR") end,
})

-- Keymaps
vim.keymap.set("n", "<F7>", "mzgg=G`z")
vim.keymap.set("n", "Q", "gq")
vim.keymap.set("i", "<C-U>", "<C-G>u<C-U>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Command aliases
vim.cmd("command! W w")
vim.cmd("command! Q q")
vim.cmd("command! WQ wq")

-- Theme
vim.g.material_style = "deep ocean"
vim.cmd("colorscheme material")
vim.cmd([[
    hi! RainbowLevel0 ctermfg=142 guifg=#b8bb26
    hi! RainbowLevel1 ctermfg=108 guifg=#8ec07c
    hi! RainbowLevel2 ctermfg=109 guifg=#83a598
    hi! RainbowLevel3 ctermfg=175 guifg=#d3869b
    hi! RainbowLevel4 ctermfg=167 guifg=#fb4934
    hi! RainbowLevel5 ctermfg=208 guifg=#fe8019
    hi! RainbowLevel6 ctermfg=214 guifg=#fabd2f
    hi! RainbowLevel7 ctermfg=223 guifg=#ebdbb2
    hi! RainbowLevel8 ctermfg=245 guifg=#928374
]])

-- Rainbow parentheses
vim.g["rainbow#max_level"] = 16
vim.g["rainbow#pairs"] = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function() vim.cmd("RainbowParentheses") end,
})

-- Statusline

-- Capture the undo sequence number at startup for each buffer
local session_start_seq = {}
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        -- After loading, seq_cur reflects the persistent undo position (= last save)
        session_start_seq[args.buf] = vim.fn.undotree().seq_cur or 0
    end,
})

local function undo_indicator()
    local tree = vim.fn.undotree()
    local start = session_start_seq[vim.api.nvim_get_current_buf()] or 0
    if tree.seq_cur < start then
        return "HIST"
    end
    return ""
end


require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = vim.fn.nr2char(0xe0b1), right = vim.fn.nr2char(0xe0b3) },
        section_separators = { left = vim.fn.nr2char(0xe0b0), right = vim.fn.nr2char(0xe0b2) },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            { "branch", icon = "" },
            "diff",
            {
                "diagnostics",
                sections = { "error", "warn", "info", "hint" },
                diagnostics_color = {
                    error = "DiagnosticError",
                    warn  = "DiagnosticWarn",
                    info  = "DiagnosticInfo",
                    hint  = "DiagnosticHint",
                },
                symbols = { error = "E", warn = "W", info = "I", hint = "H" },
                colored = true,
                update_in_insert = false,
                always_visible = false,
            },
        },
        lualine_c = { "filename" },
        lualine_x = { undo_indicator, "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
})

-- Diagnostics: underlines only, no signs or inline text
vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = true,
    update_in_insert = false,
    float = { border = "rounded", source = true },
})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Completion
local cmp = require("cmp")
-- LSP (built-in client, no plugins needed)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Walk up from the current file to find a project root
local function find_root(markers)
    local result = vim.fs.find(markers, { upward = true })[1]
    return result and vim.fs.dirname(result) or vim.fn.getcwd()
end

-- Start a server only if its binary is available
local function lsp_start(binary, config)
    if vim.fn.executable(binary) == 1 then
        config.capabilities = capabilities
        vim.lsp.start(config)
    end
end

-- Keymaps applied whenever any LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local map = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf })
        end
        map("gd",         vim.lsp.buf.definition)
        map("gD",         vim.lsp.buf.declaration)
        map("K",          vim.lsp.buf.hover)
        map("gr",         vim.lsp.buf.references)
        map("<leader>rn", vim.lsp.buf.rename)
        map("<leader>ca", vim.lsp.buf.code_action)
        map("<leader>f",  function() vim.lsp.buf.format({ async = true }) end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        lsp_start("pyright-langserver", {
            name     = "pyright",
            cmd      = { "pyright-langserver", "--stdio" },
            root_dir = find_root({ "pyproject.toml", "setup.py", "setup.cfg", ".git" }),
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        lsp_start("clangd", {
            name     = "clangd",
            cmd      = { "clangd" },
            root_dir = find_root({ "compile_commands.json", "CMakeLists.txt", ".git" }),
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        lsp_start("rust-analyzer", {
            name     = "rust_analyzer",
            cmd      = { "rust-analyzer" },
            root_dir = find_root({ "Cargo.toml", ".git" }),
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    callback = function()
        lsp_start("typescript-language-server", {
            name     = "ts_ls",
            cmd      = { "typescript-language-server", "--stdio" },
            root_dir = find_root({ "package.json", "tsconfig.json", ".git" }),
        })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sh", "bash" },
    callback = function()
        lsp_start("bash-language-server", {
            name     = "bashls",
            cmd      = { "bash-language-server", "start" },
            root_dir = find_root({ ".git" }),
        })
    end,
})

-- Completion
cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            else fallback() end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            else fallback() end
        end, { "i", "s" }),
    }),
})
