local function PromptDiscordInvite(invite, showPrompt)
    if not syn then
        return warn('Synapse X essential to run this script!')
    end
    local Inv, ServerInfo, ServerName = {'s', 'c', 'R', 'a', 'm', 'D', 'a', '4', '6', 'e'}, nil, ''
    
    if invite and type(invite) == 'string' and invite:match('%a') then
        Inv = invite
        data_url = 'https://discord.com/api/v6/invite/'..Inv
    else
        Inv = table.concat(Inv)
        data_url = 'https://discord.com/api/v6/invite/'..Inv
    end
    
    ServerInfo = syn.request({
        Url = 'https://discord.com/api/v6/invite/'..Inv,
        Method = 'GET'
    })
    
    if ServerInfo.Success then
        ServerInfo = game:GetService('HttpService'):JSONDecode(ServerInfo.Body)
    else
        warn(ServerInfo.StatusCode, ServerInfo.StatusMessage, '|', ServerInfo.Body)
        return
    end
    
    local getsynassetfromurl = function(url)
        local File, Raw = 'SynAsset [', syn.request({
            Url = url,
            Method = 'GET'
        }).Body
        if url and type(url) == 'string' and tostring(Raw):find('PNG') then
            for i = 1, 5 do
                File = tostring(File..string.char(math.random(65, 122)))
            end
            File = File..'].png'
            writefile(File, Raw)
            coroutine.wrap(function()
                wait(10)
                if isfile(File) then
                    delfile(File)
                end
            end)()
            return getsynasset(File)
        end
    end
    
    local function Request()
        syn.request(
            {
                Url = 'http://127.0.0.1:6463/rpc?v=1',
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                    ['origin'] = 'https://ptb.discord.com',
                },
                Body = game:GetService('HttpService'):JSONEncode({
                    ['args'] = {
                    ['code'] = Inv,
                    ['sex'] = '?species=Goblin&realm=Toril'
                },
                ['cmd'] = 'INVITE_BROWSER',
                ['nonce'] = 'OwO'
            })
        })
    end
    
    if type(showPrompt) == 'boolean' and showPrompt == true then
local DiscordInvitePrompt = Instance.new('ScreenGui')
local BG = Instance.new('Frame')
local Title = Instance.new('TextLabel')
local UITextSizeConstraint = Instance.new('UITextSizeConstraint')
local Bar = Instance.new('Frame')
local Label1 = Instance.new('TextLabel')
local Label2 = Instance.new('TextLabel')
local Label3 = Instance.new('TextLabel')
local Popout1 = Instance.new('Frame')
local UICorner = Instance.new('UICorner')
local InviterName = Instance.new('TextLabel')
local UITextSizeConstraint_2 = Instance.new('UITextSizeConstraint')
local Popout2 = Instance.new('Frame')
local UICorner_2 = Instance.new('UICorner')
local ServerName = Instance.new('TextLabel')
local UITextSizeConstraint_3 = Instance.new('UITextSizeConstraint')
local Popout3 = Instance.new('Frame')
local UICorner_3 = Instance.new('UICorner')
local ServerIcon = Instance.new('ImageLabel')
local UICorner_4 = Instance.new('UICorner')
local ServerIconText = Instance.new('TextLabel')
local UICorner_5 = Instance.new('UICorner')
local UITextSizeConstraint_4 = Instance.new('UITextSizeConstraint')
local BG2 = Instance.new('Frame')
local _2Title = Instance.new('TextLabel')
local UITextSizeConstraint_5 = Instance.new('UITextSizeConstraint')
local UICorner_6 = Instance.new('UICorner')
local BG2_2 = Instance.new('Frame')
local Option = Instance.new('TextLabel')
local Yes = Instance.new('TextButton')
local UICorner_7 = Instance.new('UICorner')
local No = Instance.new('TextButton')
local UICorner_8 = Instance.new('UICorner')

--Properties:

