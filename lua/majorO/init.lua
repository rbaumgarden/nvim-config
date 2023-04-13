function Is_Windows()
    return vim.loop.os_name().version:match("Windows")
end

function Get_User_Home()
    if Is_Windows then
        return os.getenv("USERPROFILE") .. "\\.vim\\undodir"
    else
        return os.getenv("HOME") .. "/.vim/undodir"
    end
end

require("majorO.remap")
require("majorO.set")
