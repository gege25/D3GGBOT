#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha

 Description
	Liste des fonction pour la gestion du jeu
	On retrouve le lancement du jeu, connexion, choix de quest
	mais pas les mouvement interne a une game
	
	

#ce ----------------------------------------------------------------------------

;; Lance le launcher et attend qu'il soit lancé
Func startGameClient()
	writeLog("Démarrage du launcher")
	Run($gamePath)
	$pid = ProcessWait("Blizzard Launcher.exe",30)
	
	If $pid <> 0 Then
		sleep(2000)
		WinActivate("Diablo III") ;; c'est le launcher ! pas le jeu !
		sleep(100)
		
		$maxLoop = 0 ;; 20min au cas où une mise à jour se lance
		;while ($launcherPlayBtn <> PixelChecksum(585, 474, 734, 520)) And ($launcherPlayBtnHover <> PixelChecksum(585, 474, 734, 520)) And $maxLoop < $launcherStart 
		While not checkStartLauncher() And $maxLoop < $launcherStart 
			Sleep(1000)
			$maxLoop += 1
		WEnd
		If $maxLoop >= $launcherStart Then
			return 
		EndIf
		writeLog("Démarrage du client")
		MouseClick("left", 600, 500)
	Else
		MsgBox(4096,"Erreur","Le launcher n'a pas démarré a priori")
	EndIf
EndFunc



Func waitForGameStart()
	$pid = ProcessWait("Diablo III.exe",30)
	If $pid <> 0 Then
		;writeLog('Debug: process OK')
		;; on attend que la windows diabloIII apparaisse
		WinWait($winName)
		;writeLog('Debug: fenetre OK')
		
		;; on l'active au cas où
		WinActivate($winName)
		
		$maxLoop = 0 ;; 2min
		
		While Not checkLoginBtn() And $maxLoop <= $gameStart
			;writeLog('Debug: Loop.. '&$maxLoop)
			;writeLog("Debug: "&$connexionBtn&" = " &$connexionBtnRedHover& " = " &$connexionBtnRed& " == " &PixelChecksum(490,767,775,790))
			sleep(1000)
			$maxLoop += 1
		WEnd 
		If $maxLoop >= $gameStart Then
			return 1
		Else
			return 0
		EndIf
	Else
		return 1
	EndIf
EndFunc


Func login()
	writeLog("Identification à battle.net")
	MouseClick("left",673,544,1,5)
	sleep(100)
	send("^{a}")
	sleep(200)
	send("{BACKSPACE}")
	sleep(500)
	send($accountName)
	sleep(500)
	send("{TAB}")
	sleep(200)
	
	$btnMaxAttempted=0
	While checkLoginBtn() And checkGameStatus()
		
		;; si on ne trouve plus el bouton connexion (et qu'on est pas entré dans le connect)
		;; on quitte la fonction et on renvoie 1 (error)
		writeLog("Tentative de connexion")
		if $btnMaxAttempted >= 100 Then
			return 1
		EndIf
		
		If Not checkLoginBtn() Then
			sleep(100)
			$btnMaxAttempted += 1
			ContinueLoop
		EndIf
		
		
		send($accountPass)
		sleep(100)
		send("{ENTER}")		;; valid le formulaire
		sleep(500)
		
		;; on check si les popup avec les check sont présents
		While checkPopupAppear()
			sleep(100)
		WEnd
		While checkPopupConnected()
			sleep(100)
		WEnd
		While checkPopupVerif()
			sleep(100)
		WEnd
		;; si on entre là, on est forcément connecté
		If checkPopupRecup() Then
			writeLog("Connecté à battle.net !")
			Return 0
		EndIf
		
		sleep(1000)
		send("{ENTER}")		;; on ferme le popup d'erreur (s'il y en a)
	WEnd
	return 1
EndFunc

Func waitForLobby()
	Local $maxLoop = 0 ;; 2min
	
	While Not checkLobbyStart() And $maxLoop <= $lobbyTimeout And checkGameStatus()
		sleep(1000)
		$maxLoop += 1
	WEnd 
	
	If $maxLoop >= $lobbyTimeout Or Not checkGameStatus() Then
		return 1
	Else
		return 0
	EndIf
EndFunc

Func selectQuest()
	writeLog("Sélection de la quest")
	MouseClick("left",213,440)
	sleep(500)
	If $selectDiff == 0 Then
		MouseClick("left",473,783)
		sleep(200)
		$diffClickTop=$lvlTop+$lvlHeight*(1/2+$difficulty-1)
		MouseClick("left",$lvlLeft,$diffClickTop)
		sleep(200)
		$selectDiff=1
	EndIf
	startQuest()
	;MouseClick("left",501,259,15)
	;sleep(200)
	;MouseClick("left",250,287)
	;sleep(200)
	;MouseClick("left",501,679,15)
	;sleep(200)
	;MouseClick("left",250,530)
	;sleep(200)
	;MouseClick("left",852,784)
	;sleep(1000)
	
	If checkQuestContinue() Then
		MouseClick("left", 527,572)
		sleep(500)
	EndIf
EndFunc


Func selectChar()
	writeLog("Sélection du personnage")
	MouseClick("left",623,876)
	sleep(500)
	$charPosition=$charTop+$charHeight/2+($charHeight+$charSpace)*($character-1)
	MouseClick("left",$charLeft,$charPosition)
	sleep(500)
	MouseClick("left",627,873)
EndFunc


Func startGame()
	writeLog("Démarrage du run")
	startRunStat()
	updateStats()
	MouseClick("left",150,380)
	sleep(200)
	Return loadGame()
EndFunc

Func stopGame()
	leaveGame()
	endRunStat()
	updateStats() 
	writeLog("Fin de la game après "& _FormatElapsedTime($runTimeList[$nbRun]))
EndFunc

Func leaveChannel()
	MouseClick("left",46,789)
	sleep(500)
	MouseClick("left",147,865)
	sleep(500)
EndFunc