








-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** functions loaded ***");
	end
	end
end)

-- -------------

-- This code is ripped from the ingameadmin mod
function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

-- -------------

function reboot(player)
	ChatManager:SendMessage("rebooting the server")
			  print("Rebooting the server");
	RCON:SendCommand('admin.shutDown')
end

-- -------------

function reboot_timer(player)
	if trigger_nuke == false then
	print ("Starting the nuke timer for team 1")
	ChatManager:SendMessage("Starting the nuke timer for team 1")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Reboot"
	timer_msg_2 = "Reboot"
	nuketype_reboot = true

	else print ("Reboot countdown already started") 
	ChatManager:SendMessage("Reboot countdown already started")
	end
end

-- -------------

function nuke_all(player)
	if trigger_nuke == false then
	print ("Starting the global nuke timer")
	ChatManager:SendMessage("Starting the global nuke timer")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "global nuke"
	nuketype_all = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end
end

function exterminate(player)
			 print ("!!!!!! SERVER WIDE EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! SERVER WIDE EXTERMINATE !!!!!!")

	for _, targetplayer in pairs(fetchplayername) do
		print ("NUKE 'ALL':"..targetplayer.." got killed")
		RCON:SendCommand('admin.killPlayer', {targetplayer})
		end
	targetplayer = nil
	name = nil
	nuketype_all = false

	ChatManager:SendMessage("A Admin droped a nuke in the server")

end -- end of function call

-- -------------

function nuke_us(player)
    checkgamemode()
    if foundgamemode == true then

	if trigger_nuke == false then
	print ("Starting the nuke timer for team US")
	ChatManager:SendMessage("Starting the nuke timer for team US")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "US nuke"
	nuketype_us = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end

    else
    if foundgamemode == false then
	                 print (".Nuke us will not work")
	ChatManager:SendMessage(".Nuke us will not work")
end
end
end

function exterminate_us(player)
			 print ("!!!!!! TEAM US EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! TEAM US EXTERMINATE !!!!!!")

	for _, targetplayer in pairs(fetchplayerteam1) do
		print ("NUKE TEAM US:"..targetplayer.." got killed")
		RCON:SendCommand('admin.killPlayer', {targetplayer})
		end
	targetplayer = nil
	name = nil
	nuketype_us = false

	ChatManager:SendMessage("A Admin droped a nuke on team US")

end -- end of function call

-- -------------

function nuke_ru(player)
    checkgamemode()
    if foundgamemode == true then

	if trigger_nuke == false then
	print ("Starting the nuke timer for team RU")
	ChatManager:SendMessage("Starting the nuke timer for team RU")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "RU nuke"
	nuketype_ru = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end

else
    if foundgamemode == false then
	                 print (".nuke ru will not work")
	ChatManager:SendMessage(".nuke ru will not work")

end
end
end

function exterminate_ru(player)
			 print ("!!!!!! team RU EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! team RU EXTERMINATE !!!!!!")

	for _, targetplayer in pairs(fetchplayerteam2) do
		print ("NUKE team RU:"..targetplayer.." got killed")
		RCON:SendCommand('admin.killPlayer', {targetplayer})
		end
	targetplayer = nil
	name = nil
	nuketype_ru = false

	ChatManager:SendMessage("A Admin droped a nuke on team RU")

end -- end of function call

-- -------------

function nuke_alpha(player)
    checkgamemode_sqdm()
    if foundgamemode == true then

	if trigger_nuke == false then
	print ("Starting the nuke timer for team alpha")
	ChatManager:SendMessage("Starting the nuke timer for team alpha")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "alpha nuke"
	nuketype_alpha = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end

else
    if foundgamemode == false then
	                 print (".nuke alpha will not work")
	ChatManager:SendMessage(".nuke alpha will not work")

end
end
end

