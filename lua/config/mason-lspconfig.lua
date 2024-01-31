local status, masonconf = pcall(require, "mason-lspconfig")
if not status then
    return
end

masonconf.setup()
