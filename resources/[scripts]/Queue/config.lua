Config = {}

----------------------------------------------------
--------- Interavall i sekunder --------------------
----------------------------------------------------

-- Väntetid för antispam.
Config.AntiSpamTimer = 3

-- Timer för att se lediga platser.
Config.TimerCheckPlaces = 3

-- Timer för att uppdatera emojis.
Config.TimerRefreshClient = 3

-- Timer för att uppdatera samlade poäng.
Config.TimerUpdatePoints = 6

----------------------------------------------------
--------------- Poängsystem ------------------------
----------------------------------------------------

-- Antal poäng att få per sekund.
Config.AddPoints = 1

-- Antal poäng förlorade när man ansluter till servern.
Config.RemovePoints = 1

-- Poäng för dem som vinner lotteriet (3 likadana emojis).
Config.LoterieBonusPoints = 25

-- Hex samt poäng man startar med i kön.
Config.Points = {

--	Exempel:
--	{'steam:123456', 100},
--	{'steam:7891011', 100}

	{'steam:110000105dbc118', 1000}
}

----------------------------------------------------
--------------- Textmeddelanden --------------------
----------------------------------------------------

Config.NoSteam = " Steam kunde inte upptäckas, starta om Steam samt FiveM och försök igen."

Config.EnRoute = " Du har "

Config.PointsRP = " poäng samlade"

Config.Position = "Du är på plats "

Config.EmojiMsg = "Om siffrorna fryser, starta om spelet: "

Config.EmojiBoost = " Grattis! du vann, " .. Config.LoterieBonusPoints .. " " .. Config.PointsRP .. " poäng! "

Config.PleaseWait_1 = "Vänligen vänta "

Config.PleaseWait_2 = " sekunder. "

Config.Accident = " ERROR: Något gick fel! "

Config.Error = " ERROR: Starta om kö-systemet. "


Config.EmojiList = {
	'1️⃣', 
	'2️⃣',
	'3️⃣', 
	'4️⃣', 
	'5️⃣',
	'6️⃣', 
	'7️⃣ ', 
	'8️⃣ ',
	'9️⃣ '
}
