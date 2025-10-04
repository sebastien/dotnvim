" SEE: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" npm install -g vscode-html-languageserver-bin
" npm install -g vscode-css-languageserver-bin
" npm install -g vscode-json-languageserver
" npm install -g typescript typescript-language-server
" npm install -g diagnostic-languageserver

lua << EOF
-- Suppress lspconfig deprecation warnings
vim.g.lspconfig_new_api = true

-- Configure LSP logging
vim.lsp.set_log_level("WARN")

-- Set up log truncation to keep log size under control
local log_path = vim.fn.stdpath('state') .. '/lsp.log'
local max_log_size = 10 * 1024 * 1024  -- 10MB in bytes

-- Function to check and truncate log file if it's too large
local function truncate_lsp_log()
  local log_file = io.open(log_path, "r")
  if log_file then
    local size = log_file:seek("end")
    log_file:close()
    
    if size > max_log_size then
      -- Simply truncate the log file
      local new_log = io.open(log_path, "w")
      if new_log then
        new_log:write("LSP log truncated at " .. os.date() .. " (was " .. size .. " bytes)\n")
        new_log:close()
      end
    end
  end
end

-- Check log size on startup
truncate_lsp_log()

-- Suppress deprecation warnings by setting this before requiring anything
vim.g.lspconfig_new_api = true

-- Use new vim.lsp.config API for Neovim 0.11+
local servers = {"pyright", "ts_ls", "gopls", "cssls", "html", "jsonls", "zls", "yamlls"}

-- Configure each language server using the new API
for _, server in ipairs(servers) do
  local config = {
    on_attach = function(client, bufnr)
      -- Set omnifunc for LSP completion
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      -- Disable document formatting for this LSP client
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
    -- Add capabilities if coq is available
    capabilities = coq and coq.lsp_ensure_capabilities() or vim.lsp.protocol.make_client_capabilities()
  }
  
  -- Special configuration for YAML language server
  if server == "yamlls" then
    config.settings = {
      yaml = {
        validate = true,
        hover = true,
        completion = true,
        format = {
          enable = true
        },
        schemas = {
          -- Enable schema validation for common YAML files
          kubernetes = "*.yaml",
          ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.yml",
          ["https://json.schemastore.org/github-action.json"] = ".github/action.yml",
        }
      }
    }
  end
  
  vim.lsp.config[server] = config
  -- Start the language server
  vim.lsp.enable(server)
end

-- Enable diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  update_in_insert = true,
  float = {
    border = "rounded"
  }
})

-- Configure LSP floating windows with rounded borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
    border = "rounded"
  }
)

-- Setup treesitter if available
if pcall(require, "nvim-treesitter.configs") then
  require'nvim-treesitter.configs'.setup {highlight={enable=true},}
end
EOF


" SEE: lsp-config
set omnifunc=v:lua.vim.lsp.omnifunc

function LspStatus()
  lua print(vim.inspect(vim.lsp.get_clients()))
endfunction

function LspInspect()
  lua print(vim.inspect(vim.lsp))
endfunction