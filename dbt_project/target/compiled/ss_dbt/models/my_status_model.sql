WITH status_data AS (
    SELECT * FROM `my_database`.`status_table`
)
SELECT 
    id,
    status,
    created_at,
    updated_at
FROM status_data;