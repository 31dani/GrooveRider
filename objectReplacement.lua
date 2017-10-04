--Replace objects with custom slot car tracks model and load on resourceStart
function replaceModel() 
    txd = engineLoadTXD("1.txd", 9000 )
    engineImportTXD(txd, 9000)
    dff = engineLoadDFF("1.dff", 9000 )
    engineReplaceModel(dff, 9000)
    col = engineLoadCOL( "1.col" )
    engineReplaceCOL( col, 9000 )
    engineSetModelLODDistance(9000, 2020)
	
    txd = engineLoadTXD("1.txd", 9001 )
     engineImportTXD(txd, 9001)
    dff = engineLoadDFF("2.dff", 9001 )
    engineReplaceModel(dff, 9001)
    col = engineLoadCOL( "2.col" )
	engineReplaceCOL( col, 9001 )
	engineSetModelLODDistance(9001, 2020)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(), replaceModel)