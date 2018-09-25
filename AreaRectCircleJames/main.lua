-----------------------------------------------------------------------------------------
-- Title: AreaRectCircleJames
-- Name: James Lyall
-- Course: ICS2O/3C
-- This program displays a rectangle and circle and shows the area
-----------------------------------------------------------------------------------------

-- create my local variables
local areatext
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local myCircle
local textsizeCircle = 40
local radiusOfCircle = 100
local areaOfCircle
local areaTextCircle
local PI = 3.1415

-- set the background coloue of my screen.remember that colors are between 0 ans 1.
display.setDefault("background", 200/255, 2/255, 2/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and the height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 20

-- set the colour of the rectangle
myRectangle:setFillColor(0.9, 0.8, 0.3)

-- set the color of the border
myRectangle:setStrokeColor(0.7, 0.1, 0.5)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the font when positionign it on the screen.
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. "and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels²", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)
