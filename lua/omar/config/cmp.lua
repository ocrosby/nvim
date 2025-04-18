local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-style snippets

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- Use LuaSnip for snippet expansion
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll up in documentation
        ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Scroll down in documentation
        ["<C-Space>"] = cmp.mapping.complete(),  -- Trigger completion
        ["<C-e>"] = cmp.mapping.abort(),         -- Abort completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions
        { name = "luasnip" },  -- Snippet completions
    }, {
        { name = "buffer" },   -- Buffer completions
        { name = "path" },     -- Path completions
    })
})

-- Setup for command-line completion
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
    }, {
        { name = "cmdline" },
    }),
})
