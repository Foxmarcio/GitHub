local composer = require( "composer" )

local T = {}


function T:goToLoading()
	local composer = require("composer")
    composer.gotoScene( "loading", {effect = "fade", time = 500 } )
end

function T:goToGame()
	audio.stop(menuMusicOn)	
	local composer = require("composer")
    composer.gotoScene( "game", {effect = "fade", time = 500 } )
end

function T:goToScore()
	composer.removeScene("game")	
	local composer = require("composer")
	composer.gotoScene( "score", {effect = "fade", time = 500})
end

return T
