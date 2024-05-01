WITH PersonVisitsCte AS(
	SELECT * FROM person_visits
	WHERE person_visits.person_id = 1 OR person_visits.person_id = 2
	)
	
SELECT Dates::date AS missing_date FROM
generate_series('2022/01/01'::date, '2022/01/10'::date, '1 day'::interval) AS Dates
LEFT JOIN PersonVisitsCte
ON Dates = PersonVisitsCte.visit_date 
WHERE person_id IS NULL
ORDER BY missing_date ASC;