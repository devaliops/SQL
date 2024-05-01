WITH Not0rderedIdxCte AS(
	SELECT id AS menu_id FROM menu
	WHERE id NOT IN (SELECT menu_id FROM person_order)
	ORDER BY menu_id
)

SELECT 
	menu.pizza_name AS pizza_name,
	menu.price AS price,
	pizzeria.name AS pizzeria_name
FROM Not0rderedIdxCte
	LEFT JOIN menu ON menu.id = Not0rderedIdxCte.menu_id
	LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;