;==========================================================
; Global Variables
;==========================================================
RecycleBinCLSID = ::{645ff040-5081-101b-9f08-00aa002f954e}

;==========================================================
; Commands
;==========================================================
AddCommand("RecycleBin", "Opens Recycle Bin")
RecycleBin()
{
	global RecycleBinCLSID
	Run %RecycleBinCLSID%	
}

AddCommand("AddRemovePrograms", "Opens Add/Remove Programs")
AddRemovePrograms()
{
	Run rundll32.exe shell32.dll`,Control_RunDLL appwiz.cpl
}

CommonWindows = ""
AddParameterToString(CommonWindows, "VSF|iQMetrix.Foundation - Microsoft Visual Studio")
AddParameterToString(CommonWindows, "VSC|IQ.ProductLibrary - Microsoft Visual Studio")
AddParameterToString(CommonWindows, "TWEET|MetroTwit")
AddParameterToString(CommonWindows, "MAIL|Microsoft Outlook")
AddParameterToString(CommonWindows, "GIT|MINGW32:")


AddCommand("Window", "Activates Window By Name", CommonWindows)
Window(name)
{
	windowID := PutWindowInFocus(name, "", 2)
	
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





