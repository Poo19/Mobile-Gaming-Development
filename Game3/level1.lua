
local composer = require( "composer" )

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
    background:setFillColor( 1, 0, 0.2 )
    myText = display.newText( "Start Game!", display.contentCenterX, display.contentCenterY, native.systemFont, 100 )
    myText:setFillColor( 0, 0, 0 )
    sceneGroup:insert( background )
end

scene:addEventListener( "create", scene )

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    	-- Called when the scene is still off screen (but is about to come on screen).
        elseif ( phase == "did" ) then
		local function next (event)
		print("hello")
		Runtime:removeEventListener("touch", next);
		myText:removeSelf()
		composer.gotoScene("level3", {effect="slideLeft",
		time=1500});
		end
        Runtime:addEventListener("touch", next);    
	end  
end


scene:addEventListener( "show", scene )

return scene;

