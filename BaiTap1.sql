-- Bai tap 1
CREATE TABLE student(
	id INT AUTO_INCREMENT PRIMARY KEY,
	Full_name VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	Gender VARCHAR(10),
	Age INT,
	City VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
	Weight DOUBLE
);