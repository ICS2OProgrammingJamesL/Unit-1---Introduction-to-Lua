-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: James Lyall
-- Course: ICS2O
-- In this program you click a blue button and it changes to red.
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set background colour
display.setDefault ("background", 20/255, 10/255, 50/255)

-- Sound Variables
 local FryingPan = audio.loadSound( "Sounds/Fryingpan.mp3" )
local FryingPanChannel

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it visible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create red x, set its position and make it visible
local redX = display.newImageRect("Images/red_x.png",200, 100)
redX.x = display.contentWidth/2
redX.y = display.contentHeight/4
redX.isVisible = true

-- created green check, set its position and mkae it invisible until touched
local greenCheck = display.newImageRect("Images/checkmark.png",200, 100)
greenCheck.x = display.contentWidth/2
greenCheck.y = display.contentHeight/4
greenCheck.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 0, 1)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		greenCheck.isVisible = true
		redX.isVisible = false
		FryingPanChannel = audio.play(FryingPan)
	end

	if (touch.phase == "ended") then
	 blueButon.isVisible = true
	 redButton.isVisible = false
	 textObject.isVisible = false
	 greenCheck.isVisible = false
	 audio.stop(FryingPanChannel)
	end
end

local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		greenCheck.isVisible = false
		redX.isVisible = true
		FryingPanChannel = audio.play(FryingPan)
	end

	if (touch.phase == "ended") then
	 blueButton.isVisible = true
	 redButton.isVisible = false
	 textObject.isVisible = false
	 greenCheck.isVisible = false
	 redX.isVisible = true
	 audio.stop(FryingPanChannel)
	end
end




-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)