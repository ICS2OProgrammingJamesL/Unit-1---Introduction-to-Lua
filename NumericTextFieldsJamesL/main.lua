-----------------------------------------------------------------------------------------
-- Title: Numeric TextField
-- Name: James Lyall
-- Course: ICS2O
-- This program displays a math equation and asks the 
-- user to answer in a numeric textfield terminal.
-----------------------------------------------------------------------------------------

-- Hide the status bar.
display.setStatusBar(display.HiddenStatusBar)

-- set backgroun colour
display.setDefault("background", 100/255, 0/255, 10/255)

-- local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local randomOperator
local Points = 0
local pointsTextObject




-- local functions

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)
	randomOperator = math.random(1, 3)

	if (randomOperator == 1) then
	
		correctAnswer = randomNumber1 + randomNumber2

		-- created question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomOperator == 2) then

		correctAnswer = randomNumber1 - randomNumber2

		-- created question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	elseif (randomOperator == 3) then

		correctAnswer = randomNumber1 * randomNumber2

		-- created question in text object
		questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "

	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began") then

		-- clear text field
		

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer

		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			event.target.text = ""
			timer.performWithDelay(2000, HideCorrect)
			Points = Points + 1
			else
			incorrectObject.isVisible = true
			event.target.text = ""
			correctObject.isVisible = false	
			timer.performWithDelay(2000, HideIncorrect)	
		end
	end
end

-- display points text and colour it
pointsTextObject = display.newText( " Points = " .. Points, 100, 100, nil, 50)
pointsTextObject:setTextColor(10/255, 100/255, 10/255)

-- OBJECT CREATION

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(10/255, 100/255, 10/255)

-- created the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight/4, nil, 80 )
correctObject:setTextColor(0, 0, 0)
correctObject.isVisible = false

-- created the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight/4, nil, 80 )
incorrectObject:setTextColor(0, 0, 0)
incorrectObject.isVisible = false

-- create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 200, 80 )
numericField.inputType = "default"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- FUNCTION CALLS
AskQuestion()

