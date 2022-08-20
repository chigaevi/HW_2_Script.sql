CREATE TABLE IF NOT exists genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name character(60) not null unique
);

CREATE TABLE IF NOT exists musician (
	musician_id SERIAL PRIMARY KEY,
	musician_name character(60)  not null unique
);

CREATE TABLE IF NOT exists musician_genre (
	musician_id SERIAL references musician(musician_id),
	genre_id SERIAL REFERENCES genre(genre_id),
	primary key(musician_id, genre_id)
);

CREATE TABLE IF NOT exists album (
	album_id SERIAL PRIMARY KEY,
	album_name character(60),
	release_year INTEGER NOT null CHECK (release_year >= 1960 and release_year <= 2022)
);

CREATE TABLE IF NOT exists musician_album (
	musician_id SERIAL REFERENCES musician(musician_id),
	album_id SERIAL REFERENCES album(album_id),
	primary key(musician_id, album_id)	
);

CREATE TABLE IF NOT exists collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name character(60),
	release_year INTEGER NOT null CHECK (release_year >= 1960 and release_year <= 2022)
);

CREATE TABLE IF NOT exists track (
	track_id SERIAL PRIMARY KEY,
	track_name character(60) unique,
	musician_name SERIAL references musician(musician_id),
	album_name SERIAL REFERENCES album(album_id),
	track_duration time CHECK (track_duration >= '00:00:30' and track_duration <= '00:10:00')
);

CREATE TABLE IF NOT exists collection_track (
	collection_id SERIAL REFERENCES collection(collection_id),
	track_id SERIAL references track(track_id),
	primary key(collection_id, track_id)
);