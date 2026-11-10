WITH filtered_employee AS (SELECT *,
                                  ROUND(AVG(age) OVER (PARTITION BY reports_to)) AS average_age,
                                  COUNT(reports_to)                                 OVER(PARTITION BY reports_to) AS reports_count
                           FROM Employees
                           WHERE reports_to IS NOT NULL)

SELECT DISTINCT e.employee_id, e.name, fe.reports_count, fe.average_age
FROM Employees e
         INNER JOIN filtered_employee fe
                    ON e.employee_id = fe.reports_to
ORDER BY e.employee_id
;