SELECT 
	rp.place_seq,
	id.*,
	ROUND((power_cp_kwh - (SELECT MIN(power_cp_kwh) FROM pw_inverter_data WHERE inverter_seq = id.inverter_seq AND writedate>= CURDATE())), 1) AS daily_power_kwh,
	pv.amount AS pv_amount, pv.compose_count, pv.install_place AS install_place
	FROM pw_inverter_data id
	LEFT JOIN pw_inverter
		ON pw_inverter.inverter_seq = id.inverter_seq
	LEFT JOIN pw_relation_power rp
		ON rp.inverter_seq = id.inverter_seq
	LEFT JOIN pw_photovoltaic pv
		ON pv.photovoltaic_seq = rp.photovoltaic_seq
		
		
	WHERE inverter_data_seq IN (
		SELECT MAX(inverter_data_seq)
		FROM pw_inverter_data
    WHERE power_cp_kwh IS NOT NULL
		GROUP BY inverter_seq
	)
	ORDER BY pw_inverter.chart_sort_rank