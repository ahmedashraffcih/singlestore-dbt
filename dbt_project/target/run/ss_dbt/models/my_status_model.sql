
    create view `my_database`.`my_status_model__dbt_tmp` as
        WITH status_data AS (
    SELECT * FROM `my_database`.`status_table`
)
SELECT 
    id,
    status,
    created_at,
    updated_at
FROM status_data;