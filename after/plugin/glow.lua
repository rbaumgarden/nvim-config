local mason_bin = vim.fn.stdpath("data") .. "\\mason\\bin"
local glow_path = mason_bin .. "\\glow.cmd"

local ok, glow = pcall(require, "glow")
if ok then
    glow.setup({
        style = "dark",
        glow_path = glow_path,
    })
end
