local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" }
})

-- require('nvim-autopairs.completion.cmp').setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true -- it will auto insert `(` after select function or method item
-- })

