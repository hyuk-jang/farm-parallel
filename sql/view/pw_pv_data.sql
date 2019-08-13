	SELECT
		md.pv_seq,
		writedate,
		ROUND(AVG(amp), 1) AS avg_amp,
		ROUND(AVG(vol), 1) AS avg_vol,
		DATE_FORMAT(writedate,"%H-%i") AS hour_time
  FROM pw_pv_data md
  GROUP BY DATE_FORMAT(writedate,'%Y-%m-%d %H-%i'), pv_seq
  ORDER BY writedate DESC, pv_seq