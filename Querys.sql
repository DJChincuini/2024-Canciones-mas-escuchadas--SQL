--- Mayores vistas en youtube que en Spotify y TikTok
SELECT c.SONG, c.ARTIST, y.YOUTUBE_VIEWS AS Vistas_en_Youtube, s.SPOTIFY_STREAMS AS Escuchas_en_Spotify, t.TIKTOK_VIEWS AS Vistas_en_TikTok
FROM canciones c 
JOIN youtube y ON c.ID = y.ID
JOIN spotify s ON c.ID = s.ID
JOIN tiktok t ON c.ID = t.ID
WHERE y.YOUTUBE_VIEWS > s.SPOTIFY_STREAMS;

