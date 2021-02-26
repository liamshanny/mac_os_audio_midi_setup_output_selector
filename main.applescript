-- modified from script at https://audiophilestyle.com/forums/topic/11819-a-usefull-applescript-code-for-audiophiles/
-- BEGIN APPLESCRIPT --

activate application "Audio MIDI Setup"


SetAudioDevice("HIFI DSD", "24-bit Integer (96.0 kHz)")
on SetAudioDevice(myDeviceName, audioFormat)
	
	activate application "Audio MIDI Setup"
	
	tell application "System Events"
		
		tell process "Audio MIDI Setup"
			
			-- Open Audio Devices window if it is closed:
			
			try
				
				click menu item "Show Audio Window" of menu "Window" of menu bar item "Window" of menu bar 1
				
			end try
			
			-- List of Audio Devices in left column:
			
			tell outline 1 of scroll area 1 of splitter group 1 of window "Audio Devices"
				
				
				set N to 0
				
				-- Set N to index of desired device:
				
				repeat with k from 1 to (count of rows)
					set x to name of UI element 1 of row k
					
					if x = myDeviceName then
						
						set N to k
						
						exit repeat
						
					end if
					
				end repeat
				
				if N = 0 then
					
					display dialog "Desired Audo Device not found."
					
					quit
					
				end if
				select row N
				
			end tell
			
			--Use this device for sound output:
			
			tell window "Audio Devices"
				
				-- set myDeviceName to default audio output
				perform action "AXShowMenu" of outline 1 of scroll area 1 of splitter group 1
				click menu item 5 of menu 1 of outline 1 of scroll area 1 of splitter group 1
				key code 53
				
				-- set myDeviceName to default alert sound output
				perform action "AXShowMenu" of outline 1 of scroll area 1 of splitter group 1
				click menu item 6 of menu 1 of outline 1 of scroll area 1 of splitter group 1
				key code 53
				
				-- select audio format ''
				perform action "AXPress" of radio button "Output" of tab group 1 of splitter group 1
				perform action "AXPress" of pop up button 2 of tab group 1 of splitter group 1
				click menu item audioFormat of menu 1 of pop up button 2 of tab group 1 of splitter group 1
			end tell
		end tell
		
		quit application "Audio MIDI Setup"
		
	end tell
	
end SetAudioDevice



-- END APPLESCRIPT --
