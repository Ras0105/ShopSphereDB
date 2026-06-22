-- Procedure 1
DELIMITER //
CREATE PROCEDURE GetCustomerOrders(
    IN p_user_id VARCHAR(20)
)
BEGIN
    SELECT
        order_id,
        order_date,
        total_amount,
        order_status
    FROM Orders
    WHERE user_id = p_user_id;
END //
DELIMITER ;



-- procedure 2
DELIMITER //
CREATE PROCEDURE GetProductStock(
    IN p_product_id VARCHAR(20)
)
BEGIN
    SELECT
        p.product_name,
        i.stock_quantity,
        i.reorder_level
    FROM Products p
    JOIN Inventory i
    ON p.product_id = i.product_id
    WHERE p.product_id = p_product_id;
END //
DELIMITER ;


-- Procedure 3
DELIMITER //
CREATE PROCEDURE GetProductsByCategory(
    IN p_category_id VARCHAR(20)
)
BEGIN
    SELECT
        product_id,
        product_name,
        brand,
        price
    FROM Products
    WHERE category_id = p_category_id;
END //
DELIMITER ;



-- Procedure 4
DELIMITER //
CREATE PROCEDURE GetOrderDetails(
    IN p_order_id VARCHAR(20)
)
BEGIN
    SELECT
        o.order_id,
        CONCAT(u.first_name,' ',u.last_name) AS customer_name,
        p.product_name,
        oi.quantity,
        oi.subtotal,
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
        ON o.order_id = s.order_id
    WHERE o.order_id = p_order_id;
END //
DELIMITER ;