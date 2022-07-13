-- Part Two: Craigslist
-- Design a schema for Craigslist! Your schema should keep track of the following
-- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- Users and preferred region
-- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- Categories that each post belongs to
CREATE DATABASE craigslist;

\ c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    preferred_region INT REFERENCES regions ON DELETE
    SET
        NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    post_location TEXT NOT NULL,
    users_id INT REFERENCES users ON DELETE CASCADE,
    region_id INT REFERENCES regions ON DELETE
    SET
        NULL,
        categories INT REFERENCES categories ON DELETE
    SET
        NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);