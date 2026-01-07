# NoSQL Justification Report for FlexiMart

## Section A: Limitations of RDBMS (≈150 words)

Relational databases like MySQL are built on rigid schemas, which makes them difficult to adapt when product attributes vary widely. For example, laptops may require fields such as RAM and processor, while shoes need size and color. In an RDBMS, this often leads to either many nullable columns or separate tables for each product type, creating complexity and inefficiency. Frequent schema changes, such as adding new product categories, require altering table structures, which is time‑consuming and risks breaking existing queries. Storing customer reviews as nested data is also problematic, since RDBMS requires separate tables and foreign keys to represent hierarchical relationships. This results in complex joins and slower queries. Overall, the relational model struggles with heterogeneous product data, frequent schema evolution, and hierarchical structures like reviews, making it less suitable for FlexiMart’s expanding catalog.

---

## Section B: NoSQL Benefits (≈150 words)

MongoDB, a document‑oriented NoSQL database, provides a flexible schema that allows each product to store attributes relevant to its type. For example, a laptop document can include RAM and processor fields, while a shoe document can include size and color, all within the same collection. This eliminates the need for rigid schemas and frequent table alterations. MongoDB also supports embedded documents, meaning customer reviews can be stored directly inside the product document. This simplifies queries, reduces the need for joins, and improves performance. Furthermore, MongoDB offers horizontal scalability through sharding, allowing large volumes of diverse product data to be distributed across multiple servers. This ensures high availability and efficient handling of growth. These features make MongoDB well‑suited for FlexiMart’s evolving catalog, as it supports flexibility, nested structures, and scalability without the limitations of traditional relational databases.

---

## Section C: Trade‑offs (≈100 words)

Despite its advantages, MongoDB has trade‑offs compared to MySQL. First, it provides weaker ACID guarantees for multi‑document transactions, which can lead to data consistency issues in complex operations. Second, its query language and indexing are less optimized for relational joins and advanced analytics, making it less suitable for scenarios requiring complex reporting. Additionally, MongoDB may require more careful design to avoid data duplication, since denormalization is common in document databases. These limitations mean MongoDB should complement, rather than fully replace, MySQL — serving best for flexible product catalogs, while MySQL remains strong for transactional consistency and structured reporting.