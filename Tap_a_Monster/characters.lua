local M = {}

function M:monster1()
monster1 = display.newImage("Sprites/Frank_d.png")
monster1 : scale( 0.1, 0.1 )
monster1.x = 35
monster1.y =  250
end			
function M:human1()
human1 = display.newImage("Sprites/Humano01.png")
human1 : scale( 0.1, 0.1 )
human1.x = 30
human1.y =  250
end

function M:monster2 ()
monster2 = display.newImage("Sprites/Mummy_e.png")
monster2 : scale( 0.1, 0.1 )
monster2.x = 430
monster2.y = 260
end		
				
function M:human2()
human2 = display.newImage("Sprites/Humano02.png")
human2 : scale( 0.1, 0.1)
human2.x = 430
human2.y = 260
end

function M:monster3()
monster3 = display.newImage("Sprites/JackOLantern_d.png")
monster3 : scale( 0.1, 0.1 )
monster3.x = 120
monster3.y =  150
end
				
function M:human3()
human3 = display.newImage("Sprites/Humano03.png")				
human3 : scale( 0.1, 0.1 )
human3.x = 120
human3.y =  150
end	

function M:monster4()
monster4 = display.newImage("Sprites/Vamp_e.png")
monster4 : scale( 0.1, 0.1 )
monster4.x = 320
monster4.y =  180
end

function M:human4()
human4 = display.newImage("Sprites/Humano04.png")
human4 : scale( 0.1, 0.1 )
human4.x = 320
human4.y =  180	
end

function M:monster5()	
monster5 = display.newImage("Sprites/Zombie.png")
monster5 : scale( 0.1, 0.1 )
monster5.x = 140
monster5.y =  180
end

function M:human5()
human5 = display.newImage("Sprites/Humano05.png")
human5 : scale( 0.1, 0.1 )
human5.x = 140
human5.y =  180	
end



function M:ghost()
ghost =  display.newImage("Sprites/ghost.png")
ghost.alpha = 0.4
ghost : scale( 0.1, 0.1 )
ghost.x = 0
ghost.y = 70
end

function removerMonster1( )
	display.remove(monster1)
	
end

function removerMonster2( )
	display.remove(monster2)
	
end

function removerMonster3( )
	display.remove(monster3)
	
end

function removerMonster4( )
	display.remove(monster4)
	
end

function removerMonster5( )
	display.remove(monster5)
	
end

function removerHuman1( )
	display.remove(human1)
	
end

function removerHuman2( )
	display.remove(human2)
	
end

function removerHuman3( )
	display.remove(human3)
	
end

function removerHuman4( )
	display.remove(human4)
	
end

function removerHuman5( )
	display.remove(human5)
	
end


return M