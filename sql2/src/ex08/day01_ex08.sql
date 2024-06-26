SELECT order_date, (name || '(age:' || age || ')') AS person_information
FROM person_order AS person_order(idx, id, menu_id, order_date) NATURAL JOIN person
ORDER BY person_order ASC, person_information ASC; 