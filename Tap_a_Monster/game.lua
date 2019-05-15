local composer = require( "composer" )
composer.removeScene( "loading" )
composer.removeScene("score")
composer.recycleOnLowMemory = true
local scene = composer.newScene()
local C = require("characters")

--audio.setMaxVolume( 0.75, {channel = 1} )
gameMusicOn = audio.play(gameMusic, {channel=1})



system.activate( "multitouch" );
math.randomseed( os.time())
display.setStatusBar( display.HiddenStatusBar )

_W = display.viewableContentWidth
_H = display.viewableContentHeight
local cX = display.contentCenterX
local cY = display.contentCenterY


scoreTotal = 0


function background ()
background = display.newImageRect("background/cemiterio.png", 560, 350, _W, _H)
background.x = cX
background.y = cY
background.anchorcX = 0 
background.anchorcY = 0
end

function background_Front()
background_front = display.newImageRect("background/background_front.png", 590, 350, _W, _H)
background_front.x = cX
background_front.y = cY
background_front.anchorcX = 0 
background_front.anchorcY = 0
end

function background_Front2()	
background_front2 = display.newImageRect("background/background_front2.png", 590, 350, _W, _H)
background_front2.x = cX
background_front2.y = cY
background_front2.anchorcX = 0
background_front2.anchorcY = 0 
end

function goToScore()	
    local transfer = require("transfer")
    transfer:goToScore()
end


background()
background_Front2()
background_Front()

showTime = 1000

M = {}
M.monster1 = false
M.monster2 = false
M.monster3 = false
M.monster4 = false
M.monster5 = false
M.human1 = false
M.human2 = false
M.human3 = false
M.human4 = false
M.human5 = false


	
function monstros()

	function moveMonster1()
		M.monster1 = true						
		monsterTimer = function () transition.to( monster1, { x=35, y= 250, time=1000}) end
		timer.performWithDelay(showTime,  monsterTimer )			
		M.monster1 = false
		transition.to( monster1, { x=30, y= 250, time=1000, onComplete = removerMonster1})		
		display.remove(background_Front2())			

	end
 	function moveHuman1()
 		M.human1 = true		
		humanTimer = function () transition.to( human1, { x=30, y= 250, time=500}) end
		timer.performWithDelay(showTime,  humanTimer)
		M.human1 = false
		transition.to( human1, { x=30, y= 250, time=1000, onComplete = removerHuman1})		
		display.remove(background_Front2())	
		
	end
	function moveMonster2()
		M.monster2 = true		
		monsterTimer = function () transition.to(monster2, { x=430, y= 260, time=500}) end
		timer.performWithDelay(showTime,  monsterTimer)
		M.monster2 = false
		transition.to( monster2, { x=430, y= 260, time=1000, onComplete = removerMonster2})		
		display.remove(background_Front2())		
			
	end

	function moveHuman2()
		M.human2 = true		
		humanTimer = function () transition.to( human2, { x=430, y= 260, time=500}) end
		timer.performWithDelay(showTime,  humanTimer)
		M.human2 = false
		transition.to( human2, { x=430, y= 260, time=1000, onComplete = removerHuman2})		
		display.remove(background_Front2())
				
	end

	function moveMonster3()
		M.monster3 = true		
		monsterTimer = function () transition.to( monster3, { x=120, y= 150, time=500}) end
		timer.performWithDelay(showTime,  monsterTimer)
		M.monster3 = false
		transition.to( monster3, { x=120, y= 150, time=1000, onComplete = removerMonster3})		
		display.remove(background_Front())
	end

	function moveHuman3()
		M.human3 = true		
		humanTimer = function () transition.to( human3, { x=120, y= 150, time=500}) end
		timer.performWithDelay(showTime,  humanTimer)
		M.human3 = false
		transition.to( human3, { x=120, y= 150, time=1000, onComplete = removerHuman3})		
		display.remove(background_Front())
	end

	function moveMonster4()
		M.monster4 = true		
		monsterTimer = function () transition.to( monster4, { x=320, y= 180, time=500}) end
		timer.performWithDelay(showTime,  monsterTimer)
		M.monster4 = false
		transition.to( monster4, { x=320, y= 180, time=1000, onComplete = removerMonster4})		
		display.remove(background_Front())
	end

	function moveHuman4()
		M.human4 = true		
		local humanTimer = function () transition.to( human4, { x=320, y= 180, time=500}) end
		timer.performWithDelay(showTime,  humanTimer)
		M.human4 = false
		transition.to( human4, { x=320, y= 180, time=1000, onComplete = removerHuman4})		
		display.remove(background_Front())
	end

	function moveMonster5()
		M.monster5 = true		
		monsterTimer = function () transition.to( monster5, { x=140, y= 180, time=500 }) end 
		timer.performWithDelay(showTime,  monsterTimer)			
		M.monster5 = false		
		transition.to( monster5, { x=140, y= 180, time=1000, onComplete = removerMonster5})		
		display.remove(background_Front())
	end

	function moveHuman5()
		M.human5 = true					
		humanTimer = function () transition.to( human5, { x=140, y= 180, time=500}) end
		timer.performWithDelay(showTime,  humanTimer)		
		M.human5 = false		
		transition.to( human5, { x=140, y= 180, time=1000, onComplete = removerHuman5})		
		display.remove(background_Front())
	end




