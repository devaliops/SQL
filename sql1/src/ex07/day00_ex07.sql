SELECT id, name,  
    (CASE 
    WHEN age >= 10 and age <= 2 then 'interval #1'
    WHEN age > 20 and age < 24 then 'interval #2'
    ELSE 'interval #3'
    END) AS interval_info
FROM person
ORDER BY interval_info ASC