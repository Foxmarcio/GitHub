-----------------------------------------------------------------------------------------
--00
-- main.lua
--
-----------------------------------------------------------------------------------------


local composer = require("composer")
composer.gotoScene("menu", {efect ="fade", time = 500})

audio.setMaxVolume( 0.75, {channel = 1} )
audio.setMaxVolume( 1.0, {channel = 2} )
gameMusic = audio.loadStream( "SFX/Halloween_FiluAndDina.wav" )
gameTap = audio.loadSound( "SFX/Blood_Hit_02.wav" )

