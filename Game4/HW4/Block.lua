-- defenitions-- 


local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

local physics = require("physics");
physics.start();
physics.setGravity(0,0);

local life = 2
local points = 0;
local show = display.newText (
{text="Hit Points:0  Life = 2 ",
x=display.contentCenterX-250, y=50,
fontSize=30});

local Boxes = require ("Boxes");
local blue = require ("blue");
local yellow = require ("yellow");
local grey = require ("grey");

axis = {};
box = {};
local grey_count = 6;
local red_count = 8;
local blue_count = 8;
local yellow_count = 2;
local Num_rows = 4;
local Num_column = 6;


--- Back ground----
local top = display.newRect(0,100,display.contentWidth, 20);
local left = display.newRect(0,0,20, display.contentHeight);
local right = display.newRect(display.contentWidth-20,
0,20,display.contentHeight);
local bottom = display.newRect(0,display.contentHeight-20,
display.contentWidth, 20);
top.anchorX = 0;top.anchorY = 0;
left.anchorX = 0;left.anchorY = 0;
right.anchorX = 0;right.anchorY = 0;
bottom.anchorX = 0;bottom.anchorY = 0;
physics.addBody( bottom, "static" );
physics.addBody( left, "static" );
physics.addBody( right, "static" );
physics.addBody( top, "static");


-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
        -- load first scene
        composer.gotoScene("transfer",options);
        level2:removeSelf();
        level2_text: removeSelf();
        show:removeSelf();
        if (ball ~= nil) then 
          ball:removeSelf();
         end
    end
end
level2 = display.newRect(650,50,180, 80);
level2_text = display.newText (
{text="LEVEL 2",
x=650, y = 50 ,
fontSize=40});
level2_text:setFillColor(0,0,1);
level2:addEventListener("touch", handleButtonEvent);

--the following function shuffles the colors that are in a given table
-- Reference: It istaken from the Corona tutorial Website. 

local function shuffleTable( t )
    print ("shuffle")
    local rand = math.random 
    assert( t, "shuffleTable() expected a table, got nil" )
    local iterations = #t -- sets the local variable iterations equal to the number of items in t
    local j
    
    for i = iterations, 2, -1 do
        j = rand(i) --assign a random number that falls within the parameters of t to j
        t[i], t[j] = t[j], t[i] --swap i with j, and j with i
    end--end of for loop
end--end of shuffleTable function

------------------------------------------------------------------------------
x = (display.contentWidth-40)/12 + 20
y = 170
sizex = (display.contentWidth-40)/6;
sizey = 100;
for row = 1,Num_rows do 
for column = 1,Num_column do
    axis[6*(row-1)+column] = { XPos = x+ (column-1)*sizex, YPos = y +(row-1)*sizey  } ;
    print (axis[6*(row-1)+column].XPos, axis[6*(row-1)+column].YPos)
end 
end 
shuffleTable(axis)



---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view
   print (" create")
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
   Background= display.newRect(display.contentCenterX,display.contentCenterY,display.contentWidth, display.contentHeight);
   Background:setFillColor(0.2,0.2,0);
   sceneGroup:insert(Background);

   paddle = display.newRect (display.contentCenterX, display.contentHeight-100, 200, 20);
   paddle:setFillColor(1,1,1)
   physics.addBody( paddle, "kinematic");
   sceneGroup:insert(paddle);

   --- Ball----
    ball = display.newCircle (display.contentCenterX, display.contentCenterY-50, 20);
    physics.addBody (ball, "dynamic", {bounce=1.05, radius=20} );
    ball:applyForce(1,10,ball.x,ball.y);
    ball: setFillColor (0,1,0)
    sceneGroup:insert(ball);


for row = 1,Num_rows do 
for column = 1,Num_column do
--print (axis[6*(row-1)+column].XPos, axis[6*(row-1)+column].YPos); 
if ( axis[6*(row-1)+column].YPos == 170 or axis[6*(row-1)+column].YPos == 370 ) then 
        if (grey_count > 0) then 
        box[6*(row-1)+column] = grey:new({xPos = axis[6*(row-1)+column].XPos, yPos = axis[6*(row-1)+column].YPos});
        box[6*(row-1)+column]:spawn();
        grey_count = grey_count - 1;
    elseif (red_count > 0) then 
        box[6*(row-1)+column] = Boxes :new({xPos = axis[6*(row-1)+column].XPos, yPos = axis[6*(row-1)+column].YPos});
        box[6*(row-1)+column]:spawn();
        red_count = red_count- 1
    elseif (blue_count > 0) then 
        box[6*(row-1)+column] = blue :new({xPos = axis[6*(row-1)+column].XPos, yPos = axis[6*(row-1)+column].YPos});
        box[6*(row-1)+column]:spawn();
        blue_count = blue_count -1 ; 
     elseif (yellow_count > 0) then 
        box[6*(row-1)+column] = yellow:new({xPos = axis[6*(row-1)+column].XPos, yPos = axis[6*(row-1)+column].YPos});
        box[6*(row-1)+column]:spawn();
        yellow_count = yellow_count - 1; 
     end 
else 
    if (blue_count > 0) then 
        box[6*(row-1)+column] = blue:new({xPos = axis[6*(row-1)+column].XPos, yPos = axis[6*(row-1)+column].YPos});
        box[6*(row-1)+column]:spawn();
        blue_count = blue_count -1 ;
    elseif (yellow_count > 0) then 
        box[6*(row-1)+column] = yellow:new({xPos = axis[6*(row-1)+column].XPos, yPos = axis[6*(row-1)+column].YPos});
        box[6*(row-1)+column]:spawn();
        yellow_count = yellow_count - 1; 
    elseif (red_count > 0) then 
        box[6*(row-1)+column] = Boxes:new({xPos = axis[6*(row-1)+column].XPos, yPos = axis[6*(row-1)+column].YPos});
        box[6*(row-1)+column]:spawn();
        red_count = red_count- 1
    end 
end 
       sceneGroup:insert(box[6*(row-1)+column].shape); 

end 
end 

end


-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.

        local function move ( event )
        if event.phase == "began" then

        paddle.markX = paddle.x
        elseif event.phase == "moved" then
        local x = (event.x-event.xStart) + paddle.markX;
        if (x <= 20 + paddle.width/2) then
        paddle.x = 20 + paddle.width/2;
        elseif (x >= display.contentWidth-20-paddle.width/2) then
        paddle.x = display.contentWidth-20-paddle.width/2;
        else
        paddle.x = x;
        end
        end
        end
        Runtime:addEventListener("touch", move);

        local function removeProjectile (event)
    if (life==0) then return end;
    if (event.phase=="ended") then
        if (event.other.tag == "Blue") then
            event.other.pp:hit();
            points = points + 2; 
        end

        if (event.other.tag == "Red") then
            event.other.pp:hit();
            points = points + 2;
        end
        if (event.other.tag == "Yellow") then
            event.other.pp:hit();
           for i = 1,24 do
           box[i]:Change(); 
           end 
        end
        if (event.other == bottom ) then
            if (ball  ~= nil) then
            event.target:setFillColor(0,1,1)
            life = life - 1; 
            if (life==0) then event.target: removeSelf(); ball = nil end
        end
        end
        show.text =
        "Hit Points:"..points.."  Life :"..life ;
    end
    end

    ball:addEventListener("collision", removeProjectile);

   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
     
    -- level2:removeEventListener("touch", handleButtonEvent);
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.

   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.

   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene