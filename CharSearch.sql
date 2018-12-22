Create Procedure SearchByChar
@Char1Name varchar(50), @VActorName varchar(25), @ActorName varchar(25),
@Char1Name2 varchar(50), @VActorName2 varchar(25), @ActorName2 varchar(25),
@Char1Name3 varchar(50), @VActorName3 varchar(25), @ActorName3 varchar(25)
As
Select Game.GameID,Game.[Name] as GameName, COne.Character_Name as Character1,GOne.Actor_Name as Actor1,GOne.Voice_Actor as VActor1,CTwo.Character_Name as Character2,GTwo.Actor_Name as Actor2,GTwo.Voice_Actor as VActor2,CThree.Character_Name as Character3,GThree.Actor_Name as Actor3,GThree.Voice_Actor as VActor3
From Game inner join Game_has_Characters GOne on
Game.GameID = GOne.Game_GameID
inner join Characters COne on
GOne.Characters_CharacterID = COne.CharacterID
inner join Game_has_Characters GTwo
on Game.GameID = GTwo.Game_GameID
inner join Characters CTwo on
CTwo.CharacterID = GTwo.Characters_CharacterID
inner join Game_has_Characters GThree on
Game.GameID = GThree.Game_GameID
inner join Characters CThree on
GThree.Characters_CharacterID = CThree.CharacterID
Where COne.Character_Name = @Char1Name and GOne.Actor_Name = @ActorName and GOne.Voice_Actor = @VActorName and
CTwo.Character_Name = @Char1Name2 and GTwo.Actor_Name = @ActorName2 and GTwo.Voice_Actor = @VActorName2 and
CThree.Character_Name = @Char1Name3 and GThree.Actor_Name = @ActorName3 and GThree.Voice_Actor = @VActorName3
Go

Create Procedure SearchByCharTwo
@Char1Name varchar(50), @VActorName varchar(25), @ActorName varchar(25),
@Char1Name2 varchar(50), @VActorName2 varchar(25), @ActorName2 varchar(25)
As
Select Game.GameID,Game.[Name] as GameName, COne.Character_Name as Character1,GOne.Actor_Name as Actor1,GOne.Voice_Actor as VActor1,CTwo.Character_Name as Character2,GTwo.Actor_Name as Actor2,GTwo.Voice_Actor as VActor2
From Game inner join Game_has_Characters GOne on
Game.GameID = GOne.Game_GameID
inner join Characters COne on
GOne.Characters_CharacterID = COne.CharacterID
inner join Game_has_Characters GTwo
on Game.GameID = GTwo.Game_GameID
inner join Characters CTwo on
CTwo.CharacterID = GTwo.Characters_CharacterID
Where COne.Character_Name = @Char1Name and GOne.Actor_Name = @ActorName and GOne.Voice_Actor = @VActorName and
CTwo.Character_Name = @Char1Name2 and GTwo.Actor_Name = @ActorName2 and GTwo.Voice_Actor = @VActorName2
Go

Create Procedure SearchByCharOneMale
@Char1Name varchar(50), @VActorName varchar(25), @ActorName varchar(25)
As
Select Game.GameID,Game.[Name] as GameName, COne.Character_Name as Character1,GOne.Actor_Name as Actor1,GOne.Voice_Actor as VActor1
From Game inner join Game_has_Characters GOne on
Game.GameID = GOne.Game_GameID
inner join Characters COne on
GOne.Characters_CharacterID = COne.CharacterID
Where COne.Character_Name = @Char1Name and GOne.Actor_Name = @ActorName and GOne.Voice_Actor = @VActorName and 
COne.Gender = 'male'
Go

Create Procedure SearchByCharOneFemale
@Char1Name varchar(50), @VActorName varchar(25), @ActorName varchar(25)
As
Select Game.GameID,Game.[Name] as GameName, COne.Character_Name as Character1,GOne.Actor_Name as Actor1,GOne.Voice_Actor as VActor1
From Game inner join Game_has_Characters GOne on
Game.GameID = GOne.Game_GameID
inner join Characters COne on
GOne.Characters_CharacterID = COne.CharacterID
Where COne.Character_Name = @Char1Name and GOne.Actor_Name = @ActorName and GOne.Voice_Actor = @VActorName and 
COne.Gender = 'female'
Go

Create Procedure SearchByCharOneOther
@Char1Name varchar(50), @VActorName varchar(25), @ActorName varchar(25)
As
Select Game.GameID,Game.[Name] as GameName, COne.Character_Name as Character1,GOne.Actor_Name as Actor1,GOne.Voice_Actor as VActor1
From Game inner join Game_has_Characters GOne on
Game.GameID = GOne.Game_GameID
inner join Characters COne on
GOne.Characters_CharacterID = COne.CharacterID
Where COne.Character_Name = @Char1Name and GOne.Actor_Name = @ActorName and GOne.Voice_Actor = @VActorName and 
COne.Gender <> 'male' and COne.Gender <> 'female' and COne.Gender is not NULL
Go