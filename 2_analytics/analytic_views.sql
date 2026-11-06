--Запрос 1: Количество тренеров в каждом клубе
DROP VIEW IF EXISTS coaching_staff_by_club;

CREATE VIEW coaching_staff_by_club AS
SELECT 
    c.club_name,
    COUNT(s.staff_id) AS "coaches_count"
FROM Staff s
JOIN Clubs c ON s.club_id = c.club_id
JOIN Posts p ON s.post_id = p.post_id
WHERE p.post_name ILIKE '%coach'
GROUP BY c.club_name
ORDER BY COUNT(s.staff_id) DESC;

--Запрос 2: Страны по количеству легионеров
DROP VIEW IF EXISTS foreign_players_by_nationality;

CREATE VIEW foreign_players_by_nationality AS
SELECT 
    co.country_name AS "country_name",
    COUNT(p.player_id) AS "total_legionnaires"
FROM Players p
JOIN Countries co ON p.nationality_id = co.country_id 
JOIN Clubs c ON p.club_id = c.club_id 
JOIN Cities ci ON c.city_id = ci.city_id
JOIN Countries club_country ON ci.country_id = club_country.country_id
WHERE p.nationality_id != club_country.country_id
GROUP BY co.country_name
ORDER BY COUNT(p.player_id) DESC
LIMIT 5;

-- Запрос 3: страны по убыванию средней вместительности стадионов среди высших лиг
DROP VIEW IF EXISTS avg_stadium_capacity_by_country;

CREATE VIEW avg_stadium_capacity_by_country AS
SELECT 
	co.country_name,
    ROUND (AVG(s.capacity), 0) AS "avg_capacity"
FROM Clubs c
JOIN Leagues l ON c.league_id = l.league_id
JOIN Countries co ON l.country_id = co.country_id
LEFT JOIN Stadiums s ON c.stadium_id = s.stadium_id
GROUP BY co.country_name, l.league_level
HAVING l.league_level = 0
ORDER BY AVG(s.capacity) DESC;

-- Запрос 4: Клубы с количеством игроков выше среднего
DROP VIEW IF EXISTS squads_above_average;

CREATE VIEW squads_above_average AS
SELECT 
    c.club_name, 
    COUNT(p.player_id) AS players_count
FROM Clubs c
JOIN Players p ON c.club_id = p.club_id
GROUP BY c.club_name
HAVING COUNT(p.player_id) > (
    SELECT AVG(players_count) 
    FROM (
        SELECT COUNT(player_id) as players_count 
        FROM Players
        GROUP BY club_id
    ) AS avg_players
)
ORDER BY players_count DESC;

--Запрос 5: Страны и клубы с самыми большими стадионами в стране
DROP VIEW IF EXISTS top_stadium_per_country;

CREATE VIEW top_stadium_per_country AS
WITH RankedStadiums AS (
    SELECT 
        co.country_name,
        c.club_name,
        s.stadium_name,
        s.capacity,
        ROW_NUMBER() OVER(PARTITION BY co.country_name ORDER BY s.capacity DESC) as rn
    FROM Countries co
    JOIN Cities ci ON co.country_id = ci.country_id
    JOIN Clubs c ON ci.city_id = c.city_id
    JOIN Stadiums s ON c.stadium_id = s.stadium_id
)
SELECT 
    country_name, 
    club_name, 
    stadium_name, 
    capacity
FROM RankedStadiums
WHERE rn = 1;
