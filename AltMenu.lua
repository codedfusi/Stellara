local p = game:GetService("Players").LocalPlayer
local s = p.PlayerGui.CoreGUI.LevelFrame.Bar.Stat
local c = p.PlayerGui.CoreGUI.StatsFrame.Frame2.Frame.Container.Cash.Amt
local b = p.PlayerGui.CoreGUI.StatsFrame.Frame2.Frame.Container.Bank.Amt

local x = 0
local y = 0
local z = 0
local w = 0
local i = 30
local t = 3600

local function f1(q)
    local r = q:match("%d+,%d+"):gsub(",", "")
    return tonumber(r)
end

local function f2(u)
    local v = u:match("^(%d+)/")
    return tonumber(v)
end

local function f3(a, b, c)
    local d = c / b
    return a * d
end

local g = Instance.new("ScreenGui", p.PlayerGui)
local h = Instance.new("Frame", g)
h.Size = UDim2.new(0, 300, 0, 100)
h.Position = UDim2.new(0.5, -150, 0.5, -50)
h.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
h.BackgroundTransparency = 0.5
h.AnchorPoint = Vector2.new(0.5, 0.5)

local j = Instance.new("UICorner", h)
j.CornerRadius = UDim.new(0, 10)

local k = Instance.new("TextLabel", h)
k.Size = UDim2.new(1, 0, 0.5, 0)
k.Position = UDim2.new(0, 0, 0, 0)
k.Text = "Loading..."
k.TextColor3 = Color3.fromRGB(255, 255, 255)
k.BackgroundTransparency = 1
k.Font = Enum.Font.GothamBold
k.TextSize = 16

local l = Instance.new("Frame", h)
l.Size = UDim2.new(0, 0, 0.3, 0)
l.Position = UDim2.new(0, 0, 0.7, 0)
l.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

local m = Instance.new("UICorner", l)
m.CornerRadius = UDim.new(0.2, 0)

local function f4()
    for n = 1, 100 do
        l.Size = UDim2.new(n / 100, 0, 0.3, 0)
        task.wait(0.05)
    end
end

local o = game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    o:CaptureController()
    o:ClickButton2(Vector2.new())
end)

f4()
g:Destroy()

local e = Instance.new("ScreenGui", p.PlayerGui)
local q = Instance.new("Frame", e)
q.Size = UDim2.new(0, 450, 0, 300)
q.Position = UDim2.new(0.5, -225, 0.5, -150)
q.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
q.BorderSizePixel = 0
q.BackgroundTransparency = 0.1
q.AnchorPoint = Vector2.new(0.5, 0.5)

local r = Instance.new("UICorner", q)
r.CornerRadius = UDim.new(0, 10)

local s = Instance.new("TextLabel", q)
s.Size = UDim2.new(1, -40, 0, 30)
s.Position = UDim2.new(0, 20, 0, 0)
s.BackgroundTransparency = 1
s.Text = "XP and Cash Tracker"
s.TextColor3 = Color3.fromRGB(255, 255, 255)
s.Font = Enum.Font.GothamBold
s.TextSize = 16

local t = Instance.new("TextLabel", q)
t.Size = UDim2.new(1, -20, 1, -180)
t.Position = UDim2.new(0, 10, 0, 40)
t.BackgroundTransparency = 1
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Font = Enum.Font.Gotham
t.TextSize = 14
t.TextWrapped = true
t.Text = ""

local u = Instance.new("TextButton", q)
u.Size = UDim2.new(0, 20, 0, 20)
u.Position = UDim2.new(1, -30, 0, 5)
u.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
u.Text = ""

local v = Instance.new("UICorner", u)
v.CornerRadius = UDim.new(1, 0)

local w = Instance.new("TextButton", q)
w.Size = UDim2.new(0, 20, 0, 20)
w.Position = UDim2.new(1, -60, 0, 5)
w.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
w.Text = ""

local x = Instance.new("UICorner", w)
x.CornerRadius = UDim.new(1, 0)

local y = {}
local z = false

u.MouseButton1Click:Connect(function()
    e:Destroy()
end)

w.MouseButton1Click:Connect(function()
    if z then
        for _, a in pairs(y) do
            a.Visible = true
        end
        for b = 30, 300, 10 do
            q.Size = UDim2.new(0, 450, 0, b)
            q.Position = UDim2.new(0.5, -225, 0.5, -b / 2)
            task.wait(0.02)
        end
        z = false
    else
        for _, a in pairs(y) do
            a.Visible = false
        end
        for b = 300, 30, -10 do
            q.Size = UDim2.new(0, 450, 0, b)
            q.Position = UDim2.new(0.5, -225, 0.5, -b / 2)
            task.wait(0.02)
        end
    end
end)

local function f5(c, d, e, f)
    local g = Instance.new("TextButton", q)
    g.Size = UDim2.new(0, 120, 0, 30)
    g.Position = d
    g.BackgroundColor3 = e
    g.Text = c
    g.TextColor3 = Color3.fromRGB(255, 255, 255)
    g.Font = Enum.Font.GothamBold
    g.TextSize = 14

    local h = Instance.new("UICorner", g)
    h.CornerRadius = UDim.new(0.2, 0)

    g.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(f))()
    end)

    table.insert(y, g)
end

f5("TP GUI", UDim2.new(0, 10, 1, -60), Color3.fromRGB(60, 60, 60), "https://pastebin.com/raw/Eik1T27g")
f5("Auto Fist", UDim2.new(0, 140, 1, -60), Color3.fromRGB(60, 60, 60), "https://pastebin.com/raw/aHZgUbSA")
f5("Auto Respawn", UDim2.new(0, 270, 1, -60), Color3.fromRGB(60, 60, 60), "https://pastebin.com/raw/8HCcH3rb")

local a
local b
local c

q.InputBegan:Connect(function(d)
    if d.UserInputType == Enum.UserInputType.MouseButton1 then
        a = true
        b = d.Position
        c = q.Position
    end
end)

q.InputChanged:Connect(function(d)
    if a and d.UserInputType == Enum.UserInputType.MouseMovement then
        local e = d.Position - b
        q.Position = UDim2.new(c.X.Scale, c.X.Offset + e.X, c.Y.Scale, c.Y.Offset + e.Y)
    end
end)

q.InputEnded:Connect(function(d)
    if d.UserInputType == Enum.UserInputType.MouseButton1 then
        a = false
    end
end)

while true do
    local d = s.Text
    local e = f2(d)

    local f = f1(c.Text) + f1(b.Text)

    if x ~= 0 and y ~= 0 then
        z = e - x
        w = f - y

        local g = f3(z, i, t)
        local h = f3(w, i, t)

        t.Text = "XP Increase in last interval: " .. z ..
                 "\nEstimated XP gain in one hour: " .. g ..
                 "\n\nCash Increase in last interval: $" .. w ..
                 "\nEstimated Cash gain in one hour: $" .. h
    end

    x = e
    y = f
    wait(i)
end
