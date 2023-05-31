-- Section1
Select name, phone
FROM customers
         join (orders, restaurant_foods) on customers.id = orders.customer_id AND orders.restaurant_food_id = restaurant_foods.id
GROUP BY orders.customer_id
ORDER BY COUNT(DISTINCT restaurant_foods.restaurant_id) DESC
LIMIT 1;

-- Section2
SELECT foods.id, name
FROM foods
         join (orders, restaurant_foods)
              on orders.restaurant_food_id = restaurant_foods.id AND foods.id = restaurant_foods.food_id
GROUP BY foods.id
ORDER BY AVG(orders.rate) DESC, foods.id
LIMIT 10;

-- Section3
SELECT restaurants.id, name
FROM restaurants
         join (orders, restaurant_foods)
              on orders.restaurant_food_id = restaurant_foods.id AND restaurant_foods.restaurant_id = restaurants.id
GROUP BY restaurants.id
ORDER BY AVG(orders.rate) DESC, restaurants.id
LIMIT 10;

-- Section4
SELECT name, phone
FROM customers
         join (orders, restaurant_foods)
              on orders.restaurant_food_id = restaurant_foods.id AND orders.customer_id = customers.id
GROUP BY name
HAVING COUNT(DISTINCT restaurant_id) > 4
ORDER BY name;