local M = {}

local color = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
  black = "#000000",
}

M.lsp_progress = {
  function()
    local lsp = vim.lsp.util.get_progress_messages()[1]

    if vim.o.columns < 120 or not lsp then
      return ""
    end

    local msg = lsp.message or ""
    local percentage = lsp.percentage or 0
    local title = lsp.title or ""
    local spinners = { "⣷", "⣯", "⣟", "⡿", "⢿", "⣻", "⣽", "⣾" }
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    local content = string.format(
      " %%<%s %s %s (%s%%%%) ",
      spinners[frame + 1],
      title,
      msg,
      percentage
    )

    return content or ""
  end,
}

M.lsp_clients = {
  function()
    local lsp_progress = M.lsp_progress[1]()

    if lsp_progress ~= "" then
      return string.format("[LS]  %s", lsp_progress)
    end

    local clients = vim.lsp.get_active_clients({
      bufnr = vim.api.nvim_get_current_buf(),
    })

    for _, client in ipairs(clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then
        return string.format("[LS]  %s", client.name)
      end
    end

    return "[LS]  Inactive"
  end,

  color = { fg = color.yellow },
}

M.formatter = {
  function()
    local formatter = require("core.util").get_buffer_formatter()
    local clients = vim.lsp.get_active_clients({
      bufnr = vim.api.nvim_get_current_buf(),
    })

    if formatter == nil then
      return "[Formatter]  None"
    end

    -- if we are using the language server client formatter display this
    for _, client in ipairs(clients) do
      if client.name == formatter.name then
        return string.format("[Formatter]  LSP")
      end
    end

    return string.format("[Formatter]  %s", formatter.name)
  end,

  color = { fg = color.yellow },
}

M.copilot = {
  function()
    local clients = vim.lsp.get_active_clients({
      bufnr = vim.api.nvim_get_current_buf(),
    })

    for _, client in ipairs(clients) do
      if client.name == "copilot" then
        return "Copilot "
      end
    end

    return "Copilot "
  end,

  color = { fg = color.yellow },
}

M.branch = {
  "branch",
  icon = "",
  color = { fg = color.magenta },
}

M.diagnostics = {
  "diagnostics",
  symbols = { error = " ", warn = " ", hint = " ", info = " " },
}

M.fileformat = {
  "fileformat",
  icons_enabled = false,
  fmt = string.upper,
  color = { fg = color.blue },
}

M.encoding = {
  "encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  color = { fg = color.blue },
}

return M
