local composer = require("composer")
composer.removeHidden( true )
composer.removeScene("game")
display.remove( M.monster1 )
display.remove( M.human1 )
local scene = composer.newScene()
scoreMusic = audio.loadStream( "SFX/Spirit_Of_The_Death.wav" )
scoreMusicOn = audio.play(scoreMusic, {channel=2, loops= -1 })
audio.stop( gameMusicOn )




_W = display.viewableContentWidth
_H = display.viewableContentHeight
local cX = display.contentCenterX
local cY = display.contentCenterY



backgroundScore = display.newImageRect("background/backgroundScore.png", 480, 270, _W, _H)
backgroundScore.x = cX
backgroundScore.y = cY 
backgroundScore.anchorcX = 0
backgroundScore.anchorcY = 0 



function scoreText( )

	local scoreText 
		scoreText = display.newText("O Tempo Acabou! \n Total De Pontos : " ..scoreTotal, 0, 0, "Ghoulish", 36);
		scoreText : setTextColor( 255, 255, 255 );
		scoreText.anchorX = 0;
		scoreText.x =  90;
		scoreText.y = 120;
end
   
function goToGame()
    local transfer = require("transfer")
    transfer:goToGame()
end


function finalBoton()
    
 	restart = display.newImage("background/reload.png", 32, 32)  
    restart.x = 40
    restart.y = 250 
   	restart.xScale = 0.5     
	restart.yScale = 0.5

    exit = display.newImage("background/exit.png", 32, 32)    
    exit.x = 435
    exit.y = 250 
    exit.xScale = 0.5
	exit.yScale = 0.5  

	function restart:tap( )
	 	
					restart.xScale = 0.4
					restart.yScale = 0.4
					audio.stop( scoreMusicOn )					
					audio.rewind(gameMusic)					
					goToGame()
		
	end

	function exit:tap( )
	 	
					exit.xScale = 0.4
					exit.yScale = 0.4				
					native.requestExit ()
				
	end

restart:addEventListener("tap", restart)
exit:addEventListener("tap", exit)


end

scoreText()
finalBoton()



return scene










