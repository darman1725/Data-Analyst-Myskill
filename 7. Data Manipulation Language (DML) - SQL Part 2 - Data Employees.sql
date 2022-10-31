-- Import data employees

/* UPDATE */

-- Menampilkan tabel employees
SELECT * FROM employees;

-- Menampilkan data dengan id=1
SELECT * FROM employees
WHERE employee_id = 1;

-- Melakukan update data (SINGLE UPDATE)
UPDATE employees
SET salary_2020 = 9000 
WHERE employee_id = 1;

-- Melakukan update data (MULTI UPDATE)
UPDATE employees
SET salary_2020 = CASE WHEN employee_id = 2 THEN 3000
                       WHEN employee_id = 3 THEN 2000
				END
WHERE employee_id IN (2,3);

-- Menampilkan data hasil update dengan id=2
SELECT * FROM employees
WHERE employee_id = 2;

/* SELECT */

-- Menampilkan dengan variabel (TANPA ASTERISK)
SELECT first_name, salary_2020 FROM employees;

-- Menampilkan dengan variabel (ASTERISK)
SELECT * FROM employees;