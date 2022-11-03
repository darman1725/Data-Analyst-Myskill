-- ## TUGAS ## --

-- Menampilkan data employees
SELECT * FROM employees;

-- 1. Dengan menggunakan data employees, lakukan query yang 
-- mengembalikan/menampilkan record rata-rata gaji karyawan  
-- per tahun, bulatkan 2 angka dibelakang koma
SELECT CONCAT(first_name,(' '||last_name)) as nama_lengkap,
department as departemen,
ROUND(AVG(salary_2020+salary_2021+salary_2022),2) as rata_rata_gaji_karyawan
FROM employees
GROUP BY nama_lengkap,department 
ORDER BY nama_lengkap;

-- 2. Dengan menggunakan data employees, lakukan query yang 
-- mengembalikan/menampilkan record data karyawan yang hire 
-- date nya ditahun 2018 & 2020 saja
SELECT * FROM employees
WHERE hire_date BETWEEN '2018-01-01' AND '2018-12-31'
OR hire_date BETWEEN '2020-01-01' AND '2020-12-31'
ORDER BY employee_id;