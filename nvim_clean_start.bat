SET current_dir=%~dp0
set XDG_CONFIG_HOME=%current_dir%
set XDG_CONFIG_DIRS=%current_dir%
REM nvim --clean -u %current_dir%nvim\init.lua
PATH=%PATH%;c:\clangd\clangd_18.1.3\bin
nvim-qt -- --clean -u %current_dir%nvim\init.lua %1 %2 %3 %4 %5 %6 %7 %8 %9
