-- Import data sales

/* FILTERING WHERE */

-- Menampilkan data tabel sales
SELECT * FROM sales;

-- Menampilkan data dengan perintah where price_per_kg >= 10000
SELECT * FROM sales
WHERE price_per_kg >= 10000;

-- Menampilkan data dengan perintah where price_per_kg >= 10000 sesuai variabel yang diinginkan
SELECT product_name, 
purchase_date 
FROM sales 
WHERE price_per_kg >= 10000;

-- Menampilkan data dengan perintah where price_per_kg >= 10000 dengan perpaduan AND variabel lain
SELECT * FROM sales
WHERE price_per_kg >= 10000
AND product_name = 'Melon';

/* FILTERING AND */

-- Menampilkan data dengan price_per_kg > 10000 dan store_city < 5
-- AND = sifatnya tidak mengikat
SELECT * FROM sales
WHERE price_per_kg > 10000
AND store_city_id < 5;

-- OR  = Tidak mengikat dan bisa memilih salah satu
SELECT * FROM sales
WHERE price_per_kg > 10000
OR product_name = 'Melon';

-- Contoh menampilkan data dengan perintah OR lebih dari satu
SELECT * FROM sales
WHERE product_name = 'Nanas'
OR product_name = 'Apel'
OR product_name = 'Pisang';

-- Ambil data produk dengan nama jeruk atau mangga dengan id = 4 
SELECT * FROM sales
WHERE (product_name = 'Jeruk' OR product_name = 'Mangga') 
AND store_city_id = 4;

-- Menggunakan fungsi NOT (Mengecualikan sebuah data/tanpa data itu)
SELECT * FROM sales
WHERE NOT product_name = 'Mangga';

-- Menggunakan versi notasi <> (Mengecualikan sebuah data/tanpa data itu)
SELECT * FROM sales
WHERE product_name <> 'Mangga';

-- Menggunakan versi notasi != (Mengecualikan sebuah data/tanpa data itu)
SELECT * FROM sales
WHERE product_name != 'Mangga';

-- Menggunakan fungsi IN untuk menampilkan data sesuai yang diinginkan
SELECT * FROM sales
WHERE product_name 
IN ('Jeruk','Nanas','Apel','Pisang');

-- Menggunakan fungsi IN untuk menampilkan data sesuai yang diinginkan
SELECT * FROM sales
WHERE store_city_id
IN (1,2,3,4);

-- Menggunakan fungsi NOT IN
SELECT * FROM sales
WHERE product_name 
NOT IN ('Jeruk','Nanas','Apel','Pisang');

-- Menggabungkan IN dan NOT IN
SELECT * FROM sales
WHERE product_name NOT IN ('Jeruk','Mangga','Apel','Pepaya')
AND store_city_id IN (5,6,7);

/* IS NULL & NULL */

-- IS NULL
-- Melihat/menguji data kosong atau tidak (Tabel Sales)
SELECT * FROM sales
WHERE product_name IS NULL;

-- Melihat/menguji data kosong atau tidak (Tabel Employees)
SELECT * FROM employees
WHERE email IS NULL;

-- IS NOT NULL
SELECT * FROM employees
WHERE email IS NOT NULL
AND first_name IS NOT NULL;