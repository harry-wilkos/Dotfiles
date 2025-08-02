
-- lua/components/live_diagnostics.lua
local lualine_require = require('lualine_require')
local Component    = lualine_require.require('lualine.component')
local sources_mod  = lualine_require.lazy_require {
  sources = 'lualine.components.diagnostics.sources',
  utils   = 'lualine.utils.utils',
}

local LiveDiagnostic = Component:extend()

-- grab default symbols
local default_symbols = require('lualine.components.diagnostics.config').symbols

-- helper to get a hex color
local function hl(name)
  local fg = vim.api.nvim_get_hl(0, { name = name }).fg
  return fg and string.format("#%06x", fg) or nil
end

function LiveDiagnostic:init(options)
  LiveDiagnostic.super.init(self, options)
  -- merge symbols
  self.symbols = vim.tbl_extend('keep', options.symbols or {}, default_symbols.icons)
  -- sections order: error → warn → info → hint
  self.sections = options.sections or { "error", "warn", "info", "hint" }
end

function LiveDiagnostic:update_status()
  -- 1) gather diagnostics counts
  local data = sources_mod.sources.get_diagnostics(self.options.sources)
  local counts = { error = 0, warn = 0, info = 0, hint = 0 }
  for _, d in pairs(data) do
    counts.error = counts.error + d.error
    counts.warn  = counts.warn  + d.warn
    counts.info  = counts.info  + d.info
    counts.hint  = counts.hint  + d.hint
  end

  -- 2) decide overall color based on priority
  local fg
  if counts.error > 0 then
    fg = hl("DiagnosticError") or hl("Error")
  elseif counts.warn > 0 then
    fg = hl("DiagnosticWarn")  or hl("WarningMsg")
  else
    fg = hl("Comment")         or "#888888"
  end

  -- 3) build each section’s string
  local parts = {}
  for _, kind in ipairs(self.sections) do
    local n = counts[kind]
    if n > 0 then
      table.insert(parts, self:format_highlight({ fg = fg })
                         .. self.symbols[kind] .. n)
    end
  end

  -- 4) always show something?
  if #parts == 0 and self.options.always_visible then
    table.insert(parts, self:format_highlight({ fg = fg })
                       .. self.symbols.info .. "0")
  end

  return table.concat(parts, ' ')
end

return LiveDiagnostic
