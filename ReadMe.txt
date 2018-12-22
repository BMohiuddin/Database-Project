Search Engine:
https://drive.google.com/open?id=1gCA6RQF-y3sKkqJGL16d33eVJbZW1Wm8 is a link to a bak file containing the database
-The database must be created using the provided bak file
-in the dbconnections class appropriate details for the users sql server connection need to be provided for functionality
-the format for that is: in db connections replace : public SqlConnection conn = new SqlConnection(@"Data Source=[your sql server name];Initial Catalog=DBProject;Integrated Security=True");
-The user must enter a valid Username and password to access the database.
-when creating a new user, the username must be unique.
-UserID = "Riz" and Password = "password" are examples of valid usernames and passwords(which have been used in the database)
-Clicking on any of the left panels leads to filters that can be set to find a specific game.
-Clicking on Search after entering values opens a new form with a datagrid containing all results.
Here, the user can add also add reviews for a spe.cific game by entering The Id of the game for which a review is being added,
the review itself in a textbox, and an overall rating on the game by clicking on the add button.
-Reviews for a specific game can also be viewed by entering the Id of the game (which the user can find using the search results),
and then clicking the appropriate button

Search Insturctions:
-If a text box is to be left empty please remove any default text that exists in the box.
-It is not neccessary to select any radio button in the developer section.
-To search for characters, please fill in all vertical fields, i.e all information should be filled about a specific character.
-If entering information about only 2 characters, please fill in only the left 2 columns.
-When entering only 1 character, fill in the left-most column.
-It is not necessary to select a gender.
-Selecting a gender will only work when just one character's information is provided.
-in the System requirements table, all the fields can be left blank. Doing so will result in the games that have a system requirement being shown.

-Procedures have been used to create search filters.


-Transactions have been used to add reviews and new users to the database.

-Data inserted using CSV files from online databases

-Views were not used since all of our querries were parameter dependent
