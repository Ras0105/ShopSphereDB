-- Users: user_id (PK), role (NOT NULL), first_name (NOT NULL), last_name (NOT NULL), email (UNIQUE, NOT NULL), password (NOT NULL), phone (UNIQUE, NOT NULL), alternate_phone, date_created, date_updated
-- Addresses: address_id (PK), user_id (FK, NOT NULL), address_type, full_name (NOT NULL), phone (NOT NULL), address_line1 (NOT NULL), address_line2, landmark, city (NOT NULL), state (NOT NULL), pincode (NOT NULL), country (NOT NULL), is_default, date_created, date_updated
-- Categories: category_id (PK), category_name (UNIQUE, NOT NULL), description, date_created, date_updated
-- Products: product_id (PK), category_id (FK, NOT NULL), product_name (NOT NULL), brand, description, price (NOT NULL, CHECK(price > 0)), is_active, date_created, date_updated
-- Inventory: inventory_id (PK), product_id (FK, UNIQUE, NOT NULL), stock_quantity (NOT NULL, CHECK(stock_quantity >= 0)), reorder_level, last_restocked, date_created, date_updated
-- Cart: cart_id (PK), user_id (FK, NOT NULL), product_id (FK, NOT NULL), quantity (NOT NULL, CHECK(quantity > 0)), date_added, date_updated, UNIQUE(user_id, product_id)
-- Orders: order_id (PK), user_id (FK, NOT NULL), address_id (FK, NOT NULL), order_date, total_amount (NOT NULL, CHECK(total_amount >= 0)), order_status (NOT NULL), date_created, date_updated
-- Order_Items: order_item_id (PK), order_id (FK, NOT NULL), product_id (FK, NOT NULL), quantity (NOT NULL, CHECK(quantity > 0)), price_at_purchase (NOT NULL, CHECK(price_at_purchase >= 0)), subtotal (NOT NULL, CHECK(subtotal >= 0)), date_created, UNIQUE(order_id, product_id)
-- Payments: payment_id (PK), order_id (FK, NOT NULL), amount (NOT NULL, CHECK(amount >= 0)), payment_method (NOT NULL), payment_status (NOT NULL), transaction_id (UNIQUE), payment_date, date_created, date_updated
-- Shipping: shipping_id (PK), order_id (FK, UNIQUE, NOT NULL), tracking_number (UNIQUE), courier_name, shipping_status (NOT NULL), estimated_delivery_date, actual_delivery_date, date_created, date_updated
-- Reviews: review_id (PK), user_id (FK, NOT NULL), product_id (FK, NOT NULL), rating (NOT NULL, CHECK(rating BETWEEN 1 AND 5)), review_comment, review_date, date_created, date_updated, UNIQUE(user_id, product_id)
-- Refunds: refund_id (PK), order_id (FK, NOT NULL), payment_id (FK, NOT NULL), refund_amount (NOT NULL, CHECK(refund_amount >= 0)), refund_reason, refund_status (NOT NULL), refund_date, date_created, date_updated

-- RELATIONSHIPS:------------------------------------------------------------------------------------------------------------
-- Users:
--     1:M Addresses
--     1:M Orders
--     1:M Cart
--     1:M Reviews

-- Categories:
--     1:M Products

-- Products:
--     1:1 Inventory
--     1:M Cart
--     1:M Reviews
--     M:N Orders (through Order_Items)

-- Orders:
--     1:M Payments
--     1:M Order_Items
--     1:1 Shipping
--     1:M Refunds

-- Payments:
--     1:M Refunds




