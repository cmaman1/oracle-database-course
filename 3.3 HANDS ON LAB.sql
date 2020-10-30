/*
    EJERCICIO 1. LIST THE EMPLOYEE NUMEBR, NAME, JOB TITLE AND HIRE DATE OF EMPLOYEES IN DEPARTMENT 10.
*/
SELECT
    a.employee_id,
    a.first_name
    || ' '
    || a.last_name AS name,
    a.hire_date,
    b.job_title
FROM
    employees   a,
    jobs        b
WHERE
    a.department_id = 10
    AND a.job_id = b.job_id;

/*
    EJERCICIO 2. SELECT THE NAME AND SALARY OF ALL EMPLOYEES WHO ARE CLERKS
*/

SELECT
    a.first_name
    || ' '
    || a.last_name AS name,
    a.salary,
    b.job_title
FROM
    employees   a,
    jobs        b
WHERE
    b.job_title LIKE '%Clerk%'
    AND a.job_id = b.job_id;

/*
    EJERCICIO 3. LIST THE NAME, JOB TITLE AND SALARY OF EVERYONE WHO WAS HIRED ON DECEMBER 17, 1980.
*/

SELECT
    a.first_name
    || ' '
    || a.last_name AS name,
    b.job_title,
    a.salary
FROM
    employees   a,
    jobs        b
WHERE
    hire_date > TO_DATE('17/12/1980', 'DD/MM/YYYY')
    AND a.job_id = b.job_id;

/*
    EJERCICIO 4. LIST THE DEPARTMENT NAME AND NUMBER FOR DEPARTMENT NUMBERS GREATER THAN OF EQUAL TO 20.
*/

SELECT
    department_name,
    department_id
FROM
    departments
WHERE
    department_id >= 20;

/*
    EJERCICIO 5. SELECT THE NAME, SALARY AND COMMISSION OF EMPLOYEES WHOSE COMMISION IS GREATER THAN THEIR SALARY
*/

SELECT
    first_name
    || ' '
    || last_name AS name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > salary;

/*
    EJERCICIO 6. LIST THE NAME, JOB AND SALARY OF EMPLOYEES WHO WORK IN DEPARTMENT 20 AND WHO EARN MORE THAN 2K.
*/

SELECT
    a.first_name
    || ' '
    || a.last_name AS name,
    b.job_title,
    a.salary
FROM
    employees   a,
    jobs        b
WHERE
    a.department_id = 20
    AND a.salary > 2000
    AND a.job_id = b.job_id;
    

/*
    EJERCICIO 7. SELECT THE MANAGERS AND PRESIDENT FROM THE EMPLOYEE TABLE
*/

SELECT
    *
FROM
    employees   a,
    jobs        b
WHERE
    upper(b.job_title) LIKE upper('%Manager%')
    OR upper(b.job_title) LIKE upper('President%')
    AND a.job_id = b.job_id;
    

/*
    EJERCICIO 8. LIST THE NAME, SALARY, COMMISION, JOB AND DEPARTMENT NUMBER OF THE MANAGERS WHO DO NOT WORK IN DEPARTMENT 30.
*/

SELECT
    a.first_name
    || ' '
    || a.last_name AS name,
    b.job_title,
    a.salary,
    a.department_id
FROM
    employees   a,
    jobs        b
WHERE
    a.department_id <> 30
    AND job_title LIKE '%Manager%';
    

/*
    EJERCICIO 9. list the employee names that contain an 'S'.
*/

SELECT
    *
FROM
    (
        SELECT
            first_name
            || ' '
            || last_name AS name
        FROM
            employees
    )
WHERE
    name LIKE '%s%';

/*
    EJERCICIO 10. LIST THE EMPLOYEE NAMES THAT HAVE 'LL' IN THE THIRD AND FOURTH POSITIONS.
*/

SELECT
    *
FROM
    (
        SELECT
            first_name
            || ' '
            || last_name AS name
        FROM
            employees
    )
WHERE
    name LIKE '___ll%';