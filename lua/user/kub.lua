local status_ok,kub = pcall(require,'kub')

if not status_ok then
	return
end


local api = vim.api
local buf, win

local function open_window()
  buf = api.nvim_create_buf(false, true) -- create new emtpy buffer

  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- get dimensions
  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")

  -- calculate our floating window size
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)

  -- and its starting position
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  -- set some options
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col
  }

  -- and finally create it with buffer attached
  win = api.nvim_open_win(buf, true, opts)
end



local border_opts = {
  style = "minimal",
  relative = "editor",
  width = win_width + 2,
  height = win_height + 2,
  row = row - 1,
  col = col - 1
}


local border_buf = api.nvim_create_buf(false, true)

local border_lines = { '╔' .. string.rep('═', win_width) .. '╗' }
local middle_line = '║' .. string.rep(' ', win_width) .. '║'
for i=1, win_height do
  table.insert(border_lines, middle_line)
end
table.insert(border_lines, '╚' .. string.rep('═', win_width) .. '╝')

api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)
-- set bufer's (border_buf) lines from first line (0) to last (-1)
-- ignoring out-of-bounds error (false) with lines (border_lines)

local border_win = api.nvim_open_win(border_buf, true, border_opts)
win = api.nvim_open_win(buf, true, opts)
api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "'..border_buf)

local function update_view()
  -- we will use vim systemlist function which run shell
  -- command and return result as list
  local result = vim.fn.systemlist('git diff-tree --no-commit-id --name-only -r HEAD')

  -- with small indentation results will look better
  for k,v in pairs(result) do
    result[k] = '  '..result[k]
  end

  api.nvim_buf_set_lines(buf, 0, -1, false, result)
end



