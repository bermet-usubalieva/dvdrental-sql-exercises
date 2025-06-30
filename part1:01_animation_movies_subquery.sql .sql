-- Task: All animation movies released between 2017 and 2019 with rate more than 1
-- Business logic:
-- Find all films in the "Animation" category that were released between 2017 and 2019 (inclusive)
-- and have a rental_rate greater than 1. Sort alphabetically by title.


SELECT f.title, f.release_year, f.rental_rate, c."name" AS category_name
FROM public.film f 
INNER JOIN public.film_category fc ON fc.film_id = f.film_id
INNER JOIN public.category c ON c.category_id = fc.category_id
WHERE UPPER(c.name) = 'ANIMATION'
	AND f.release_year BETWEEN 2017 AND 2019
	AND f.rental_rate > 1
ORDER BY f.release_year, f.rental_rate, c."name";


