local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = require "configs.lspattach"

dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

-- lsps with default config
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    if server_name ~= "lua_ls" and server_name ~= "jdtls" and server_name ~= "gradle_ls" then
      lspconfig[server_name].setup {
        on_attach = on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
      }
    end
  end,
}

-- lsps with custom config
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,

  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.stdpath "config" .. "/lua",
          vim.fn.stdpath "data" .. "/lazy",
          "${3rd}/luv/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  },
}

lspconfig.gradle_ls.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "groovy" },
  root_dir = require("lspconfig.util").root_pattern(
    "settings.gradle", -- Gradle (multi-project)
    "build.gradle" -- Gradle
  ),
  cmd = { "gradle-language-server.cmd" },
  -- gradle-language-server expects init_options.settings to be defined
  init_options = {
    settings = {
      gradleWrapperEnabled = true,
    },
  },
}
