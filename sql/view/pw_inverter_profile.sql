SELECT 
		ivt.*,
		rp.pv_seq, rp.connector_seq, rp.connector_ch,
		m.*
  FROM pw_inverter ivt
 LEFT OUTER JOIN pw_relation_power rp
  ON rp.inverter_seq = ivt.inverter_seq
 JOIN main m
  ON m.main_seq = rp.main_seq