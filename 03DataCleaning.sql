-- CYCLISTIC TRIPDATA CLEANING

DROP TABLE IF EXISTS `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`;

-- Cleaning and processing combined_tripdata table
-- number of rows before cleaning: 5 707 168
-- number of rows after cleaning: 4 246 729

CREATE TABLE IF NOT EXISTS `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean` AS (
  SELECT
  ride_id,
  rideable_type AS bike_type,
  started_at AS start_time,
  ended_at AS end_time,
  ROUND(DATE_DIFF(ended_at, started_at, SECOND) / 60, 2) AS ride_duration,  -- calculating the ride duration
  CASE EXTRACT(DAYOFWEEK FROM started_at)                                   
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'    
  END AS day_of_week,
  CASE EXTRACT(MONTH FROM started_at)
    WHEN 1 THEN 'January'
    WHEN 2 THEN 'February'
    WHEN 3 THEN 'March'
    WHEN 4 THEN 'April'
    WHEN 5 THEN 'May'
    WHEN 6 THEN 'June'
    WHEN 7 THEN 'July'
    WHEN 8 THEN 'August'
    WHEN 9 THEN 'September'
    WHEN 10 THEN 'October'
    WHEN 11 THEN 'November'
    WHEN 12 THEN 'December'
    END AS month,
  start_station_name, start_station_id,
  end_station_name, end_station_id,
  start_lat, start_lng,
  end_lat, end_lng,
  member_casual AS customer_type
  FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`
  WHERE start_station_name IS NOT NULL                      -- cleaning null values
    AND start_station_id IS NOT NULL 
    AND end_station_name IS NOT NULL
    AND end_station_id IS NOT NULL
    AND end_lat IS NOT NULL
    AND end_lng IS NOT NULL
    AND DATE_DIFF(ended_at, started_at, MINUTE) < 1440      -- cleaning error rides (rides longer than 24 hours)
    AND DATE_DIFF(ended_at, started_at, SECOND) >= 60       -- cleaning cancelled rides and rides where start time is later than end time
    AND start_station_name != start_station_id              -- cleaning test bike stations
  ORDER BY EXTRACT(MONTH FROM started_at), EXTRACT(DAYOFWEEK FROM started_at), start_station_name
);

-- assigning the primary key to ride_id
ALTER TABLE `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
ADD PRIMARY KEY(ride_id) NOT ENFORCED;
