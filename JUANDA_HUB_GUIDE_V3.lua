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
        {"Spin","Common","Buah","Spawn dunia, Black Market/Gacha, daily reward, chest, Battlepass, atau trading."},
        {"Bomb","Common","Buah","Spawn dunia, Black Market/Gacha, daily reward, chest, Battlepass, atau trading. Memiliki awakening."},
        {"Spike","Common","Buah","Spawn dunia, Black Market/Gacha, daily reward, chest, Battlepass, atau trading."},
        {"Barrier","Uncommon","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Paw","Uncommon","Buah","Penamaan dapat berbeda di wiki versi baru; cek nama inventory aktif."},
        {"Telekinesis","Uncommon","Buah","Spawn/dealer/Gacha/trading; buah ini menggantikan Human pada update."},
        {"Love","Uncommon","Buah","Memiliki awakening; spawn, dealer/Gacha, chest, Battlepass, atau trading."},
        {"String","Uncommon","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Wolf","Uncommon","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Giraffe","Uncommon","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Shadow","Uncommon","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Smoke","Uncommon","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Rubber","Rare","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Sand","Rare","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Mammoth","Rare","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Spinosaurus","Rare","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Brachiosaurus","Rare","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Leopard","Rare","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Magnet","Epic","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Gold","Epic","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Spirit","Epic","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
        {"Allosaurus","Rare","Buah","Spawn dunia, dealer/Gacha, chest, Battlepass, atau trading."},
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
        {"Barbaric Axe","Rare","Pedang","Drop The Barbaric boss; wiki mencantumkan 20%."},
        {"Mini Mace","Rare","Pedang","Dibeli 3.000.000 Beli di War Island."},
        {"Pipe","Uncommon","Pedang","Dibeli 500.000 Beli di Bubble Island."},
        {"Gold Spear","Rare","Pedang","Drop Dory; wiki mencantumkan 15%."},
        {"Shark Blade","Rare","Pedang","Drop Shark Man; wiki mencantumkan 15%."},
        {"Triple Katana","Rare","Pedang","Dibeli 2.500.000 Beli di Rocks Island."},
        {"Demon Trident","Rare","Pedang","Drop Seasoned Fishman; wiki mencantumkan 20%."},
        {"Mom Blade","Rare","Pedang","Drop Monster boss; wiki mencantumkan 20%."},
        {"Quake Spear","Rare","Pedang","Drop Quake Woman; wiki mencantumkan 5%."},
        {"Dragons Standard","Rare","Pedang","Chest Pirates event; wiki mencantumkan 30%."},
        {"Saber","Rare","Pedang","Drop Expert Swordsman; wiki 10–15% tergantung halaman."},
        {"Anubis Axe","Rare","Pedang","Drop Anubis di Dead Tundra; wiki mencantumkan 10%."},
        {"Adventure Knife","Rare","Pedang","Drop Flame User boss; data peluang wiki tidak konsisten."},
        {"Sunken Blade","Rare","Pedang","Drop Sunken Vessel di Loaf Island; wiki mencantumkan 5%."},
        {"Hunter Blade","Limited","Pedang","Hadiah pencapaian bounty lama; tidak dapat diperdagangkan."},
        {"Pondere Blade","Rare","Pedang","Drop Pondere/Fujitora; wiki mencantumkan 5%."},
        {"Soul Cane","Rare","Pedang","Drop Sally boss; wiki mencantumkan 5%."},
        {"Hell Sword","Legendary","Pedang","Drop King Samurai di Floresco Castle; wiki mencantumkan 50%."},
        {"Authentic Mace","Legendary","Pedang","Drop Dragon Raid Boss; wiki mencantumkan 10%."},
        {"Metal Trident","Rare","Pedang","Drop Dough Master di Mirror World; wiki mencantumkan 1%."},
        {"Cookie Sword","Rare","Pedang","Drop Biscuit Man di Loaf Island; wiki mencantumkan 5%."},
        {"Apollos","Rare","Pedang","Drop Prince Aria; peluang berbeda antarhalaman."},
        {"Acrospear","Epic","Pedang","Craft; wiki menyebut Acroeyes x9 + Hydra Tail x1."},
        {"Riptide Slayer","Mythical","Pedang","Craft/drop Abyssal Tyrant. Dragon Bones x1, Hydra Tail x5, Dragon Fang x2, Severed Kraken x25, Sea King's Blood x50, Dragon Scale x50."},
        {"Sonata","Event","Pedang","Chest Flag Token Shop."},
        {"Dawnbreaker","Legendary","Pedang","Drop Ashen Talon di Third Sea Dungeon; wiki 5%."},
        {"Blood Moon Twins","Mythical","Pedang","Quest lalu beli 22.500.000 Beli."},
        {"Draken Fangs","Mythical","Pedang","Craft/drop Drakenfyr. Dragon Bones x2, Hydra Tail x5, Dragon Fang x2, Noir Pearl x15, Dragon Scale x150, Sea Artifact x500."},
        {"Kioru V2","Legendary","Pedang","Questline lalu beli 55.500.000 Beli menurut Swords V2 wiki."},
        {"Ethereal","Legendary","Pedang","Drop Bushido Ape saat Blood Moon di The Shallows; wiki 5%."},
        {"Avalon","Legendary","Pedang","Chest Pirates event; wiki mencantumkan 1%."},
        {"Daybreak Cleaver","Legendary","Pedang","Chest Sea King/Hydra; peluang tergantung tier chest."},
        {"Scepter of Flame","Legendary","Pedang","Chest Sea King/Hydra; peluang tergantung tier chest."},
        {"Aquatic Anchor","Legendary","Pedang","Chest Hydra; peluang tergantung tier chest."},
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
        {"Horned Hat","Uncommon","Accessory","Drop Little Dear/Chopper; quest wiki sekitar 15%."},
        {"Gazelle Mask","Uncommon","Accessory","Drop Gazelleman; quest wiki sekitar 5%."},
        {"Floffy Glasses","Legendary","Accessory","Drop Floffy/Doflamingo; quest wiki sekitar 0.8%."},
        {"Hydra Mask","Epic","Accessory","Hadiah chest Hydra; peluang tergantung tier."},
        {"Inferno Cloak","Legendary","Accessory","Hadiah chest Hydra; peluang tergantung tier."},
        {"Drakenfyr Cape","Legendary","Accessory","Sea Event Drakenfyr; detail drop perlu verifikasi."},
        {"Dominion Cloak","Legendary","Accessory","Drop Abyssal Swordsman level 3750; syarat Control awakening."},
        {"Steel Knight Armor","Legendary","Accessory","Craft Serpentforger Elwyn; resep perlu verifikasi."},
        {"Oceanic Tanto","Legendary","Accessory","Third Sea sea-event reward; sumber perlu verifikasi."},
        {"Abyssal Tyrant Armor","Mythical","Accessory","Loot Abyssal Tyrant; peluang perlu verifikasi."},
        {"Night Necklace","Legendary","Accessory","Raid chest reward."},
        {"Crustacean Armor","Legendary","Accessory","Raid chest reward."},
        {"Oceanic Tentacle","Epic","Accessory","Raid chest reward."},
        {"Metal Fin","Epic","Accessory","Raid chest reward."},
        {"Sea King Skull","Limited","Accessory","Limited event accessory; cek event aktif."},
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
        {"The Barbaric","Normal Boss","Boss","Soldier Island; drop Barbaric Axe dan Stainless Jaw."},
        {"Shark Man","Normal Boss","Boss","Shark Island; drop Shark Blade sekitar 15%."},
        {"Dory","Normal Boss","Boss","Chef Ship; drop Gold Spear sekitar 15%."},
        {"Little Dear","Normal Boss","Boss","Snow Island; drop Horned Hat."},
        {"Expert Swordsman","World Boss","Boss","Stone Arena First Sea; drop Saber 10–15%."},
        {"King Samurai","World Boss","Boss","Floresco Castle Second Sea; drop Hell Sword 50%, Muramasa 10–15%."},
        {"Kaido","Raid Boss","Boss","Skull Island/Onigashima; summon Dragon Gem, Authentic Mace 10%."},
        {"Oden","Raid Boss","Boss","Oden's Castle, Floresco; drop Hell Sword menurut indeks boss."},
        {"Ghost Ship","Sea Event","Boss","Second Sea; chest dapat berisi Longaevus, Force of Verdant, necklaces, Eyepatch."},
        {"Drakenfyr","Sea Event","Boss","Third Sea; material Draken Fangs."},
        {"Abyssal Tyrant","Sea Event","Boss","Third Sea; Hydra Tail/material Riptide Slayer."},
        {"Deepsea Crusher","Sea Event","Boss","Third Sea; Crab Meat/material Abyssal Crab Axe."},
        {"Saber Lord","Raid Boss","Boss","Unearthly Third Sea; dibutuhkan untuk Saber V2."},
        {"Bushido Ape","Raid Boss","Boss","The Shallows saat Blood Moon; drop Ethereal sekitar 5%."},
        {"Ashen Talon","Dungeon Boss","Boss","Third Sea Dungeon; drop Dawnbreaker sekitar 5%."},
        {"Mrs. Mother","Raid Boss","Boss","Loaf Island; drop Phoenix Blade sekitar 1%."},
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
        {"Leather","Common","Material","Drop dari NPC/boss level awal seperti Wolf/Giraffe; cek quest drop table."},
        {"Log","Common","Material","Drop NPC/boss tertentu; gunakan Material wiki untuk sumber per mob."},
        {"Rusted Scrap","Common","Material","Drop NPC First Sea dan quest mobs; sekitar 30% pada beberapa quest table."},
        {"Angelic Feather","Common","Material","Material Dungeon; dipakai untuk Demon Race V1/V2."},
        {"Carrot","Common","Material","Drop NPC Second Sea; dipakai Animal Race V2 dan Electro V2."},
        {"Pile of Bones","Common","Material","Drop mob/boss tertentu; sumber spesifik perlu verifikasi."},
        {"Sea Artifact","Common","Material","Material sea activity; dipakai resep Draken Fangs."},
        {"Fresh Fish","Uncommon","Material","Drop Fishman NPC; Shark Island quest table."},
        {"Bread Crumbs","Uncommon","Material","Drop mob tertentu; cek Materials wiki."},
        {"Undead's Ooze","Uncommon","Material","Drop undead NPC/boss; cek Materials wiki."},
        {"Thief's Rag","Uncommon","Material","Drop thief NPC; cek Materials wiki."},
        {"Coral","Uncommon","Material","Sea material; sumber spesifik perlu verifikasi."},
        {"Shark's Fin","Uncommon","Material","Drop Shark/Fishman mobs; sumber spesifik perlu verifikasi."},
        {"Gunpowder","Rare","Material","Drop Dory dan boss/quest NPC tertentu."},
        {"Pearl","Rare","Material","Drop sea-related NPC/event; sumber perlu verifikasi."},
        {"Shark's Canine","Epic","Material","Drop Shark Man/related boss; cek Materials wiki."},
        {"Sea's Wraith","Epic","Material","Drop sea event/mob; cek Materials wiki."},
        {"Vampire's Vital Fluid","Epic","Material","Drop vampire-type NPC; cek Materials wiki."},
        {"Magma Crystal","Epic","Material","Drop Magma-related NPC/boss; cek Materials wiki."},
        {"Essence of Fire","Epic","Material","Drop fire-related NPC/boss; cek Materials wiki."},
        {"Ice Crystal","Epic","Material","Drop Ice King/ice mobs; cek Materials wiki."},
        {"Samurai's Badge","Epic","Material","Drop Samurai NPC Second Sea."},
        {"Lucidus's Totem","Epic","Material","Drop Vice Admiral/Lucidus questline; diperlukan summon Lucidus."},
        {"Dark Beard's Totem","Epic","Material","Material summon Dark Beard."},
        {"Severed Kraken","Epic","Material","Third Sea sea-event material; dipakai Riptide Slayer."},
        {"Obsidian","Epic","Material","Third Sea material; sumber perlu verifikasi."},
        {"Dragon Bones","Mythical","Material","Third Sea sea-event/boss material; dipakai Draken Fangs dan senjata crafting."},
        {"Dragon Fang","Legendary","Material","Third Sea boss material; dipakai Draken Fangs/Riptide Slayer."},
        {"Twilight's Orb","Legendary","Material","Boss/event material; sumber perlu verifikasi."},
        {"Voltix","Legendary","Material","Material tier Legendary; sumber perlu verifikasi."},
        {"Crustar","Legendary","Material","Material tier Legendary; sumber perlu verifikasi."},
        {"Diverse Sphere","Mythical","Material","Third Sea material; sumber perlu verifikasi."},
        {"Trickshard","Mythical","Material","Third Sea material; sumber perlu verifikasi."},
        {"Withered Straw","Event Material","Material","Halloween: drop Jack-O'-Lantern menurut panduan event."},
    },
    Other = {
        {"Legacy Pose","Gamepass","Pose","Gamepass berbayar. Tidak ada cara resmi untuk membuka gratis lewat script."},
        {"Halloween Island","Event","Island / Quest","Lokasi event musiman; ketersediaan mengikuti event aktif."},
        {"First Sea","Sea","Island / Quest","Area awal; ikuti quest NPC sesuai level."},
        {"Second Sea","Sea","Island / Quest","Akses melalui progres/quest; cek persyaratan di game."},
        {"Third Sea","Sea","Island / Quest","Akses melalui progres/quest; cek persyaratan di game."},
    },
    Islands = {
        {"Starter Island","Level 0+","Island / Quest","First Sea: Soldiers, Clown Pirates, Smoky, Tashi."},
        {"Pirate Island","Level 50+","Island / Quest","Clown Swordsmen dan The Clown."},
        {"Soldier Island","Level 100+","Island / Quest","Commanders, Captain, The Barbaric."},
        {"Shark Island","Level 180+","Island / Quest","Fighter Fishmen, Karate Fishman, Shark Man; Cyborg NPC di bukit belakang."},
        {"Chef Ship","Level 250+","Island / Quest","Trainer Chefs, Dark Leg, Dory; Dark Leg NPC lantai atas."},
        {"Snow Island","Level 400+","Island / Quest","Snow Soldiers, King Snow, Little Dear."},
        {"Desert Island","Level 525+","Island / Quest","King of Sand dan quest level menengah."},
        {"Sky Island","Level 800+","Island / Quest","Ball Man dan Rumble Man; Pole drop dari Rumble Man."},
        {"Bubble Island","Level 1000+","Island / Quest","Quest First Sea; Pipe sword."},
        {"Lobby Island","Level 1200+","Island / Quest","Area quest First Sea."},
        {"Zombie Island","Level 1500+","Island / Quest","Oars dan quest level tinggi."},
        {"War Island","Level 1750+","Island / Quest","Dragon Claw style dan Mini Mace."},
        {"Fishland","Level 2000+","Island / Quest","Water Style NPC tersembunyi di belakang bangunan."},
        {"Fons Land","Level 2250+","Island / Quest","Second Sea progression awal; Beast Pirates."},
        {"Hibernus Land","Level 2400+","Island / Quest","Electro style NPC di bukit kecil."},
        {"Floresco","Level 2550+","Island / Quest","Boss X Drake/Hawkins/Kinemon dan NPC style/race."},
        {"New Marineford","Level 3500+","Island / Quest","Vice Admirals, Fujitora, Hefty, Lucidus."},
        {"Fiore Island","Level 3600+","Island / Quest","Gladiators, Fiore Fighters, Fiore Pirates."},
        {"Land of Detention","Third Sea","Island / Quest","Dungeon entrance; Demon race dan Justice Fist NPC."},
        {"Crowned Isle","Third Sea","Island / Quest","Tiki Taka NPC untuk Striker style."},
        {"Unearthly","Third Sea","Island / Quest","Saber Lord spawn; unlock Saber V2."},
        {"The Shallows","Third Sea","Island / Quest","Blood Moon dan Bushido Ape."},
        {"Loaf Island","Third Sea","Island / Quest","Mrs. Mother/Biscuit Man; beberapa sword dan accessory."},
    },
    Quests = {
        {"Animal Race V2","Level 3000+","Quest","Animal V1 + Carrots x8,184 + 500,000 Beli; 11 tahap Bunny Girl dan NPC lintas pulau."},
        {"Animal Race V3","Level 4500+","Quest","Third Sea, pulau Compass; boss, puzzle 3x3, Void Orb x10 dari dungeon."},
        {"Demon Race V1","Human Race","Quest","Dravhiel: kalahkan 10 Imprisoned Angels; bayar 5M Beli + Angelic Feather x100."},
        {"Demon Race V2","Demon V1","Quest","Kalahkan 10 Imprisoned Demons; bayar 7M Beli + Angelic Feather x150."},
        {"Demon Race V3","Level 4500+","Quest","Pulau obor, Lilithar, puzzle, kalahkan Dravhiel boss, bicara Lilithar lagi."},
        {"Dark Leg V2","Level 3500+","Quest","Dark Leg V1, Armament Haki V2, Observation Haki V2, Master of Dark Leg, 30M Beli (wiki)."},
        {"Electro V2","Animal V2","Quest","Electro V1; Vince/Japan Island, carrot + boss progression, Kaido, NPC Fiore dan 25M Beli; detail perlu cek."},
        {"Dragon Claw V2","Human V2","Quest","Dragon Scale x30, Fujitora x25, 25M Beli di Fiore Mansion (wiki)."},
        {"Cyborg V2","Level 3000+","Quest","Iron Ingot x4,500; Rusted Scrap x1,500; Lost Ruby x10; Sea King's Fin x3; Hydra's Tail x2; Dragon's Orb x1."},
        {"Justice Fist","Third Sea","Quest","NPC dekat pintu Dungeon di Land of Detention; ikuti questline."},
        {"Striker","Third Sea","Quest","Tiki Taka NPC di Crowned Isle; ikuti questline."},
        {"Trickster","Third Sea","Quest","Wisp NPC di kastil Starter Island Third Sea; ikuti questline."},
        {"Kioru","Fisher Tiger Quest","Quest","Selesaikan seluruh quest Fisher Tiger lalu beli 25M Beli."},
        {"Kioru V2","Kioru","Quest","Questline lalu beli 55.5M Beli menurut Swords V2 wiki."},
        {"Fruit Awakening","Fruit equipped","Quest","Awaken Master di Viridans (Second Sea) atau dekat Nishi (Third Sea); buah duplikat, Gems, dan syarat khusus."},
    },
    SeaEvents = {
        {"Sea King","Second Sea","Sea Event","Event sekitar hourly; Legacy Island acak. Chest T1-T3 setelah boss; ambil sebelum pulau tenggelam."},
        {"Hydra","Second Sea","Sea Event","Boss 3 fase; chest T1-T4 berisi senjata, accessory, Gems, Beli dan buah."},
        {"Drakenfyr","Third Sea","Sea Event","Sea event; material crafting Draken Fangs."},
        {"Abyssal Tyrant","Third Sea","Sea Event","Sea event; Hydra Tail dan material Riptide Slayer."},
        {"Kraken's Tentacles","Third Sea","Sea Event","Sea event; Kraken material."},
        {"Deepsea Crusher","Third Sea","Sea Event","Sea event; Crab Meat dan material Abyssal Crab Axe."},
        {"Ghost Ship","Second Sea","Sea Event","Spawn periodik di laut; chest termasuk Longaevus, Force of Verdant, necklace, Eyepatch."},
        {"Pirates Event","Sea 2/3","Sea Event","Event pulau acak; chest dapat memberi Avalon/Dragons Standard sesuai versi wiki."},
    }
}


