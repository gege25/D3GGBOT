#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Gui_form()

Func Gui_form ()

;#### Creation de la GUI ####

$Form1_1 = GUICreate("FormConf", 636, 479, 201, 127)
$Group1 = GUICtrlCreateGroup("accountInfo", 32, 24, 217, 105)
$login = GUICtrlCreateInput("login", 112, 48, 121, 21)
$password = GUICtrlCreateInput("password", 112, 88, 121, 21)
$L_Login = GUICtrlCreateLabel("Login :", 40, 48, 36, 17)
$L_Password = GUICtrlCreateLabel("Password :", 40, 88, 56, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("GeneraleConfig", 272, 24, 329, 161)
$I_WinName = GUICtrlCreateInput("Diablo III", 344, 56, 249, 21)
$I_GamePath = GUICtrlCreateInput("C:\Program Files (x86)\Diablo III\Diablo III.exe", 344, 96, 249, 21)
$I_PrefPath = GUICtrlCreateInput("C:\Users\<NAME>\Documents\Diablo III\D3Prefs.txt", 344, 136, 249, 21)
$L_WinName = GUICtrlCreateLabel("WinName :", 280, 56, 57, 17)
$L_GamePath = GUICtrlCreateLabel("GamePath :", 280, 96, 60, 17)
$L_PrefPath = GUICtrlCreateLabel("PrefPath :", 280, 136, 51, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$GameConfig = GUICtrlCreateGroup("GameConfig", 32, 144, 217, 281)
$I_PosChar = GUICtrlCreateInput("Position du personnage", 152, 160, 81, 21)
$L_PosChar = GUICtrlCreateLabel("Num du personnage :", 40, 160, 106, 17)
$Combo1 = GUICtrlCreateCombo("Difficulty", 120, 192, 113, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Normal|nightmare|hell|inferno")
$L_Difficult = GUICtrlCreateLabel("Difficulté :", 40, 192, 51, 17)
$I_NbRun = GUICtrlCreateInput("Nombre", 176, 224, 57, 21)
$L_NbRun = GUICtrlCreateLabel("Nb run avant de repair :", 40, 224, 116, 17)
$C_Classes = GUICtrlCreateCombo("Classes", 120, 256, 113, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Sorcier|Monk|Barbarian")
$L_Classes = GUICtrlCreateLabel("Classes :", 40, 256, 46, 17)
$L_PickItOption = GUICtrlCreateLabel("", 48, 296, 4, 4)
$L_PickItOptio = GUICtrlCreateLabel("PickItOption :", 40, 288, 68, 17)
$L_Rare = GUICtrlCreateLabel("Rare :", 40, 312, 33, 17)
$L_Magic = GUICtrlCreateLabel("Magic :", 40, 336, 39, 17)
$L_Legend = GUICtrlCreateLabel("Legend :", 40, 360, 46, 17)
$L_Set = GUICtrlCreateLabel("Set :", 40, 384, 26, 17)
$I_Rare = GUICtrlCreateInput("0,1 ou 2", 88, 312, 121, 21)
$I_Magic = GUICtrlCreateInput("0,1 ou 2", 88, 336, 121, 21)
$I_Legend = GUICtrlCreateInput("0,1 ou 2", 88, 360, 121, 21)
$I_Set = GUICtrlCreateInput("0,1 ou 2", 88, 384, 121, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("Inventaire", 272, 216, 329, 161)
$L_Inventaire = GUICtrlCreateLabel("Inventaire :", 280, 240, 57, 17)
$Line0 = GUICtrlCreateInput("0,0,0,0,0,0,0,0,0,0", 344, 240, 209, 21)
$Line1 = GUICtrlCreateInput("0,0,0,0,0,0,0,0,0,0", 344, 264, 209, 21)
$Line2 = GUICtrlCreateInput("0,0,0,0,0,0,0,0,0,0", 344, 288, 209, 21)
$Line3 = GUICtrlCreateInput("0,0,0,0,0,0,0,0,0,0", 344, 312, 209, 21)
$Line4 = GUICtrlCreateInput("0,0,0,0,0,0,0,0,0,0", 344, 336, 209, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$B_Ok = GUICtrlCreateButton("Ok", 264, 440, 99, 25)
GUISetState(@SW_SHOW)

;#### fin de la creation de la GUI ####



While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		case $B_Ok
			IniWrite ( "configs.ini", "generalConfig", "winName", GUICtrlRead($I_WinName))
			IniWrite ( "configs.ini", "generalConfig", "gameExecFullPath", GUICtrlRead($I_GamePath))
			IniWrite ( "configs.ini", "generalConfig", "prefPath", GUICtrlRead($I_PrefPath))
			IniWrite ( "configs.ini", "accountConfig", "email", GUICtrlRead($login))
			IniWrite ( "configs.ini", "accountConfig", "pass", GUICtrlRead($password))
			IniWrite ( "configs.ini", "gameConfig", "character", GUICtrlRead($I_PosChar))
			IniWrite ( "configs.ini", "gameConfig", "difficulty", GUICtrlRead($Combo1))
			IniWrite ( "configs.ini", "gameConfig", "repairSellRun", GUICtrlRead($I_NbRun))
			IniWrite ( "configs.ini", "characterConfig", "invLine0", GUICtrlRead($Line0))
			IniWrite ( "configs.ini", "characterConfig", "invLine1", GUICtrlRead($Line1))
			IniWrite ( "configs.ini", "characterConfig", "invLine2", GUICtrlRead($Line2))
			IniWrite ( "configs.ini", "characterConfig", "invLine3", GUICtrlRead($Line3))
			IniWrite ( "configs.ini", "characterConfig", "invLine4", GUICtrlRead($Line4))
			IniWrite ( "configs.ini", "characterConfig", "characterType", GUICtrlRead($C_Classes))
			IniWrite ( "configs.ini", "pickitOptions", "takeMagic", GUICtrlRead($I_Magic))
			IniWrite ( "configs.ini", "pickitOptions", "takeRare", GUICtrlRead($I_Rare))
			IniWrite ( "configs.ini", "pickitOptions", "takeLegend", GUICtrlRead($I_Legend))
			IniWrite ( "configs.ini", "pickitOptions", "takeSet", GUICtrlRead($I_Set))
			Exit
	EndSwitch
WEnd


EndFunc
