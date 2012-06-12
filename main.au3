#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha

 Description
	Start script du bot où on crée le dialog pour 
	- nombre de runs, 
	- start/stop
	- key bind (HotKeySet)
	- include des différents fichiers
    On crée les fonction de démarrage et fin du bot également

#ce ----------------------------------------------------------------------------
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;; configs 
AutoItSetOption("MouseCoordMode",2)
AutoItSetOption("PixelCoordMode",2)    
;AutoItSetOption("MustDeclareVars", 1)  
AutoItSetOption("GUIOnEventMode",1)


;; include des lib AutoIt
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <array.au3>
#include <Date.au3>


;; include des fichier du bot
#include "au3udf/ImageSearch.au3"
#include "libs/configsParsing.au3"
#include "libs/variables.au3"
#include "libs/gameFunctions/gameChecks.au3"
#include "libs/gameFunctions/outGameFunction.au3"
#include "libs/gameFunctions/inGameFunction.au3"
#include "libs/commonFunctions.au3"

;; Raccourcis clavier
HotKeySet("{PAUSE}","togglePause")
HotKeySet("{DEL}","stopBot")

#region ### Control GUI
$handlerGUI = GUICreate($baseTitle & " - Stopped", 408, 380, 50, 50)
$Group1 = GUICtrlCreateGroup("LaunchPad", 8, 8, 105, 113)
$gStart = GUICtrlCreateButton("Start", 16, 24, 89, 25)
$gStop = GUICtrlCreateButton("Stop / Exit", 16, 56, 89, 25)
$gEdit = GUICtrlCreateButton("Edit Config", 16, 88, 89, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Stats", 120, 8, 281, 113)
$Label1 = GUICtrlCreateLabel("Heure de début", 128, 24, 78, 17)
$Label2 = GUICtrlCreateLabel("Temps écoulé", 128, 48, 71, 17)
$Label3 = GUICtrlCreateLabel("Nombre de runs", 128, 72, 79, 17)
$Label4 = GUICtrlCreateLabel("Temps moyen par run", 128, 96, 106, 17)
$gHStart = GUICtrlCreateInput("", 248, 22, 145, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$gHEcoule = GUICtrlCreateInput("", 248, 45, 145, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$gNbRun = GUICtrlCreateInput("", 248, 68, 145, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$gAvgRunTime = GUICtrlCreateInput("", 248, 91, 145, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$gLogs = GUICtrlCreateEdit("", 8, 128, 393, 225)
$Credits = GUICtrlCreateLabel("Auteurs : Anakha@GMSTemple, boubi@GMSTemple", 8, 360, 255, 17)
#EndRegion

#region ### GUI Event ControlClick
GUICtrlSetOnEvent($gStart,"startBot")
GUICtrlSetOnEvent($gStop,"stopBot")
GUICtrlSetOnEvent($gEdit,"editConfig")
GUISetOnEvent($GUI_EVENT_CLOSE,"stopBot")
GUISetState(@SW_SHOW)
#EndRegion

While 1
	If $restartDiablo Then
		$botstatus = 0
		startBot()
	EndIf
	sleep(1000)
WEnd


Func editConfig()
	If $botStatus == 0 Then
		RunWait("configHelper.exe")
		loadConfigs()
	EndIf
EndFunc

Func togglePause()
	If $botStatus <> 0 Then
		$Paused = NOT $Paused
		While $Paused 
			$botStatus = 2
			WinSetTitle($handlerGUI,"",$baseTitle&" - Pause")
			sleep(100)
		WEnd
		WinSetTitle($handlerGUI,"",$baseTitle&" - Running")
		$botStatus = 1
	EndIf
EndFunc

Func stopBot()
	$Paused = 0
	
	WinSetTitle($handlerGUI,"",$baseTitle&" - Stopped")
	writeLog("Arrêt du Bot")
	
	writeLog("Restauration du fichier de config Diablo III")
	diabloPrefRestore()
	
	$file = FileOpen("logs/botlogs.log",1)
	FileWriteLine($file,"")
	FileWriteLine($file,"")
	FileWriteLine($file,"---------------------------------------------------------")
	FileWriteLine($file,"| Heure Début : " & GUICtrlRead($gHStart))
	FileWriteLine($file,"| Temps écoule : " & GUICtrlRead($gHEcoule))
	FileWriteLine($file,"| Nombre de runs : " & GUICtrlRead($gNbRun))
	FileWriteLine($file,"| Temps moyen par run : " & GUICtrlRead($gAvgRunTime))
	FileWriteLine($file,"---------------------------------------------------------")
	FileWrite($file,GUICtrlRead($gLogs))
	FileClose($file)
	
	Exit
EndFunc


Func startBot()
	If $botStatus == 0 Then
		writeLog("Mise en place du fichier de config pour le bot")
		diabloPrefChange()
		;; on check les config avant de lancer le bot (pour éviter les erreurs)
		$configOk = loadConfigs()
		If $configOk == 1 Then
			return
		EndIf
		
		;; on met le bon status au bot
		$botStatus = 1
		WinSetTitle($handlerGUI,"",$baseTitle&" - Started")
		
		;; et on démarre ! :D
		writeLog("Démarrage du Bot")
		$startTime			= @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC
		$startTimeCalc	 	= _NowCalc()
		GUICtrlSetData($gHStart,$startTime)
		
		startGameClient()
		$error = waitForGameStart()
		If $error == 1  Then
			writeLog("Client non démarré ou non trouvé.")
			killGame()
			$restartDiablo=1 ;; restart
			return 1
		EndIf
		WinSetTitle($handlerGUI,"",$baseTitle&" - Running")
		$error = login()
		If $error Then
			writeLog("Impossible de se connecter. Relance de diablo")
			killGame()
			$restartDiablo=1 ;; restart
			return 1
		EndIf
		preRunActions()
		doRun()
	EndIf
EndFunc

Func preRunActions()
	waitForLobby()
	leaveChannel()
	selectChar()
EndFunc

Func doRun()
	while 1
		$error = waitForLobby()
		If $error Then
			$action = CheckStateAction()
			If $action == 1 Then
				ExitLoop
			ElseIf $action == 2 then
				ContinueLoop
			EndIf
		EndIf
		
		selectQuest()
		
		$error = waitForLobby()
		If $error Then
			$action = CheckStateAction()
			If $action == 1 Then
				ExitLoop
			ElseIf $action == 2 then
				ContinueLoop
			EndIf
		EndIf
		
		$error = startGame()	;; on démarre la game
		If $error Then
			$action = CheckStateAction()
			If $action == 1 Then
				ExitLoop
			ElseIf $action == 2 then
				ContinueLoop
			EndIf
		EndIf
		
		stopGame() ;; on leave la game une fois quelle est fini :)
	WEnd
EndFunc

Func CheckStateAction()
	$state = checkGameState()
	If $state == 1 Then
		$restartDiablo=1 ;; restart
		return 1
	ElseIf $state == 2 Then
		$error = login()
		If $error Then
			writeLog("Impossible de se connecter. Relance de diablo")
			killGame()
			$restartDiablo=1 ;; restart
			return 1
		EndIf
		preRunActions()
		return 2
	ElseIf $state == 3 Then
		return 2
	Else
		return 0
	EndIf
EndFunc

;; regarde l'état de diablo
;; 1 - jeu killed / planté et éteint (process inclus)
;; 2 - au login (déco ?)
;; 3 - dans le lobby
;; 4 - ingame
Func checkGameState()
	If Not checkGameStatus() Then
		writeLog("Jeu planté, on relance")
		killGame()
		return 1
	EndIf
	If Not checkInGame() Then ;; pas in game
		If Not checkLobbyStart() Then ;; pas dans le lobby (ou on peut choisir la quest / démarrer etc
			If Not checkLoginBtn() Then ;; pas de bouton login : on ne sait pas où on est : on kill le jeu et on relance
				writeLog("On ne sait pas où on est, on relance le bot")
				killGame()
				return 1
			Else
				writeLog("On est dans le login")
				return 2
			EndIf
		Else
			writeLog("On est dans le lobby")
			Return 3
		EndIf
	Else
		writeLog("On est in game !")
		Return 4
	EndIf
EndFunc
	
Func killGame()
	$pid = ProcessExists("Diablo III.exe")
	If $pid Then
		ProcessClose($pid)
	EndIf	
EndFunc


