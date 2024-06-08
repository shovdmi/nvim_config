set XDG_CONFIG_HOME=C:\Work\nvim_config_test\
set XDG_CONFIG_DIRS=C:\Work\nvim_config_test\
REM nvim --clean -u C:\Work\nvim_config_test\nvim\init.lua
PATH=%PATH%;c:\clangd\clangd_18.1.3\bin
nvim-qt -- --clean -u C:\Work\nvim_config_test\nvim\init.lua %1 %2 %3 %4 %5 %6 %7 %8 %9
