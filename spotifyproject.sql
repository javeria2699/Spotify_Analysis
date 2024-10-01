CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

select * from spotify
 ----EDA----
select count(*) from spotify;
select count (distinct artist) from spotify;
select count (distinct track) from spotify;
select count (distinct album) from spotify;
select album_type from spotify
group by 1;

----Retrieve the names of all tracks that have more than 1 billion streams----
SELECT *
FROM spotify
WHERE stream > 1000000000;

----List all albums along with their respective artists----
SELECT distinct album, artist
FROM spotify
;

----Get the total number of comments for tracks where licensed = TRUE----
SELECT SUM(comments) AS total_comments
FROM spotify
WHERE licensed = TRUE;

----Find all tracks that belong to the album type "single"----
SELECT track, artist, album
FROM spotify
WHERE album_type = 'single';

----Count the total number of tracks by each artist----
SELECT artist, COUNT(*) AS total_tracks
FROM spotify
GROUP BY artist
ORDER BY total_tracks DESC;

----Calculate the average danceability of tracks in each album----
SELECT album, AVG(danceability) AS avg_danceability
FROM spotify
GROUP BY album;

----Find the top 5 tracks with the highest energy values----
SELECT track, artist, energy
FROM spotify
ORDER BY energy DESC
LIMIT 5;

----List all tracks along with their views and likes where official_video = TRUE----
SELECT track, views, likes
FROM spotify
WHERE official_video = TRUE;

----For each album, calculate the total views of all associated tracks----
SELECT album, track , SUM(views) AS total_views
FROM spotify
GROUP BY album , track
ORDER BY 3 DESC ;

----Retrieve the track names that have been streamed on Spotify more than YouTube----
SELECT track
FROM spotify
WHERE stream > views;

----Find the top 3 most-viewed tracks for each artist using window functions----
with ranking_artist 
AS 
(
SELECT artist, track, sum(views) as total_views, 
       DENSE_RANK() OVER (PARTITION BY artist ORDER BY sum(views) DESC) AS rank
FROM spotify
GROUP BY 1 , 2
	ORDER BY 1 , 3 DESC 
)
SELECT * FROM ranking_artist
WHERE RANK <= 3;

----Find tracks where the liveness score is above the average----
SELECT track, artist, liveness
FROM spotify
WHERE liveness > (SELECT AVG(liveness) FROM spotify);

----Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album----
WITH energy_stats AS (
    SELECT album, 
           MAX(energy) AS max_energy, 
           MIN(energy) AS min_energy
    FROM spotify
    GROUP BY album
)
SELECT album, (max_energy - min_energy) AS energy_difference
FROM energy_stats;


