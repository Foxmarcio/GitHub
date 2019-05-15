local composer = require( "composer" )
composer.removeScene( "menu" )
local scene = composer.newScene()


_W = display.viewableContentWidth
_H = display.viewableContentHeight
local cX = display.contentCenterX
local cY = display.contentCenterY



backgroundLoading = display.newImageRect("background/background_loading.png", 460, 240, _W, _H)
backgroundLoading.x = cX
backgroundLoading.y = cY  
backgroundLoading.anchorcX = 0
backgroundLoading.anchorcY = 0 

local phantom2 =  display.newImage("Sprites/ghost_Loading.png")
phantom2.x = _W
phantom2.y = _H
phantom2.anchorcX = 0 
phantom2.anchorcY = 0    
phantom2 : scale( 0.1, 0.1 )
phantom2.x= 210
phantom2.y= 240


function textoLoading()
    
            L = display.newImage( "background/Carregando.png" )
            L : scale( 0.2, 0.2 )           
            L.anchorX = 0
            L.x = 20
            L.y = 250
        transition.blink( L, {x= 70, y= 280, 35000 } )
end 

function roda()
    
    phantom2.rotation = phantom2.rotation + 8
    transition.to( phantom2, {x = 550, y = 250, time = 5000, onComplete = removePhantom } )
    
end

tmrGhost = timer.performWithDelay( 10, roda, -1  )
tmrLoading = timer.performWithDelay( 500, function(e)
    
        textoLoading()

        if(e.count == 11) then
            timer.cancel( tmrLoading )
            
            goToGame()
        end

end,11);

function goToGame()
    local transfer = require("transfer")
    transfer:goToGame()
end

return scene