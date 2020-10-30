SELECT
    table_name
FROM
    all_tables;
  
CREATE TABLE employees_copy
    AS
        SELECT  
            *
        FROM
            employees;

SET AUTOCOMMIT OFF;

DELETE FROM employees_copy;

INSERT INTO employees_copy
    ( SELECT
        *
    FROM
        employees
    );

CREATE TABLE emp
    AS
        SELECT
            e.employee_id,
            e.first_name
            || ' '
            || e.last_name name,
            e.hire_date,
            j.job_id,
            j.job_title,
            d.department_id,
            d.department_name,
            m.manager_id,
            m.manager_name,
            m.manager_title
        FROM
            employees    e,
            jobs         j,
            departments   d,
            (
                SELECT
                    e.employee_id manager_id,
                    e.first_name
                    || ' '
                    || e.last_name manager_name,
                    j.job_id,
                    j.job_title manager_title
                FROM
                    employees   e,
                    jobs        j
                WHERE
                    e.job_id = j.job_id
                    AND j.job_title LIKE ( '%Manager%' )
            ) m
        WHERE
            e.job_id = j.job_id
            AND e.department_id = d.department_id (+)
            AND e.manager_id = m.manager_id (+)
        ORDER BY e.employee_id asc;
            
            
            DROP TABLE EMP;
             DROP TABLE EMPLOYEES_COPY;
           
            SELECT * FROM EMP;
            
            select * from employees;
            
            select * from tab;
            
            FLASHBACK TABLE HR.EMP TO BEFORE DROP;
            
            PURGE RECYCLEBIN;