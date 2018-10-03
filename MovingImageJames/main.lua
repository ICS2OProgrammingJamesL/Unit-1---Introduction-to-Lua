-- Title: MovingObjects
-- Name: Your Name
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 5
-- background image with width snd height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)
local octopus = display.newImageRect("Images/octopus.png", 150, 150)

-- set the image to be transparent
beetleship.alpha = 0
octopus.alpha = 1


-- set the initial x and y position of beetleship
beetleship.x = 400
beetleship.y = 0
octopus.x = 0
octopus.y = 300

-- function: MovieShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.y = beetleship.y + scrollSpeed
	octopus.x = octopus.x + scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
	octopus.alpha = octopus.alpha - 0.001
end

-- MoveShip will be called over and overagain
Runtime:addEventListener("enterFrame", MoveShip)