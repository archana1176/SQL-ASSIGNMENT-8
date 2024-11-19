
-- Find the number of persons in each country

select country_name, count(*) as total_persons from persons group by Country_name;

-- Find the number of persons in each country sorted from high to low
select country_name, count(*) as total_persons from persons group by Country_name order by total_persons desc;

--  Find out an average rating for Persons in respective countries if the average is greater than 3.0
select country_name, avg(rating) as Average_rating from persons group by Country_name having avg(Rating)>'3.0' order by average_rating;  

 -- Find the countries with the same rating as the USA. (Use Subqueries)

select Country_name, avg(rating) as average_rating from Persons group by Country_name having avg(rating)=(select avg(rating) from persons where Country_name ='USA');

-- Select all countries whose population is greater than the average population of all nations

select country_name,population from country where Population >(select avg(Population)from country);


-- new task
-- Create a database named Product and create a table called Customer with the following fields in the Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 
 create database Product;
 create table Customer
 (Customer_id int primary key,
 First_name varchar(50),
 Last_name varchar(50),
 Email varchar(150),
 Phone_no varchar(15), 
 Address varchar(255),
 City varchar(50),
 State varchar(50),
 Zip_code varchar(10), 
 Country varchar(50));
 
 insert into Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
values
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '1234567890', '123 Elm St', 'Springfield', 'California', '62701', 'USA'),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '0987654321', '456 Oak St', 'Springfield', 'Alaska', '62702', 'USA'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '1122334455', '789 Pine St', 'Springfield', 'California', '62703', 'USA'),
(4, 'David', 'Wilson', 'david.wilson@example.com', '2233445566', '321 Birch St', 'Springfield', 'Florida', '62704', 'USA'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '3344556677', '654 Cedar St', 'Springfield', 'Colorado', '62705', 'USA'),
(6, 'Frank', 'Miller', 'frank.miller@example.com', '4455667788', '987 Maple St', 'Springfield', 'California', '62706', 'USA'),
(7, 'Grace', 'Lee', 'grace.lee@example.com', '5566778899', '135 Ash St', 'Springfield', 'Alaska', '62707', 'USA'),
(8, 'Henry', 'Walker', 'henry.walker@example.com', '6677889900', '246 Birch St', 'Springfield', 'Florida', '62708', 'USA'),
(9, 'Ivy', 'Harris', 'ivy.harris@example.com', '7788990011', '357 Oak St', 'Springfield', 'Colorado', '62709', 'USA'),
(10, 'Jack', 'Young', 'jack.young@example.com', '8899001122', '468 Pine St', 'Springfield', 'California', '62710', 'USA');

select * from Customer;

--  Create a view named customer_info for the Customer table that displays Customer’s Full name and email address

create view customer_info as
select CONCAT(First_name, ' ', Last_name) as Full_name, Email from Customer;
select * from Customer_info;

--  Create a view named US_Customers that displays customers located in the US.
create view US_Customers as select * from Customer where Country = 'USA';
select * from US_Customers;

--  Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state

create view Customer_details as select CONCAT(First_name, ' ', Last_name) as Full_name,Email,Phone_no,State from Customer;
select * from Customer_details;

--  Update phone numbers of customers who live in California for Customer_details view.

set sql_safe_updates = 0;
update Customer_details set Phone_no = '2351469875' where  State = 'California';

-- Count the number of customers in each state and show only states with more than 5 customers.
select State, COUNT(*) as number_of_customers from Customer group by state;

select State, COUNT(*) as number_of_customers from Customer group by State having COUNT(*) > 5;

--  Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
select State, COUNT(*) as number_of_customers from customer_details group by state;

-- Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order

select * from Customer_details order by State ASC;













