repeat task.wait() until game:IsLoaded()

if game:GetService("UserInputService").TouchEnabled == true then
    game.Players.LocalPlayer:Kick("Sorry, no support for mobile!")
end
if game.PlaceId == 12389327869 then -- A-888
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Idktbh12z/cheapmilk/main/Musc-Fixed-A-888/Main1.lua"))()
elseif game.PlaceId == 8770868695 then -- AA
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Idktbh12z/cheapmilk/main/AA/Main.lua"))()
elseif game.PlaceId == 6735572261 then -- Pilgrammed
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Idktbh12z/cheapmilk/main/Pilgrammed/Backup.lua"))()
elseif game.PlaceId == 12604352060 then
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Idktbh12z/cheapmilk/main/ArcaneOdyssey/Main.lua"))()
else
    return
end
