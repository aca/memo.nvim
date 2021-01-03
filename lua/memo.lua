local M = {}
local api = vim.api
local fn = vim.fn

M.cache = {}

function vt()
  local line = api.nvim_get_current_line()
  local cur = api.nvim_win_get_cursor(0)
  local url = string.match(line, '[http://][https://][%w|%p]*')
  if url ~= nil then
    -- local cmd = "curl -s \"" .. url ..  "\" | grep -o \"<title>[^<]*\" | tail -c+8 | tr -d \"\n\""
    local cmd = "curl -s \"" .. url ..  "\" | grep -o \"<title>[^<]*\" | tail -c+8 | xargs echo -n"
    api.nvim_buf_clear_namespace(0, 2, 0, -1)

    if M.cache[url] ~= nil then
      local txt = '-- ' .. M.cache[url]
      if M.cache[url] ~= "" then
        api.nvim_buf_set_virtual_text(0, 2, cur[1] - 1, {{ txt ,'Comment' }}, {})
      end
    else
      fn.jobstart(cmd, {
          on_stdout = function (_,d,_)
            -- TODO: jobstart is called twice. Don't know why. 
            if d[1] == "" then
              return
            end
            M.cache[url] = d[1]
            local txt = '-- ' .. M.cache[url]
            api.nvim_buf_set_virtual_text(0, 2, cur[1] - 1, {{ txt ,'Comment' }}, {})
          end
        }
      )
    end
  end
end

M.vt = vt

return M
