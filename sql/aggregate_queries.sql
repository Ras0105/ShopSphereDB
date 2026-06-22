-- Count total users
SELECT COUNT(*) AS Total_Users
FROM Users;

-- Count total customers
SELECT COUNT(*) AS Total_Customers
FROM Users
WHERE role = 'Customer';

-- Count total products
SELECT COUNT(*) AS Total_Products
FROM Products;

-- Count total categories
SELECT COUNT(*) AS Total_Categories
FROM Categories;

-- Count total orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;

-- Count delivered orders
SELECT COUNT(*) AS Delivered_Orders
FROM Orders
WHERE order_status = 'Delivered';

-- Count pending orders
SELECT COUNT(*) AS Pending_Orders
FROM Orders
WHERE order_status = 'Pending';

-- Count total reviews
SELECT COUNT(*) AS Total_Reviews
FROM Reviews;

-- Count products with low stock
SELECT COUNT(*) AS Low_Stock_Products
FROM Inventory
WHERE stock_quantity < reorder_level;

-- Count successful payments
SELECT COUNT(*) AS Successful_Payments
FROM Payments
WHERE payment_status = 'Successful';

-- Calculate total revenue
SELECT SUM(total_amount) AS Total_Revenue
FROM Orders;

-- Calculate total refunded amount
SELECT SUM(refund_amount) AS Total_Refunded
FROM Refunds;

-- Calculate total stock available
SELECT SUM(stock_quantity) AS Total_Stock
FROM Inventory;

-- Calculate total payment received
SELECT SUM(amount) AS Total_Payment_Received
FROM Payments
WHERE payment_status = 'Successful';

-- Calculate total value of delivered orders
SELECT SUM(total_amount) AS Delivered_Revenue
FROM Orders
WHERE order_status = 'Delivered';

-- Average product price
SELECT AVG(price) AS Average_Product_Price
FROM Products;

-- Average order value
SELECT AVG(total_amount) AS Average_Order_Value
FROM Orders;

-- Average rating
SELECT AVG(rating) AS Average_Rating
FROM Reviews;

-- Average stock quantity
SELECT AVG(stock_quantity) AS Average_Stock
FROM Inventory;

-- Most expensive product price
SELECT MAX(price) AS Highest_Price
FROM Products;

-- Highest order value
SELECT MAX(total_amount) AS Highest_Order
FROM Orders;

-- Highest stock quantity
SELECT MAX(stock_quantity) AS Highest_Stock
FROM Inventory;

-- Highest rating
SELECT MAX(rating) AS Highest_Rating
FROM Reviews;

-- Cheapest product price
SELECT MIN(price) AS Lowest_Price
FROM Products;

-- Lowest order value
SELECT MIN(total_amount) AS Lowest_Order
FROM Orders;

-- Lowest stock quantity
SELECT MIN(stock_quantity) AS Lowest_Stock
FROM Inventory;

-- Lowest rating
SELECT MIN(rating) AS Lowest_Rating
FROM Reviews;

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

