const express = require('express');
const bodyParser = require('body-parser');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Database initialization
const db = new sqlite3.Database(':memory:');

// Create tables
db.serialize(() => {
    db.run(`CREATE TABLE IF NOT EXISTS Game (
        id INTEGER PRIMARY KEY,
        name TEXT
    )`);
    db.run(`CREATE TABLE IF NOT EXISTS Player (
        id INTEGER PRIMARY KEY,
        name TEXT,
        game_id INTEGER,
        FOREIGN KEY (game_id) REFERENCES Game(id)
    )`);
});

// Routes
app.get('/games', (req, res) => {
    db.all('SELECT * FROM Game', (err, rows) => {
        if (err) {
            res.status(500).send(err);
            return;
        }
        res.send(rows);
    });
});

app.post('/games', (req, res) => {
    const { name } = req.body;
    db.run('INSERT INTO Game (name) VALUES (?)', [name], function(err) {
        if (err) {
            res.status(500).send(err);
            return;
        }
        res.send(`Game ${name} added with ID: ${this.lastID}`);
    });
});

app.get('/players', (req, res) => {
    db.all('SELECT * FROM Player', (err, rows) => {
        if (err) {
            res.status(500).send(err);
            return;
        }
        res.send(rows);
    });
});

app.post('/players', (req, res) => {
    const { name, game_id } = req.body;
    db.run('INSERT INTO Player (name, game_id) VALUES (?, ?)', [name, game_id], function(err) {
        if (err) {
            res.status(500).send(err);
            return;
        }
        res.send(`Player ${name} added with ID: ${this.lastID}`);
    });
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});