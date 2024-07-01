# **Sales Report PT Kimia Farma**

## **Introduction**
Pengalaman Magang Virtual Big Data Analytics di Kimia Farma yang difasilitasi oleh [Rakamin Academy](https://www.rakamin.com/). Dalam program ini, sebagai Intern Analis Big Data dari Kimia Farma, saya belajar tentang **data warehouse**, **data lake**, dan **data mart**. Saya juga mengasah keterampilan saya dalam **SQL** dan cara memvisualisasikan data yang baik. Di akhir proyek, saya diminta untuk membuat tabel analisa dari dengan **BigQuery** membangun dashboard penjualan menggunakan **Looker Studio** dengan dataset kasus nyata dari Kimia Farma.

## Challenge
One of the main projects as a Big Data Analytics Intern at Kimia Farma is to evaluate Kimia Farma's business performance from 2020 to 2023. Here are the steps of the project:

### 1. Importing Dataset to PostgreSQL
**Dataset** <br>
The provided dataset consists of the following tables:
- kf_final_transaction
- kf_inventory
- kf_kantor_cabang
- kf_product
  
### 2. Make Analysis Table
Here are the columns contained in the table:
- transaction_id:transaction id code,
- date: transaction date,
- branch_id: Kimia Farma branch id code,
- branch_name: Kimia Farma branch name,
- kota: Kimia Farma branch city,
- provinsi: Kimia Farma branch province,
- rating_cabang: consumer ratings of Kimia Farma branches,
- customer_name: name of the customer who made a transaction,
- product_id: medicine product code,
- product_name: medicine name,
- actual_price: medicine price,
- discount_percentage:  percentage discount given on medicine,
- persentase_gross_laba: percentage of profit that should be  received from the medicine with some conditions, 
- nett_sales: the price after discount,
- nett_profit: profit earned by Kimia Farma,
- rating_transaksi: consumer rating of the transaction made.

<details>
  <summary> Click to View Query </summary>
    <br>
    
```sql
CREATE TABLE PBI_KF AS
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
  ON a.product_id = c.product_id;
```
<br>
</details>
<br>

## **Visualization**
[Lihat pada halaman Looker Data Studio](https://lookerstudio.google.com/reporting/58feb65d-29de-4c33-9c7d-7df3ced5b5e9).
<p align="center">
    <kbd> <img width="1000" alt="Kimia_Farma_page-0001" src="https://github.com/Ayyasy123/rakamin-kf-big-data-analylitcs/assets/53820239/d610b193-3e51-4332-bf11-5493523c389e"> </kbd> <br>
    Sales Report Dashboard PT. Kimia Farma
</p>
