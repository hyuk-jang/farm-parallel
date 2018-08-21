SELECT ivt.*, 
	inverter_data_seq,
	rp.place_seq,
	in_a,
	in_v,
	in_w,
	out_a,
	out_v,
	out_w,
	p_f,
	d_wh,
	c_wh,
	(c_wh - (SELECT MAX(c_wh) FROM pw_inverter_data WHERE inverter_seq = id.inverter_seq AND writedate>= CURDATE() - 1 AND writedate< CURDATE())) AS daily_power_wh,
	writedate,
	pv.amount AS pv_amount
	FROM pw_inverter_data id
	LEFT JOIN pw_inverter ivt
		ON ivt.inverter_seq = id.inverter_seq
	LEFT JOIN pw_relation_power rp
		ON rp.inverter_seq = id.inverter_seq
	LEFT JOIN pw_photovoltaic pv
		ON pv.photovoltaic_seq = rp.photovoltaic_seq
		
	WHERE inverter_data_seq IN (
		SELECT MAX(inverter_data_seq)
		FROM pw_inverter_data
		GROUP BY inverter_seq
	)
	ORDER BY chart_sort_rank