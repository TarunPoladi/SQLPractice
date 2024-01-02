WITH CTE 
AS
(
SELECT A.artist_name,DENSE_RANK()OVER(ORDER BY COUNT(rank) DESC) artist_rank
FROM global_song_rank GSR
INNER JOIN songs S ON S.song_id = GSR.song_id
INNER JOIN artists A ON A.artist_id = S.artist_id
WHERE rank<=10
GROUP BY A.artist_name
)
SELECT * FROM CTE
WHERE artist_rank<=5
