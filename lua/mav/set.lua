vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.diagnostic.config({
    update_in_insert = false,
    virtual_text = false
})



local ns_id = vim.api.nvim_create_namespace("mav")
local prev_ext1 = -1
local prev_ext2 = -1
local prev_buff = 0

local mouse_moved_cb = function(tab)
    local buf = tab["buf"]
    local cur_buf = buf
    local prev_ext1_temp = vim.api.nvim_buf_set_extmark(
        cur_buf,
        ns_id,
        vim.api.nvim_win_get_cursor(0)[1] - 1,
        0,
        {
            virt_lines = {{{""}}}
        }
    )
    local prev_ext2_temp = vim.api.nvim_buf_set_extmark(
        cur_buf,
        ns_id,
        vim.api.nvim_win_get_cursor(0)[1] - 1,
        0,
        {
            virt_lines = {{{""}}},
            virt_lines_above = true
        }
    )
    if prev_ext1 > -1 then
        pcall(vim.api.nvim_buf_del_extmark, prev_buff, ns_id, prev_ext1)
    end
    if prev_ext2  -1 then
        pcall(vim.api.nvim_buf_del_extmark, prev_buff, ns_id, prev_ext2)
    end
    prev_ext1 = prev_ext1_temp
    prev_ext2 = prev_ext2_temp
    prev_buff = cur_buf
end

vim.api.nvim_create_augroup("cursor_padding", { clear = true })
vim.api.nvim_create_autocmd(
    "CursorMoved",
    {
        pattern = "*",
        group = "cursor_padding",
        callback = mouse_moved_cb
    }
)
vim.api.nvim_create_autocmd(
    "CursorMovedI",
    {
        pattern = "*",
        group = "cursor_padding",
        callback = mouse_moved_cb
    }
)

