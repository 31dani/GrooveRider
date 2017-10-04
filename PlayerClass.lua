PlayerClass = {}

function PlayerClass:load()
    self:fadeCamera(false, 0)
    self:spawn(0, 0, 10)
    Timer(warpPedIntoVehicle, 50, 1, self, spawnPoints[1])
    self.cameraTarget = p
    Timer(fadeCamera, 1000, 1, self, true)
end

registerElementClass("player", PlayerClass)
