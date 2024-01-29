local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter.setup({
  prefer_git = true,
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "c",
    "cpp",
    "nasm",
    "make",
    "markdown",
    "markdown_inline"
  },
  -- auto install above language parsers
  auto_install = true,
})
