local plugins = require("plugins")
local lazy_config = require("plugins.config.lazy")

-- setup lazy.nvim
require("lazy").setup(plugins, lazy_config)
