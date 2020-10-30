/*
    EJERCICIO 1. create a table CALLED EMP10 THAT HAS EMPNO, ENAME, job, MGR, HIRE_DATE and SALARY for just THE EMPLOYEES in DEPARTMENT10. create THE SAME tables FOR DEPARTMENTS 20 AND 30.
*/
CREATE TABLE emp10
    AS
        SELECT
            e.employee_id empno,
            e.first_name
            || ' '
            || e.last_name ename,
            j.job_title,
            m.mgr,
            e.hire_date,
            e.salary
        FROM
            employees   e,
            jobs        j,
            (
                SELECT
                    employee_id,
                    first_name
                    || ' '
                    || last_name mgr
                FROM
                    employees
            ) m
        WHERE
            e.job_id = j.job_id
            AND e.manager_id = m.employee_id (+)
            AND e.department_id = 10
        ORDER BY
            empno ASC;

CREATE TABLE emp20
    AS
        SELECT
            e.employee_id empno,
            e.first_name
            || ' '
            || e.last_name ename,
            j.job_title,
            m.mgr,
            e.hire_date,
            e.salary
        FROM
            employees   e,
            jobs        j,
            (
                SELECT
                    employee_id,
                    first_name
                    || ' '
                    || last_name mgr
                FROM
                    employees
            ) m
        WHERE
            e.job_id = j.job_id
            AND e.manager_id = m.employee_id (+)
            AND e.department_id = 20
        ORDER BY
            empno

asc;

CREATE TABLE emp30
    AS
        SELECT
            e.employee_id empno,
            e.first_name
            || ' '
            || e.last_name ename,
            j.job_title,
            m.mgr,
            e.hire_date,
            e.salary
        FROM
            employees   e,
            jobs        j,
            (
                SELECT
                    employee_id,
                    first_name
                    || ' '
                    || last_name mgr
                FROM
                    employees
            ) m
        WHERE
            e.job_id = j.job_id
            AND e.manager_id = m.employee_id (+)
            AND e.department_id = 30
        ORDER BY
            empno

asc;

-- ESTO LO USE PARA CONTAR LOS EMPLEADOS POR DEPARTAMENTO.

SELECT DISTINCT
    ( department_id ) dept,
    COUNT(*) sum
FROM
    employees
WHERE
    department_id <= 30
GROUP BY
    department_id;

--PARA VER LAS TABLAS

SELECT
    *
FROM
    emp10;

SELECT
    *
FROM
    emp20;

SELECT
    *
FROM
    emp30;

/*
    EJERCICIO 2. DELETE FROM EMP10 ANY EMPLOYEE WHO DOES NOT HAVE A MANAGER.
*/

DELETE FROM emp10
WHERE
    mgr IS NULL;

/*
    EJERCICIO 3. UPDATE EMP10, GIVE EVERYONE A 10% INCREASE IN SALARY. CHECK YOUR WORK!
*/

UPDATE emp10
SET
    salary = salary * 1.1;

/*
    EJERCICIO 4. INSERT YOURSELF INTO EMP10.
    DATE FORMAT: 'DD-MON-YY' IN SINGLE QUOTES OR JUST USE THE PSEUDOCOLUMN FOR TODAYS DATE: SYSDATE --- FOR THE HIREDATE FIELD.
*/

INSERT INTO emp10 VALUES (
    300,
    'Carolina Mamani',
    'Programmer',
    NULL,
    to_date(sysdate, 'DD-MON-YY'),
    21000
);

/*
    EJERCICIO 5. DROP THE EMP20 TABLE (EMP30 IS USED IN THE NEXT LESSON). PURGE THE RECYCLE BIN IF YOU DIDN'T DO IT WHILE DROPPING THE TABLE!
*/

drop table emp20;
purge recyclebin;
select * from tab;