-- CYCLISTIC TRIPDATA EXPLORATION

-- Counting total number of trips: 5 707 168
SELECT COUNT(DISTINCT ride_id) AS num_of_trips
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`;


-- Reviewing the data types of all columns
SELECT column_name, data_type
FROM `data-analytics-01-407311.cyclistic_tripdata`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'combined_tripdata';


-- Checking for the presence of NULL values in each column
SELECT 
  COUNT(*) - COUNT(ride_id) AS ride_id_nulls,
  COUNT(*) - COUNT(rideable_type) AS rideable_type_nulls,
  COUNT(*) - COUNT(started_at) AS started_at_nulls,
  COUNT(*) - COUNT(ended_at) AS ended_at_nulls,
  COUNT(*) - COUNT(start_station_name) AS start_station_name_nulls,
  COUNT(*) - COUNT(start_station_id) AS start_station_id_nulls,
  COUNT(*) - COUNT(end_station_name) AS end_station_name_nulls,
  COUNT(*) - COUNT(end_station_id) AS end_station_id_nulls,
  COUNT(*) - COUNT(start_lat) AS start_lat_nulls,
  COUNT(*) - COUNT(start_lng) AS start_lng_nulls,
  COUNT(*) - COUNT(end_lat) AS end_lat_nulls,
  COUNT(*) - COUNT(end_lng) AS end_lng_nulls,
  COUNT(*) - COUNT(member_casual) AS member_casual_nulls
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`;


-- Counting duplicate rows: 0
SELECT
  COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`;


-- Exploring ride_id: all rides have 16 characters long ID
SELECT
  COUNT(ride_id) AS num_of_rides,
  LENGTH(ride_id) AS ride_id_len
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
GROUP BY ride_id_len;


-- Exploring rideable_type: there are 3 types of bikes (electric, classic and docked)
SELECT 
  DISTINCT rideable_type,
  COUNT(rideable_type) AS num_of_rides
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
GROUP BY rideable_type;


-- Exploring started_at, ended_at: listed as a TIMESTAMP YYYY-MM-DD HH:MM:SS UTC
SELECT
  started_at,
  ended_at
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`;


-- Counting rides that are longer than 24 hours (most likely are rides with an error): 6 888
SELECT 
  COUNT(ride_id) as num_of_rides,
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE DATE_DIFF(ended_at, started_at, MINUTE) >= 1440;


-- Counting rides that are shorter than 1 minute (canceled rides): 145 743
SELECT 
  COUNT(ride_id) as num_of_rides,
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE DATE_DIFF(ended_at, started_at, SECOND) < 60;


-- Counting rides where start time is later than the end time: 296
SELECT
  COUNT(ride_id) as num_of_rides,
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE started_at > ended_at;


-- Exploring "start_station_name"/"start_station_id" and "end_station_name"/"end_station_id": 
-- There are 866 105 rows that have both “start_station_name” and “start_station_id” missing
SELECT
  COUNT(ride_id) - COUNT(start_station_name) as num_of_names,
  COUNT(ride_id) - COUNT(start_station_id) as num_of_ids
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE start_station_name IS NULL
  AND start_station_id IS NULL;


-- There are 920 524 rows that have both “end_station_name” and “end_station_id” missing
SELECT
  COUNT(ride_id) - COUNT(end_station_name) as num_of_names,
  COUNT(ride_id) - COUNT(end_station_id) as num_of_ids
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE end_station_name IS NULL
  AND end_station_id IS NULL;


-- There are 1 595 start and 1 606 end unique station names
SELECT 
  COUNT(DISTINCT start_station_name) as num_of_start_names
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE start_station_name IS NOT NULL;

SELECT 
  COUNT(DISTINCT end_station_name) AS num_of_end_names
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE end_station_name IS NOT NULL;


-- Exploring start_station_id and end_station_id :
-- There are 1 522 unique start and 1 530 end station IDs
-- It looks like some IDs have multiple assigned station names
SELECT 
  COUNT(DISTINCT start_station_id) AS num_of_ids
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE start_station_id IS NOT NULL;

SELECT 
  COUNT(DISTINCT end_station_id) AS num_of_ids
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE end_station_id IS NOT NULL;


-- Finding the IDs that have multiple station names: 
-- 81 start_station_id and 85 end_station_id with multiple station names
SELECT 
  start_station_id,
  COUNT(DISTINCT start_station_name) AS num_of_names
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE start_station_id IS NOT NULL
GROUP BY start_station_id
ORDER BY num_of_names DESC;

SELECT 
  end_station_id,
  COUNT(DISTINCT end_station_name) AS num_of_names
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE end_station_id IS NOT NULL
GROUP BY end_station_id
ORDER BY num_of_names DESC;


-- Checking multiple names that are connected to one ID
-- Listed names describe stations that located very close to each other and refer to the same location
SELECT
  DISTINCT start_station_name
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE start_station_id = '15541';

SELECT
  DISTINCT end_station_name
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE end_station_id = '15541';


-- There are 2 stations where the station name equals to station ID (test stations)
SELECT 
  DISTINCT start_station_name,
  start_station_id
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE start_station_name IS NOT NULL
  AND start_station_name = start_station_id;

SELECT 
  DISTINCT end_station_name,
  end_station_id
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
WHERE end_station_name IS NOT NULL
  AND end_station_name = end_station_id;


-- Exploring member_casual: there are only two types of membership - member or casual
SELECT 
  DISTINCT member_casual AS types_of_membership
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`;
