-----------------------------------------------------------------------------------------
-- Title: AreaRectCircleJames
-- Name: James Lyall
-- Course: ICS2O/3C
-- This program displays a rectangle and circle and shows the area
-----------------------------------------------------------------------------------------

-- create my local variables 
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 500
local heightOfRectangle = 300
local areaOfRectangle
local myCircle
local areaTextCircle
local circumference 
local radiusOfCircle = 140
local areaOfCircle
local PI = 3.14
local AreaText
local TextSize = 50

-- local variables for background music
local BackgroundMusic = audio.loadSound( "Sounds/bkgMusic.mp3)" )
local BackgroundMusicChannel

--set the backgorund colour of my screen. Remember that colors are between 0 and 1.
display.setDefault("background", 29/25, 195/255, 100/255)

--to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- display the background music
BackgroundMusicChannel = audio.play(BackgroundMusic)

--draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(10, 10, widthOfRectangle, heightOfRectangle)

--draw the circle that has coordinates of (850,150) and a radius of 140
myCircle = display.newCircle(850, 150, radiusOfCircle)

--anchor the rectangle in the top left cornor of thge screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 30
myRectangle.y = 20

--set the width of the border
myRectangle.strokeWidth = 20

--set the width of the border
myCircle.strokeWidth = 20

--set the color of the rectangle
myRectangle:setFillColor(200/255, 100/255,10/255)

--set the color of the circle
myCircle:setFillColor(150/255, 150/255, 200/255)

--set the color of the border
myRectangle:setStrokeColor(0, 0, 0)

--set the color of the border
myCircle:setStrokeColor(0, 0, 0)

--calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- calculate the area of the circle
areaOfCircle = radiusOfCircle * radiusOfCircle * PI


--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
  widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
  areaOfRectangle .. " pixels². ", 0, 0, Arial, textSize)

--anchor the text and set its (x,y) position 
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the color of the newText 
areaText:setTextColor (0, 0, 0)

-- set the color of the newText 
areaText:setTextColor (1, 1, 1)

--Write area of circle on screen.
AreaText = display.newText("The area of the circle with a radius of \n" ..
	radiusOfCircle .. " and the pie being " .. PI .. " is " ..
	areaOfCircle .. "pixels². ", 0, 0, Arial, TextSize)

--anchor the text and set its (x,y) position 
AreaText.anchorX = 0
AreaText.anchorY = 0
AreaText.x = 20
AreaText.y = display.contentHeight*2/3



