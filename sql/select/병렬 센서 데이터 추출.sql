


SELECT
      STRAIGHT_JOIN *
FROM 
  (
    SELECT DISTINCT DATE_FORMAT(writedate,"%Y-%m-%d %H-%i") AS default_group_date
    FROM v_dv_sensor_data 
  ) AS main
JOIN
  (
    SELECT 
            ROUND(AVG(num_data), 1) AS avg_num_temp,
            DATE_FORMAT(writedate,"%Y-%m-%d %H-%i") AS group_date
    FROM dv_sensor_data
    WHERE node_seq = 1
    GROUP BY DATE_FORMAT(writedate,"%Y-%m-%d %H-%i")
  ) AS group_1
 ON group_1.group_date = main.default_group_date
LEFT JOIN
  (
    SELECT 
            ROUND(AVG(num_data), 1) AS avg_num_2,
            DATE_FORMAT(writedate,"%Y-%m-%d %H-%i") AS group_date
    FROM dv_sensor_data
    WHERE node_seq = 2
    GROUP BY DATE_FORMAT(writedate,"%Y-%m-%d %H-%i")
  ) AS group_2
 ON group_2.group_date = main.default_group_date
 LEFT JOIN
  (
    SELECT 
            ROUND(AVG(num_data), 1) AS avg_num_3,
            DATE_FORMAT(writedate,"%Y-%m-%d %H-%i") AS group_date
    FROM dv_sensor_data
    WHERE node_seq = 3
    GROUP BY DATE_FORMAT(writedate,"%Y-%m-%d %H-%i")
  ) AS group_3
 ON group_3.group_date = main.default_group_date