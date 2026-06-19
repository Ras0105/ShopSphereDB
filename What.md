# ShopSphere – E-Commerce Database Management System (Reference Notes)

## What are we making?
ShopSphere is an E-Commerce Database Management System that manages users, products, orders, payments, reviews, and inventory.

## Flow

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

**Relationship**

```text
Category (1) ---- (M) Products
```

---

### 3. User Browses Products

* Opens Electronics category.
* Database does not change.

---

### 4. User Adds to Cart

Added:

* iPhone ×1
* AirPods ×2

**Cart**

```text
UserID | ProductID | Quantity

1 | 101 | 1
1 | 102 | 2
```

**Relationship**

```text
Users (M) ---- Cart ---- (M) Products
```

---

### 5. User Places Order

**Orders**

```text
OrderID:5001
UserID:1
Date:Today
Status:Pending
Total:₹120000
```

**Order_Items**

```text
5001 | 101 | 1
5001 | 102 | 2
```

**Update Inventory**

Before:

```text
iPhone Stock = 10
AirPods Stock = 20
```

After:

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

**Relationship**

```text
Orders (1) ---- (1) Payments
```

---

### 7. Shipping

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

```text
Rating: 5 Stars
Comment: Excellent Product
```

**Reviews**

```text
UserID
ProductID
Rating
Comment
```

---

# Business Flow

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

# Programmer Thinking

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
