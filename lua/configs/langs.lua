--- Language Server Config
---@class LanguageServerConfig
---@field autoinstall boolean if auto installed via Mason
---@field config_by_mason boolean if auto configured via Mason
---@field settings? table<string, any> lsp config by nvim-lspconfig
---
--- Formatter Config
---@class FormatterConfig
---@field autoinstall boolean if auto installed via Mason
---@field prepend_args? string|string[]|fun(self: conform.FormatterConfig, ctx: conform.Context): string|string[] extra prepend args for the formatter
---
---Linter Config
---@class LinterConfig
---@field autoinstall boolean if auto installed via Mason
---@field args? string[] extra args for the linter

--- File type
---@class FileTypeConfig
---@field formatters? table<string, FormatterConfig> formatter config for the file type
---@field linters? table<string, LinterConfig> linter config for the file type

---@type table<string, LanguageServerConfig>
local language_servers = {}

language_servers.lua_ls = {
  autoinstall = true,
  config_by_mason = true,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      hint = {
        enable = true,
        arrayIndex = "Enable",
        setType = true,
      },
    },
  },
}

language_servers.bashls = {
  autoinstall = true,
  config_by_mason = true,
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
    },
  },
}

language_servers.vale_ls = {
  autoinstall = true,
  config_by_mason = true,
  settings = {},
}

language_servers.tsserver = {
  autoinstall = true,
  config_by_mason = false,
  settings = {
    -- TODO: see https://github.com/pmizio/typescript-tools.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    -- tsserver_format_options
    tsserver_file_preferences = {
      -- Inlay Hints
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
}

language_servers.rust_analyzer = {
  autoinstall = true,
  config_by_mason = false,
  settings = {
    -- TODO: see https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
    diagnostics = {
      disabled = {
        "unresolved-proc-macro",
      },
    },
  },
}

language_servers.yamlls = {
  autoinstall = true,
  config_by_mason = true,
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      -- schemas = require("schemastore").yaml.schemas(),
    },
  },
}

language_servers.jsonls = {
  autoinstall = true,
  config_by_mason = true,
  settings = {
    json = {
      -- schemas = require("schemastore").json.schemas(),
      -- validate = { enable = true },
    },
  },
}

------------------------------------
---@type table<string, FileTypeConfig>
local filetypes = {}

filetypes.lua = {
  formatters = {
    stylua = {
      autoinstall = true,
    },
  },
}
-- NOTE: the file type should be `sh` for bash scripts
filetypes.sh = {
  formatters = {
    shfmt = {
      autoinstall = true,
      prepend_args = {
        "-i",
        "2",
      },
    },
  },
  linters = {
    shellcheck = {
      autoinstall = true,
    },
  },
}

filetypes.fish = {
  formatters = {
    fish_indent = {
      autoinstall = false, -- comes with fish itself
    },
  },
  linters = {
    fish = {
      autoinstall = false, -- comse with fish itself
    },
  },
}

filetypes.dart = {
  formatters = {
    dart_format = {
      autoinstall = false, -- comes with flutter
    },
  },
}

filetypes.rust = {
  formatters = {
    rustfmt = {
      autoinstall = false,
      prepend_args = {
        "--edition",
        "2021",
      },
    },
  },
}

local prettierd_eslint_d = {
  formatters = {
    prettierd = {
      autoinstall = true,
      prepend_args = {
        "--no-semi",
        "--single-quote",
        "--jsx-single-quote",
        "--print-width 100",
      },
    },
  },
  linters = {
    eslint_d = {
      autoinstall = true,
    },
  },
}

filetypes.javascript = prettierd_eslint_d
filetypes.javascriptreact = prettierd_eslint_d
filetypes.typescript = prettierd_eslint_d
filetypes.typescriptreact = prettierd_eslint_d

filetypes.json = {
  formatters = {
    prettierd = {
      autoinstall = true,
    },
  },
}

filetypes.markdown = {
  formatters = {
    prettierd = {
      autoinstall = true,
    },
  },
}

filetypes.toml = {
  formatters = {
    taplo = {
      autoinstall = true,
    },
  },
}

filetypes.yaml = {
  formatters = {
    yamlfmt = {
      autoinstall = true,
    },
  },
}

return {
  language_servers = language_servers,
  filetypes = filetypes,
}
