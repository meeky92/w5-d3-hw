-- Q1: List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE district = 'Texas';

-- Q2: List all payments of more than $7.00 with the customer’s first and last name
SELECT first_name, last_name, amount
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id 
WHERE amount > 7;

-- Q3: Show all customer names who have made over $175 in payments (use subqueries)
--SELECT customer_id 
--FROM payment 
--GROUP BY customer_id 
--HAVING sum(amount) > 175;
--
--SELECT c.customer_id, c.first_name, c.last_name
--FROM payment p 
--JOIN customer c 
--ON p.customer_id = c.customer_id 
--GROUP BY c.customer_id, c.first_name, c.last_name 
--HAVING sum(amount) > 175;

SELECT*
FROM customer c 
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment p 
	GROUP BY customer_id 
	HAVING sum(amount) > 175
);


-- Q4: List all customers that live in Argentina (use the city table)
--SELECT*
--FROM city c 
--WHERE country_id = 6;

SELECT*
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 


-- Q5: Show all the film categories with their count in descending order
SELECT c.category_id, c."name", count(*)
FROM category c 
JOIN film_category fc
ON c.category_id = fc.category_id 
GROUP BY c.category_id
ORDER BY count(*) DESC;


-- Q6: What film had the most actors in it (show film info)?
SELECT f.film_id, title, count(*)
FROM film f 
JOIN film_actor fa 
ON f.film_id = fa.film_id
GROUP BY f.film_id 
ORDER BY count(f.film_id) DESC;


-- Q7: Which actor has been in the least movies?
--SELECT fa.actor_id, count(*)
--FROM film f 
--JOIN film_actor fa 
--ON f.film_id = fa.film_id
--GROUP BY fa.actor_id  
--ORDER BY count(f.film_id) ASC;

SELECT a.actor_id, a.first_name, a.last_name, count(*)
FROM actor a 
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
JOIN film f 
ON f.film_id = fa.film_id 
GROUP BY a.actor_id
ORDER BY count(*) ASC;


-- Q8: Which country has the most cities?
SELECT c.country_id, c.country, count(*)
FROM country c 
JOIN city c2 
ON c.country_id = c2.country_id 
GROUP BY c.country_id 
ORDER BY count(*) DESC;

-- Q9: List the actors who have been in between 20 and 25 films





