Create Procedure SearchByGame --CreatedThenAltered
@GameName varchar(100), @FranName varchar(100), @GenreName varchar(100)
AS
Select Game.GameID,Game.[Name] as GameName,Franchise.[Name] as FranchiseName,Genre.Genre
From Game inner join Franchise on
Game.Franchise_FranchiseID = Franchise.FranchiseID
inner join genre_has_game on
genre_has_game.Game_GameID = Game.GameID
inner join Genre on
genre_has_game.Genre_GenreID = Genre.GenreID
Where Game.[Name] = @GameName and Franchise.[Name] = @FranName and Genre.Genre = @GenreName
Go
--Exec SearchByGame @GameName = 'Devil May Cry 2', @FranName = 'Devil May Cry', @GenreName = 'hack and slash';

Create Procedure SearchByGameName
@GameNameAlter varchar(100)
AS
Select Game.GameID,Game.[Name]
From Game
Where Game.[Name] = @GameNameAlter
Go

Create Procedure SearchByFanchiseName
@FranNameAlter varchar(100)
As
Select Game.GameID,Game.[Name] AS GameName,Franchise.[Name] as FranchiseName
From Franchise inner join Game on
Game.Franchise_FranchiseID = Franchise.FranchiseID
Where Franchise.[Name] = @FranNameAlter
Go

Create Procedure SearchByGenreName
@GenreNameAlter varchar(100)
As
Select Game.GameID,Game.[Name] AS GameName,Genre.Genre
From Game inner join genre_has_game on
genre_has_game.Game_GameID = Game.GameID
inner join Genre on
Genre.GenreID = genre_has_game.Genre_GenreID
Where Genre.Genre = @GenreNameAlter
Go

--Create Procedure SearchByGameTemp
--@GameName varchar(100) = NULL, @FranName varchar(100) = NULL, @GenreName varchar(100) = NULL
--AS
--Select
--From Exec SearchByGameName @GameNameAlter = @GameName

--Create Procedure SearchByGameNameMaster
--@GameName varchar(100) = NULL, @FranName varchar(100) = NULL, @GenreName varchar(100) = NULL

Create Procedure SearchByGameBottomTwo
@FranName varchar(100), @GenreName varchar(100)
AS
Select Game.GameID,Game.[Name] as GameName,Franchise.[Name] as FranchiseName,Genre.Genre
From Game inner join Franchise on
Game.Franchise_FranchiseID = Franchise.FranchiseID
inner join genre_has_game on
genre_has_game.Game_GameID = Game.GameID
inner join Genre on
genre_has_game.Genre_GenreID = Genre.GenreID
Where Franchise.[Name] = @FranName and Genre.Genre = @GenreName
Go

Create Procedure SearchByGameTopTwo --AlternateTwo
@GameName varchar(100), @GenreName varchar(100)
AS
Select Game.GameID,Game.[Name] as GameName,Franchise.[Name] as FranchiseName,Genre.Genre
From Game inner join Franchise on
Game.Franchise_FranchiseID = Franchise.FranchiseID
inner join genre_has_game on
genre_has_game.Game_GameID = Game.GameID
inner join Genre on
genre_has_game.Genre_GenreID = Genre.GenreID
Where Game.[Name] = @GameName and Genre.Genre = @GenreName
Go

Create Procedure SearchByGameAlternateTwo --TopTwo
@GameName varchar(100), @FranName varchar(100)
AS
Select Game.GameID,Game.[Name] as GameName,Franchise.[Name] as FranchiseName,Genre.Genre
From Game inner join Franchise on
Game.Franchise_FranchiseID = Franchise.FranchiseID
inner join genre_has_game on
genre_has_game.Game_GameID = Game.GameID
inner join Genre on
genre_has_game.Genre_GenreID = Genre.GenreID
Where Game.[Name] = @GameName and Franchise.[Name] = @FranName
Go

--Exec SearchByGameBottomTwo @FranName = 'Devil May Cry', @GenreName = 'hack and slash';
--Exec SearchByFanchiseName @FranNameAlter = 'Devil May Cry';
--Exec SearchByGameAlternateTwo @GameName = 'Mega Man X2', @FranName = 'Mega Man';
--Exec SearchByGenreName @GenreNameAlter = 'hack and slash'