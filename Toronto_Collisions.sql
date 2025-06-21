# MOST DANGEROUS HOURS OF MONTHS
WITH monthly_analysis AS (
SELECT
	accident_month,
    COUNT(accident_month) AS total_accidents,
    SUM(fatalities) AS total_fatalities
FROM accident
GROUP BY accident_month
)
,
hourly_analysis AS (
SELECT 
	accident_hour,
    COUNT(accident_hour) AS total_accidents,
    SUM(fatalities) AS total_fatalities
FROM accident
GROUP BY accident_hour
)

SELECT
	m.accident_month,
    h.accident_hour,
    h.total_fatalities
FROM monthly_analysis m
JOIN hourly_analysis h
ORDER BY total_fatalities DESC;


# FINDING THE MOST FATAL ACCIDNET INVOLVING PEDESTRIANS / CAR / MOTORCYCLE AND BICYCLE

# PEDESTRIANS
SELECT accident_day, accident_month, accident_year, fatalities, pedestrians, car, motorcycle, bicycle,
CASE
	WHEN fatalities <= 1 THEN "Low"
	WHEN fatalities <= 2 THEN "Medium"
	ELSE "High"
	END AS fatality_rating
FROM accident
WHERE pedestrians = "YES" AND fatalities > 2;

# CAR
SELECT accident_day, accident_month, accident_year, fatalities, pedestrians, car, motorcycle, bicycle,
CASE
	WHEN fatalities <= 1 THEN "Low"
	WHEN fatalities <= 2 THEN "Medium"
	ELSE "High"
	END AS fatality_rating
FROM accident
WHERE car = "YES" AND fatalities > 2;

# MOTORCYCLE
SELECT accident_day, accident_month, accident_year, fatalities, pedestrians, car, motorcycle, bicycle,
CASE
	WHEN fatalities <= 1 THEN "Low"
	WHEN fatalities <= 2 THEN "Medium"
	ELSE "High"
	END AS fatality_rating
FROM accident
WHERE motorcycle = "YES" AND fatalities = 1;

# BICYCLE
SELECT accident_day, accident_month, accident_year, fatalities, pedestrians, car, motorcycle, bicycle,
CASE
	WHEN fatalities <= 1 THEN "Low"
	WHEN fatalities <= 2 THEN "Medium"
	ELSE "High"
	END AS fatality_rating
FROM accident
WHERE bicycle = "YES"AND fatalities = 1 AND car = "YES";

# MAKING SEVERITY INDEX AND PEDESTRIAN RISK ANALYSIS
ALTER TABLE accident
ADD COLUMN severity_index float;

SET SQL_SAFE_UPDATES = 0;
UPDATE accident
SET severity_index = 
(fatalities * 0.7) + 
(injuries * 0.3)+
CASE
WHEN pedestrians = "YES" THEN 0.5
ELSE 0
END;

SELECT accident_hour, area, AVG(severity_index) AS average_severity, COUNT(*) AS total_accidents, SUM(fatalities) AS total_fatalities
FROM accident
WHERE pedestrians = "YES"
GROUP BY accident_hour, area
HAVING total_accidents > 10
ORDER BY average_severity DESC;

# MOST DANGEROUS AREA'S FOR CAR - > HIGH VEHICLE INSURANCE
SELECT area, SUM(fatalities) AS total_fatalities, COUNT(*) as total_accidents
FROM accident
WHERE car = "YES"
GROUP BY area
ORDER BY total_fatalities DESC
LIMIT 5;

# WEEKEND VS WEEKDAY TRENDS
SELECT COUNT(*) AS total_accidents, SUM(fatalities) AS total_fatalities,
CASE
WHEN accident_day = "SATURDAY" OR accident_day = "SUNDAY" THEN "weekend"
ELSE "weekday"
END AS day
FROM accident
GROUP BY day;

SELECT SUM(fatalities) AS total_fatalities, COUNT(*) AS total_accidents, accident_day
FROM accident
GROUP BY accident_day
ORDER BY total_accidents DESC;

# SOME INSURANCE RATIOS WE CAN CULCULATE USING FOLLOWING DATA

# FATALITY RATE / ACCIDENT
# TOTAL ACCIDENTS WITH ATLEAST 1 FATALITY / TOTAL ACCIDENTS * 100

SELECT ROUND(100 * SUM(CASE WHEN fatalities > 0 THEN 1 ELSE 0 END) / COUNT(*),2)
AS fatality_rate
FROM accident;

# SEVERE INJURY RATIO
# ACCIDENTS WITH INJURY / TOTAL ACCIDENT * 100

SELECT ROUND(100 * SUM(CASE WHEN injuries = "YES" THEN 1 ELSE 0 END) / COUNT(*),2)
AS fatality_rate
FROM accident;

# PEDESTRIAN CLAIM PROBABILITY 
# PEDESTRIAN ACCIDENT WITH FATALITY OR INJURY / TOTAL ACCIDENT * 100

SELECT ROUND(SUM(CASE 
WHEN fatalities > 0 THEN 1
WHEN injuries = "YES" THEN 1 
ELSE 0 END) / COUNT(*),2) AS pedestrian_claim_probability
FROM accident;

# HIGH RISK AREA SEVERITY SCORE
# TOTAL ACCIDENT IN AREA / TOTAL ACCIDENT * 100

SELECT area,
ROUND( 100 * SUM(CASE 
WHEN fatalities > 0 THEN 1
WHEN injuries = "YES" THEN 1
ELSE 0 END) / COUNT(*),2) AS area_score
FROM accident
GROUP BY area
ORDER BY area_score ASC
LIMIT 5;
































