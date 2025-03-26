/* 1. List all customers with their addresses
   output: first_name, last_name, Address city, country, postal_code*/

SELECT
    c.first_name, c.last_name, a.address, ci.city, co.country, a.postal_code
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;




/* 2. Find the number of films in each rating category
   output: rating, film_count */

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;




/* 3. Find the film(s) with the longest duration(length)
   output: Title, Length */

SELECT title, length
FROM film
WHERE length = (SELECT MAX(length) FROM film);




/* 4. For each customer, get the full name in one column and the total
amount paid by him.
   output: fullname, total_paid*/

SELECT CONCAT(c.first_name, ' ', c.last_name) AS fullname, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;




/* 5. List the top-spending customers
  output: Customer id, country, Spending amount */

SELECT c.customer_id, co.country, SUM(p.amount) AS spending_amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY c.customer_id, co.country
ORDER BY spending_amount DESC
LIMIT 10;
