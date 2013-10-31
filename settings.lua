----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local w = display.viewableContentWidth
local h = display.viewableContentHeight

-- get stored settings
local sPath = system.pathForFile( "settings.txt" )

local f = io.open( sPath, "r" )

local setArray = {}

for line in f:lines() do
	setArray[ #setArray + 1 ] = line
end

io.close(f)
--

local icons = {}
local bars = {}
local pointers = {}

local margin = w / 8
----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	icoW = 30

	setTitle = display.newText("Settings", 0, 0, "Segan", 32)
	setTitle:setTextColor( black )
	setTitle.x, setTitle.y = margin * 2.2, margin * 2
	setTitle.alpha = 0

	cals = display.newText(setArray[1], 0, 0, "Segan", 34)
	cals:setTextColor( black )
	cals.x, cals.y =  w - margin * 4, margin * 3 + icoW * 1.1 + margin
	cals.alpha = 0

	local iNames = { "cal_icon.png", "fat_icon.png", "sod_icon.png", "chol_icon.png" }

	for i = 1, 4, 1 do
		
		local ico = display.newImageRect( iNames[i], icoW, icoW )
		ico.x, ico.y = margin * 1.4, margin * 3 + ((icoW + margin) * i) 
		ico:setFillColor( black )
		ico.alpha = 0

		icons[ #icons + 1 ] = ico

		local barW = w / 2

		if i > 1 then
			local bar = display.newRect( 0, 0, barW, 1 )
			bar.x, bar.y = ico.x + w / 2.5, ico.y
			bar.alpha = 0
			bar:setFillColor( black )

			bars[ #bars + 1 ] = bar

			local poi = display.newCircle( bar.x - (barW / 2) + (barW * setArray[i]), bar.y, 4 )
			poi.alpha = 0
			poi:setFillColor( black )

			pointers[ #pointers + 1 ] = poi		

		end
		
	end


	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	transition.to( setTitle, { time = 600, delay = 0, alpha = 1 })
	transition.to( cals, { time = 600, delay = 0, alpha = 1 })

	for i = 1, 4, 1 do
		transition.to( bars[i], { time = 600, delay = 0, alpha = 1 })
		transition.to( pointers[i], { time = 600, delay = 0, alpha = 1 })
		transition.to( icons[i], { time = 600, delay = 0, alpha = 1 })
	end

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene