local M = {}
local api = vim.api

function vt()
  local line = api.nvim_get_current_line()
  local cur = api.nvim_win_get_cursor(0)

  local url = string.match(line, '[http://][https://][%w|%p]*')

  if url ~= nil then
    local cmd = "curl -s \"" .. url ..  "\" | grep -o \"<title>[^<]*\" | tail -c+8 | tr -d \"\n\""
    api.nvim_buf_clear_namespace(0, 2, 0, -1)
    vim.fn.jobstart(cmd, {
      on_stdout = function (_,d,_)
        api.nvim_buf_set_virtual_text(0, 2, cur[1] - 1, {{d[1] ,'Comment' }}, {})
      end
    }
    )
  end
end

M.vt = vt

return M
