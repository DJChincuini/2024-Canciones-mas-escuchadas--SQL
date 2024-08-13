--- Creo el Schema
CREATE SCHEMA canciones2024;

--- Creo las tablas que voy a utilizar

CREATE TABLE IF NOT EXISTS canciones (
	ID					INT PRIMARY KEY,
	ALBUM				VARCHAR(100),
    NAME				VARCHAR(50),
    ARTIST				VARCHAR(100),
    RELEASE_DATE		DATE,
    ALL_TIME_RANK		INT,
    SCORE				FLOAT,
    EXPLICIT			INT
);

CREATE TABLE IF NOT EXISTS spotify (
	ID					INT PRIMARY KEY,
	SPOTIFY_STREAMS				INT,
	SPOTIFY_PLAYLIST_COUNT		INT,
	SPOTIFY_PLAYLIST_REACH		INT,
	SPOTIFY_POPULARITY			INT
);

CREATE TABLE IF NOT EXISTS youtube (
	ID					INT PRIMARY KEY,
	YOUTUBE_VIEWS				INT,
    YOUTUBE_LIKES				INT,
    YOUTUBE_PLAYLIST_REACH		INT
);

CREATE TABLE IF NOT EXISTS tiktok (
	ID					INT PRIMARY KEY,
	TIKTOK_POST					INT,
    TIKTOK_LIKES				INT,
    TIKTOK_VIEWS				INT
);

CREATE TABLE IF NOT EXISTS misc (
	ID					INT PRIMARY KEY,
	APPLE_PLAYLIST_COUNT		INT,
    AIRPLAY_SPINS				INT,
    SIRIUSXM_SPINS				INT,
    DEEZER_PLAYLIST_COUNT		INT,
    DEEZER_PLAYLIST_REACH		INT,
    AMAZON_PLAYLIST_COUNT		INT,
    PANDORA_STREAMS				INT,
    PANDORA_TRACK_STATIONS		INT,
    SOUNDCLOUD_STREAMS			INT,
    SHAZAM_COUNTS				INT
);


--- Creo una tabla temporal para cargar el dataset

CREATE TABLE IF NOT EXISTS temp_canciones (
	ID					INT PRIMARY KEY,
	ALBUM				VARCHAR(100),
    NAME				VARCHAR(50),
    ARTIST				VARCHAR(100),
    RELEASE_DATE		DATE,
    ALL_TIME_RANK		INT,
    SCORE				FLOAT,
    EXPLICIT			INT,
    SPOTIFY_STREAMS				INT,
	SPOTIFY_PLAYLIST_COUNT		INT,
	SPOTIFY_PLAYLIST_REACH		INT,
	SPOTIFY_POPULARITY			INT,
	YOUTUBE_VIEWS				INT,
    YOUTUBE_LIKES				INT,
    YOUTUBE_PLAYLIST_REACH		INT,
	TIKTOK_POST					INT,
    TIKTOK_LIKES				INT,
    TIKTOK_VIEWS				INT,
	APPLE_PLAYLIST_COUNT		INT,
    AIRPLAY_SPINS				INT,
    SIRIUSXM_SPINS				INT,
    DEEZER_PLAYLIST_COUNT		INT,
    DEEZER_PLAYLIST_REACH		INT,
    AMAZON_PLAYLIST_COUNT		INT,
    PANDORA_STREAMS				INT,
    PANDORA_TRACK_STATIONS		INT,
    SOUNDCLOUD_STREAMS			INT,
    SHAZAM_COUNTS				INT
);


--- Cargo los datos del dataset a la tabla temporal

LOAD DATA INFILE "/Dataset/Most Streamed Songs 2024.csv"
INTO TABLE temp_canciones
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



