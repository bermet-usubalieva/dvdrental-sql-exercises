-- Task: The revenue earned by each rental store after March 2017
-- CTE version

WITH filtered_payments AS (
SELECT *
FROM public.payment
WHERE payment_date > '2017-03-31'
),
store_revenue AS (
SELECT 
	s.store_id,
    CONCAT_WS(' ', a.address, a.address2) AS full_address,
    SUM(p.amount) AS revenue
    FROM filtered_payments p
    INNER JOIN public.rental r ON r.rental_id = p.rental_id
    INNER JOIN public.inventory i ON i.inventory_id = r.inventory_id
    INNER JOIN public.store s ON s.store_id = i.store_id
    INNER JOIN public.address a ON a.address_id = s.address_id
    GROUP BY s.store_id, full_address
)
SELECT full_address, revenue
FROM store_revenue;
