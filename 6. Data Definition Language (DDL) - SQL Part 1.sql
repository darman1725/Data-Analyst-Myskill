-- Membuat tabel
CREATE TABLE penjualan (
	id_produk int,
	product_name varchar(255),
	harga int,
	primary key(id_produk)
);

-- Primary key digunakan untuk menghindari duplikasi data dalam sebuah kolom
-- ; (titik koma) menandakan berakhirnya syntax/script

-- Menampilkan tabel penjualan
SELECT * FROM penjualan;

/* INSERT INTO */

-- Menambahkan data ke tabel penjualan (Versi - 1)
INSERT INTO penjualan (id_produk,product_name,harga) 
VALUES
(1,'Avanza',10000),
(2, 'Panther', 20000)

-- Menambahkan data ke tabel penjualan (Versi - 2)
INSERT INTO penjualan 
VALUES 
(3,'Pajero',30000),
(4,'Pajero Sport', 40000)

/* ALTER */

-- Menambahkan kolom quantity pada tabel penjualan (ALTER ADD)
ALTER TABLE penjualan
ADD quantity int

-- Menghapus kolom quantity pada tabel penjualan (ALTER DROP)
ALTER TABLE penjualan
DROP COLUMN quantity

-- Mengubah tipe data kolom harga dari int menjadi bigint (ALTER COLUM)
ALTER TABLE penjualan
ALTER COLUMN harga type bigint;

-- Memberikan nama alias kepada setiap kolom di tabel penjualan
SELECT id_produk AS produk_id,
product_name AS name_produk
FROM penjualan

/* DROP */

-- Menghapus tabel penjualan
DROP TABLE penjualan;

-- Menghapus database bootcamp_da
DROP DATABASE bootcamp_da;
