-- Perintah BEETWEEN --
SELECT * FROM employees
WHERE hire_date BETWEEN '2019-01-01' AND '2020-01-01';

-- Contoh tentang between lagi
SELECT first_name FROM employees
WHERE salary_2020 BETWEEN 5000 AND 9000;

-- Contoh tentang between lagi
SELECT first_name FROM employees
WHERE salary_2020 >= 5000 AND salary_2020 <= 9000;

-- Perintah DELETE --
-- Single Record
DELETE FROM sales
WHERE product_name = 'Mangga';

-- Menampilkan tabel sales
SELECT * FROM sales
WHERE product_name = 'Mangga';

-- Delete All Record
DELETE FROM sales;

-- ## PATERN MATCHING ## --

-- LIKE
-- Mencari pola yang berawalan dari kata tertentu
SELECT * FROM employees
WHERE first_name LIKE 'Be%';

-- Mencari pola yang berakhiran kata tertentu
SELECT * FROM employees
WHERE first_name LIKE '%on';

-- Mencari pola yang mengandung karakter tersebut
SELECT * FROM employees
WHERE first_name LIKE '%al%';

-- Contoh lagi jika 2 kondisi kolom
SELECT * FROM employees
WHERE first_name LIKE '%al%'
AND last_name LIKE '%di%';

-- Contoh 3 karakter
SELECT * FROM employees
WHERE first_name LIKE 'Wi___%';

-- ORDER BY
-- Secara default adalah ASC (Ascending)
-- Pengurutan dari rendah ke tertinggi
SELECT * FROM employees
ORDER BY employee_id ASC;

-- ORDER BY DESC
-- Pengurutan dari tertinggi ke rendah
SELECT * FROM employees
ORDER BY employee_id DESC;

-- Contoh lagi
SELECT * FROM employees
ORDER BY store_city_id, first_name;

-- Kolaborasi Order by ASC & DESC
SELECT * FROM employees
ORDER BY store_city_id ASC, first_name DESC;

-- Perintah Limit 

-- Mengambil 10 data teratas
SELECT * FROM employees
LIMIT 10;

-- Mengambil 10 data terakhir
SELECT * FROM employees
ORDER BY employee_id
DESC LIMIT 10;

-- SELECT DISTINCT 
-- Mengambil nilai unique
SELECT DISTINCT product_name
FROM sales;

-- Contoh lagi
SELECT DISTINCT product_name
FROM sales
WHERE purchase_date > '2022-12-01'

-- Penggunaan offset
-- Digunakan untuk skip data sesuai dengan jumlah kondisinya
SELECT * FROM employees
OFFSET 5;

-- PREFIX
-- TABLE A --> employees_A
-- TABLE B --> employees_B
-- kolom yang sama antara dua tabel adalah kolom email
SELECT first_name,
employees_A.email
FROM employees_A
LEFT JOIN employees_B
ON employees_B.employee_id = employees_A.employee_id

-- ALIAS
-- Sifatnya sementara, data asli tidak terhapus
SELECT first_name AS nama_depan,
last_name AS nama_belakang
FROM employees;

-- ## Fungsi Agregat ## --
-- MIN()
SELECT MIN(salary_2020) AS min_salary_2020 
FROM employees;

-- MAX()
SELECT MAX(salary_2020) AS max_salary_2020 
FROM employees;

-- AVG()
SELECT AVG(salary_2020) AS avg_salary_2020 
FROM employees;

-- Contoh pembulatan (1 artinya dibelakang koma)
SELECT ROUND(AVG(salary_2020),1) AS round_salary_2020 
FROM employees;

-- SUM()
SELECT SUM(salary_2020) AS total_salary_2020 
FROM employees;

-- COUNT()
-- Menghitung semua kolom
SELECT COUNT(*) FROM employees;

-- Menghitung satu kolom
SELECT COUNT(first_name) FROM employees;

-- Menghitung banyak data yang tidak duplikat
SELECT COUNT(DISTINCT (product_name)) AS jumlah_product FROM sales;
