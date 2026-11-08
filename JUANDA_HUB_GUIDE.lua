--[[
JUANDA HUB - KING LEGACY GUIDE
LocalScript untuk Roblox Studio (StarterPlayer > StarterPlayerScripts)
Panduan lokal: katalog, pencarian, detail, checklist material, favorit.
Tidak melakukan auto-farm, teleport, remote-event abuse, server hop, atau bypass.
Catatan: lokasi/resep yang belum terverifikasi ditandai "Perlu verifikasi".
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("JUANDA_HUB")
if old then old:Destroy() end

local DATA = {
    Fruits = {
        {"Flame","Rare","Buah","Lokasi/drop mengikuti spawn buah dan dealer. Periksa stok dealer."},
        {"Light","Epic","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Magma","Epic","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Phoenix","Legendary","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Dragon","Mythical","Buah","Update 11: Dragon mendapat rework. Cara memperoleh perlu verifikasi di game."},
        {"Erebus","Mythical","Buah","Buah baru Update 11. Periksa dealer/spawn/trading."},
        {"Dough","Mythical","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Rumble","Epic","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Buddha","Epic","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Gate","Mythical","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Toy","Mythical","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Melody","Mythical","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Demon","Mythical","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Tree","Mythical","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Pter","Mythical","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Spino","Legendary","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Allo","Rare","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Brachio","Legendary","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Gas","Legendary","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Quake","Epic","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Snow","Rare","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Ice","Rare","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Control","Legendary","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Gravity","Legendary","Buah","Periksa dealer, spawn buah, atau trading."},
        {"Dark","Rare","Buah","Periksa dealer, spawn buah, atau trading."},
    },
    Swords = {
        {"Katana","Common","Pedang","Periksa NPC penjual senjata di area awal."},
        {"Tashi Blade","Rare","Pedang","Boss/NPC terkait; lokasi dan drop perlu verifikasi."},
        {"Jitter","Epic","Pedang","Cara memperoleh perlu verifikasi."},
        {"Pole","Epic","Pedang","Cara memperoleh perlu verifikasi."},
        {"Kioru","Legendary","Pedang","Ikuti quest dan persyaratan NPC Kioru; verifikasi syarat terkini."},
        {"Muramasa","Legendary","Pedang","Update 11 melakukan revamp Muramasa V1/V2."},
        {"True Muramasa","Mythical","Pedang","Disebut sebagai tahap V3; persyaratan belum dikonfirmasi."},
        {"Longaevus","Legendary","Pedang","Update 11 melakukan revamp; detail perolehan perlu verifikasi."},
        {"Night Blade","Gamepass","Pedang","Gamepass berbayar; cek halaman game resmi."},
        {"Bone Scythe","Limited","Pedang","Item Halloween yang dinyatakan limited pada Update 11."},
        {"Dread Broom","Event","Pedang","Senjata event Halloween Update 11; ikuti rangkaian material tiga Sea."},
        {"Noirceur","Mythical","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Cerulean Blossom","Mythical","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Ancient Sword","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Abyssal Crab Axe","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Ethereal","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Phoenix Blade","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Acroscythe","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Scepter of Flames","Epic","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Authentic Triple Katana","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Avalon","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Daybreak Cleaver","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
        {"Aquatic Anchor","Legendary","Pedang","Tercatat di indeks senjata; lokasi/resep perlu verifikasi."},
    },
    Fighting = {
        {"Combat","Awal","Fighting Style","Style dasar; tersedia sejak awal."},
        {"Dark Leg","Style","Fighting Style","Update 11 memperkenalkan Dark Leg V3."},
        {"Electro","Style","Fighting Style","Update 11 menambahkan V3 Electro."},
        {"Cyborg","Style","Fighting Style","Update 11 menambahkan Cyborg V3."},
        {"Dragon Claw","Style","Fighting Style","Update 11 menambahkan Dragon Claw V3."},
        {"Water Style","Style","Fighting Style","Periksa NPC dan syarat unlock di game."},
        {"Trickster","Style","Fighting Style","Persyaratan perlu verifikasi."},
        {"Striker","Style","Fighting Style","Persyaratan perlu verifikasi."},
        {"Justice Fist","Style","Fighting Style","Persyaratan perlu verifikasi."},
        {"Gale Fist","Style","Fighting Style","Persyaratan perlu verifikasi."},
    },
    Races = {
        {"Human","Race","Race","Race dasar; sistem reroll/upgrade mengikuti NPC race."},
        {"Fish","Race","Race","Periksa NPC race dan syarat upgrade."},
        {"Angel","Race","Race","Periksa NPC race dan syarat upgrade."},
        {"Animal","Race","Race","Periksa NPC race dan syarat upgrade."},
        {"Demon","Race","Race","Periksa NPC race dan syarat upgrade."},
        {"Sea Beast","Race","Race","Periksa NPC race dan syarat upgrade."},
    },
    Accessories = {
        {"Blue Straw Hat","Common","Accessory","Boss drop; boss spesifik perlu verifikasi."},
        {"Bullitus","Common","Accessory","Dibeli; cek NPC penjual."},
        {"Stainless Jaw","Common","Accessory","Boss drop; boss spesifik perlu verifikasi."},
        {"Black Cloak","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Blue Cloak","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Cyborg Goggles","Uncommon","Accessory","Battle Pass."},
        {"Eye Patch","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Gazelle Mask","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Golden Shoulder","Uncommon","Accessory","Battle Pass."},
        {"Green Cloak","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Horned Hat","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Polar Bear Hat","Uncommon","Accessory","Battle Pass."},
        {"Red Cloak","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Sentinel Armor","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Shadow Cloak","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Shoulder Armor","Uncommon","Accessory","Boss drop; cek indeks boss."},
        {"Traveler's Hat","Uncommon","Accessory","Battle Pass."},
        {"Bear Hat","Rare","Accessory","Battle Pass."},
        {"Biscuit Shoulder","Rare","Accessory","Boss drop; cek indeks boss."},
        {"Dark Beard Cloak","Rare","Accessory","Boss drop; cek indeks boss."},
        {"Floffy Cloak","Rare","Accessory","Boss drop; cek indeks boss."},
        {"Gladiator Helmet","Rare","Accessory","Boss drop; cek indeks boss."},
        {"Hefty Glasses","Rare","Accessory","Boss drop; cek indeks boss."},
        {"Pirate Necklace","Rare","Accessory","Boss drop; cek indeks boss."},
        {"Pondere Coat","Rare","Accessory","Boss drop; cek indeks boss."},
        {"Abyss Sentinel Armor","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Blue Admiral Coat","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Blue Scarf","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Crimson Scarf","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Crown Of The Sea","Epic","Accessory","Battle Pass."},
        {"Flame Hair","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Hefty Coat","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Iratus Mask","Epic","Accessory","Battle Pass."},
        {"Lucidus Coat","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Metal Fin","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Oceanic Tentacle","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Oni Mask","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Sally Crown","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Samurai Hat","Epic","Accessory","Battle Pass."},
        {"Sea King Jaw","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Shimenawa Belt","Epic","Accessory","Battle Pass."},
        {"Stealth Cape","Epic","Accessory","Battle Pass."},
        {"Straw Helmet","Epic","Accessory","Battle Pass."},
        {"Tengu Mask","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Tomoe Taiko","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Water Hydra Mask","Epic","Accessory","Boss drop; cek indeks boss."},
        {"Water Kimono","Epic","Accessory","Battle Pass."},
        {"Crustacean Armor","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Dark Beard Hat","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Dominion Cloak","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Dragon Band","Legendary","Accessory","Battle Pass."},
        {"Dragon Necklace","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Drakenfyr Cape","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Empress Kimono","Legendary","Accessory","Battle Pass."},
        {"Floffy Glasses","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Gold Serpent","Legendary","Accessory","Craft di Whirlseer; resep perlu verifikasi."},
        {"Inferno Cloak","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Night Cap","Legendary","Accessory","Battle Pass."},
        {"Night Necklace","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Oceanic Tanto","Legendary","Accessory","Boss drop; cek indeks boss."},
        {"Prestige Dagger","Legendary","Accessory","Battle Pass."},
        {"Steel Knight Armor","Legendary","Accessory","Craft di Serpentforger Elwyn; resep perlu verifikasi."},
        {"Abyssal Tyrant Armor","Mythical","Accessory","Boss drop; cek indeks boss."},
        {"Acromask","Mythical","Accessory","Boss drop; cek indeks boss."},
        {"Infernal Manehelm","Mythical","Accessory","Boss drop; cek indeks boss."},
        {"Cervus","Limited","Accessory","Limited; boss drop menurut indeks."},
        {"EXP Crown","Limited","Accessory","Hadiah/gift; status perolehan perlu verifikasi."},
        {"Glacies Shoulder","Limited","Accessory","Limited; boss drop menurut indeks."},
        {"Green Dryadalis","Limited","Accessory","Limited; boss drop menurut indeks."},
        {"Hallo Lamp","Limited","Accessory","Craft di Hexley Hallow."},
        {"Hallo Shawl","Limited","Accessory","Craft di Hexley Hallow."},
        {"Nativitatis","Limited","Accessory","Limited; boss drop menurut indeks."},
        {"Pumpkin Head","Limited","Accessory","Craft di Hexley Hallow."},
    },
    Bosses = {
        {"Tashi","Boss","Boss","Lokasi/spawn perlu verifikasi di game."},
        {"Smoky","Boss","Boss","Lokasi/spawn perlu verifikasi di game."},
        {"Rumble Man","Boss","Boss","Lokasi/spawn perlu verifikasi di game."},
        {"Anubis","Boss","Boss","Lokasi/spawn perlu verifikasi di game."},
        {"Sea King","Boss","Boss","Boss laut; spawn dan drop mengikuti mekanik server."},
        {"Hydra","Boss","Boss","Boss laut; spawn dan drop mengikuti mekanik server."},
        {"Serpent","Boss","Boss","Boss laut; spawn dan drop mengikuti mekanik server."},
        {"Depth King","Event Boss","Boss","Boss baru Update 11 Halloween; detail drop perlu verifikasi."},
        {"Jack-O'-Lantern","Event Boss","Boss","Boss event Halloween di Third Sea."},
        {"Skull King","Event Boss","Boss","Event Halloween; dapat dipanggil dengan Candy di Second Sea."},
    },
    Materials = {
        {"Dragon Scale","Material","Material","Lokasi/drop perlu verifikasi."},
        {"Sea King's Blood","Material","Material","Cari dari aktivitas/boss Sea King; drop rate perlu verifikasi."},
        {"Sea King's Fin","Material","Material","Material boss laut; cek drop boss."},
        {"Hydra's Tail","Material","Material","Material boss Hydra; cek drop boss."},
        {"Pearl","Material","Material","Lokasi/drop perlu verifikasi."},
        {"Iron Ingot","Material","Material","Lokasi/drop perlu verifikasi."},
        {"Dragon's Orb","Material","Material","Lokasi/drop perlu verifikasi."},
        {"Phoenix's Tear","Material","Material","Lokasi/drop perlu verifikasi."},
        {"Crab Meat","Material","Material","Lokasi/drop perlu verifikasi."},
        {"Kraken's Ink","Material","Material","Lokasi/drop perlu verifikasi."},
        {"Cursed Candy","Event Material","Material","Halloween: kumpulkan dari musuh/boss event; jumlah resep bervariasi."},
        {"Corrupted String","Event Material","Material","Halloween: drop Skull King menurut panduan event."},
        {"Rotten Handle","Event Material","Material","Komponen Dread Broom; resep NPC Broomhilda perlu dicek di game."},
        {"Withered Straw","Event Material","Material","Halloween: drop Jack-O'-Lantern menurut panduan event."},
    },
    Other = {
        {"Legacy Pose","Gamepass","Pose","Gamepass berbayar. Tidak ada cara resmi untuk membuka gratis lewat script."},
        {"Halloween Island","Event","Island / Quest","Lokasi event musiman; ketersediaan mengikuti event aktif."},
        {"First Sea","Sea","Island / Quest","Area awal; ikuti quest NPC sesuai level."},
        {"Second Sea","Sea","Island / Quest","Akses melalui progres/quest; cek persyaratan di game."},
        {"Third Sea","Sea","Island / Quest","Akses melalui progres/quest; cek persyaratan di game."},
    }
}

local CATEGORIES = {
    {"HOME","Ringkasan"},
    {"Fruits","Buah"},
    {"Swords","Sword"},
    {"Fighting","Fighting Style"},
    {"Races","Race"},
    {"Accessories","Accessory"},
    {"Bosses","Boss"},
    {"Materials","Material"},
    {"Other","Lainnya"},
}

local theme = {
    bg = Color3.fromRGB(5, 20, 35),
    panel = Color3.fromRGB(9, 39, 61),
    panel2 = Color3.fromRGB(12, 55, 78),
    accent = Color3.fromRGB(0, 190, 220),
    text = Color3.fromRGB(230, 247, 255),
    muted = Color3.fromRGB(145, 183, 200),
    green = Color3.fromRGB(90, 220, 170),
}

local gui = Instance.new("ScreenGui")
gui.Name = "JUANDA_HUB"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local function corner(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 10)
    c.Parent = obj
end

local function stroke(obj, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or theme.accent
    s.Thickness = thickness or 1
    s.Transparency = 0.35
    s.Parent = obj
end

local function make(class, props, parent)
    local obj = Instance.new(class)
    for k,v in pairs(props or {}) do obj[k] = v end
    obj.Parent = parent
    return obj
end

local floating = make("TextButton", {
    Name = "OpenButton", Text = "J", TextSize = 22, Font = Enum.Font.GothamBold,
    TextColor3 = theme.text, BackgroundColor3 = theme.panel2,
    Size = UDim2.fromOffset(52,52), Position = UDim2.new(0,16,0.45,0),
    AutoButtonColor = true,
}, gui)
corner(floating, 26); stroke(floating, theme.accent, 2)

local main = make("Frame", {
    Name = "Main", Size = UDim2.new(0.88,0,0.78,0),
    Position = UDim2.new(0.06,0,0.11,0), BackgroundColor3 = theme.bg,
    Visible = false,
}, gui)
corner(main, 14); stroke(main, theme.accent, 1.5)

local scale = make("UIScale", {Scale = 1}, main)
local function updateScale()
    local cam = workspace.CurrentCamera
    if not cam then return end
    local w = cam.ViewportSize.X
    scale.Scale = math.clamp(w / 430, 0.78, 1)
end
updateScale()
if workspace.CurrentCamera then
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
end

local top = make("Frame", {
    Size = UDim2.new(1,0,0,48), BackgroundColor3 = theme.panel,
}, main)
corner(top, 14)
make("TextLabel", {
    BackgroundTransparency = 1, Position = UDim2.fromOffset(12,0),
    Size = UDim2.new(1,-110,1,0), Text = "JUANDA HUB  •  KING LEGACY",
    Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left,
    TextColor3 = theme.text,
}, top)
local minimize = make("TextButton", {
    Text = "—", Font = Enum.Font.GothamBold, TextSize = 20,
    TextColor3 = theme.text, BackgroundColor3 = theme.panel2,
    Size = UDim2.fromOffset(38,32), Position = UDim2.new(1,-48,0,8),
}, top)
corner(minimize,8)

local search = make("TextBox", {
    PlaceholderText = "Cari buah, sword, boss, material...",
    Text = "", ClearTextOnFocus = false, Font = Enum.Font.Gotham,
    TextSize = 13, TextColor3 = theme.text, PlaceholderColor3 = theme.muted,
    BackgroundColor3 = theme.panel, Size = UDim2.new(1,-20,0,38),
    Position = UDim2.fromOffset(10,58),
}, main)
corner(search,9)

local tabs = make("ScrollingFrame", {
    BackgroundTransparency = 1, BorderSizePixel = 0,
    Size = UDim2.new(1,-16,0,38), Position = UDim2.fromOffset(8,102),
    CanvasSize = UDim2.new(0,0,0,0), AutomaticCanvasSize = Enum.AutomaticSize.X,
    ScrollingDirection = Enum.ScrollingDirection.X, ScrollBarThickness = 2,
}, main)
make("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0,6),
    SortOrder = Enum.SortOrder.LayoutOrder,
}, tabs)

local list = make("ScrollingFrame", {
    BackgroundColor3 = theme.panel, BorderSizePixel = 0,
    Size = UDim2.new(0.48,-12,1,-158), Position = UDim2.fromOffset(10,146),
    CanvasSize = UDim2.new(0,0,0,0), AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ScrollBarThickness = 3,
}, main)
corner(list,10)
make("UIListLayout", {
    Padding = UDim.new(0,5), SortOrder = Enum.SortOrder.LayoutOrder,
}, list)
make("UIPadding", {
    PaddingTop = UDim.new(0,7), PaddingBottom = UDim.new(0,7),
    PaddingLeft = UDim.new(0,7), PaddingRight = UDim.new(0,7),
}, list)

local detail = make("ScrollingFrame", {
    BackgroundColor3 = theme.panel, BorderSizePixel = 0,
    Size = UDim2.new(0.52,-12,1,-158), Position = UDim2.new(0.48,2,0,146),
    CanvasSize = UDim2.new(0,0,0,0), AutomaticCanvasSize = Enum.AutomaticSize.Y,
    ScrollBarThickness = 3,
}, main)
corner(detail,10)
make("UIListLayout", {
    Padding = UDim.new(0,7), SortOrder = Enum.SortOrder.LayoutOrder,
}, detail)
make("UIPadding", {
    PaddingTop = UDim.new(0,10), PaddingBottom = UDim.new(0,10),
    PaddingLeft = UDim.new(0,10), PaddingRight = UDim.new(0,10),
}, detail)

local status = make("TextLabel", {
    BackgroundTransparency = 1, Size = UDim2.new(1,-20,0,18),
    Position = UDim2.new(0,10,1,-23), Text = "Panduan lokal • Data yang belum pasti ditandai",
    Font = Enum.Font.Gotham, TextSize = 10, TextColor3 = theme.muted,
    TextXAlignment = Enum.TextXAlignment.Left,
}, main)

local currentCategory = "HOME"
local selected = nil
local favorites = {}
local checklist = {}

local function clearFrame(frame)
    for _,child in ipairs(frame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") then child:Destroy() end
    end
end

local function label(parent, text, height, size, color, bold)
    return make("TextLabel", {
        BackgroundTransparency = 1, Size = UDim2.new(1,-4,0,height or 42),
        AutomaticSize = Enum.AutomaticSize.Y,
        TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top, Text = text,
        Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham,
        TextSize = size or 12, TextColor3 = color or theme.text,
    }, parent)
end

local function showDetail(item)
    selected = item
    clearFrame(detail)
    if not item then
        label(detail, "Pilih item di daftar untuk melihat panduannya.", 50, 13, theme.muted)
        return
    end
    label(detail, item[1], 30, 17, theme.accent, true)
    label(detail, "Kategori: "..item[3].."  •  Rarity: "..item[2], 34, 11, theme.muted)
    label(detail, "CARA MENDAPATKAN", 20, 11, theme.green, true)
    label(detail, item[4], 90, 12)
    label(detail, "SYARAT / MATERIAL", 20, 11, theme.green, true)
    label(detail, "Belum ada resep terverifikasi untuk entri ini. Periksa NPC, drop, dan update terbaru di dalam game.", 70, 11, theme.muted)
    local key = item[1]
    local fav = make("TextButton", {
        Size = UDim2.new(1,-2,0,34),
        Text = favorites[key] and "★ Hapus Favorit" or "☆ Tambah Favorit",
        Font = Enum.Font.GothamBold, TextSize = 12,
        TextColor3 = theme.text, BackgroundColor3 = theme.panel2,
    }, detail)
    corner(fav,8)
    fav.MouseButton1Click:Connect(function()
        favorites[key] = not favorites[key]
        showDetail(item)
    end)
    local check = make("TextButton", {
        Size = UDim2.new(1,-2,0,34),
        Text = checklist[key] and "✓ Sudah didapat" or "□ Tandai sudah didapat",
        Font = Enum.Font.GothamBold, TextSize = 12,
        TextColor3 = theme.text, BackgroundColor3 = theme.panel2,
    }, detail)
    corner(check,8)
    check.MouseButton1Click:Connect(function()
        checklist[key] = not checklist[key]
        showDetail(item)
    end)
end

local function render()
    clearFrame(list)
    if currentCategory == "HOME" then
        showDetail(nil)
        label(list, "Selamat datang di JUANDA HUB", 35, 15, theme.accent, true)
        local count = 0
        for _,items in pairs(DATA) do count += #items end
        label(list, "Jumlah entri lokal: "..count, 28, 12)
        label(list, "Pilih tab kategori untuk melihat daftar. Gunakan kotak pencarian untuk mencari nama item.", 80, 12, theme.muted)
        label(list, "Catatan: katalog ini berisi entri awal, bukan seluruh katalog resmi. Lokasi, drop rate, dan resep yang belum pasti tidak ditebak.", 110, 11, theme.muted)
        return
    end
    local source = DATA[currentCategory] or {}
    local q = string.lower(search.Text or "")
    local matches = {}
    for _,item in ipairs(source) do
        if q == "" or string.find(string.lower(item[1]), q, 1, true) then
            table.insert(matches,item)
        end
    end
    for _,item in ipairs(matches) do
        local b = make("TextButton", {
            Size = UDim2.new(1,-2,0,42), Text = item[1].."  •  "..item[2],
            Font = Enum.Font.GothamSemibold, TextSize = 11,
            TextColor3 = theme.text, TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = theme.panel2,
        }, list)
        corner(b,8)
        b.MouseButton1Click:Connect(function() showDetail(item) end)
    end
    if #matches == 0 then
        label(list, "Tidak ada hasil. Coba kata kunci lain.", 45, 12, theme.muted)
    end
end

for _,tabInfo in ipairs(CATEGORIES) do
    local tab = make("TextButton", {
        Size = UDim2.fromOffset(100,32), Text = tabInfo[2],
        Font = Enum.Font.GothamBold, TextSize = 11,
        TextColor3 = theme.text, BackgroundColor3 = theme.panel2,
    }, tabs)
    corner(tab,8)
    tab.MouseButton1Click:Connect(function()
        currentCategory = tabInfo[1]
        render()
    end)
end

search:GetPropertyChangedSignal("Text"):Connect(render)
floating.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)
minimize.MouseButton1Click:Connect(function() main.Visible = false end)

-- Drag window via top bar (mouse/touch)
local dragging, dragStart, startPos
top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

render()
