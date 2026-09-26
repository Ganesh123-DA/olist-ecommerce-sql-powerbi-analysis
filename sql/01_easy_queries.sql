-- ============================================
-- EASY QUERIES — Olist E-Commerce Analysis
-- ============================================

-- Question 1: Find the total number of orders in the orders table.
SELECT COUNT(*) AS TOTAL_ORDERS FROM ORDERS;

-- Question 2: Find the count of orders for each order_status
SELECT ORDER_STATUS, COUNT(*) AS TOTAL_ORDERS
FROM ORDERS 
GROUP BY ORDER_STATUS
ORDER BY TOTAL_ORDERS DESC;

-- Question 3: Find the total number of unique customers, using customer_unique_id          
SELECT COUNT(DISTINCT CUSTOMER_UNIQUE_ID) AS UNIQUE_CUSTOMERS
FROM CUSTOMERS;

-- Question 4: Find the top 5 states (customer_state) with the highest number of customers.     
SELECT CUSTOMER_STATE,
       COUNT(DISTINCT CUSTOMER_UNIQUE_ID) AS NUMBER_CUSTOMERS
FROM CUSTOMERS 
GROUP BY CUSTOMER_STATE
ORDER BY NUMBER_CUSTOMERS DESC 
LIMIT 5;

-- Question 5: Find the count of payments for each payment_type           
SELECT PAYMENT_TYPE,
       COUNT(*) AS TOTAL_COUNT
FROM PAYMENTS 
GROUP BY PAYMENT_TYPE
ORDER BY TOTAL_COUNT DESC;

-- Question 6: Find the overall average review_score.
SELECT ROUND(AVG(REVIEW_SCORE), 2) AS AVG_REVIEW_SCORE
FROM REVIEWS;

-- Question 7: Find the total number of unique sellers,
-- and find which seller_state has the highest number of sellers.  
SELECT COUNT(DISTINCT seller_id) AS total_unique_sellers
FROM sellers;

SELECT seller_state, COUNT(DISTINCT seller_id) AS unique_sellers 
FROM sellers
GROUP BY seller_state
ORDER BY unique_sellers DESC
LIMIT 1;

-- Question 8: Find the number of unique product categories in the products table.
SELECT COUNT(DISTINCT PRODUCT_CATEGORY_NAME) AS UNIQUE_CATEGORIES
FROM PRODUCTS;

-- Question 9: Find the count of orders where order_status is "delivered".
SELECT COUNT(ORDER_ID) AS DELIVERED_ORDERS
FROM ORDERS
WHERE ORDER_STATUS = 'delivered';

-- Question 10: Find the count of reviews where review_score is 1 or 2 (bad reviews)
SELECT COUNT(*) AS BAD_REVIEWS 
FROM REVIEWS 
WHERE REVIEW_SCORE IN (1, 2);

-- Question 11: Find the count of payments where payment_installments is greater than 1 (EMI payments).
SELECT COUNT(*) AS PAYMENT_COUNT
FROM PAYMENTS 
WHERE PAYMENT_INSTALLMENTS > 1;

-- Question 12: Find all order_items where price is greater than 100 — just get the count.
SELECT COUNT(*) AS COUNT_OF_ORDERS
FROM ORDER_ITEMS
WHERE PRICE > 100;

-- Question 13: Find the total payment_value (SUM) for each payment_type. 
SELECT PAYMENT_TYPE,
       SUM(PAYMENT_VALUE) AS TOTAL_PAYMENT_VALUE
FROM PAYMENTS 
GROUP BY PAYMENT_TYPE
ORDER BY TOTAL_PAYMENT_VALUE DESC;

-- Question 14: Find the count of products in each product_category_name.
SELECT PRODUCT_CATEGORY_NAME,
       COUNT(*) AS TOTAL_PRODUCTS
FROM PRODUCTS 
GROUP BY PRODUCT_CATEGORY_NAME 
ORDER BY TOTAL_PRODUCTS DESC;

-- Question 15: Find the customer_city and customer_state of 
-- the customer with customer_id = '06b8999e2fba1a1fbc88172c00ba8bc7'
SELECT CUSTOMER_CITY, CUSTOMER_STATE 
FROM CUSTOMERS 
WHERE CUSTOMER_ID = '06b8999e2fba1a1fbc88172c00ba8bc7';

-- Question 16: Find the minimum and maximum price in the order_items table.
SELECT MAX(PRICE) AS MAX_PRICE,
       MIN(PRICE) AS MIN_PRICE
FROM ORDER_ITEMS;

-- Question 17: Find the count of order_items where price is between 50 and 200 (inclusive).
SELECT COUNT(*) AS TOTAL_ORDERS 
FROM ORDER_ITEMS
WHERE PRICE BETWEEN 50 AND 200;

-- Question 18: Find all product categories (product_category_name)
-- that contain the word 'moveis' (furniture-related categories in Portuguese).  
SELECT DISTINCT PRODUCT_CATEGORY_NAME
FROM PRODUCTS 
WHERE PRODUCT_CATEGORY_NAME LIKE '%moveis%';

-- Question 19: Find the count of reviews where review_comment_message 
-- is NULL (customers who didn't leave a comment).               
SELECT COUNT(*) AS NULL_MESSAGES
FROM REVIEWS 
WHERE REVIEW_COMMENT_MESSAGE IS NULL;

-- Question 20: Find the count of orders where order_purchase_timestamp falls in the year 2017
SELECT COUNT(*) AS ORDERS_2017
FROM ORDERS 
WHERE YEAR(ORDER_PURCHASE_TS) = 2017;
