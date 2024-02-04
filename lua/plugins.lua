local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

	--File Manager
	use ({
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("config.nvim-tree")
        end,
        requires = { "nvim-web-devicons" },
    })
    
    --Status line
    use ({
         "nvim-lualine/lualine.nvim", 
         config = function()
             require("config.lualine")
         end,
        requires = { "nvim-web-devicons" },
    })

    --Icons for File Manager
    use({
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("config.nvim-web-devicons")
        end,
    })

    -- Treesitter ERROR OCCURES
    --[[use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter")
        end,
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })]]

    --LSP Managers
    use({
        "williamboman/mason.nvim",
        config = function()
            require("config.lsp.mason")
        end,
    })

    use("williamboman/mason-lspconfig.nvim")

    --Configuring LSP servers
    use("neovim/nvim-lspconfig") --For easy configuration    
    use("hrsh7th/cmp-nvim-lsp") --For autocompletion
    use("jose-elias-alvarez/null-ls.nvim")

    --[[use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
            { "nvim-tree/nvim-web-devicons" }
        }
    })]]

    use("onsails/lspkind.nvim") --VsCode-like icons for autocompletion

    -- Autocompletion
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.nvim-cmp")
        end
    })

    use("hrsh7th/cmp-buffer") --source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system path   

    -- Snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion

    -- Beautiful notifications
    use({
        "rcarriga/nvim-notify",
        config = function()
            require("config.notify")
        end
    })

    -- Bufferline
    use({
        "romgrk/barbar.nvim",
        config = function()
            require("config.barbar")
        end
    })
    
    -- Helpers (special functions etc.)
    use("nvim-lua/plenary.nvim")
    
    -- Search
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        requires = {{ "nvim-lua/plenary.nvim" }}
    })

	--Darcula colorscheme
	use("doums/darcula")

    --Gruvbox colorscheme
    use("ellisonleao/gruvbox.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
