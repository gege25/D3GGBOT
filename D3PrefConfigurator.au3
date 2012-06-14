#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:        Anakha

 Script Description
	Configure le fichier D3Prefs.txt avec la résolution demandé.
	Les configs graphiques sont défini au minimum, le son et les sous titre sont désactivés
#ce ----------------------------------------------------------------------------

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
AutoItSetOption("GUIOnEventMode", 1)

Global $D3Pref="configs/D3Prefs.txt"
Global $D3PrefTmp="configs/D3Prefs.txt.tmp"

If Not FileExists($D3Pref) Then
	MsgBox(4096,"Erreur","Vous devez mettre votre D3Prefs.txt dans le répertoire 'configs' du bot")
	Exit
EndIf

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 145, 95, 193, 212)
$gWidth = GUICtrlCreateLabel("Largeur :", 8, 10, 46, 17)
$gHeight = GUICtrlCreateLabel("Hauteur :", 8, 34, 48, 17)
$gWidthVal = GUICtrlCreateInput("1024", 56, 8, 81, 21)
$gHeightVal = GUICtrlCreateInput("768", 56, 32, 81, 21)
$gValid = GUICtrlCreateButton("Valider", 8, 56, 131, 33)

GUICtrlSetOnEvent($gValid,"editPref")
GUISetOnEvent($GUI_EVENT_CLOSE,"close")

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func close()
	MsgBox(4096,"Fin","Le fichier D3Prefs.txt n'a pas été sauvegardée")
	Exit
EndFunc

Func editPref()
	Local $src = FileOpen($D3Pref,0)
	Local $dst = FileOpen($D3PrefTmp,2)
	
	If $src = -1 Or $dst == -1 Then
		MsgBox(4096,"Erreur", "Les fichiers "&$D3Pref&" et "&$D3Pref&" n'ont pas pu être ouvert.")
		Exit
	EndIf
	
	While 1
		Local $w=GUICtrlRead($gWidthVal)
		Local $h=GUICtrlRead($gHeightVal)
		
		Local $line = FileReadLine($src)
		If @error = -1 Then
			ExitLoop
		EndIf
		Local $info = StringSplit($line," ")
		$info[2] = StringReplace($info[2],'"',"")
		
		Switch $info[1]
			Case "DisplayModeFlags"	
				$info[2]=0
				
			Case "DisplayModeWindowMode"
				$info[2]=1

			Case "DisplayModeWinLeft"	
				$info[2]=0		
				
			Case "DisplayModeWinTop"	
				$info[2]=0	
				
			Case "DisplayModeWinWidth"	
				$info[2]=$w	
				
			Case "DisplayModeWinHeight" 
				$info[2]=$h	
				
			Case "DisplayModeUIOptWidth"
				$info[2]=$w
				
			Case "DisplayModeUIOptHeight" 
				$info[2]=$h
				
			Case "DisplayModeWidth" 	
				$info[2]=$w

			Case "DisplayModeHeight" 		
				$info[2]=$h
				
			Case "DisplayModeRefreshRate" 	
				$info[2]=60
				
			Case "DisplayModeBitDepth" 	
				$info[2]=32
				
			Case "Gamma"	
				$info[2]="1.000000"
				
			Case "MipOffset"
				$info[2]=1
									
			Case "ShadowQuality"
				$info[2]=0
				
			Case "PhysicsQuality"
				$info[2]=0
				
			Case "ClutterQuality" 
				$info[2]=0
				
			Case "Vsync" 		
				$info[2]=0
				
			Case "Letterbox" 	
				$info[2]=0
				
			Case "Antialiasing"
				$info[2]=1
				
			Case "LowFX" 		
				$info[2]=1
				
			Case "LimitForegroundFPS" 	
				$info[2]=1
				
			Case "MaxForegroundFPS" 	
				$info[2]=100
				
			Case "LimitBackgroundFPS" 	
				$info[2]=1	
				
			Case "MaxBackgroundFPS"		
				$info[2]=25	
				
			Case "DisableTrilinearFiltering" 
				$info[2]=0
				
			Case "ColorCorrection" 		
				$info[2]=1
				
			Case "MipBias" 			
				$info[2]="0.000000"
				
			Case "ReflectionQuality" 
				$info[2]=0
				
			Case "TonemapExposure" 	
				$info[2]="1.900000"
				
			Case "TonemapContrast" 	
				$info[2]="1.500000"
				
			Case "TonemapSaturation" 
				$info[2]="1.000000"
				
			Case "TonemapGain" 	
				$info[2]="1.000000"
				
			Case "HardwareClass" 
				$info[2]=4
				
			Case "MasterVolume" 
				$info[2]="0.000000"
				
			Case "EffectVolume"
				$info[2]="0.480000"
				
			Case "MusicVolume"
				$info[2]="1.000000"
				
			Case "MuteSound" 		
				$info[2]=1		
				
			Case "QuestSubtitlesEnabled"
				$info[2]=0	

			Case "HardwareClass"
				$info[2]=4
		
		EndSwitch
		
		FileWriteLine($dst,$info[1]&' "'&$info[2]&'"')
	WEnd
	
	FileClose($src)
	FileClose($dst)
	
	FileDelete($D3Pref)
	FileMove($D3PrefTmp,$D3Pref,1)
	
	MsgBox(4096,"Fin","Votre fichier configs/D3Prefs.txt a été configuré avec succès")
	Exit
EndFunc