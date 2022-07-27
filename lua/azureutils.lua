local M = {}
local a = vim.api

M._git_repo_url = ""
M._repos = {}

local function escape(str)
  return string.gsub(str, "-", "")
end

local function path_from_bufname(bufname, repo)
	local bufname_esc = escape(bufname)
	local repo_esc = escape(repo)

	local results_tbl = vim.split(bufname_esc, repo_esc)

	return results_tbl[#results_tbl]
end

local select_repo_from_bufname = function(repos, bufname)
	for _, repo in pairs(repos) do
		if (escape(bufname)):find (escape(repo)) then
			return repo
		end
	end

	return "not_found"
end

M.setup = function(git_repo_url, repos)
	M._git_repo_url = git_repo_url
	M._repos = repos
end

M.locate_line_in_repo = function()
	local bufname = a.nvim_buf_get_name(0)
	local cursor = a.nvim_win_get_cursor(0)
	local repo = select_repo_from_bufname(M._repos, bufname)
	local path = path_from_bufname(bufname, repo)
	local params = string.format(
		"/%s?path=%s&line=%s&lineEnd=%s&lineStartColumn=%s&lineEndColumn=%s&lineStyle=plain",
		repo,
		path,
		cursor[1],
		cursor[1] + 1,
		1,
		1
	)
	local compiled_url = M._git_repo_url .. params

	vim.cmd('exec "!open \'' .. compiled_url .. '\'"')
end

return M
