if not isfile("config.txt") then
    writefile("config.txt", "{}")
end

local player = game.Players.LocalPlayer

local function getBalances()
    local playerGui = player:FindFirstChild("PlayerGui")

    if playerGui then
        local coreGUI = playerGui:FindFirstChild("CoreGUI")
        if coreGUI then
            local statsFrame = coreGUI:FindFirstChild("StatsFrame")
            if statsFrame then
                local frame2 = statsFrame:FindFirstChild("Frame2")
                if frame2 then
                    local mainFrame = frame2:FindFirstChild("Frame")
                    if mainFrame then
                        local container = mainFrame:FindFirstChild("Container")

                        if container then
                            local bankLabel = container:FindFirstChild("Bank") and container.Bank:FindFirstChild("Amt")
                            local bankAmount = (bankLabel and bankLabel:IsA("TextLabel")) and bankLabel.Text or "N/A"

                            local cashLabel = container:FindFirstChild("Cash") and container.Cash:FindFirstChild("Amt")
                            local cashAmount = (cashLabel and cashLabel:IsA("TextLabel")) and cashLabel.Text or "N/A"

                            return bankAmount, cashAmount
                        end
                    end
                end
            end
        end
    end

    return "N/A", "N/A" 
end


local function saveToFile(bank, cash)
    local data = {
        ["player"] = player.Name,
        ["bank"] = bank,
        ["cash"] = cash,
        ["time"] = os.date("%Y-%m-%d %H:%M:%S")
    }
    writefile("config.txt", game:GetService("HttpService"):JSONEncode(data))
    print("✅ Data saved to config.txt")
end

-- Run every 3 minutes
while wait(170) do
    local bankAmount, cashAmount = getBalances()
    saveToFile(bankAmount, cashAmount)
end
