-- Countries
INSERT INTO countries (country_name) VALUES
('Russia'),
('Spain'),
('Germany'),
('France'),
('England'),
('Italy');

SELECT * FROM countries;

-- Posts
INSERT INTO posts (post_name) VALUES
('President'),
('Head coach'),
('Second coach'),
('Physics coach'),
('Main doctor'),
('Main scout');

SELECT * FROM posts;

--Cities
INSERT INTO cities (city_name, country_id) VALUES
('Saint-Petersburg', 1),
('Madrid', 2),
('Munich', 3),
('Paris', 4),
('London', 5),
('Manchester', 5),
('Milano', 6);

SELECT * FROM cities;

--Stadiums
INSERT INTO Stadiums(stadium_name, capacity, city_id) VALUES
('Bernabeu', 83136, 2),
('Gazprom Arena', 67800, 1),
('Old Trafford', 74879, 6),
('Etihad', 61038, 6),
('Emirates Stadium', 60704, 5),
('Parc des Princes', 47900, 4),
('Estadio Metropolitano', 70692, 2),
('Allianz Arena', 75000, 3),
('San Siro', 80018, 7),
('Stamford Bridge', 41800, 5);

SELECT * FROM Stadiums;

--Leagues
INSERT INTO Leagues(league_name, league_level, country_id) VALUES
('League 1', 0, 4),
('La Liga', 0, 2),
('Premier League', 0, 5),
('Russian Premier League', 0, 1),
('Bundesliga', 0, 3),
('Football Nation League', 1, 1),
('Seria A', 0, 6),
('Seria B', 1, 6),
('League 3', 2, 4);

SELECT * FROM Leagues;

--Clubs
INSERT INTO Clubs(club_name, league_id, city_id, stadium_id) VALUES
('Real Madrid', 2, 2, 1),
('Manchester United', 3, 6, 3),
('Manchester City', 3, 6, 4),
('Arsenal', 3, 5, 5),
('Paris Saint-Germain', 1, 4, 6),
('Atletico Madrid', 2, 2, 7),
('Bayern Munich', 5, 3, 8),
('AC Milan', 7, 7, 9),
('Inter Milan', 7, 7, 9),
('Chelsea', 3, 5, 10),
('Zenit Saint-Petersburg', 4, 1, 2);

SELECT * FROM Clubs;

--Staff
INSERT INTO Staff(staff_name, club_id, post_id) VALUES
('Jose Mourinho', 1, 2),
('Juni Calafat', 1, 6),
('Sami Khedira', 1, 3),

('Michael Carrik', 2, 2),
('Steve Holland', 2, 3),
('Imtiaz Ahmad', 2, 5),

('Enzo Maresca', 3, 2),
('Willy Caballero', 3, 3),
('Edu Mauri', 3, 5),

('Mikel Arteta', 4, 2),
('Izan Martín', 4, 3),
('Maurizio Micheli', 4, 6),

('Luis Enrique', 5, 2),
('Rafael Pol', 5, 3),
('Nasser Al-Khelaifi', 5, 1),

('Diego Simeone', 6, 2),
('Óscar Pitillas', 6, 4),
('Enrique Cerezo', 6, 1),
('Gabi', 6, 3),

('Vincent Kompany', 7, 2),
('Nils Schmadtke', 7, 6),
('Herbert Hainer', 7, 1),

('Ruben Amorim', 8, 2),
('Stefano Mazzoni', 8, 5),
('Donato Lomonte', 8, 6),

('Cristian Chivu', 9, 2),
('Aleksandar Kolarov', 9, 3),
('Giuseppe Marotta', 9, 1),

('Xabi Alonso', 10, 2),
('Craig Roberts', 10, 5),
('Todd Boehly', 10, 1),

('Sergey Semak', 11, 2),
('Anatoliy Tymoshchuk', 11, 3),
('Alexander Medvedev', 11, 1);

SELECT * FROM Staff;

--Players
INSERT INTO Players(player_name, player_position, player_number, club_id, nationality_id) VALUES
('Jude Bellingham', 'CAM', 5, 1, 5),
('Antonio Rudiger', 'CB', 22, 1, 3),
('Carlos Espi', 'LW', 19, 1, 2),
('Kylian Mbappe', 'ST', 9, 1, 4),
('Marc Cucurella', 'LB', 17, 1, 2),

('Marcus Rashford', 'LW', 10, 2, 5),
('Luke Shaw', 'LB', 23, 2, 5),
('Harry Maguire', 'CB', 5, 2, 5),
('Mason Mount', 'CAM', 7, 2, 5),

('Marc Guéhi', 'CB', 6, 3, 5),
('Phil Foden', 'CAM', 47, 3, 5),
('Gianluigi Donnarumma', 'GK', 1, 3, 6),
('Rico Lewis', 'RB', 82, 3, 5),
('Enzo Fernandez', 'CM', 17, 3, 2),

('David Raya', 'GK', 22, 4, 2),
('William Saliba', 'CB', 2, 4, 4),
('Declan Rice', 'CDM', 41, 4, 5),
('Bukayo Saka', 'RW', 7, 4, 5),
('Ben White', 'RB', 4, 4, 5),

('Matvey Safonov', 'GK', 39, 5, 1),
('Ousmane Dembele', 'CF', 10, 5, 4),
('Desire Doue', 'RW', 14, 5, 4),
('Fabián Ruiz', 'CM', 8, 5, 2),

('Alejandro Grimaldo', 'LWB', 22, 6, 2),
('Koke', 'CM', 6, 6, 2),
('Julian Alvarez', 'ST', 19, 6, 2),
('Marcos Llorente', 'RM', 14, 6, 2),

('Manuel Neuer', 'GK', 1, 7, 3),
('Dayot Upamecano', 'CB', 2, 7, 4),
('Joshua Kimmich', 'CDM', 6, 7, 3),
('Jamal Musiala', 'CAM', 42, 7, 3),
('Harry Kane', 'ST', 9, 7, 5),

('Mike Maignan', 'GK', 16, 8, 4),
('Fikayo Tomori', 'CB', 23, 8, 5),
('Ruben Loftus-Cheek', 'CM', 8, 8, 5),
('Adrien Rabiot', 'CM', 12, 8, 4),

('Josep Martínez', 'GK', 1, 9, 2),
('Alessandro Bastoni', 'CB', 95, 9, 6),
('Nicolo Barella', 'CM', 23, 9, 6),
('Marcus Thuram', 'CF', 9, 9, 4),
('Federico Dimarco', 'LWB', 32, 9, 6),

('Maxence Lacroix', 'CB', 5, 10, 4),
('Reece James', 'RB', 24, 10, 5),
('Cole Palmer', 'CAM', 20, 10, 5),
('Jamie Gittens', 'LW', 11, 10, 5),

('Denis Adamov', 'GK', 41, 11, 1),
('Vyacheslav Karavaev', 'RB', 15, 11, 1),
('Maksim Glushenkov', 'CF', 10, 11, 1),
('Alexandr Sobolev', 'ST', 7, 11, 1);

SELECT * FROM Players;
