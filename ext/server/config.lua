-- Spaghetti code by iamadeadpixel

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
	if screenInfo == "Running" or screenInfo == "Blocking on shader creation" or screenInfo == "Loading done" then
	if Config.header then
		print("*** Config loaded ***");
	end
	end
end)

Config = {
	header = true
}
--
Selected = {
	"yourgamenamehere",
	"alt2",
	"alt3",
	"alt4"
}
