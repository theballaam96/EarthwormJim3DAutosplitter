state("EarthwormJim3D") {}

startup {
    byte loadingByte : 0x547198;
	byte destinationMap : 0x54719C;
	byte mapValue : 0x544028;
	byte menuState : 0x53DBF0;
}

init {
    var loadByte = current.loadingByte;
	var currentMap = current.mapValue;
	var stateOfTheMenu = current.menuState;
	var destinationMap = current.destinationMap;
}

update {
    var loadByte = current.loadingByte;
	var currentMap = current.mapValue;
	var stateOfTheMenu = current.menuState;
	var destinationMap = current.destinationMap;
}

start {
    return currentMap == 21 && stateOfTheMenu == 13;
}

split {
	var cMapIsGoodMap = 0;
	if (currentMap > 1) {
		if (currentMap < 20) {
			if (currentMap != 5 && currentMap != 9 && currentMap != 10 && currentMap != 16) {
				var cMapIsGoodMap = 1;
			} 
		}
	}
    return (cMapIsGoodMap == 1 && currentMap != destinationMap);
}

reset {
    return (currentMap == 21);
}

isLoading {
    return (loadByte == 1);
}