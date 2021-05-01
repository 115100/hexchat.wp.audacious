hexchat.register("audacious", "1", "Audacious currently playing script")

local function get_np()
    local handle = assert(io.popen("audtool current-song"))
    local res = string.gsub(assert(handle:read("*a")), "\n", "")
    handle:close()
    hexchat.command("SAY np: " .. res)
    return hexchat.EAT_ALL
end

hexchat.hook_command("wp", get_np, '"/wp" to display currently playing Audacious track')
hexchat.print("hexchat.wp.audacious.lua loaded")
