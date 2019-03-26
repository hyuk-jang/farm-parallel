

SELECT
			nd.node_def_seq,
			nc.node_class_seq,
      nc.data_unit, nc.save_db_type, nc.is_sensor, nd.is_avg_center,
			nd.target_id AS nd_target_id,
			nd.target_name AS nd_target_name,
			nd.target_prefix AS nd_target_prefix,
			nd.description AS nd_description,
			nc.target_id AS nc_target_id, 
			nc.target_name AS nc_target_name,
			nc.description AS nc_description
  FROM dv_node_def nd
 JOIN dv_node_class nc
  ON nc.node_class_seq = nd.node_class_seq
 