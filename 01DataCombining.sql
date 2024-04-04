-- CYCLISTIC TRIPDATA COMBINATION

DROP TABLE IF EXISTS `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata`;

-- COMBINING 12 TABLES WITH DATA FROM MARCH 2023 TO FEBRUARY 2024 INTO 1 TABLE

CREATE TABLE IF NOT EXISTS `data-analytics-01-407311.cyclistic_tripdata.combined_tripdata` AS
(
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.03_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.04_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.05_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.06_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.07_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.08_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.09_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.10_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.11_2023_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.12_2023_tripdata`
  UNION ALL
  
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.01_2024_tripdata`
  UNION ALL
  SELECT * FROM `data-analytics-01-407311.cyclistic_tripdata.02_2024_tripdata`
);
