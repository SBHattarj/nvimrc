vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("n", "<leader>wt", function () require('telescope').extensions.git_worktree.git_worktrees() end)
vim.keymap.set("n", "<leader>cwt", function () require('telescope').extensions.git_worktree.create_git_worktree() end)

