import pandas as pd

# ---------- Customers ----------
customers = pd.read_csv("customers_raw.csv")

# 1. Remove duplicate records (based on email)
customers_clean = customers.drop_duplicates(subset=["email"])

# 2. Handle missing values (drop rows with missing email)
customers_clean = customers_clean[customers_clean["email"].notna() & (customers_clean["email"] != "")]

# 3. Standardize phone formats
def clean_phone(phone):
    digits = "".join([c for c in str(phone) if c.isdigit()])
    return f"+91-{digits[-10:]}" if len(digits) >= 10 else None

customers_clean["phone"] = customers_clean["phone"].apply(clean_phone)

# 4. Convert date formats to YYYY-MM-DD
customers_clean["registration_date"] = pd.to_datetime(
    customers_clean["registration_date"], errors="coerce"
).dt.strftime("%Y-%m-%d")

# 5. Add surrogate keys (auto-incrementing IDs)
if "customer_id" not in customers_clean.columns:
    customers_clean.insert(0, "customer_id", range(1, len(customers_clean) + 1))    

# Save cleaned file
customers_clean.to_csv("customers_clean.csv", index=False)
print("✅ customers_clean.csv created")

# ---------- Products ----------
products = pd.read_csv("products_raw.csv")

# 1. Remove duplicate records
products_clean = products.drop_duplicates(subset=["product_name", "category"])

# 2. Handle missing values (fill price/stock with 0)
products_clean["price"] = products_clean["price"].fillna(0).astype(float)
products_clean["stock_quantity"] = products_clean["stock_quantity"].fillna(0).astype(int)

# 3. Standardize category names
products_clean["category"] = products_clean["category"].str.strip().str.capitalize()

# 4. Add surrogate keys
if "product_id" not in products_clean.columns:
    products_clean.insert(0, "product_id", range(1, len(products_clean) + 1))

# Save cleaned file
products_clean.to_csv("products_clean.csv", index=False)
print("✅ products_clean.csv created")

# ---------- Sales ----------
sales = pd.read_csv("sales_raw.csv")

# 1. Remove duplicate records
sales_clean = sales.drop_duplicates(subset=["transaction_id"])

# 2. Handle missing values (drop rows with missing customer_id or product_id)
sales_clean = sales_clean[sales_clean["customer_id"].notna() & sales_clean["product_id"].notna()]

# 3. Convert date formats
sales_clean["transaction_date"] = pd.to_datetime(
    sales_clean["transaction_date"], errors="coerce"
).dt.strftime("%Y-%m-%d")

# 4. Add surrogate keys
if "order_id" not in sales_clean.columns:
    sales_clean.insert(0, "order_id", range(1, len(sales_clean) + 1))

# Save cleaned file
sales_clean.to_csv("sales_clean.csv", index=False)
print("✅ sales_clean.csv created")

# ---------- Data Quality Report ----------
with open("data_quality_report.txt", "w", encoding="utf-8") as f:
    f.write("✔ customers_clean.csv created\n")
    f.write("✔ products_clean.csv created\n")
    f.write("✔ sales_clean.csv created\n")

    f.write("\nMissing Values:\n")
    f.write(str(customers_clean.isnull().sum()) + "\n")
    f.write(str(products_clean.isnull().sum()) + "\n")
    f.write(str(sales_clean.isnull().sum()) + "\n")

    f.write("\nDuplicate Rows:\n")
    f.write(f"customers: {customers_clean.duplicated().sum()} duplicates\n")
    f.write(f"products: {products_clean.duplicated().sum()} duplicates\n")
    f.write(f"sales: {sales_clean.duplicated().sum()} duplicates\n")