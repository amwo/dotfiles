local app = {}

function app.kill(appName)
    local app = hs.application.get(appName)
    if app then
        app:kill() -- Gracefully terminate the app
        hs.alert.show(appName .. " has been closed.")
    else
        hs.alert.show(appName .. " is not running.")
    end
end
