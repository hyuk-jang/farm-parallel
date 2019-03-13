SELECT
      r_dsd.num_data AS node_data,
      r_dsd.writedate,
      vdn.*
FROM v_dv_node vdn
LEFT OUTER JOIN 
 (
	SELECT 
				dsd.node_seq,
				dsd.num_data,
				dsd.writedate
	FROM dv_sensor_data dsd
	INNER JOIN
	 (
		SELECT MAX(sensor_data_seq) AS sensor_data_seq
		FROM dv_sensor_data
		GROUP BY node_seq
	 ) temp
	 ON dsd.sensor_data_seq = temp.sensor_data_seq
 ) r_dsd
 ON r_dsd.node_seq = vdn.node_seq
WHERE vdn.save_db_type = 'device' OR vdn.save_db_type = 'sensor'