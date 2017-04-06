local composer = require( "composer" )
local widget = require( "widget" )
composer.removeHidden( true );
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    local jankenOpt =
{
frames = {
{x= 154, y= 13, width= 39, height= 48 }, -- shake1   1
{x= 195, y= 13, width= 39, height= 48 }, -- shake2   2
{x= 236, y= 13, width= 32, height= 48 }, -- set      3
{x= 270, y= 13, width= 16, height= 48 }, --r/p/s     4
{x= 287, y= 13, width= 16, height= 48 }, --r/p/s     5
{x= 305, y= 13, width= 15, height= 48 }, --r/p/s     6
{x= 69, y= 13, width= 41, height= 48 }, --flap1      7
{x= 110, y= 13, width= 40, height= 48 }, --flap2      8
}
};

local jankenSheet = graphics.newImageSheet( "chars.png",
jankenOpt );
local frame1 = display.newImage ( jankenSheet, 1 );
-- Create animation sequence janken
local seqDataJanken = {
{name = "flap", frames={7,8}, time = 500},
{name = "shake", frames={1,2}, time = 500},
{name = "set", frames={3}, time = 10, loopCount=1},
{name = "rock", frames={3,4}, time = 10, loopCount=1},
{name = "paper", frames={3,5}, time = 10, loopCount=1},
{name = "scissor", frames={3,6}, time = 10, loopCount=1},
}
local janken = display.newSprite (jankenSheet, seqDataJanken);
janken.x = display.contentCenterX-250;
janken.y = display.contentCenterY+150;
janken.anchorX = 1;
janken.anchorY = 1;
janken.xScale = 6
janken.yScale = 6
janken:setSequence("shake");
janken:play();



    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
        local options1 = 
    {
        text = "You loose the level2,   Retry Again!",
        x = 600,
        y = 300;
        width = 400,     --required for multi-line and alignment
        font = native.systemFont,
        fontSize = 40
    }
    local myText2 = display.newText( options1 )
    myText2:setFillColor( 1, 0, 0 )


    local function handleButtonEvent1( event )

    if ( event.phase == "ended" ) then
        print( "Button was pressed and released" )
        composer.gotoScene( "level4", {effect="slideLeft",
                time=1500});        
     end
    end

    local function handleButtonEvent2( event )

    if ( event.phase == "ended" ) then
        print( "Button was pressed and released" )
        composer.gotoScene( "level2", {effect="slideLeft",
                time=1500});        
     end
    end


    local btnlevel1 = widget.newButton(
        {
        x = 600,
        y = 400,
        id = "Level1",
        label = "level1",
        labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
        sheet = buttonSheet,
        defaultFrame = 1,
        overFrame = 2,
        onEvent = handleButtonEvent1,
        }
        );
        btnlevel1.xScale = 2.5;
        btnlevel1.yScale = 2.5;

        local btnlevel2 = widget.newButton(
        {
        x = 600,
        y = 500,
        id = "Level2",
        label = "level2",
        labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
        sheet = buttonSheet,
        defaultFrame = 1,
        overFrame = 2,
        onEvent = handleButtonEvent2,
        }
        );
        btnlevel2.xScale = 2.5;
        btnlevel2.yScale = 2.5;


end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
    end
end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
return scene;
