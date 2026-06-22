--- Display all products
SELECT * FROM Products;

-- Display all users
SELECT * FROM Users;

-- Display all products
SELECT * FROM Products;

-- Display all categories
SELECT * FROM Categories;

-- Display product names and prices
SELECT product_name, price
FROM Products;

-- Display all customers
SELECT *
FROM Users
WHERE role = 'Customer';

-- Display all admins
SELECT *
FROM Users
WHERE role = 'Admin';

-- Display all delivered orders
SELECT *
FROM Orders
WHERE order_status = 'Delivered';

-- Display all pending orders
SELECT *
FROM Orders
WHERE order_status = 'Pending';

-- Display all shipped orders
SELECT *
FROM Orders
WHERE order_status = 'Shipped';

-- Display all active products
SELECT *
FROM Products
WHERE is_active = TRUE;

-- Display products costing more than ₹50,000
SELECT *
FROM Products
WHERE price > 50000;

-- Display products costing less than ₹5,000
SELECT *
FROM Products
WHERE price < 5000;

-- Display products costing between ₹1,000 and ₹10,000
SELECT *
FROM Products
WHERE price BETWEEN 1000 AND 10000;

-- Display products in Electronics category
SELECT *
FROM Products
WHERE category_id = 'C001';

-- Display products with stock less than 10
SELECT *
FROM Inventory
WHERE stock_quantity < 10;

-- Display products with stock greater than or equal to 20
SELECT *
FROM Inventory
WHERE stock_quantity >= 20;

-- Display reviews with rating 5
SELECT *
FROM Reviews
WHERE rating = 5;

-- Display reviews with rating greater than or equal to 4
SELECT *
FROM Reviews
WHERE rating >= 4;

-- Display pending and confirmed orders
SELECT *
FROM Orders
WHERE order_status IN ('Pending', 'Confirmed');

-- Display orders that are cancelled
SELECT *
FROM Orders
WHERE order_status = 'Cancelled';

-- Display products starting with 'A'
SELECT *
FROM Products
WHERE product_name LIKE 'A%';

-- Display products ending with 's'
SELECT *
FROM Products
WHERE product_name LIKE '%s';

-- Display products containing 'Phone'
SELECT *
FROM Products
WHERE product_name LIKE '%Phone%';

-- Display customers whose first name starts with 'R'
SELECT *
FROM Users
WHERE first_name LIKE 'R%';

-- Display distinct payment methods
SELECT DISTINCT payment_method
FROM Payments;

-- Display distinct order statuses
SELECT DISTINCT order_status
FROM Orders;

-- Display products in ascending order of price
SELECT product_name, price
FROM Products
ORDER BY price;

-- Display products in descending order of price
SELECT product_name, price
FROM Products
ORDER BY price DESC;

-- Display top 5 most expensive products
SELECT product_name, price
FROM Products
ORDER BY price DESC
LIMIT 5;

-- Display top 5 cheapest products
SELECT product_name, price
FROM Products
ORDER BY price
LIMIT 5;

-- Display undelivered shipments
SELECT *
FROM Shipping
WHERE actual_delivery_date IS NULL;

-- Display delivered shipments
SELECT *
FROM Shipping
WHERE actual_delivery_date IS NOT NULL;

-- Display payments having transaction IDs
SELECT *
FROM Payments
WHERE transaction_id IS NOT NULL;

-- Display payments without transaction IDs
SELECT *
FROM Payments
WHERE transaction_id IS NULL;

-- Display active products costing more than ₹10,000
SELECT *
FROM Products
WHERE price > 10000
AND is_active = TRUE;

-- Display delivered orders above ₹10,000
SELECT *
FROM Orders
WHERE total_amount > 10000
AND order_status = 'Delivered';

-- Display orders that are pending or confirmed
SELECT *
FROM Orders
WHERE order_status = 'Pending'
OR order_status = 'Confirmed';

-- Display products that are either very cheap or very expensive
SELECT *
FROM Products
WHERE price < 1000
OR price > 50000;

-- Display products of brand 'Apple'
SELECT *
FROM Products
WHERE brand = 'Apple';

-- Display products that are inactive
SELECT *
FROM Products
WHERE is_active = FALSE;

-- Display products having stock equal to 0
SELECT *
FROM Inventory
WHERE stock_quantity = 0;

-- Display products having stock greater than reorder level
SELECT *
FROM Inventory
WHERE stock_quantity > reorder_level;

-- Display default addresses
SELECT *
FROM Addresses
WHERE is_default = TRUE;

-- Display non-default addresses
SELECT *
FROM Addresses
WHERE is_default = FALSE;

-- Display addresses from Uttar Pradesh
SELECT *
FROM Addresses
WHERE state = 'Uttar Pradesh';

-- Display addresses from India
SELECT *
FROM Addresses
WHERE country = 'India';

-- Display payments made using UPI
SELECT *
FROM Payments
WHERE payment_method = 'UPI';

-- Display payments made using Credit Card
SELECT *
FROM Payments
WHERE payment_method = 'Credit Card';

-- Display successful payments
SELECT *
FROM Payments
WHERE payment_status = 'Successful';

-- Display failed payments
SELECT *
FROM Payments
WHERE payment_status = 'Failed';

-- Display refunded payments
SELECT *
FROM Payments
WHERE payment_status = 'Refunded';

