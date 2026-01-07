USE fleximart_dw;
-- =========================
-- DIM_DATE (30 rows: Jan–Feb 2024)
-- =========================
INSERT INTO dim_date (date_key, full_date, day_of_week, day_of_month, month, month_name, quarter, year, is_weekend) VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,FALSE),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,FALSE),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,FALSE),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,FALSE),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,FALSE),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,TRUE),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,TRUE),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,FALSE),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,FALSE),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,FALSE),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,FALSE),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,FALSE),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,TRUE),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,TRUE),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,FALSE),
(20240116,'2024-01-16','Tuesday',16,1,'January','Q1',2024,FALSE),
(20240117,'2024-01-17','Wednesday',17,1,'January','Q1',2024,FALSE),
(20240118,'2024-01-18','Thursday',18,1,'January','Q1',2024,FALSE),
(20240119,'2024-01-19','Friday',19,1,'January','Q1',2024,FALSE),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,TRUE),
(20240121,'2024-01-21','Sunday',21,1,'January','Q1',2024,TRUE),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,FALSE),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,FALSE),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,TRUE),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,TRUE),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,FALSE),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,FALSE),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,FALSE),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,FALSE),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,FALSE);

-- =========================
-- DIM_PRODUCT (15 rows, 3 categories)
-- =========================
INSERT INTO dim_product (product_id, product_name, category, subcategory, unit_price) VALUES
('P001','iPhone 14','Electronics','Mobile',80000.00),
('P002','Samsung TV','Electronics','Television',45000.00),
('P003','Dell Laptop','Electronics','Laptop',60000.00),
('P004','Bluetooth Speaker','Electronics','Audio',3000.00),
('P005','LED Bulb','Electronics','Lighting',150.00),
('P006','Apples 1kg','Groceries','Fruit',120.00),
('P007','Basmati Rice 5kg','Groceries','Grain',500.00),
('P008','Chocolate Pack','Groceries','Snack',250.00),
('P009','Milk 1L','Groceries','Dairy',60.00),
('P010','Dining Table','Furniture','Table',12000.00),
('P011','Office Chair','Furniture','Chair',7000.00),
('P012','Bookshelf','Furniture','Storage',9000.00),
('P013','Sofa Set','Furniture','Seating',35000.00),
('P014','Curtains Set','Furniture','Decor',2000.00),
('P015','Mattress','Furniture','Bedding',15000.00);

-- =========================
-- DIM_CUSTOMER (12 rows, 4 cities)
-- =========================
INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Pravin Kumar','Pune','Maharashtra','Retail'),
('C002','Anita Sharma','Mumbai','Maharashtra','Corporate'),
('C003','Rahul Mehta','Delhi','Delhi','Consumer'),
('C004','Sneha Rao','Bangalore','Karnataka','Small Business'),
('C005','Vikram Joshi','Pune','Maharashtra','Retail'),
('C006','Neha Verma','Mumbai','Maharashtra','Corporate'),
('C007','Amit Singh','Delhi','Delhi','Consumer'),
('C008','Kavita Nair','Bangalore','Karnataka','Small Business'),
('C009','Rohan Desai','Pune','Maharashtra','Retail'),
('C010','Meera Iyer','Mumbai','Maharashtra','Corporate'),
('C011','Siddharth Jain','Delhi','Delhi','Consumer'),
('C012','Divya Pillai','Bangalore','Karnataka','Small Business');

INSERT INTO dim_date (date_key, full_date, day_of_week, day_of_month, month, month_name, quarter, year, is_weekend) VALUES
(20240122,'2024-01-22','Monday',22,1,'January','Q1',2024,FALSE),
(20240123,'2024-01-23','Tuesday',23,1,'January','Q1',2024,FALSE),
(20240124,'2024-01-24','Wednesday',24,1,'January','Q1',2024,FALSE),
(20240125,'2024-01-25','Thursday',25,1,'January','Q1',2024,FALSE),
(20240126,'2024-01-26','Friday',26,1,'January','Q1',2024,FALSE),
(20240127,'2024-01-27','Saturday',27,1,'January','Q1',2024,TRUE),
(20240128,'2024-01-28','Sunday',28,1,'January','Q1',2024,TRUE),
(20240129,'2024-01-29','Monday',29,1,'January','Q1',2024,FALSE),
(20240130,'2024-01-30','Tuesday',30,1,'January','Q1',2024,FALSE),
(20240131,'2024-01-31','Wednesday',31,1,'January','Q1',2024,FALSE);	


-- =========================
-- FACT_SALES
-- =========================
INSERT INTO fact_sales (date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount) VALUES
(20240101, 1, 1, 1, 80000.00, 0.00, 80000.00),
(20240102, 2, 2, 2, 45000.00, 2000.00, 88000.00),
(20240103, 3, 3, 1, 60000.00, 5000.00, 55000.00),
(20240104, 4, 4, 3, 3000.00, 0.00, 9000.00),
(20240105, 5, 5, 10, 150.00, 100.00, 1400.00),
(20240106, 6, 6, 5, 120.00, 0.00, 600.00),
(20240107, 7, 7, 3, 500.00, 50.00, 1450.00),
(20240108, 8, 8, 4, 250.00, 0.00, 1000.00),
(20240109, 9, 9, 6, 60.00, 0.00, 360.00),
(20240110, 10, 10, 1, 12000.00, 1000.00, 11000.00),
(20240111, 11, 11, 2, 7000.00, 500.00, 13500.00),
(20240112, 12, 12, 1, 9000.00, 0.00, 9000.00),
(20240113, 13, 1, 1, 35000.00, 2000.00, 33000.00),
(20240114, 14, 2, 2, 2000.00, 200.00, 3800.00),
(20240115, 15, 3, 1, 15000.00, 1000.00, 14000.00),
(20240116, 1, 4, 2, 80000.00, 5000.00, 155000.00),
(20240117, 2, 5, 1, 45000.00, 0.00, 45000.00),
(20240118, 3, 6, 2, 60000.00, 5000.00, 115000.00),
(20240119, 4, 7, 1, 3000.00, 0.00, 3000.00),
(20240120, 5, 8, 8, 150.00, 0.00, 1200.00),
(20240121, 6, 9, 6, 120.00, 0.00, 720.00),
(20240201, 7, 10, 2, 500.00, 50.00, 950.00),
(20240202, 8, 11, 5, 250.00, 0.00, 1250.00),
(20240203, 9, 12, 10, 60.00, 0.00, 600.00),
(20240204, 10, 1, 1, 12000.00, 500.00, 11500.00),
(20240205, 11, 2, 1, 7000.00, 0.00, 7000.00),
(20240206, 12, 3, 2, 9000.00, 500.00, 17500.00),
(20240207, 13, 4, 1, 35000.00, 0.00, 35000.00),
(20240208, 14, 5, 3, 2000.00, 200.00, 5800.00),
(20240209, 15, 6, 1, 15000.00, 1000.00, 14000.00),
(20240101, 2, 7, 1, 45000.00, 0.00, 45000.00),
(20240102, 3, 8, 2, 60000.00, 5000.00, 115000.00),
(20240103, 4, 9, 1, 3000.00, 0.00, 3000.00),
(20240104, 5, 10, 6, 150.00, 0.00, 900.00),
(20240105, 6, 11, 4, 120.00, 0.00, 480.00),
(20240106, 7, 12, 2, 500.00, 0.00, 1000.00),
(20240107, 8, 1, 3, 250.00, 0.00, 750.00),
(20240108, 9, 2, 5, 60.00, 0.00, 300.00),
(20240109, 10, 3, 1, 12000.00, 1000.00, 11000.00);