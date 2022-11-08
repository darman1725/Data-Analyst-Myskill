-- Menampilkan data employees
SELECT * FROM employees;

-- REPLACE
SELECT department,
REPLACE(department, 'Human Resources', 'HRD') AS modified_department
FROM employees;

-- POSITION
SELECT email,POSITION('@' IN email)
FROM employees;

-- SUBSTRING
SELECT SUBSTRING ('This is test data' FROM 5)

-- Coba data employees
SELECT first_name,
SUBSTRING (first_name,5,4)
FROM employees;

-- POSITION + SUBSTRING
-- PAKAI @
SELECT email,
	SUBSTRING(email, POSITION('@' IN email)) AS domain_email
FROM employees;

-- Tanpa @
SELECT email,
	SUBSTRING(email, POSITION('@' IN email)+1) AS domain_email
FROM employees;

-- COALESE
-- Mengganti nilai null yang ada disebuah kolom
SELECT email,
COALESCE(email,'NONE')
FROM employees;

-- LOWER
SELECT first_name,
LOWER(first_name) AS lower_case 
FROM employees;

-- UPPER
SELECT first_name,
UPPER(first_name) AS lower_case
FROM employees;

-- LENGTH
SELECT last_name,
LENGTH(last_name) AS length
FROM employees;

-- CONCAT
SELECT CONCAT(first_name,(' '||last_name)) as nama_lengkap
FROM employees;

-- GROUP BY
SELECT product_name, 
SUM(quantity) AS total_quantity
FROM SALES
GROUP BY product_name;

-- Contoh lagi
SELECT product_name, 
store_city_id,
SUM(quantity) AS total_quantity
FROM SALES
GROUP BY product_name,store_city_id;

-- Contoh lagi
SELECT product_name, 
AVG(quantity) AS total_quantity
FROM SALES
GROUP BY product_name,store_city_id;

-- Contoh lagi
SELECT product_name, 
SUM(quantity) AS total_quantity
FROM SALES
WHERE store_city_id IN(1,2,3)
GROUP BY product_name;

-- Contoh lagi
SELECT product_name, 
SUM(quantity) AS total_quantity
FROM SALES
WHERE store_city_id IN(1,2,3)
GROUP BY product_name
ORDER BY product_name;

-- Contoh lagi
SELECT product_name, 
store_city_id,
SUM(quantity) AS total_quantity
FROM SALES
WHERE store_city_id IN(1,2,3)
GROUP BY product_name, store_city_id
ORDER BY product_name;

-- Mencari total pendapatan berdasarkan tgl 1-30 januari 2021
SELECT product_name,
SUM(quantity*price_per_kg) as total_pendapatan
FROM sales
WHERE purchase_date BETWEEN '2021-01-01' AND '2021-01-31'
GROUP BY product_name;

-- ## IMPORT DARI FILE SQL## --

-- Membuat tabel store data
CREATE TABLE store_data (
    row_id int,
    order_id varchar(255),
    order_date date,
    ship_date date,
    ship_mode varchar(255),
    customer_id varchar(255),
    product_id varchar(255),
    sales double precision,
    discount double precision,
    primary key(row_id, order_id, customer_id, product_id);
)

-- Menampilkan tabel store_data
SELECT * FROM store_data;

-- Antisipasi atur bin path saat import jika error
-- Click Files -> preferences -> Binary path
-- ProgresSQL Binary path: c:\Program Files\PosgresSQL\13\bin

-- ## IMPORT DARI FILE SQL## --

-- Membuat tabel master_product
CREATE TABLE master_product (
    product_id varchar(255),
    category varchar(255),
    sub_category varchar(255),
    product_name varchar(255),
    primary key (product_id);
)

-- Menampilkan tabel master_product
SELECT * FROM master_product;

-- ## IMPORT DARI FILE SQL## --

-- Membuat tabel master_customer
CREATE TABLE master_customer (
    customer_id varchar(255),
    customer_name varchar(255),
    segment varchar(255),
    country varchar(255),
    city varchar(255),
    state varchar(255),
    postal_code varchar(255),
    region varchar(255),
    age int,
    primary key (customer_id);
)

-- Menampilkan tabel master_customer
SELECT * FROM master_customer;

-- Menampilkan data hasil dari import
SELECT * FROM store_data;
SELECT * FROM master_product;
SELECT * FROM master_customer;

-- ## LEFT JOIN ## --

