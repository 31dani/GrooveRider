--===////Metatable functions\\\\===--

--Function to execute a function on all elements of given array
function executeTable(tbl, fun, ...)
    for i, v in ipairs(tbl) do
        v[fun](v, ...)
    end
end

--===////Globals\\\\===--

--Spawn points based of the initial track element
spawnPoints = {}
--Array of players represented as PlayerClass
players = {}
--Set up metatable for "players" array
setmetatable(players, {
    __call = executeTable
})

--===////Locals\\\\===--

--Ordered track elements
local track
--Matrix with the position and rotation of the initial track element (aka spawn point / start line / finish line)
local raceStartMatrix
--Relative positions for spawns based on "raceStartMatrix"
local relativeSpawnPoints = {
    Vector3(1.5, 0, 1.3),
    Vector3(-1.5, -5, 1.3),
    Vector3(4.5, 0, 1.3),
    Vector3(-4.5, -5, 1.3),
    Vector3(1.5, -10, 1.3),
    Vector3(-1.5, -15, 1.3),
    Vector3(4.5, -10, 1.3),
    Vector3(-4.5, -15, 1.3)
}


--===////Functions\\\\===--

--Initializer when gamemode starts
function loadGameMode()
    createTrack()
    --Insert current server players in "players"
    for i, p in ipairs(getElementsByType("player")) do
        table.insert(players, p)
    end
    players("load")
end
addEventHandler ("onResourceStart", getResourceRootElement(), loadGameMode)

function createTrack()
    track = {
        Object(9000, 3150, -1810, 25)
    }

    raceStartMatrix = track[1].matrix

    spawnPoints = {
        Vehicle(411, raceStartMatrix:transformPosition(Vector3(1.5, 0, 1.3)), raceStartMatrix.rotation),
        Vehicle(411, raceStartMatrix:transformPosition(Vector3(-1.5, 0, 1.3)), raceStartMatrix.rotation),
        Vehicle(411, raceStartMatrix:transformPosition(Vector3(4.5, 0, 1.3)), raceStartMatrix.rotation),
        Vehicle(411, raceStartMatrix:transformPosition(Vector3(-4.5, 0, 1.3)), raceStartMatrix.rotation),
    }
    
end

function loadPlayers()
    for i, p in ipairs(players) do
        p:spawn(0, 0, 10)
        Timer(warpPedIntoVehicle, 50, 1, p, spawnPoints[1])
        p.cameraTarget = p
        Timer(fadeCamera, 1000, 1, p, true)
    end
end
