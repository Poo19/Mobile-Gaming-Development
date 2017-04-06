--------------------------------HOMEWORK  3---------------------------------------------------------------------
--------------------------------POORNIMA BYREGOWDA---------------------------------------------
------------------------------------------------------------------------------------------------
--[[
         
ROCK PAPER SCISSOR

Basic rock, paper, scissor game, it would become stale very fast. To turn it into the
awesome game that it ought to be, we will make it a bit more challenging by introducing a timed,
sequence-based play

This is the main function where Character jANKEN will play ROCK PAPER SCISSOR with the ALEX

]]



local composer = require( "composer" )
local widget = require( "widget" )
composer.removeHidden(  );
local scene = composer.newScene()
io.stdout:setvbuf'no'
---------------------------------------------------------CREATE SCENE--------------------------------------------------------------------------------------------------------
i= 0;
memorise = {};

function scene:create( event )
    local sceneGroup = self.view
    composer.removeHidden( );
---- Adding the back ground image
ScoreBoard_LEVEL = display.newText ({text= "LEVEL2",x = display.contentCenterX-350, y=50,fontSize=40});
ScoreBoard_LEVEL:setFillColor( 1, 0, 0 )

 local bg = display.newImage ("bg.png",display.contentCenterX, display.contentCenterY);
 bg.xScale = display.contentWidth / bg.width;
 bg.yScale = (display.contentHeight / bg.height);
 --ceneGroup:insert(bg)


 ------------------KID-----------------------------------
local opt =
{

    frames =
    {
        { x = 1, y = 2, width = 16, height = 25}, --frame 1
        { x = 18, y = 2, width = 16, height = 25}, --frame 2
        { x = 35, y = 2, width = 16, height = 25}, --frame 3
        { x = 52, y = 2, width = 16, height = 25}, --frame 4
        { x = 1, y = 54, width = 16, height = 24}, --ready1
        { x = 19, y = 54, width = 16, height = 24}, --ready2
        { x = 37, y = 54, width = 29, height = 24}, -- rock
        { x = 67, y = 54, width = 33, height = 24}, -- scissor
        { x = 101, y = 54, width = 33, height = 24}, -- paper
    }
}

local sheet = graphics.newImageSheet( "kidd.png", opt);

-- Creating the animation for the Alex, by sequencing the frames

local seqData = {
{name = "normal", start=2 , count = 4, time = 800},
{name = "faster", frames={1,2,3,4}, time = 300},
{name = "shake", frames={5,6}, time = 500},
{name = "rock", frames={7}},
{name = "paper", frames={9}},
{name = "scissor", frames={8}},
}

-- alex Display---

local alex = display.newSprite (sheet, seqData);
alex.x = 400;
alex.y = display.contentCenterY+200;
alex.anchorX = 1;
--alex.anchorY = 1;
alex.xScale = 4; alex.yScale = 4;

---------------------------------------------JANKEN--------------------------------------------------------------------------------

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
janken.x = display.contentCenterX+350;
janken.y = display.contentCenterY+250;
janken.anchorX = 1;
janken.anchorY = 1;
janken.xScale = 3
janken.yScale = 3

--------------------------------------------------------------------------------------------------------------------------------------------
local function shake_janken (event)
   janken:setSequence("shake");
   janken:play();
end

local function rock_janken(event)
   janken:setSequence("set");
   janken:play();
    frame = display.newImage (jankenSheet, 6 );
    frame.xScale = 3;
    frame.yScale = 3;
    frame.x = display.contentCenterX+230;
    frame.y = display.contentCenterY+180;
    start = 1;
end 
local function paper_janken(event)
   janken:setSequence("set");
   janken:play();
    frame = display.newImage (jankenSheet, 4 );
    frame.xScale = 3;
    frame.yScale = 3;
    frame.x = display.contentCenterX+230;
    frame.y = display.contentCenterY+180;
end
local function scissor_janken(event)
   janken:setSequence("set");
   janken:play();
    frame = display.newImage (jankenSheet, 5 );
    frame.xScale = 3;
    frame.yScale = 3;
    frame.x = display.contentCenterX+230;
    frame.y = display.contentCenterY+180;
    start = 1;
end
---------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
local function foo (wow)
alex:setSequence("faster");
alex:play();
janken:setSequence("flap");
janken:play();
end

local function bar (wow)
alex:pause();
alex:setSequence("normal");
alex:play();
janken:pause();
alex:pause();
end

function preview(event)
    
    random_preview = math.random(1,3);
    i = i+1;
    memorise[i] = random_preview
    print (memorise[i]);

    if random_preview == 3 then  
        if frame ~= nil then
         frame: removeSelf();
         frame = nil;
        end   
        
        test=  transition.to(janken, {time=1000, 
        onStart=shake_janken,
        onComplete=scissor_janken}) 
        
        event = display.newText( "Scissor", display.contentCenterX, display.contentCenterY, native.systemFont, 100 )
        event:setFillColor( 1, 0, 0 )
       -- local timerid = timer.performWithDelay(2000, function() event:removeSelf()end)
        

    elseif random_preview==1  then

        if frame ~= nil then
         frame: removeSelf();   
         frame = nil;
        end   
        transition.to(janken, {time=1000,
        onStart=shake_janken,
        onComplete=rock_janken})
        event = display.newText( "Rock", display.contentCenterX, display.contentCenterY, native.systemFont, 100 )
        event:setFillColor( 1, 0, 0 )


    else 

    if frame ~= nil then
    frame: removeSelf();
    frame = nil;
    end
    transition.to(janken, {time=1000, 
    onStart=shake_janken,
    onComplete=paper_janken})
    event= display.newText( "Paper", display.contentCenterX, display.contentCenterY, native.systemFont, 100 )
    event:setFillColor( 1, 0, 0 )
     
    end

    local timerid = timer.performWithDelay(1200, function() event:removeSelf()end)
    
    
end

function Level5(  )
    --Ready:removeSelf();

local options = {
    effect = "fade",
    time = 800,
    params = { level="Level2", memory=memorise }
}

composer.gotoScene( "Level3", options )
end

end

--scene:addEventListener( "show", scene )
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then

    timer1 =  timer.performWithDelay(1200, preview, 5)
    
    function Next(event)
    --transition.blink( Ready, { time=500 } )
    timer.performWithDelay(2000, Level5);
    end


    timer2 = timer.performWithDelay(7500, Next)
    end  
end


function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
        local result = timer.cancel(timer1);
        local result2 = timer.cancel(timer2);
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )




return scene;

