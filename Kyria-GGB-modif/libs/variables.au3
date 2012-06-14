;; misc
Global $prefName="configs/D3Prefs.txt"

;; bot status
Global $botStatus=0	;; 0=stopped, 1=running, 2=paused
Global $Paused
Global $selectDiff=0
Global $botInTown=0
Global $prefChanged=0

;; GUI objects
Global $baseTitle = "GMS Gold Bot"
Global $handlerGUI
Global $gStart
Global $gStop
Global $gEdit
Global $gHStart
Global $gHEcoule
Global $gNbRun
Global $gAvgRunTime
Global $gLogs

;; stats variable
Global $startTime				;; dateheure de lancement du bot
Global $startTimeCalc			;; dateheure pour calcul de durée
Global $runStartTime			;; dateheure du dÃ©but du run
Global $runStartTimeCalc		;; dateheure du dÃ©but du run pour calcum
Global $nbRun = 0				;; nombre de runs
Global $runTimeList[99999]		;; list des temps de chaques runs pour calculer la moyenne

;; position de l'inventaire
Global $invTop=536
Global $invLeft=800
Global $invCaseWidth=44
Global $invCaseHeight=44

;; position des fenetre de char
Global $charTop=182
Global $charLeft=216
Global $charHeight=80
Global $charSpace=3

;; position du menu de choix difficulté
Global $lvlTop=808
Global $lvlLeft=259
Global $lvlHeight=28

;; type des personnages :
Global $TYPE_SORC	= 1
Global $TYPE_MONK	= 2
Global $TYPE_DH		= 3
Global $TYPE_BARB	= 4
Global $TYPE_WD		= 5

;; error in sequence : abort game and start a new
Global $sequenceError
Global $restartDiablo=0

;; image search variable
Global $imgSearchX
Global $imgSearchY

;; images names
Global $launcherBtn 		= 'img/launcher_btn.bmp'
Global $launcherBtnHover	= 'img/launcher_btn_hover.bmp'

Global $loginBtn 			= 'img/login_btn.bmp'
Global $loginBtnActif 		= 'img/login_btn_actif.bmp'
Global $loginBtnActifHover	= 'img/login_btn_actif_hover.bmp'

Global $loginPopupAppear	= 'img/login_popup_appear.bmp'
Global $loginPopupConnect	= 'img/login_popup_connect.bmp'
Global $loginPopupVerif		= 'img/login_popup_verif.bmp'
Global $loginPopupRecup		= 'img/login_popup_recup.bmp'

Global $lobbyStart			= 'img/lobby_start.bmp'
Global $lobbyStartHover		= 'img/lobby_start_hover.bmp'
Global $lobbyPlay			= 'img/lobby_play.bmp'
Global $lobbyPlayHover		= 'img/lobby_play_hover.bmp'

Global $lobbyQuestValid		= 'img/lobby_quest_valid.bmp'

Global $gameTpIcon			= 'img/game_icon_tp.bmp'
Global $gameStash			= 'img/game_coffre.bmp'
Global $gameInventory		= 'img/game_inventaire.bmp'
Global $gameMarketRepair	= 'img/game_market_repair.bmp'
Global $gameMarketMisc		= 'img/game_market_misc.bmp'
Global $gameQuestDone		= 'img/game_quest_done.bmp'
Global $gameResBtn			= 'img/game_res_btn.bmp'
Global $gameResBtnRed		= 'img/game_res_btn_red.bmp'

;Quest
Global $start_q_4_1_1		= 4-1-1







