-- Why Views?
-- To simplify complex queries, improve security by hiding unnecessary columns, and provide reusable reports.

-- Display basic customer information
CREATE VIEW Customer_Details AS
SELECT
    user_id,
    first_name,
    last_name,
    email,
    phone
FROM Users
WHERE role = 'Customer';

SELECT * FROM Customer_Details;

-- Display products with categories
CREATE VIEW Product_Catalog AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.brand,
    p.price,
    p.is_active
FROM Products p
JOIN Categories c
ON p.category_id = c.category_id;

SELECT * FROM Product_Catalog;

-- Display products with stock details
CREATE VIEW Inventory_Status AS
SELECT
    p.product_name,
    i.stock_quantity,
    i.reorder_level
FROM Products p
JOIN Inventory i
ON p.product_id = i.product_id;

SELECT * FROM Inventory_Status;

-- Display order summary
CREATE VIEW Order_Summary AS
SELECT
    o.order_id,
    CONCAT(u.first_name,' ',u.last_name) AS customer_name,
    o.total_amount,
    o.order_status,
    o.order_date
FROM Orders o
JOIN Users u
ON o.user_id = u.user_id;

SELECT * FROM Order_Summary;

-- Display payment information
CREATE VIEW Payment_Details AS
SELECT
    p.payment_id,
    p.order_id,
    p.amount,
    p.payment_method,
    p.payment_status
FROM Payments p;

SELECT * FROM Payment_Details;

-- Display shipping information
CREATE VIEW Shipping_Details AS
SELECT
    o.order_id,
    s.courier_name,
    s.tracking_number,
    s.shipping_status
FROM Orders o
JOIN Shipping s
ON o.order_id = s.order_id;

SELECT * FROM Shipping_Details;

-- Display reviews with customer names
CREATE VIEW Product_Reviews AS
SELECT
    p.product_name,
    CONCAT(u.first_name,' ',u.last_name) AS customer_name,
    r.rating,
    r.review_comment
FROM Reviews r
JOIN Users u
ON r.user_id = u.user_id
JOIN Products p
ON r.product_id = p.product_id;

SELECT * FROM Product_Reviews;

-- Display low stock products
CREATE VIEW Low_Stock_Products AS
SELECT
    p.product_name,
    i.stock_quantity,
    i.reorder_level
FROM Products p
JOIN Inventory i
ON p.product_id = i.product_id
WHERE i.stock_quantity <= i.reorder_level;

SELECT * FROM Low_Stock_Products;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';

CREATE OR REPLACE VIEW Customer_Details AS
SELECT
    user_id,
    first_name,
    last_name,
    email
FROM Users
WHERE role = 'Customer';

DROP VIEW Customer_Details;

