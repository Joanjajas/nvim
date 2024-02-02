local opt = vim.opt

--------------------------------------------------------------------------------
-- colorscheme
--------------------------------------------------------------------------------
local colorscheme = pcall(vim.cmd.colorscheme, "onedark")

if not colorscheme then
  vim.cmd.colorscheme("habamax")
end

vim.cmd("hi clear StatusLine")
vim.cmd("hi ColorColumn guibg=#161616")

--------------------------------------------------------------------------------
-- general options
--------------------------------------------------------------------------------
opt.guicursor = ""
opt.rnu = true
opt.showmode = false
opt.termguicolors = true
opt.scrolloff = 7
opt.sidescrolloff = 7
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
  stl = " ",
  stlnc = " ",
  wbr = " ",
  horiz = " ",
  horizup = " ",
  horizdown = " ",
  vert = " ",
  vertleft = " ",
  vertright = " ",
  verthoriz = " ",
  diff = " ",
  msgsep = " ",
  eob = " ",
  lastline = " ",
}
