SELECT
  pv.*,
  rp.connector_ch, rp.place_seq,
  curr_data.amp, curr_data.vol, curr_data.writedate
FROM
  pw_pv pv
JOIN pw_relation_power rp
  ON rp.pv_seq = pv.pv_seq
LEFT JOIN dv_place dp
  ON dp.place_seq = rp.place_seq
LEFT OUTER JOIN
  (
  SELECT
    md.pv_seq,
    md.amp,
    md.vol,
    md.writedate
  FROM pw_module_data md
  INNER JOIN
    (
    SELECT MAX(module_data_seq) AS module_data_seq
    FROM pw_module_data
    GROUP BY pv_seq
    ) b
    ON md.module_data_seq = b.module_data_seq
  ) curr_data
  ON curr_data.pv_seq = pv.pv_seq
ORDER BY pv.chart_sort_rank