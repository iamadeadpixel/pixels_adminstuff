










-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** move a player loaded ***");
	end
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
	movemode = 1
    print ("team movetype US / RU")

    elseif SharedUtils:GetCurrentGameMode() == "SquadDeathMatch0" then
	movemode = 2
    print ("team movetype Alpha / Bravo / Charlie / Delta")

    elseif SharedUtils:GetCurrentGameMode() == "RushLarge0" or SharedUtils:GetCurrentGameMode() == "SquadRush0" then
	movemode = 3
    print ("team movetype Atackers / Defenders")

end
end
end)


Events:Subscribe('Player:Chat', function(player, recipientMask, message)
-- This code is ripped from the ingameadmin mod
	if message == '' or player == nil then
		return
	end

	-- lowerkey the message
	message = message:lower()
	var_message = message
	
	-- split the message into parts
	local s_Parts = message:split(' ')
	
	-- check if the first key is not a "."
	if s_Parts[1]:sub(1,1) ~= "." then
		return
	end
	-- only if it starts with "." we go on

	if s_Parts[1] == '.move' then print ("we found the '.move' command") 

-- print the chat input .move into console
	print ("")
	print('Chat: '..player.name..': '..message)
	print ("")

-- Check for valid admin
	fetchadmin(player, data_playername)
	if player.name == selected_admin then

-- If no name given, report back
	if s_Parts[2] == nil then
	  ChatManager:SendMessage("Error: We need a name here", player)
			print ("")
			   print ("##########################")
			   print ("Error: We need a name here")
			   print ("##########################")
		end

 -- if we dont use this when no name is given, the stuff below will gives a error message
	if s_Parts[2] == nil then return end

 -- Here we check if the player is in tabledata,and report also the team ID
	if s_Parts[2] ~= nil then
	findplayer(player,s_Parts,targetplayer)

end
end
end
end)

--[[
s_part[1] = .move / s_part[2] = <playername> / s_part[3] <move type> / s_part[4] <message> (or no message)
The idea is simpel.
if we use .move with no name, return a message saying, we need a name here.
if we use .move with the correct name only, return a message saying, we need us or ru here. (depending on gamemode like rush and squaddeathmatch)
if we use .move with the incorrect name only, return a message saying, no player found.
if we use .move with the correct name and the correct value (us or ru), move the player to the other team
if we use .move with the correct name and a incorrect value (not us or ru), return a message saying, us or ru only.
]]

-- ------------------------

-- Global:
-- printlines indicate if the shit is working properly
function findplayer(player,s_Parts,targetplayer)

			print ("")
			print ("############################################")
			print ("Finding the correct player we have in tables")
			print ("############################################")

	for name, getteamid in pairs(fetchteamID) do
-- Used for testing only, here we print players (inc bots) in tabledata
		print ("Dumping players in tabledata, We found:"..name)

	if string.match(name:lower(), s_Parts[2]:lower()) then
			targetplayer = name
			player_id = getteamid

			print ("")
			print ("#######################################################################")
			print ("Found:"..targetplayer.." with teamId "..player_id.." in the target 'player table'")
			print ("#######################################################################")

	ChatManager:SendMessage("Found:"..targetplayer.." with teamId "..player_id, player)
		end
	end

-- If no player data is found, we trigger the novalidplayer function.
		if targetplayer == nil then

-- Global use
	novalidplayer(player,s_Parts,targetplayer)

	elseif targetplayer ~= nil then
	if movemode == 1 then
	movemode1(player,s_Parts,targetplayer)

	elseif movemode == 2 then
	movemode2(player,s_Parts,targetplayer)

	elseif movemode == 3 then
	movemode3(player,s_Parts,targetplayer)

	return end

end
end -- end function call

-- ------------------------

--[[
Global: used for s_Parts[2]
this a namecheck
]]

function novalidplayer(player,s_Parts,targetplayer)

			print ("")
			   print ("############################")
			   print ("no matching playername found")
			   print ("############################")
	ChatManager:SendMessage("no matching playername found", player)
-- after this, no more action is taken.
    
end -- end of function call

-- ------------------------

