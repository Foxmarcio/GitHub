local composer = require( "composer" )
local scene = composer.newScene()


audio.setVolume( 0.75, {channel = 1} )
menuMusic = audio.loadStream( "SFX/Magical_Dirt.wav" )
menuMusicOn = audio.play(menuMusic, {channel=1, loops= -1})

system.activate( "multitouch" );
math.randomseed( os.time())
display.setStatusBar( display.HiddenStatusBar )

_W = display.viewableContentWidth
_H = display.viewableContentHeight
local cX = display.contentCenterX
local cY = display.contentCenterY
    
local backgroundInicio
local phantom 
local title
local title2


function goToLoading()
    
    local transfer = require("transfer")
    transfer:goToLoading()
end
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    
    --sceneGroup:insert(sfxOn)
    
    backgroundInicio = display.newImageRect("background/telaInicio.png", 900, 370, _W, _H)
    backgroundInicio.x = cX
    backgroundInicio.y = cY  
    sceneGroup:insert(backgroundInicio)


    title = display.newImage("background/Titulo_1.png")
    title : scale(0.2, 0.2)
    title.x = 0
    title.y = 200
    transition.moveTo( title, { x=260, y=200, time=3000 } )
    sceneGroup:insert(title)


    
    title2 = display.newImage( "background/aviso.png" )
    title2: scale( 0.1, 0.1 )           
    title2.anchorX = 0
    title2.x = 10
    title2.y = 35
    transition.blink( title2, {x= 10, y= 35, 35000 } )
    sceneGroup:insert(title2)


    phantom =  display.newImage("Sprites/ghost.png")
    phantom.alpha = 0.8
    phantom : scale( 0.2, 0.2 )
    phantom.x= 380
    phantom.y= 300
    transition.moveTo( phantom, { x=420, y=140, time=3000 } )
    sceneGroup:insert(phantom)

    

    phantom:addEventListener("tap", goToLoading)

    player = display.newImageRect("SFX/audioOff.png", 24,24)
    

    flip = display.newImageRect("SFX/audioOff.png", 24,24)  
    flip.x = 30
    flip.y = 270 
    sceneGroup:insert(flip)   

    flip2 = display.newImageRect("SFX/audioOn.png", 24,24)    
    flip2.x = 30
    flip2.y = 270
    sceneGroup:insert(flip2)



function trocarposicao( event )
    if ( event.phase == "began" ) then      
        player.xScale = -1;
        flip.isVisible = false;
        flip2.isVisible = true;
        audio.setVolume( 0.75, {channel = 1} )
        
    end
    
end

function trocarposicao2( event )
    
    if ( event.phase == "began" ) then      
        player.xScale = 1;
        flip.isVisible = true;
        flip2.isVisible = false;
        audio.setVolume( 0.0, {channel = 1} )
        
    end
    
end

flip:addEventListener("touch", trocarposicao)
flip2:addEventListener("touch", trocarposicao2)

    



    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene