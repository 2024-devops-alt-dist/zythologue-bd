-- List beers by ABV (lightest to strongest):
SELECT name, abv
FROM beers
ORDER BY abv ASC;

-- Display number of beers per category
SELECT c.name AS category, COUNT(b.id) AS beer_count
FROM categories c
LEFT JOIN beers b ON c.id = b.category_id
GROUP BY c.id, c.name
ORDER BY beer_count DESC;

-- Find all beers from a given brewery
SELECT b.name AS beer_name, b.abv
FROM beers b
JOIN breweries br ON b.brewery_id = br.id
WHERE br.name = 'Golden Hop Brewery';

-- List users and the number of beers they have added to their favorites
SELECT u.first_name, COUNT(f.beer_id) AS favorite_count
FROM users u
LEFT JOIN favorites f ON u.id = f.user_id
GROUP BY u.id, u.first_name
ORDER BY favorite_count DESC;

-- Add a new beer to the database
INSERT INTO beers (name, description, abv, brewery_id, category_id)
VALUES ('Tropical IPA', 'A fruity IPA with mango and passionfruit notes.', 7.0, 2, 1);

-- Display beers and their breweries, ordered by brewery country
SELECT b.name AS beer_name, br.name AS brewery_name, br.country
FROM beers b
JOIN breweries br ON b.brewery_id = br.id
ORDER BY br.country, br.name, b.name;

-- List beers with their ingredients
SELECT b.name AS beer_name, STRING_AGG(i.name, ', ') AS ingredients
FROM beers b
LEFT JOIN ingredients i ON b.id = i.beer_id
GROUP BY b.id, b.name
ORDER BY b.name;

-- Display breweries and the number of beers they produce, for those with more than 5 beers
SELECT br.name AS brewery_name, COUNT(b.id) AS beer_count
FROM breweries br
JOIN beers b ON br.id = b.brewery_id
GROUP BY br.name
HAVING COUNT(b.id) > 5
ORDER BY beer_count DESC;

-- List beers not yet added to favorites by any user
SELECT b.name 
FROM beers b
LEFT JOIN favorites f ON b.id = f.beer_id
WHERE f.beer_id IS NULL;

-- Find favorite beers shared by two users
SELECT b.name AS beer_name
FROM beers b
JOIN favorites f1 ON b.id = f1.beer_id
JOIN favorites f2 ON b.id = f2.beer_id
WHERE f1.user_id = 1 AND f2.user_id = 2;

-- Display breweries whose beers have an average rating above a certain value
SELECT br.name AS brewery_name, AVG(r.rating) AS average_rating
FROM breweries br
JOIN beers b ON br.id = b.brewery_id
JOIN reviews r ON b.id = r.beer_id
GROUP BY br.name
HAVING AVG(r.rating) > 4
ORDER BY average_rating DESC;

-- Update brewery information
UPDATE breweries
SET country = 'updated-USA'
WHERE name = 'Crystal Brew Co.';

-- Delete photos of a particular beer
DELETE FROM photos
WHERE beer_id = 1;
