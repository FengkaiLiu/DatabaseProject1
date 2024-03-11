# DatabaseProject1
All information about project1

# Database_documents
All .csv files about the database data inside. Contain 7 tables

# 5Queries
Question 7 in the project description. 

# ERDP1
The ERD image of the project

# Relational Schema
The relational schema for the project

# TableSQL
The code to create each table in DB browser

# UMLP1
The UML graph for project 1

# Video Game Sales Analysis
The document of the description of the project

# videogames.db
The database file for prject

#Node +
1.Initialize a new Node.js project:
(Git Bash)
mkdir node-express-crud
cd node-express-crud
npm init -y

2.Install the necessary dependencies (Express, SQLite, body-parser):
npm install express sqlite3 body-parser

3.Create a app.js file 
(Repo provided)

4.Run the application:
node app.js

5.Use cURL to compile
(create a new game)
curl -X POST -H "Content-Type: application/json" -d '{"name": "Game1"}' http://localhost:3000/games
(To create a new player)
curl -X POST -H "Content-Type: application/json" -d '{"name": "Player1", "game_id": 1}' http://localhost:3000/players
(retrieve all games)
curl http://localhost:3000/games

