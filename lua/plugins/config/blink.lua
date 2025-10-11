local blink = require("blink.cmp")

local config = {
    keymap = {
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', "fallback" },
        ['<C-n>'] = {},
    },

    cmdline = {
        keymap = { ['<CR>'] = {} },
        completion = {
            menu = { auto_show = true },
            list = { selection = { preselect = false } },
        },
    },

    completion = {
        list = { selection = { preselect = false } },
        documentation = { auto_show = true, auto_show_delay_ms = 0 },
        menu = {
            draw = { columns = { { 'label', gap = 1 }, { 'kind' }, { 'source_name' } },
            }
        }
    },

    signature = { enabled = true, trigger = { show_on_trigger_character = true } },

    sources = { providers = { lsp = { fallbacks = {} } } },
}

blink.setup(config)
