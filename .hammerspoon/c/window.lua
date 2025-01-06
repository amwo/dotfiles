local window = {}

function window.resize(appName, xPercent, yPercent, wPercent, hPercent)
    local function performResize(app)
        local win = app:mainWindow()
        if win then
            local screenFrame = win:screen():frame()

            local x = screenFrame.x + screenFrame.w * xPercent
            local y = screenFrame.y + screenFrame.h * yPercent
            local w = screenFrame.w * wPercent
            local h = screenFrame.h * hPercent

            win:setFrame(hs.geometry.rect(x, y, w, h))
            win:focus()
        else
            hs.alert.show("Window for " .. appName .. " not found after launch")
        end
    end

    local app = hs.application.get(appName)
    if app and app:mainWindow() then
        performResize(app)
        return
    end

    hs.application.launchOrFocus(appName)

    hs.timer.doWhile(
        function()
            app = hs.application.get(appName)
            return not (app and app:mainWindow()) -- Continue waiting until the app and its main window are ready
        end,
        function()
            if app and app:mainWindow() then
                -- Perform resize and bring the app's window to the front
                performResize(app)
            end
        end,
        0.5
    )
end

return window
