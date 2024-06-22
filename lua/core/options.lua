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
opt.signcolumn = "yes"
opt.timeoutlen = 300
opt.updatetime = 500
opt.rnu = true
opt.undofile = true
opt.showmode = false
opt.termguicolors = true
opt.scrolloff = 10
opt.sidescrolloff = 10
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
