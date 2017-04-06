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
        {x= 178, y= 62, width= 24, height= 32 }, -- shake1
        {x= 153, y= 62, width= 24, height= 32 }, -- shake2
        {x= 236, y= 62, width= 16, height= 32 }, -- set
        {x= 270, y= 62, width= 16, height= 32 }, --r/p/s -- rock
        {x= 287, y= 62, width= 16, height= 32 }, --r/p/s -- scissors
        {x= 305, y= 62, width= 15, height= 32 }, --r/p/s -- paper
        {x= 68,  y=62, width= 16, height= 32 }, --idle1
        {x= 85, y= 62, width= 16, height= 32 }, --idle2
        {x= 376, y= 62, width= 24, height= 32 }, --poof1
        {x= 401, y= 62, width= 24, height= 32 }, --poof2
    }
};
    
local jankenSheet = graphics.newImageSheet( "chars.png",
jankenOpt );
local frame1 = display.newImage ( jankenSheet, 1 );
-- Create animation sequence janken
local seqDataJanken = {
    {name = "idle", frames={7,8}, time = 500},
    {name = "shake", frames={1,2}, time = 500},
    {name = "set", frames={3}, time = 10, loopCount=1},
    {name = "rock", frames={4}, time = 10, loopCount=1},
    {name = "scissors", frames={5}, time = 10, loopCount=1},
    {name = "paper", frames={6}, time = 10, loopCount=1},
    {name = "poof", frames={9,10}, time = 500, loopCount=4}

}
janken = display.newSprite (jankenSheet, seqDataJanken);
janken.x = display.contentCenterX-350;
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
        text = "You loose the game,   Retry Again!",
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
                time=500});        
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
