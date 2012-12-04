;==========================================================
; Global Variables
;==========================================================
VisualStudio2010Path = C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe
VisualStudio2012Path = C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe
VisualStudioPath = C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe
VisualStudioWindowTitle = Microsoft Visual Studio

;==========================================================
; JIRA
;==========================================================
JiraURL = https://pm.iqmetrix.com
JiraProject = PLATFORM

;==========================================================
; Visual Studio Solutions
;==========================================================
solutions = ""
AddParameterToString(solutions, "PL|C:\source\iq\Catalog\IQ.ProductLibrary.sln")
AddParameterToString(solutions, "F|C:\source\iq\Foundation\iQMetrix.Foundation.sln")

;==========================================================
; Commands
;==========================================================
AddCommand("OpenVisualStudioSolution", "Opens Visual Studio solution", solutions)
OpenVisualStudioSolution(solution)
{
	global VisualStudioPath
	Run, "%VisualStudioPath%" %solution%
}

AddCommand("JiraWorkItem", "Opens JIRA work item")
JiraWorkItem(workItemNumber = "")
{
	global JiraURL
	global JiraProject
	
	; If work item number was supplied opens it.
	if (workItemNumber != "")
		Run, %JiraURL%/browse/%JiraProject%-%workItemNumber%
	; Otherwise the user didn't supply a workItemNumber, open JIRA home page
	else
		Run, %JiraURL%
}

AddCommand("Dev", "Optimizes your workbench for coding", solutions)
Dev(solutionAndWorkItemNumber)
{
	StringSplit params, solutionAndWorkItemNumber, `,
	
	OpenVisualStudioSolution(params1)
	JiraWorkItem(params2)	
	WinClose, Microsoft Outlook
	; SetCommunicatorStatus("STATUS_BUSY")
	; LaunchMediaPlayer(%CodingPlaylist$)
}
