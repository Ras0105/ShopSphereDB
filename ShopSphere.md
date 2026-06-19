# ShopSphere – E-Commerce Database Management System using MySQL

## System Flow (Programmer's Perspective)

### 1. User Registers

👤 Rasshi creates an account.

**Users**

```text
1 | Rasshi | rasshi@gmail.com
```

---

### 2. Admin Adds Products

**Products**

```text
101 | iPhone 16 | ₹80000 | Stock:10
102 | AirPods | ₹20000 | Stock:20
```

#### Relationship

```text
Category (1) -------- (M) Products
```

---

### 3. User Browses Products

Rasshi opens the **Electronics** category.

> The database is not changing right now. The user is simply browsing (window shopping).

---

### 4. User Adds to Cart

Suppose Rasshi adds:

* 1 iPhone
* 2 AirPods

**Cart**

```text
UserID
ProductID
Quantity
```

**Data**

```text
1 | 101 | 1
1 | 102 | 2
```

#### Relationship

```text
Users (M)
     \
      \
      Cart
      /
     /
Products (M)
```

This represents a **Many-to-Many relationship**.

---

### 5. User Places Order

#### Orders

```text
OrderID: 5001
UserID: 1
Date: Today
Status: Pending
Total: ₹120000
```

#### Order_Items

```text
5001 | 101 | 1
5001 | 102 | 2
```

#### Update Inventory

**Before**

```text
iPhone Stock = 10
AirPods Stock = 20
```

**After**

```text
iPhone Stock = 9
AirPods Stock = 18
```

---

### 6. Payment

**Payments**

```text
PaymentID
OrderID
Amount
Method
Status
```

#### Relationship

```text
Orders (1) -------- (1) Payments
```

---

### 7. Shipping

Order status changes over time:

```text
Pending
↓
Packed
↓
Shipped
↓
Delivered
```

---

### 8. User Reviews

Suppose Rasshi writes:

```text
Rating: 5 Stars
Comment: Excellent product
```

**Reviews**

```text
UserID
ProductID
Rating
Comment
```

---

# Complete Business Flow

```text
User
 ↓
Browse Products
 ↓
Add to Cart
 ↓
Place Order
 ↓
Create Order
 ↓
Create Order Items
 ↓
Update Inventory
 ↓
Create Payment
 ↓
Change Order Status
 ↓
Write Review
```

---

# Database Flow

```text
Users
 ↓
Cart
 ↓
Orders
 ↓
Order_Items
 ↓
Payments
 ↓
Reviews
```

---

# Design Philosophy

> I decomposed the system into independent entities such as Users, Products, Orders, Payments, and Reviews to reduce redundancy and model real-world e-commerce relationships effectively.

---

# Programmer's Thinking Process

```text
Real World Process
        ↓
Entities
        ↓
Relationships
        ↓
Tables
        ↓
Queries
```

This is the fundamental approach to designing a relational database system and thinking like a programmer.
