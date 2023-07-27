local uv = require("luv")
-- Creating a simple setTimeout wrapper
local function setTimeout(timeout, callback)
  local timer = uv.new_timer()
  timer:start(timeout, 0, function ()
    pcall(function() timer:stop() end)
    pcall(function() timer:close() end)
    vim.schedule_wrap(callback)()
  end)
  return timer
end

-- Creating a simple setInterval wrapper
local function setInterval(interval, callback)
  local timer = uv.new_timer()
  timer:start(interval, interval, function ()
    callback()
  end)
  return timer
end

-- And clearInterval
local function clearInterval(timer)
  timer:stop()
  timer:close()
end
local function clearTimeout(timer)
  if timer == nil then
      return
  end
    pcall(function() timer:stop() end)
    pcall(function() timer:close() end)
end
timer = {
    setTimeout = setTimeout,
    clearTimeout = clearTimeout
}

return timer
