# 🛒 Olist E-Commerce Analytics | SQL + Power BI

End-to-end e-commerce data analysis using **MySQL, Power BI, and DAX** to explore sales performance, customer behavior, payments, and delivery trends.

## 📊 Dashboard Previews

### 📈 Sales Overview

![Olist Sales Overview](olist%20Sales%20Overview.png)

### 📦 Orders & Customers

![Olist Orders & Customers](Olist%20Orders%20%26%20Customers%20.png)

## 📌 Project Overview

* 🛍️ ~99K Orders
* 👥 96K Unique Customers
* 📦 33K Products
* 🗃️ 9 Relational Tables
* 💻 49 SQL Queries
* 🔗 Power BI connected to MySQL using Import mode

**Tools:** MySQL | Power BI | DAX | GitHub

---

## 🎯 Business Problem

The Olist Brazilian E-Commerce dataset contains information about orders, customers, products, payments, reviews, sellers, and deliveries.

The goal was to analyze business performance and uncover actionable insights from this data.

## 🎯 Project Objectives

* Analyze sales and order trends over time.
* Identify top-performing products and customer locations.
* Understand customer purchasing behavior.
* Explore payment methods and their contribution to payment value.
* Evaluate delivery performance and customer reviews.
* Identify trends that can support business decisions.

## 📥 Download the Power BI Dashboard

The interactive Power BI file (~60 MB) is available in the **[GitHub Releases](https://github.com/Ganesh123-DA/olist-ecommerce-sql-powerbi-analysis/releases/tag/v1.0)** section.

**How to open:**

1. Download `Olist.Ecommerce.Sales.Dashboard.pbix`.
2. Open it using Power BI Desktop.
3. The data is stored inside the file using Import mode, so a separate database connection is not required to view the report.

## 🗃️ Dataset

The project uses 9 relational tables covering:

* Customers and orders
* Order items and products
* Sellers and payments
* Reviews and geolocation
* Product category translations

## 🧹 Data Preparation

* Converted text dates into proper `DATETIME` values.
* Handled missing delivery dates.
* Used `customer_unique_id` for customer-level analysis.
* Translated product categories.
* Excluded incomplete months from relevant trend analysis.

## 🧮 SQL Analysis

Created **49 SQL queries** covering:

* Basic queries and aggregations
* Joins
* Subqueries
* Window functions
* Common Table Expressions (CTEs)
* Views
* Stored procedures

## 🔍 Key Business Insights

* ⭐ Late deliveries: **2.57 average review score**, compared with **4.29** for on-time deliveries.
* 🔁 Repeat customers: **3.12%**.
* 📍 São Paulo: approximately **5.2M BRL** in product sales.
* 💳 Credit cards: approximately **78% of payment value**.
* 🚚 Delivered orders: **97.78%**.
* ⏱️ Average delivery time: **12.5 days**.
* 📈 Peak monthly sales: approximately **1.01M BRL** in November 2017.

*Insights are based on the project's SQL analysis and dashboard calculations.*

## 🧠 Skills Demonstrated

* **SQL:** Joins, aggregations, CTEs, subqueries, window functions, views, and stored procedures.
* **Power BI:** Dashboard development, data visualization, and report design.
* **DAX:** Measures and business KPI calculations.
* **Data Preparation:** Cleaning, date handling, and relational data analysis.
* **Business Analysis:** Sales trends, customer behavior, payment analysis, and delivery performance.
* **GitHub:** Project documentation and version control.

## 🛠️ Technologies

`MySQL` `Power BI` `DAX` `GitHub`

---

**Project Focus:** Turning e-commerce data into meaningful business insights through SQL analysis and interactive Power BI dashboards.
