

# 📘 PostgreSQL 🔥


### 1️⃣ What is `PostgreSQL`? (`PostgreSQL` কি?)
`PostgreSQL` হল একটি শক্তিশালী, ওপেন সোর্স অবজেক্ট-রিলেশনাল ডাটাবেস সিস্টেম, যেখানে অনেক ধরনের ডেটা জমা রাখা যায়। এটি বড় বড় সফটওয়্যার বা ওয়েবসাইটের ডেটা সংরক্ষণ করতে ও সেখান থেকে প্রয়োজন মতো ডেটা নিতে সাহায্য করে।



### 2️⃣ What is the purpose of a database schema in PostgreSQL? (PostgreSQL-এ ডাটাবেজ স্কিমা কেন দরকার?)
স্কিমা হলো ডাটাবেজের নিয়ম বা নকশা। এটি বলে দেয় কোন টেবিলে কী ধরনের ডেটা থাকবে এবং কীভাবে সেগুলো সংরক্ষণ করতে হবে।



### 3️⃣ Explain the `Primary Key` and `Foreign Key` concepts in PostgreSQL. (PostgreSQL এ `Primary Key` ও `Foreign Key` ধারণা ব্যাখ্যা কর।)
- **Primary Key:** এটি একটি টেবিলের স্পেশাল কলাম যা প্রতিটি এন্ট্রি বা রো-কে আলাদা রাখে। এক টেবিলের দুটি রো-তে একই Primary Key থাকতে পারে না।
- **Foreign Key:** এটি অন্য টেবিলের Primary Key-এর সাথে সম্পর্ক তৈরি করে। এক টেবিলের ডেটা অন্য টেবিলের সাথে মেলাতে এটি সাহায্য করে।



### 4️⃣ What is the difference between the `VARCHAR` and `CHAR` data types? (`VARCHAR` এবং `CHAR` ডেটা টাইপের মধ্যে পার্থক্য কী?)
- **`VARCHAR(n)`** → এখানে লেখার দৈর্ঘ্য বদলাতে পারে, মানে ছোট বড় লেখা রাখা যায়।
- **`CHAR(n)`** → এটি সব এন্ট্রিতেই নির্দিষ্ট দৈর্ঘ্যের লেখা রাখে, মানে যদি n এর চেয়ে কম দৈর্ঘ্যের লেখা ভ্যালু হিসেবে আসে, তাহলে এটি বাকি জায়গা স্পেস দিয়ে পূর্ণ করে দেয়।



### 5️⃣ Explain the purpose of the `WHERE` clause in a SELECT statement. (SELECT স্টেটমেন্টে `WHERE` ক্লজ এর কাজ ব্যাখ্যা কর।)
PostgreSQL এ `WHERE` ক্লজ শর্ত ব্যবহার করতে সাহায্য করে। অর্থাৎ এটি দিয়ে আমরা ঠিক কোন ডেটাগুলো দেখতে চাই তা বলে দিতে পারি। উদাহরণ:

```sql
SELECT * FROM books WHERE price > 30;
```

এখানে আমরা শুধু সেই বইগুলোর তালিকা পাবো যেগুলোর দাম ৩০ টাকার বেশি।



### 6️⃣ What are the `LIMIT` and `OFFSET` clauses used for? (`LIMIT` ও `OFFSET` ক্লজ কী কাজে ব্যবহার হয়?)
- **`LIMIT`** → এটি প্রতিবার কতগুলো ডেটা দেখাতে হবে তা ঠিক করে।
- **`OFFSET`** → কতগুলো ডেটা বাদ দিয়ে তারপর ডেটা দেখানো শুরু হবে এটি তা ঠিক করে।

```sql
SELECT * FROM books LIMIT 5 OFFSET 10;
```

এটি ১১ নম্বর থেকে শুরু করে ৫টি বই দেখাবে।



### 7️⃣ How can you modify data using `UPDATE` statements? (`UPDATE` স্টেটমেন্ট ব্যবহার করে তুমি কীভাবে ডেটা পরিবর্তন করবে?)
`UPDATE` কমান্ড দিয়ে আমরা আগের কোনো ডেটা পরিবর্তন করতে হলে সেই ডেটাকে WHERE দিয়ে খুজে বের করতে হবে ও নতুন ডেটা সেট করতে SET ব্যাবহার করতে হবে। উদাহরণ:

```sql
UPDATE books SET price = 40 WHERE id = 1;
```

এটি প্রথম বইয়ের দাম ৪০ টাকা করে দেবে।



### 8️⃣ What is the significance of the `JOIN` operation, and how does it work in PostgreSQL? (PostgreSQL `JOIN` অপারেশনের কাজ কি ও কীভাবে এটি ব্যাবহার হয়?)
দুটা আলাদা টেবিলের ডেটা একসাথে দেখতে, `JOIN` দরকার হয়। উদাহরণ:
- **`INNER JOIN`** → শুধু কমন আছে এমন ডেটা দেখাবে।
- **`LEFT JOIN`** → প্রথম টেবিলের সব এবং দ্বিতীয় টেবিলের মিল থাকলে সেই ডেটাগুলোও দেখাবে, মিল না থাকলে সেই ফিল্ডগুলোতে **`NULL`** দেখাবে।
- **`RIGHT JOIN`** → দ্বিতীয় টেবিলের সব এবং প্রথম টেবিলের মিল থাকলে ডেটাগুলোও দেখাবে, মিল না থাকলে সেই ফিল্ডগুলোতে **`NULL`** দেখাবে।
- **`FULL JOIN`** →  দুই টেবিলের সব ডেটা দেখাবে। তবে যেখানে ডেটা মিল পাবেনা, সেখানে **`NULL`** দেখাবে।



### 9️⃣ Explain the `GROUP BY` clause and its role in aggregation operations. (`GROUP BY` ক্লজ এবং এর এগ্রিগেশন অপারেশনে এর কাজ ব্যাখ্যা কর।)
এটি একই ধরনের ডেটা একসাথে গ্রুপ করে এবং গণনা করতে সাহায্য করে।

```sql
SELECT customer_id, COUNT(*) FROM orders GROUP BY customer_id;
```

এখানে কোন কাস্টমার মোট কতটি অর্ডার করেছে তা দেখাতে পুরো টেবিল থেকে সব রো-গুলোকে customer_id দিয়ে গ্রুপ করে প্রতি গ্রুপের রো কাউন্ট ও customer_id দেখানো হয়েছে।



### 🔟 How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in PostgreSQL? (`COUNT()`, `SUM()`, `AVG()` এই এগ্রিগেট ফাংশনগুলো কীভাবে হিসেব করে?)
- **`COUNT()`** → মোট কতগুলো ডেটা আছে তা গণনা করে দেয়।
```sql
SELECT COUNT(*) FROM orders;
```
এটি মোট কতটি অর্ডার হয়েছে তা গণনা করে দিবে।

---

- **`SUM()`** → কোনো সংখ্যার মোট যোগফল বের করে দেয়।
```sql
Select sum(books.price * orders.quantity) as total_revenue
       from orders
              join books on orders.book_id = books.id;
```
এটি মোট অর্ডারের রেভিনিউ হিসেব করে দিবে।

---

- **`AVG()`** → প্রদত্ত সংখ্যাগুলোর গড় বের করে দেয়।
```sql
Select round(avg(price), 2) as avg_book_price from books;
```
এটি বইগুলোর গড় দাম হিসেব করে দিবে।
