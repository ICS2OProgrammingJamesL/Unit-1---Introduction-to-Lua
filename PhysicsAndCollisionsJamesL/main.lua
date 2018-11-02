-----------------------------------------------------------------------------------------
-- Title: Physics and Collisions
-- Name: James Lyall
-- Course: ICS2O
-- This program makes balls bounce off a board.
-----------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

-- local variables for background music
local BackgroundMusic = audio.loadSound( "Sounds/bkgMusic.mp3)" )
local BackgroundMusicChannel

-- OBJECTS

-- ground

local ground = display.newImage("Images/ground.png", 0, 0)

-- put the ground at the middle of the screen width then put it at the bottom of the screen height

ground.x = display.contentWidth*1/2
ground.y = display.contentHeight*10/10

-- change the width to be the same as the screen
ground.width = display.contentWidth

-- add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-- display image of the beam
local beam = display.newImage("Images/beam.png", 0, 0)
local beam1 = display.newImage("Images/beam.png", 0, 0)

-- set its x and y value
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65
beam1.x = display.contentCenterX/5
beam1.y = display.contentCenterY*1.65

-- set the beam width to be half of the ipad width. Set the beam height to be 1/10 of the ipad height

beam.x = display.contentWidth*1/10
beam.y = display.contentHeight*9/10
beam1.x = display.contentWidth*9/10
beam1.y = display.contentHeight*9/10

beam.width = display.contentWidth*0.5/10
beam.height = display.contentHeight*7/10
beam1.width = display.contentWidth*0.5/10
beam1.height = display.contentHeight*7/10

-- rotate the beam to be 320 degrees so its on a angle facing right

beam:rotate(320)
beam1:rotate(40)

-- sned it to the back layer
beam:toBack()
beam1:toBack()

-- add the physics
physics.addBody(beam, "static", {friction=0.5, bounce=0.3})
physics.addBody(beam1, "static", {friction=0.5, bounce=0.3})

-- create background

local bkg = display.newImage("Images/bkg.png", 0, 0)

-- set its x and y 
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

-- set the width of the background image to be the width of the ipad
-- set the height of the background image to be the height of the ipad

bkg.width = display.contentWidth
bkg.height = display.contentHeight

-- set the background to the back.

bkg:toBack()

-- FUNCTIONS 

-- create the first ball

local function firstball()

	-- creating the ball

	local ball1 = display.newImage("Images/ball.png", 0, 0)

	-- add physics

	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=1, radius=50})
	ball1:scale( 2, 2)

	-- display the background music
	BackgroundMusicChannel = audio.play(BackgroundMusic)
end

-- create the second ball

local function secondball()

	-- create the ball

	local ball2 = display.newImage("Images/ball.png", 0, 0)

	-- add physics

	physics.addBody(ball2, {density=1.0, friction=1, bounce=0.4, radius=75})
	ball2:scale( 3, 3)
end

local function thirdball()

	-- creating the ball

	local ball3 = display.newImage("Images/ball.png", 1000, 0)

	-- add physics

	physics.addBody(ball3, {density=1.0, friction=0.1, bounce=0.1, radius=50})

	ball3:scale( 2, 2)
end

-- create the second ball

local function fourthball()

	-- create the ball

	local ball4 = display.newImage("Images/ball.png", 1000, 50)

	-- add physics

	physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.5, radius=25})
end


-- TIMER DELAYS
timer.performWithDelay( 0, firstball)
timer.performWithDelay( 500, secondball)
timer.performWithDelay( 500, thirdball)
timer.performWithDelay( 500, fourthball)