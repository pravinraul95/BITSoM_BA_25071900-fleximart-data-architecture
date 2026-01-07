import pandas as pd

# ---------- Customers ----------
customers = pd.read_csv("customers_raw.csv")

# 1. Remove duplicate records (based on email)
customers = customers.drop_duplicates(subset=["email"])

# 2. Handle missing values (drop rows with missing email)
customers = customers[customers["email"].notna() & (customers["email"] != "")]

# 3. Standardize phone formats
def clean_phone(phone):
    digits = "".join([c for c in str(phone) if c.isdigit()])
    return f"+91-{digits[-10:]}" if len(digits) >= 10 else None

customers["phone"] = customers["phone"].apply(clean_phone)

# 4. Convert date formats to YYYY-MM-DD
customers["registration_date"] = pd.to_datetime(
    customers["registration_date"], errors="coerce"
).dt.strftime("%Y-%m-%d")

# 5. Add surrogate keys (auto-incrementing IDs)
if "customer_id" not in customers.columns:
    customers.insert(0, "customer_id", range(1, len(customers) + 1))    

# Save cleaned file
customers.to_csv("customers_clean.csv", index=False)
print("✅ customers_clean.csv created")

# ---------- Products ----------
products = pd.read_csv("products_raw.csv")

# 1. Remove duplicate records
products = products.drop_duplicates(subset=["product_name", "category"])

# 2. Handle missing values (fill price/stock with 0)
products["price"] = products["price"].fillna(0).astype(float)
products["stock_quantity"] = products["stock_quantity"].fillna(0).astype(int)

# 3. Standardize category names
products["category"] = products["category"].str.strip().str.capitalize()

# 4. Add surrogate keys
if "product_id" not in products.columns:
    products.insert(0, "product_id", range(1, len(products) + 1))

# Save cleaned file
products.to_csv("products_clean.csv", index=False)
print("✅ products_clean.csv created")

# ---------- Sales ----------
sales = pd.read_csv("sales_raw.csv")

# 1. Remove duplicate records
sales = sales.drop_duplicates(subset=["transaction_id"])

# 2. Handle missing values (drop rows with missing customer_id or product_id)
sales = sales[sales["customer_id"].notna() & sales["product_id"].notna()]

# 3. Convert date formats
sales["transaction_date"] = pd.to_datetime(
    sales["transaction_date"], errors="coerce"
).dt.strftime("%Y-%m-%d")

# 4. Add surrogate keys
if "order_id" not in sales.columns:
    sales.insert(0, "order_id", range(1, len(sales) + 1))


# Save cleaned file
sales.to_csv("sales_clean.csv", index=False)
print("✅ sales_clean.csv created")