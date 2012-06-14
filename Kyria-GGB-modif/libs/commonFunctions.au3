#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author: Anakha

 Description
 

#ce ----------------------------------------------------------------------------

Func writeLog($message)
	Local $date="[" & @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC & "] "
	GUICtrlSetData($gLogs, $date & $message & @CRLF & GUICtrlRead($gLogs))
EndFunc

Func startRunStat()
	$runStartTime = @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC
	$runStartTimeCalc = _NowCalc()
EndFunc	

Func endRunStat()
	$nbRun += 1
	$runTime = getGameLength()
	$runTimeList[$nbRun] = $runTime
EndFunc

Func getGameLength()
	return _DateDiff("s", $runStartTimeCalc, _NowCalc())
EndFunc

Func updateStats() 
	$tempsEcoule = _DateDiff("s", $startTimeCalc, _NowCalc())
	$hEcoule = _FormatElapsedTime($tempsEcoule)
	
	GUICtrlSetData($gHStart		, $startTime)
	GUICtrlSetData($gHEcoule	, $hEcoule) ;; timenow - starttime
	GUICtrlSetData($gNbRun		, $nbRun)
	
	$avgRunTime=0
	;; calcul du temps moyen
	If $nbRun > 0 Then
	
		For $i = 1 To $nbRun
			$avgRunTime += $runTimeList[$i]
		Next
		
		$avgRunTime /= $nbRun
	
	EndIf

	GUICtrlSetData($gAvgRunTime	, _FormatElapsedTime($avgRunTime))
EndFunc

Func diabloPrefChange()
	If not $prefChanged Then
		FileMove($prefPath,$prefPath & ".bkp",1)
		FileCopy($prefName,$prefPath,1)
		$prefChanged=1
	EndIf
EndFunc

Func diabloPrefRestore()
	If $prefChanged Then
		FileDelete($prefPath)
		FileMove($prefPath & ".bkp",$prefPath,1)
		$prefChanged = 0
	EndIf
EndFunc


Func _FormatElapsedTime($Input_Seconds)
  If $Input_Seconds < 1 Then Return
  Global $ElapsedMessage = ''
  Global $Input = $Input_Seconds
  Switch $Input_Seconds
    Case 0 To 59
      GetSeconds()
    Case 60 To 3599
      GetMinutes()
      GetSeconds()
    Case 3600 To 86399
      GetHours()
      GetMinutes()
      GetSeconds()
    Case Else
      GetDays()
      GetHours()
      GetMinutes()
      GetSeconds()
  EndSwitch
  Return $ElapsedMessage
EndFunc   ;==>FormatElapsedTime

Func GetDays()
  $Days = Int($Input / 86400)
  $Input -= ($Days * 86400)
  $ElapsedMessage &= $Days & ' j, '
  Return $ElapsedMessage
EndFunc   ;==>GetDays

Func GetHours()
  $Hours = Int($Input / 3600)
  $Input -= ($Hours * 3600)
  $ElapsedMessage &= $Hours & ' h, '
  Return $ElapsedMessage
EndFunc   ;==>GetHours

Func GetMinutes()
  $Minutes = Int($Input / 60)
  $Input -= ($Minutes * 60)
  $ElapsedMessage &= $Minutes & ' min, '
  Return $ElapsedMessage
EndFunc   ;==>GetMinutes

Func GetSeconds()
  $ElapsedMessage &= Int($Input) & ' s.'
  Return $ElapsedMessage
EndFunc   ;==>GetSeconds

;; vérifie que le jeu est bien lancé (process OK) 
;; 			que la fenetre existe
;;			et on l'active
Func checkGameStatus()
	$pid = ProcessExists("Diablo III.exe")
	If $pid <> 0 Then
		If WinExists($winName) Then
			;; on l'active au cas où
			WinActivate($winName)
			return 1
		Else
			return 0
		EndIf
	Else
		return 0
	EndIf
EndFunc