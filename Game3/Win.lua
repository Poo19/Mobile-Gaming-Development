
local composer = require( "composer" )

local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view
    
    composer.removeScene( "level3" )
    composer.removeScene( "level1" )
    background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth/5, display.contentHeight/5 )
    background:setFillColor( 1, 0.3, 0.2 )
    myText = display.newText( "You Win! Congrats Want to", display.contentCenterX, display.contentCenterY-100, native.systemFont, 40 )
    myText:setFillColor( 1, 0, 0 )
    myText = display.newText( "Play Again!", display.contentCenterX, display.contentCenterY, native.systemFont, 40 )
    myText:setFillColor( 0, 0, 0 )
    transition.blink( background, { time=2000 } )
    
    sceneGroup:insert( background )
end

scene:addEventListener( "create", scene )

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        composer.removeScene( "level3" )
    	-- Called when the scene is still off screen (but is about to come on screen).
        elseif ( phase == "did" ) then
        local function next (event)
        print("hello")
        Runtime:removeEventListener("touch", next);
        --myText:removeSelf()
        composer.gotoScene("level3", {effect="slideLeft",
        time=1500});
        end
        Runtime:addEventListener("touch", next);
	end  
end


scene:addEventListener( "show", scene )

return scene;