DiscordInvitePrompt.Name = 'DiscordInvitePrompt'
DiscordInvitePrompt.Parent = game.Players.LocalPlayer:WaitForChild('PlayerGui')
DiscordInvitePrompt.ResetOnSpawn = false

BG.Name = 'BG'
BG.Parent = DiscordInvitePrompt
BG.Active = true
BG.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
BG.BorderColor3 = Color3.fromRGB(0, 0, 0)
BG.BorderSizePixel = 0
BG.ClipsDescendants = true
BG.Selectable = true
BG.Size = UDim2.new(0, 357, 0, 171)
BG.Position = UDim2.new(.5, -BG.Size.X.Offset/2, .5, -BG.Size.Y.Offset/2)

Title.Name = 'Title'
Title.Parent = BG
Title.Active = true
Title.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Selectable = true
Title.Size = UDim2.new(0, 357, 0, 21)
Title.ZIndex = 5
Title.Font = Enum.Font.GothamSemibold
Title.Text = 'Discord Invitation Recieved'
Title.TextColor3 = Color3.fromRGB(188, 188, 188)
Title.TextScaled = true
Title.TextSize = 17.000
Title.TextWrapped = true

UITextSizeConstraint.Parent = Title
UITextSizeConstraint.MaxTextSize = 17

Bar.Name = 'Bar'
Bar.Parent = BG
Bar.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.Size = UDim2.new(0, 35, 0, 171)
Bar.ZIndex = 2

Label1.Name = 'Label1'
Label1.Parent = Bar
Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label1.BackgroundTransparency = 1.000
Label1.BorderSizePixel = 0
Label1.Position = UDim2.new(0, -1, 0, 28)
Label1.Size = UDim2.new(0, 35, 0, 28)
Label1.ZIndex = 2
Label1.Font = Enum.Font.Gotham
Label1.Text = 'Inviter'
Label1.TextColor3 = Color3.fromRGB(75, 255, 55)
Label1.TextSize = 11.000
Label1.TextWrapped = true

Label2.Name = 'Label2'
Label2.Parent = Bar
Label2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label2.BackgroundTransparency = 1.000
Label2.BorderSizePixel = 0
Label2.Position = UDim2.new(0, 0, 0, 69)
Label2.Size = UDim2.new(0, 35, 0, 34)
Label2.ZIndex = 2
Label2.Font = Enum.Font.Gotham
Label2.Text = 'Server<br />Name'
Label2.TextColor3 = Color3.fromRGB(255, 179, 0)
Label2.TextSize = 11.000

Label3.Name = 'Label3'
Label3.Parent = Bar
Label3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label3.BackgroundTransparency = 1.000
Label3.BorderSizePixel = 0
Label3.Position = UDim2.new(0, 0, 0, 119)
Label3.Size = UDim2.new(0, 35, 0, 44)
Label3.ZIndex = 2
Label3.Font = Enum.Font.Gotham
Label3.Text = 'Server Icon'
Label3.TextColor3 = Color3.fromRGB(255, 255, 255)
Label3.TextSize = 11.000
Label3.TextWrapped = true

Popout1.Name = 'Popout1'
Popout1.Parent = BG
Popout1.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Popout1.BackgroundTransparency = 0.600
Popout1.BorderSizePixel = 0
Popout1.ClipsDescendants = true
Popout1.Position = UDim2.new(0, 26, 0, 28)
Popout1.Size = UDim2.new(0, 44, 0, 28)

UICorner.Parent = Popout1

InviterName.Name = 'InviterName'
InviterName.Parent = Popout1
InviterName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InviterName.BackgroundTransparency = 1.000
InviterName.BorderSizePixel = 0
InviterName.Position = UDim2.new(0, 13, 0, 0)
InviterName.Size = UDim2.new(0, 18, 0, 28)
InviterName.ZIndex = 2
InviterName.Font = Enum.Font.Gotham
InviterName.Text = 'Nil'
InviterName.TextColor3 = Color3.fromRGB(255, 255, 255)
InviterName.TextSize = 11.000
InviterName.TextWrapped = true
InviterName.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_2.Parent = InviterName
UITextSizeConstraint_2.MaxTextSize = 19

