-- CYCLISTIC TRIPDATA ANALYSIS

-- Bike type preferences
SELECT
  bike_type,
  customer_type,
  COUNT(ride_id) AS num_of_rides
  FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
  GROUP BY bike_type, customer_type
  ORDER BY bike_type;

-- Percentage and total number of rides
SELECT 
  customer_type,
  COUNT(ride_id) AS num_of_rides,
  (COUNT(ride_id)/(SELECT COUNT(*) FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`)) * 100 AS perc_of_rides
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
GROUP BY customer_type;

-- Number of rides per month
SELECT
  customer_type,
  month,
  COUNT(ride_id) AS num_of_rides
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
GROUP BY customer_type, month
ORDER BY EXTRACT(MONTH FROM PARSE_DATE("%B",month));

-- Average number of rides per weekday
SELECT
  customer_type,
  day_of_week,
  COUNT(ride_id) AS num_of_rides
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
GROUP BY day_of_week, customer_type
ORDER BY EXTRACT(DAY FROM PARSE_DATE("%A",day_of_week));

-- Average number of rides by hour
SELECT
  EXTRACT(HOUR FROM start_time) AS hour,
  customer_type,
  COUNT(ride_id) AS num_of_rides
  FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
  GROUP BY hour, customer_type
  ORDER BY hour;

-- Average ride duration by month
SELECT 
  month,
  customer_type,
  AVG(ride_duration) AS avg_ride_dur,
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
GROUP BY month, customer_type
ORDER BY EXTRACT(MONTH FROM PARSE_DATE("%B",month));

-- Average ride duration by weekday
SELECT 
  day_of_week,
  customer_type,
  AVG(ride_duration) AS avg_ride_dur,
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
GROUP BY day_of_week, customer_type
ORDER BY EXTRACT(DAY FROM PARSE_DATE("%A",day_of_week));

-- Average ride duration by hour
SELECT 
  EXTRACT(HOUR FROM start_time) AS hour,
  customer_type,
  AVG(ride_duration) AS avg_ride_dur,
FROM `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata_clean`
GROUP BY hour, customer_type
ORDER BY hour;
