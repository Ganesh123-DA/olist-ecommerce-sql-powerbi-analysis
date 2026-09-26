-- ============================================
-- CTE (Common Table Expressions) — Olist E-Commerce Analysis
-- ============================================

-- Question 1: Using a CTE, find the total payment_value for each customer_state, 
-- then show only states with total payment value greater than 1,000,000.          
WITH state_totals AS (
    SELECT C.CUSTOMER_STATE, SUM(P.PAYMENT_VALUE) AS TOTAL_PAYMENT_VALUE
    FROM CUSTOMERS C 
    JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
    JOIN PAYMENTS P ON O.ORDER_ID = P.ORDER_ID
    GROUP BY C.CUSTOMER_STATE
)
SELECT * FROM state_totals 
WHERE TOTAL_PAYMENT_VALUE > 1000000;

-- Question 2: Using a CTE, find customers (customer_unique_id) who have placed 
-- more than 5 orders. Show customer_unique_id and their order count.        
WITH customer_orders AS (
    SELECT C.CUSTOMER_UNIQUE_ID,
           COUNT(O.ORDER_ID) AS ORDER_COUNT 
    FROM CUSTOMERS C 
    JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID 
    GROUP BY C.CUSTOMER_UNIQUE_ID
    HAVING COUNT(O.ORDER_ID) > 5 
)
SELECT * FROM customer_orders;

-- Question 3: Using a CTE, calculate the average review_score per product_category_name, 
-- then show only categories with average score below 3.5 (poor-performing categories).                
WITH category_avg AS (
    SELECT P.PRODUCT_CATEGORY_NAME,
           AVG(R.REVIEW_SCORE) AS AVG_SCORE
    FROM PRODUCTS P 
    JOIN ORDER_ITEMS OT ON P.PRODUCT_ID = OT.PRODUCT_ID
    JOIN REVIEWS R ON OT.ORDER_ID = R.ORDER_ID
    GROUP BY P.PRODUCT_CATEGORY_NAME
)
SELECT * FROM category_avg 
WHERE AVG_SCORE < 3.5;

-- Question 4 (CTE + Window Function): Using a CTE, rank sellers by their total revenue 
-- (SUM(price) from order_items), and show only the top 10 sellers with their rank.          
WITH seller_revenue AS (
    SELECT S.SELLER_ID,
           SUM(OI.PRICE) AS TOTAL_REVENUE
    FROM SELLERS S 
    JOIN ORDER_ITEMS OI ON S.SELLER_ID = OI.SELLER_ID
    GROUP BY S.SELLER_ID
),
seller_ranked AS (
    SELECT SELLER_ID, TOTAL_REVENUE,
           RANK() OVER(ORDER BY TOTAL_REVENUE DESC) AS REVENUE_RANK
    FROM seller_revenue
)
SELECT * FROM seller_ranked 
WHERE REVENUE_RANK <= 10;

-- Question 5 (Multiple CTEs): Using two CTEs — one calculating total orders per customer, 
-- another calculating total payment value per customer — join them together.
WITH order_counts AS (
    SELECT C.CUSTOMER_UNIQUE_ID,
           COUNT(O.ORDER_ID) AS TOTAL_ORDERS 
    FROM CUSTOMERS C 
    JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
    GROUP BY C.CUSTOMER_UNIQUE_ID
),
payment_totals AS (
    SELECT C.CUSTOMER_UNIQUE_ID,
           SUM(P.PAYMENT_VALUE) AS TOTAL_PAYMENT_VALUE
    FROM CUSTOMERS C
    JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
    JOIN PAYMENTS P ON O.ORDER_ID = P.ORDER_ID
    GROUP BY C.CUSTOMER_UNIQUE_ID
)
SELECT oc.CUSTOMER_UNIQUE_ID,
       oc.TOTAL_ORDERS,
       pt.TOTAL_PAYMENT_VALUE
FROM order_counts oc
JOIN payment_totals pt ON oc.CUSTOMER_UNIQUE_ID = pt.CUSTOMER_UNIQUE_ID;
