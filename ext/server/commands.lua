-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** Admin commands loaded ***");
	end
	end
end)

-- -------------

Events:Subscribe('Player:Chat', function(player, recipientMask, message)

	if message == ".reboot" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	reboot_timer(player)
end

	elseif message == ".reload" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	reloadmap()
end

	elseif message == ".nextmap" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nextmap()
end

	elseif message == ".win us" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	select_us(player)
end

  	elseif message == ".win ru" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	select_ru(player)
end

	elseif message == ".swap ru" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	swap_2ru(player)
end

	elseif message == ".swap us" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	swap_2us(player)
end

	elseif message == ".nuke" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	exterminate(player)
end

	elseif message == ".nuke all" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_all(player)
end

	elseif message == ".nuke us" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_us(player)
end

	elseif message == ".nuke ru" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_ru(player)
end

	elseif message == ".nuke alpha" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_alpha(player)
end

	elseif message == ".nuke bravo" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_bravo(player)
end

	elseif message == ".nuke charlie" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_charlie(player)
end

	elseif message == ".nuke delta" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_delta(player)
end

	elseif message == ".nuke atackers" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_atackers(player)
end

	elseif message == ".nuke defenders" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	nuke_defenders(player)
end

	elseif message == ".guid" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	guid(player)
end

	elseif message == ".teamid" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	teamid(player)
end

	elseif message == ".dump" then
	fetchadmin(player, data_playername)
	if player.name == selected_admin then
	dump(player)
end


end
end)

