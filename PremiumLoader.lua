local HttpService = game:GetService("HttpService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local API_URL = "https://endpointwhitelist.onrender.com"
local LoadstringUrl = nil

local function hwidExists(hwid)
    if not hwid then
        return false
    end

    local options = {
        Url = API_URL .. "/hwidExists",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode({ hwid = hwid })
    }

    local success, result = pcall(function()
        return http.request(options)
    end)

    if not success then warn("FAILURE") return false end
    
    local ResultDecrypt = HttpService:JSONDecode(result.Body)
    
    if ResultDecrypt.exists == true then
        
        if ResultDecrypt.premiumUrl then
            LoadstringUrl = tostring(ResultDecrypt.premiumUrl)
        else
            return false
        end
        
        return true
    else
        return false
    end
    
    return false
end

local playerHwid = RbxAnalyticsService:GetClientId()

if hwidExists(playerHwid) then
    loadstring(game:HttpGet(LoadstringUrl))()
end
