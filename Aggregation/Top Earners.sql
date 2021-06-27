SELECT      
    (salary * months) AS earnings,
    COUNT(*) AS total_count
FROM EMPLOYEE
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;