SET current_dir=%~dp0
set XDG_CONFIG_HOME=%current_dir%
set XDG_CONFIG_DIRS=%current_dir%
set XDG_RUNTIME_DIR=%current_dir%\tmp
set XDG_DATA_HOME=%current_dir%\nvim-data
set XDG_STATE_HOME=%current_dir%\nvim-state
set XDG_CACHE_HOME=%current_dir%\nvim-cache
set NVIM_LOG_FILE=%current_dir%\nvim-log\log
set XDG_DATA_DIRS=%current_dir%\nvim-data-share
REM nvim --clean -u %current_dir%nvim\init.lua
PATH=%PATH%;c:\clangd\clangd_18.1.3\bin
nvim-qt -- --clean -u %current_dir%nvim\init.lua %1 %2 %3 %4 %5 %6 %7 %8 %9


REM read `:h standard-path`
