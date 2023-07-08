local groupId = 3596833
for i,v in pairs(game.Players:GetPlayers()) do
		local Name = v.Name
        local groupRole = v:GetRoleInGroup(groupId)
        if string.find(groupRole, "Moderator") then
            local CoreGui = game:GetService("StarterGui")

            CoreGui:SetCore(
                "SendNotification",
                {
                    Title = "Alert",
                    Text = "A " .. groupRole .. " Named " .. plr.Name .. " Has joined!",
                    Duration = 5,
                    Button1 = "Ok"
                }
            )
        elseif string.find(groupRole, "Manager") then
            local CoreGui = game:GetService("StarterGui")

            CoreGui:SetCore(
                "SendNotification",
                {
                    Title = "Alert",
                    Text = "A " .. groupRole .. " Named " .. plr.Name .. " Has joined!",
                    Duration = 5,
                    Button1 = "Ok"
                }
            )
        else
            local CoreGui = game:GetService("StarterGui")

            CoreGui:SetCore(
                "SendNotification",
                {
                    Title = "Alert",
                    Text = "A user with no high ranking permissions has joined.",
                    Duration = 5,
                    Button1 = "Ok"
                }
            )
        end
end
game:GetService("Players").PlayerAdded:Connect(
    function(plr)
        local Name = plr.Name
        local groupRole = plr:GetRoleInGroup(groupId)
        if string.find(groupRole, "Moderator") then
            local CoreGui = game:GetService("StarterGui")

            CoreGui:SetCore(
                "SendNotification",
                {
                    Title = "Alert",
                    Text = "A " .. groupRole .. " Named " .. plr.Name .. " Has joined!",
                    Duration = 5,
                    Button1 = "Ok"
                }
            )
        elseif string.find(groupRole, "Manager") then
            local CoreGui = game:GetService("StarterGui")

            CoreGui:SetCore(
                "SendNotification",
                {
                    Title = "Alert",
                    Text = "A " .. groupRole .. " Named " .. plr.Name .. " Has joined!",
                    Duration = 5,
                    Button1 = "Ok"
                }
            )
        else
            local CoreGui = game:GetService("StarterGui")

            CoreGui:SetCore(
                "SendNotification",
                {
                    Title = "Alert",
                    Text = "A user with no high ranking permissions has joined.",
                    Duration = 5,
                    Button1 = "Ok"
                }
            )
        end
    end
)

