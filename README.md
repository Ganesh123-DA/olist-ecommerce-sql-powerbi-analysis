# Olist E-Commerce Analytics: SQL + Power BI

## 📌 Project Overview

End-to-end analysis of the Olist Brazilian E-Commerce dataset using **MySQL and Power BI**.

- ~99K Orders
- 96K Unique Customers
- 33K Products
- 9 Relational Tables
- 49 SQL Queries
- Power BI connected to MySQL using Import mode

**Tools:** MySQL, Power BI, DAX, GitHub

---


## 🎯 Business Problem

The Olist e-commerce dataset contains information about orders, customers, products, payments, reviews, sellers, and delivery. The goal of this project is to analyze the data and identify patterns in sales performance, customer behavior, product performance, payment methods, and delivery outcomes.

## 📌 Project Objectives

- Analyze overall sales and order performance over time
- Identify top-performing products and customer locations
- Analyze customer and order behavior
- Understand payment method distribution
- Evaluate order delivery performance and customer reviews
- Identify key business trends and insights from the data

## 📊 Power BI Dashboard

![Olist E-Commerce Dashboard](Olist_powerbi_dashboard.png)

### 📥 Download the Dashboard

The interactive Power BI file (60 MB) is available in the [Releases section](https://github.com/Ganesh123-DA/olist-ecommerce-sql-powerbi-analysis/releases/tag/v1.0).

**How to open:**
1. Download `Olist.Ecommerce.Sales.Dashboard.pbix` from the release page.
2. Open it in **Power BI Desktop** (free, Windows only).
3. Data is stored inside the file (Import mode), so no database setup is needed.

## 🗃️ Dataset

9 relational tables covering customers, orders, order items, products, sellers, payments, reviews, geolocation and category translation.

---

## 🧹 Data Preparation

- Converted text dates to proper `DATETIME`
- Handled missing delivery dates
- Used `customer_unique_id` for customer analysis
- Translated product categories
- Excluded incomplete months

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

## 🔍 Key Insights

- Late deliveries: **2.57** avg. review vs **4.29** for on-time orders
- Repeat customers: **3.12%**
- São Paulo: **~5.2M BRL** in product sales
- Credit cards: **~78%** of payment value
- Delivered orders: **97.78%**
- Average delivery time: **12.5 days**
- Peak monthly sales: **~1.01M BRL** in November 2017

---

## 🛠️ Technologies

**MySQL | Power BI | DAX | GitHub**
