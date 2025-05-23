-- Active: 1743617397081@@127.0.0.1@5432@bookstore_db@public
-- creating Database
CREATE DATABASE bookstore_db;


-- creating books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price DECIMAL(4,2) CHECK (price >= 0) NOT NULL,
    stock INT NOT NULL,
    published_year INT NOT NULL
);


-- inserting sample data into books table
INSERT INTO books (title, author, price, stock, published_year) VALUES
('AI Superpowers', 'Kai-Fu Lee', 45.50, 12, 2018),
('The Lean Startup', 'Eric Ries', 38.99, 7, 2011),
('JavaScript: The Good Parts', 'Douglas Crockford', 32.49, 10, 2020),
('Deep Learning with Python', 'Francois Chollet', 55.99, 5, 2021),
('Lets learn postgreSQL', 'Khaled Siddique', 35.99, 5, 1997),
('System Design Interview', 'Alex Xu', 42.50, 0, 2022);



-- creating customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);


-- inserting sample data into customers table
INSERT INTO customers (name, email) VALUES
('David', 'david@email.com'),
('Sophia', 'sophia@email.com'),
('Liam', 'liam@email.com'),
('Emma', 'emma@email.com'),
('Khaled', 'kha@email.com'),
('Noah', 'noah@email.com');



-- creating orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- inserting sample data into orders table
INSERT INTO orders (customer_id, book_id, quantity) VALUES
(1, 3, 2),
(2, 1, 1),
(3, 5, 1),
(4, 2, 3),
(6, 4, 1),
(3, 5, 1);




-- all queries:-

-- 1. Find books that are out of stock
Select title from books where stock = 0;

-- 2. Retrieve the most expensive book
Select * from books order by price desc limit 1;

-- 3. Find the total number of orders placed by each customer
Select customers.name, count(*) as total_orders
       from customers
              right join orders on customers.id = orders.customer_id
                     group by customers.name; -- (in 'group by' customers.name and only name works samely if this field is not available in the both tables)

-- 4. Calculate total revenue generated from book sales
Select sum(books.price * orders.quantity) as total_revenue
       from orders
              join books on orders.book_id = books.id;

-- 5. List customers who have placed more than one order
Select customers.name, count(orders.id) as orders_count
       from customers
              join orders on customers.id = orders.customer_id
                     group by customers.name -- (in 'group by' customers.name and only name works samely if this field is not available in the both tables)
                            having count(orders.id) > 1; -- count(orders.id) and count(*) works same

-- 6. Find the average price of books
Select round(avg(price), 2) as avg_book_price from books;


-- 7. Increase the price of books published before 2000 by 10%
Update books set price = price + price * 1.10 where published_year < 2000;

-- 8. Delete customers who haven't placed any orders
Delete from customers where id not in (Select distinct customer_id from orders); -- DISTINCT: Returns unique values in the result set.






-- DROP TABLE books;
-- DROP TABLE customers;
-- DROP TABLE orders;



SELECT * from books;

SELECT * FROM customers;

SELECT * FROM orders;