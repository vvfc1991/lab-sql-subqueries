use sakila;

SELECT 
    COUNT(*) AS num_copies
FROM 
    inventory
WHERE 
    film_id = (SELECT film_id FROM film WHERE title = 'Hunchback Impossible');
    SELECT 
    title,
    length
FROM 
    film
WHERE 
    length > (SELECT AVG(length) FROM film);
    SELECT 
    actor.actor_id,
    actor.first_name,
    actor.last_name
FROM 
    actor
JOIN 
    film_actor ON actor.actor_id = film_actor.actor_id
JOIN 
    film ON film_actor.film_id = film.film_id
WHERE 
    film.title = 'Alone Trip';
    SELECT 
    film.title
FROM 
    film
JOIN 
    film_category ON film.film_id = film_category.film_id
JOIN 
    category ON film_category.category_id = category.category_id
WHERE 
    category.name = 'Family';
    
    SELECT 
    first_name,
    last_name,
    email
FROM 
    customer
WHERE 
    address_id IN (SELECT address_id FROM address WHERE city_id IN (SELECT city_id FROM city WHERE country_id IN 
    (SELECT country_id FROM country WHERE country = 'Canada')));
    SELECT 
    c.first_name,
    c.last_name,
    c.email
FROM 
    customer c
JOIN 
    address a ON c.address_id = a.address_id
JOIN 
    city ci ON a.city_id = ci.city_id
JOIN 
    country co ON ci.country_id = co.country_id
WHERE 
    co.country = 'Canada';
    SELECT 
    film.title
FROM 
    film
JOIN 
    film_actor ON film.film_id = film_actor.film_id
WHERE 
    film_actor.actor_id = (
        SELECT 
            actor_id
        FROM 
            film_actor
        GROUP BY 
            actor_id
        ORDER BY 
            COUNT(*) DESC
        LIMIT 1);
        
        SELECT 
    customer_id,
    SUM(amount) AS total_amount_spent
FROM 
    payment
GROUP BY 
    customer_id
HAVING 
    SUM(amount) > (
        SELECT 
            AVG(total_amount_spent)
        FROM 
            (SELECT 
                SUM(amount) AS total_amount_spent
            FROM 
                payment
            GROUP BY 
                customer_id) AS avg_amount_spent
    );