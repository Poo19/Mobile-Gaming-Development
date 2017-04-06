
local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()
composer.removeHidden();
--timer = nil
preview = 0;
random  = 0;
Round = 0;
ALEX = 0;
NARUTO = 0;
timeout = 0;
i=0;
--Score = display.newText( "Start Game!", display.contentCenterX, display.contentCenterY, native.systemFont, 100 )
--Score:setFillColor( 0, 0, 0 )


---------------------------------------------------------CREATE SCENE--------------------------------------------------------------------------------------------------------


function scene:create( event )
    local sceneGroup = self.view
---- Adding the back ground image
 local bg = display.newImage ("bg.png",display.contentCenterX, display.contentCenterY);
 bg.xScale = display.contentWidth / bg.width;
 bg.yScale = (display.contentHeight / bg.height);
 --ceneGroup:insert(bg)

ScoreBoard_LEVEL = display.newText ({text= "LEVEL1",x = display.contentCenterX-350, y=50,fontSize=40});
ScoreBoard_LEVEL:setFillColor( 1, 0, 0 )
ScoreBoard_ROUND = display.newText ({text= "ROUND:0",x = display.contentCenterX-350, y=100,fontSize=40});
ScoreBoard_ROUND:setFillColor( 1, 0, 0 )
ScoreBoard_ALEX = display.newText ({text= "ALEX:0",x = display.contentCenterX+130, y=100,fontSize=40});
ScoreBoard_ALEX:setFillColor( 1, 0, 0 )
ScoreBoard_NARUTO = display.newText ({text= "NARUTO:0",x = display.contentCenterX+150, y=150,fontSize=40});
ScoreBoard_NARUTO:setFillColor( 1, 0, 0 )
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

alex = display.newSprite (sheet, seqData);
alex.x = 400;
alex.y = display.contentCenterY+200;
alex.anchorX = 1;
--alex.anchorY = 1;
alex.xScale = 4; alex.yScale = 4;

---------------------------------------------JANKEN--------------------------------------------------------------------------------

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
janken.x = display.contentCenterX+350;
janken.y = display.contentCenterY+250;
janken.anchorX = 1;
janken.anchorY = 1;
janken.xScale = 3
janken.yScale = 3


local btnOpt =
{
frames = {
{ x = 3, y = 2, width=70, height = 22}, --frame 1
{ x = 78, y = 2, width=70, height = 22}, --frame 2
},
};
buttonSheet = graphics.newImageSheet( "button.png", btnOpt );

--------------------------------------------------------------------------------------------------------------------------------------------
local function shake_janken (event)
   janken:setSequence("shake");
   janken:play();
end

local function rock_janken(event)
   janken:setSequence("set");
   janken:play();
    frame = display.newImage (jankenSheet, 4 );
    frame.xScale = 3;
    frame.yScale = 3;
    frame.x = display.contentCenterX+280;
    frame.y = display.contentCenterY+200;
    start = 1;
end 
local function paper_janken(event)
   janken:setSequence("set");
   janken:play();
    frame = display.newImage (jankenSheet, 6 );
    frame.xScale = 3;
    frame.yScale = 3;
    frame.x = display.contentCenterX+280;
    frame.y = display.contentCenterY+200;
end
local function scissor_janken(event)
   janken:setSequence("set");
   janken:play();
    frame = display.newImage (jankenSheet, 5 );
    frame.xScale = 3;
    frame.yScale = 3;
    frame.x = display.contentCenterX+280;
    frame.y = display.contentCenterY+200;
    start = 1;
end
---------------------------------------------------------------------------
---------------------------------------------------------------------------

local function shake (wow)
            timeout = 1;
        btnPaper:setEnabled( true )
        btnRock:setEnabled( true )
        btnScissor:setEnabled(true)
    

        if frame ~= nil then 
            frame:removeSelf();
            frame = nil;
        end
            alex:setSequence ("shake");
            alex:play();
            janken:setSequence("shake");
            janken:play();
        --print (event.target.id);
end

local function rock1 (wow)

    --local result = timer.pause( timer );
    timeout = 0;
    btnPaper:setEnabled( false )
        btnRock:setEnabled( false )
        btnScissor:setEnabled(false)
        
    print("rock")
        alex:setSequence ("rock");
        alex:play();
        if event.params.memory[i] == 1 then 
            rock_janken();
        elseif event.params.memory[i] == 2 then 
            paper_janken();
            Round = Round + 1;
            NARUTO = NARUTO + 1;
            ScoreBoard_ROUND.text = "ROUND:"..Round;
            ScoreBoard_NARUTO.text = "NARUTO:"..NARUTO;
        else scissor_janken();
             Round = Round + 1;
             ALEX = ALEX + 1;
             ScoreBoard_ALEX.text = "ALEX:"..ALEX;
             ScoreBoard_ROUND.text = "ROUND:"..Round;
        end
end

local function paper1 (wow)
       -- local result = timer.pause( timer )
             timeout =0
             btnPaper:setEnabled( false )
        btnRock:setEnabled( false )
        btnScissor:setEnabled(false)
        
            alex:setSequence ("paper");
            alex:play();
        if event.params.memory[i] == 1 then 
            rock_janken();
            Round = Round + 1;
             ALEX = ALEX + 1;
             ScoreBoard_ROUND.text = "ROUND:"..Round;
             ScoreBoard_ALEX.text = "ALEX:"..ALEX;
        elseif event.params.memory[i] == 2 then 
            paper_janken();
        else scissor_janken();
            Round = Round + 1;
            NARUTO = NARUTO + 1;
            ScoreBoard_ROUND.text = "ROUND:"..Round;
            ScoreBoard_NARUTO.text = "NARUTO:"..NARUTO;
            end
    end

