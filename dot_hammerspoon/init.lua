-- inspired/stolen from https://github.com/chrisgrieser/.config/tree/main/hammerspoon
-- HAMMERSPOON SETTINGS
--
hs.autoLaunch(true)
hs.menuIcon(false)
hs.automaticallyCheckForUpdates(true)
hs.window.animationDuration = 0

--------------------------------------------------------------------------------
-- LOAD MODULES

G = {} -- persist from garbage collector

---Try to require the module, and do not error when one of them cannot be
---loaded, but do notify if there was an error.
---@param module string module to load
local function safeRequire(module)
  local success, M = pcall(require, module)
  G[module:sub(5)] = M
  if not success then
    hs.alert.show(M, 5)
    print(M)
  end
end

safeRequire("apps.app-specific-behavior")
