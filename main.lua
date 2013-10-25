-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require "storyboard"

local w = display.viewableContentWidth
local h = display.viewableContentHeight

-- load scenetemplate.lua
storyboard.gotoScene( "scenetemplate" )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):

local back = display.newGroup()

local bg = display.newRect( 0, 0, w, h )
bg:setFillColor( 255, 255, 255 )
bg.x = w/2; bg.y = h/2
bg.width = w; bg.height = h;

local title = display.newText("Calor", 0, 0, "Segan", 50)
title:setTextColor( 0, 100, 140 )
title.x, title.y = w / 2, h * .2

local logoWidth = 50

local logo = display.newImageRect( "logo.png", logoWidth, logoWidth * 1.5 )
logo.x, logo.y = w / 2, h * .32