function exterminate_alpha(player)
			 print ("!!!!!! TEAM alpha EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! TEAM alpha EXTERMINATE !!!!!!")

	for name, targetplayer in pairs(fetchplayerteam1) do
		print ("NUKE TEAM alpha:"..name.." got killed")
		RCON:SendCommand('admin.killPlayer', {name})
		end
	targetplayer = nil
	name = nil
	nuketype_alpha = false

	ChatManager:SendMessage("A Admin droped a nuke on team alpha")

end -- end of function call

-- -------------

function nuke_bravo(player)
    checkgamemode_sqdm()
    if foundgamemode == true then

	if trigger_nuke == false then
	print ("Starting the nuke timer for team bravo")
	ChatManager:SendMessage("Starting the nuke timer for team bravo")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "bravo nuke"
	nuketype_bravo = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end

else
    if foundgamemode == false then
	                 print (".nuke bravo will not work")
	ChatManager:SendMessage(".nuke bravo will not work")

end
end
end

function exterminate_bravo(player)
			 print ("!!!!!! TEAM bravo EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! TEAM bravo EXTERMINATE !!!!!!")

	for name, targetplayer in pairs(fetchplayerteam2) do
		print ("NUKE TEAM bravo:"..name.." got killed")
		RCON:SendCommand('admin.killPlayer', {name})
		end
	targetplayer = nil
	name = nil
	nuketype_bravo = false

	ChatManager:SendMessage("A Admin droped a nuke on team bravo")

end -- end of function call

-- -------------

function nuke_charlie(player)
    checkgamemode_sqdm()
    if foundgamemode == true then

	if trigger_nuke == false then
	print ("Starting the nuke timer for team charlie")
	ChatManager:SendMessage("Starting the nuke timer for team charlie")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "charlie nuke"
	nuketype_charlie = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end

else
    if foundgamemode == false then
	                 print (".nuke charlie will not work")
	ChatManager:SendMessage(".nuke charlie will not work")

end
end
end

function exterminate_charlie(player)
			 print ("!!!!!! TEAM charlie EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! TEAM charlie EXTERMINATE !!!!!!")

	for name, targetplayer in pairs(fetchplayerteam3) do
		print ("NUKE TEAM charlie:"..name.." got killed")
		RCON:SendCommand('admin.killPlayer', {name})
		end
	targetplayer = nil
	name = nil
	nuketype_charlie = false

	ChatManager:SendMessage("A Admin droped a nuke on team charlie")

end -- end of function call

-- -------------

function nuke_delta(player)
    checkgamemode_sqdm()
    if foundgamemode == true then

	if trigger_nuke == false then
	print ("Starting the nuke timer for team delta")
	ChatManager:SendMessage("Starting the nuke timer for team delta")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "delta nuke"
	nuketype_delta = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end

else
    if foundgamemode == false then
	                 print (".nuke delta will not work")
	ChatManager:SendMessage(".nuke delta will not work")

end
end
end

function exterminate_delta(player)
			 print ("!!!!!! TEAM delta EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! TEAM delta EXTERMINATE !!!!!!")

	for name, targetplayer in pairs(fetchplayerteam4) do
		print ("NUKE TEAM delta:"..name.." got killed")
		RCON:SendCommand('admin.killPlayer', {name})
		end
	targetplayer = nil
	name = nil
	nuketype_delta = false

	ChatManager:SendMessage("A Admin droped a nuke on team delta")

end -- end of function call

-- -------------

function nuke_atackers(player)
    checkgamemode_rush()
    if foundgamemode == true then

	if trigger_nuke == false then
	print ("Starting the nuke timer for rush team atackers")
	ChatManager:SendMessage("Starting the nuke timer for rush team atackers")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "atackers nuke"
	nuketype_atackers = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end

else
    if foundgamemode == false then
	                 print (".nuke atackers will not work")
	ChatManager:SendMessage(".nuke atackers will not work")

end
end
end