local function scissor1(wow)
    --local result = timer.pause( timer )
            timeout =0;
            btnPaper:setEnabled( false )
        btnRock:setEnabled( false )
        btnScissor:setEnabled(false)
        
            alex:setSequence ("scissor");
            alex:play();

        if event.params.memory[i] == 1 then 
            rock_janken();
            Round = Round + 1;

            NARUTO = NARUTO + 1;
            ScoreBoard_ROUND.text = "ROUND:"..Round;
            ScoreBoard_NARUTO.text = "NARUTO:"..NARUTO;

        elseif event.params.memory[i] == 2 then 
            paper_janken();
            Round = Round + 1;
             ALEX = ALEX + 1;
             ScoreBoard_ROUND.text = "ROUND:"..Round;
             ScoreBoard_ALEX.text = "ALEX:"..ALEX;
            
        else scissor_janken();
        end
end
--------------------------------------------------------------------------------------------------------------------------------------------------
local function rock (event)
        if frame ~= nil then 
            frame:removeSelf();
            frame = nil;
        end
            frame = nil

        if (event.phase == "ended") then
            rock1();            
     end
end

local function paper (event)

        if frame ~= nil then 
            frame:removeSelf();
            frame = nil;
        end
            frame = nil;

        if (event.phase == "ended") then
            paper1();
     end
end

local function scissor (event)
        if frame ~= nil then 
            frame:removeSelf();
            frame = nil;
        end
            frame = nil;
        if (event.phase == "ended") then
            scissor1();
     end
end
---------------------------------------------------------------------------------------------------------------------------------------------------
local function display (value)
btnRock = widget.newButton(
{
x = 300,
y = 200,
id = "btnRock",
label = "Rock",
labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
sheet = buttonSheet,
defaultFrame = 1,
overFrame = 2,
onEvent = rock,
}
);
btnRock.xScale = 2.5;
btnRock.yScale = 2.5;

btnPaper = widget.newButton(
{
x = 300,
y = 320,
id = "btnPaper",
label = "Paper",
labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
sheet = buttonSheet,
defaultFrame = 1,
overFrame = 2,
onEvent = paper,
}
);
btnPaper.xScale = 2.5;
btnPaper.yScale = 2.5;

btnScissor = widget.newButton(
{
x = 300,
y = 450,
id = "btnScissor",
label = "scissor",
labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
sheet = buttonSheet,
defaultFrame = 1,
overFrame = 2,
onEvent = scissor,
}
);

btnScissor.xScale = 2.5;
btnScissor.yScale = 2.5;
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------
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
display();
end

-- Function to handle button event
local function start_game( )

transition.to(alex, {time=2000, x=740,
onStart=foo,
onComplete=bar})
end

local function timeout1( )
 --local result = timer.pause( timer 
if  timeout == 1 then
if frame ~= nil then 
            frame:removeSelf();
            frame = nil;
end
     if event.params.memory[i] == 1 then 
            rock_janken();
            alex:setSequence ("scissor");
            alex:play();
    elseif event.params.memory[i] == 2 then 
            paper_janken(); 
            alex:setSequence ("rock");
            alex:play();       
    else scissor_janken();
        alex:setSequence ("paper");
        alex:play();  
    end
        Round = Round + 1;
        NARUTO = NARUTO + 1;
        ScoreBoard_ROUND.text = "ROUND:"..Round;
        ScoreBoard_NARUTO.text = "NARUTO:"..NARUTO;
 end
end

start_game();

function SetTimer(wow) 
i = i+1;
if event.params.memory[i] ~= nil then
transition.to(alex, {time=1500,
onStart=shake,
onComplete=timeout1})
else 
    pause();
end
end

-------------------------------------------------------------------------------------------------------------------------------------
------------------------------END--------------------------------------------


------------end of show--------------
end

scene:addEventListener( "create", scene )

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    	-- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
    --print(event.params.memory[1])
    --print(event.params.memory[2])
    --print(event.params.memory[3])

    function next_level(event)
    composer.removeScene( "level5", true )
    composer.gotoScene( "level2", {effect="slideLeft",
                time=500});
    end   
     
    timer1 =  timer.performWithDelay(2000, SetTimer,0);

function pause()
    if frame ~= nil then 
            frame:removeSelf();
            frame = nil;
end

    --local result = time.cancel(timer1);
    if ALEX >= 2 then 
     composer.gotoScene( "play2", {effect="slideLeft",
                time=1500});  
    else

    composer.gotoScene( "play", {effect="slideLeft",
                time=1500});

end
end
end  
end


scene:addEventListener( "show", scene )
-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then

        local result = timer.cancel(timer1);
    elseif ( phase == "did" ) then
    
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    local result = timer.cancel(timer1)
    janken:removeSelf();
    btnRock:removeSelf();
    btnScissor:removeSelf();
    btnPaper:removeSelf();
    alex:removeSelf();
    ScoreBoard_NARUTO:removeSelf();
    ScoreBoard_ROUND:removeSelf();
    ScoreBoard_ALEX:removeSelf();
    
end

    

scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene;

