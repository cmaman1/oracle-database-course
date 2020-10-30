/*
    EJERCICIO 1. WHICH EMPLOYEES EARN LESS THAN 30% OF THE PRESIDENT'S SALARY?
*/
SELECT
    first_name
    || ' '
    || last_name name,
    salary
FROM
    employees
WHERE
    salary < (
        SELECT
            e.salary
        FROM
            employees   e,
            jobs        j
        WHERE
            e.job_id = j.job_id
            AND upper(j.job_title) LIKE upper('President')
    ) * 0.3;

/*
    EJERCICIO 2. WHO WAS THE LAST EMPLOYEE TO BE HIRED IN EACH DEPARTMENT?
*/

SELECT
    d.department_name,
    e.first_name
    || ' '
    || e.last_name name,
    e.hire_date
FROM
    employees     e,
    departments   d,
    (
        SELECT
            department_id,
            MAX(hire_date) last_hired
        FROM
            employees
        GROUP BY
            department_id
    ) h
WHERE
    d.department_id = e.department_id
    AND d.department_id = h.department_id
    AND e.hire_date = h.last_hired
ORDER BY
    department_name ASC,
    hire_date DESC;

/*
    EJERCICIO 3. USING THE EMP TABLE, CREATE A LIST OF NAMES, JOB TITLES, AND SALARIES OF THE TOP FOUR SALARY EARNERS IN THE COMPANY.
    3.A. MODIFY YOU QUERY SO THAT THE PRESIDENT AND SALESMEN ARE NOT PART OF THE COMPARISON.
*/

SELECT
    name,
    job_title,
    salary
FROM
    (
        SELECT
            e.first_name
            || ' '
            || e.last_name name,
            e.salary,
            j.job_title
        FROM
            employees   e,
            jobs        j
        WHERE
            e.job_id = j.job_id
        ORDER BY
            e.salary DESC
    )
WHERE
    ROWNUM <= 4;

/*
    EJERCICIO 4. COMPUTE THE AVERAGE, MINIMUN, AND MAXIMUM SALARIES OF THE CLERKS AND MANAGERS.
*/

SELECT
    job_title,
    AVG(salary),
    MIN(salary),
    MAX(salary)
FROM
    (
        SELECT
            e.salary,
            j.job_title
        FROM
            employees   e,
            jobs        j
        WHERE
            e.job_id = j.job_id
    )
WHERE
    job_title LIKE ( '%Manager%' )
    OR job_title LIKE ( '%Clerk%' )
GROUP BY
    job_title;

/*
    EJERCICIO 5. WHO HAS THE LONGEST NAME?
*/

SELECT
    *
FROM
    (
        SELECT
            name,
            length(name)
        FROM
            (
                SELECT
                    first_name
                    || ' '
                    || last_name name
                FROM
                    employees
            )
        ORDER BY
            2 DESC
    )
WHERE
    ROWNUM = 1;