Popout2.Name = 'Popout2'
Popout2.Parent = BG
Popout2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Popout2.BackgroundTransparency = 0.600
Popout2.BorderSizePixel = 0
Popout2.ClipsDescendants = true
Popout2.Position = UDim2.new(0, 26, 0, 69)
Popout2.Size = UDim2.new(0, 44, 0, 34)

UICorner_2.Parent = Popout2

ServerName.Name = 'ServerName'
ServerName.Parent = Popout2
ServerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ServerName.BackgroundTransparency = 1.000
ServerName.BorderSizePixel = 0
ServerName.Position = UDim2.new(0, 12, 0, 0)
ServerName.Size = UDim2.new(0, 18, 0, 34)
ServerName.ZIndex = 2
ServerName.Font = Enum.Font.Gotham
ServerName.Text = 'Nil'
ServerName.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerName.TextSize = 14.000
ServerName.TextWrapped = true
ServerName.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_3.Parent = ServerName
UITextSizeConstraint_3.MaxTextSize = 21

Popout3.Name = 'Popout3'
Popout3.Parent = BG
Popout3.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Popout3.BackgroundTransparency = 0.600
Popout3.BorderSizePixel = 0
Popout3.ClipsDescendants = true
Popout3.Position = UDim2.new(0, 26, 0, 119)
Popout3.Size = UDim2.new(0, 94, 0, 44)

UICorner_3.Parent = Popout3

ServerIcon.Name = 'ServerIcon'
ServerIcon.Parent = Popout3
ServerIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ServerIcon.BackgroundTransparency = 1.000
ServerIcon.BorderSizePixel = 0
ServerIcon.Position = UDim2.new(0, 16, 0, 3)
ServerIcon.Size = UDim2.new(0, 62, 0, 38)
ServerIcon.ZIndex = 2
ServerIcon.Image = 'rbxassetid://885512082'
ServerIcon.ScaleType = Enum.ScaleType.Fit

UICorner_4.Parent = ServerIcon

ServerIconText.Name = 'ServerIconText'
ServerIconText.Parent = Popout3
ServerIconText.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
ServerIconText.BorderColor3 = Color3.fromRGB(0, 0, 0)
ServerIconText.BorderSizePixel = 0
ServerIconText.Position = UDim2.new(0, 16, 0, 3)
ServerIconText.Size = UDim2.new(0, 62, 0, 38)
ServerIconText.Visible = false
ServerIconText.ZIndex = 2
ServerIconText.Font = Enum.Font.GothamSemibold
ServerIconText.Text = 'OI'
ServerIconText.TextColor3 = Color3.fromRGB(255, 255, 255)
ServerIconText.TextScaled = true
ServerIconText.TextWrapped = true

UICorner_5.Parent = ServerIconText

UITextSizeConstraint_4.Parent = ServerIconText
UITextSizeConstraint_4.MaxTextSize = 38

BG2.Name = 'BG2'
BG2.Parent = BG
BG2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
BG2.BackgroundTransparency = 0.300
BG2.BorderColor3 = Color3.fromRGB(0, 0, 0)
BG2.Position = UDim2.new(0, 147, 0, 28)
BG2.Size = UDim2.new(0, 170, 0, 129)
BG2.ZIndex = 2

_2Title.Name = '2Title'
_2Title.Parent = BG2
_2Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_2Title.BackgroundTransparency = 1.000
_2Title.BorderSizePixel = 0
_2Title.Size = UDim2.new(0, 170, 0, 23)
_2Title.ZIndex = 2
_2Title.Font = Enum.Font.SourceSansSemibold
_2Title.Text = 'Invite Prompt'
_2Title.TextColor3 = Color3.fromRGB(255, 255, 255)
_2Title.TextScaled = true
_2Title.TextSize = 14.000
_2Title.TextWrapped = true

