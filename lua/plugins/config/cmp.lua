local cmp = require("cmp")
local autopairs = require("nvim-autopairs.completion.cmp")

local config = {
  preselect = false,

  completion = {
    keyword_length = 0,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    fields = { "abbr", "kind", "menu" },

    format = require("lspkind").cmp_format({
      mode = "symbol_text",

      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        cmdline = "[Cmd]",
      },
    }),
  },

  mapping = {
    ["<CR>"] = cmp.mapping.confirm(),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "nvim_lsp" },
    {
      name = "buffer",
      option = {
        get_bufnrs = require("core.util").get_visible_buffers,
      },
    },
    { name = "path" },
  },
}

cmp.setup.cmdline({ ":", "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "cmdline" },
  }),
})

cmp.setup(config)
cmp.event:on("confirm_done", autopairs.on_confirm_done())
