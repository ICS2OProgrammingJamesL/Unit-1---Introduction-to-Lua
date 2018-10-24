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
local randomOperator

-- Points variables
local Points = 0
local pointsText

-- Game Over variable
local GameOver

-- Variables for the timer.
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

-- variables for lives.
local lives = 4
local heart1
local heart2
local heart3
local heart4

-- Sound variables
local correctSound = audio.loadSound( "Sounds/correctSound.mp3")
local correctSoundChannel
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3")
local incorrectSoundChannel

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7

local function UpdateLives()
	if  (lives == 3) then
			heart4.isVisible = false
		elseif (lives == 2) then
			heart3.isVisible = false
		elseif (lives == 1) then
			heart2.isVisible = false
		elseif (lives == 0) then
			heart1.isVisible = false
			GameOver = display.newImageRect("Images/gameOver.png", 1350, 900)
			GameOver.x = display.contentWidth/2
			GameOver.y = display.contentHeight/2
			clockText.isVisible = false
			pointsText.isVisible = false
			questionObject.isVisible = false
			numericField.isVisible = false
			incorrectSoundChannel = audio.play(incorrectSound)
	end
end

-- local function for timer and lives
local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""
	
	if (userAnswer == correctAnswer) then
		secondsLeft = totalSeconds		
	end


	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateLives()
	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end


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

-- create functions for correct and incorrect.

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
			pointsText.text = " Points = " .. Points
			correctSoundChannel = audio.play(correctSound)
		else
			incorrectObject.isVisible = true
			event.target.text = ""
			correctObject.isVisible = false	
			timer.performWithDelay(2000, HideIncorrect)	
			lives = lives - 1
			UpdateLives()
			incorrectSoundChannel = audio.play(incorrectSound)
			secondsLeft = totalSeconds
		end
	end
end

-- display clock timer and colour it.
clockText = display.newText( " Time left: " .. secondsLeft, 500, 600, nil, 50 )
clockText:setTextColor(10/255, 100/255, 10/255)

-- display points text and colour it
pointsText = display.newText( " Points = " .. Points, 100, 100, nil, 50)
pointsText:setTextColor(10/255, 100/255, 10/255)

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
StartTimer()

