-- Revenue after refunds
SELECT
    SUM(total_amount) -
    (SELECT IFNULL(SUM(refund_amount),0)
     FROM Refunds) AS Net_Revenue
FROM Orders;

-- Total active products
SELECT COUNT(*) AS Active_Products
FROM Products
WHERE is_active = TRUE;

-- Total inactive products
SELECT COUNT(*) AS Inactive_Products
FROM Products
WHERE is_active = FALSE;

-- Count orders by status
SELECT
    order_status,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY order_status;

-- Calculate revenue by order status
SELECT
    order_status,
    SUM(total_amount) AS Revenue
FROM Orders
GROUP BY order_status;

-- Calculate average order value by status
SELECT
    order_status,
    AVG(total_amount) AS Average_Order_Value
FROM Orders
GROUP BY order_status;

-- Count payments by payment method
SELECT
    payment_method,
    COUNT(*) AS Total_Payments
FROM Payments
GROUP BY payment_method;

-- Calculate amount by payment method
SELECT
    payment_method,
    SUM(amount) AS Total_Amount
FROM Payments
WHERE payment_status = 'Successful'
GROUP BY payment_method;

-- Count reviews by rating
SELECT
    rating,
    COUNT(*) AS Total_Reviews
FROM Reviews
GROUP BY rating;

-- Count addresses by state
SELECT
    state,
    COUNT(*) AS Total_Addresses
FROM Addresses
GROUP BY state;

-- Categories having more than 2 products
SELECT
    category_id,
    COUNT(*) AS Total_Products
FROM Products
GROUP BY category_id
HAVING COUNT(*) > 2;

-- Order statuses having more than 1 order
SELECT
    order_status,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY order_status
HAVING COUNT(*) > 1;

-- Payment methods used more than once
SELECT
    payment_method,
    COUNT(*) AS Total_Payments
FROM Payments
GROUP BY payment_method
HAVING COUNT(*) > 1;

-- States having more than one address
SELECT
    state,
    COUNT(*) AS Total_Addresses
FROM Addresses
GROUP BY state
HAVING COUNT(*) > 1;

-- Ratings given more than once
SELECT
    rating,
    COUNT(*) AS Total_Reviews
FROM Reviews
GROUP BY rating
HAVING COUNT(*) > 1;

-- Payment methods generating more than ₹10,000 revenue
SELECT
    payment_method,
    SUM(amount) AS Revenue
FROM Payments
WHERE payment_status = 'Successful'
GROUP BY payment_method
HAVING SUM(amount) > 10000;

-- Order statuses with average order value greater than ₹10,000
SELECT
    order_status,
    AVG(total_amount) AS Average_Order_Value
FROM Orders
GROUP BY order_status
HAVING AVG(total_amount) > 10000;

-- Maximum order amount by status
SELECT
    order_status,
    MAX(total_amount) AS Maximum_Order
FROM Orders
GROUP BY order_status;

-- Minimum order amount by status
SELECT
    order_status,
    MIN(total_amount) AS Minimum_Order
FROM Orders
GROUP BY order_status;

-- Average product price by category
SELECT
    category_id,
    AVG(price) AS Average_Price
FROM Products
GROUP BY category_id;

