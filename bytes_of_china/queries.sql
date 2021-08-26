/*
  Display the restaurant name, its address (street number and name) and telephone number. 
*/
SELECT r.name restaurant_name, a.street_number || ' ' || a.street_name street, r.telephone telephone
FROM restaurant AS r
JOIN address AS a
  ON r.id = a.restaurant_id;

/*
  Find the best rating the restaurant ever received. 
*/
SELECT MAX(review.rating) best_rating
FROM restaurant 
JOIN review
  ON restaurant.id = review.restaurant_id
GROUP BY restaurant.id;

/*
  Display a dish name, its price and category sorted by the dish name.
*/
SELECT d.name dish_name, cd.price price, c.name category
FROM dish AS d
JOIN categories_dishes AS cd
  ON d.id = cd.dish_id
JOIN category AS c
  ON c.id = cd.category_id
ORDER BY 1;

/* 
  Display all the spicy dishes, their prices and category.
*/
SELECT d.name spicy_dish_name, cd.price price, c.name category
FROM dish AS d
JOIN categories_dishes AS cd
  ON d.id = cd.dish_id AND d.hot_and_spicy = TRUE
JOIN category AS c
  ON c.id = cd.category_id
ORDER BY 1;

/*
  Find dishes that belong to more than one category.
*/
WITH dishes_multiple_categories AS (
 SELECT dish_id, COUNT(dish_id) dish_count
  FROM categories_dishes
  GROUP BY dish_id
  HAVING COUNT(dish_id) > 1
)
SELECT dish.name dish_name, dishes_multiple_categories.dish_count 
FROM dishes_multiple_categories
JOIN dish
  ON dishes_multiple_categories.dish_id = dish.id;

-- Alternate query
SELECT d.name dish_name, COUNT(d.id) dish_count
FROM dish AS d
JOIN categories_dishes AS cd
  ON d.id = cd.dish_id
JOIN category AS c
  ON c.id = cd.category_id
GROUP BY d.id
HAVING COUNT(d.id) > 1;

/*
  Find the best rating along with review description
*/
SELECT rating best_rating, description
FROM review
ORDER BY rating DESC
LIMIT 1;

-- Alternate query
SELECT rating best_rating, description
FROM review
WHERE rating = (
  SELECT MAX(rating)
  FROM review
);
