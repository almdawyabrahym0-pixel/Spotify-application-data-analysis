use spotify
go

select *
from top100

---VIEWألخاص بداتا الجدول الاول 100 اغنيه 
CREATE VIEW View_AllTime_Comprehensive AS
SELECT 
    -- 1. الداتا الأساسية (Metadata)
    song_title,
    artist,
    primary_genre,
    artist_country,
    release_year,
    dataset_part,
    
    -- 2. داتا الأرقام (Metrics)
    total_streams_billions,
    bpm,
    danceability,
    energy,
    valence,
    acousticness,
    
    -- 3. داتا الـ KPIs (Calculated Fields)
    (2026 - release_year) AS years_since_release,
    ROUND(total_streams_billions / (2026 - release_year + 1), 3) AS streams_per_year_index, -- معدل النجاح السنوي
    CASE 
        WHEN energy > 0.8 AND danceability > 0.8 THEN 'High Energy Dance'
        WHEN energy < 0.4 THEN 'Chill/Acoustic'
        ELSE 'Balanced'
    END AS song_vibe_category
FROM top100;

select *
from View_AllTime_Comprehensive

---الVIEWالخاص بالجدول التاني افضل 50 فنان 2025
CREATE VIEW View_Artists_2025_Comprehensive AS
SELECT 
    -- 1. الداتا الأساسية (Metadata)
    artist_name,
    primary_genre,
    country,
    gender,
    top_2025_song,
    
    -- 2. داتا الأرقام (Metrics)
    monthly_listeners_millions_mar2026 AS monthly_listeners,
    followers_millions,
    grammy_wins,
    debut_year,
    
    -- 3. داتا الـ KPIs (Calculated Fields)
    (followers_millions / NULLIF(monthly_listeners_millions_mar2026, 0)) * 100 AS loyalty_ratio, -- نسبة الولاء (المتابعين للمستمعين)
    CASE 
        WHEN grammy_wins > 0 THEN 'Awarded Artist' 
        ELSE 'Rising/Mainstream' 
    END AS award_status,
    (2026 - debut_year) AS years_in_industry
FROM top50_artists;

select * 
from View_Artists_2025_Comprehensive

--الفيو الخاص بالجدول التالت افضل 50 اغنيه 
CREATE VIEW View_Songs_2025_Comprehensive AS
SELECT 
    -- 1. الداتا الأساسية (Metadata)
    song_title,
    artist,
    primary_genre,
    artist_country,
    explicit,
    
    -- 2. داتا الأرقام (Metrics)
    streams_2025_billions,
    bpm,
    duration_seconds,
    peak_global_chart_position,
    danceability,
    energy,
    
    -- 3. داتا الـ KPIs (Calculated Fields)
    ROUND(duration_seconds / 60.0, 2) AS duration_minutes,
    CASE 
        WHEN peak_global_chart_position <= 5 THEN 'Global Hit'
        WHEN peak_global_chart_position <= 20 THEN 'Top 20'
        ELSE 'Top 50'
    END AS chart_performance_level,
    (streams_2025_billions * 1000) AS streams_in_millions -- تحويل لسهولة القراءة في الداشبورد
FROM top50_songs;

select *
from View_Songs_2025_Comprehensive