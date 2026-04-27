vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end)
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(ev)
      local opts = {buffer = ev.buf, remap = false}

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.reference() end, opts)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()

require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'eslint',
        'svelte',
        'rust_analyzer',
        'lua_ls'
    },
    handlers = {

        function(server_name)
          vim.lsp.config(server_name, {
              capabilities = lsp_capabilities
          })
          vim.lsp.enable(server_name)
        end,
    }
})
local lsp = require('lsp-zero').preset({
})


local cmp = require('cmp')
cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
})
--
lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.setup()
