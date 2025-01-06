local window = require("c.window")
local app = require("c.app")

hs.hotkey.bind("ctrl", "i", function()
    hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
    hs.application.launchOrFocus("Alacritty")
end)

hs.hotkey.bind("ctrl", "f", function()
    hs.application.launchOrFocus("Figma")
end)

hs.hotkey.bind("ctrl", ";", function()
    hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind("ctrl", "'", function()
    hs.application.launchOrFocus("Finder")
end)

hs.hotkey.bind({"ctrl", "shift"}, "1", function()
    window.resize("Finder", 0, 0, 0.21, 0.33)
    window.resize("Spotify", 0, 0.33, 0.21, 0.33)
    window.resize("Notion", 0, 0.66, 0.21, 0.33)
    window.resize("Alacritty", 0.21, 0, 0.49, 1)
    window.resize("Google Chrome", 0.7, 0, 0.3, 1)

    app.kill("Cubase")
    app.kill("Figma")
end)

hs.hotkey.bind({"ctrl", "shift"}, "2", function()
    window.resize("Alacritty", 0, 0, 0.5, 1)
    window.resize("Google Chrome", 0.5, 0, 0.5, 0.5)
    window.resize("Finder", 0.5, 0.5, 0.5, 0.5)

    app.kill("Cubase")
    app.kill("Figma")
end)

hs.hotkey.bind({"ctrl", "shift"}, "3", function()
    window.resize("Cubase", 0, 0, 0.7, 1)
    window.resize("Notion", 0.7, 0, 0.3, 0.5)
    window.resize("Splice", 0.7, 0.5, 0.3, 0.5)

    app.kill("Alacritty")
    app.kill("Figma")
end)