-- here we check for the correct move value (US or RU)
function movemode1(player,s_Parts,targetplayer)

	print ("")
	print ("#########################################################################")
	print ("Movemode 1 - Check if we found US or RU as a valid value to move a player")
	print ("#########################################################################")

	if s_Parts[3] == "us" or s_Parts[3] == "ru" then
	print ("")
	print ("###################################")
	print ("Found valid team value "..s_Parts[3])
	print ("###################################")

-- player checked out, the value for the move type was correct, lets trigger the message status,else dump a warning.
	checkmessagstatus(player,s_Parts,targetplayer)

	elseif s_Parts[3] ~= "us" or s_Parts[3] ~= "ru" then
	ChatManager:SendMessage("Error2: Valid values are: us / ru", player)
			print ("")
			print ("#################################")
			print ("Error2: Valid values are: us / ru")
			print ("#################################")

	end
end -- end of function call

-- ------------------------

-- here we check for the correct move value (ALPHA / BRAVO / CHARLIE / DELTA)
function movemode2(player,s_Parts,targetplayer)

	print ("")
	print ("################################################################################################")
	print ("Movemode 2 - Check if we found ALPHA / BRAVO / CHARLIE / DELTA as a valid value to move a player")
	print ("################################################################################################")

	if s_Parts[3] == "alpha" or s_Parts[3] == "bravo" or s_Parts[3] == "charlie" or s_Parts[3] == "delta" then
	print ("")
	print ("###################################")
	print ("Found valid team value "..s_Parts[3])
	print ("###################################")

-- player checked out, the value for the move type was correct, lets trigger the message status,else dump a warning.
	checkmessagstatus(player,s_Parts,targetplayer)

	elseif s_Parts[3] ~= "alpha" or s_Parts[3] ~= "bravo" or s_Parts[3] ~= "charlie" or s_Parts[3] ~= "delta" then
	ChatManager:SendMessage("Error2: Valid values are: alpha / bravo / charlie / delta", player)
			print ("")
			print ("#########################################################")
			print ("Error2: Valid values are: alpha / bravo / charlie / delta")
			print ("#########################################################")

	end
end -- end of function call

-- ------------------------

-- here we check for the correct move value (ATACKERS or DEFENDERS)
function movemode3(player,s_Parts,targetplayer)

	print ("")
	print ("######################################################################################")
	print ("Movemode 3 - Check if we found ATACKERS or DEFENDERS as a valid value to move a player")
	print ("######################################################################################")

	if s_Parts[3] == "atackers" or s_Parts[3] == "defenders" then
	print ("")
	print ("###################################")
	print ("Found valid team value "..s_Parts[3])
	print ("###################################")

-- player checked out, the value for the move type was correct, lets trigger the message status,else dump a warning.
	checkmessagstatus(player,s_Parts,targetplayer)

	elseif s_Parts[3] ~= "atackers" or s_Parts[3] ~= "defenders" then
	ChatManager:SendMessage("Error2: Valid values are: atackers / defenders", player)
			print ("")
			print ("##############################################")
			print ("Error2: Valid values are: atackers / defenders")
			print ("##############################################")

	end
end -- end of function call

-- ------------------------

--[[
Global: used for s_Parts[3] what can contain the next values:
US / RU
alpha / bravo / charlie / delta
atackers / defenders
]]

function checkmessagstatus(player,s_Parts,targetplayer)

	if s_Parts[4] == nil then
			print ("")
			print ("##################################")
			print ("We continue with no message here #")
			print ("No reason given for targetplayer:"..targetplayer..", Moved with default reason: Moved by a Admin")
			print ("################################################################################################")
	s_hasnomessage = 1
-- Here we trigger the correct movemode conversion from s_Parts[3] to move the player to the other team with no reason
		if movemode == 1 then
	movemode1_playerteamid(player,s_Parts,targetplayer)
		elseif movemode == 2 then
	movemode2_playerteamid(player,s_Parts,targetplayer)
		elseif movemode == 3 then
	movemode3_playerteamid(player,s_Parts,targetplayer)
		end

	elseif s_Parts[4] ~= nil then
			print ("")
			print ("#################################")
			print ("We continue with a message here #")
			print ("A reason given for targetplayer:"..targetplayer..", Moved with custom reason :"..var_message)
			print ("###############################################################################################")
	s_hasmessage = 1
