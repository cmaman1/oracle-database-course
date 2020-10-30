CREATE INDEX emp_hiredate ON
    employees (
        hire_date
    );

SELECT
    index_name,
    table_name,
    column_name
FROM
    user_ind_columns
ORDER BY
    index_name,
    table_name,
    column_position;

SELECT
    *
FROM
    TABLE ( dbms_xplan.display_cursor(sql_id => '0p7bzjd5cgqh3', format => 'ALLSTATS LAST') );

SELECT
    *
FROM
    user_ind_columns;