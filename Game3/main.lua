--------------------------------HOMEWORK  3---------------------------------------------------------------------
--------------------------------POORNIMA BYREGOWDA---------------------------------------------
------------------------------------------------------------------------------------------------
--[[
         
         ROCK PAPER SCISSOR

]]




local composer = require ("composer");
local widget = require( "widget" );



local bg =  display.newImage ("bg.png",display.contentCenterX, display.contentCenterY);
 bg.xScale = display.contentWidth / bg.width;
 bg.yScale = (display.contentHeight / bg.height);


 
local btnOpt =
{
frames = {
{ x = 3, y = 2, width=70, height = 22}, --frame 1
{ x = 78, y = 2, width=70, height = 22}, --frame 2
},
};
local buttonSheet = graphics.newImageSheet( "button.png", btnOpt );


text = display.newText( "STARTGAME", 300, 100 , 250, 50, native.systemFont, 40 )
text:setFillColor(1,0,0)
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
alex.y = display.contentCenterY+100;
alex.anchorX = 1;
alex.xScale = 7; alex.yScale = 10;
alex:setSequence("shake");
alex:play()


-- Function to handle button events
local function handleButtonEvent1( event )

    if ( event.phase == "ended" ) then
        print( "Button was pressed and released" )
        composer.gotoScene( "level4", {effect="slideLeft",
                time=500});
        
         
    end
end
-- Function to handle button events
local function handleButtonEvent2( event )

    if ( event.phase == "ended" ) then
        print( "Button was pressed and released" )
        composer.gotoScene( "level2", {effect="slideLeft",
                time=500});
        
         
    end
end

-- Create the widget

local btnlevel1 = widget.newButton(
{
x = 300,
y = 200,
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
x = 300,
y = 300,
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