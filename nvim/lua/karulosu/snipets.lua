-- Setup nvim-cmp.

local cmp = require("cmp")
local luasnip = require("luasnip")

local lspkind = require("lspkind")

local function cmp_map(...)
    return cmp.mapping(..., { "i", "c" })
end

cmp.setup({
    completion = {
        autocomplete = false,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[LaTeX]",
                })[entry.source.name]
        return vim_item
      end
  })
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-d>"] = cmp_map(cmp.mapping.scroll_docs(-4)),
        ["<C-f>"] = cmp_map(cmp.mapping.scroll_docs(4)),
        ["<C-Space>"] = cmp_map(cmp.mapping.complete()),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp_map(cmp.mapping.confirm({
            -- behavior = cmp.ConfirmBehavior.Insert,
            select = true
        })),
        -- NOTE: this binding is not possible
        ["<S-CR>"] = cmp_map(cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        })),
        -- Toggle cmp menu
        ["<C-k>"] = cmp.mapping({
            i = function()
                if cmp.visible() then
                    cmp.close()
                else
                    cmp.complete()
                end
            end,
            c = function()
                if cmp.visible() then
                    cmp.close()
                else
                    cmp.complete()
                end
            end,
        }),
      ["<Tab>"] = cmp.mapping(function(fallback)
           if cmp.visible() then
               cmp.select_next_item()
           elseif luasnip.expand_or_locally_jumpable() then
               luasnip.expand_or_jump()
           else
               fallback()
           end
       end, { "i", "s" }),
       ["<S-Tab>"] = cmp_map(function(fallback)
           if cmp.visible() then
               cmp.select_prev_item()
           else
               fallback()
           end
       end),
   },
   sources = {
       -- { name = "cmp_tabnine" },
       { name = "nvim_lsp" },
       { name = "luasnip" },
        --{ name = 'vsnip' },
        { name = 'path' },
        -- { name = 'ultisnips' },
        { name = "buffer" },
    },
})

require("luasnip/loaders/from_vscode").lazy_load()

