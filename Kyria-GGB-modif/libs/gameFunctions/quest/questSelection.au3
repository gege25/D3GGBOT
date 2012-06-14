;selection des quetes
Func startquest()

If $makequest=411 then
	MouseClick("left",501,259,15)
	sleep(200)
	MouseClick("left",250,287)
	sleep(200)
	MouseClick("left",501,679,15)
	sleep(200)
	MouseClick("left",250,530)
	sleep(200)
	MouseClick("left",852,784)
	sleep(1000)
Else 
MsgBox(4096, "Fail", "Cette quete n est pas dispo", 10)
EndIf	
EndFunc


