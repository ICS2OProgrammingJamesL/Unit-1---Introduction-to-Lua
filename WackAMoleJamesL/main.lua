-----------------------------------------------------------------------------------------
-- Title: Wack A mole
-- Name: James Lyall
-- Course: ICS2O
-- this program displays wack a mole
-----------------------------------------------------------------------------------------

-- remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- creating the background

display.setDefault("background", 0/255, 150/255, 0/255)

-- create the mole

local mole = display.newImage( "Images/mole2.png" , 0, 0 )

-- set the moles position

mole.x = display.contentCenterX
mole.y = display.contentCenterY

-- add sounds so when you click the mole it makes a sound

local MoleSound = audio.loadSound( "Sounds/Oof.mp3")
local MoleSoundChannel

-- scale the mole

mole:scale( 0.3, 0.3)

-- make the mole invisible

mole.isVisible = false

-- add local variable to keep track of score

local points = 0
local pointsText

-- FUNCTIONS

-- this function makes the mole appear in a random position before calling the hide function

function PopUp( )

	-- choosing random position on the screen between 0 and the size of the screen

	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )

	-- make the mole visible

	mole.isVisible = true

	-- call the hide function after 600 miliseconds
	timer.performWithDelay( 600, PopUp)
end

-- this function calls the PopUp function after 3 seconds

function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp )
end

-- this function makes the mole invisible and then calls the PopUpDelay function

function Hide( )

	-- changing visibility

	mole.isVisible = false

	PopUpDelay()
end

-- this function starts the game

function GameStart( )
	PopUpDelay()
end

-- this function increments the score only if the mole is clicked

function Wacked( event )

	-- if touch phase has just started
	if (event.phase == "began") then
		points = points + 1
		pointsText.text = " Points = " .. points
		MoleSoundChannel = audio.play(MoleSound)
	end
end

-- display points text and colour it
pointsText = display.newText( " Points = " .. points, 100, 100, nil, 50)
pointsText:setTextColor(10/255, 10/255, 100/255)

-- EVENT LISTENERS
-- add event listeners to the moles so that if the mole is touched, the wacked function is called

mole:addEventListener( "touch", Wacked )

-- START GAME

GameStart()

