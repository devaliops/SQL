SELECT id AS idd FROM menu
WHERE id NOT IN (SELECT menu_id FROM person_order)
ORDER BY idd;