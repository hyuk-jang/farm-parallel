SELECT
  pv.*,
  curr_data.amp, curr_data.vol, curr_data.writedate
FROM
  pw_pv pv
LEFT OUTER JOIN
  (
  SELECT
    md.pv_seq,
    md.amp,
    md.vol,
    md.writedate
  FROM pw_pv_data md
  INNER JOIN
    (
    SELECT MAX(pv_data_seq) AS pv_data_seq
    FROM pw_pv_data
    GROUP BY pv_seq
    ) b
    ON md.pv_data_seq = b.pv_data_seq
  ) curr_data
  ON curr_data.pv_seq = pv.pv_seq
ORDER BY pv.chart_sort_rank