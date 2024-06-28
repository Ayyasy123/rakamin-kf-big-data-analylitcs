# **Sales Report PT Kimia Farma**

## **Introduction**
A **Virtual Internship Experience Big Data Analytics in Kimia Farma** facilitated by [Rakamin Academy](https://www.rakamin.com/). In this project, as a **Big Data Analyst Intern** from **Kimia Farma** I learned about **data warehouse**, **data lake**, and **data mart**. I also sharpening my skill in **SQL**. At the end of the project, I asked to build a **sales dashboard** using **Google Data Studio** with the following **real case dataset** from **Kimia Farma**.

Pengalaman Magang Virtual Big Data Analytics di Kimia Farma yang difasilitasi oleh [Rakamin Academy](https://www.rakamin.com/). Dalam program ini, sebagai Intern Analis Big Data dari Kimia Farma, saya belajar tentang **data warehouse**, **data lake**, dan **data mart**. Saya juga mengasah keterampilan saya dalam **SQL** dan cara memvisualisasikan data yang baik. Di akhir proyek, saya diminta untuk membuat tabel analisa dari dengan **BigQuery** membangun dashboard penjualan menggunakan **Looker Studio** dengan dataset kasus nyata dari Kimia Farma.

## **Objective**
1. Importing Dataset to BigQuery
2. Buat tabel analisa
3. Create Dashboard Performance Analytics Kimia FarmaBusiness Year 2020-2023

## **Created Data Mart**
1. Firstly, I queried the **3 dataset** to be 1 table as **base table** and determine the **primary key** by concatenate the `id_invoice` and `id_barang`. 
2. After created base table, I create the **aggregate table** which sum of the `jumlah_barang` multiple `harga`. Exported the **aggregate table** to **CSV** for data source in **Google Data Studio**.

## **Visualization**
Lastly, I built a dashboard using data source from aggregate table in Google Data Studio. You can check and using it as you need [here](https://datastudio.google.com/reporting/7613d646-8f1b-479d-b69b-a60ef1236936).
   <p align="center">
    <img width="958" alt="Screen Shot 2022-08-02 at 17 14 27" src="https://user-images.githubusercontent.com/103989278/182351168-cad7aac5-3a70-42d7-b05e-b0d09e73bcf2.png"><br>
    Figure 1: Sales Reports PT Kimia Farma 
   </p>
