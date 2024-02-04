--[[Currently Treesitter plugin occures some errors
1. Error while downloading parsers
2. Error with config (lua structure)
]]

local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter.setup({
    highlight = { enable = true },
    
    indent = { enable = true },

    ensure_installed = {
        "cpp",
        "c",
        "lua",
        "cmake",
        "make",
        "nasm"
    },

    auto_install = true,
})
