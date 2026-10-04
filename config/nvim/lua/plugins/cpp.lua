-- clangd — bundled with Xcode command line tools. For real projects, generate
-- compile_commands.json (CMake: -DCMAKE_EXPORT_COMPILE_COMMANDS=ON) or add a
-- compile_flags.txt with your -I flags, otherwise clangd guesses include paths.
vim.lsp.enable 'clangd'
