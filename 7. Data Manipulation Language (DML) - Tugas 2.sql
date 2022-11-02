/* Menampilkan data tabel sales */
SELECT * FROM sales;

-- Soal 
-- 1. Dengan menggunakan data sales lakukan query yang mengembalikan/menampilkan record:
-- a. Data hasil penjualan buah di store 3, 4 dan 5 dimana produk buah yang memiliki harga per kg di atas 11000
SELECT * FROM sales
WHERE store_city_id IN(3,4,5)
AND price_per_kg > 11000;

-- b. Data hasil penjualan buah setelah hari raya Idul Fitri tahun 2022(boleh 17 Agustus 2022)
SELECT product_name, 
purchase_date, 
(quantity * price_per_kg) as sales_result
FROM sales
WHERE purchase_date > '2022-05-02'
ORDER BY purchase_date;

-- c. Data hasil penjualan buah Melon serta Jeruk disemua store kecuali store 1,6,7  
SELECT * 
FROM sales
WHERE product_name IN ('Melon','Jeruk')
AND store_city_id NOT IN (1,6,7)

-- 2. Dengan menggunakan data employees_data lakukanlah query yang mengembalikan/menampilkan record

/* Menampilkan data tabel employees */
SELECT * FROM employees;

-- a. Tampilkan data karyawan beserta gajinya di tahun 2021
SELECT employee_id,
CONCAT(first_name,(' '||last_name)) AS full_name,
salary_2021
FROM employees
ORDER BY employee_id;

-- b. Tampilkan nama-nama karyawan yang bekerja di store 3,4,7 dan bergaji diatas $5000 di tahun 2022
SELECT employee_id,
CONCAT(first_name,(' '||last_name)) AS full_name
FROM employees
WHERE store_city_id IN(3,4,7) AND 
salary_2022 > 5000;
