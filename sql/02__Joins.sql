-- ============================================
-- JOINS — Olist E-Commerce Analysis
-- ============================================

-- Question 1: Find the customer_city and customer_state for each order, 
-- along with the order_status. (Join orders and customers tables using customer_id.)      
SELECT C.CUSTOMER_CITY, C.CUSTOMER_STATE,
       O.ORDER_STATUS
FROM CUSTOMERS C 
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

-- Question 2: Find the product_category_name for each order_item, along with its price.
-- (Join order_items and products using product_id.)                 
SELECT P.PRODUCT_CATEGORY_NAME,
       OT.ORDER_ID,
       OT.PRICE
FROM PRODUCTS P 
JOIN ORDER_ITEMS OT ON P.PRODUCT_ID = OT.PRODUCT_ID;

-- Question 3: Find all products that have never been ordered 
-- (i.e., products with no matching row in order_items).             
SELECT P.PRODUCT_ID, P.PRODUCT_CATEGORY_NAME,
       OT.ORDER_ID
FROM PRODUCTS P 
LEFT JOIN ORDER_ITEMS OT ON P.PRODUCT_ID = OT.PRODUCT_ID
WHERE OT.ORDER_ID IS NULL;

-- Question 4: Find the customer_city, order_status, and payment_type for each order.
-- (Join customers, orders, and payments — using customer_id and order_id.)                
SELECT C.CUSTOMER_CITY,
       O.ORDER_STATUS,	
       P.PAYMENT_TYPE
FROM CUSTOMERS C 
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS P ON O.ORDER_ID = P.ORDER_ID;

-- Question 5: Find the total payment_value for each customer_state.
-- (Join customers, orders, and payments)
SELECT C.CUSTOMER_STATE,
       SUM(P.PAYMENT_VALUE) AS TOTAL_PAYMENT_VALUE
FROM CUSTOMERS C 
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID 
JOIN PAYMENTS P ON O.ORDER_ID = P.ORDER_ID
GROUP BY C.CUSTOMER_STATE;

-- Question 6: Find the product_category_name, and its total revenue (SUM(price)), for each category.
-- (Join order_items and products)             
SELECT P.PRODUCT_CATEGORY_NAME,
       SUM(OT.PRICE) AS TOTAL_REVENUE
FROM PRODUCTS P 
JOIN ORDER_ITEMS OT ON P.PRODUCT_ID = OT.PRODUCT_ID
GROUP BY P.PRODUCT_CATEGORY_NAME
ORDER BY TOTAL_REVENUE DESC 
LIMIT 10;

-- Question 7: For delivered orders, find the average review_score grouped by whether the order was delivered 
-- late (after order_estimated_delivery_date) or on-time
-- INSIGHT: Late orders average 2.57 review score vs 4.29 for on-time (~40% drop)
SELECT 
    CASE 
        WHEN O.ORDER_DELIVERED_TS > O.ORDER_ESTIMATED_TS THEN 'LATE' 
        ELSE 'ON TIME' 
    END AS DELIVERY_STATUS,
    AVG(R.REVIEW_SCORE) AS AVG_REVIEW_SCORE 
FROM ORDERS O
JOIN REVIEWS R ON O.ORDER_ID = R.ORDER_ID
WHERE O.ORDER_STATUS = 'delivered'
GROUP BY DELIVERY_STATUS;

-- Question 8: Find the top 5 sellers by total revenue (SUM(price) from order_items), 
-- along with their seller_city. (Join order_items and sellers using seller_id.)
SELECT S.SELLER_ID, S.SELLER_CITY,
       SUM(OT.PRICE) AS TOTAL_REVENUE
FROM SELLERS S
JOIN ORDER_ITEMS OT ON S.SELLER_ID = OT.SELLER_ID 
GROUP BY S.SELLER_ID, S.SELLER_CITY
ORDER BY TOTAL_REVENUE DESC 
LIMIT 5;

-- Question 9: Find the number of orders placed by each customer_unique_id, but only show customers who placed more than 1 order 
-- (repeat customers) — along with their order count. (Join customers and orders.)             
SELECT C.CUSTOMER_UNIQUE_ID,
       COUNT(O.ORDER_ID) AS NUMBER_ORDERS
FROM CUSTOMERS C 
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_UNIQUE_ID 
HAVING COUNT(O.ORDER_ID) > 1;

-- Question 10: Find the average payment_installments for each payment_type,
-- but only show payment types with more than 100 payments   
SELECT PAYMENT_TYPE,
       AVG(PAYMENT_INSTALLMENTS) AS AVG_INSTALLMENTS,
       COUNT(*) AS TOTAL_PAYMENTS
FROM PAYMENTS 
GROUP BY PAYMENT_TYPE 
HAVING COUNT(*) > 100;
