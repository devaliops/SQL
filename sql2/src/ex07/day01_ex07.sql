SELECT order_date, (name || '(age:' || age || ')') AS person_information
FROM person_order JOIN person ON person_order.person_id = person.id
ORDER BY person_order ASC, person_information ASC;