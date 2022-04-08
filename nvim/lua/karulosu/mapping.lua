local key_map = vim.api.nvim_set_keymap

local opts = { noremap=true, silent=true }

 -- TELESCOPE
 key_map("n","<space><space>",':Telescope find_files<CR>', opts)
 key_map('n','<space>pp',":lua require'telescope'.extensions.project.project{ display_type = 'full'}<CR>",opts)

 -- LSP

local opts = { noremap=true, silent=true }
key_map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
key_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
key_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
key_map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
key_map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

key_map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

key_map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
key_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
key_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
key_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
key_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
key_map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
key_map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
key_map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
key_map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
key_map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
key_map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
key_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
key_map("i", "<C-E>", "<Plug>luasnip-next-choice", opts)
key_map("s", "<C-E>", "<Plug>luasnip-next-choice", opts)
key_map("n", "s", "<Plug>Lightspeed_omni_s", { noremap = false})

key_map("n", "gs", "<Plug>Lightspeed_omni_gs", { noremap = false})
key_map("n", "<A-x>", "<cmd>lua require('legendary').find()<CR>", opts)
key_map("n", "<A-d>", "<cmd>:Neotree toggle focus<CR>", opts)