function exterminate_atackers(player)
			 print ("!!!!!! TEAM atackers EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! TEAM atackers EXTERMINATE !!!!!!")

	for name, targetplayer in pairs(fetchplayerteam1) do
		print ("NUKE RUSH TEAM atackers:"..name.." got killed")
		RCON:SendCommand('admin.killPlayer', {name})
		end
	targetplayer = nil
	name = nil
	nuketype_atackers = false

	ChatManager:SendMessage("A Admin droped a nuke on rush team atackers")

end -- end of function call

-- -------------

function nuke_defenders(player)
    checkgamemode_rush()
    if foundgamemode == true then

	if trigger_nuke == false then
	print ("Starting the nuke timer for rush team defenders")
	ChatManager:SendMessage("Starting the nuke timer for rush team defenders")
	print ("Setting the timer data") 
	nuke_countdown = 10
	start_nuke_timer_all = true
	trigger_nuke = true
	timer_msg_1 = "Nuke"
	timer_msg_2 = "defenders nuke"
	nuketype_defenders = true

	else print ("Nuke countdown already started") 
	ChatManager:SendMessage("Nuke countdown already started")
	end

else
    if foundgamemode == false then
	                 print (".nuke defenders will not work")
	ChatManager:SendMessage(".nuke defenders will not work")

end
end
end

function exterminate_defenders(player)
			 print ("!!!!!! TEAM defenders EXTERMINATE !!!!!!")
	ChatManager:SendMessage("!!!!!! TEAM defenders EXTERMINATE !!!!!!")

	for name, targetplayer in pairs(fetchplayerteam2) do
		print ("NUKE RUSH TEAM defenders:"..name.." got killed")
		RCON:SendCommand('admin.killPlayer', {name})
		end
	targetplayer = nil
	name = nil
	nuketype_defenders = false

	ChatManager:SendMessage("A Admin droped a nuke on rush team defenders")

end -- end of function call

-- -------------

function swap_2us(player)
		if player.teamId == 1 then
	ChatManager:SendMessage("You are already on the American team", player)
			  print("You are already on the American team");
		else
	ChatManager:SendMessage("Moving you to the American team", player)
			  print("Moving you to the american team");
  	fetchplayerteam1[player.name] = nil
	fetchplayerteam2[player.name] = nil
	fetchplayerteam3[player.name] = nil
	fetchplayerteam4[player.name] = nil
	RCON:SendCommand('admin.movePlayer', {player.name, "1", "1", "true"})
	fetchplayerteam1[player.name] = player.name
end
end

-- -------------

function swap_2ru(player)
		if player.teamId == 2 then
	ChatManager:SendMessage("You are already on the Russian team", player)
			  print("You are already on the Russian team");
		else
	ChatManager:SendMessage("Moving you to the Russian team", player)
			  print("Moving you to the russian team");
	fetchplayerteam1[player.name] = nil
	fetchplayerteam2[player.name] = nil
	fetchplayerteam3[player.name] = nil
	fetchplayerteam4[player.name] = nil
	RCON:SendCommand('admin.movePlayer', {player.name, "2", "1", "true"})
	fetchplayerteam2[player.name] = player.name
end
end

-- -------------

function fetchadmin(player, data_playername)
	print ("Check if "..player.name.." is a admin here")
	for _, admin in pairs(Selected) do
		if admin == player.name then selected_admin = admin
		print ("Found:"..selected_admin..", is in the 'admin table'")
		end
	end

	if player.name ~= selected_admin then
		ChatManager:SendMessage("You dont have permissions "..player.name, player)
				  print("You dont have permissions "..player.name)
end
end

-- -------------

function select_us()
	ChatManager:SendMessage("Selecting US as round winner")
			  print("Selecting US as round winner");
	RCON:SendCommand('mapList.endRound', {"1"})
end

-- -------------

function select_ru()
	ChatManager:SendMessage("Selecting RU as round winner")
			  print("Selecting RU as round winner");
	RCON:SendCommand('mapList.endRound', {"2"})
