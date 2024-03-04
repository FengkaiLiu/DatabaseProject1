--Join four tables together
--Retrieve Game, Platform, and Publisher Information
SELECT g.game_name, p.platform_name, pb.publisher_name
FROM Game AS g
JOIN Game_platform AS gp ON g.game_id = gp.game_id
JOIN Platform AS p ON gp.platform_id = p.platform_id
JOIN Game_publisher AS gp ON g.game_id = gp.game_id
JOIN Publisher AS pb ON gp.publisher_id = pb.publisher_id
LIMIT 1000;

--Do the subquery
--Retrieve Game Platforms Released After the Average Release Year
SELECT gp.game_platform_id, p.platform_name, release_year
FROM Game_platform AS gp
JOIN Platform AS p ON gp.platform_id = p.platform_id
WHERE gp.release_year > (SELECT AVG(release_year) FROM Game_platform)
LIMIT 1000;

--Number of games for each platform
--Count Number of Games for Each Platform
SELECT platform_id, COUNT(*) AS num_games
FROM Game_platform
GROUP BY platform_id
HAVING num_games > 5;

--Specific category result search
--Search for Games in a Specific Category with 'war' in the Name
SELECT *
FROM Game
WHERE category_id = 1 AND game_name LIKE '%war%';

--Judge the publish time of a game
--Categorize Games Based on Release Year
SELECT g.game_name, release_year,
       CASE 
            WHEN gp.release_year < 2010 THEN 'Old'
            WHEN gp.release_year >= 2010 AND gp.release_year < 2020 THEN 'Recent'
            ELSE 'New'
       END AS release_category
FROM Game_platform AS gp
JOIN Game AS g ON gp.platform_id = g.game_id;