-- Trigger 1
DELIMITER //
CREATE TRIGGER trg_reduce_stock
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    UPDATE Inventory
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //
DELIMITER ;


-- Trigger 2
DELIMITER //
CREATE TRIGGER trg_update_restock_date
BEFORE UPDATE ON Inventory
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity > OLD.stock_quantity THEN
        SET NEW.last_restocked = CURRENT_TIMESTAMP;
    END IF;
END //
DELIMITER ;



-- Trigger 3
DELIMITER //
CREATE TRIGGER trg_set_refund_date
BEFORE INSERT ON Refunds
FOR EACH ROW
BEGIN
    SET NEW.refund_date = CURRENT_TIMESTAMP;
END //
DELIMITER ;



-- Trigger 4
DELIMITER //
CREATE TRIGGER trg_check_stock
BEFORE INSERT ON Order_Items
FOR EACH ROW
BEGIN
    DECLARE available_stock INT;
    SELECT stock_quantity
    INTO available_stock
    FROM Inventory
    WHERE product_id = NEW.product_id;
    IF NEW.quantity > available_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock available';
    END IF;
END //
DELIMITER ;

