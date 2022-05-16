-- Name: Zohaib Zafar
-- ID: 19070006065

/*
The following database has been created as mock or sample database for a banking system, It contains 8 different entities namely 
1. Bank
2. Branch
3. Customer
4. Account
5. Credit Card
6. Loan
7. Insurance
6. Mortgage

The database can store all the nessacary data that a bank needs for all it's common funtionalities  
*/



create database BankDatabase;

use BankDatabase;


/*
The table below stores the banks name and it's code
The code is kept as a primamry key, so it can be distinct from every other bank, Auto_increment is implemented so that the ids are updated themselves 
*/

drop table if exists bank;
CREATE TABLE bank (
    bank_Code INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bank_Name VARCHAR(45)
);


/*
   The Table below stores a certains bank's branches, The branch name, and address is stored. 
   Branch_id is kept as a primary key and bank_code is used as the foreign key to define the relationship
   All the elements are kept as not null meaning they cannot be empty
*/

drop table if exists branch;
CREATE TABLE branch (
    branch_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    bank_Code INT NOT NULL,
    branch_name VARCHAR(45) NOT NULL UNIQUE,
    branch_address VARCHAR(45) NOT NULL,
    FOREIGN KEY (bank_code)
        REFERENCES bank (bank_code)
);

/*
   The following table stores the customers details, It stores their Name, Socical Security Number, Phone number and Address.
   All entities are not null which means they cannot be empty. Customer Id is the primary key in the table and is auto incremented
*/

drop table if exists customer;
CREATE TABLE customer (
    Customer_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Customer_name VARCHAR(45) NOT NULL UNIQUE,
    SSN CHAR(9) NOT NULL UNIQUE,
    phone_number CHAR(10) NOT NULL,
    Customer_address VARCHAR(45) NOT NULL
);



/*
   The following table stores the Account details, It stores the Account Number, Account type, the customer it's linked to and the branch it's in.
   All entities are not null which means they cannot be empty. Account is the primary key in the table and is auto incremented. The customer id and branch id are
   foreign keys, and they define the relationship between the entities
*/


