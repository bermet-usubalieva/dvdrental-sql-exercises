-- Task: The revenue earned by each rental store after March 2017
-- Output: address + address2 as one column, total revenue per store

SELECT 
	concat_ws(' ', a.address, a.address2) AS full_address,
	SUM(p.amount) AS revenue
FROM public.payment p 
INNER JOIN public.rental r ON r.rental_id = p.rental_id
INNER JOIN public.inventory i ON i.inventory_id = r.inventory_id
INNER JOIN public.store s ON s.store_id = i.store_id
INNER JOIN public.address a ON a.address_id = s.address_id
WHERE p.payment_date > '2017.03.31'
GROUP BY full_address;