function kindOfMonster() 
 	search = math.random(12)
return search
end

    if kindOfMonster(search) == 1 then
			if M.monster1 == true or M.human1 == true then 
    			kindOfMonster(search)
    		else
    			M.monster1 = true    			
		    	C:monster1()
		    	background_Front2()
				transition.to( monster1, { x=30, y= 150, time=500, onComplete = moveMonster1})
				
			end	
		function monster1:tap()
				gameTapOn = audio.play(gameTap, {channel=2})
				scoreTotal = scoreTotal + 1
				monster1.xScale = 0.1
				monster1.yScale = 0.1
				monster1.alpha = 0				
				M.monster1 = false
		end
			monster1:addEventListener("tap", monster1)    


    elseif kindOfMonster(search) == 2 then
    		if M.monster1 == true or M.human1 == true then
    			kindOfMonster(search)
    		else
    			M.human1 = true    			
			    C:human1()
			    background_Front2()	
				transition.to( human1, { x=25, y= 150, time=500, onComplete = moveHuman1})
				
			end	
		function human1:tap()
				gameTapOn = audio.play(gameTap, {channel=2})				
				scoreTotal = scoreTotal - 1
				human1.xScale = 0.1
				human1.yScale = 0.1
				human1.alpha = 0				
				M.human1 = false	
		end
		human1:addEventListener("tap", human1)


	elseif kindOfMonster(search) == 3 then
    		if M.monster2 == true or M.human2 == true then 
    			kindOfMonster(search)
    		else
    			M.monster2 = true    			
		       	C:monster2()
		       	background_Front2()	 
				transition.to( monster2, { x=430, y= 200, time=500, onComplete = moveMonster2})
				
			end	
		function monster2:tap()
				gameTapOn = audio.play(gameTap, {channel=2})
				scoreTotal = scoreTotal + 1
				monster2.xScale = 0.1
				monster2.yScale = 0.1
				monster2.alpha = 0				
				M.monster2 = false
		end
			monster2:addEventListener("tap", monster2)

	elseif kindOfMonster(search) == 4 then
			if M.monster2 == true or M.human2 == true then 
    			kindOfMonster(search)
    		else
    			M.human2 = true    				
				C:human2()
				background_Front2()
				transition.to( human2, { x=430, y= 200, time=500, onComplete = moveHuman2})
				
			end	
		function human2:tap()
				gameTapOn = audio.play(gameTap, {channel=2})				
				scoreTotal = scoreTotal - 1
				human2.xScale = 0.1
				human2.yScale = 0.1
				human2.alpha = 0				
				M.human2 = false	
		end
		human2:addEventListener("tap", human2)

	elseif kindOfMonster(search) == 5 then
			if M.monster3 == true or M.human3 == true then 
    			kindOfMonster(search)
    		else
    			M.monster3 = true    				
				C:monster3()
				background_Front()
				transition.to( monster3, { x=120, y= 70, time=500, onComplete = moveMonster3})
				
			end	
		function monster3:tap()
				gameTapOn = audio.play(gameTap, {channel=2})
				scoreTotal = scoreTotal + 1
				monster3.xScale = 0.1
				monster3.yScale = 0.1
				monster3.alpha = 0				
				M.monster3 = false
		end
			monster3:addEventListener("tap", monster3)

	elseif kindOfMonster(search) == 6 then
			if M.monster3 == true or M.human3 == true then 
    			kindOfMonster(search)
    		else
    			M.human3 = true    				    
				C:human3()
				background_Front()
				transition.to( human3, { x=120, y= 90, time=500, onComplete = moveHuman3})
				 
			end	
		function human3:tap()
				gameTapOn = audio.play(gameTap, {channel=2})				
				scoreTotal = scoreTotal - 1
				human3.xScale = 0.1
				human3.yScale = 0.1
				human3.alpha = 0				
				M.human3 = false	
							
		end
		human3:addEventListener("tap", human3)

    elseif kindOfMonster(search) == 7 then
			if M.monster4 == true or M.human4 == true then 
    			kindOfMonster(search)
    		else
    			M.monster4 = true    				
				C:monster4()
				background_Front()
				transition.to( monster4, { x=320, y= 120, time=500, onComplete = moveMonster4})
				
			end	

		function monster4:tap()
				gameTapOn = audio.play(gameTap, {channel=2})				
				scoreTotal = scoreTotal + 1
				monster4.xScale = 0.1
				monster4.yScale = 0.1
				monster4.alpha = 0				
				M.monster4 = false
		end
			monster4:addEventListener("tap", monster4)
			

	elseif kindOfMonster(search) == 8 then
		 	if M.monster4 == true or M.human4 == true then 
    			kindOfMonster(search)
    		else
    			M.human4 = true    			
				C:human4()
				background_Front()
				transition.to( human4, { x=320, y= 130, time=500, onComplete = moveHuman4})
				
			end	
		function human4:tap()
				gameTapOn = audio.play(gameTap, {channel=2})
				scoreTotal = scoreTotal - 1
				human4.xScale = 0.1
				human4.yScale = 0.1
				human4.alpha = 0				
				M.human4 = false	
							
		end
		human4:addEventListener("tap", human4)

	elseif kindOfMonster(search) == 9 then 
    		if M.monster5 == true or M.human5 == true then 
    			kindOfMonster (search)
    		else
    			M.monster5 = true    			     		
    			C:monster5()
    			background_Front()
				transition.to(monster5, { x=180, y= 180, time=500, onComplete = moveMonster5})
				 
			end
		

		function monster5:tap()
				gameTapOn = audio.play(gameTap, {channel=2})
				scoreTotal = scoreTotal + 1
				monster5.xScale = 0.1
				monster5.yScale = 0.1
				monster5.alpha = 0				
				M.monster5 = false
		end
			monster5:addEventListener("tap", monster5)


    elseif kindOfMonster(search) == 10 then 
    		if M.monster5 == true or M.human5 == true then
    			kindOfMonster (search)
    		else
    			M.human5 = true    			  
		    	C:human5() 
		    	background_Front()
				transition.to( human5, { x=170, y= 180, time=500, onComplete = moveHuman5})
				 
			end
			
		function human5:tap()
				gameTapOn = audio.play(gameTap, {channel=2})				
				scoreTotal = scoreTotal - 1
				human5.xScale = 0.1
				human5.yScale = 0.1
				human5.alpha = 0				
				M.human5 = false
		end
			human5:addEventListener("tap", human5)

	elseif kindOfMonster(search) == 11 then
		C:ghost()	
    	transition.to( ghost, { x=550, y= 50, time=1000})
 		
 		function ghost:tap()
 				gameTapOn = audio.play(gameTap, {channel=2})
				scoreTotal = scoreTotal + 2
				ghost.xScale = 0.1
				ghost.yScale = 0.1
				ghost.alpha = 0
		end
			ghost:addEventListener("tap", ghost)		

	else 
		kindOfMonster(search)
		monstros()
    end			

	
end


local output = display.newText( "0", 0, 0, "Ghoulish", 32 )
lightcyan = {255, 255, 255}
output : setTextColor(255, 255, 255);
output.anchorX = 0;
output.x = cX -10;
output.y = cY - 95;

local  function addSetText(obj)
	function obj:setText(txt,align)
		local a = aling ;
		local oldX = self.x;
		local oldY = self.y;
		self.text = txt;
		self.anchorX = 0;
		self.x = oldX;
		self.y = oldY;
	end
		
end

addSetText(output);

tmr = timer.performWithDelay( 1000, function(e)
	output:setText(e.count)
	
		if(e.count == 31) then
			timer.cancel( tmr )
			tmr = nil	
			display.remove( background_Front2() )
			display.remove( background_Front() )
			audio.stop( gameMusicOn)
			goToScore()			
		end
		
		
end,31);

tmrMonster = timer.performWithDelay( 2000, function(m)
		
		monstros()
		
		if (m.count == 7) then
			showTime = 800

		end

		if (m.count == 11) then
				
			showTime = 500			

		end
		
		if(m.count == 15) then
			timer.cancel( tmrMonster );								
			tmrMonster = nil;
		end
		
			
end,15);

display.remove( background_Front2() )
display.remove( background_Front() )
return scene