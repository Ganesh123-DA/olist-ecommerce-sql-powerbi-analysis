-- ============================================
-- WINDOW FUNCTIONS — Olist E-Commerce Analysis
-- ============================================

-- Question 1 (Basic Window Function): For each order in order_items, show the order_id, 
-- product_id, price, and the average price across all order_items — without collapsing rows.
SELECT ORDER_ID, PRODUCT_ID, PRICE,
       AVG(PRICE) OVER() AS AVG_PRICE
FROM ORDER_ITEMS;

-- Question 2 (Window Function with PARTITION BY): For each row in order_items, show the 
-- order_id, product_id, price, along with the average price for that specific product.
SELECT ORDER_ID, PRODUCT_ID, PRICE,
       AVG(PRICE) OVER(PARTITION BY PRODUCT_ID) AS AVG_PRODUCT_PRICE
FROM ORDER_ITEMS;

-- Question 3 (RANK): For each order_item, rank the products within each product_category_name 
-- by price in descending order (highest price = rank 1).              
SELECT P.PRODUCT_ID, P.PRODUCT_CATEGORY_NAME, O.PRICE,
       RANK() OVER(PARTITION BY P.PRODUCT_CATEGORY_NAME ORDER BY O.PRICE DESC) AS PRICE_RANK 
FROM PRODUCTS P 
JOIN ORDER_ITEMS O ON P.PRODUCT_ID = O.PRODUCT_ID;

-- Question 4 (ROW_NUMBER): For each customer_id, find their most recent order 
-- (latest order_purchase_timestamp).               
SELECT CUSTOMER_ID, ORDER_ID, ORDER_PURCHASE_TS
FROM (
    SELECT CUSTOMER_ID, ORDER_ID, ORDER_PURCHASE_TS,
           ROW_NUMBER() OVER (PARTITION BY CUSTOMER_ID ORDER BY ORDER_PURCHASE_TS DESC) AS rn
    FROM orders
) ranked_orders
WHERE rn = 1;

-- Question 5 (Running Total): For each payment, show the payment_value and also show the 
-- running total (cumulative sum) of payment_value, ordered by order_id.                    
SELECT ORDER_ID, PAYMENT_TYPE, PAYMENT_VALUE,
       SUM(PAYMENT_VALUE) OVER(ORDER BY ORDER_ID) AS RUNNING_TOTAL
FROM PAYMENTS;
