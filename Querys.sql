--- Mayores vistas en Youtube que en Spotify y TikTok
SELECT
	c.SONG,
    c.ARTIST,
    y.YOUTUBE_VIEWS AS Vistas_en_Youtube,
    s.SPOTIFY_STREAMS AS Escuchas_en_Spotify,
    t.TIKTOK_VIEWS AS Vistas_en_TikTok
FROM canciones c 
JOIN youtube y ON c.ID = y.ID
JOIN spotify s ON c.ID = s.ID
JOIN tiktok t ON c.ID = t.ID
WHERE y.YOUTUBE_VIEWS > s.SPOTIFY_STREAMS;


--- Mayores vistas en Youtube que el promedio de escuchas/vistas en Spotify y TikTok
SELECT
	c.ID,
	c.SONG,
    c.ARTIST,
    y.YOUTUBE_VIEWS AS Vistas_en_Youtube,
    AVG(s.SPOTIFY_STREAMS) AS Promedio_en_Spotify,
    AVG(t.TIKTOK_VIEWS) AS Promedio_en_TikTok
FROM canciones c 
JOIN youtube y ON c.ID = y.ID
JOIN spotify s ON c.ID = s.ID
JOIN tiktok t ON c.ID = t.ID
GROUP BY c.ID, c.SONG, c.ARTIST, y.YOUTUBE_VIEWS
HAVING y.YOUTUBE_VIEWS > (AVG(s.SPOTIFY_STREAMS) + AVG(t.TIKTOK_VIEWS)) / 2;
