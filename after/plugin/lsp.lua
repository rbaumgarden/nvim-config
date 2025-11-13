-- This version removes lsp-zero and uses the native vim.lsp.config API (Neovim 0.11+).
-- Mason handles installation; this just configures servers and keymaps.

-- =========================
-- Mason setup
-- =========================
require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = { 'rust_analyzer', 'lua_ls' },
    handlers = {
        function(server_name)
            local server = vim.lsp.config[server_name]
            if server then
                server.launch()
            end
        end,
    },
}

-- =========================
-- nvim-cmp setup
-- =========================
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

-- =========================
-- Capabilities
-- =========================
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- =========================
-- Keymaps (on_attach)
-- =========================
local function OrganizeImports()
    vim.lsp.buf.code_action({
        apply = true,
        context = { only = { "source.organizeimports" }, diagnostics = {} }
    })
end

local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    --if vim.lsp.buf.organize_imports then
        vim.keymap.set("n", "<leader>oi", OrganizeImports(), opts)
    --end
end

-- =========================
-- Server configurations
-- =========================

-- Lua LS (to fix "Undefined global 'vim'")
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
        },
    },
}

-- Rust Analyzer
vim.lsp.config['rust_analyzer'] = {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- =========================
-- Diagnostics
-- =========================
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
})
