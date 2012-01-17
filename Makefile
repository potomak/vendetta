MXMLC = mxmlc
FLIXEL = /Users/giovanni/lib/flixel
SRC = src/PlayState.as src/Preloader.as src/Player.as
ASSETS = assets/level.csv assets/player.png
MAIN = src/Vendetta.as
SWF = Vendetta.swf

$(SWF): $(MAIN) $(SRC) $(ASSETS)
	$(MXMLC) -sp $(FLIXEL) -o $(SWF) -- $(MAIN)

run: $(SWF)
	open $(SWF)