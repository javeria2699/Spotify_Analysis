# Spotify Data Analysis Project
![spotify](https://github.com/javeria2699/Spotify_Analysis/blob/main/spotify_logo.jpg)
# Spotify Data Analysis Project

## Project Overview

This project analyzes Spotify track and album data using SQL. By performing various SQL queries, we extract meaningful insights on track performance, artist trends, and key metrics such as energy, danceability, and streams. The project applies both basic and advanced SQL techniques to uncover deeper insights from the dataset.

## Objectives

This project aims to:
1. **Perform Data Exploration**: Use SQL to retrieve and explore insights from Spotify's track and album data.
2. **Analyze Track Performance**: Investigate track metrics, including streams, energy, danceability, and liveness.
3. **Generate Artist and Album Insights**: Explore trends in albums and artist performance.
4. **Apply Advanced SQL Techniques**: Utilize window functions, Common Table Expressions (CTEs), and aggregation for more complex analysis.
5. **Compare Streaming Platforms**: Identify tracks with higher Spotify streams compared to YouTube views.
6. **Derive Actionable Insights**: Provide data-driven recommendations for artists or content creators based on patterns identified in the data.

## Dataset Description

The dataset includes detailed information on Spotify tracks, such as:
- **Track Information**: Title, album, artist, and album type.
- **Music Metrics**: Danceability, energy, loudness, liveness, and more.
- **Performance Metrics**: Streams, views, likes, comments, and whether the track is licensed or an official video.

## SQL Queries

### Basic Level Queries
- **Tracks with more than 1 billion streams**
- **Albums and their respective artists**
- **Total comments for licensed tracks**
- **Tracks of album type 'single'**
- **Total number of tracks per artist**

### Medium Level Queries
- **Average danceability per album**
- **Top 5 tracks with highest energy**
- **Tracks with official videos, views, and likes**
- **Total views for tracks in each album**
- **Tracks streamed more on Spotify than YouTube**

### Advanced Level Queries
- **Top 3 most-viewed tracks for each artist (window functions)**
- **Tracks with liveness score above average**
- **Difference between highest and lowest energy values for each album (using CTE)**

## Project Structure

The project is organized into:
- **SQL Queries**: A collection of SQL scripts that run the queries against the dataset.
- **Data**: The dataset containing track, album, and artist information.
