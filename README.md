# Spotify Music Trends and Artist Performance Analysis

## Business Problem
The music streaming industry is highly dynamic, with consumer preferences shifting rapidly across genres and geographies. This analytical project evaluates music streaming performance by combining Spotify's All-Time Top 100 Most Streamed Songs with the 2025 Wrapped Top 50 Artists and Global Songs datasets. The objective is to extract actionable business insights to help record labels, artists, and streaming platform planners understand:
- Historical and modern driving forces behind global hits.
- Behavioral and audio characteristics (BPM, danceability, energy) defining top-tier tracks.
- Key listener loyalty metrics and regional market trends to drive promotional and distribution strategies.

---

## Methodology
This project implements an end-to-end data analysis pipeline structured across three core data engineering and business intelligence phases:

### 1. Data Cleaning & Preprocessing (Python)
- **Files Processed:** `spotify_alltime_top100_songs.csv`, `spotify_wrapped_2025_top50_artists.csv`, and `spotify_wrapped_2025_top50_songs.csv`.
- **Pipeline Implementation:** Using **Pandas**, an automated cleanup notebook was built to drop duplicate records based on unique song-artist constraints, treat structural missing values in numeric indicators, strip leading/trailing string whitespace, and normalize textural entries to title case.
- **Advanced Transformations:** Engineered custom attributes such as a standalone duration field in minutes (`duration_min`) and removed anomalous entries containing corrupted values like invalid zero-BPM markers.
- **Outputs Generated:** Successfully exported standardized relational datasets: `top100_clean.csv`, `top50_artists_clean.csv`, and `top50_songs_clean.csv`.

### 2. Relational Modeling & Engineered KPIs (SQL Server)
The normalized datasets were uploaded into a relational environment where complex database views were developed to compile performance metrics and track health flags:
- `View_AllTime_Comprehensive`: Establishes annual success benchmarks by determining the exact number of years elapsed since release (`years_since_release`) and evaluates long-term engagement via an annual performance coefficient (`streams_per_year_index`). Tracks are classified dynamically using a `song_vibe_category` conditional statement based on acoustic metrics.
- `View_Artists_2025_Comprehensive`: Focuses on market standing by evaluating the exact span an artist spent in the industry (`years_in_industry`), their current global accolades (`award_status`), and a critical customer loyalty indicator (`loyalty_ratio`) showing the ratio of followers against monthly streaming volume.
- `View_Songs_2025_Comprehensive`: Aggregates real-time charts by normalizing stream scales to absolute millions, calculating structural duration features, and clustering chart levels into distinct categories based on peak historical positions (`chart_performance_level`).

### 3. Business Intelligence & Dashboarding (Microsoft Excel)
- **File Used:** `Final project.xlsx`
- **Execution:** Engineered an interactive corporate dashboard utilizing advanced aggregation formulas and cross-filtering slicers. The interface offers executives and stakeholders a fluid way to toggle metrics by region, primary music genre, release timelines, and standalone artistic profiles.

---

## Key Insights
- **Genre Dominance:** Pop remains the undisputed leader in secular listening habits, making up the largest share of the All-Time Top 100 roster (17 songs), followed closely by Indie Pop (12 songs) and Alternative Rock (7 songs).
- **Geographic Influence:** Artists from the USA represent the vast majority of all-time global chart dominance with 52 out of the top 100 tracks, while the UK holds the second-largest share with 18 tracks, followed by Canada with 8 tracks.
- **Streaming Volume Records:** Within the historical registry, Ed Sheeran commands the highest collective output among all competing artists, surpassing an aggregate of 15.62 billion individual streams across his catalog entries.
- **Modern Audience Engagement:** Looking closely at the 2025 performance data, The Weeknd leads global monthly consumption metrics, establishing an industry peak of 110.4 million active monthly listeners.

---

## Repository Structure
- `Data/`: Contains original raw operational files alongside the engineered files (`top100_clean.csv`, `top50_artists_clean.csv`, `top50_songs_clean.csv`).
- `Scripts/`: Houses the Python automated data preprocessing script and the comprehensive database views structured via SQL Server.
- `Dashboard/`: Holds the interactive enterprise-ready BI reporting dashboard (`Final project.xlsx`).

---
**Developed by:** Eng. Ibrahim Hassan Ibrahim Al-Maadawi
