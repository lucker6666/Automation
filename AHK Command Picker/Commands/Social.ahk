;==========================================================
; Global Variables
;==========================================================

TwitterClientPath = C:\Users\Dennis Loktionov\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Pixel Tucker Pty Ltd\MetroTwit.appref-ms
TwitterClientWindowTitle = MetroTwit

;==========================================================
; Commands
;==========================================================
AddCommand("Tweet", "Opens Twitter Client")
Tweet()
{
	global TwitterClientPath
	global TwitterClientWindowTitle
	
	windowID := PutWindowInFocus(TwitterClientWindowTitle, TwitterClientPath, 2)
	
	if (windowID > 0)
	{
		; Maximize the window if it is not already maximized.
		WinGet, maximized, MinMax, ahk_id %windowID%
		if (maximized != 1)
		{
			WinMaximize, ahk_id %windowID%
		}
	}	
}

