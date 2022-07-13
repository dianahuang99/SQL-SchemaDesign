-- Part Three: Soccer League
-- Design a schema for a simple sports league. Your schema should keep track of
-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).
CREATE DATABASE soccer_league;

\ c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    referees_name TEXT NOT NULL
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    date_start date,
    date_end date
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INT REFERENCES teams ON DELETE
    SET
        NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players ON DELETE
    set
        null,
        game_id INT REFERENCES games ON DELETE CASCADE,
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    game_date date not null,
    team1_id INT REFERENCES teams ON DELETE
    set
        null,
        team2_id INT REFERENCES teams ON DELETE
    SET
        NULL,
        referee_id INT REFERENCES referees ON DELETE
    SET
        NULL,
        season_id INT REFERENCES seasons ON DELETE
    SET
        NULL,
        winner INT REFERENCES teams ON DELETE
    SET
        NULL
);