end

-- -------------

function nextmap()
	ChatManager:SendMessage("Running the next map")
			  print("Running the next map");
	RCON:SendCommand('mapList.runNextRound')
end

-- -------------

function reloadmap()
	ChatManager:SendMessage("Reloading the current map")
			  print("Reloading the current map");
	RCON:SendCommand('maplist.restartRound')
end

-- -------------

function guid(player)
			 print ("Dumping players GUID on server")
			 print ("")
	for name, fetchplayer in pairs(fetchplayerguid) do
		print ("Found:"..name.." with "..fetchplayer.." GUID in the 'players guid table'")
		end

			 print ("")
			 print ("End of listed guid's on server")
end

-- -------------

function teamid(player)
			 print ("Dumping players teamID on server")
			 print ("")
	for name, fetchplayer in pairs(fetchteamID) do
		print ("Found:"..name.." with "..fetchplayer.." TeamID in the 'players ID table'")
		end

			 print ("")
			 print ("End of listed teamID's on server")
end

-- -------------

function dump(player)
			 print ("Dumping players on server")
			 print ("")
	for _, fetchplayer in pairs(fetchplayername) do
		print ("Found:"..fetchplayer.." in the 'player table'")
		end

	for _, fetchplayer in pairs(fetchplayerteam1) do
		print ("Found:"..fetchplayer.." on team 1")
		end

	for _, fetchplayer in pairs(fetchplayerteam2) do
		print ("Found:"..fetchplayer.." on team 2")
		end

	for _, fetchplayer in pairs(fetchplayerteam3) do
		print ("Found:"..fetchplayer.." on team 3")
		end

	for _, fetchplayer in pairs(fetchplayerteam4) do
		print ("Found:"..fetchplayer.." on team 4")
		end

			 print ("")
			 print ("End of listed players on server")

end

-- -------------

function checkgamemode()
	if SharedUtils:GetCurrentGameMode() == "ConquestLarge0" or SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0"
	or SharedUtils:GetCurrentGameMode() == "ConquestSmall0"	or SharedUtils:GetCurrentGameMode() == "Domination0"
	or SharedUtils:GetCurrentGameMode() == "GunMaster0"	or SharedUtils:GetCurrentGameMode() == "Scavenger0"
	or SharedUtils:GetCurrentGameMode() == "AirSuperiority0" or SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0"
	or SharedUtils:GetCurrentGameMode() == "GunMaster0"	or SharedUtils:GetCurrentGameMode() == "Scavenger0"
	or SharedUtils:GetCurrentGameMode() == "AirSuperiority0" or SharedUtils:GetCurrentGameMode() == "CaptureTheFlag0"
	or SharedUtils:GetCurrentGameMode() == "TankSuperiority0" or SharedUtils:GetCurrentGameMode() == "TeamDeathMatch0"
	or SharedUtils:GetCurrentGameMode() == "TeamDeathMatchC0" or SharedUtils:GetCurrentGameMode() == "ConquestAssaultLarge0"
	or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall0" or SharedUtils:GetCurrentGameMode() == "ConquestAssaultSmall1"
	or SharedUtils:GetCurrentGameMode() == "HeliSuperiority0" or SharedUtils:GetCurrentGameMode() == "KingOfTheHill0" then
	foundgamemode = true
	else 
	foundgamemode = false
    end

end

-- -------------

function checkgamemode_sqdm()

    if SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" then
	foundgamemode = true
	else 
	foundgamemode = false
	end
end

-- -------------

function checkgamemode_rush()

	if SharedUtils:GetCurrentGameMode() == "RushLarge0" or SharedUtils:GetCurrentGameMode() == "SquadRush0" then
	foundgamemode = true
	else 
	foundgamemode = false
	end

end

-- ------------------------
-- ------------------------
-- ------------------------

--[[
function template()
end
]]
-- ------------------------
-- ------------------------
-- ------------------------

