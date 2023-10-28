local gruvbox = require("gruvbox")

local config = {
  transparent_mode = true,

  palette_overrides = {
    dark0 = "none",
    dark1 = "none",
  },

  overrides = {
    Tabline = {
      bg = "none",
    },

    TablineFill = {
      bg = "none",
    },

    NvimTreeGitDirty = {
      fg = "#75f14f",
    },
  },
}

gruvbox.setup(config)
