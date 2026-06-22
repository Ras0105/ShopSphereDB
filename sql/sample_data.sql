

-- Inserting Sample Data

INSERT INTO Users
(user_id, role, first_name, last_name, email, password, phone, alternate_phone)
VALUES
('U001', 'Customer', 'Rasshi', 'Srivastav', 'rasshi@gmail.com', 'rasshi123', '9876543210', '9123456789'),
('U002', 'Customer', 'Aman', 'Gupta', 'aman@gmail.com', 'aman123', '9876543211', NULL),
('U003', 'Customer', 'Priya', 'Sharma', 'priya@gmail.com', 'priya123', '9876543212', NULL),
('U004', 'Customer', 'Rahul', 'Verma', 'rahul@gmail.com', 'rahul123', '9876543213', '9123456780'),
('U005', 'Customer', 'Neha', 'Singh', 'neha@gmail.com', 'neha123', '9876543214', NULL),
('U006', 'Customer', 'Arjun', 'Mishra', 'arjun@gmail.com', 'arjun123', '9876543215', NULL),
('U007', 'Customer', 'Sneha', 'Yadav', 'sneha@gmail.com', 'sneha123', '9876543216', '9123456781'),
('U008', 'Customer', 'Karan', 'Patel', 'karan@gmail.com', 'karan123', '9876543217', NULL),
('U009', 'Customer', 'Simran', 'Kapoor', 'simran@gmail.com', 'simran123', '9876543218', NULL),
('U010', 'Admin', 'Admin', 'User', 'admin@shopsphere.com', 'admin123', '9876543219', NULL);


-- Addresses--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Addresses
(address_id, user_id, address_type, full_name, phone,
 address_line1, address_line2, landmark,
 city, state, pincode, country, is_default)
VALUES
('A001', 'U001', 'Home', 'Rasshi Srivastav', '9876543210',
 'House No. 21, Civil Lines', 'Near MMMUT Hostel', 'Opposite SBI Bank',
 'Gorakhpur', 'Uttar Pradesh', '273010', 'India', TRUE),
('A002', 'U001', 'Hostel', 'Rasshi Srivastav', '9876543210',
 'MMMUT Girls Hostel', 'Room 205', NULL,
 'Gorakhpur', 'Uttar Pradesh', '273010', 'India', FALSE),
('A003', 'U002', 'Home', 'Aman Gupta', '9876543211',
 '12, Aliganj', NULL, 'Near Hanuman Mandir',
 'Lucknow', 'Uttar Pradesh', '226024', 'India', TRUE),
('A004', 'U003', 'Home', 'Priya Sharma', '9876543212',
 '45, Rohini Sector 9', NULL, NULL,
 'Delhi', 'Delhi', '110085', 'India', TRUE),
('A005', 'U004', 'Office', 'Rahul Verma', '9876543213',
 'Tower B, Andheri East', '5th Floor', 'Near Metro Station',
 'Mumbai', 'Maharashtra', '400069', 'India', TRUE),
('A006', 'U005', 'Home', 'Neha Singh', '9876543214',
 '22, Rajendra Nagar', NULL, NULL,
 'Patna', 'Bihar', '800016', 'India', TRUE),
('A007', 'U006', 'Home', 'Arjun Mishra', '9876543215',
 '18, Indirapuram', NULL, 'Near DPS School',
 'Ghaziabad', 'Uttar Pradesh', '201014', 'India', TRUE),
('A008', 'U007', 'Home', 'Sneha Yadav', '9876543216',
 '33, Vaishali Nagar', NULL, NULL,
 'Jaipur', 'Rajasthan', '302021', 'India', TRUE),
('A009', 'U008', 'Home', 'Karan Patel', '9876543217',
 '11, Satellite Road', NULL, 'Near ISKCON Temple',
 'Ahmedabad', 'Gujarat', '380015', 'India', TRUE),
('A010', 'U009', 'Home', 'Simran Kapoor', '9876543218',
 '78, Model Town', NULL, NULL,
 'Ludhiana', 'Punjab', '141002', 'India', TRUE),
('A011', 'U002', 'Office', 'Aman Gupta', '9876543211',
 'Cyber Park', 'Building A', NULL,
 'Lucknow', 'Uttar Pradesh', '226010', 'India', FALSE),
('A012', 'U005', 'Hostel', 'Neha Singh', '9876543214',
 'Girls Hostel Block C', 'Room 103', NULL,
 'Patna', 'Bihar', '800020', 'India', FALSE),
