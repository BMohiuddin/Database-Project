Create Procedure SearchByDev
@DevName varchar(50), @Based varchar(50)
As
Select Game.GameID, Game.[Name] as GameName, Developer.[Name] as DeveloperName, Developer.Based_In
From Game inner join Developer on
Game.Developer_DeveloperID = Developer.DeveloperID
Where  Developer.[Name] = @DevName AND Developer.Based_In = @Based
Go

Create Procedure SearchByDevOne
@DevName varchar(50)
As
Select Game.GameID, Game.[Name] as GameName, Developer.[Name] as DeveloperName, Developer.Based_In
From Game inner join Developer on
Game.Developer_DeveloperID = Developer.DeveloperID
Where  Developer.[Name] = @DevName
Go

Create Procedure SearchByDevTwo
@Based varchar(50)
As
Select Game.GameID, Game.[Name] as GameName, Developer.[Name] as DeveloperName, Developer.Based_In
From Game inner join Developer on
Game.Developer_DeveloperID = Developer.DeveloperID
Where Developer.Based_In = @Based
Go

Create Procedure SearchByDevPub
@DevName varchar(50), @Based varchar(50), @Pub bit
As
Select Game.GameID, Game.[Name] as GameName, Developer.[Name] as DeveloperName, Developer.Based_In
From Game inner join Developer on
Game.Developer_DeveloperID = Developer.DeveloperID
Where  Developer.[Name] = @DevName AND Developer.Based_In = @Based And
Developer.Publisher = @Pub
Go

Create Procedure SearchByDevOnePub
@DevName varchar(50), @Pub bit
As
Select Game.GameID, Game.[Name] as GameName, Developer.[Name] as DeveloperName, Developer.Based_In
From Game inner join Developer on
Game.Developer_DeveloperID = Developer.DeveloperID
Where  Developer.[Name] = @DevName And
Developer.Publisher = @Pub
Go

Create Procedure SearchByDevTwoPub
@Based varchar(50), @Pub bit
As
Select Game.GameID, Game.[Name] as GameName, Developer.[Name] as DeveloperName, Developer.Based_In
From Game inner join Developer on
Game.Developer_DeveloperID = Developer.DeveloperID
Where Developer.Based_In = @Based And
Developer.Publisher = @Pub
Go

Exec SearchByDev @DevName = 'Radical Entertainment', @Based = 'Canada';