require('karulosu.mapping')

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    underline = false,
    update_in_insert = false,
    virtual_text = true
})

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {autostart = false, on_attach=on_attach}
    -- ARDUINO
    if server.name == "arduino_language_server" then
        opts.on_new_config = function (config, root_dir)
            local partial_cmd = server:get_default_options().cmd
            local MY_FQBN = "arduino:sam:arduino_due_x"
            config.cmd = vim.list_extend(partial_cmd, { "-fqbn", MY_FQBN })
        end
    end
    server:setup(opts)
end)

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'nvim-lsp-installer'.post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.diagnostics.eslint,
        -- require("null-ls").builtins.diagnostics.code_actions,
        -- require("null-ls").builtins.diagnostics.diagnostics,
        -- require("null-ls").builtins.completion.spell,
    },
})
