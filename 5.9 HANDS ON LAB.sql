/*
    EJERCICIO 1. HOW MANY EMPLOYEES WORK IN NEW YORK?  
*/
SELECT
    COUNT(*)
FROM
    employees     e,
    departments   d,
    locations     l
WHERE
    e.department_id = d.department_id
    AND l.location_id = d.location_id
    AND upper(l.city) = upper('london');


/*
    EJERCICIO 2. LIST THE DEPARTMENT NUMBER, LOCATION AND NUMBER OF EMPLOYEES FOR EVERY LOCATION.
*/

SELECT
    e.department_id,
    COUNT(*)
FROM
    employees     e,
    departments   d
WHERE
    e.department_id = d.department_id
GROUP BY
    e.department_id;

SELECT
    department_id,
    COUNT(*)
FROM
    employees
GROUP BY
    department_id;


/*
    EJERCICIO 3. LIST THE EMPLOYEES, HIRE DATES AND SALARIES. DISPLAY THE DATE WITH THE MONTH SPELLED OUT AND A 4-POSITION YEAR; I.E., JANUARY 1, 2004.
*/

SELECT
    first_name
    || ' '
    || last_name name,
    to_char(hire_date, 'Month DD, YYYY') hire_date,
    salary
FROM
    employees;


/*
    EJERCICIO 4. MAKE A LIST OF EMPLOYEES, SALARIES, SALARIES + 10%, HIRE DATE, AND NEXT REVIEW DATE (HIRE DATE + 6 MONTHS).
*/

SELECT
    first_name
    || ' '
    || last_name name,
    salary,
    salary * 1.1 new_salary,
    hire_date,
    add_months(hire_date, 6) review_date
FROM
    employees;


/*
    EJERCICIO 5. CREATE A LIST OF THE AVERAGE AND MAXIMUM SALARIES BY DEPARTMENT WHERE THE DEPARTMENTS HAVE MORE THAT 2 EMPLOYEES.
*/

SELECT
    d.department_name,
    round(AVG(e.salary)) sueldo_promedio,
    round(MAX(e.salary)) sueldo_maximo
FROM
    employees     e,
    departments   d
GROUP BY
    d.department_name;


/*
    EJERCICIO 6. CREATE A LIST OF EMPLOYEES (INITIAL CAPITALIZATION PLEASE), SALARIES AND PROJECTED SALARY BASED ON THIS SCHEDULE:
    - DEPT10 GETS 10% INCREASE
    - DEPT20 GETS 20% INCREASE
    - EVERYONE ELSE GETS A 15% INCREASE
*/

SELECT
    initcap(first_name
            || ' '
            || last_name) name,
    salary,
    --department_id,
    CASE department_id
        WHEN 10   THEN
            salary * 1.10
        WHEN 20   THEN
            salary * 1.20
        ELSE
            salary * 1.15
    END projected_salary
FROM
    employees;