local api = vim.api
local loop = vim.loop

local monitor_win = nil
local monitor_buf = nil
local timer = loop.new_timer()

-- Function to get CPU & Memory usage
local function get_stats()
    local cpu_usage = io.popen("top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4 \"%\"}'"):read("*a") or "N/A"
    local mem_usage = io.popen("free -m | awk 'NR==2{printf \"%.2f%%\", $3*100/$2 }'"):read("*a") or "N/A"
    return "CPU: " .. cpu_usage .. "Mem: " .. mem_usage
end

-- Function to create the floating window
local function create_monitor_window()
    local buf = api.nvim_create_buf(false, true)
    local width = 20
    local height = 3
    local opts = {
        relative = "editor",
        width = width,
        height = height,
        col = vim.o.columns - width - 2,
        row = 1,
        anchor = "NW",
        style = "minimal",
        border = "rounded",
    }

    local win = api.nvim_open_win(buf, false, opts)
    api.nvim_buf_set_option(buf, "modifiable", false)
    return buf, win
end

-- Function to update the monitor
local function update_monitor()
    if monitor_buf and api.nvim_buf_is_valid(monitor_buf) then
        api.nvim_buf_set_option(monitor_buf, "modifiable", true)
        api.nvim_buf_set_lines(monitor_buf, 0, -1, false, vim.split(get_stats(), "\n"))
        api.nvim_buf_set_option(monitor_buf, "modifiable", false)
    end
end

-- Function to toggle the monitor
local function toggle_monitor()
    if monitor_win and api.nvim_win_is_valid(monitor_win) then
        api.nvim_win_close(monitor_win, true)
        monitor_win = nil
        timer:stop()
        return
    end

    monitor_buf, monitor_win = create_monitor_window()
    update_monitor()
    timer:start(0, 1000, vim.schedule_wrap(update_monitor))
end

-- Command & Keybind
vim.api.nvim_create_user_command("MonitorCPU", toggle_monitor, {})
vim.keymap.set("n", "<leader>m", toggle_monitor, { noremap = true, silent = true })

