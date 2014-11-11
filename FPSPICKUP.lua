Script.entered = false
Script.exited = false
Script.hadCollision = false

Script.vModel = ""  --path

function Script:UpdatePhysics()
    if self.entered then
        if self.hadCollision == false then
            if self.exited == false then
                self.exited = true
                self.component:CallOutputs("TriggerExit")
                self.entered = false
            end
        end
    end

    self.hadCollision = false

end

function Script:Collision(entity, position, normal, speed)
    self.hadCollision = true

    if self.entered == false then
	self.component:CallOutputs("TriggerEnter")
		if entity:GetKeyValue("type") == "player" then
		entity.script.weaponfile = self.vmodel
		entity.script:LoadWeapon()
		self.entity:Hide()
	end

   
        self.entered = true
        self.exited = false
    end
end