('A013', 'U006', 'Office', 'Arjun Mishra', '9876543215',
 'Tech Park', '3rd Floor', 'Near City Mall',
 'Noida', 'Uttar Pradesh', '201301', 'India', FALSE),
('A014', 'U008', 'Office', 'Karan Patel', '9876543217',
 'Business Bay', NULL, NULL,
 'Ahmedabad', 'Gujarat', '380009', 'India', FALSE),
('A015', 'U009', 'Hostel', 'Simran Kapoor', '9876543218',
 'University Hostel', 'Room 12', NULL,
 'Ludhiana', 'Punjab', '141001', 'India', FALSE);

-- Categories----------------------------------------------------------------------------------------------------------------
INSERT INTO Categories
(category_id, category_name, description)
VALUES
('C001', 'Electronics', 'Electronic gadgets, devices, and accessories.'),
('C002', 'Fashion', 'Clothing, footwear, and fashion accessories.'),
('C003', 'Books', 'Educational, fiction, and non-fiction books.'),
('C004', 'Home Appliances', 'Household appliances and kitchen equipment.'),
('C005', 'Sports', 'Sports equipment, fitness, and outdoor products.');

-- Products----------------------------------------------------------------------------------------------------------------
INSERT INTO Products
(product_id, category_id, product_name, brand, description, price, is_active)
VALUES
('P001', 'C001', 'Apple iPhone 16', 'Apple', '128GB, Black', 80000.00, TRUE),
('P002', 'C001', 'Samsung Galaxy S25', 'Samsung', '256GB, Silver', 75000.00, TRUE),
('P003', 'C001', 'MacBook Air M4', 'Apple', '13-inch, 16GB RAM, 512GB SSD', 120000.00, TRUE),
('P004', 'C001', 'AirPods Pro', 'Apple', '2nd Generation Noise Cancelling Earbuds', 25000.00, TRUE),
('P005', 'C001', 'Dell Inspiron 15', 'Dell', '15-inch Laptop, 16GB RAM', 65000.00, TRUE),
('P006', 'C001', 'HP Pavilion', 'HP', '14-inch Laptop, 16GB RAM', 70000.00, TRUE),
('P007', 'C002', 'Nike Air Max', 'Nike', 'Running Shoes', 6500.00, TRUE),
('P008', 'C002', 'Adidas Hoodie', 'Adidas', 'Cotton Hoodie', 3000.00, TRUE),
('P009', 'C002', 'Levis Jeans', 'Levis', 'Slim Fit Blue Jeans', 2500.00, TRUE),
('P010', 'C002', 'Puma T-Shirt', 'Puma', 'Round Neck Sports T-Shirt', 1200.00, TRUE),
('P011', 'C003', 'Harry Potter Set', 'Bloomsbury', 'Complete Harry Potter Collection', 4500.00, TRUE),
('P012', 'C003', 'Atomic Habits', 'Penguin', 'Self-help Book by James Clear', 600.00, TRUE),
('P013', 'C003', 'DBMS Concepts', 'McGraw Hill', 'Database Management Systems Textbook', 850.00, TRUE),
('P014', 'C003', 'Clean Code', 'Pearson', 'Book by Robert C. Martin', 900.00, TRUE),
('P015', 'C004', 'LG Refrigerator', 'LG', 'Double Door Refrigerator', 35000.00, TRUE),
('P016', 'C004', 'Samsung Microwave', 'Samsung', '28L Convection Microwave', 12000.00, TRUE),
('P017', 'C004', 'Philips Mixer Grinder', 'Philips', '750W Mixer Grinder', 4500.00, TRUE),
('P018', 'C005', 'Yonex Badminton Racket', 'Yonex', 'Professional Badminton Racket', 3000.00, TRUE),
('P019', 'C005', 'Cosco Football', 'Cosco', 'Size 5 Football', 800.00, TRUE),
('P020', 'C005', 'Nike Basketball', 'Nike', 'Official Size Basketball', 1500.00, TRUE);

