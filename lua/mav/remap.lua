vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)


vim.keymap.set("n", "<C-u>", "<C-u>zzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("n", "<leader>wt", function () require('telescope').extensions.git_worktree.git_worktrees() end)
vim.keymap.set("n", "<leader>cwt", function () require('telescope').extensions.git_worktree.create_git_worktree() end)
vim.keymap.set("n", "<leader>rs", function () vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>h", ":bnext<Enter>")
vim.keymap.set("n", "<leader>l", ":bprevious<Enter>")
vim.keymap.set("n", "<leader>i", function () vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>d", function () vim.diagnostic.open_float() end)
