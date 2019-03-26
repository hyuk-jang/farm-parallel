SELECT
      calc_data_tbl.solar,
      calc_data_tbl.writedate,
      sen_tbl.*
FROM solar sen_tbl
LEFT OUTER JOIN 
 (
	SELECT 
				sen_data_tbl.solar_seq,
				sen_data_tbl.solar,
				sen_data_tbl.writedate
	FROM solar_data sen_data_tbl
	INNER JOIN
	 (
		SELECT MAX(solar_data_seq) AS solar_data_seq
		FROM solar_data
		GROUP BY solar_seq
	 ) temp
	 ON sen_data_tbl.solar_data_seq = temp.solar_data_seq
 ) calc_data_tbl
 ON calc_data_tbl.solar_seq = sen_tbl.solar_seq