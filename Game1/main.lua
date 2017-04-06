--[[Rui Wang
    Poornima Gowda
    Adithi Madhwesh
    1-21-2016
    CS571-01
    HW1
    This program consists of a game where the user must match
    all 50 pairs of colors in order to win.
    to select a colored box, simply click on it. To deselect a
    colored box, click on it twice.
    Once a match has been made, the boxes will disappear, the
    object of the game is to clear the screen.]]

math.randomseed( os.time() ) -- seed time for the rand function
local sizex = display.contentWidth/10; --to break the screen width into 10 sections
local sizey = display.contentHeight/10; -- to break the screen height into 10 sections
--print(sizex);
--print (sizey);
local Num_rows = 10; --for the number of rows on the screen
local Num_column = 10; -- for the number of columns on the screen
info = 0;--variable will keep track of the number of boxes selected
flag = 1;-- this flag indicates that one box has already been selected
index = {nil,nil}; --table of the two selected boxes
inform = {}; -- the table that connects the table of colors with the table of event listeners and display boxes
boxes = {}; -- table of display boxes and event listeners

function main()-- the main function, only calls the function shows the start menu
 --color_boxes();
 start();
end--end of main function

local function Start_game(event) -- this function creates the game board and holds and action listener for the start screen
event.target.strokeWidth = 10;
event.target:setStrokeColor(1,0,1);
 event.target:removeSelf();
 color_boxes();
end--end of start function

function start() -- this function displays the start screen
local barH = 100;
local bar = display.newRect(display.contentCenterX, display.contentCenterX, 2*barH, barH);
local timeText = display.newText ("CLICk HERE", 350, bar.y,
  native.systemFont, 30);
  timeText:setFillColor (0,0,0);
 bar:addEventListener("tap",Start_game);
end--end of start function


--the following table holds the audio files for the game
local soundTable = {
    chimeSound = audio.loadSound( "Airsoft-01.wav" ),
    bellSound = audio.loadSound( "Crash-Cymbal-1.wav" )
}

--the following function shuffles the colors that are in a given table
local function shuffleTable( t )
    local rand = math.random 
    assert( t, "shuffleTable() expected a table, got nil" )
    local iterations = #t -- sets the local variable iterations equal to the number of items in t
    local j
    
    for i = iterations, 2, -1 do
        j = rand(i) --assign a random number that falls within the parameters of t to j
        t[i], t[j] = t[j], t[i] --swap i with j, and j with i
    end--end of for loop
end--end of shuffleTable function

function Fillcolor()--this function is in charge of limiting the scope of colors to 50
 colors ={}; --empty table for the total number of colors
 local fifty_colors = {}; --empty table for the fifty colors
 for i = 1,50 do--this for loop populates fifty_colors with 50 random colors
 fifty_colors[i] = { red = math.random(), blue = math.random(), green = math.random()}
 end--end of for loop
 for i = 1,50 do--this for loop populates the colors table with 1 pair of each color
 colors[i] = fifty_colors[i];
 colors[50+i] = fifty_colors[i];
 end--end of for
 shuffleTable(colors);
 end--end of Fillcolor
 
local function compare(index)--this function compares 2 selected boxes
print(index[1]);
print(index[2]);
local index1 = index[1];--set the first item of the index equal to a local variable
local index2 = index[2];--set the second item of the index equal to a local variable
--if the 2 items that are selected are equal, i.e. the same item then deselect the box
 if((boxes[index1].x == boxes[index2].x ) and (boxes[index1].y == boxes[index2].y )) then
     boxes[index1].strokeWidth = 0;
     boxes[index1]:setStrokeColor (0,0,0); 
	 index ={0,0};--clear the index
--  --if the 2 selected boxes have the same color, then deselect the boxes and remove the boxes from the screen 
 elseif((inform[index1].Red == inform[index2].Red) and (inform[index1].Green == inform[index2].Green)and (inform[index1].Blue == inform[index2].Blue)) then
	audio.play( soundTable["bellSound"] );
	boxes[index1].strokeWidth = 0;
	boxes[index1]:setStrokeColor (0,0,0);
	boxes[index2].strokeWidth = 0;
	boxes[index2]:setStrokeColor (0,0,0);
	boxes[index1]:removeSelf();
	boxes[index2]:removeSelf();
	index[1] = nil;--clear the first item from the index
	index[2] = nil;--clear the second item from the index
--otherwise deselect the box at index 1 and move the box at index 2 to index 1
 else 
    if (index[1]~= nil) then
    boxes[index1].strokeWidth = 0;
    boxes[index1]:setStrokeColor (0,0,0);
  --boxes[index2].strokeWidth = 0;
  --boxes[index2]:setStrokeColor (0,0,0);
    index[1] = index[2];
	index[2] = nil;--clear out index 2
	end--end of else
 end--end of function
 
 flag = 1;--indicates that there is only one item in the index table
 end


--the folowing function contains hte logic for the event listener
--it tells the program what to do when a single box gets tapped
local function tapped(event)

audio.play( soundTable["chimeSound"] );
--the following calculation are used to calculate the (x,y) position of the index
local row1 = ((event.x/72)+0.5)
local column1 = ((event.y/128)+0.5)
row2 = row1- math.floor (row1);
cloumn2 = column1- math.floor(column1);
if(row2 > 0.5) then
 row1 = math.floor(row1)+1;
else 
 row1 = math.floor(row1);
end--end of else
if(cloumn2 > 0.5) then
  column1 = math.floor(column1)+1;
else 
  column1 = math.floor(column1);
end --end of else
local index_calc = 10*(column1-1)+row1;
 if (index[1]== nil) then
     index[1]= index_calc;  
else
     index[2] = index_calc;
end -- end of else
--print(index);
--event.target:scale (1.1,1.1);
event.target.strokeWidth = 10;--add an outline around the selected box
event.target:setStrokeColor(1,1,1); --set the color of the outline to white
if (index[2] ~= nil) then--check to see if there are 2 items in the index table
    flag = 0;
    compare(index);
end--end of if
end--end of tapped function


--the following function populates the boxes table, and 
--assigns each item a color and in event listener
function color_boxes()
    Fillcolor();
for row = 1,Num_rows do 
for column = 1,Num_column do
    
    boxes[10*(row-1)+column] = display.newRect(sizex/2+ (column-1)*sizex, sizey/2 + (row-1)*sizey,sizex,sizey);
	boxes[10*(row-1)+column]:setFillColor(colors[10*(row-1)+column].red,colors[10*(row-1)+column].blue,colors[10*(row-1)+column].green);
    inform[10*(row-1)+column] = { Box = boxes[10*(row-1)+column],Red = colors[10*(row-1)+column].red,Blue = colors[10*(row-1)+column].blue,Green = colors[10*(row-1)+column].green }
    if(flag ==1) then
	boxes[10*(row-1)+column]:addEventListener("tap", tapped);	
    end--end of if
end--end of inner for
end--end of outer for
end--end of color_boxes function
main();