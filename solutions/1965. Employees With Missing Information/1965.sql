SELECT COALESCE(e.employee_id, s.employee_id) AS employee_id
FROM employees e
         FULL OUTER JOIN salaries s
                         ON e.employee_id = s.employee_id
WHERE e.employee_id IS NULL
   OR s.employee_id IS NULL
ORDER BY employee_id