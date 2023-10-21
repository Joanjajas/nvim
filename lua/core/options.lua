local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.copilot_assume_mapped = true
g.copilot_no_tab_map = true

opt.guicursor = ""
opt.hlsearch = false
opt.rnu = true
opt.showmode = false
opt.termguicolors = true
opt.scrolloff = 5
opt.expandtab = true
opt.splitright = true
opt.splitbelow = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartcase = true
opt.ignorecase = true
opt.smartindent = true
opt.smarttab = true
opt.mouse = "a"
opt.whichwrap:append("hl")
opt.fillchars = {
  vert = " ",
  horiz = " ",
  fold = " ",
  eob = " ",
  diff = " ",
}
