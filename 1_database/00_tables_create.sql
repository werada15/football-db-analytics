--Countries
DROP TABLE IF EXISTS Countries CASCADE;

CREATE TABLE Countries (
	country_id bigserial Primary Key,
	country_name varchar NOT NULL UNIQUE
);

--Posts
DROP TABLE IF EXISTS Posts CASCADE;

CREATE TABLE Posts (
	post_id bigserial PRIMARY KEY,
	post_name varchar NOT NULL UNIQUE
);

--Cities
DROP TABLE IF EXISTS Cities CASCADE;

CREATE TABLE Cities (
	city_id bigserial PRIMARY KEY,
	city_name varchar NOT NULL,
	country_id bigint NOT NULL,
	CONSTRAINT fk_countries_cities
	FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

--Stadiums
DROP TABLE IF EXISTS Stadiums CASCADE;

CREATE TABLE Stadiums (
	stadium_id bigserial PRIMARY KEY,
	stadium_name varchar NOT NULL,
	capacity int NOT NULL CHECK (capacity > 0),
	city_id bigint NOT NULL,
	CONSTRAINT fk_stadiums_cities
	FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);

-- Leagues
DROP TABLE IF EXISTS Leagues CASCADE;

CREATE TABLE Leagues (
	league_id bigserial PRIMARY KEY,
	league_name varchar NOT NULL,
	league_level int NOT NULL CHECK (league_level >= 0),
	country_id bigint,
	CONSTRAINT fk_leagues_countries
	FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);

--Clubs
DROP TABLE IF EXISTS Clubs CASCADE;

CREATE TABLE Clubs (
	club_id bigserial PRIMARY KEY,
	club_name varchar NOT NULL,
	league_id bigint NOT NULL,
	city_id bigint NOT NULL,
	stadium_id bigint,
	CONSTRAINT fk_clubs_leagues
	FOREIGN KEY (league_id) REFERENCES Leagues(league_id),
	CONSTRAINT fk_clubs_cities
	FOREIGN KEY (city_id) REFERENCES Cities(city_id),
	CONSTRAINT fk_clubs_stadiums
	FOREIGN KEY (stadium_id) REFERENCES Stadiums(stadium_id)
);

--Staff
DROP TABLE IF EXISTS Staff CASCADE;

CREATE TABLE Staff (
	staff_id bigserial PRIMARY KEY,
	staff_name varchar NOT NULL,
	club_id bigint,
	post_id bigint NOT NULL,
	CONSTRAINT fk_staff_clubs
	FOREIGN KEY (club_id) REFERENCES Clubs(club_id),
	CONSTRAINT fk_staff_posts
	FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

--Players
DROP TYPE IF EXISTS player_pos CASCADE;

CREATE TYPE player_pos AS ENUM('GK', 'LWB', 
'LB', 'CB', 'RB', 'RWB', 'CDM', 'CM', 'LM',
'RM', 'CAM', 'LF', 'CF', 'RF', 'LW', 'ST', 'RW');

DROP TABLE IF EXISTS Players CASCADE;

CREATE TABLE Players (
	player_id bigserial PRIMARY KEY,
	player_name varchar NOT NULL,
	player_position player_pos NOT NULL,
	player_number int CHECK (player_number > 0 AND player_number < 100),
	club_id bigint,
	nationality_id bigint NOT NULL,
	CONSTRAINT fk_players_clubs
	FOREIGN KEY (club_id) REFERENCES Clubs(club_id),
	CONSTRAINT fk_players_countries
	FOREIGN KEY (nationality_id) REFERENCES Countries(country_id)
);