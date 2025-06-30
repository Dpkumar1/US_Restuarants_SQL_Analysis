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

-- Average Review Count by Price Range
SELECT price_range, AVG(review_count) AS avg_reviews
FROM restaurants
GROUP BY price_range
ORDER BY avg_reviews DESC;


--Average Rating and Review Count by City (Top 10 Cities by Number of Restaurants)
WITH city_counts AS (
  SELECT city, COUNT(*) AS restaurant_count
  FROM restaurants
  GROUP BY city
  ORDER BY restaurant_count DESC
  LIMIT 10
)
SELECT r.city,
       AVG(r.rating) AS avg_rating,
       AVG(r.review_count) AS avg_review_count,
       c.restaurant_count
FROM restaurants r
JOIN city_counts c ON r.city = c.city
GROUP BY r.city, c.restaurant_count
ORDER BY c.restaurant_count DESC;

-- Distribution of Price Range Across States
SELECT state, price_range, COUNT(*) AS count
FROM restaurants
GROUP BY state, price_range
ORDER BY state, price_range;

-- Restaurants with the Highest Review Counts (Top 10)
SELECT name, city, state, review_count, rating
FROM restaurants
ORDER BY review_count DESC
LIMIT 10;

-- Count of Restaurants per Category with Average Price Range (assuming price range can be mapped to numeric)
-- If price_range is like $, $$, $$$, $$$$ etc., map them to numbers first
WITH price_map AS (
  SELECT *,
         CASE price_range
           WHEN '$' THEN 1
           WHEN '$$' THEN 2
           WHEN '$$$' THEN 3
           WHEN '$$$$' THEN 4
           ELSE NULL
         END AS price_num
  FROM restaurants
)
SELECT category,
       COUNT(*) AS num_restaurants,
       AVG(price_num) AS avg_price_level
FROM price_map
GROUP BY category
ORDER BY num_restaurants DESC
LIMIT 10;

-- Top 5 States with Most Highly Rated (≥4.5) Restaurants
SELECT state, COUNT(*) AS high_rating_count
FROM restaurants
WHERE rating >= 4.5
GROUP BY state
ORDER BY high_rating_count DESC
LIMIT 5;

-- Most Common Restaurant Names (to find chains or popular brands)
SELECT name, COUNT(*) AS count
FROM restaurants
GROUP BY name
ORDER BY count DESC
LIMIT 10;