CREATE TABLE Users(
    user_id varchar(20) PRIMARY KEY,
    role varchar(10) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    email varchar(100) UNIQUE NOT NULL,
    password varchar(300) NOT NULL,
    phone varchar(10) UNIQUE NOT NULL,
    alternate_phone varchar(10),
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- whenever update in row, time updates to curret time
    CHECK (role IN ('Customer', 'Admin'))
);
CREATE TABLE Addresses(
    address_id varchar(20) pRIMARY KEY,
    user_id varchar(20) NOT NULL,
    address_type varchar(20),
    full_name varchar(200) NOT NULL,
    phone varchar(10) NOT NULL,
    address_line1 varchar(200) NOT NULL,
    address_line2 varchar(200),
    landmark varchar(100),
    city varchar(100) NOT NULL,
    state varchar(100) NOT NULL,
    pincode varchar(10) NOT NULL,
    country varchar(100) NOT NULL,
    is_default boolean DEFAULT FALSE,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    CHECK(address_type IN ('Home','Office','Hostel'))
);
CREATE TABLE Categories(
    category_id varchar(20) PRIMARY KEY,
    category_name varchar(100) UNIQUE NOT NULL,
    description text,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Products(
    product_id varchar(20) PRIMARY KEY,
    category_id varchar(20) NOT NULL,
    product_name varchar(200) NOT NULL,
    brand varchar(100),
    description text,
    price decimal(10, 2) NOT NULL CHECK (price > 0),
    is_active boolean DEFAULT TRUE,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
CREATE TABLE Inventory(
    inventory_id varchar(20) PRIMARY KEY,
    product_id varchar(20) UNIQUE NOT NULL,
    stock_quantity int NOT NULL CHECK (stock_quantity >= 0),
    reorder_level INT DEFAULT 10,
    last_restocked timestamp,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    CHECK(reorder_level >= 0)
);
CREATE TABLE Cart(
    cart_id varchar(20) PRIMARY KEY,
    user_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    quantity int NOT NULL CHECK (quantity > 0),
    date_added timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Orders(
    order_id varchar(20) PRIMARY KEY,
    user_id varchar(20) NOT NULL,
    address_id varchar(20) NOT NULL,
    order_date timestamp DEFAULT CURRENT_TIMESTAMP,
    total_amount decimal(10, 2) NOT NULL CHECK (total_amount >= 0),
    order_status varchar(20) NOT NULL,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id),
    CHECK(order_status IN ('Pending','Confirmed','Packed','Shipped','Out for Delivery','Delivered','Cancelled','Returned','Refunded'))
);
CREATE TABLE Order_Items(
    order_item_id varchar(20) PRIMARY KEY,
    order_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    quantity int NOT NULL CHECK (quantity > 0),
    price_at_purchase decimal(10, 2) NOT NULL CHECK (price_at_purchase >= 0),
    subtotal decimal(10, 2) NOT NULL CHECK (subtotal >= 0),
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Payments(
    payment_id varchar(20) PRIMARY KEY,
    order_id varchar(20) NOT NULL,
    amount decimal(10, 2) NOT NULL CHECK (amount >= 0),
    payment_method varchar(50) NOT NULL,
    payment_status varchar(20) NOT NULL,
    transaction_id varchar(100) UNIQUE,
    payment_date timestamp DEFAULT CURRENT_TIMESTAMP,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CHECK(payment_status IN('Pending','Successful','Failed','Refunded')),
    CHECK(payment_method IN('UPI','Credit Card','Debit Card','Net Banking','Wallet','Cash on Delivery'))
);
CREATE TABLE Shipping(
    shipping_id varchar(20) PRIMARY KEY,
    order_id varchar(20) UNIQUE NOT NULL,
    tracking_number varchar(100) UNIQUE,
    courier_name varchar(100),
    shipping_status varchar(20) NOT NULL,
    estimated_delivery_date date,
    actual_delivery_date date,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CHECK(
        shipping_status IN
        (
        'Pending',
        'Packed',
        'Shipped',
        'Out for Delivery',
        'Delivered',
        'Returned',
        'Cancelled'
        ))
);
CREATE TABLE Reviews(
    review_id varchar(20) PRIMARY KEY,
    user_id varchar(20) NOT NULL,
    product_id varchar(20) NOT NULL,
    rating int NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_comment text,
    review_date timestamp DEFAULT CURRENT_TIMESTAMP,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE(user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Refunds(
    refund_id varchar(20) PRIMARY KEY,
    order_id varchar(20) NOT NULL,
    payment_id varchar(20) NOT NULL,
    refund_amount decimal(10, 2) NOT NULL CHECK (refund_amount >= 0),
    refund_reason text,
    refund_status varchar(20) NOT NULL,
    refund_date timestamp DEFAULT CURRENT_TIMESTAMP,
    date_created timestamp DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (payment_id) REFERENCES Payments(payment_id),
    CHECK(
        refund_status IN
        (
        'Requested',
        'Approved',
        'Rejected',
        'Processed',
        'Completed'
        ))
);

