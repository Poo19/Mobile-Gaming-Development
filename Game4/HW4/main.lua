
local composer = require ("composer");
local widget = require( "widget" )


options = 
{
 effect = "fade",
 time = 500
}


-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
        -- load first scene
        composer.gotoScene("Block",options);
        show:removeSelf();
        Runtime:removeEventListener("touch", handleButtonEvent);
         
    end
end

-- Create the widget
show = display.newText (
{text="Start Game ",
x=display.contentCenterX, y =display.contentCenterY-20 ,
fontSize=60});
show:setFillColor(0,0,1);
Runtime:addEventListener("touch", handleButtonEvent);