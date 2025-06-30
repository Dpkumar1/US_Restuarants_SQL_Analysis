CREATE TABLE restaurants (
    id SERIAL PRIMARY KEY,
    name TEXT,
    category TEXT,
    city TEXT,
    state TEXT,
    rating FLOAT,
    price_range TEXT,
    review_count INT
);