-- Inventory----------------------------------------------------------------------------------------------------------------
INSERT INTO Inventory
(inventory_id, product_id, stock_quantity, reorder_level, last_restocked)
VALUES
('I001', 'P001', 10, 5, '2026-06-15 10:00:00'),
('I002', 'P002', 15, 5, '2026-06-14 11:00:00'),
('I003', 'P003', 5, 2, '2026-06-13 09:30:00'),
('I004', 'P004', 30, 10, '2026-06-16 12:00:00'),
('I005', 'P005', 8, 3, '2026-06-12 14:00:00'),
('I006', 'P006', 6, 3, '2026-06-11 15:30:00'),
('I007', 'P007', 25, 10, '2026-06-15 16:00:00'),
('I008', 'P008', 20, 10, '2026-06-14 10:30:00'),
('I009', 'P009', 18, 8, '2026-06-13 11:00:00'),
('I010', 'P010', 35, 15, '2026-06-16 09:00:00'),
('I011', 'P011', 12, 5, '2026-06-15 13:00:00'),
('I012', 'P012', 40, 20, '2026-06-12 12:00:00'),
('I013', 'P013', 22, 10, '2026-06-11 17:00:00'),
('I014', 'P014', 16, 8, '2026-06-10 10:00:00'),
('I015', 'P015', 4, 2, '2026-06-14 14:30:00'),
('I016', 'P016', 7, 3, '2026-06-13 15:00:00'),
('I017', 'P017', 10, 5, '2026-06-12 16:00:00'),
('I018', 'P018', 14, 5, '2026-06-15 11:00:00'),
('I019', 'P019', 28, 10, '2026-06-14 09:00:00'),
('I020', 'P020', 19, 8, '2026-06-13 12:00:00');

-- Cart----------------------------------------------------------------------------------------------------------------
INSERT INTO Cart
(cart_id, user_id, product_id, quantity)
VALUES
('CT001', 'U001', 'P004', 1),
('CT002', 'U001', 'P012', 2),
('CT003', 'U002', 'P007', 1),
('CT004', 'U002', 'P019', 2),
('CT005', 'U003', 'P001', 1),
('CT006', 'U003', 'P014', 1),
('CT007', 'U004', 'P008', 2),
('CT008', 'U004', 'P018', 1),
('CT009', 'U005', 'P003', 1),
('CT010', 'U005', 'P017', 1),
('CT011', 'U006', 'P010', 3),
('CT012', 'U006', 'P020', 1),
('CT013', 'U007', 'P002', 1),
('CT014', 'U007', 'P013', 2),
('CT015', 'U008', 'P005', 1),
('CT016', 'U008', 'P011', 1),
('CT017', 'U009', 'P006', 1),
('CT018', 'U009', 'P016', 1),
('CT019', 'U001', 'P019', 1),
('CT020', 'U003', 'P008', 1);

-- Orders----------------------------------------------------------------------------------------------------------------
INSERT INTO Orders
(order_id, user_id, address_id, total_amount, order_status)
VALUES
('O001', 'U001', 'A001', 2000.00, 'Delivered'),
('O002', 'U002', 'A003', 7100.00, 'Delivered'),
('O003', 'U003', 'A004', 80900.00, 'Shipped'),
('O004', 'U004', 'A005', 3800.00, 'Pending'),
('O005', 'U005', 'A006', 124500.00, 'Delivered'),
('O006', 'U006', 'A007', 7500.00, 'Confirmed'),
('O007', 'U007', 'A008', 75600.00, 'Packed'),
('O008', 'U008', 'A009', 65800.00, 'Cancelled'),
('O009', 'U009', 'A010', 12900.00, 'Delivered'),
('O010', 'U001', 'A002', 1400.00, 'Delivered'),
('O011', 'U002', 'A011', 1500.00, 'Returned'),
('O012', 'U003', 'A004', 1450.00, 'Delivered'),
('O013', 'U004', 'A005', 3700.00, 'Pending'),
('O014', 'U005', 'A012', 39500.00, 'Delivered'),
('O015', 'U006', 'A013', 3800.00, 'Shipped'),
('O016', 'U007', 'A008', 2100.00, 'Delivered'),
('O017', 'U008', 'A014', 70900.00, 'Refunded'),
('O018', 'U009', 'A015', 25600.00, 'Delivered'),
('O019', 'U001', 'A001', 5300.00, 'Confirmed'),
('O020', 'U002', 'A003', 1450.00, 'Delivered');

