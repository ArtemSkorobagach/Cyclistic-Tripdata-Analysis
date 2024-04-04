# Cyclistic Tripdata Analysis
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction
In this case study, I am answering the business questions for a fictional bike-sharing company, Cyclistic. In order to find the answers, I will follow the steps of the data analysis process: [Ask](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/edit/main/README.md#ask), [Prepare](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/edit/main/README.md#prepare), [Process](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/edit/main/README.md#process), [Analyze](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/edit/main/README.md#analyze-and-share), [Share](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/edit/main/README.md#analyze-and-share), and [Act](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/edit/main/README.md#act).

### Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 16/03/2024]  
  
SQL Queries:  
[01. Data Combining](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/blob/main/01DataCombining.sql)  
[02. Data Exploration](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/blob/main/02DataExploration.sql)  
[03. Data Cleaning](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/blob/main/03DataCleaning.sql)  
[04. Data Analysis](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/blob/main/04DataAnalysis.sql)  
  
Data Visualizations: [Tableau Public](https://public.tableau.com/app/profile/artem.skorobagach/viz/CyclisticTripdataAnalysis/BikeTypesUsed?publish=yes)  
## Background
### Scenario
I am a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### About the Cyclistic
Cyclistic is a bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
### Prices
Casual users: 
A single ride on a classic bike costs $1 to unlock and $0.18/minute of ride. A single ride on electric bike costs $1 to unlock and $0.44/minute of ride.

Members:
Annual Membership costs $143.90/year and includes 24/7 unlimited 45-minute rides on a classic bike (free unlock). Trips longer than 45 minutes will incur an extra $0.18/additional minute. Upgrading a ride to an electric bike will also incur $0.18/minute of ride (free unlock).


## Ask
### Business Task
Create a marketing strategy to convert casual riders into Cyclistic members.
### Analysis Questions
Three questions will guide the future marketing program:  
1. How do annual members and casual riders use Cyclistic bikes differently?  
2. Why would casual riders buy Cyclistic annual memberships?  
3. How can Cyclistic use digital media to influence casual riders to become members?  

## Prepare
### Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from March 2023 to February 2024 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). Note: The datasets have a different name because Cyclistic is a fictional company. The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).  
  
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
### Data Organization
I will use 12 .csv files with naming convention of YYYYMM-divvy-tripdata. Each .csv file includes information about all the bike rides made in a specified month, such as the ride id, type of used bicycle, start and end times of the ride, start and end station of the ride, start and end station id, start and end location of the ride(longitude and latitude), and the status of the rider (member or casual). The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

## Process
I will use BigQuery to combine 12 datasets into a single one and then clean it. I have chosen BigQuery because it can effectively process huge amounts of data. Spreadsheet tools will struggle to process 5.7 million rows of Cyclistic dataset.
### Combining the Data
SQL Query: [Data Combining](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/blob/main/01DataCombining.sql)  
12 .csv files were uploaded as tables into `cyclistic_tripdata` dataset. A table named `combined_tripdata` has been created to store 5.7 million rows of data for the year of bike rides.
### Data Exploration
SQL Query: [Data Exploration](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/blob/main/02DataExploration.sql)  
Before the data cleaning I need to look through the `combined_tripdata` table in order to find inconsistencies in the data.

Observations:
1.	The table below shows all column names and their data types. The “ride_id” column is our primary key.

![image](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/977fdaee-3132-4e7f-840e-0823dbbf6a57)

2.	The following table shows a total of null values in each column. Some columns have the same number of missing values. It is likely that the same row can contain multiple null values in different columns i.e. missing station name and station id or missing latitude and longitude for the same station.

![image](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/103dbdf0-fc2d-4743-8232-c290ca531d54)

3.	As “ride_id” column has no null values, I will use it to check for the duplicates in the dataset.

![image](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/44b6f94d-67a8-4508-ae22-ebc79d5b4639)

0 duplicate rows were found.

4.	All “ride_id” values have length of 16 characters and there is no need to clean them.

5.	The “rideable_type” column consists of 3 unique types of bikes.

![image](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/5086a9b9-f51b-4f6e-bf50-12c456a1384d)

6.	The “started_at” and “ended_at” columns show start and end ride time in YYYY-MM-DD hh:mm:ss UTC format. A new column “ride_length” can be created later to store data about ride duration in minutes. 

7.	There are 6 888 rides that lasted more than 24 hours and 145 743 rides that lasted less than a minute (or having start time later than end time) These rides need to be removed. Also new columns such as “day_of_week” and “month” can be created as they can be helpful in further analysis of rides during the year.

8.	There are 866 105 rows that have both “start_station_name” and “start_station_id” missing.

9.	There are 920 524 rows that have both “end_station_name” and “end_station_id” missing.

10.	There are 1 595 start and 1 606 end unique station names.

11.	There are 1 522 start and 1 530 end unique station IDs. It looks like some IDs have multiple assigned station names.

12.	There are 81 start station and 85 end station IDs that have multiple station names. 

![image](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/91033002-92c7-4afa-b8a8-77376452080e)

After checking multiple station IDs I came to the conclusion that those multiple station names describe stations that are located very close to each other and refer to the same location therefore should not be removed.

13.	After that I checked if there were any stations with the same name as their IDs and found 2 test stations that should be removed.

![image](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/8b571bf3-9f2e-4c89-adde-a10658695c78)

14.	“member_casual” column has only 2 values: member and casual.

![image](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/313622a7-c0a2-4660-a5fd-5f9a972cffde)

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/blob/main/03DataCleaning.sql)  
1.	All rows with null values were removed.
2.	Rows where corresponding rides lasted less than 60 seconds or more than 24 hours were removed.
3.	Rows with test stations were removed.
4.	“ride_length”, “month” and “day_of_week” columns were added.

The total number of rows in the table has been reduced from 5 707 168 to 4 246 729 (1 460 439 rows were removed). 
Also, I renamed the original column names with more meaningful aliases.
The final table has been ordered by month, day of the week and, start station name.

  
## Analyze and Share
SQL Query: [Data Analysis](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/blob/main/04DataAnalysis.sql)  
Data Visualization: [Tableau Public](https://public.tableau.com/app/profile/artem.skorobagach/viz/CyclisticTripdataAnalysis/BikeTypesUsed?publish=yes)  
The data is stored appropriately and is now prepared for analysis. I have queried tables in BigQuery and downloaded a dataset to create visualizations with Tableu Public.

The first question for the analysis is: How do annual members and casual riders use Cyclistic bikes differently?

First of all, member and casual riders should be compared by the type of bikes they are using.

![Bike Types Used](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/6cc3bab1-6bdd-4ccc-8b58-50d800361624)
 
Cyclistic members make 64.7% of the total rides while the remaining 35.3% of rides are made by casual riders. Each pie chart shows the percentage of rides from the total. The most used bike type is a classic bike (63.23%) followed by an electric bike (35.09%) and only then docked bikes (1.69%) that are used only by casual riders. At the same time, the average ride time of casual users is almost 1.9 times longer than the average ride time of members (23.3 minutes compared to 12.49 minutes).

Next, we should look at the number of trips that are distributed by the months, days of week and hours of the day.
  
![NumOfRides Month, DoW](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/fff550d6-3e67-4ac7-ae5c-3f51a042f9ae)
![NumOfRides Hour](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/c8630e07-22ec-4b0b-ac17-cbe37b87c582)
  
__Months:__ Both casual and members show similar behavior, with more rides in the warm May-September period and fewer rides in November-March period. The gap between casuals and members is closest in the month of July.  

__Days of Week:__ There is a significant difference in how members and casual users ride throughout the week. Members tend to ride more on weekdays while casual users take more trips on weekends.

__Hours of the Day:__ Cyclistic members show a strong trend of taking more rides in the morning and at the end of the working day. On the other hand, casual users have a more even spread of the rides during the day with a gradual increase of rides number until evening. However, on weekends members and casual users take rides at almost identical pattern.
  
From the previous observations, it can be concluded that Cyclistic members are most likely using bicycles to commute to and from work/university on weekdays, while casual users use bicycles throughout the day, more often on weekends for leisure and recreation. Both user types spend the weekends similarly and take more rides between May and September.
  
Next, the average ride duration of rides is compared to find more differences in the behavior of casual and member riders. 
  
![Avg Ride Time](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/41aadfce-1abb-406f-9103-383b397a8428)
  
On average, casual riders tend to cycle longer than members do. The length of the average ride for the member does not significantly change throughout the year, week or day. However, there is a variety in the length of the rides for casual riders. The average length of the ride increases during warm months (April - September). Also, casual riders prefer to take longer rides from 10 to 16 o’clock and on the weekends. But from 4 to 9 o’clock the length of their rides is the lowest. 

These findings lead to the conclusion that in casual users travel longer (approximately 1.9x longer) but less frequently than Cyclistic members. It can be caused by the $1 unlock fee. Casual users may don’t want to take multiple short trips to avoid paying more unlock fees.  In general, they take longer rides during warm months, on weekends and during the day outside of commuting hours. It is likely that they take rides to relax and enjoy the city view.

Consistency of member`s average ride time can be explained by the absence of unlock fee. Members can freely start and end their trips as much as they want without worrying about additional unlock fees.

Locations of starting and ending stations can be analyzed to further understand the differences between casual and member riders. I will consider only the stations with more than 10 000 trips to avoid distraction from the key bike stations on a map.
  
![Start Locations](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/7fb54590-2aa1-49f4-893f-3f8136b2d50f)
  
Casual riders frequently start their trips from the bike stations close to museums, parks, zoos, beaches, harbors and aquariums while members tend to begin their journeys from stations close to universities, residential areas, restaurants, hospitals, grocery stores, theatres, schools, banks, factories, train stations and parks.
  
![End Locations](https://github.com/ArtemSkorobagach/Cyclistic-Tripdata-Analysis/assets/81870010/76286fb0-04e4-44f8-a085-9759626e030d)

Similar trend can be observed in ending station locations. Casual riders end their rides near parks, museums and other recreational sites whereas members end their rides close to universities, residential and commercial areas. Considering observations above I can make a conclusion that casual riders use bikes generally for leisure activities and recreation while members significantly rely on them to commute and keep up with the daily routine.
  
Summary:
  
|Casual|Member|
|------|------|
|Uses bikes for leisure activities throughout the day, more frequently in warm months, on the weekends.|Uses bikes to commute and for daily activities. Takes ride more frequently in warm months, from 8 to 18 o’clock of the weekdays.|
|Takes less rides than members, but the average ride time is significantly longer.|Travels much more frequently but the average ride time is shorter than casual`s.|
|Usually start and end their rides near museums, parks, zoos, along the coastline and other places of interest.|Usually start and end their rides close to universities, residential and commercial areas.|  
  
## Act
After identifying the differences between casual and member riders, marketing strategies to target casual riders can be developed to persuade them to become members.

Recommendations: 
-	Conduct an advertising campaign for casual riders that draws attention to the benefits and advantages of becoming a Cyclistic member. It should be explained that members have the opportunity to unlock the bike without additional fees and ride it for up to 45 minutes at a time for free, which is enough for the vast majority of users. Therefore, after becoming a member, they will be able to make many stops during the day, for example, to visit a museum, gallery, zoo, shop, cafe, park or just to take great pictures of sunset without worrying about being charged for each minute and having to pay again to unlock the bike. Also, it is worth noticing that Cyclistic annual membership price is equal to 13 hours of ride by casual rider. So, it will be a profitable choice for users who ride in total for more than 13 hours in a full year.
-	Conduct an advertising campaign for casual riders that highlights the convenience of daily cycling. Casual riders should be informed that with a bicycle, they can quickly move around the city and have more time to do everyday activities and also use it for enjoyment and relaxation as well. Free access to the bikes will also allow them to be more independent of city public transportation.
-	Conduct an advertising campaign for casual riders that focuses on the importance of regular cycling to maintain good health and protect nature from unnecessary carbon emissions.
-	Give casual users a free trial of Cyclistic membership so they can experience the benefits of membership for themselves. At the end of the trial period, users can be notified of the savings made during the trial period (compared to the casual pricing calculation of the same rides).

