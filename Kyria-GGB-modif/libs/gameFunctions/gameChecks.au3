#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha

 Description
	Liste des différents check (avec imagesearch) pour s'y retrouver lorsqu'on joue.
 

#ce ----------------------------------------------------------------------------


Func checkStartLauncher()
	$btn 	= _Imagesearch($launcherBtn,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	$btn2 	= _Imagesearch($launcherBtnHover,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	Return $btn Or $btn2
EndFunc
   
Func checkLoginBtn()
	$btn 	= _Imagesearch($loginBtn,1,$imgSearchX,$imgSearchY,$imgSearchTolerance) 		
	$btn2 	= _Imagesearch($loginBtnActif,1,$imgSearchX,$imgSearchY,$imgSearchTolerance) 
	$btn3	= _Imagesearch($loginBtnActifHover,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	Return $btn Or $btn2 Or $btn3
EndFunc

Func checkPopupAppear()
	Return _Imagesearch($loginPopupAppear,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func checkPopupConnected()
	Return _Imagesearch($loginPopupConnect,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func checkPopupVerif()
	Return _Imagesearch($loginPopupVerif,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func checkPopupRecup()
	Return _Imagesearch($loginPopupRecup,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc	

Func checkLobbyStart()
	$btn	= _Imagesearch($lobbyStart,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	$btn2	= _Imagesearch($lobbyStartHover,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	$btn3	= _Imagesearch($lobbyPlay,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	$btn4	= _Imagesearch($lobbyPlayHover,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	Return $btn Or $btn2 Or $btn3 Or $btn4
EndFunc
    
Func checkQuestContinue()
	Return _Imagesearch($lobbyQuestValid,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func act3CheckQuestDone()
	return _Imagesearch($gameQuestDone,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc

Func isDead()
	$btn 	= _Imagesearch($gameResBtn,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	$btn2	= _Imagesearch($gameResBtnRed,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
	return $btn Or $btn2
EndFunc

Func checkInGame()
	return _Imagesearch($gameTpIcon,1,$imgSearchX,$imgSearchY,$imgSearchTolerance)
EndFunc
