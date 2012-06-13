#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

AutoItSetOption("MouseCoordMode",2)
AutoItSetOption("PixelCoordMode",2)    

Global $imgSearchTolerance = 0

#include "au3udf/ImageSearch.au3"
#include "libs/variables.au3"
#include "libs/gameFunctions/gameChecks.au3"

HotKeySet("{PAUSE}","startTest")
HotKeySet("{DEL}","stopTest")

MsgBox(4096,"Tolérance checkout","Avec ce script vous pourrez tester la tolérance d'image requise pour le bot selon votre config PC"&@crlf & @crlf &"Appuyez sur PAUSE pour démarrer le test, DEL pour stopper le test")

while 1
	sleep(100)
WEnd

func stopTest()
	Exit
EndFunc

func checkTolerance()
	If $imgSearchTolerance > 100 Then
		MsgBox(4096,"Erreur","Aucune tolérance trouvée possible. Vous devez faire vos propres screenshot"&@CRLF&"FIN du script")
		Exit
	EndIf
EndFunc

func startTest()
	MsgBox(4096,"Etape 1/4","Lancer le launcher Diablo III, attendez le chargement (NE CLIQUEZ PAS SUR JOUER). Une fois chargé, fermer cette fenêtre, et cliquez sur le launcher pour rendre la fenêtre active")
	WinActivate("Diablo III")
	WinWaitActive("Diablo III")
	while $imgSearchTolerance <= 100 And Not checkStartLauncher()
		$imgSearchTolerance += 1
	WEnd
	checkTolerance()
	
	MsgBox(4096,"Etape 2/4","Lancer le jeu, attendez d'être sur le login, puis fermer cette fenêtre. Cliquez sur la fenêtre Diablo III pour rendre la fenêtre active")
	WinActivate("Diablo III")
	WinWaitActive("Diablo III")	
	while $imgSearchTolerance <= 100 And Not checkLoginBtn()
		$imgSearchTolerance += 1
	WEnd
	checkTolerance()
	
	MsgBox(4096,"Etape 3/4","Connectez vous à battle.net et restez dans l'écran où les boutons 'choix de personnage', 'changer de quest' et 'jouer' se trouvent. Une fois que vous y êtes, fermez la fenêtre. Cliquez sur la fenêtre Diablo III pour rendre la fenêtre active")
	WinActivate("Diablo III")
	WinWaitActive("Diablo III")
	while $imgSearchTolerance <= 100 And Not checkLobbyStart()
		$imgSearchTolerance += 1
	WEnd
	checkTolerance()
	
	MsgBox(4096,"Etape 4/4","Entrez dans une partie (peu importe la quête). Une fois que vous y êtes, fermez la fenêtre. Cliquez sur la fenêtre Diablo III pour rendre la fenêtre active")
	WinActivate("Diablo III")
	WinWaitActive("Diablo III")
	while $imgSearchTolerance <= 100 And Not checkInGame()
		$imgSearchTolerance += 1
	WEnd
	checkTolerance()
	
	IniWrite("configs/configs.ini","imagesearch","tolerance",$imgSearchTolerance+5)
	MsgBox(4096,"FIN","La configuration est terminée avec succès. Votre tolérance est de "&$imgSearchTolerance&"."&@CRLF&"Il est conseiller d'utiliser "&$imgSearchTolerance+5&" au minimum dans la tolérance."&@CRLF&@CRLF&"Le fichier de configuration a été modifié pour la tolérance.")
	stopTest()
EndFunc