-- Detail tambahan bersumber dari halaman King Legacy Fandom.
-- Wiki adalah sumber komunitas; cek NPC/game untuk perubahan setelah update.
local GUIDES = {
    ["Dark Leg"] = [[
DARK LEG V1
Lokasi: Chef Ship, First Sea (area level 250+), lantai paling atas dekat bagian tengah.
Harga: 150.000 Beli.

DARK LEG V2
Syarat menurut wiki:
• Sudah memiliki Dark Leg V1 dan sedang meng-equip style tersebut.
• Level 3500+.
• Armament Haki V2 dan Observation Haki V2.
• Siapkan 30.000.000 Beli.
Lokasi upgrade: Marine Headquarters, Second Sea. Bicara dengan Master of Dark Leg.
Catatan: NPC di Starter Island digunakan untuk kembali ke V1.
]],
    ["Electro"] = [[
ELECTRO V1
Lokasi: Hibernus Land, Second Sea.
NPC: Electro Master.
Harga: 3.500.000 Beli.

ELECTRO V2
Syarat menurut wiki:
1. Selesaikan Animal Race V2.
2. Temui Vince di Japan Island dan berikan 300 Carrots serta uang (jumlah uang tidak dikonfirmasi wiki).
3. Kalahkan 5 boss memakai Electro V1 dengan damage melee; naikkan Electro Level sampai 5.
4. Kalahkan Kaido 5 kali memakai Electro dan berikan minimal 75.000 total damage dengan style sampai Electro Level 10.
5. Pergi ke Fiore Island, temui NPC dengan tangan listrik, bayar 25.000.000 Beli.
Material penting: sekitar 8.400 Carrots untuk rangkaian Animal V2 + Electro V2 menurut halaman Carrot.
]],
    ["Dragon Claw"] = [[
DRAGON CLAW V1
Lokasi: War Island, First Sea.
NPC: Dragon Claw Expert, dekat area Rear Admiral.
Harga: 1.250.000 Beli.

DRAGON CLAW V2
Syarat menurut wiki:
1. Selesaikan Human Race V2.
2. Temui Dacian di pantai Pirate Skull Island.
3. Serahkan Dragon Scale x30.
4. Kalahkan Fujitora 25 kali untuk menaikkan level internal Dragon Claw.
5. Temui Gil di Fiore Mansion dan bayar 25.000.000 Beli.
Dragon Scale menurut wiki dapat drop dari Dragon Raid, Drakenfyr, atau Abyssal Tyrant (10% pada halaman material; bisa berubah).
]],
    ["Cyborg"] = [[
CYBORG V1
Lokasi: bukit di belakang bangunan besar Shark Island (First Sea), atau dekat Gacha NPC di Main Island Second Sea.
Harga: 1.000.000 Beli.

CYBORG V2
Level minimum: 3000.
Total material yang dicantumkan wiki:
• Iron Ingot x4.500
• Rusted Scrap x1.500
• Lost Ruby x10
• Sea King's Fin x3
• Hydra's Tail x2
• Dragon's Orb x1

Alur quest wiki:
1. Larua di Shred Endangering Island: repair mask, Iron Ingot x1.500 + Rusted Scrap x1.500.
2. Ferrum di Fiore Island: kalahkan Kaido.
3. NPC evolusi di Skull Island/Onigashima: serahkan sisa material (Iron Ingot x3.000, Lost Ruby x10, Sea King's Fin x3, Hydra's Tail x2, Dragon's Orb x1).
Catatan: verifikasi jumlah dan urutan pada NPC; halaman wiki dapat berubah.
]],
    ["Water Style"] = [[
WATER STYLE / FISH KARATE
Lokasi V1 menurut wiki: Fishland, First Sea (area level 2000+).
NPC tersembunyi di bagian belakang bangunan utama: cari celah/lubang di belakang bangunan.
Harga yang tercantum: 1.500.000 Beli.
Wiki menyebut Fish Karate V2 pada build/halaman tertentu, tetapi detail quest dan material V2 belum cukup konsisten untuk dicantumkan sebagai pasti. Periksa NPC style di Second/Third Sea.
]],
    ["Animal"] = [[
ANIMAL RACE
Dapatkan race acak dari Hector dengan 35 Gems (wiki).
ANIMAL V2
Syarat: Animal V1, level 3000+.
NPC awal: Bunny Girl di Fiora Island.
Rangkaian 11 tahap meminta Carrots: 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, lalu tahap terakhir tanpa Carrot.
Total yang dicantumkan wiki: 8.184 Carrots + 500.000 Beli.
Efek: dash lebih jauh dan movement speed meningkat (pasif).

ANIMAL V3
Syarat level: 4500+.
Pergi ke pulau misterius yang ditunjukkan Compass (Third Sea), mulai quest NPC, kalahkan boss pulau dan selesaikan puzzle 3x3.
Serahkan Void Orb x10 (wiki menyebut drop dari Dungeon Raid).
Efek yang dicantumkan wiki: skill aktif, speed meningkat dan memulihkan 10% HP; cooldown sekitar 60 detik.
]],
    ["Demon"] = [[
DEMON RACE V1
Syarat awal menurut wiki: harus memiliki Human Race.
Lokasi: Dravhiel di Land of Detention, Third Sea.
Quest: kalahkan Imprisoned Angels x10 (lantai 1-2 Dungeon), kembali ke Dravhiel, bayar 5.000.000 Beli + Angelic Feather x100.

DEMON V2
Kalahkan Imprisoned Demons x10 (lantai 1-2 Dungeon), kembali ke Dravhiel, bayar 7.000.000 Beli + Angelic Feather x150.

DEMON V3
Level 4500+.
Cari pulau khusus dengan obor; timer 15 menit dapat diperpanjang dengan mengorbankan fruit.
Bicara dengan Lilithar, selesaikan puzzle, kalahkan boss Dravhiel, lalu bicara lagi dengan Lilithar.
Efek V3 yang dicantumkan wiki: skill aktif memberi damage boost 10% selama 10 detik, mengurangi damage musuh terkutuk 50% selama 5 detik, dan +15 walkspeed pada malam hari.
Total V1+V2: 12.000.000 Beli + Angelic Feather x250, selain Human Race.
]],
    ["Fruits"] = [[
CARA MENDAPATKAN BUAH
Menurut wiki: fruit spawn di dunia, Black Market, Gacha, daily login, chest dari minion/boss/event, Ghost Ship (Second Sea), Sea King/Hydra chest (Second Sea), dan Battlepass.
Buah yang spawn biasanya muncul berkala dan despawn jika tidak diambil; timer bisa berubah.

FRUIT V2 / AWAKENING
1. Equip buah yang ingin di-awaken.
2. Pergi ke Awaken Master di Viridans (Second Sea) atau dekat Nishi di First Island Third Sea.
3. Masukkan buah yang sama ke frame Awaken Master.
4. Bayar Gems per skill dan penuhi syarat khusus buah.
Wiki menyebut Common/Uncommon/Rare umumnya total 3 buah (1 dimakan + 2 fisik), Epic/Legendary umumnya 2 buah (1 dimakan + 1 fisik); beberapa fruit memiliki pengecualian.

BUAH AWAKENED YANG DICANTUMKAN WIKI
Bomb, Love, Venom, Buddha, Dark, Gravity, Control, Ice, Flame, Magma, Light, Snow, Rumble, Quake, Dough, Phoenix.
Syarat khusus yang dicatat:
• Magma: Oni Mask dari Crimson Demon.
• Ice: Tengu Mask dari Ice King.
• Light: Lucidus Coat dari Lucidus.
• Dark: Dark Beard Hat dari Dark Beard.
• Buddha: Hefty Coat + Hefty Glasses dari Hefty.
• Control: Dominion Cloak dari Abyssal Swordsman level 3750.
• Quake: clear 5 Easy Dungeon Second Sea.
• Dough: clear 6 Easy Dungeon Second Sea.
• Phoenix: clear 9 Easy Dungeon Third Sea.
• Rumble: clear 9 Normal Dungeon Third Sea.
RINCIAN TOTAL GEM AWAKENING (halaman Fruit Awakened Gem Costs):
Bomb 105; Love 210; Venom 185; Buddha 415; Dark 450; Gravity 125; Control 500; Ice 530; Flame 400; Magma 495; Light 550; Snow 325; Quake 495; Dough 592; Phoenix 1,147; Rumble 2,400 Gems.
Jumlah buah duplikat berbeda: Common/Uncommon/Rare umumnya 1 dimakan + 2 fisik; Epic/Legendary umumnya 1 dimakan + 1 fisik, dengan pengecualian (mis. Bomb/Love/Buddha/Control).
Syarat accessory: Magma=Oni Mask; Ice=Tengu Mask; Light=Lucidus Coat; Dark=Dark Beard Hat; Buddha=Hefty Coat + Hefty Glasses; Control=Dominion Cloak.
Syarat dungeon: Quake 5 Easy Second Sea; Dough 6 Easy Second Sea; Phoenix 9 Easy Third Sea; Rumble 9 Normal Third Sea.
]],
    ["Buddha"] = [[
BUDDHA V1
Rarity yang tercantum di halaman fruit: Rare. Bisa didapat dari spawn, Black Market, atau Gacha.
Harga Black Market pada halaman berbeda-beda (sekitar 5.5M–6.5M Beli); cek stok/harga dalam game.

BUDDHA V2
Syarat tambahan wiki:
• Buah Buddha fisik x2 (selain Buddha yang sudah dimakan/equip).
• Hefty Glasses.
• Hefty Coat.
• Temui Awaken Master dan bayar Gems untuk skill awakening.
Total gem yang dicantumkan di halaman biaya awakening: 415 Gems.
]],
    ["Venom"] = [[
VENOM V1
Rarity pada halaman wiki: Rare. Cara memperoleh: spawn, Black Market, atau Gacha.
Harga Black Market pada halaman Venom: 6.975.000 Beli.

VENOM V2
Halaman biaya awakening mencantumkan total 185 Gems.
Syarat buah: Venom yang sedang dipakai + 2 Venom fisik tambahan (total 3 menurut halaman Venom/Awakenings).
Wiki tidak mencantumkan accessory khusus untuk Venom.
]],
    ["Kioru"] = [[
KIORU
Diperoleh dengan menyelesaikan seluruh quest Fisher Tiger, lalu membeli seharga 25.000.000 Beli (wiki).
KIORU V2
Halaman Swords V2 mencantumkan questline dan pembelian 55.500.000 Beli.
Detail urutan quest/material Kioru V2 perlu diperiksa langsung di Fisher Tiger/NPC terkait karena wiki yang tersedia tidak menampilkan daftar lengkap yang konsisten.
]],
    ["Katana"] = [[
KATANA
Dibeli seharga 5.000 Beli di Starter Island (wiki Swords V2).
Tidak memiliki jalur awakening V2 yang terkonfirmasi pada halaman wiki yang diperiksa.
]],
    ["Tashi Blade"] = [[
TASHI BLADE
Drop dari boss Tashi. Halaman Swords V2 mencantumkan 25%; halaman Swords umum mencantumkan 15%.
Karena wiki berbeda angka, anggap drop rate belum pasti dan jangan jadikan angka sebagai jaminan.
]],
    ["Jitter"] = [[
JITTER
Drop dari boss Smoky. Halaman Swords V2 mencantumkan 25%.
Lokasi boss dan angka drop dapat berubah; cek indeks Boss dan wiki terbaru.
]],
    ["Pole"] = [[
POLE
Drop dari Rumble Man. Halaman Swords V2 mencantumkan 5%.
Pastikan boss dan sea yang benar dari quest/map dalam game.
]],
    ["Longaevus"] = [[
LONGAEVUS
Drop dari Ghost Ship. Halaman Swords V2 mencantumkan total peluang sekitar 0,1% (0,025% per chest).
Peluang sangat rendah dan dapat berubah.
]],
    ["Materials"] = [[
MATERIALS – KATEGORI WIKI
Common: Leather, Log, Rusted Scrap, Angelic Feather, Carrot, Pile of Bones, Sea Artifact.
Uncommon: Fresh Fish, Bread Crumbs, Iron Ingot, Undead's Ooze, Thief's Rag, Coral, Shark's Fin.
Rare: Dragon Scale, Gunpowder, Sea King's Blood, Pearl.
Epic: Shark's Canine, Sea King's Fin, Sea's Wraith, Vampire's Vital Fluid, Magma Crystal, Essence of Fire, Ice Crystal, Lost Ruby, Samurai's Badge, Lucidus's Totem, Dark Beard's Totem, Kraken's Ink, Crab Meat, Severed Kraken, Obsidian.
Legendary: Dragon's Orb, Twilight's Orb, Hydra's Tail, Phoenix's Tear, Dragon Fang, Voltix, Crustar.
Mythical: Diverse Sphere, Dragon Bones, Trickshard.
Event: Candy, keys, books.
Drop source and chance vary by NPC/boss; use material page and item-specific pages for exact routes.
]],
    ["Dragon Scale"] = [[
DRAGON SCALE
Rarity: Rare.
Digunakan untuk Dragon Claw V2, enchant accessory/sword, dan Fortune Tales.
Drop menurut wiki: Dragon Raid Boss, Drakenfyr, atau Abyssal Tyrant; halaman Dragon Scale mencantumkan 10% dari masing-masing boss.
]],
    ["Hydra's Tail"] = [[
HYDRA'S TAIL
Rarity: Legendary.
Sumber menurut wiki: Hydra Chest di Second Sea.
Dipakai untuk Authentic Triple Katana V2, enchant Aquatic Anchor, Ancient Sword, Daybreak Cleaver, Draken Fangs, Cyborg V2, dan crafting Chronicles Lore.
]],
    ["Legacy Pose"] = [[
LEGACY POSE
Legacy Pose adalah gamepass berbayar. Tidak ada metode resmi untuk membuka gamepass berbayar secara gratis melalui script.
Gunakan halaman game Roblox resmi untuk memeriksa harga dan ketersediaan terbaru.
]],
    ["Sea King"] = [[SEA KING – SECOND SEA
Spawn sekitar tiap 1 jam di public server menurut halaman Sea King; Legacy Island muncul acak di perbatasan peta. HP sekitar 1.575M–1.75M pada halaman wiki berbeda.
Setelah dikalahkan, chest Legacy Island terbuka. Ambil sebelum pulau tenggelam (sekitar 5 menit pada halaman Sea King).
Chest memberi fruit, Beli, Gems, EXP; Authentic Triple Katana dan Acroscythe punya peluang berdasarkan tier. Sea King Jaw 5%, Sea King's Fin 1%, Sea King's Blood 5% pada tabel halaman Sea King.
Angka dapat berubah; halaman Raid Boss menyebut beberapa nilai estimasi.]],
    ["Hydra"] = [[HYDRA – SECOND SEA
Boss sea event dengan 3 fase dan total HP sekitar 5.3M menurut halaman Hydra.
Chest tier: T1 1%, T2 74%, T3 24%, T4 1% (wiki). Loot termasuk Inferno Cloak, Hydra Mask, Tomoe Taiko, Scepter of Flame, Aquatic Anchor, Daybreak Cleaver, Acroscythe, Authentic Triple Katana, Gems, Beli, random fruit.
Hydra's Tail disebut sekitar 2.5% dari kill Hydra.]],
    ["Ghost Ship"] = [[GHOST SHIP – SECOND SEA
Event ship spawn periodik di antara dua pulau. Chest: Eyepatch 50%, Pirate Necklace 20%, Dragon Necklace 5%, Force of Verdant 0.33%, Longaevus 0.1% total (0.025% per chest), Gems.
Angka dikutip dari tabel komunitas/Trello dan bisa berubah.]],
    ["Drakenfyr"] = [[DRAKENFYR – THIRD SEA
Sea Event boss. Terkait Dragon Bones, Dragon Fang, Dragon Scale dan Draken Fangs.
Resep Draken Fangs: Dragon Bones x2, Hydra's Tail x5, Dragon Fang x2, Noir Pearl x15, Dragon Scale x150, Sea Artifact x500.]],
    ["Abyssal Tyrant"] = [[ABYSSAL TYRANT – THIRD SEA
Sea Event boss. Dapat menjatuhkan Hydra's Tail dan material crafting.
Resep Riptide Slayer: Dragon Bones x1, Hydra Tail x5, Dragon Fang x2, Severed Kraken x25, Sea King's Blood x50, Dragon Scale x50.]],
    ["Deepsea Crusher"] = [[DEEPSEA CRUSHER – THIRD SEA
Sea Event boss. Resep Abyssal Crab Axe: Dragon Bones x1, Dragon Fang x2, Hydra Tail x3, Aqua Gem x15, Crab Meat x10, Dragon Scale x100.]],
    ["Expert Swordsman"] = [[EXPERT SWORDSMAN – FIRST SEA
Lokasi Stone Arena, antara War Island dan Rocks Island. World boss periodik; halaman World Bosses menyebut sekitar 2 jam 30 menit.
Drop Saber sekitar 10–15% tergantung halaman wiki, plus Beli dan EXP.]],
    ["King Samurai"] = [[KING SAMURAI – SECOND SEA
Lokasi di kastil Floresco Town. Drop Hell Sword 50% dan Muramasa 10–15% tergantung versi wiki.]],
    ["Tashi Blade"] = [[TASHI BLADE
Drop dari Tashi boss level 30 di Starter/Logue Town. Quests wiki menyebut 25%, Swords umum 15%; peluang tidak pasti.]],
    ["Jitter"] = [[JITTER
Drop dari Smoky boss level 20 di Starter/Logue Town. Swords V2 wiki menyebut 25%.]],
    ["Pole"] = [[POLE
Drop dari Rumble Man di Sky Island. Swords V2 wiki menyebut 5%.]],
    ["Barbaric Axe"] = [[BARBARIC AXE
Drop dari The Barbaric boss di Soldier Island. Swords V2 wiki menyebut 20%.]],
    ["Shark Blade"] = [[SHARK BLADE
Drop dari Shark Man di Shark Island. Swords V2 wiki menyebut 15%.]],
    ["Gold Spear"] = [[GOLD SPEAR
Drop dari Dory di Chef Ship. Swords V2 wiki menyebut 15%.]],
    ["Saber"] = [[SABER / SHANKS SABER
Drop Expert Swordsman di Stone Arena. Sumber wiki memberi 10–15%; cek halaman boss aktif.]],
    ["Animal Race V2"] = [[ANIMAL V2
Wajib Animal V1 dan level 3000+. Mulai Bunny Girl di Fiora Island.
11 tahap Carrot: 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096; tahap terakhir tanpa Carrot. Total 8,184 Carrots + 500,000 Beli menurut Animal wiki.
NPC tersebar di Fiora, Desert, Magma-Ice, Loaf, Skull, Marine Base, Pirate Skull, Starter Island, lalu kembali Fiora. Buff dash dan movement speed.]],
    ["Animal Race V3"] = [[ANIMAL V3
Level 4500+. Compass Third Sea menunjukkan pulau khusus. Bicara NPC, kalahkan boss, selesaikan puzzle 3x3, serahkan Void Orb x10 dari Dungeon Raid menurut wiki. Skill aktif speed boost + heal sekitar 10% HP; cooldown sekitar 60 detik pada panduan komunitas.]],
    ["Demon Race V1"] = [[DEMON V1
Harus memiliki Human Race. Dravhiel di Land of Detention: kalahkan 10 Imprisoned Angels (Dungeon lantai 1–2), kembali bayar 5M Beli + Angelic Feather x100.]],
    ["Demon Race V2"] = [[DEMON V2
Bicara Dravhiel setelah Demon V1, kalahkan 10 Imprisoned Demons (Dungeon lantai 1–2), kembali bayar 7M Beli + Angelic Feather x150.]],
    ["Demon Race V3"] = [[DEMON V3
Level 4500+. Cari pulau khusus dengan obor; bicara Lilithar, selesaikan puzzle, kalahkan Dravhiel boss, lalu bicara Lilithar lagi.]],
    ["Demon"] = [[DEMON RACE V1–V3
V1: Human Race wajib, Dravhiel Land of Detention, 10 Imprisoned Angels, 5M Beli + Angelic Feather x100.
V2: 10 Imprisoned Demons, 7M Beli + Angelic Feather x150.
V3: level 4500+, pulau obor, Lilithar, puzzle, kalahkan Dravhiel boss. Total V1+V2: 12M Beli + 250 Angelic Feather.]],
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
    {"Islands","Pulau"},
    {"Quests","Quest"},
    {"SeaEvents","Sea Event"},
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
    detail.CanvasPosition = Vector2.new(0,0)
    clearFrame(detail)
    if not item then
        label(detail, "Pilih item di daftar untuk melihat panduannya.", 50, 13, theme.muted)
        return
    end
    label(detail, item[1], 30, 17, theme.accent, true)
    label(detail, "Kategori: "..item[3].."  •  Rarity: "..item[2], 34, 11, theme.muted)
    label(detail, "CARA MENDAPATKAN", 20, 11, theme.green, true)
    local guideText = GUIDES[item[1]] or ((item[3] == "Buah") and GUIDES["Fruits"]) or item[4]
    label(detail, guideText, 260, 11)
    label(detail, "SYARAT / MATERIAL / CATATAN", 20, 11, theme.green, true)
    label(detail, item[4] or "Perlu verifikasi di NPC dan update aktif.", 100, 11, theme.muted)
    label(detail, "Sumber: King Legacy Wiki (Fandom). Data komunitas; angka drop dan syarat bisa berubah.", 55, 10, theme.muted)
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
        label(list, "Jumlah entri katalog wiki: "..count, 28, 12)
        label(list, "Pilih tab kategori untuk melihat daftar. Gunakan kotak pencarian untuk mencari nama item.", 80, 12, theme.muted)
        label(list, "Ensiklopedia komunitas: cek detail tiap entri. Data yang berbeda antarhalaman ditandai perlu verifikasi; wiki bukan sumber resmi.", 110, 11, theme.muted)
        return
    end
    local source = DATA[currentCategory] or {}
    local q = string.lower(search.Text or "")
    local matches = {}
    for _,item in ipairs(source) do
        if q == "" or string.find(string.lower(item[1]), q, 1, true) or string.find(string.lower(item[2]), q, 1, true) or string.find(string.lower(item[4] or ""), q, 1, true) then
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
