SELECT 
	pw_inverter.place_seq, pw_inverter.target_id, pw_inverter.target_name, pw_inverter.amount, pw_inverter.chart_color, pw_inverter.chart_sort_rank,
	id.*,
	ROUND((power_cp_kwh - (SELECT MAX(power_cp_kwh) FROM pw_inverter_data WHERE inverter_seq = id.inverter_seq AND writedate>= CURDATE() - 1 AND writedate< CURDATE())), 1) AS daily_power_kwh
	FROM pw_inverter_data id
	LEFT JOIN pw_inverter
		ON pw_inverter.inverter_seq = id.inverter_seq
		
		
	WHERE inverter_data_seq IN (
		SELECT MAX(inverter_data_seq)
		FROM pw_inverter_data
		GROUP BY inverter_seq
	)
	ORDER BY pw_inverter.chart_sort_rank