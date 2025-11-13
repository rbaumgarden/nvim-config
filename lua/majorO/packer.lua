-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        -- or                            , tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use({
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            require("catppuccin").setup()
            vim.cmd('colorscheme catppuccin')
        end
    })

    use { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }

    require 'nvim-treesitter.install'.compilers = { "cl", "clang" }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    -- Autocompletion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-nvim-lsp-signature-help')

    -- Snippets
    use('L3MON4D3/LuaSnip')
    use('rafamadriz/friendly-snippets')

    if false == true then
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v1.x',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },             -- Required
                { 'williamboman/mason.nvim' },           -- Optional
                { 'williamboman/mason-lspconfig.nvim' }, -- Optional

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },         -- Required
                { 'hrsh7th/cmp-nvim-lsp' },     -- Required
                { 'hrsh7th/cmp-buffer' },       -- Optional
                { 'hrsh7th/cmp-path' },         -- Optional
                { 'saadparwaiz1/cmp_luasnip' }, -- Optional
                { 'hrsh7th/cmp-nvim-lua' },     -- Optional
                { 'hrsh7th/cmp-nvim-lsp-signature-help' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },             -- Required
                { 'rafamadriz/friendly-snippets' }, -- Optional
            }
        }
    end
end)
