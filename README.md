# olist-ecommerce-sql-powerbi-analysis
End-to-end e-commerce data analysis using SQL and Power BI on the Olist Brazilian dataset
## 📊 Power BI Dashboard

![Olist E-Commerce Dashboard](dashboard_screenshot.png)

# Olist E-Commerce Analytics: SQL + Power BI

## 📌 Project Overview

End-to-end analysis of the Olist Brazilian E-Commerce dataset using **MySQL and Power BI**.

- ~99K Orders
- 96K Unique Customers
- 33K Products
- 9 Relational Tables
- 49 SQL Queries
- Power BI connected to MySQL using DirectQuery

**Tools:** MySQL, Power BI, DAX, GitHub  
**Dataset:** Olist Brazilian E-Commerce Public Dataset (Kaggle)

---

## 🗃️ Dataset

9 relational tables covering customers, orders, order items, products, sellers, payments, reviews, geolocation and category translation.

---

## 🧹 Data Preparation

- Converted text dates to proper `DATETIME`
- Handled missing delivery dates
- Used `customer_unique_id` for accurate customer analysis
- Translated product categories
- Excluded incomplete months from trend analysis

---

## 🧮 SQL Analysis

**49 queries** covering:

- Basic SQL & Aggregations
- Joins
- Subqueries
- Window Functions
- CTEs
- Views
- Stored Procedures

---

## 📊 Power BI Dashboard

![Olist E-Commerce Dashboard](dashboard_screenshot.png)

**KPIs:** Total Customers, Total Sales, Total Orders, Total Products, Average Order Value, Average Delivery Days

**Analysis:** Sales Trends, Top Products, Cities & States, Payment Methods, Order Status, Top Customers

**Filters:** Date, Payment Type, Order Status, Customer State, Product Category

---

## 🔍 Key Insights

- Late deliveries: **2.57** avg. review vs **4.29** for on-time orders
- Repeat customers: only **3.12%**
- São Paulo: approximately **5.2M BRL** in product sales
- Credit cards: approximately **78%** of payment value
- Delivered orders: **97.78%**
- Average delivery time: **12.5 days**
- Peak monthly sales: approximately **1.01M BRL** in November 2017

---

## 🛠️ Technologies

**MySQL | Power BI | DAX | GitHub**
