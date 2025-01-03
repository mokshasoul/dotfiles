local M = {}
--------------------------------------------------------------------------------

local device = hs.host.localizedName()
M.isAtOffice = (device:find("soundcloud-mbp") or false) ~= nil
M.isAtHome = (device:find("FENRIR") and device:find("Home")) ~= nil
M.isAtMother = device:find("Mother") ~= nil

---not static variable, since projector connection can change during runtime
---@nodiscard
---@return boolean
function M.isProjector()
  if M.isAtOffice then
    return false
  end
  return #hs.screen.allScreens() > 1
end

M.mastodonApp = "Ivory"

--------------------------------------------------------------------------------
return M
