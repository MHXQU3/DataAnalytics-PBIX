-- Q1. How many staff are there in all of the UK stores?
SELECT SUM("staff numbers") AS total_staff_members, country_code FROM dim_stores
WHERE country_code = 'GB'
GROUP BY country_code