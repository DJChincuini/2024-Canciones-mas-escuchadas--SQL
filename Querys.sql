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
WHERE y.YOUTUBE_VIEWS > s.SPOTIFY_STREAMS AND y.YOUTUBE_VIEWS > t.TIKTOK_VIEWS;


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


--- Correlación entre las vistas/escuchas entre Youtube, Spotify y TikTok
SELECT 
    (COUNT(*) * SUM(CAST(s.SPOTIFY_STREAMS AS DECIMAL(20,2)) * CAST(t.TIKTOK_VIEWS AS DECIMAL(20,2))) - 
     SUM(CAST(s.SPOTIFY_STREAMS AS DECIMAL(20,2))) * SUM(CAST(t.TIKTOK_VIEWS AS DECIMAL(20,2)))) /
    (SQRT(COUNT(*) * SUM(POW(CAST(s.SPOTIFY_STREAMS AS DECIMAL(20,2)), 2)) - 
          POW(SUM(CAST(s.SPOTIFY_STREAMS AS DECIMAL(20,2))), 2)) * 
     SQRT(COUNT(*) * SUM(POW(CAST(t.TIKTOK_VIEWS AS DECIMAL(20,2)), 2)) - 
          POW(SUM(CAST(t.TIKTOK_VIEWS AS DECIMAL(20,2))), 2))
    ) AS correlacion_Spotify_Tiktok,
    (COUNT(*) * SUM(CAST(s.SPOTIFY_STREAMS AS DECIMAL(20,2)) * CAST(y.YOUTUBE_VIEWS AS DECIMAL(20,2))) - 
     SUM(CAST(s.SPOTIFY_STREAMS AS DECIMAL(20,2))) * SUM(CAST(y.YOUTUBE_VIEWS AS DECIMAL(20,2)))) /
    (SQRT(COUNT(*) * SUM(POW(CAST(s.SPOTIFY_STREAMS AS DECIMAL(20,2)), 2)) - 
          POW(SUM(CAST(s.SPOTIFY_STREAMS AS DECIMAL(20,2))), 2)) * 
     SQRT(COUNT(*) * SUM(POW(CAST(y.YOUTUBE_VIEWS AS DECIMAL(20,2)), 2)) - 
          POW(SUM(CAST(y.YOUTUBE_VIEWS AS DECIMAL(20,2))), 2))
    ) AS correlacion_Spotify_Youtube,
    (COUNT(*) * SUM(CAST(t.TIKTOK_VIEWS AS DECIMAL(20,2)) * CAST(y.YOUTUBE_VIEWS AS DECIMAL(20,2))) - 
     SUM(CAST(t.TIKTOK_VIEWS AS DECIMAL(20,2))) * SUM(CAST(y.YOUTUBE_VIEWS AS DECIMAL(20,2)))) /
    (SQRT(COUNT(*) * SUM(POW(CAST(t.TIKTOK_VIEWS AS DECIMAL(20,2)), 2)) - 
          POW(SUM(CAST(t.TIKTOK_VIEWS AS DECIMAL(20,2))), 2)) * 
     SQRT(COUNT(*) * SUM(POW(CAST(y.YOUTUBE_VIEWS AS DECIMAL(20,2)), 2)) - 
          POW(SUM(CAST(y.YOUTUBE_VIEWS AS DECIMAL(20,2))), 2))
    ) AS correlacion_TikTok_Youtube
FROM spotify s
JOIN tiktok t ON s.ID = t.ID
JOIN youtube y ON s.ID = y.ID;


--- Ranking de canciones en Youtube, Spotify y TikTok
SELECT 
	c.ID,
    c.SONG,
    c.ARTIST,
	y.YOUTUBE_VIEWS,
    RANK() OVER (ORDER BY y.YOUTUBE_VIEWS DESC) AS rank_youtube,
    s.SPOTIFY_STREAMS,
    RANK() OVER (ORDER BY s.SPOTIFY_STREAMS DESC) AS rank_spotify,
    t.TIKTOK_VIEWS,
    RANK() OVER (ORDER BY t.TIKTOK_VIEWS DESC) AS rank_tiktok
FROM canciones c
JOIN spotify s ON c.ID = s.ID
JOIN tiktok t ON c.ID = t.ID
JOIN youtube y ON c.ID = y.ID;

--- Canción con más likes
SELECT
	c.ID,
    c.SONG AS Canciones,
    c.ARTIST AS Artista
FROM canciones c
;
