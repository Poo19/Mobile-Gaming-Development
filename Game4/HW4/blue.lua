local Boxes = require ("Boxes");
local blue = Boxes:new( {tag="Blue", HP=2} );
function blue:spawn()
self.shape= display.newRect(self.xPos, self.yPos, self.width, self.height )
self.shape.pp = self; -- parent object
self.shape.tag = self.tag; -- “Boxes”
self.shape:setFillColor (0,0,1);
physics.addBody(self.shape, "kinematic");
end

------------------ When hit by the peddle the ball-------------

function blue:hit ()
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
---------------------------------------------------------------
function blue:Change()
	print ("Entered")
	if (self.shape ~= nil) then
	if self.shape.tag == "Blue" then
	self.HP = 1;
	self.shape:setFillColor(1,0,0) ;
	self.shape.tag = "Red"
    else
    self.HP = 2;
	self.shape:setFillColor(0,0,1) ;
	self.shape.tag = "Blue"
    end
end
end

----------------------------------------------------------------
return blue;