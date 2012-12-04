;==========================================================
; Global Variables
;==========================================================
MongoVuePath = C:\Program Files (x86)\MongoVUE\MongoVUE 1.5.3\
MongoVueExecutable = MongoVUE.exe
MongoVueMainWindowTitle = MongoVUE
MongoVueConnectWindowTitle = Connect

;==========================================================
; Database Servers
;==========================================================
MongoDBServers = ""
AddParameterToString(MongoDBServers, "L|Localhost")
AddParameterToString(MongoDBServers, "D|DevReplicaset")
AddParameterToString(MongoDBServers, "S|Staging")

;==========================================================
; Commands
;==========================================================

AddCommand("MongoVue", "Opens MongoVue", MongoDBServers)
MongoVue(server = "Localhost")
{
	global MongoVuePath
	global MongoVueExecutable
	global MongoVueMainWindowTitle
	global MongoVueConnectWindowTitle
		
	Run, "%MongoVuePath%%MongoVueExecutable%", "%MongoVuePath%"
	WinWaitActive, %MongoVueConnectWindowTitle%
	
	ControlGet, ServerList, List, , WindowsForms10.LISTBOX.app.0.2004eee1, %MongoVueConnectWindowTitle% ; Get server ListBox control
	
	matchingServerIndex = -1	; find the index of the matching server in the list
	Loop, Parse, ServerList, `n
	{
		IfEqual server, %A_LoopField% 
		{	
			matchingServerIndex = %A_Index%
		}
	}

	Loop %matchingServerIndex%
	{
		Send, {Down}
	}
	Send, {Up}
	
	ControlClick, WindowsForms10.Window.8.app.0.2004eee9, %MongoVueConnectWindowTitle%	; click "Connect" button once server is selected
	
	WinWaitActive %MongoVueMainWindowTitle% ; wait for main MongoVue window to show up and maximize it
	WinMaximize %MongoVueMainWindowTitle% 
}


