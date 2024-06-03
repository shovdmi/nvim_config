require('minintro').setup{
}


require'lspconfig'.clangd.setup{
-- https://stackoverflow.com/questions/76625619/is-it-possible-to-override-or-augment-neovims-lsp-configuration-via-a-workspace

   --cmd = {
   --     "~/.espressif/tools/esp-clang/bin/clangd",
   --     "--pretty",
   --     "--header-insertion=iwyu",
   --     .....
   --     "--compile-commands-dir=.",
   -- },
    filetypes = { "c", "cc", "cpp", "objc", "objcpp", "cuda", "proto" },
    function(fname)
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
}