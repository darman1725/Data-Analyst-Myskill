-- UNION
SELECT * FROM vendor_1
UNION
SELECT * FROM vendor_2
--- UNION tidak mengijinkan yang mana datanya duplicated nya seluruh kolom yang distate

-- contoh lagi
SELECT vendor_id, vendor_name FROM vendor_1
UNION 
SELECT vendor_id, vendor_name FROM vendor_2

-- UNION ALL
SELECT * FROM vendor_1
UNION ALL
SELECT * FROM vendor_2

--
SELECT vendor_id, vendor_name FROM vendor_1
UNION ALL
SELECT vendor_id, vendor_name FROM vendor_2


-- EXTRACT TIMESTAMP
-- EXTRACT YEAR
SELECT * FROM sales

--
SELECT EXTRACT(YEAR FROM purchase_date) AS tahun 
FROM sales

-- contoh lagi
-- EXTRACT YEAR, MONTH, DAY
SELECT  user_id,
        product_name,
        quantity,
        purchase_date,
        EXTRACT(YEAR FROM purchase_date) AS tahun,
        EXTRACT(MONTH FROM purchase_date) AS bulan,
        EXTRACT(DAY FROM purchase_date) AS hari
FROM sales

-- DATEPART
SELECT first_name ||' '|| last_name AS full_name,
       hire_date,
       CURRENT_DATE,
       DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', hire_date) AS lama_bekerja
FROM employees       

-- contoh lagi
SELECT first_name ||' '|| last_name AS full_name,
       hire_date,
       CURRENT_DATE,
       DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', hire_date) AS lama_bekerja
FROM employees  
ORDER BY lama_bekerja DESC 
LIMIT 10

--
SELECT LEFT(first_name, 3) FROM employees

--
SELECT first_name ||' '|| last_name AS full_name,
        department,
       hire_date,
       CURRENT_DATE,
       DATE_PART('YEAR', CURRENT_DATE) - DATE_PART('YEAR', hire_date) AS lama_bekerja
FROM employees 
WHERE department = 'Data Analyst'
ORDER BY lama_bekerja DESC 

-- CASE

SELECT first_name ||' '|| last_name AS full_name,
       salary_2020,
       department,
       CASE WHEN salary_2020 < 4000 THEN 'LOWER'
            WHEN salary_2020 BETWEEN 4000 AND 7000 THEN 'MIDDLE'
            ELSE 'HIGHER'
       END AS salary_category
FROM employees

--
SELECT first_name ||' '|| last_name AS full_name,
       salary_2020,
       salary_2021,
       department,
       CASE WHEN salary_2020 < 4000 THEN 'LOWER'
            WHEN salary_2020 BETWEEN 4000 AND 7000 THEN 'MIDDLE'
            ELSE 'HIGHER'
       END AS salary_category_2020,
       CASE WHEN salary_2021 < 4000 THEN 'LOWER'
            WHEN salary_2021 BETWEEN 4000 AND 7000 THEN 'MIDDLE'
            ELSE 'HIGHER'
       END AS salary_category_2021
FROM employees

-- contoh lagi
SELECT salary_category_2020,
       COUNT(salary_category_2020) FROM  (
SELECT first_name ||' '|| last_name AS full_name,
       salary_2020,
       department,
       CASE WHEN salary_2020 < 4000 THEN 'LOWER'
            WHEN salary_2020 BETWEEN 4000 AND 7000 THEN 'MIDDLE'
            ELSE 'HIGHER'
       END AS salary_category_2020
FROM employees) AS tabel_a
GROUP BY salary_category_2020

-- SUBQUERY
CREATE TABLE region (
  store_city_id int,
  region varchar(255),
  primary key (store_city_id)
);

INSERT INTO region (store_city_id,region)
VALUES
  (1,'Sumatera'),
  (2,'Yogyakarta'),
  (3,'Jawa Timur'),
  (4,'Sulawesi'),
  (5,'Bali'),
  (6,'Jawa Barat'),
  (7,'Kalimantan'),
  (8,'Jawa Tengah'),
  (9,'Bandung'),
  (10,'Jakarta');
  
--SUBQUERY DALAM KLAUSA WHERE
SELECT * FROM region

--
SELECT * FROM employees
WHERE store_city_id IN (SELECT store_city_id FROM region
                        WHERE region IN ('Yogyakarta','Bali'))

-- SUBQUERY DALAM FROM
SELECT * FROM (SELECT * FROM sales
              WHERE product_name IN ('Apel','Pisang')) AS tabel_a

-- dengan menggunakan data sales coba lakukan query yang mengembalikan record
-- total pendapatan di pulau jawa dan luar jawa, clue nya adalah kategorikan terlebih dahulu provinsinya berdasarkan pulaunya

SELECT 
CASE WHEN store_city_id IN (SELECT store_city_id FROM region
                           WHERE region IN('Yogyakarta','Jawa Timur','Jawa Barat','Jakarta','Bandung','Jawa Tengah')) THEN 'JAWA'
     ELSE 'LUAR_JAWA'
END AS pulau,
SUM(quantity*price_per_kg) AS total_pendapatan
FROM sales
GROUP BY pulau

-- WITH
WITH total_pendapatan_perbuah AS (
SELECT product_name,
       store_city_id,
       SUM(quantity*price_per_kg) as total_pendapatan
FROM sales
GROUP BY product_name, store_city_id
ORDER BY store_city_id),

avg_amount_per_region AS (SELECT store_city_id,
                         ROUND(AVG(total_pendapatan)) AS avg_total
FROM total_pendapatan_perbuah
GROUP BY store_city_id)

SELECT * FROM avg_amount_per_region
WHERE store_city_id IN (1,2,3)

-- contoh lagi
WITH table_a AS (
    SELECT product_name, 
       store_city_id,
       SUM(quantity*price_per_kg) as total 
FROM sales
WHERE purchase_date BETWEEN '2021-01-01' AND '2021-12-31' 
GROUP BY product_name, store_city_id 
ORDER BY store_city_id
),

avg_amount_per_region AS (SELECT store_city_id,
                          ROUND(AVG(total),2) AS avg_total
FROM table_a
GROUP BY store_city_id)

SELECT rg.region, avg_amount.avg_total 
FROM avg_amount_per_region AS avg_amount
LEFT JOIN region AS rg
ON avg_amount.store_city_id = rg.store_city_id
WHERE region IN ('Yogyakarta','Sulawesi')
