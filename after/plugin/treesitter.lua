require 'nvim-treesitter.install'.compilers = { "cl", "clang" }

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the four listed parsers should always be installed)
    --ensure_installed = { "c", "lua", "vim", "vimdoc" },
    ensure_installed = { "c", "cpp", "c_sharp", "lua", "vim", "vimdoc", "rust", "go", "python", "bash", "cmake" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

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

require 'treesitter-context'.setup {
    enable = true,       -- Enable this plugin
    throttle = true,     -- Throttles plugin updates (may improve performance)
    max_lines = 0,       -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = {         -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
            'class',
            'function',
            'method',
        },
    },
}
