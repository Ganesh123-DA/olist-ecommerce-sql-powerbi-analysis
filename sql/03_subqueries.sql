-- ============================================
-- SUBQUERIES — Olist E-Commerce Analysis
-- ============================================

-- Question 1: Find all products (product_id) whose price (in order_items) 
-- is greater than the average price of all order_items.
SELECT DISTINCT PRODUCT_ID 
FROM ORDER_ITEMS
WHERE PRICE > (
    SELECT AVG(PRICE) FROM ORDER_ITEMS
);

-- Question 2: Find all customer_ids from customers table where that customer 
-- has at least one order with order_status = 'canceled'      
SELECT customer_id
FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders WHERE order_status = 'canceled'
);

-- Question 3: Find the order_id from the payments table that has the highest payment_value.       
SELECT ORDER_ID, PAYMENT_VALUE
FROM PAYMENTS
WHERE PAYMENT_VALUE = (SELECT MAX(PAYMENT_VALUE) FROM PAYMENTS);

-- Question 4: Find all customer_ids from the customers table who have never placed an order 
-- (i.e., their customer_id does not appear in the orders table).      
SELECT CUSTOMER_ID
FROM customers
WHERE CUSTOMER_ID NOT IN (
    SELECT CUSTOMER_ID FROM ORDERS
);

-- Question 5 (Subquery with EXISTS): Find all customer_ids from the customers table 
-- who have placed at least one order — using EXISTS with a correlated subquery                
SELECT customer_id
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);
