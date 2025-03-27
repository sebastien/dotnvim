-- File: lua/lint/linters/deepsource.lua

local M = {}

M.cmd = "deepsource"  -- Adjust based on how you run DeepSource
M.args = { "analyze", "--output", "text" }  -- Adjust arguments as needed
M.stdin = false
M.stream = "stdout"
M.ignore_exitcode = true

-- Parse the DeepSource output format
function M.parser(output)
  local diagnostics = {}

  for _, line in ipairs(vim.split(output, "\n")) do
    -- Skip empty lines
    if line and line ~= "" then
      -- Parse DeepSource output format: file:line source code message
      local file, line_num, source_type, code, message = line:match("([^:]+):(%d+)%s+(%S+)%s+(%S+)%s+(.*)")

      if file and line_num and source_type and code and message then
        table.insert(diagnostics, {
          filename = file,
          lnum = tonumber(line_num) - 1,  -- 0-indexed line numbers
          col = 0,  -- DeepSource output doesn't include column information
          end_lnum = tonumber(line_num) - 1,
          end_col = 0,
          severity = vim.diagnostic.severity.WARN,
          source = "deepsource",
          code = code,
          message = string.format("[%s] %s", code, message)
        })
      end
    end
  end

  return diagnostics
end

return M
