CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration NUMERIC NOT NULL,
	album INTEGER NOT NULL REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release_year VARCHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	release_year VARCHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS album_artist (
	album_id INTEGER REFERENCES album(id),
	artist_id INTEGER REFERENCES artist(id),
	CONSTRAINT pk_1 PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS genre_artist (
	artist_id INTEGER REFERENCES artist(id),
	genre_id INTEGER REFERENCES genre(id),
	CONSTRAINT pk_2 PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS collection_track (
	collection_id INTEGER REFERENCES collection(id),
	track_id INTEGER REFERENCES track(id),
	CONSTRAINT pk_3 PRIMARY KEY (collection_id, track_id)
);