-- Here we trigger the correct movemode conversion from s_Parts[3] to move the player to the other team with a reason
		if movemode == 1 then
	movemode1_playerteamid(player,s_Parts,targetplayer)
		elseif movemode == 2 then
	movemode2_playerteamid(player,s_Parts,targetplayer)
		elseif movemode == 3 then
	movemode3_playerteamid(player,s_Parts,targetplayer)
		end

	end
end -- End of function call

-- ------------------------

function movemode1_playerteamid(player,s_Parts,targetplayer)

			print ("")
			print ("##########################################")
			print ("Check if players teamID is the same or not")
			print ("##########################################")

-- s_Parts[3] is destination team, player_id is the current team ID !
	if s_Parts[3] == "us" and player_id == 1 then
			print ("")
			print ("##################################################################################")
			print ("Player "..targetplayer.." is already on the American team, no need to move the player")
			print ("##################################################################################")
		ChatManager:SendMessage("player "..targetplayer.." already on the American team", player)
	resetstuff()

	elseif s_Parts[3] == "ru" and player_id == 2 then
			print ("")
			print ("##################################################################################")
			print ("Player "..targetplayer.." is already on the Russian team, no need to move the player")
			print ("##################################################################################")
		ChatManager:SendMessage("player "..targetplayer.." already on the Russian team", player)
	resetstuff()
-- --------
	elseif s_Parts[3] == "ru" and player_id == 1 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on the American team, lets move the player to the Russian team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "2"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "2"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "us" and player_id == 2 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on the Russian team, lets move the player to the American team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "1"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "1"
	hasmessage(player,s_Parts,targetplayer)
	end

end
end -- End of function call

-- ------------------------

function movemode2_playerteamid(player,s_Parts,targetplayer)

			print ("")
			print ("##########################################")
			print ("Check if players teamID is the same or not")
			print ("##########################################")

-- s_Parts[3] is destination team, player_id is the current team ID !
	if s_Parts[3] == "alpha" and player_id == 1 then
			print ("")
			print ("##################################################################################")
			print ("Player "..targetplayer.." is already on the ALPHA team, no need to move the player")
			print ("##################################################################################")
		ChatManager:SendMessage("player "..targetplayer.." already on Alpha team", player)
	resetstuff()

	elseif s_Parts[3] == "bravo" and player_id == 1 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Alpha team, lets move the player to Bravo team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "2"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "2"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "charlie" and player_id == 1 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Alpha team, lets move the player to Charlie team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "3"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "3"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "delta" and player_id == 1 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Alpha team, lets move the player to Delta team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "4"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "4"
	hasmessage(player,s_Parts,targetplayer)
	end

-- --------
-- --------
-- --------

	elseif s_Parts[3] == "alpha" and player_id == 2 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Bravo team, lets move the player to Alpha team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "1"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "1"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "bravo" and player_id == 2 then
			print ("")
			print ("##################################################################################")
			print ("Player "..targetplayer.." is already on the BRAVO team, no need to move the player")
			print ("##################################################################################")
		ChatManager:SendMessage("player "..targetplayer.." already on Bravo team", player)
	resetstuff()

	elseif s_Parts[3] == "charlie" and player_id == 2 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Bravo team, lets move the player to Charlie team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "3"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "3"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "delta" and player_id == 2 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Bravo team, lets move the player to Delta team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "4"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "4"
	hasmessage(player,s_Parts,targetplayer)
	end

-- --------
-- --------
-- --------

	elseif s_Parts[3] == "alpha" and player_id == 3 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Charlie team, lets move the player to Alpha team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "1"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "1"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "bravo" and player_id == 3 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Charlie team, lets move the player to Bravo team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "2"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "2"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "charlie" and player_id == 3 then
			print ("")
			print ("##################################################################################")
			print ("Player "..targetplayer.." is already on the CHARLIE team, no need to move the player")
			print ("##################################################################################")
		ChatManager:SendMessage("player "..targetplayer.." already on Charlie team", player)
	resetstuff()

	elseif s_Parts[3] == "delta" and player_id == 3 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Charlie team, lets move the player to Delta team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "4"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "4"
	hasmessage(player,s_Parts,targetplayer)
	end