UITextSizeConstraint_5.Parent = _2Title
UITextSizeConstraint_5.MaxTextSize = 14

UICorner_6.Parent = BG2

BG2_2.Name = 'BG2'
BG2_2.Parent = BG2
BG2_2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
BG2_2.BackgroundTransparency = 0.300
BG2_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
BG2_2.Position = UDim2.new(0, 10, 0, 26)
BG2_2.Size = UDim2.new(0, 148, 0, 90)
BG2_2.ZIndex = 2

Option.Name = 'Option'
Option.Parent = BG2_2
Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Option.BackgroundTransparency = 1.000
Option.BorderSizePixel = 0
Option.Size = UDim2.new(0, 148, 0, 34)
Option.ZIndex = 2
Option.Font = Enum.Font.SourceSans
Option.Text = 'Do you want to open this invite in <b>Discord</b>?'
Option.TextColor3 = Color3.fromRGB(255, 255, 255)
Option.TextSize = 14.000
Option.TextWrapped = true

Yes.Name = 'Yes'
Yes.Parent = BG2_2
Yes.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Yes.BorderSizePixel = 0
Yes.Position = UDim2.new(0, 4, 0, 52)
Yes.Size = UDim2.new(0, 64, 0, 16)
Yes.ZIndex = 2
Yes.Font = Enum.Font.SourceSans
Yes.Text = 'Yes'
Yes.TextColor3 = Color3.fromRGB(97, 189, 87)
Yes.TextScaled = true
Yes.TextSize = 16.000
Yes.TextWrapped = true

UICorner_7.Parent = Yes

No.Name = 'No'
No.Parent = BG2_2
No.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
No.BorderSizePixel = 0
No.Position = UDim2.new(0, 75, 0, 52)
No.Size = UDim2.new(0, 64, 0, 16)
No.ZIndex = 2
No.Font = Enum.Font.SourceSans
No.Text = 'No'
No.TextColor3 = Color3.fromRGB(189, 51, 32)
No.TextScaled = true
No.TextSize = 16.000
No.TextWrapped = true

