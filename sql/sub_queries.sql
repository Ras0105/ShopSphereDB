-- Display the most expensive product
SELECT *
FROM Products
WHERE price = (
    SELECT MAX(price)
    FROM Products
);

-- Display the cheapest product
SELECT *
FROM Products
WHERE price = (
    SELECT MIN(price)
    FROM Products
);

-- Display the highest value order
SELECT *
FROM Orders
WHERE total_amount = (
    SELECT MAX(total_amount)
    FROM Orders
);

-- Display product having minimum stock
SELECT *
FROM Inventory
WHERE stock_quantity = (
    SELECT MIN(stock_quantity)
    FROM Inventory
);

-- Display products costlier than average price
SELECT *
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
);

-- Display customers having delivered orders
SELECT *
FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Orders
    WHERE order_status = 'Delivered'
);

-- Display ordered products
SELECT *
FROM Products
WHERE product_id IN (
    SELECT product_id
    FROM Order_Items
);

-- Display products never ordered
SELECT *
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Order_Items
);

-- Display reviewed products
SELECT *
FROM Products
WHERE product_id IN (
    SELECT product_id
    FROM Reviews
);

-- Display products without reviews
SELECT *
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Reviews
);

-- Display orders above average order value
SELECT *
FROM Orders o
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
);

-- Display products having below average stock
SELECT *
FROM Inventory i
WHERE stock_quantity < (
    SELECT AVG(stock_quantity)
    FROM Inventory
);

-- Display customers having multiple addresses
SELECT *
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Addresses a
    WHERE a.user_id = u.user_id
) > 1;

-- Display customers having multiple addresses
SELECT *
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Addresses a
    WHERE a.user_id = u.user_id
) > 1;

-- Display customers having multiple orders
SELECT *
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Orders o
    WHERE o.user_id = u.user_id
) > 1;

-- Display frequently ordered products
SELECT *
FROM Products p
WHERE (
    SELECT COUNT(*)
    FROM Order_Items oi
    WHERE oi.product_id = p.product_id
) > 1;

-- Display customers who placed orders
SELECT *
FROM Users u
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.user_id = u.user_id
);

-- Display customers who never placed orders
SELECT *
FROM Users u
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.user_id = u.user_id
);

-- Display products having reviews
SELECT *
FROM Products p
WHERE EXISTS (
    SELECT 1
    FROM Reviews r
    WHERE r.product_id = p.product_id
);

-- Display products without reviews
SELECT *
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM Reviews r
    WHERE r.product_id = p.product_id
);

-- Display customers who purchased premium products
SELECT *
FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Orders
    WHERE order_id IN (
        SELECT order_id
        FROM Order_Items
        WHERE product_id IN (
            SELECT product_id
            FROM Products
            WHERE price > 50000
        )
    )
);

