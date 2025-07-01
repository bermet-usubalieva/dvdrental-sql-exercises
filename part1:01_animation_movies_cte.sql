-- Task: All animation movies released between 2017 and 2019 with rate more than 1
-- Business logic:
-- Get all films in the "Animation" category released between 2017 and 2019,
-- with rental_rate > 1, sorted alphabetically. Use CTE instead of subquery.

WITH filtered_films AS (
SELECT 
	f.film_id,
	f.title,
	f.release_year,
	f.rental_rate
FROM public.film f 
WHERE f.release_year BETWEEN 2017 AND 2019
	AND f.rental_rate > 1
),
animation_films AS (
SELECT 
	ff.title,
	ff.release_year,
	ff.rental_rate,
	fc.category_id,
	c."name" AS category_name
FROM public.film_category fc 
INNER JOIN filtered_films ff ON ff.film_id = fc.film_id
INNER JOIN public.category c ON fc.category_id =c.category_id
WHERE UPPER(c."name") = 'ANIMATION'
)
SELECT *
FROM animation_films 
ORDER BY title ;





