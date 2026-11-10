SELECT e.employee_id, e.name, fe.reports_count, fe.average_age
FROM Employees e
         JOIN (SELECT reports_to,
                      COUNT(*)        AS reports_count,
                      ROUND(AVG(age)) AS average_age
               FROM Employees
               WHERE reports_to IS NOT NULL
               GROUP BY reports_to) fe
              ON e.employee_id = fe.reports_to
ORDER BY e.employee_id