UICorner_8.Parent = No

        --< >
        local Debounce1 = false
        
        local function Tween(...)
            return game:GetService('TweenService'):Create(...)
        end
        
        ServerName.Text = '<font color="#ffb300">'..ServerInfo.guild.name..'</font>'
        
        ServerName.Size = UDim2.new(0, ServerName.TextBounds.X + ServerName.Text:len() + 25, 0, 28)
        InviterName.Size = UDim2.new(0, InviterName.TextBounds.X + InviterName.Text:len() + 55, 0, 34)
        
        Debounce1 = true
        BG.Size = UDim2.new(0, 0, 0, 0)
        Tween(BG, TweenInfo.new(.5, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 326, 0, 171)}):Play()
        
        Popout1.Size = UDim2.new(0, 0, 0, 28)
        Popout2.Size = UDim2.new(0, 0, 0, 34)
        Popout3.Size = UDim2.new(0, 0, 0, 44)
        
        for _, v in next, DiscordInvitePrompt:GetDescendants() do
            task.spawn(function()
                if v:IsA('TextButton') or v:IsA('TextLabel') then
                    v.RichText = true
                end
            end)
        end
        
        if ServerInfo.inviter then
            InviterName.Text = '<b>'..ServerInfo.inviter.username..'</b>#'..ServerInfo.inviter.discriminator
        elseif ServerInfo.guild['vanity_url_code'] then
            InviterName.Text = '<b>Vanity</b> Invite'
        else
            InviterName.Text = 'Discord Invite'
        end
        
        if ServerInfo.guild.icon and ServerInfo.guild.icon ~= 'null' then
            ServerIcon.Image = getsynassetfromurl('https://cdn.discordapp.com/icons/'..ServerInfo.guild.id..'/'..ServerInfo.guild.icon..'.png')
        else
            ServerIcon.Visible = false
            ServerIconText.Visible = true
            
            local ABRV, Old = '', ServerInfo.guild.name
            for _, v in next, ServerInfo.guild.name:split(' ') do
                task.spawn(function()
                    ABRV = ABRV..v:sub(1, 1)
                end)
            end
            ServerIconText.Text = ABRV
        end
        
        task.spawn(function()
            wait(.15)
            Tween(Popout1, TweenInfo.new(.5, Enum.EasingStyle.Sine), {Size = UDim2.new(0, math.clamp(InviterName.TextBounds.X + InviterName.Text:len() + 10, 0, 120), 0, 28)}):Play()
            wait(.5)
            Tween(Popout2, TweenInfo.new(.5, Enum.EasingStyle.Sine), {Size = UDim2.new(0, math.clamp(ServerName.TextBounds.X + InviterName.Text:len() + 10, 0, 120), 0, 34)}):Play()
            wait(.5)
            Tween(Popout3, TweenInfo.new(.5, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 94, 0, 44)}):Play()
            Debounce1 = false
        end)
        
        local MouseInDebounce, MouseInDebounce2, MouseInYes, MouseInNo = false, false, false, false
        Yes.MouseEnter:Connect(function()
            if not MouseInDebounce then
                MouseInDebounce = true
                MouseInYes = true
                local T = Tween(Yes, TweenInfo.new(1, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(44, 62, 34)})
                T:Play()
            
                repeat
                    game:GetService('RunService').RenderStepped:wait()
                until MouseInYes == false or not DiscordInvitePrompt['Parent']
                
                T:Cancel()
                
                wait(.1)
                MouseInDebounce = false
            end
        end)
        
        No.MouseEnter:Connect(function()
            if not MouseInDebounce2 then
                MouseInDebounce2 = true
                MouseInNo = true
                local T = Tween(No, TweenInfo.new(1, Enum.EasingStyle.Sine), {BackgroundColor3 = Color3.fromRGB(29, 22, 22)})
                T:Play()
                
                repeat
                    game:GetService('RunService').RenderStepped:wait()
                until MouseInNo == false or not DiscordInvitePrompt['Parent']
                
                T:Cancel()
                
                wait(.1)
                MouseInDebounce2 = false
            end
        end)
        
        Yes.MouseLeave:Connect(function()
            MouseInYes = false
            Yes.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
        end)
        
        No.MouseLeave:Connect(function()
            MouseInNo = false
            No.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
        end)
        
        Yes.MouseButton1Click:Connect(function()
            if not Debounce1 then
                Debounce1 = true
                
                wait(.15)
                Tween(Popout1, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 28)}):Play()
                wait(.15)
                Tween(Popout2, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 28)}):Play()
                wait(.15)
                Tween(Popout3, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 44)}):Play()
                wait(.15)
                Tween(BG, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 171)}):Play()
                wait(.15)
                
                DiscordInvitePrompt:Destroy()
                Request()
            end
        end)
        
        No.MouseButton1Click:Connect(function()
            if not Debounce1 then
                Debounce1 = true
                
                Tween(Popout1, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 28)}):Play()
                wait(.15)
                Tween(Popout2, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 28)}):Play()
                wait(.15)
                Tween(Popout3, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 44)}):Play()
                wait(.15)
                Tween(BG, TweenInfo.new(.15, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 171)}):Play()
                wait(.15)
                
                DiscordInvitePrompt:Destroy()
            end
        end)
    else
        Request()
    end
end

PromptDiscordInvite('e6Adw82CJU', true)
--[[
    () 1st argument - Server invite, E.G: discord.gg/scripting would be: 'scripting'   
    () 2nd argument - true or false, decides whether or not if the user will be prompted to the invite.
    
    -- Other info
    () If the server being invited to doesn't have an icon, it will resort to abbreviating the server name.
]]
