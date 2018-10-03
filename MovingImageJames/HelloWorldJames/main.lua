-----------------------------------------------------------------------------------------
-- Name: James Lyall
-- Course: ICS2O/3C
-- This program displays Hello, World on the iPad simulator and "Hello James!" to the command
-- terminal.
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Hello James!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 100/255, 50/255, 199/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 500 and y = 500 with
-- a default font style and font size of 50
textObject = display.newText( "Hello James!", 500, 300, nil, 70 )

-- sets the colorr of the text
textObject:setTextColor(155/255, 42/255, 198/255)
