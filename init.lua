require("plugins")
require("options")
require("colorscheme")
require("nvim-tree").setup()
require("nvim-web-devicons").setup()
require("lualine").setup {
    options = { theme = require("lualine.themes.powerline") },
}
