local Colors = require("colors")
local Settings = require("settings")
local Text = require("text")

local about = {}

local url = "https://github.com/plinkr/flash-blip"
local urlBounds = {}

local url2 = "https://github.com/NightEugene/aurora-flash-blip"
local url2Bounds = {}

local mitUrl = "https://github.com/plinkr/flash-blip?tab=MIT-1-ov-file"
local mitBounds = {}

function about.load() end

function about.update(dt) end

function about.draw()
  love.graphics.setColor(0, 0, 0, 0.8)
  love.graphics.rectangle("fill", 0, 0, Settings.WINDOW_WIDTH, Settings.WINDOW_HEIGHT)

  love.graphics.setColor(Colors.cyan)
  Text.drawCenteredText("ABOUT", Settings.WINDOW_HEIGHT * 0.1, 9)

  love.graphics.setColor(Colors.neon_lime_splash)
  local description1 = "A FAST-PACED, RETRO-STYLE ARCADE"
  local description2 = "VERTICAL SCROLLER IN LOVE2D"
  local description3 = "SURVIVE AND AIM FOR THE HIGH SCORE!"
  Text.drawCenteredText(description1, Settings.WINDOW_HEIGHT * 0.24, 3.2)
  Text.drawCenteredText(description2, Settings.WINDOW_HEIGHT * 0.27, 3.2)
  Text.drawCenteredText(description3, Settings.WINDOW_HEIGHT * 0.30, 3.2)

  local line1 = "LICENSED UNDER MIT"
  local line1Width = Text.getTextWidth(line1, 4)
  Text.drawCenteredText(line1, Settings.WINDOW_HEIGHT * 0.5, 4)

  local mitX = (Settings.WINDOW_WIDTH - line1Width) / 2
  local mitY = Settings.WINDOW_HEIGHT * 0.5
  local mitHeight = Text.charHeight * 4
  mitBounds = { x = mitX, y = mitY, width = line1Width, height = mitHeight }

  local line2 = "INSPIRED BY THE WORK OF KENTA CHO"
  Text.drawCenteredText(line2, Settings.WINDOW_HEIGHT * 0.65, 3.3)

  love.graphics.setColor(Colors.neon_lime_splash)
  local urlWidth = Text.getTextWidth(url, 2.9)
  local urlHeight = Text.charHeight * 2.9
  local urlX = (Settings.WINDOW_WIDTH - urlWidth) / 2
  local urlY = Settings.WINDOW_HEIGHT * 0.70
  urlBounds = { x = urlX, y = urlY, width = urlWidth, height = urlHeight }
  Text.drawText(url, urlX, urlY, 2.9)

  if love.system.getOS() == "AuroraOS" then
    local line3 = "PORTED TO AURORA OS BY NIGHTEUGENE"
    Text.drawCenteredText(line3, Settings.WINDOW_HEIGHT * 0.75, 3.1)

    love.graphics.setColor(Colors.neon_lime_splash)
    local url2Width = Text.getTextWidth(url2, 2.1)
    local url2Height = Text.charHeight * 2.1
    local url2X = (Settings.WINDOW_WIDTH - url2Width) / 2
    local url2Y = Settings.WINDOW_HEIGHT * 0.80
    url2Bounds = { x = url2X, y = url2Y, width = url2Width, height = url2Height }
    Text.drawText(url2, url2X, url2Y, 2.1)
  end

  love.graphics.setColor(Colors.light_blue_glow)
  local gameVersionWidth = Text.getTextWidth(GAME_VERSION, 2)
  Text.drawText(GAME_VERSION, (Settings.WINDOW_WIDTH - gameVersionWidth) * 0.95, Settings.WINDOW_HEIGHT * 0.95, 2)

  love.graphics.setColor(Colors.white)
  local returnText
  if Main.isMobile() then
    returnText = "TAP THE SCREEN TO RETURN"
  else
    returnText = "PRESS ESC OR CLICK TO RETURN"
  end
  Text.drawCenteredText(returnText, Settings.WINDOW_HEIGHT * 0.9, 3)
end

function about.keypressed(key) end

function about.mousepressed(x, y, button)
  if button == 1 then
    if
      x > urlBounds.x
      and x < urlBounds.x + urlBounds.width
      and y > urlBounds.y
      and y < urlBounds.y + urlBounds.height
    then
      love.system.openURL(url)
      return true -- Opens the URL
    end

    if
      x > mitBounds.x
      and x < mitBounds.x + mitBounds.width
      and y > mitBounds.y
      and y < mitBounds.y + mitBounds.height
    then
      love.system.openURL(mitUrl)
      return true -- Opens the project's MIT license URL
    end

    if love.system.getOS() == "AuroraOS" then
      if
        x > url2Bounds.x
        and x < url2Bounds.x + url2Bounds.width
        and y > url2Bounds.y
        and y < url2Bounds.y + url2Bounds.height
      then
        love.system.openURL(url2)
        return true -- Opens the URL
      end
    end
  end
  return false -- Not clicked on URL, handled in main.lua
end

return about
