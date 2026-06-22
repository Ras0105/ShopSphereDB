-- Index on email
CREATE INDEX idx_user_email
ON Users(email);

-- Index on product name
CREATE INDEX idx_product_name
ON Products(product_name);

-- Index on order status
CREATE INDEX idx_order_status
ON Orders(order_status);

-- Index on payment status
CREATE INDEX idx_payment_status
ON Payments(payment_status);

-- Index on category
CREATE INDEX idx_product_category
ON Products(category_id);

-- Index on shipping status
CREATE INDEX idx_shipping_status
ON Shipping(shipping_status);