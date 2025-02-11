local M = {}

function M.open_url(url)
  local open_cmd
  if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    open_cmd = "start"
  elseif vim.fn.has("mac") == 1 then
    open_cmd = "open"
  else
    open_cmd = "xdg-open"
  end
  vim.fn.system(open_cmd .. " " .. url)
end

function M.get_repo_path_under_cursor()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")

  local left = col
  while left > 1 do
    local c = line:sub(left - 1, left - 1)
    if c == "'" or c == '"' then
      break
    end
    left = left - 1
  end

  local right = col
  while right <= #line do
    local c = line:sub(right, right)
    if c == "'" or c == '"' then
      break
    end
    right = right + 1
  end

  local candidate = line:sub(left, right - 1)

  if candidate:match("^[%w._-]+/[%w._-]+$") then
    return candidate
  end
  return nil
end

function M.open_github_url_under_cursor()
  local repo_path = M.get_repo_path_under_cursor()
  if repo_path and repo_path ~= "" then
    M.open_url("https://github.com/" .. repo_path)
  end
end

local function setup_commands()
  local cmd = vim.api.nvim_create_user_command
  cmd("OpenUrl", function(opts) M.open_url(opts.fargs[1]) end, { nargs = 1 })
  cmd("OpenGitHubUrlUnderCursor", function() M.open_github_url_under_cursor() end, {})
  cmd("GetRepoPathUnderCursor", function() print(M.get_repo_path_under_cursor() or "") end, {})
end

function M.setup()
  setup_commands()
end

return M
