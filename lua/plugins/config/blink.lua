local blink = require("blink.cmp")

local config = {
    keymap = {
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', "fallback" },
    },

    cmdline = {
        keymap = { ['<CR>'] = {} },
        completion = { menu = { auto_show = true } },
    },

    completion = {
        list = { selection = { preselect = false } },
        documentation = { auto_show = true, auto_show_delay_ms = 0 },
    },

    signature = { enabled = true, trigger = { show_on_trigger_character = true } },
}

blink.setup(config)
