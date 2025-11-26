--
-- Hammerspoon Script to enforce the audio input.
--
-- Useful documentation:
--   https://www.hammerspoon.org/docs/hs.audiodevice.html
--   https://www.hammerspoon.org/docs/hs.audiodevice.watcher.html
--

local MICROPHONE_DEVICE_NAME = "AppleUSBAudioEngine:BLUE MICROPHONE:Blue Snowball :SBIrzW:1"
local FALLBACK_DEVICE_NAME = "BuiltInMicrophoneDevice"

local log = hs.logger.new("init", "debug")
log.i("Initializing")

function audioDeviceCallback(event)
  log.f('audioDeviceCallback: "%s"', event)
  if event ~= "dIn" then -- Remove the trailing space, it's a bug
    return
  end

  local defaultInputDevice = hs.audiodevice.defaultInputDevice()
  log.f("Input device has changed to %s", defaultInputDevice:name())

  local microphone = hs.audiodevice.findDeviceByUID(MICROPHONE_DEVICE_NAME)
  if microphone then
    log.i("Setting microphone to be the default again")
    microphone:setDefaultInputDevice()
  else
    local fallback = hs.audiodevice.findDeviceByUID(FALLBACK_DEVICE_NAME)
    if fallback then
      fallback:setDefaultInputDevice()
      log.w("Microphone is not connected, using fallback")
    else
      log.e("Neither microphone nor fallback device found!")
    end
  end
end

hs.audiodevice.watcher.setCallback(audioDeviceCallback)
hs.audiodevice.watcher.start()

log.i("Initialized!")
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
