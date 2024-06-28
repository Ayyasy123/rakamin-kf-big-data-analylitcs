SELECT 
  a.transaction_id, 
  a.date, 
  a.branch_id, 
  b.branch_name, 
  b.kota, 
  b.provinsi, 
  b.rating AS rating_cabang, 
  a.customer_name, 
  a.product_id, 
  c.product_name, 
  a.price AS actual_price, 
  a.discount_percentage,
  CASE 
    WHEN a.price <= 50000 THEN 0.1
    WHEN a.price > 50000 AND a.price <= 100000 THEN 0.15
    WHEN a.price > 100000 AND a.price <= 300000 THEN 0.2
    WHEN a.price > 300000 AND a.price <= 500000 THEN 0.25
    WHEN a.price > 500000 THEN 0.3
  END AS persentase_gross_laba,
  a.price - (a.price * a.discount_percentage) AS nett_sales,
  (a.price - (a.price * a.discount_percentage)) * CASE 
    WHEN a.price <= 50000 THEN 0.1
    WHEN a.price > 50000 AND a.price <= 100000 THEN 0.15
    WHEN a.price > 100000 AND a.price <= 300000 THEN 0.2
    WHEN a.price > 300000 AND a.price <= 500000 THEN 0.25
    WHEN a.price > 500000 THEN 0.3
  END AS nett_profit,
  a.rating AS rating_transaksi
FROM `kimia_farma.kf_final_transaction` AS a
LEFT JOIN `kimia_farma.kf_kantor_cabang` AS b
  ON a.branch_id = b.branch_id
LEFT JOIN `kimia_farma.kf_product` AS c
  ON a.product_id = c.product_id
;
