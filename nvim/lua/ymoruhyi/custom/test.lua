local bufnr = 82
local ns_id = vim.api.nvim_create_namespace("demo")

local line_num = 5
local col_num = 5

local opts = {
  id = 1,
  virt_text = {{"demo", "Comment"}},
  virt_text_pos = 'eol',
}

local mark_id = vim.api.nvim_buf_set_extmark(bufnr, ns_id, line_num, col_num, opts)


-- vim.api.nvim_create_autocmd({"BufWritePost"}, {
--   group = vim.api.nvim_create_augroup("BiomeGroup", { clear = true }),
--   pattern = {"*.js", "*.ts"},
--   callback = function()
--     vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"biome output of the current buffer"});
--     vim.fn.jobstart({"biome", "format", "test.ts"}, {
--       stdout_buffered = true,
--       on_stdout = function (_, data)
--         vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data);
--       end
--     })
--   end
-- })

