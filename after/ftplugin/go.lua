local map = vim.keymap.set
local opts = { buffer = true }

map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", opts)
map("n", "<leader>ea", "oassert.NoError(err, \"\")<Esc>F\";a", opts)
map("n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj", opts)
map("n", "<leader>el", "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i", opts)
