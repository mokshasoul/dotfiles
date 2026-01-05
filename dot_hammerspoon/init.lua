--
-- Hammerspoon Script to enforce the audio input.
--
-- Useful documentation:
--   https://www.hammerspoon.org/docs/hs.audiodevice.html
--   https://www.hammerspoon.org/docs/hs.audiodevice.watcher.html
--
-- Hammerspoon globals
hs.loadSpoon("EmmyLua")
-- inspired/stolen from https://github.com/chrisgrieser/.config/tree/main/hammerspoon
-- HAMMERSPOON SETTINGS
--
hs.autoLaunch(true)
hs.menuIcon(false)
hs.automaticallyCheckForUpdates(true)
hs.window.animationDuration = 0

local MICROPHONE_DEVICE_NAME = "AppleUSBAudioEngine:BLUE MICROPHONE:Blue Snowball :SBIrzW:1"
local FALLBACK_DEVICE_NAME = "BuiltInMicrophoneDevice"
local log = hs.logger.new("init", "debug")
log.i("Initializing")
function AudioDeviceCallback(event)
  log.f('audioDeviceCallback: "%s"', event)
  -- if event ~= "dIn" then
  --   return
  -- end

  local defaultInputDevice = hs.audiodevice.defaultInputDevice()

  if defaultInputDevice ~= nil then
    log.f("Input device has changed to %s", defaultInputDevice:name())
  end

  local microphone = hs.audiodevice.findDeviceByUID(MICROPHONE_DEVICE_NAME)
  if microphone ~= nil then
    log.i("Setting microphone to be the default again")
    microphone:setDefaultInputDevice()
  else
    log.i("Microphone is not connected, using fallback")
    local fallback = hs.audiodevice.findDeviceByUID(FALLBACK_DEVICE_NAME)
    if fallback ~= nil then
      fallback:setDefaultInputDevice()
    else
      log.e("Neither microphone nor fallback device found!")
    end
  end
end

hs.audiodevice.watcher.setCallback(AudioDeviceCallback)
hs.audiodevice.watcher.start()

log.i("Initialized!")
