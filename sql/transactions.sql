-- Place An Order
START TRANSACTION;

INSERT INTO Orders
(order_id, user_id, address_id, total_amount, order_status)
VALUES
('O021', 'U001', 'A001', 5000.00, 'Pending');

INSERT INTO Payments
(payment_id, order_id, amount, payment_method, payment_status)
VALUES
('PAY022', 'O021', 5000.00, 'UPI', 'Successful');

UPDATE Inventory
SET stock_quantity = stock_quantity - 1
WHERE product_id = 'P011';

INSERT INTO Shipping
(shipping_id, order_id, shipping_status)
VALUES
('S021', 'O021', 'Pending');

COMMIT;



-- Rollback On Failure
START TRANSACTION;

INSERT INTO Orders
(order_id, user_id, address_id, total_amount, order_status)
VALUES
('O022', 'U002', 'A003', 10000.00, 'Pending');

INSERT INTO Payments
(payment_id, order_id, amount, payment_method, payment_status)
VALUES
('PAY023', 'O022', 10000.00, 'UPI', 'Successful');

-- Suppose inventory update fails
UPDATE Inventory
SET stock_quantity = stock_quantity - 1000
WHERE product_id = 'P001';

ROLLBACK;



-- Cancel an Order and Refund
START TRANSACTION;

UPDATE Orders
SET order_status = 'Cancelled'
WHERE order_id = 'O003';

INSERT INTO Refunds
(refund_id, order_id, payment_id,
 refund_amount, refund_reason, refund_status)
VALUES
(
'RF004',
'O003',
'PAY003',
80900.00,
'Customer requested cancellation',
'Completed'
);

UPDATE Payments
SET payment_status = 'Refunded'
WHERE payment_id = 'PAY003';

COMMIT;


-- Restock Inventory
START TRANSACTION;

UPDATE Inventory
SET stock_quantity = stock_quantity + 50
WHERE product_id = 'P012';

COMMIT;



-- Savepoint Example
START TRANSACTION;

INSERT INTO Orders
(order_id, user_id, address_id,
total_amount, order_status)
VALUES
('O023', 'U003', 'A004',
2000.00, 'Pending');

SAVEPOINT order_created;

INSERT INTO Payments
(payment_id, order_id, amount,
payment_method, payment_status)
VALUES
(
'PAY024',
'O023',
2000.00,
'UPI',
'Successful'
);

SAVEPOINT payment_done;

-- Something goes wrong

ROLLBACK TO payment_done;

COMMIT;