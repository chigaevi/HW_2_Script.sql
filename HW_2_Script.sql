CREATE TABLE IF NOT exists genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name text UNIQUE,
	musician_name TEXT
);

CREATE TABLE IF NOT exists musician (
	musician_id SERIAL PRIMARY KEY,
	musician_name TEXT UNIQUE,
	genre text unique REFERENCES genre(genre_name),
	album_name TEXT,
	collection_name text
);

CREATE TABLE IF NOT exists collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name TEXT UNIQUE,
	track_name text,
	musician_name TEXT unique references musician(musician_name),
	release_year INTEGER
);

CREATE TABLE IF NOT exists album (
	album_id SERIAL PRIMARY KEY,
	album_name TEXT UNIQUE,
	track_name text,
	musician_name TEXT unique references musician(musician_name),
	release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT exists track (
	track_id SERIAL PRIMARY KEY,
	track_name TEXT UNIQUE,
	musician_name TEXT unique references musician(musician_name),
	album_name TEXT unique REFERENCES album(album_name),
	collection_name text unique REFERENCES collection(collection_name),
	track_duration SERIAL
);
