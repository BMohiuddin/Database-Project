Create Procedure SearchByPlat
@PlatName varchar(50), @GameName varchar(100)
As
Select Game.GameID, Game.[Name] as GameName, [Platform].Platform_Name
From Game inner join platform_has_game on
Game.GameID = platform_has_game.Game_GameID
inner join [Platform] on
[Platform].PlatformID = platform_has_game.Platform_PlatformID
Where [Platform].Platform_Name = @PlatName and Game.[Name] = @GameName
Go

Create Procedure SearchByPlatPlat
@PlatName varchar(50)
As
Select Game.GameID, Game.[Name] as GameName, [Platform].Platform_Name
From Game inner join platform_has_game on
Game.GameID = platform_has_game.Game_GameID
inner join [Platform] on
[Platform].PlatformID = platform_has_game.Platform_PlatformID
Where [Platform].Platform_Name = @PlatName
Go

Create Procedure SearchByPlatGame
@GameName varchar(100)
As
Select Game.GameID, Game.[Name] as GameName, [Platform].Platform_Name
From Game inner join platform_has_game on
Game.GameID = platform_has_game.Game_GameID
inner join [Platform] on
[Platform].PlatformID = platform_has_game.Platform_PlatformID
Where Game.[Name] = @GameName
Go

Exec SearchByPlatPlat @PlatName = 'mobile game'