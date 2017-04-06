
local Boxes = require ("Boxes");
local yellow = Boxes:new( {tag="Yellow"} );
function yellow:spawn()
self.shape= display.newRect(self.xPos, self.yPos, self.width, self.height )
self.shape.pp = self; -- parent object
self.shape.tag = self.tag; -- “Boxes”
self.shape:setFillColor (1,1,0);
physics.addBody(self.shape, "kinematic");
end

------------------ When hit by the peddle the ball-------------

function yellow:hit ()
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
----------------------------------------------------------
function yellow:Change()
	
end

----------------------------------------------------------------
return yellow;