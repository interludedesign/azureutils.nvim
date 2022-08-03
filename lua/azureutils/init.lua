local M = {}
local a = vim.api

M._base_url = ""
M._repos = {}

M.setup = function(git_repo_url, repos)
	M._base_url = git_repo_url
	M._repos = repos
end

M.open_file_in_azure = function()
	local bufname = a.nvim_buf_get_name(0)
	local cursor_positions = a.nvim_win_get_cursor(0)
	local url = M._generate_url(M._base_url, M._repos, bufname, cursor_positions)

	vim.cmd('exec "!open \'' .. url .. '\'"')
end

M._path_from_bufname = function(bufname, repo)
	-- find the starting and ending position of the repo string within the bufname string
	local _, end_pos = string.find(bufname, repo, nil, true)

	return string.sub(bufname, end_pos +1, -1)
end

M._select_repo_from_bufname = function(repos, bufname)
	for _, repo in pairs(repos) do
		-- fourth argument disabled pattern matching / magic chars
		-- http://www.lua.org/manual/5.1/manual.html#pdf-string.find
		if string.find(bufname, repo, nil, true) then
			return repo
		end
	end

	return "not_found"
end

M._generate_url = function(base_url, repos, bufname, cursor_positions)
	local repo = M._select_repo_from_bufname(repos, bufname)
	local path = M._path_from_bufname(bufname, repo)
	local params = string.format(
		"/%s?path=%s&line=%s&lineEnd=%s&lineStartColumn=%s&lineEndColumn=%s&lineStyle=plain",
		repo,
		path,
		cursor_positions[1],
		cursor_positions[1] + 1,
		1,
		1
	)
	return(base_url .. params)
end

return M
