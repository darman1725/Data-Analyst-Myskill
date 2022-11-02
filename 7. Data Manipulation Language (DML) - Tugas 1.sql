/* 1. Buatlah sebuah database dengan nama sales 
dan tabel dengan nama product_sales yang memiliki 
2 kolom yaitu dengan nama product_id dengan tipe 
data integer dan product_name dengan tipe data varchar 
*/

-- Membuat database dengan nama sales
CREATE DATABASE sales;

-- Membuat tabel dengan nama product_sales
CREATE TABLE product_sales (
	product_id int,
	product_name varchar(255)
);

-- Menampilkan tabel product_sales
SELECT * FROM product_sales;

/* 2. Isikan data pada kedua tabel tersebut,
untuk kolom product_id berisikan data: 1,2,3 
untuk kolom product_name berisikan data: Apel, Pisang, Jeruk
*/

-- Menambahkan data ke tabel product_sales
INSERT INTO product_sales (
product_id,product_name) VALUES
(1, 'Apel'),
(2, 'Pisang'),
(3, 'Jeruk');

-- Menampilkan data dari tabel product_sales
SELECT * FROM product_sales;

/* 3. Tambahkan kolom quantity dengan tipe data integer */

-- Menambahkan kolom quantity dengan tipe data integer
ALTER TABLE product_sales
ADD quantity int;

-- Menampilkan data dari tabel product_sales berdasarkan product_id
SELECT * FROM product_sales ORDER BY product_id;

-- Kolom berhasil ditambahkan dan data masih kosong.
-- Sehingga perlu dilakukan pengisian data
UPDATE product_sales
SET quantity = '100' 
WHERE product_id = 1;