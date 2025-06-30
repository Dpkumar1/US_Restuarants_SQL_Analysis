-- Top 5 states with most restaurants
SELECT state, COUNT(*) AS num_restaurants
FROM restaurants
GROUP BY state
ORDER BY num_restaurants DESC
LIMIT 5;

-- Top-rated categories (more than 1 restaurant)
SELECT category, AVG(rating) AS avg_rating
FROM restaurants
GROUP BY category
HAVING COUNT(*) > 1
ORDER BY avg_rating DESC
LIMIT 5;

-- City with most restaurants rated above 4.5
SELECT city, COUNT(*) AS count_4_5_plus
FROM restaurants
WHERE rating >= 4.5
GROUP BY city
ORDER BY count_4_5_plus DESC
LIMIT 5;
