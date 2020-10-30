SELECT
    first_name
    || ' '
    || last_name name,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            AVG(salary)
        FROM
            employees
    );

SELECT
    first_name
    || ' '
    || last_name name,
    hire_date
FROM
    employees
WHERE
    hire_date = (
        SELECT
            MAX(hire_date)
        FROM
            employees
    );

SELECT
    e.department_id,
    e.first_name
    || ' '
    || e.last_name name,
    j.job_title,
    e.salary
FROM
    employees   e,
    jobs        j
WHERE
    e.job_id = j.job_id
    AND salary IN (
        SELECT
            MAX(salary)
        FROM
            employees
        WHERE
            job_id NOT LIKE '%PRES%'
        GROUP BY
            department_id
    );

SELECT
    e.first_name
    || ' '
    || e.last_name name,
    --j.job_title,
    e.job_id,
    e.salary
FROM
    employees e --, jobs j
WHERE
    --j.job_id = e.job_id AND
    ( e.job_id,
      e.salary ) IN (
        SELECT
            j.job_id,
            e.salary
        FROM
            employees   e,
            jobs        j
        WHERE
            j.job_id = e.job_id
            AND e.department_id = 20
    );

--INLINE VIEWS EXAMPLE

SELECT
    b.department_id,
    a.first_name
    || ' '
    || a.last_name name,
    a.salary
FROM
    employees a,
    (
        SELECT
            department_id,
            AVG(salary) avg_sal
        FROM
            employees
        GROUP BY
            department_id
    ) b
WHERE
    a.department_id = b.department_id
    AND a.salary < b.avg_sal;

SELECT
    name,
    salary
FROM
    (
        SELECT
            e.first_name
            || ' '
            || e.last_name name,
            e.salary
        FROM
            employees   e,
            jobs        j
        WHERE
            upper(j.job_title) NOT IN (
                'SALEMAN',
                'PRESIDENT'
            )
            AND e.job_id = j.job_id
        ORDER BY
            e.salary DESC
    )
WHERE
    ROWNUM < 4;