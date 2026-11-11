SELECT DISTINCT ON (employee_id) employee_id, department_id
FROM Employee
ORDER BY employee_id, primary_flag desc;


WITH employee_departments AS (SELECT *,
                                     COUNT(*) OVER (PARTITION BY employee_id) AS department_count
                              FROM Employee)

SELECT employee_id, department_id
FROM employee_departments
WHERE primary_flag = 'Y'
   OR department_count = 1