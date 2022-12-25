CREATE DATABASE music_psychology;
USE music_psychology;

SELECT * FROM survey;

-- There is a '99999999' number in BPM. I remove it and enter an average of other video game musics in it.  
UPDATE survey , (SELECT FLOOR(AVG(BPM)) bpm FROM survey WHERE fav_genre = 'Video game music' AND BPM < 300) AS s
SET survey.BPM = s.bpm
WHERE survey.BPM = 999999999;

-- Categorizing the participants in 3 different groups with the amount of time they listen to music
SELECT COUNT(*), AVG(Hours_per_day), AVG(Anxiety), AVG(Depression), AVG(Insomnia), AVG(OCD) FROM survey WHERE Hours_per_day >= 6
UNION
SELECT COUNT(*), AVG(Hours_per_day), AVG(Anxiety), AVG(Depression), AVG(Insomnia), AVG(OCD) FROM survey WHERE Hours_per_day > 2 and Hours_per_day < 6
UNION
SELECT COUNT(*), AVG(Hours_per_day), AVG(Anxiety), AVG(Depression), AVG(Insomnia), AVG(OCD) FROM survey WHERE Hours_per_day <= 2;

-- Which genre is the most favorite among the people after their favorite Genre 
-- first i have to give a number 0 to Never, 1 to Rarely, 2 to sometimes and 3 to very frequently so i can add them up
CREATE TABLE frequency (
	Weight INT,
    freq VARCHAR(25)
);
Insert into frequency VALUES (0, 'never');
Insert into frequency VALUES (1, 'Rarely');
Insert into frequency VALUES (2, 'sometimes');
Insert into frequency VALUES (3, 'very frequently');

-- classical Genre
SELECT 'Classic' as Genre , SUM(classic.classical_weight) / COUNT(classic.classical_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_classical, frequency.weight classical_weight FROM survey 
JOIN frequency ON survey.Frequency_classical = frequency.freq) classic
WHERE Fav_genre != 'Classical'
-- Country Genre
UNION
SELECT 'Country' as Genre , SUM(Country.country_weight) / COUNT(Country.Country_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Country, frequency.weight Country_weight FROM survey 
JOIN frequency ON survey.Frequency_Country = frequency.freq) country
WHERE Fav_genre != 'Country'
-- EDM Genre
UNION
SELECT 'EDM' as Genre , SUM(EDM.EDM_weight) / COUNT(EDM.EDM_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_EDM, frequency.weight EDM_weight FROM survey 
JOIN frequency ON survey.Frequency_EDM = frequency.freq) EDM
WHERE Fav_genre != 'EDM'
-- -- Folk Genre
UNION
SELECT 'Folk' as Genre , SUM(Folk.Folk_weight) / COUNT(Folk.Folk_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Folk, frequency.weight Folk_weight FROM survey 
JOIN frequency ON survey.Frequency_Folk = frequency.freq) Folk
WHERE Fav_genre != 'Folk'
-- Gospel Genre
UNION
SELECT 'Gospel' as Genre , SUM(Gospel.Gospel_weight) / COUNT(Gospel.Gospel_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Gospel, frequency.weight Gospel_weight FROM survey 
JOIN frequency ON survey.Frequency_Gospel = frequency.freq) Gospel
WHERE Fav_genre != 'Gospel'
-- Hiphop Genre
UNION
SELECT 'Hiphop' as Genre , SUM(Hiphop.Hiphop_weight) / COUNT(Hiphop.Hiphop_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Hiphop, frequency.weight Hiphop_weight FROM survey 
JOIN frequency ON survey.Frequency_Hiphop = frequency.freq) Hiphop
WHERE Fav_genre != 'Hiphop'
-- Jazz Genre
UNION
SELECT 'Jazz' as Genre , SUM(Jazz.Jazz_weight) / COUNT(Jazz.Jazz_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Jazz, frequency.weight Jazz_weight FROM survey 
JOIN frequency ON survey.Frequency_Jazz = frequency.freq) Jazz
WHERE Fav_genre != 'Jazz'
-- Kpop Genre
UNION
SELECT 'Kpop' as Genre , SUM(Kpop.Kpop_weight) / COUNT(Kpop.Kpop_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Kpop, frequency.weight Kpop_weight FROM survey 
JOIN frequency ON survey.Frequency_Kpop = frequency.freq) Kpop
WHERE Fav_genre != 'Kpop'
-- LAtin Genre
UNION
SELECT 'Latin' as Genre , SUM(Latin.Latin_weight) / COUNT(Latin.Latin_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Latin, frequency.weight Latin_weight FROM survey 
JOIN frequency ON survey.Frequency_Latin = frequency.freq) Latin
WHERE Fav_genre != 'Latin'
-- Lofi Genre
UNION
SELECT 'Lofi' as Genre , SUM(Lofi.Lofi_weight) / COUNT(Lofi.Lofi_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Lofi, frequency.weight Lofi_weight FROM survey 
JOIN frequency ON survey.Frequency_Lofi = frequency.freq) Lofi
WHERE Fav_genre != 'Lofi'
-- Metal Genre
UNION
SELECT 'Metal' as Genre , SUM(Metal.Metal_weight) / COUNT(Metal.Metal_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Metal, frequency.weight Metal_weight FROM survey 
JOIN frequency ON survey.Frequency_Metal = frequency.freq) Metal
WHERE Fav_genre != 'Metal'
-- Pop Genre
UNION
SELECT 'Pop' as Genre , SUM(Pop.Pop_weight) / COUNT(Pop.Pop_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Pop, frequency.weight Pop_weight FROM survey 
JOIN frequency ON survey.Frequency_Pop = frequency.freq) Pop
WHERE Fav_genre != 'Pop'
-- R&B Genre
UNION
SELECT 'R&B' as Genre , SUM(RnB.RnB_weight) / COUNT(RnB.RnB_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_RnB, frequency.weight RnB_weight FROM survey 
JOIN frequency ON survey.Frequency_RnB = frequency.freq) RnB
WHERE Fav_genre != 'R&B'
-- Rap Genre
UNION
SELECT 'Rap' as Genre , SUM(Rap.Rap_weight) / COUNT(Rap.Rap_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Rap, frequency.weight Rap_weight FROM survey 
JOIN frequency ON survey.Frequency_Rap = frequency.freq) Rap
WHERE Fav_genre != 'Rap'
-- Rock Genre
UNION
SELECT 'Rock' as Genre , SUM(Rock.Rock_weight) / COUNT(Rock.Rock_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Rock, frequency.weight Rock_weight FROM survey 
JOIN frequency ON survey.Frequency_Rock = frequency.freq) Rock
WHERE Fav_genre != 'Rock'
-- Video Game music Genre
UNION
SELECT 'Videogamemusic' as Genre , SUM(Videogamemusic.videogamemusic_weight) / COUNT(Videogamemusic.Videogamemusic_weight) As AVG_Frequency  FROM 
(SELECT survey.Fav_genre, survey.Frequency_Videogamemusic, frequency.weight Videogamemusic_weight FROM survey 
JOIN frequency ON survey.Frequency_Videogamemusic = frequency.freq) videogamemusic
WHERE Fav_genre != 'Videogamemusic';

