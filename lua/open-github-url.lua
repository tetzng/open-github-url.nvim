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
  local current_line_text = vim.fn.getline(".")
  local url_pattern = [[\v('|")(\w|-|_|.)+/(\w|-|_|.)+('|")]]
  local vim_regex = vim.regex(url_pattern)
  local from_idx, to_idx = vim_regex:match_str(current_line_text)
  if from_idx == nil or to_idx == nil then
    return nil
  end
  return string.sub(current_line_text, from_idx + 2, to_idx - 1)
end

function M.open_github_url_under_cursor()
  local repo_path = M.get_repo_path_under_cursor()
  if repo_path ~= "" then
    M.open_url("https://github.com/" .. repo_path)
  end
end

local function setup_commands()
  local cmd = vim.api.nvim_create_user_command
  cmd("OpenUrl", function(opts) M.open_url(opts.fargs[1]) end, { nargs = 1 })
  cmd("OpenGitHubUrlUnderCursor", function() M.open_github_url_under_cursor() end, {})
  cmd("GetRepoPathUnderCursor", function() M.get_repo_path_under_cursor() end, {})
end

function M.setup()
  setup_commands()
end

return M
