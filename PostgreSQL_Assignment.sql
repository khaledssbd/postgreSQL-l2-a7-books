-- creating Database
CREATE DATABASE bookstore_db;


-- creating books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0) NOT NULL,
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
    email VARCHAR(100) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);


-- inserting sample data into customers table
INSERT INTO customers (name, email, joined_date) VALUES
('David', 'david@email.com', '2024-02-15'),
('Sophia', 'sophia@email.com', '2023-11-25'),
('Liam', 'liam@email.com', '2024-01-30'),
('Emma', 'emma@email.com', '2023-12-05'),
('Khaled', 'kha@email.com', '2023-12-05'),
('Noah', 'noah@email.com', '2024-02-20');



-- creating orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- inserting sample data into orders table
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 3, 2, '2024-03-15'),
(2, 1, 1, '2024-03-18'),
(3, 5, 1, '2024-03-20'),
(4, 2, 3, '2024-03-22'),
(6, 4, 1, '2024-03-25'),
(3, 5, 1, '2024-04-20');




-- all queries:-

-- 1. Find books that are out of stock
Select title from books where stock = 0;

-- 2. Retrieve the most expensive book
Select * from books order by price desc limit 1;

-- 3. Find the total number of orders placed by each customer
Select name, count(*) as total_orders
       from customers
              left join orders on customers.id = orders.customer_id
                     group by name; -- (in 'group by' customers.name and only name works samely)

-- 4. Calculate total revenue generated from book sales
Select sum(books.price * orders.quantity) as total_revenue
       from orders
              join books on orders.book_id = books.id;

-- 5. List customers who have placed more than one order
Select name, count(orders.id) as orders_count
       from customers
              join orders on customers.id = orders.customer_id
                     group by name -- in group by customers.name===name
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



-- SELECT * from books;

-- SELECT * FROM customers;

-- SELECT * FROM orders;