-- Menggabungkan seluruh berada yang ditabel kiri dan kanan
SELECT * FROM store_data
LEFT JOIN master_product
ON store_data.product_id = master_product.product_id;

-- Pakai AS dibelakang
SELECT * FROM store_data AS sd
LEFT JOIN master_product AS mp
ON sd.product_id = mp.product_id;

-- Pakai AS didepan
SELECT sd.product_id,
mp.product_name
FROM store_data AS sd
LEFT JOIN master_product AS mp
ON sd.product_id = mp.product_id;

-- Menampilkan nama nama customer beserta salesnya
SELECT sd.customer_id,
mc.customer_name,
sales
FROM store_data AS sd
LEFT JOIN master_customer AS mc
ON sd.customer_id = mc.customer_id;

-- Contoh lagi
SELECT sd.customer_id,
mc.customer_name,
sales
FROM store_data AS sd
LEFT JOIN master_customer AS mc
ON sd.customer_id = mc.customer_id
WHERE sales > 200000;

-- Contoh lagi
SELECT sd.customer_id,
mc.customer_name,
sales
FROM store_data AS sd
LEFT JOIN master_customer AS mc
ON sd.customer_id = mc.customer_id
WHERE sales > 200000
ORDER BY sales DESC;

-- ## RIGHT JOIN ## --
SELECT * FROM master_customer
RIGHT JOIN store_data
ON master_customer.customer_id = store_data.customer_id;

-- Contoh lagi
SELECT sd.customer_id,
customer_name,
age
FROM master_customer AS mc
RIGHT JOIN store_data AS sd
ON mc.customer_id = sd.customer_id
WHERE order_date > '201-01-01';

-- INNER JOIN

-- Membuat tabel vendor 1
CREATE TABLE vendor_1 (
vendor_id int,
vendor_name varchar(255),
vendor_type varchar(255),
region varchar(255),
cooperation_date date,
primary key (vendor_id)
);

-- Menambahkan data ke tabel vendor 1
INSERT INTO vendor_1 VALUES
(1, 'HQ', 'Packaging', 1, '2021-01-01'),
(2, 'STP', 'Packaging', 1, '2021-05-08'),
(3, 'PackaNew', 'Packaging', 1, '2022-01-01');

-- Menampilkan tabel vendor 1
SELECT * FROM vendor_1;

-- Membuat tabel vendor 2
CREATE TABLE vendor_2 (
vendor_id int,
vendor_name varchar(255),
vendor_type varchar(255),
region varchar(255),
cooperation_date date,
primary key (vendor_id)
);

-- Menambahkan data ke tabel vendor 2
INSERT INTO vendor_2 VALUES
(3, 'PackaNew', 'Ekspedisi', 1, '2022-03-01'),
(4, 'Herlin', 'Ekspedisi', 2, '2021-03-01'),
(5, 'Mota', 'Ekspedisi', 5, '2022-04-01');

-- Menampilkan tabel vendor 2
SELECT * FROM vendor_2;

-- Konsep INNER JOIN
SELECT vendor_1.vendor_id,
vendor_2.vendor_id,
vendor_1.vendor_type
FROM vendor_1
INNER JOIN vendor_2
ON vendor_1.vendor_id=vendor_2.vendor_id;

-- Contoh lagi
SELECT vendor_1.vendor_id,
vendor_2.vendor_name,
vendor_1.vendor_type
FROM vendor_1
INNER JOIN vendor_2
ON vendor_1.vendor_id=vendor_2.vendor_id;

-- HAVING CLAUSE
SELECT product_name,
store_city_id,
SUM(quantity) AS total_qty
FROM sales
GROUP BY product_name, store_city_id
HAVING SUM(quantity) > 50;

-- Contoh lagi
SELECT product_name,
store_city_id,
SUM(quantity) AS total_qty
FROM sales
GROUP BY product_name, store_city_id
ORDER BY SUM(quantity) DESC
LIMIT 1;

-- Perbedaan dalam konteks string
SELECT product_name,
store_city_id,
SUM(quantity) AS total_qty
FROM sales
GROUP BY product_name, store_city_id
HAVING product_name IN ('Jeruk','Melon');

-- Contoh lagi
SELECT product_name,
store_city_id,
SUM(quantity) AS total_qty
FROM sales
WHERE product_name IN ('Jeruk','Melon')
GROUP BY product_name, store_city_id;
