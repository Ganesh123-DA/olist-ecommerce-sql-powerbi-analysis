-- ============================================
-- VIEWS & STORED PROCEDURES — Olist E-Commerce Analysis
-- ============================================

-- ---------- VIEWS ----------

-- View 1: A reusable view showing delivered orders with key timestamps.
CREATE VIEW delivered_orders_view AS
SELECT order_id, customer_id,
       order_purchase_ts,
       order_delivered_ts
FROM ORDERS 
WHERE order_status = 'delivered';

-- View 2: A reusable view showing total payment value per customer state.
CREATE VIEW state_sales_summary AS 
SELECT C.CUSTOMER_STATE,
       SUM(P.PAYMENT_VALUE) AS TOTAL_PAYMENT_VALUE
FROM CUSTOMERS C 
JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN PAYMENTS P ON O.ORDER_ID = P.ORDER_ID
GROUP BY C.CUSTOMER_STATE;

-- ---------- STORED PROCEDURES ----------

-- Procedure 1: Returns total order count per customer for a given state (input parameter).
DELIMITER $$

CREATE PROCEDURE GetCustomerOrderSummary(IN state_cust VARCHAR(30))
BEGIN
    SELECT c.customer_unique_id,
           COUNT(o.order_id) AS total_orders
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE c.customer_state = state_cust
    GROUP BY c.customer_unique_id;
END $$

DELIMITER ;

-- Usage: CALL GetCustomerOrderSummary('SP');


-- Procedure 2: Returns all orders matching a given order_status (input parameter).
DELIMITER $$

CREATE PROCEDURE GetOrdersByStatus(IN status_value VARCHAR(20))
BEGIN
    SELECT order_id, customer_id, order_purchase_ts
    FROM orders
    WHERE order_status = status_value;
END $$

DELIMITER ;

-- Usage: CALL GetOrdersByStatus('delivered');
