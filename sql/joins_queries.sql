-- Display all orders with customer details
SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    o.order_id,
    o.total_amount,
    o.order_status
FROM Users u
JOIN Orders o
ON u.user_id = o.user_id;

-- Display customers with their addresses
SELECT
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    a.city,
    a.state,
    a.country
FROM Users u
JOIN Addresses a
ON u.user_id = a.user_id;

-- Display products with their categories
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price
FROM Products p
JOIN Categories c
ON p.category_id = c.category_id;

-- Display products with stock information
SELECT
    p.product_name,
    i.stock_quantity,
    i.reorder_level
FROM Products p
JOIN Inventory i
ON p.product_id = i.product_id;

-- Display products present in customer carts
SELECT
    u.first_name,
    p.product_name,
    c.quantity
FROM Cart c
JOIN Users u
ON c.user_id = u.user_id
JOIN Products p
ON c.product_id = p.product_id;

-- Display products present in each order
SELECT
    o.order_id,
    oi.product_id,
    oi.quantity,
    oi.subtotal
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id;

-- Display payment details of orders
SELECT
    o.order_id,
    o.total_amount,
    p.payment_method,
    p.payment_status
FROM Orders o
JOIN Payments p
ON o.order_id = p.order_id;

-- Display shipping details of orders
SELECT
    o.order_id,
    o.order_status,
    s.shipping_status,
    s.courier_name
FROM Orders o
JOIN Shipping s
ON o.order_id = s.order_id;

-- Display customer reviews on products
SELECT
    u.first_name,
    p.product_name,
    r.rating,
    r.review_comment
FROM Reviews r
JOIN Users u
ON r.user_id = u.user_id
JOIN Products p
ON r.product_id = p.product_id;

-- Display refund details
SELECT
    o.order_id,
    r.refund_amount,
    r.refund_status
FROM Orders o
JOIN Refunds r
ON o.order_id = r.order_id;

-- Display complete order summary
SELECT
    o.order_id,
    CONCAT(u.first_name,' ',u.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    oi.subtotal,
    pay.payment_method,
    pay.payment_status,
    s.shipping_status
FROM Orders o
JOIN Users u
ON o.user_id = u.user_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
JOIN Payments pay
ON o.order_id = pay.order_id
JOIN Shipping s
ON o.order_id = s.order_id;

-- Display customers who never placed an order
SELECT
    u.user_id,
    u.first_name,
    u.last_name
FROM Users u
LEFT JOIN Orders o
ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

-- Display products without reviews
SELECT
    p.product_name
FROM Products p
LEFT JOIN Reviews r
ON p.product_id = r.product_id
WHERE r.review_id IS NULL;

-- Display products never ordered
SELECT
    p.product_name
FROM Products p
LEFT JOIN Order_Items oi
ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

