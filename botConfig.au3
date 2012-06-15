#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
Global $Form1_1 = GUICreate("FormConf", 511, 548, 275, 170)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1_1Close")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "Form1_1Minimize")
GUISetOnEvent($GUI_EVENT_MAXIMIZE, "Form1_1Maximize")
GUISetOnEvent($GUI_EVENT_RESTORE, "Form1_1Restore")
Global $Group1 = GUICtrlCreateGroup("Account", 8, 8, 209, 81)
Global $login = GUICtrlCreateInput("login", 80, 24, 129, 21)
GUICtrlSetOnEvent(-1, "loginChange")
Global $password = GUICtrlCreateInput("password", 80, 56, 129, 21)
GUICtrlSetOnEvent(-1, "passwordChange")
Global $L_Login = GUICtrlCreateLabel("Login", 16, 28, 60, 17)
GUICtrlSetOnEvent(-1, "L_LoginClick")
Global $Label1 = GUICtrlCreateLabel("Password", 17, 59, 60, 17)
GUICtrlSetOnEvent(-1, "Label1Click")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Group2 = GUICtrlCreateGroup("General Config", 232, 8, 249, 113)
Global $I_WinName = GUICtrlCreateInput("Diablo III", 304, 24, 169, 21)
GUICtrlSetOnEvent(-1, "I_WinNameChange")
Global $I_GamePath = GUICtrlCreateInput("C:\Program \Diablo III\Diablo III.exe", 304, 56, 145, 21)
GUICtrlSetOnEvent(-1, "I_GamePathChange")
Global $I_PrefPath = GUICtrlCreateInput("C:\Users\<NAME>\Documents\Diablo III\D3Prefs.txt", 304, 88, 145, 21)
GUICtrlSetOnEvent(-1, "I_PrefPathChange")
Global $L_WinName = GUICtrlCreateLabel("Win. Name", 240, 28, 60, 17)
GUICtrlSetOnEvent(-1, "L_WinNameClick")
Global $L_GamePath = GUICtrlCreateLabel("GamePath :", 240, 59, 60, 17)
GUICtrlSetOnEvent(-1, "L_GamePathClick")
Global $L_PrefPath = GUICtrlCreateLabel("PrefPath", 240, 91, 60, 17)
GUICtrlSetOnEvent(-1, "L_PrefPathClick")
Global $findD3Exe = GUICtrlCreateButton("...", 452, 56, 21, 20)
GUICtrlSetOnEvent(-1, "findD3ExeClick")
Global $Button1 = GUICtrlCreateButton("...", 452, 88, 21, 20)
GUICtrlSetOnEvent(-1, "Button1Click")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $GameConfig = GUICtrlCreateGroup("Game Configs", 232, 144, 249, 145)
Global $L_PosChar = GUICtrlCreateLabel("Position du Personnage", 240, 163, 115, 17)
GUICtrlSetOnEvent(-1, "L_PosCharClick")
Global $Combo1 = GUICtrlCreateCombo("", 360, 224, 113, 25)
GUICtrlSetData(-1, "Normal|Nightmare|Hell|Inferno")
GUICtrlSetOnEvent(-1, "Combo1Change")
Global $L_Difficult = GUICtrlCreateLabel("Difficulté :", 240, 227, 115, 17)
GUICtrlSetOnEvent(-1, "L_DifficultClick")
Global $I_NbRun = GUICtrlCreateInput("10", 360, 256, 25, 21)
GUICtrlSetOnEvent(-1, "I_NbRunChange")
Global $L_NbRun = GUICtrlCreateLabel("Nb. run avant de repair", 240, 259, 115, 17)
GUICtrlSetOnEvent(-1, "L_NbRunClick")
Global $C_Classes = GUICtrlCreateCombo("", 360, 192, 113, 25)
GUICtrlSetData(-1, "Sorcier|Monk|Demon Hunter|Barbarian|Witch Doctor")
GUICtrlSetOnEvent(-1, "C_ClassesChange")
Global $L_Classes = GUICtrlCreateLabel("Classes :", 240, 195, 115, 17)
GUICtrlSetOnEvent(-1, "L_ClassesClick")
Global $L_PickItOption = GUICtrlCreateLabel("", 248, 296, 4, 4)
GUICtrlSetOnEvent(-1, "L_PickItOptionClick")
Global $Combo2 = GUICtrlCreateCombo("", 360, 160, 33, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "1|2|3|4|5|6|7")
GUICtrlSetOnEvent(-1, "Combo2Change")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Group3 = GUICtrlCreateGroup("Inventaire", 8, 104, 209, 185)
Global $Label2 = GUICtrlCreateLabel("Cochez les positions de l'inventaire où se trouvent des items qui ne doivent pas être vendu", 18, 125, 189, 50, $SS_CENTER)
GUICtrlSetOnEvent(-1, "Label2Click")
Global $Checkbox15 = GUICtrlCreateCheckbox("", 49, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox15Click")
Global $Checkbox16 = GUICtrlCreateCheckbox("", 65, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox16Click")
Global $Checkbox17 = GUICtrlCreateCheckbox("", 81, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox17Click")
Global $Checkbox18 = GUICtrlCreateCheckbox("", 81, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox18Click")
Global $Checkbox19 = GUICtrlCreateCheckbox("", 65, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox19Click")
Global $Checkbox20 = GUICtrlCreateCheckbox("", 65, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox20Click")
Global $Checkbox21 = GUICtrlCreateCheckbox("", 81, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox21Click")
Global $Checkbox23 = GUICtrlCreateCheckbox("", 97, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox23Click")
Global $Checkbox24 = GUICtrlCreateCheckbox("", 97, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox24Click")
Global $Checkbox25 = GUICtrlCreateCheckbox("", 97, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox25Click")
Global $Checkbox26 = GUICtrlCreateCheckbox("", 113, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox26Click")
Global $Checkbox27 = GUICtrlCreateCheckbox("", 113, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox27Click")
Global $Checkbox28 = GUICtrlCreateCheckbox("", 113, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox28Click")
Global $Checkbox29 = GUICtrlCreateCheckbox("", 129, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox29Click")
Global $Checkbox30 = GUICtrlCreateCheckbox("", 129, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox30Click")
Global $Checkbox31 = GUICtrlCreateCheckbox("", 129, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox31Click")
Global $Checkbox32 = GUICtrlCreateCheckbox("", 145, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox32Click")
Global $Checkbox33 = GUICtrlCreateCheckbox("", 145, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox33Click")
Global $Checkbox35 = GUICtrlCreateCheckbox("", 145, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox35Click")
Global $Checkbox36 = GUICtrlCreateCheckbox("", 161, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox36Click")
Global $Checkbox37 = GUICtrlCreateCheckbox("", 161, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox37Click")
Global $Checkbox38 = GUICtrlCreateCheckbox("", 65, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox38Click")
Global $Checkbox39 = GUICtrlCreateCheckbox("", 81, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox39Click")
Global $Checkbox40 = GUICtrlCreateCheckbox("", 97, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox40Click")
Global $Checkbox41 = GUICtrlCreateCheckbox("", 113, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox41Click")
Global $Checkbox42 = GUICtrlCreateCheckbox("", 129, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox42Click")
Global $Checkbox43 = GUICtrlCreateCheckbox("", 161, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox43Click")
Global $Checkbox44 = GUICtrlCreateCheckbox("", 145, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox44Click")
Global $Checkbox45 = GUICtrlCreateCheckbox("", 161, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox45Click")
Global $Checkbox46 = GUICtrlCreateCheckbox("", 81, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox46Click")
Global $Checkbox47 = GUICtrlCreateCheckbox("", 97, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox47Click")
Global $Checkbox48 = GUICtrlCreateCheckbox("", 113, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox48Click")
Global $Checkbox1 = GUICtrlCreateCheckbox("", 129, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox1Click")
Global $Checkbox12 = GUICtrlCreateCheckbox("", 145, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox12Click")
Global $Checkbox22 = GUICtrlCreateCheckbox("", 177, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox22Click")
Global $Checkbox49 = GUICtrlCreateCheckbox("", 177, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox49Click")
Global $Checkbox50 = GUICtrlCreateCheckbox("", 177, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox50Click")
Global $Checkbox51 = GUICtrlCreateCheckbox("", 177, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox51Click")
Global $Checkbox52 = GUICtrlCreateCheckbox("", 33, 260, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox52Click")
Global $Checkbox53 = GUICtrlCreateCheckbox("", 33, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox53Click")
Global $Checkbox54 = GUICtrlCreateCheckbox("", 33, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox54Click")
Global $Checkbox55 = GUICtrlCreateCheckbox("", 33, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox55Click")
Global $Checkbox56 = GUICtrlCreateCheckbox("", 49, 244, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox56Click")
Global $Checkbox57 = GUICtrlCreateCheckbox("", 49, 228, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox57Click")
Global $Checkbox59 = GUICtrlCreateCheckbox("", 49, 212, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox59Click")
Global $Checkbox60 = GUICtrlCreateCheckbox("", 161, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox60Click")
Global $Checkbox61 = GUICtrlCreateCheckbox("", 177, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox61Click")
Global $Checkbox62 = GUICtrlCreateCheckbox("", 65, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox62Click")
Global $Checkbox63 = GUICtrlCreateCheckbox("", 49, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox63Click")
Global $Checkbox64 = GUICtrlCreateCheckbox("", 33, 196, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox64Click")
Global $Checkbox65 = GUICtrlCreateCheckbox("", 177, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox65Click")
Global $Checkbox66 = GUICtrlCreateCheckbox("", 161, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox66Click")
Global $Checkbox67 = GUICtrlCreateCheckbox("", 145, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox67Click")
Global $Checkbox68 = GUICtrlCreateCheckbox("", 129, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox68Click")
Global $Checkbox69 = GUICtrlCreateCheckbox("", 113, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox69Click")
Global $Checkbox70 = GUICtrlCreateCheckbox("", 97, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox70Click")
Global $Checkbox71 = GUICtrlCreateCheckbox("", 81, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox71Click")
Global $Checkbox72 = GUICtrlCreateCheckbox("", 65, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox72Click")
Global $Checkbox73 = GUICtrlCreateCheckbox("", 49, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox73Click")
Global $Checkbox74 = GUICtrlCreateCheckbox("", 33, 180, 15, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetOnEvent(-1, "Checkbox74Click")
Global $Checkbox58 = GUICtrlCreateCheckbox("", -15, 252, 15, 17)
GUICtrlSetOnEvent(-1, "Checkbox58Click")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Button2 = GUICtrlCreateButton("Sauvegarder", 248, 390, 235, 63)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
GUICtrlSetOnEvent(-1, "Button2Click")
Global $Button3 = GUICtrlCreateButton("Annuler", 248, 470, 235, 63)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
GUICtrlSetOnEvent(-1, "Button3Click")
Global $shortcut = GUICtrlCreateGroup("Raccourcis", 8, 298, 473, 74)
Global $skill1 = GUICtrlCreateInput("1", 109, 316, 50, 21)
GUICtrlSetOnEvent(-1, "skill1Change")
Global $Label7 = GUICtrlCreateLabel("Raccourci Skill 1", 21, 320, 84, 17)
GUICtrlSetOnEvent(-1, "Label7Click")
Global $Input1 = GUICtrlCreateInput("2", 109, 340, 50, 21)
GUICtrlSetOnEvent(-1, "Input1Change")
Global $Label3 = GUICtrlCreateLabel("Raccourci Skill 2", 21, 344, 84, 17)
GUICtrlSetOnEvent(-1, "Label3Click")
Global $Input2 = GUICtrlCreateInput("3", 267, 316, 50, 21)
GUICtrlSetOnEvent(-1, "Input2Change")
Global $Label4 = GUICtrlCreateLabel("Raccourci Skill 3", 179, 320, 84, 17)
GUICtrlSetOnEvent(-1, "Label4Click")
Global $Input3 = GUICtrlCreateInput("4", 267, 340, 50, 21)
GUICtrlSetOnEvent(-1, "Input3Change")
Global $Label5 = GUICtrlCreateLabel("Raccourci Skill 4", 179, 344, 84, 17)
GUICtrlSetOnEvent(-1, "Label5Click")
Global $Input4 = GUICtrlCreateInput("Q", 421, 316, 50, 21)
GUICtrlSetOnEvent(-1, "Input4Change")
Global $Label6 = GUICtrlCreateLabel("Boire une potion", 333, 320, 81, 17)
GUICtrlSetOnEvent(-1, "Label6Click")
Global $Input5 = GUICtrlCreateInput("SPACE", 421, 340, 50, 21)
GUICtrlSetOnEvent(-1, "Input5Change")
Global $Label8 = GUICtrlCreateLabel("Passer discussion", 333, 344, 88, 17)
GUICtrlSetOnEvent(-1, "Label8Click")
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Group4 = GUICtrlCreateGroup("Pickit", 10, 382, 225, 155)
Global $Label9 = GUICtrlCreateLabel("Ramasser", 100, 400, 51, 17)
GUICtrlSetOnEvent(-1, "Label9Click")
Global $Label10 = GUICtrlCreateLabel("Stoquer", 170, 400, 41, 17)
GUICtrlSetOnEvent(-1, "Label10Click")
Global $Label11 = GUICtrlCreateLabel("Magic", 20, 420, 33, 17)
GUICtrlSetOnEvent(-1, "Label11Click")
Global $Label12 = GUICtrlCreateLabel("Rare", 20, 450, 27, 17)
GUICtrlSetOnEvent(-1, "Label12Click")
Global $Label13 = GUICtrlCreateLabel("Legendaire", 20, 480, 57, 17)
GUICtrlSetOnEvent(-1, "Label13Click")
Global $Label14 = GUICtrlCreateLabel("Sets", 20, 510, 25, 17)
GUICtrlSetOnEvent(-1, "Label14Click")
Global $Checkbox2 = GUICtrlCreateCheckbox("", 110, 420, 17, 17)
GUICtrlSetOnEvent(-1, "Checkbox2Click")
Global $Checkbox3 = GUICtrlCreateCheckbox("", 180, 420, 17, 17)
GUICtrlSetOnEvent(-1, "Checkbox3Click")
Global $Checkbox4 = GUICtrlCreateCheckbox("", 110, 450, 17, 17)
GUICtrlSetOnEvent(-1, "Checkbox4Click")
Global $Checkbox5 = GUICtrlCreateCheckbox("", 180, 450, 17, 17)
GUICtrlSetOnEvent(-1, "Checkbox5Click")
Global $Checkbox6 = GUICtrlCreateCheckbox("", 110, 480, 17, 17)
GUICtrlSetOnEvent(-1, "Checkbox6Click")
Global $Checkbox7 = GUICtrlCreateCheckbox("", 110, 510, 17, 17)
GUICtrlSetOnEvent(-1, "Checkbox7Click")
Global $Checkbox8 = GUICtrlCreateCheckbox("", 180, 480, 17, 17)
GUICtrlSetOnEvent(-1, "Checkbox8Click")
Global $Checkbox9 = GUICtrlCreateCheckbox("", 180, 510, 17, 17)
GUICtrlSetOnEvent(-1, "Checkbox9Click")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func Button1Click()

EndFunc
Func Button2Click()

EndFunc
Func Button3Click()

EndFunc
Func C_ClassesChange()

EndFunc
Func Checkbox12Click()

EndFunc
Func Checkbox15Click()

EndFunc
Func Checkbox16Click()

EndFunc
Func Checkbox17Click()

EndFunc
Func Checkbox18Click()

EndFunc
Func Checkbox19Click()

EndFunc
Func Checkbox1Click()

EndFunc
Func Checkbox20Click()

EndFunc
Func Checkbox21Click()

EndFunc
Func Checkbox22Click()

EndFunc
Func Checkbox23Click()

EndFunc
Func Checkbox24Click()

EndFunc
Func Checkbox25Click()

EndFunc
Func Checkbox26Click()

EndFunc
Func Checkbox27Click()

EndFunc
Func Checkbox28Click()

EndFunc
Func Checkbox29Click()

EndFunc
Func Checkbox2Click()

EndFunc
Func Checkbox30Click()

EndFunc
Func Checkbox31Click()

EndFunc
Func Checkbox32Click()

EndFunc
Func Checkbox33Click()

EndFunc
Func Checkbox35Click()

EndFunc
Func Checkbox36Click()

EndFunc
Func Checkbox37Click()

EndFunc
Func Checkbox38Click()

EndFunc
Func Checkbox39Click()

EndFunc
Func Checkbox3Click()

EndFunc
Func Checkbox40Click()

EndFunc
Func Checkbox41Click()

EndFunc
Func Checkbox42Click()

EndFunc
Func Checkbox43Click()

EndFunc
Func Checkbox44Click()

EndFunc
Func Checkbox45Click()

EndFunc
Func Checkbox46Click()

EndFunc
Func Checkbox47Click()

EndFunc
Func Checkbox48Click()

EndFunc
Func Checkbox49Click()

EndFunc
Func Checkbox4Click()

EndFunc
Func Checkbox50Click()

EndFunc
Func Checkbox51Click()

EndFunc
Func Checkbox52Click()

EndFunc
Func Checkbox53Click()

EndFunc
Func Checkbox54Click()

EndFunc
Func Checkbox55Click()

EndFunc
Func Checkbox56Click()

EndFunc
Func Checkbox57Click()

EndFunc
Func Checkbox58Click()

EndFunc
Func Checkbox59Click()

EndFunc
Func Checkbox5Click()

EndFunc
Func Checkbox60Click()

EndFunc
Func Checkbox61Click()

EndFunc
Func Checkbox62Click()

EndFunc
Func Checkbox63Click()

EndFunc
Func Checkbox64Click()

EndFunc
Func Checkbox65Click()

EndFunc
Func Checkbox66Click()

EndFunc
Func Checkbox67Click()

EndFunc
Func Checkbox68Click()

EndFunc
Func Checkbox69Click()

EndFunc
Func Checkbox6Click()

EndFunc
Func Checkbox70Click()

EndFunc
Func Checkbox71Click()

EndFunc
Func Checkbox72Click()

EndFunc
Func Checkbox73Click()

EndFunc
Func Checkbox74Click()

EndFunc
Func Checkbox7Click()

EndFunc
Func Checkbox8Click()

EndFunc
Func Checkbox9Click()

EndFunc
Func Combo1Change()

EndFunc
Func Combo2Change()

EndFunc
Func findD3ExeClick()

EndFunc
Func Form1_1Close()

EndFunc
Func Form1_1Maximize()

EndFunc
Func Form1_1Minimize()

EndFunc
Func Form1_1Restore()

EndFunc
Func I_GamePathChange()

EndFunc
Func I_NbRunChange()

EndFunc
Func I_PrefPathChange()

EndFunc
Func I_WinNameChange()

EndFunc
Func Input1Change()

EndFunc
Func Input2Change()

EndFunc
Func Input3Change()

EndFunc
Func Input4Change()

EndFunc
Func Input5Change()

EndFunc
Func L_ClassesClick()

EndFunc
Func L_DifficultClick()

EndFunc
Func L_GamePathClick()

EndFunc
Func L_LoginClick()

EndFunc
Func L_NbRunClick()

EndFunc
Func L_PickItOptionClick()

EndFunc
Func L_PosCharClick()

EndFunc
Func L_PrefPathClick()

EndFunc
Func L_WinNameClick()

EndFunc
Func Label10Click()

EndFunc
Func Label11Click()

EndFunc
Func Label12Click()

EndFunc
Func Label13Click()

EndFunc
Func Label14Click()

EndFunc
Func Label1Click()

EndFunc
Func Label2Click()

EndFunc
Func Label3Click()

EndFunc
Func Label4Click()

EndFunc
Func Label5Click()

EndFunc
Func Label6Click()

EndFunc
Func Label7Click()

EndFunc
Func Label8Click()

EndFunc
Func Label9Click()

EndFunc
Func loginChange()

EndFunc
Func passwordChange()

EndFunc
Func skill1Change()

EndFunc
