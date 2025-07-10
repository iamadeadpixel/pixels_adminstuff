-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** multiban loaded ***");
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
	
	-- split the message into parts
	local s_Parts = message:split(' ')
	
	-- check if the first key is not a "!"
	if s_Parts[1]:sub(1,1) ~= "." then
		return
	end
	-- only if it starts with "." we go on

	if s_Parts[1] == '.ban' then print ("we found the '.ban' command") 
	permaban(message,s_Parts,SendMessage,player)
    end

	if s_Parts[1] == '.tban' then print ("we found the '.tban' command") 
	timeban(message,s_Parts,SendMessage,player)
    end

	if s_Parts[1] == '.rban' then print ("we found the '.rban' command") 
	roundban(message,s_Parts,SendMessage,player)
    end

end)

function permaban(message,s_Parts,SendMessage,player)
--[[Permaban stuff from here
]]

	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	print ("System: Permaban selected")


	if s_Parts[2] == nil then
	  ChatManager:SendMessage("Error: We need a name here", player)
			   print ("Error: We need a name here")
		end
	
	if s_Parts[2] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message

			 print ("")
			 print ("Finding the correct player we have in tables")

	for name, fetchplayer in pairs(fetchplayerguid) do
	if string.match(name:lower(), s_Parts[2]:lower()) then
			targetplayer = name
			targetguid = fetchplayer
		end
	end
        if targetplayer ~= nil then
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !
			print ("")
			   print ("Found matching playername "..targetplayer.." with "..s_targetguid.." as Guid")
	  ChatManager:SendMessage("Found matching playername "..targetplayer, player)

	if s_Parts[3] == nil then

			 print ("No reason given: targetplayer "..targetplayer.." using default permban reason: Perma banned by admin")
	ChatManager:SendMessage("Permban "..targetplayer.." by a admin")

	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "perm", "PERM banned by admin"}) -- permban
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)


	print ("Player banned xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

		else ss_message = (s_Parts[1].." "..s_Parts[2])
		s_message = ((message):gsub(ss_message, "")) -- replace .ban player with,,,,,,,nothing !
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !

	print ("Reason given for targetplayer:"..targetplayer..", Preparing the Perma ban with reason:"..s_message)
	ChatManager:SendMessage("Permban "..targetplayer.." Reason:"..s_message)

	RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "perm", s_message}) -- permban
		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)


	print ("Player banned xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil
	end
		else
			print ("")
			print ("no matching playername found")
	  ChatManager:SendMessage("no matching playername found", player)
			targetplayer = nil
			targetguid = nil

return end

end
end -- end of function call

-- --------------------------

function timeban(message,s_Parts,SendMessage,player)
--[[Timeban stuff from here
]]

	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	print ("System: Timeban selected")

	if s_Parts[2] == nil then
	  ChatManager:SendMessage("Error: We need a name here", player)
			   print ("Error: We need a name here")
		end
	
	if s_Parts[2] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message

			 print ("")
			 print ("Finding the correct player we have in tables")

	for name, fetchplayer in pairs(fetchplayerguid) do
	if string.match(name:lower(), s_Parts[2]:lower()) then
			targetplayer = name
			targetguid = fetchplayer
		end
	end
        if targetplayer ~= nil then
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !
			print ("")
			   print ("Found matching playername "..targetplayer.." with "..s_targetguid.." as Guid")
	  ChatManager:SendMessage("Found matching playername "..targetplayer, player)

	if s_Parts[3] == nil then

			 print ("No reason given: targetplayer "..targetplayer.." using default timeban reason: Time banned by admin for "..s_timeban.." Seconds")
	ChatManager:SendMessage("Timeban "..targetplayer.." by a admin for "..s_timeban.." Seconds")
--[[
Dumb solution til i found a real fix
]]
	if s_timeban == 90 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "90", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 3600 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "3600", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 14400 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "14400", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 28800 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "28800", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 43200 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "43200", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 86400 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "86400", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 345600 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "345600", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 604800 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "604800", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 1209600 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "1209600", "Time banned by admin"}) ; end -- Timeban
	if s_timeban == 2419200 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "2419200", "Time banned by admin"}) ; end -- Timeban

		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)

	print ("Player banned xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

		else ss_message = (s_Parts[1].." "..s_Parts[2])
		s_message = ((message):gsub(ss_message, "")) -- replace .ban player with,,,,,,,nothing !
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !

			 print ("Reason given for targetplayer:"..targetplayer..", Preparing the Time ban for "..s_timeban.." Seconds, with reason:"..s_message)
	ChatManager:SendMessage("Timeban "..targetplayer.." for "..s_timeban.." Reason:"..s_message)

	if s_timeban == 90 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "90", s_message}) ; end
	if s_timeban == 3600 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "3600", s_message}) ; end
	if s_timeban == 14400 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "14400", s_message}) ; end
	if s_timeban == 28800 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "28800", s_message}) ; end
	if s_timeban == 43200 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "43200", s_message}) ; end
	if s_timeban == 86400 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "86400", s_message}) ; end
	if s_timeban == 345600 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "345600", s_message}) ; end
	if s_timeban == 604800 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "604800", s_message}) ; end
	if s_timeban == 1209600 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "1209600", s_message}) ; end
	if s_timeban == 2419200 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "seconds", "2419200", s_message}) ; end

		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)


	print ("Player banned xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil
	end
		else
			print ("")
			print ("no matching playername found")
	  ChatManager:SendMessage("no matching playername found", player)
			targetplayer = nil
			targetguid = nil

return end

end
end -- end of function call

-- --------------------------

function roundban(message,s_Parts,SendMessage,player)
--[[Roundban stuff from here
]]

	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	print ("System: Roundban selected")

	if s_Parts[2] == nil then
	  ChatManager:SendMessage("Error: We need a name here", player)
			   print ("Error: We need a name here")
		end
	
	if s_Parts[2] == nil then return end -- if we dont use this when no name is given, the stuff below will gives a error message

			 print ("")
			 print ("Finding the correct player we have in tables")

	for name, fetchplayer in pairs(fetchplayerguid) do
	if string.match(name:lower(), s_Parts[2]:lower()) then
			targetplayer = name
			targetguid = fetchplayer
		end
	end
        if targetplayer ~= nil then
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !
			print ("")
			   print ("Found matching playername "..targetplayer.." with "..s_targetguid.." as Guid")
	  ChatManager:SendMessage("Found matching playername "..targetplayer, player)

	if s_Parts[3] == nil then

			 print ("No reason given: targetplayer "..targetplayer.." using default roundban reason: Round banned by admin for "..s_roundban.." rounds")
	ChatManager:SendMessage("Roundban "..targetplayer.." by admin for "..s_roundban.." rounds")
--[[
Dumb solution til i found a real fix
]]
	if s_roundban == 2 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "2", "Round banned by admin"}) ; end
	if s_roundban == 3 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "3", "Round banned by admin"}) ; end
	if s_roundban == 4 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "4", "Round banned by admin"}) ; end
	if s_roundban == 5 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "5", "Round banned by admin"}) ; end
	if s_roundban == 6 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "6", "Round banned by admin"}) ; end
	if s_roundban == 7 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "7", "Round banned by admin"}) ; end
	if s_roundban == 8 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "8", "Round banned by admin"}) ; end
	if s_roundban == 9 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "9", "Round banned by admin"}) ; end
	if s_roundban == 10 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "10", "Round banned by admin"}) ; end

		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)

	print ("Player banned xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil

		else ss_message = (s_Parts[1].." "..s_Parts[2])
		s_message = ((message):gsub(ss_message, "")) -- replace .ban player with,,,,,,,nothing !
		s_targetguid = ((targetguid):gsub("-", "")) -- replace - with,,,,,,,nothing !

			 print ("Reason given for targetplayer:"..targetplayer..", Preparing the Roundban for "..s_roundban.." rounds, with reason:"..s_message)
	ChatManager:SendMessage("Roundban "..targetplayer.." for "..s_roundban.." rounds, with reason:"..s_message)

	if s_roundban == 2 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "2", s_message}) ; end
	if s_roundban == 3 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "3", s_message}) ; end
	if s_roundban == 4 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "4", s_message}) ; end
	if s_roundban == 5 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "5", s_message}) ; end
	if s_roundban == 6 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "6", s_message}) ; end
	if s_roundban == 7 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "7", s_message}) ; end
	if s_roundban == 8 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "8", s_message}) ; end
	if s_roundban == 9 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "9", s_message}) ; end
	if s_roundban == 10 then RCON:SendCommand('banList.add', {"guid", tostring(s_targetguid), "rounds", "10", s_message}) ; end

		RCON:SendCommand('banlist.save') -- Save the ban to banlist.txt
		RCON:SendCommand('banlist.list') -- Reload banlist.txt (usefull whit procon)

	print ("Player banned xD")
	targetplayer = nil
	targetguid = nil
	s_targetguid = nil
	end
		else
			print ("")
			print ("no matching playername found")
	  ChatManager:SendMessage("no matching playername found", player)
			targetplayer = nil
			targetguid = nil

return end

end
end -- end of function call
