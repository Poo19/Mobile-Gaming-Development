
local Boxes = {tag="Red", HP=1, xPos=0, yPos=100, width = (display.contentWidth-40)/8, height = (display.contentWidth-40)/8 };

function Boxes:new (o) --constructor
o = o or {}; -- create new table if the object  "o" is empty
setmetatable(o, self); -- making the object itself as the metatable.
self.__index = self;
return o;
end

function Boxes:spawn()
self.shape= display.newRect(self.xPos, self.yPos, self.width, self.height )
self.shape.pp = self; -- parent object
self.shape.tag = self.tag; -- “Boxes”
self.shape:setFillColor (1,0,0);
physics.addBody(self.shape, "kinematic");
end

------------------ When hit by the peddle the ball-------------

function Boxes:hit ()
self.HP = self.HP - 1;
if (self.HP > 0) then
--audio.play( soundTable["hitSound"] );
self.shape:setFillColor(1,0,0);
else
--audio.play( soundTable["explodeSound"] );
-- die--
self.shape:removeSelf();
self.shape=nil;
self = nil;
end

end
----------------------------------------------------------------
function Boxes:Change()
	print("entered change ")
if (self.shape  ~= nil) then
	if self.shape.tag == "Red" then
	self.HP = 2;
	self.shape:setFillColor(0,0,1) ;
	self.shape.tag = "Blue"
    else
    self.HP = 1;
	self.shape:setFillColor(1,0,0) ;
	self.shape.tag = "Red"
    end
end
end

function Boxes:size()
	print("entered Scale")
if (self.shape  ~= nil) then
	self.shape.xScale = 0.5;
	self.shape.xScale = 0.5;

end
end


----------------------------------------------------------------
return Boxes;