-- Order_Items----------------------------------------------------------------------------------------------------------------
INSERT INTO Order_Items
(order_item_id, order_id, product_id, quantity, price_at_purchase, subtotal)
VALUES
('OI001', 'O001', 'P010', 1, 1200.00, 1200.00),
('OI002', 'O001', 'P019', 1, 800.00, 800.00),
('OI003', 'O002', 'P007', 1, 6500.00, 6500.00),
('OI004', 'O002', 'P012', 1, 600.00, 600.00),
('OI005', 'O003', 'P001', 1, 80000.00, 80000.00),
('OI006', 'O003', 'P014', 1, 900.00, 900.00),
('OI007', 'O004', 'P008', 1, 3000.00, 3000.00),
('OI008', 'O004', 'P019', 1, 800.00, 800.00),
('OI009', 'O005', 'P003', 1, 120000.00, 120000.00),
('OI010', 'O005', 'P011', 1, 4500.00, 4500.00),
('OI011', 'O006', 'P011', 1, 4500.00, 4500.00),
('OI012', 'O006', 'P018', 1, 3000.00, 3000.00),
('OI013', 'O007', 'P002', 1, 75000.00, 75000.00),
('OI014', 'O007', 'P012', 1, 600.00, 600.00),
('OI015', 'O008', 'P005', 1, 65000.00, 65000.00),
('OI016', 'O008', 'P019', 1, 800.00, 800.00),
('OI017', 'O009', 'P016', 1, 12000.00, 12000.00),
('OI018', 'O009', 'P014', 1, 900.00, 900.00),
('OI019', 'O010', 'P019', 1, 800.00, 800.00),
('OI020', 'O010', 'P012', 1, 600.00, 600.00),
('OI021', 'O011', 'P014', 1, 900.00, 900.00),
('OI022', 'O011', 'P012', 1, 600.00, 600.00),
('OI023', 'O012', 'P012', 1, 600.00, 600.00),
('OI024', 'O012', 'P013', 1, 850.00, 850.00),
('OI025', 'O013', 'P009', 1, 2500.00, 2500.00),
('OI026', 'O013', 'P010', 1, 1200.00, 1200.00),
('OI027', 'O014', 'P015', 1, 35000.00, 35000.00),
('OI028', 'O014', 'P017', 1, 4500.00, 4500.00),
('OI029', 'O015', 'P018', 1, 3000.00, 3000.00),
('OI030', 'O015', 'P019', 1, 800.00, 800.00),
('OI031', 'O016', 'P020', 1, 1500.00, 1500.00),
('OI032', 'O016', 'P012', 1, 600.00, 600.00),
('OI033', 'O017', 'P006', 1, 70000.00, 70000.00),
('OI034', 'O017', 'P014', 1, 900.00, 900.00),
('OI035', 'O018', 'P004', 1, 25000.00, 25000.00),
('OI036', 'O018', 'P012', 1, 600.00, 600.00),
('OI037', 'O019', 'P011', 1, 4500.00, 4500.00),
('OI038', 'O019', 'P019', 1, 800.00, 800.00),
('OI039', 'O020', 'P013', 1, 850.00, 850.00),
('OI040', 'O020', 'P012', 1, 600.00, 600.00);

-- Payments----------------------------------------------------------------------------------------------------------------
INSERT INTO Payments
(payment_id, order_id, amount, payment_method, payment_status, transaction_id)
VALUES
('PAY001', 'O001', 2000.00, 'UPI', 'Successful', 'TXN1001'),
('PAY002', 'O002', 7100.00, 'Credit Card', 'Successful', 'TXN1002'),
('PAY003', 'O003', 80900.00, 'Debit Card', 'Successful', 'TXN1003'),
('PAY004', 'O004', 3800.00, 'UPI', 'Failed', 'TXN1004'),
('PAY005', 'O004', 3800.00, 'UPI', 'Successful', 'TXN1005'),
('PAY006', 'O005', 124500.00, 'Net Banking', 'Successful', 'TXN1006'),
('PAY007', 'O006', 7500.00, 'Wallet', 'Successful', 'TXN1007'),
('PAY008', 'O007', 75600.00, 'Credit Card', 'Successful', 'TXN1008'),
('PAY009', 'O008', 65800.00, 'UPI', 'Failed', 'TXN1009'),
('PAY010', 'O009', 12900.00, 'Cash on Delivery', 'Pending', NULL),
('PAY011', 'O010', 1400.00, 'UPI', 'Successful', 'TXN1010'),
('PAY012', 'O011', 1500.00, 'UPI', 'Refunded', 'TXN1011'),
('PAY013', 'O012', 1450.00, 'Debit Card', 'Successful', 'TXN1012'),
('PAY014', 'O013', 3700.00, 'Wallet', 'Pending', 'TXN1013'),
('PAY015', 'O014', 39500.00, 'Net Banking', 'Successful', 'TXN1014'),
('PAY016', 'O015', 3800.00, 'UPI', 'Successful', 'TXN1015'),
('PAY017', 'O016', 2100.00, 'Credit Card', 'Successful', 'TXN1016'),
('PAY018', 'O017', 70900.00, 'Debit Card', 'Refunded', 'TXN1017'),
('PAY019', 'O018', 25600.00, 'UPI', 'Successful', 'TXN1018'),
('PAY020', 'O019', 5300.00, 'Wallet', 'Successful', 'TXN1019'),
('PAY021', 'O020', 1450.00, 'UPI', 'Successful', 'TXN1020');

