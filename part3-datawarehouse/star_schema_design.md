# Star Schema Design Documentation

## Section 1: Schema Overview

### FACT TABLE: fact_sales
- **Grain**: One row per product per order line item  
- **Business Process**: Sales transactions  

**Measures (Numeric Facts):**
- `quantity_sold`: Number of units sold  
- `unit_price`: Price per unit at time of sale  
- `discount_amount`: Discount applied  
- `total_amount`: Final amount (quantity × unit_price - discount)  

**Foreign Keys:**
- `date_key` → dim_date  
- `product_key` → dim_product  
- `customer_key` → dim_customer  

---

### DIMENSION TABLE: dim_date
- **Purpose**: Date dimension for time-based analysis  
- **Type**: Conformed dimension  

**Attributes:**
- `date_key` (PK): Surrogate key (integer, format: YYYYMMDD)  
- `full_date`: Actual date  
- `day_of_week`: Monday, Tuesday, etc.  
- `month`: 1–12  
- `month_name`: January, February, etc.  
- `quarter`: Q1, Q2, Q3, Q4  
- `year`: 2023, 2024, etc.  
- `is_weekend`: Boolean  

---

### DIMENSION TABLE: dim_product
- **Purpose**: Product dimension for analyzing sales by product attributes  
- **Type**: Conformed dimension  

**Attributes:**
- `product_key` (PK): Surrogate key  
- `product_id`: Business identifier  
- `product_name`: Name of the product  
- `category`: Product category (e.g., Electronics, Grocery)  
- `brand`: Brand name  
- `price`: Standard unit price  
- `stock_quantity`: Available stock at time of load  

---

### DIMENSION TABLE: dim_customer
- **Purpose**: Customer dimension for analyzing sales by customer attributes  
- **Type**: Conformed dimension  

**Attributes:**
- `customer_key` (PK): Surrogate key  
- `customer_id`: Business identifier  
- `customer_name`: Full name of the customer  
- `email`: Contact email  
- `phone`: Standardized phone number  
- `registration_date`: Date of registration  
- `city`: Customer’s city  
- `state`: Customer’s state  
- `country`: Customer’s country  
- `segment`: Customer segment (e.g., Retail, Wholesale, VIP)  

---

## Summary
This star schema design supports efficient analytical queries by separating **facts** (sales transactions) from **dimensions** (date, product, customer). It enables reporting on sales trends, product performance, and customer behavior across time.

## Section 2: Design Decisions

The chosen granularity for the fact table is at the transaction line-item level because it provides the most detailed view of sales activity. Each row represents a specific product sold within an order, allowing analysts to capture precise measures such as quantity, unit price, discounts, and total amount. This fine-grained approach ensures flexibility, as higher-level summaries (e.g., monthly totals or category-level sales) can be derived through aggregation, while still retaining the ability to drill down into individual transactions when needed.

Surrogate keys are used instead of natural keys to maintain consistency and efficiency across dimensions. Natural keys such as product names or customer emails may change over time, contain duplicates, or lack uniform formatting. Surrogate keys provide stable, unique identifiers that simplify joins between fact and dimension tables, ensuring data integrity and avoiding dependency on volatile business attributes.

This design supports drill-down and roll-up operations by enabling analysts to navigate seamlessly between detailed transaction data and aggregated views. For example, sales can be rolled up by month, quarter, or year using the date dimension, or drilled down by product category, brand, or customer segment. This flexibility makes the schema highly effective for both strategic reporting and operational analysis.
