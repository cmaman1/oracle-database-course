SELECT
    first_name
    || ' was hired on '
    || to_char(hire_date, 'Month Day,  YYYY') AS phrase
FROM
    employees;

SELECT
    first_name,
    trunc(months_between(sysdate, hire_date) / 12) "Years of Service"
FROM
    employees;

SELECT
    first_name,
    to_char(hire_date, 'Month') month_hired
FROM
    employees;

SELECT
    SYSTIMESTAMP
FROM
    DUAL;