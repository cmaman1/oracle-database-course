/*
    EJERCICIO 1. WHAT ARE THE NAMES AND EMPLOYEE NUMBERS OF THE MANAGERS WHO MAKE MORE THAN 2600.  
*/
SELECT
    e.first_name
    || ' '
    || e.last_name AS name,
    e.employee_id
FROM
    employees   e,
    jobs        j
WHERE
    e.job_id = j.job_id
    AND j.job_title LIKE '%Manager%'
    AND e.salary > 2600;

/*
    EJERCICIO 2. LIST THE EMPLOYEES' NAMES AND THE CITIES IN WICH THEY WORK. PUT THE LIST IN CITY (DEPT LOC) THEN NAME ORDER.
*/

SELECT
    e.first_name
    || ' '
    || e.last_name AS name,
    l.city AS department_location
FROM
    employees     e,
    departments   d,
    locations     l
WHERE
    e.department_id = d.department_id
    AND d.location_id = l.location_id
ORDER BY
    l.city,
    name;

/*
    EJERCICIO 3. LIST THE NAME AND SALARY OF EMPLOYEES WHO EARN MORE THAN THEIR MANAGER.
*/

SELECT
    emp.first_name
    || ' '
    || emp.last_name AS name,
    emp.salary
FROM
    employees   emp,
    employees   mngr
WHERE
    emp.manager_id = mngr.employee_id
    AND emp.salary > mngr.salary;

/*
    EJERCICIO 4. LIST THE DEPARTMENT NUMBER, LOCATION AND EMPLOYEE NAME FOR EVERY LOCATION.
*/

SELECT
    d.department_id,
    l.city,
    e.first_name
    || ' '
    || e.last_name AS name
FROM
    employees     e,
    departments   d,
    locations     l
WHERE
    e.department_id (+) = d.department_id
    AND d.location_id = l.location_id;

/*
    EJERCICIO 5. IN 3 SEPARATE SQL STATEMENTS, LIST THE NAMES, JOBS AND SALARIES:
        A: IN ASCENDING DEPARTMENT ORDER
        B: IN THE ORDER IN WHICH THAY WERE HIRED
        C: IN JOB ASCENDING THEN BY SAL DESCENDING. I WANT TO SEE THE HOB THEN THE HIGHEST PAID FOR THAT JOB, NEXT AND SO ON.
*/

-- A

SELECT
    e.*,
    j.job_title
FROM
    employees   e,
    jobs        j
WHERE
    e.job_id = j.job_id
ORDER BY
    e.department_id ASC;

-- B

SELECT
    *
FROM
    employees
ORDER BY
    hire_date DESC;
    

-- C

SELECT
    j.job_title,
    e.salary,
    e.first_name
    || ' '
    || e.last_name AS name
FROM
    employees   e,
    jobs        j
WHERE
    e.job_id = j.job_id
ORDER BY
    j.job_title ASC,
    e.salary DESC;

/*
    EJERCICIO 6. LIST THE NAME AND JOB OF THE EMPLOYEES WHO MAKE LESS THAN $2000.
*/

SELECT
    e.first_name
    || ' '
    || e.last_name AS name,
    j.job_title
FROM
    employees   e,
    jobs        j
WHERE
    e.job_id = j.job_id
    AND e.salary < 2000;