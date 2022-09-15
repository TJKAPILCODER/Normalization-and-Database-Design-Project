CREATE TABLE `COFFEE_SHOP` (
`shop_id` int NOT NULL,
`shop_name` varchar(50) NOT NULL,
`city` varchar(50) NOT NULL,
`state` char(2) NOT NULL,
PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `SUPPLIER` (
`supplier_id` int NOT NULL,
`company_name` varchar(50) DEFAULT NULL,
`country` varchar(30) DEFAULT NULL,
`sales_contact_name` varchar(60) DEFAULT NULL,
`email` varchar(50) NOT NULL,
PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `EMPLOYEE` (
`employee_id` int NOT NULL,
`first_name` varchar(30) DEFAULT NULL,
`last_name` varchar(30) DEFAULT NULL,
`hire_date` datetime DEFAULT NULL,
`job_title` varchar(30) DEFAULT NULL,
`shop_id` int DEFAULT NULL,
PRIMARY KEY (`employee_id`),
KEY `shop_id_idx` (`shop_id`),
CONSTRAINT `shop_id` FOREIGN KEY (`shop_id`) REFERENCES `COFFEE_SHOP` (`shop_id`)
ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `COFFEE` (
`coffee_id` int NOT NULL,
`shop_id` int DEFAULT NULL,
`supplier_id` int DEFAULT NULL,
`coffee_name` varchar(30) DEFAULT NULL,
`price_per_pound` decimal(5,2) DEFAULT NULL,

PRIMARY KEY (`coffee_id`),
KEY `shop_id_idx` (`shop_id`),
KEY `supplier_id_idx` (`supplier_id`),
CONSTRAINT `shop_id_reference` FOREIGN KEY (`shop_id`) REFERENCES `COFFEE_SHOP`
(`shop_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `SUPPLIER`
(`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM `Jaunty Coffee Co. ERD`.COFFEE_SHOP;
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE_SHOP
VALUES(1,"KAPIL COFFEE","Seattle","WA");
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE_SHOP
VALUES(2,"TJ COFFEE","Bothell","WA");
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE_SHOP
VALUES(3,"Jackson COFFEE","Renton","WA");
SELECT * FROM `Jaunty Coffee Co. ERD`.COFFEE_SHOP;

SELECT * FROM `Jaunty Coffee Co. ERD`.COFFEE_SHOP;
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE_SHOP
VALUES(1,"KAPIL COFFEE","Seattle","WA");
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE_SHOP
VALUES(2,"TJ COFFEE","Bothell","WA");
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE_SHOP
VALUES(3,"Jackson COFFEE","Renton","WA");
SELECT * FROM `Jaunty Coffee Co. ERD`.COFFEE_SHOP;

SELECT * FROM `Jaunty Coffee Co. ERD`.EMPLOYEE;
INSERT INTO `Jaunty Coffee Co. ERD`.EMPLOYEE
VALUES('345', 'David', 'Leanord', '2017-06-15', 'Barista', '1');
INSERT INTO `Jaunty Coffee Co. ERD`.EMPLOYEE
VALUES('346', 'William', 'Cork', '2017-06-15', 'Manager', '2');
INSERT INTO `Jaunty Coffee Co. ERD`.EMPLOYEE
VALUES('347', 'Micheal', 'Fox', '2017-06-15', 'Janitor', '3');
SELECT * FROM `Jaunty Coffee Co. ERD`.EMPLOYEE;

SELECT * FROM `Jaunty Coffee Co. ERD`.COFFEE;
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE
VALUES('55', '1', '101', 'CAFFÈ LATTE', '1.50');
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE
VALUES('56', '2', '102', 'CAFFÈ MOCHA', '1.60');
INSERT INTO `Jaunty Coffee Co. ERD`.COFFEE
VALUES('57', '3', '103', 'CAFÈ AU LAIT', '2.10');
SELECT * FROM `Jaunty Coffee Co. ERD`.COFFEE;

CREATE VIEW EMPLOYEE_FULLNAME_VIEW
AS SELECT CONCAT(first_name,"", last_name) as 'employee_full_name',
employee_id, hire_date,

CREATE INDEX coffee_name_index
ON `Jaunty Coffee Co. ERD`.COFFEE(coffee_name);

SELECT job_title, employee_id
FROM `Jaunty Coffee Co. ERD`.EMPLOYEE
WHERE hire_date = '2017-06-15';

SELECT coffee_id, COFFEE.shop_id, supplier_id, coffee_name, price_per_pound,
employee_id, first_name, last_name, hire_date,shop_name, city, state,
job_title
FROM COFFEE INNER JOIN EMPLOYEE ON COFFEE.shop_id = EMPLOYEE.shop_id
INNER JOIN COFFEE_SHOP
ON COFFEE.shop_id = COFFEE_SHOP.shop_id;
