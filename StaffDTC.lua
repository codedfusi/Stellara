 

local rolesToKick = {"Tester", "Contributor", "Tester+", "Developer", "Developer+", "Community Manager", "Manager", "Owner"}
local kickMessage = "Mod joined! u got saved!"
local groupID = 4165692 
local adminUserIDs = { 626833004,34616594,3717066084,185411913,141193516,418086275,    
                     412741116,438805620,198610386,1517131734,67180844,7715991300,87189764,153835477, 
                     111250044, 
                     42066711,9212846,31365111,48058122,955294,295331237, 
                     3923114296, 
                     166406495, 
                     3659305297, 
                     244844600, 
} 


local function shouldKickPlayer(player)
    if table.find(adminUserIDs, player.UserId) then
        return true
    end

    if player:IsInGroup(groupID) then
        local role = tostring(player:GetRoleInGroup(groupID))
        if table.find(rolesToKick, role) then
            return true
        end
    end

    return false
end


local function ProStrat()
    for _, player in pairs(game.Players:GetChildren()) do
        if shouldKickPlayer(player) then
            game.Players.LocalPlayer:Kick(kickMessage)
            break
        end
    end
end


ProStrat()


game.Players.PlayerAdded:Connect(function(player)
    if shouldKickPlayer(player) then
        game.Players.LocalPlayer:Kick(kickMessage)
    end
end)

print("AntiCat1Hater has injected. No Cat1Haters will join you ")
