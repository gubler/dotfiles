return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "php_cs_fixer" },
        markdown = {},
        twig = { "twig_cs_fixer" },
      },
      linters = {
        php_cs_fixer = {
          cmd = "vendor/bin/php-cs-fixer",
          args = { "--show-progress=none", "--format=json" },
          stdin = false,
          ignore_exitcode = true,
          stream = "stdout",
          parser = function(output, bufnr)
            if vim.trim(output) == "" or output == nil then
              return {}
            end

            local file = vim.json.decode(output).files[vim.api.nvim_buf_get_name(bufnr)]

            if file == nil then
              return {}
            end

            local diagnostics = {}

            for _, message in ipairs(file.messages or {}) do
              table.insert(diagnostics, {
                lnum = type(message.line) == "number" and (message.line - 1) or 0,
                col = 0,
                message = message.message,
                source = "php_cs_fixer",
              })
            end

            return diagnostics
          end,
        },
        twig_cs_fixer = {
          cmd = "vendor/bin/twig-cs-fixer",
          args = { "--show-progress=none", "--format=json" },
          stdin = false,
          ignore_exitcode = true,
          stream = "stdout",
          parser = function(output, bufnr)
            if vim.trim(output) == "" or output == nil then
              return {}
            end

            local file = vim.json.decode(output).files[vim.api.nvim_buf_get_name(bufnr)]

            if file == nil then
              return {}
            end

            local diagnostics = {}

            for _, message in ipairs(file.messages or {}) do
              table.insert(diagnostics, {
                lnum = type(message.line) == "number" and (message.line - 1) or 0,
                col = 0,
                message = message.message,
                source = "twig_cs_fixer",
              })
            end

            return diagnostics
          end,
        },
      },
    },
  },
}
