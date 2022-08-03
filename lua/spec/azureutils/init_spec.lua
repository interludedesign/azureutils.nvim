describe("init", function()
	it("can be required", function()
		require("azureutils")
	end)

	describe("_select_repo_from_bufname", function()
		it("returns the repo which matches the bufname", function()
			local repos = { 'my-repo' }
			local bufname = "/Users/me/Code/my-repo/lua-code/init.lua"

			local result = require("azureutils")._select_repo_from_bufname(repos, bufname)

			assert.are.same("my-repo", result)
		end)
	end)

	describe("_path_from_bufname", function()
		it("returns the path after the repo name", function()
			local bufname = "/Users/me/Code/my-repo/lua-code/init.lua"
			local repo = 'my-repo'

			local result = require("azureutils")._path_from_bufname(bufname, repo)

			assert.are.same("/lua-code/init.lua", result)
		end)
	end)

	describe("_generate_url", function()
		it("returns the expected url", function()
			local base_url = "https://example.com/MyCollection/MyProduct/_git"
			local repos = { 'my-repo' }
			local bufname = "/Users/me/Code/my-repo/lua-code/init.lua"
			local cursor_positions = { 0, 1 }

			local result = require("azureutils")._generate_url(base_url, repos, bufname, cursor_positions)

			assert.are.same(
				"https://example.com/MyCollection/MyProduct/_git/my-repo?path=/lua-code/init.lua&line=0&lineEnd=1&lineStartColumn=1&lineEndColumn=1&lineStyle=plain",
				result
			)
		end)
	end)
end)
