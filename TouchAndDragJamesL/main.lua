-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag
-- Name: James Lyall
-- Course: ICS2O
-- This program displays images that react to a person's finger.
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables.
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local yellowGirl = display.newImageRect("Images/yellowGirl.png", 150, 150)
local yellowGirlWidth = yellowGirl.width 
local yellowGirlHeight = yellowGirl.yellowGirlHeight

local blueGirl = display.newImageRect("Images/blueGirl.png", 150, 150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.blueGirlHeight

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false

-- set local variables for sound
local PopSound = audio.loadSound( "Sounds/PopSound.wav" )
local PopSoundChannel

-- set the initial x and y position of myImage
yellowGirl.x = 400
yellowGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

-- Function: BlueGirlListener
-- Input: touch listener 
-- Output: none
--description: when blue girl is touched, move her
local function BlueGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedYellowGirl == false) then
			alreadyTouchedBlueGirl = true
			PopSoundChannel = audio.play(PopSound)
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x
		blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedyellowGirl = false 
	end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

-- Function: BlueGirlListener
-- Input: touch listener 
-- Output: none
--description: when blue girl is touched, move her
local function YellowGirlListener(touch)

	if (touch.phase == "began") then
		if alreadyTouchedBlueGirl == false then
			alreadyTouchedYellowGirl = true
			PopSoundChannel = audio.play(PopSound)
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
		yellowGirl.x = touch.x
		yellowGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedBlueGirl = false 

	end
end

-- add the respective listeners to each object
yellowGirl:addEventListener("touch", YellowGirlListener)










