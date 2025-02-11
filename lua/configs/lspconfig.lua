-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.api.nvim_get_runtime_file("", true)
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    if server_name == "lua_ls" then
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                "vim",
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                vim.fn.expand "$VIMRUNTIME/lua",
                vim.fn.stdpath "data" .. "\\lazy",
                vim.fn.stdpath "config" .. "\\lua",
              },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }
    elseif server_name == "gradle_ls" then
      local util = require "lspconfig.util"
      lspconfig.gradle_ls.setup {
        capabilities = capabilities,
        filetypes = { "groovy" },
        root_dir = util.root_pattern(
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
    else
      lspconfig[server_name].setup {
        capabilities = capabilities,
      }
    end
  end,
}
