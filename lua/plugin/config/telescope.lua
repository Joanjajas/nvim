local telescope = require("telescope")

local config = {
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
}

telescope.setup(config)
telescope.load_extension("fzf")
