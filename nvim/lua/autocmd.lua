local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Run format on *.go files
api.nvim_create_autocmd("BufWritePre", { command = [[*.go :silent! lua require('go.format').gofmt()]] })