-- --------
-- --------
-- --------

	elseif s_Parts[3] == "alpha" and player_id == 4 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Delta team, lets move the player to Alpha team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "1"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "1"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "bravo" and player_id == 4 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Delta team, lets move the player to Bravo team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "2"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "2"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "charlie" and player_id == 4 then
			print ("")
			print ("###########################################################################################")
			print ("player "..targetplayer.." is on Delta team, lets move the player to Charlie team")
			print ("###########################################################################################")
	if s_hasnomessage == 1 then
	movetype = "3"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "3"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "delta" and player_id == 4 then
			print ("")
			print ("##################################################################################")
			print ("Player "..targetplayer.." is already on the DELTA team, no need to move the player")
			print ("##################################################################################")
		ChatManager:SendMessage("player "..targetplayer.." already on Delta team", player)
	resetstuff()

end
end -- End of function call

-- ------------------------

function movemode3_playerteamid(player,s_Parts,targetplayer)

			print ("")
			print ("##########################################")
			print ("Check if players teamID is the same or not")
			print ("##########################################")

-- s_Parts[3] is destination team, player_id is the current team ID !
	if s_Parts[3] == "atackers" and player_id == 1 then
			print ("")
			print ("#####################################################################################")
			print ("Player "..targetplayer.." is already on the Atackers team, no need to move the player")
			print ("#####################################################################################")
		ChatManager:SendMessage("player "..targetplayer.." already on the Atackers team", player)
	resetstuff()

	elseif s_Parts[3] == "defenders" and player_id == 2 then
			print ("")
			print ("######################################################################################")
			print ("Player "..targetplayer.." is already on the Defenders team, no need to move the player")
			print ("######################################################################################")
		ChatManager:SendMessage("player "..targetplayer.." already on the Defenders team", player)
	resetstuff()
-- --------
	elseif s_Parts[3] == "defenders" and player_id == 1 then
			print ("")
			print ("#############################################################################################")
			print ("player "..targetplayer.." is on the Atackers team, lets move the player to the Defenders team")
			print ("#############################################################################################")
	if s_hasnomessage == 1 then
	movetype = "2"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "2"
	hasmessage(player,s_Parts,targetplayer)
	end

	elseif s_Parts[3] == "atackers" and player_id == 2 then
			print ("")
			print ("#############################################################################################")
			print ("player "..targetplayer.." is on the Defenders team, lets move the player to the Atackers team")
			print ("#############################################################################################")
	if s_hasnomessage == 1 then
	movetype = "1"
	hasnomessage(player,s_Parts,targetplayer)
	elseif s_hasmessage == 1 then
	movetype = "1"
	hasmessage(player,s_Parts,targetplayer)
	end

end
end -- End of function call

-- ------------------------

-- Global:
function hasnomessage(player,s_Parts,targetplayer)
		RCON:SendCommand('admin.say', {"Moved by a Admin ", "player", targetplayer})
		print ("")
		print ("No reason given for targetplayer:"..targetplayer..", Moved to team "..s_Parts[3].." type ("..movetype..") ,with default reason: Moved by a Admin")
		RCON:SendCommand('admin.movePlayer', {targetplayer, movetype, "1", "true"})
		resetstuff()

end -- End of function call

-- ------------------------
-- Global:
function hasmessage(player,s_Parts,targetplayer)

	joined_message = (s_Parts[1].." "..s_Parts[2].." "..s_Parts[3])
	  message = ((var_message):gsub(joined_message, "")) -- replace .move player with,,,,,,,nothing !

		RCON:SendCommand('admin.say', {"Reason for move: "..message, "player", targetplayer})
		print ("")
		print ("Reason given for targetplayer:"..targetplayer..", Move player to team "..s_Parts[3].." type ("..movetype..") ,with reason:"..message)
		RCON:SendCommand('admin.movePlayer', {targetplayer, movetype, "1", "true"})
		resetstuff()

end -- End of function call

-- ------------------------
-- Global:
function resetstuff()
-- Resetting previous stuff to avoid eh, isues...
 print ("Resetting previous stuff to avoid eh, isues...")
	s_Parts = {}
	targetplayer = nil
	name = nil
	s_hasnomessage = 0
	s_hasmessage = 0
	movetype = nil
end
