vim.opt.termguicolors = true
vim.cmd.colorscheme('cyberpunk')
vim.g['airline_theme']='cyberpunk'
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { bg = "#e7cc00" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { bg = "#b00022" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#6e003c" })