-- Display completed refunds
SELECT *
FROM Refunds
WHERE refund_status = 'Completed';

-- Display products having 'Pro' in their name
SELECT *
FROM Products
WHERE product_name LIKE '%Pro%';

-- Display products having 'Book' in their name
SELECT *
FROM Products
WHERE product_name LIKE '%Book%';

-- Display products created recently
SELECT *
FROM Products
ORDER BY date_created DESC
LIMIT 5;

-- Display latest orders
SELECT *
FROM Orders
ORDER BY order_date DESC
LIMIT 5;

-- Display highest value orders
SELECT *
FROM Orders
ORDER BY total_amount DESC
LIMIT 5;

-- Display lowest value orders
SELECT *
FROM Orders
ORDER BY total_amount
LIMIT 5;

-- Display products of brand 'Apple'
SELECT *
FROM Products
WHERE brand = 'Apple';

-- Display products that are inactive
SELECT *
FROM Products
WHERE is_active = FALSE;

-- Display products having stock equal to 0
SELECT *
FROM Inventory
WHERE stock_quantity = 0;

-- Display products having stock greater than reorder level
SELECT *
FROM Inventory
WHERE stock_quantity > reorder_level;

-- Display default addresses
SELECT *
FROM Addresses
WHERE is_default = TRUE;

-- Display non-default addresses
SELECT *
FROM Addresses
WHERE is_default = FALSE;

-- Display addresses from Uttar Pradesh
SELECT *
FROM Addresses
WHERE state = 'Uttar Pradesh';

-- Display addresses from India
SELECT *
FROM Addresses
WHERE country = 'India';

-- Display payments made using UPI
SELECT *
FROM Payments
WHERE payment_method = 'UPI';

-- Display payments made using Credit Card
SELECT *
FROM Payments
WHERE payment_method = 'Credit Card';

-- Display successful payments
SELECT *
FROM Payments
WHERE payment_status = 'Successful';

-- Display failed payments
SELECT *
FROM Payments
WHERE payment_status = 'Failed';

-- Display refunded payments
SELECT *
FROM Payments
WHERE payment_status = 'Refunded';

-- Display completed refunds
SELECT *
FROM Refunds
WHERE refund_status = 'Completed';

-- Display products having 'Pro' in their name
SELECT *
FROM Products
WHERE product_name LIKE '%Pro%';

-- Display products having 'Book' in their name
SELECT *
FROM Products
WHERE product_name LIKE '%Book%';

-- Display products created recently
SELECT *
FROM Products
ORDER BY date_created DESC
LIMIT 5;

-- Display latest orders
SELECT *
FROM Orders
ORDER BY order_date DESC
LIMIT 5;

-- Display highest value orders
SELECT *
FROM Orders
ORDER BY total_amount DESC
LIMIT 5;

-- Display lowest value orders
SELECT *
FROM Orders
ORDER BY total_amount
LIMIT 5;

-- Display orders that are neither delivered nor cancelled
SELECT *
FROM Orders
WHERE order_status NOT IN ('Delivered', 'Cancelled');

-- Display products not starting with 'A'
SELECT *
FROM Products
WHERE product_name NOT LIKE 'A%';

-- Display users whose names do not start with 'R'
SELECT *
FROM Users
WHERE first_name NOT LIKE 'R%';

-- Display products outside the range ₹1000 to ₹10000
SELECT *
FROM Products
WHERE price NOT BETWEEN 1000 AND 10000;

-- Display successful UPI payments
SELECT *
FROM Payments
WHERE payment_method = 'UPI'
AND payment_status = 'Successful';

-- Display delivered orders above ₹5000
SELECT *
FROM Orders
WHERE order_status = 'Delivered'
AND total_amount > 5000;

-- Display shipped or packed orders
SELECT *
FROM Orders
WHERE order_status = 'Shipped'
OR order_status = 'Packed';

-- Display default addresses
SELECT *
FROM Addresses
WHERE is_default = TRUE;

-- Display inactive products
SELECT *
FROM Products
WHERE is_active = FALSE;

-- Display products sorted by brand and price
SELECT *
FROM Products
ORDER BY brand, price;

-- Display orders sorted by status and amount
SELECT *
FROM Orders
ORDER BY order_status, total_amount DESC;

-- Display latest products
SELECT *
FROM Products
ORDER BY date_created DESC
LIMIT 5;

-- Display latest payments
SELECT *
FROM Payments
ORDER BY payment_date DESC
LIMIT 5;

-- Display products having exactly 5 characters
SELECT *
FROM Products
WHERE product_name LIKE '_____';

-- Display products whose second letter is 'a'
SELECT *
FROM Products
WHERE product_name LIKE '_a%';

-- Display product names and prices with custom column names
SELECT
    product_name AS Product,
    price AS Price
FROM Products;

-- Display products with increased prices (10% increase)
SELECT
    product_name,
    price,
    price * 1.10 AS Increased_Price
FROM Products;

-- Display products sorted by brand and price
SELECT *
FROM Products
ORDER BY brand ASC, price DESC;

-- Display products from 6th to 10th position
SELECT *
FROM Products
LIMIT 5 OFFSET 5;

-- Display active products costing between ₹1000 and ₹10000
SELECT *
FROM Products
WHERE is_active = TRUE
AND price BETWEEN 1000 AND 10000;