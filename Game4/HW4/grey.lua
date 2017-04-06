
local Boxes = require ("Boxes");
local grey = Boxes:new( {tag="Grey"} );
function grey:spawn()
self.shape= display.newRect(self.xPos, self.yPos, self.width, self.height )
self.shape.pp = self; -- parent object
self.shape.tag = self.tag; -- “Boxes”
self.shape:setFillColor (0.5,0.5,0.5);
physics.addBody(self.shape, "kinematic");
end

------------------ When hit by the peddle the ball-------------

function grey:hit ()

end
-----------------------------------------------------------------
function grey:Change()
	
end

----------------------------------------------------------------
return grey;