-- Shipping----------------------------------------------------------------------------------------------------------------
INSERT INTO Shipping
(shipping_id, order_id, tracking_number, courier_name, shipping_status, estimated_delivery_date, actual_delivery_date)
VALUES
('S001', 'O001', 'TRK1001', 'Delhivery', 'Delivered', '2026-06-18', '2026-06-17'),
('S002', 'O002', 'TRK1002', 'Blue Dart', 'Delivered', '2026-06-19', '2026-06-19'),
('S003', 'O003', 'TRK1003', 'DTDC', 'Shipped', '2026-06-25', NULL),
('S004', 'O004', 'TRK1004', 'XpressBees', 'Pending', '2026-06-28', NULL),
('S005', 'O005', 'TRK1005', 'Ekart', 'Delivered', '2026-06-20', '2026-06-19'),
('S006', 'O006', 'TRK1006', 'Delhivery', 'Packed', '2026-06-26', NULL),
('S007', 'O007', 'TRK1007', 'Blue Dart', 'Packed', '2026-06-27', NULL),
('S008', 'O008', 'TRK1008', 'DTDC', 'Cancelled', NULL, NULL),
('S009', 'O009', 'TRK1009', 'XpressBees', 'Delivered', '2026-06-21', '2026-06-20'),
('S010', 'O010', 'TRK1010', 'Ekart', 'Delivered', '2026-06-18', '2026-06-18'),
('S011', 'O011', 'TRK1011', 'Delhivery', 'Returned', NULL, '2026-06-20'),
('S012', 'O012', 'TRK1012', 'Blue Dart', 'Delivered', '2026-06-19', '2026-06-18'),
('S013', 'O013', 'TRK1013', 'DTDC', 'Pending', '2026-06-29', NULL),
('S014', 'O014', 'TRK1014', 'XpressBees', 'Delivered', '2026-06-22', '2026-06-21'),
('S015', 'O015', 'TRK1015', 'Ekart', 'Shipped', '2026-06-26', NULL),
('S016', 'O016', 'TRK1016', 'Delhivery', 'Delivered', '2026-06-20', '2026-06-20'),
('S017', 'O017', 'TRK1017', 'Blue Dart', 'Returned', NULL, '2026-06-22'),
('S018', 'O018', 'TRK1018', 'DTDC', 'Delivered', '2026-06-23', '2026-06-22'),
('S019', 'O019', 'TRK1019', 'XpressBees', 'Packed', '2026-06-28', NULL),
('S020', 'O020', 'TRK1020', 'Ekart', 'Delivered', '2026-06-19', '2026-06-19');

-- Reviews----------------------------------------------------------------------------------------------------------------  
INSERT INTO Reviews
(review_id, user_id, product_id, rating, review_comment)
VALUES
('R001', 'U001', 'P019', 5, 'Excellent quality football.'),
('R002', 'U002', 'P007', 4, 'Very comfortable shoes.'),
('R003', 'U003', 'P001', 5, 'Amazing phone with great camera.'),
('R004', 'U004', 'P008', 4, 'Good hoodie and comfortable fit.'),
('R005', 'U005', 'P003', 5, 'MacBook performance is outstanding.'),
('R006', 'U006', 'P011', 5, 'Loved the Harry Potter collection.'),
('R007', 'U007', 'P002', 4, 'Samsung flagship is impressive.'),
('R008', 'U008', 'P005', 3, 'Laptop is decent for daily use.'),
('R009', 'U009', 'P016', 4, 'Microwave works perfectly.'),
('R010', 'U001', 'P010', 4, 'Nice T-shirt and good quality.'),
('R011', 'U003', 'P012', 5, 'Atomic Habits is life-changing.'),
('R012', 'U005', 'P015', 4, 'Spacious refrigerator and energy efficient.'),
('R013', 'U007', 'P020', 5, 'Good grip and quality basketball.'),
('R014', 'U009', 'P004', 5, 'AirPods sound quality is excellent.'),
('R015', 'U002', 'P013', 4, 'Great DBMS book for students.');

-- Refunds----------------------------------------------------------------------------------------------------------------
INSERT INTO Refunds
(refund_id, order_id, payment_id, refund_amount, refund_reason, refund_status)
VALUES
('RF001', 'O011', 'PAY012', 1500.00,
 'Product returned by customer', 'Completed'),
('RF002', 'O017', 'PAY018', 70900.00,
 'Defective laptop received', 'Completed'),
('RF003', 'O014', 'PAY015', 39500.00,
 'Product damaged during delivery', 'Approved');