drop table if exists account;
CREATE TABLE account (
    Customer_id INT NOT NULL,
    Account_number INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Account_type VARCHAR(45) NOT NULL,
    balance DECIMAL(15 , 2 ) NOT NULL,
    branch_id INT NOT NULL,
    FOREIGN KEY (Customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (branch_id)
        REFERENCES branch (branch_id)
);


/*
   The following table stores the loan details, It stores  loan type, amount, bank's code it's from and Customer's id it's lended to.
   All entities are not null which means they cannot be empty. Loan Id is the primary key in the table and is auto incremented. Bank Code and 
   customer id are foreign keys to define the relationship
*/

drop table if exists loan;
CREATE TABLE loan (
    Customer_id INT NOT NULL,
    bank_code INT NOT NULL,
    loan_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    loan_type VARCHAR(45) NOT NULL,
    amount DECIMAL(15 , 2 ) NOT NULL,
    FOREIGN KEY (Customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (bank_code)
        REFERENCES bank (bank_code)
);


/*
   The following table stores the Credit Card details, It stores  Credit Card Number, type, Limit, Balance , bank's code it's from and Customer's id it's issued to.
   All entities are not null which means they cannot be empty. Credit Card Number is the primary key in the table and is auto incremented. Bank Code and 
   customer id are foreign keys to define the relationship
*/


drop table if exists Credit_Card;
CREATE TABLE Credit_Card (
    Customer_id INT NOT NULL,
    bank_code INT NOT NULL,
    Credit_Card_number CHAR(16) PRIMARY KEY NOT NULL UNIQUE,
    Credit_Card_type VARCHAR(45) NOT NULL,
    Credit_Card_Limit INT NOT NULL,
    Credit_Card_Balance DECIMAL(15 , 2 ) NOT NULL,
    FOREIGN KEY (Customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (bank_code)
        REFERENCES bank (bank_code)
);



/*
   The following table stores the Insurance details, It stores  Insurance type, amount, Monthly Payment, bank's code it's from and Customer's id it's issued to.
   All entities are not null which means they cannot be empty. Insurance Id is the primary key in the table and is auto incremented. Bank Code and 
   customer id are foreign keys to define the relationship
*/

drop table if exists insurance;
CREATE TABLE insurance (
    Customer_id INT NOT NULL,
    Bank_code INT NOT NULL,
    Insurance_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Insurance_type VARCHAR(45) NOT NULL,
    amount DECIMAL(15 , 2 ) NOT NULL,
    monthly_payment DECIMAL(15 , 2 ) NOT NULL,
    FOREIGN KEY (Customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (bank_code)
        REFERENCES bank (bank_code)
);


/*
   The following table stores the Mortgage details, It stores  Mortgage type, rate, amount, bank's code it's from and Customer's id it's lended to.
   All entities are not null which means they cannot be empty. Mortgage Id is the primary key in the table and is auto incremented. Bank Code and 
   customer id are foreign keys to define the relationship
*/


drop table if exists mortgage;
CREATE TABLE mortgage (
    Customer_id INT NOT NULL,
    bank_code INT NOT NULL,
    Mortgage_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    mortgage_type VARCHAR(45) NOT NULL,
    mortgage_rate DECIMAL(15 , 2 ) NOT NULL,
    mortgage_amount DECIMAL(15 , 2 ) NOT NULL,
    mortgage_monthly_payment DECIMAL(15 , 2 ) NOT NULL,
    FOREIGN KEY (Customer_id)
        REFERENCES customer (customer_id),
    FOREIGN KEY (bank_code)
        REFERENCES bank (bank_code)
);



insert into BANK( bank_name)
values
('ROYAL BANK OF CANADA'),
('Turkiye IS Bank'),
('CAPAITAL ONE BANK');

SELECT 
    *
FROM
    BANK;


INSERT INTO BRANCH(bank_code, branch_name, branch_address)
values
(1, 'Mississauga Branch', '2442 Credit Valley rd'),
(1,'Toronto Branch', '1442 Edison Rd'),
(2, 'Konak Branch', '21 st Konak'),
(2, 'Bornova Branch', '42nd st Kizilay'),
(3, 'New York Branch', '231 Mojo st'),
(3, 'Kirksville Branch', '1009 s mulanix st' );

SELECT 
    *
FROM
    branch;


insert into customer(customer_name, SSN, phone_number, customer_address)
values
('Zohaib Zafar', 639716227, 6602344552, '215 West Campus'),
('Mehru Nisa', 639714423, 6602322115, '1002 South Campus'),
('Nouman Aslam', 432925330, 4430244662, '2332 Mulanix St'),
('Faizan Yasin',683205338,5593626385,'293 B Nishat'),
('Mert Yucesoy', 938533632,5543866305, '332 st Karsiyaka');

SELECT 
    *
FROM
    customer;



insert into account(customer_id, account_type, balance, branch_id)
values
(1, 'Checking', 43500, 4),
(1, 'Savings', 50000, 3),
(2,'Checkings', 3029, 2),
(2, 'Savings', 4002, 1),
(3, 'Checkings', 4833,5),
(3, 'Savings', 3923, 6),
(4, 'Checkings', 29492, 2),
(4, 'Savings', 4032, 5),
(5, 'Checkings', 39202,4);

SELECT 
    *
FROM
    account;




insert into loan(bank_code,customer_id, loan_type, amount)
values
(1,3,'Student Loan',100000),
(3,5, 'Personal Loan', 40000),
(2,2, 'Auto Loan', 35000),
(1,1, 'Small Business Loan',500000),
(3,2, 'Credit Card Loan', 10000),
(2,5,'Auto Loan', 67000);

SELECT 
    *
FROM
    loan;


insert into credit_card(bank_code,customer_id, credit_card_number, credit_card_type, credit_card_limit, credit_card_balance)
values
(1,2, 4543147200565432, 'Travel Credit Card', 3000, 242.22),
(2,1, 5120675399583945, 'Student Credit Card', 2000, 500.34),
(3,2, 6104684366930212, 'Rewards Credit Card', 5000, 3281.53),
(3,5, 3258593280548291, 'Cash Back Credit Card', 7000, 2121.65),
(2,4, 4392054929540532, 'Travel Credit Card', 10000, 4055.34);

SELECT 
    *
FROM
    credit_card;
    
    
insert into insurance(bank_code,customer_id, insurance_type, amount, monthly_payment)
values
(1, 2, 'Health Insurance', 100000, 450),
(2,5, 'Health Insurance', 200000, 500),
(3,4,  'Life Insurance', 1000000, 1000),
(2,3, 'Family Insurance', 200000,453);

select * from insurance;

insert into mortgage(bank_code, Customer_id, mortgage_type, mortgage_rate, mortgage_amount, mortgage_monthly_payment)
values
(1,1, 'Fixed-Rate Mortgage', 0.02, 500000, 4000),
(2,3, 'Fixed-Rate Mortgage', 0.04, 800000, 5000),
(2,5, 'Conventional Mortgage', 0.03, 300000,2330),
(2,2,'FHA Loan', 0.01, 300000, 4053);


select * from mortgage;




-- Write 5 queries with explanations 
-- Write 5 queries. Your queries should do a task that is meaningful in your selected context (project topic). 
-- At least one that joins two or more tables
-- At least one that include group functions
-- At least one with one or more sub-query(es)
-- At least one update
-- At least one delete
-- At least one include arithmetic functions
-- At least one uses alias



-- Joins two tables and uses Alias --
-- Returns the complete details of the account --

select customer_name as Customer, account_number as AccountNumber, balance
from customer
join account
on account.Customer_id = customer.Customer_id;


 -- Includes Group by and Arthimetic Function and Alias--
 -- Returns total number of accounts and the total balance the cusctomer 

select distinct customer_name, count(account_number) as TotalAccounts, sum(balance) as TotalBalance
from customer
join account
on account.Customer_id = customer.Customer_id
group by customer.customer_id
order by 3;

-- another example --
-- returns customer's total loan debt --

select distinct customer_name, sum(loan.amount) as TotalLoanDebt
from customer
join loan
on loan.Customer_id = customer.Customer_id
group by customer.customer_id
order by 2;


-- includes sub-query, join, where, and order by -- 
-- Returns the customer with credit card of highest credit limit --

select credit_card_number, customer_name, credit_card_limit
from credit_card
join customer
on credit_card.Customer_id = customer.Customer_id
where credit_card_limit = (select max(Credit_Card_Limit) from credit_card) 
order by 3;


-- Inlcudes Update and checks if update worked successfully -- 
-- Updates Customer Phone Number

update CUSTOMER
set phone_number = 5548081870
where customer_name = 'Mehru Nisa';
-- checks if query was successfull --
select customer_name from customer
where phone_number = 5548081870;


-- Inlcudes Delete and checks if worked successfully --
-- Delete's a customer --
delete from customer
where customer_name = 'Zohaib Zafar';
-- checks if query was successfull --
select * from customer 
where customer_name = 'Zohaib Zafar'


  